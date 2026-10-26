Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044704;
	b=lYDktPKKAweTDykRzhHHlho3pKkWyQPifhMcYNbuExW7is9JnoP+fpSPlorVQrAjKX7+
	 32O75iMCcfc7ibarTIicmNCDkMB+81Het3KMN2MswINrKhKdZPpqMnWkiy3/fTqKvChRi
	 YDTA4989zoy/SqFjEqo+by+/hjZ4Lr4juwESkemsyTmv3JQ7AoxBGSk5YEaohrOLDvqwI
	 CfJnKUGrk0IpvVKwRXvwYkP46pf5AOfRfxQlCOMeDTiSIUUWZ+Uuy7W5rQn/I9VQHkhqQ
	 B+SMLIgGBZc7fTi5ko5R3KLFtC/+F1TCvw6M0bXKmyXoTzQUnw70y37HYxjBUjOUh6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jq1xEm23y9AMhAdWd8/XMMMl+pebLnRjAzvDDrYbP5U=;
	b=z7GM3SYyoU6wIFk7cEpsQqlvArKqhGBiIv4xJi/gxzaRmjieLNNwyR7/46iSye1x91vz
	 3u2IEBKT2HgIG0wLUK3KCWUGMcr1md4rDak96uMr1o+uhiUZSXKVkpYhcLLymbaBemXNh
	 AZV5w0dHzPheHOORphKi14L2rBqYrgdXhObwSK9WfQ/zMju8pgNGrxJtwDFbHTNEg2uqG
	 h9bLDbNokfGJd+f/9Ov443L7nvWNQ+gpDGrwcKBKpY6eJMOI993f/bUN5X7ACLrexBI5T
	 902KSjV1dLLazpg+jAU0UeITZFmoizEtekNIebsd2/87xHfOK/5fTyhZwwA2UNj2pCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=FQkyFTHZ;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC1C606A31A;
	Mon, 26 Oct 2026 19:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC1C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=FQkyFTHZ
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jD4Dv0krnzlfvpW;
	Mon, 26 Oct 2026 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793044697; x=1795636698; bh=jq1xEm23y9AMhAdWd8/XMMMl+pebLnRjAzv
	DDrYbP5U=; b=FQkyFTHZiUTA6Xl/8UUCpO/xBnIhvPX2kFvFwjDWMsyGkUR7S1D
	lmqqN5TTF0fczOFArDAF66Wy02H+xQgHH7QCWGOO8NbSP8asjP7l93wLKLkhFiB2
	roGb3J4nWvbXHsNm94envrmtl46BJdawkx22hahxFOlOl1PjRqczqlmG3AbWTBF4
	0t2MDZkJMXeluVxdzCNvF8uyPub8S5hJsLf+clQjrv4SPM0OVtj1dmdjVp1d50oR
	F/TjnTPqPo1GS6Bk0cv2W2IIKmbzJR5FHRt9Nq+paRLT2+Re/+gJju/6LTs/GcoS
	mv81J0ki7vh/jqPVFJ7X818bIKMQDdAvVrg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id JMdlDNRM7y-j; Mon, 26 Oct 2026 19:58:17 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jD4Dm0vFczlfvpT;
	Mon, 26 Oct 2026 19:58:16 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Yuan Chen <chenyuan@kylinos.cn>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] drm/msm: Fix a lock leak in msm_ioctl_gem_info_set_metadata()
Date: Mon, 26 Oct 2026 12:58:08 -0700
Message-ID: <9671164f87138a0caf5c69b66129bbd6faf932f8.1793044688.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If krealloc() fails, msm_ioctl_gem_info_set_metadata() returns without
unlocking the GEM object. Fix this by jumping to a new label that
unlocks the GEM object before the buffer is freed. This bug has been
detected by the Clang thread-safety analyzer.

Fixes: 1c8c354098ea ("drm/msm: Add error handling for krealloc in metadat=
a setup")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
index 5e8f3ce26b32..7ab808322be6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -571,13 +571,14 @@ static int msm_ioctl_gem_info_set_metadata(struct d=
rm_gem_object *obj,
 		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
 	if (!new_metadata) {
 		ret =3D -ENOMEM;
-		goto out;
+		goto unlock;
 	}
=20
 	msm_obj->metadata =3D new_metadata;
 	msm_obj->metadata_size =3D metadata_size;
 	memcpy(msm_obj->metadata, buf, metadata_size);
=20
+unlock:
 	msm_gem_unlock(obj);
=20
 out:
