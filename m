Received: from e234-59.smtp-out.ap-northeast-1.amazonses.com (e234-59.smtp-out.ap-northeast-1.amazonses.com [23.251.234.59])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5304477FF;
	Wed, 30 Sep 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751569; cv=none; b=ksiUODh1+Nobkith+uC/Q3290ogSIC9nWzrJlhppWFEwh+Xit3q0krLwRdlc6XNs2ShPOV8f4cxRgvsYL3LopkZKfqVJ4j0RKBp3Cj6N8k2fdbLFPk9KKIFKSHVY5yoeKA+I1IMaXYJ4wX4QroNuxaHmT5+7WD94RY0MDrSJP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751569; c=relaxed/simple;
	bh=l9DEDF/kigo3T0tth8+JQaxzU9tQd6ygEQnX5lQupZ0=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=JB1IvHO4NINvMlOq9Wb+WjhdTK0zPnkMULiJRtY5B0/l3srYu7Plz1o2DdMoje/m/pcBwQOvrGwObYrV62mc4PyNDzIo4CSNWKcv89370t+CZ6WK1XsS268S5hwlHm5YLnfBJaDm5n4dnNstJqLMgwdgc5WO24VqaiGUFT7XzLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=PAqUIFQ3; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=N9kEstEK; arc=none smtp.client-ip=23.251.234.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="PAqUIFQ3";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="N9kEstEK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1790751557;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=l9DEDF/kigo3T0tth8+JQaxzU9tQd6ygEQnX5lQupZ0=;
	b=PAqUIFQ30usBAZz72sTYI51Xr6X5+vXAH71flWW4u0+x+/P0q4vn1N1y2dXTOcha
	Aejn+NNIUYyJU7xQk8yF0+zQeu9ueGvHy2/j5LP03oX2wqREBIzpLA0tHDMStINU/+8
	rQeSE+IDsLO2zU8zRKMEdGnVjasamgipmxv+duGs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1790751557;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=l9DEDF/kigo3T0tth8+JQaxzU9tQd6ygEQnX5lQupZ0=;
	b=N9kEstEK9BxbhLD40Stn0m0Hqf34zLA754VCBTJmqEOGhv/5e4yOXPp9l4JLbuqf
	w0qER2/sBXaUMWZwgN63lCHrCwKWbAh0ZvBTR88mQaziXs3JqqwQf2W/3WO8pdjF17D
	2FM2V48zKo/YGTBY7rZPYIoujNtCjfqPAl49ST4Q=
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: hverkuil@kernel.org, todor.too@gmail.com, 
	gjorgji.rosikopulos@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	loic.poulain@oss.qualcomm.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: camss: stop started subdevices when stream-on
 fails
Message-ID: <010601a0f11c4762-f4775077-f8b1-4000-bdd2-d36d7658c606-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:59:17 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.09.30-23.251.234.59

CAMSS starts subdevices from the video node towards the sensor. If a
later subdevice fails to start, video_start_streaming() stops only the
media pipeline and returns the queued buffers. Earlier subdevices remain
streaming, leaving their resources and V4L2 stream state active.
Successful stream-on sequences do not enter this error path.

On a Surface Laptop 7, an OV02C10 register-write timeout was followed by
call_s_stream() warnings when the next capture retried the already
started subdevices.

Walk the pipeline again on failure and stop each =
subdevice before the
failing entity. Keep the original start error and =
continue cleanup even
if a stop operation fails, then release the media =
pipeline and buffers.

Fixes: 0ac2586c410f ("media: camss: Add files which =
handle the video device nodes")
Signed-off-by: Jizhou Tong <fqwqf@fqwqf.=
xyz>
---
Based on Linux 7.3-rc5.

This touches the legacy pipeline walk =
also refactored by Gjorgji's
streams API series [1]. The start-failure =
cleanup is still needed in
its video_start_streaming_legacy() path.

Validation: ARM64 W=3D1 object build and ASan/UBSan tests of the actual
start function, covering 320 failure/retry combinations plus pipeline
allocation and format-check failures. The baseline leaves subdevices
enabled; the patched function cleans them up before a successful retry.
The fix has build and software-test coverage; the hardware observations
in the commit message are from the original kernel.

Test harness:
https://gist.github.com/fQwQf/60bd12627e06b10a2fc159e545f85dae/7b21a7d3a1b6=
76a0e4cdaba06168ede09a2949e3

[1] https://lore.kernel.=
org/all/20260911062213.195007-8-gjorgji.rosikopulos@oss.qualcomm.com/

 .../media/platform/qcom/camss/camss-video.c   | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git =
a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/=
qcom/camss/camss-video.c
index 0852eb6f13..44fb5d8cc3 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -253,7 +253,7 @@ static int video_start_streaming(struct vb2_queue *q, =
unsigned int count)
 {
 	struct camss_video *video =3D vb2_get_drv_priv(q);
 	struct video_device *vdev =3D &video->vdev;
-	struct media_entity =
*entity;
+	struct media_entity *entity, *started_entity;
 	struct media_pad *pad;
 	struct v4l2_subdev *subdev;
 	int ret;
@@ -283,11 +283,30 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
=20
 		ret =3D v4l2_subdev_call(subdev, video, =
s_stream, 1);
 		if (ret < 0 && ret !=3D -ENOIOCTLCMD)
-			goto error;
+			goto stop_subdevs;
 	}
=20
 	return 0;
=20
+stop_subdevs:
+	/* Stop the subdevices started before the failing entity. */
+	started_entity =3D &vdev->entity;
+	while (1) {
+		pad =3D =
&started_entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad =3D media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		started_entity =3D pad->entity;
+		if (started_entity =3D=3D entity)
+			break;
+
+		subdev =3D media_entity_to_v4l2_subdev(started_entity);
+		v4l2_subdev_call(subdev, video, s_stream, 0);
+	}
 error:
 	video_device_pipeline_stop(vdev);
=20

base-commit: =
72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
--=20
2.53.0

