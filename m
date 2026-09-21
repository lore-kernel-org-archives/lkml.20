Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7013F3B38AD;
	Mon, 21 Sep 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974943; cv=none; b=g0VkXF6JnMbwQrAeYzXQeXe4c65IkJ1Pvl8ShIaekqTCBqejJ06NIgBnPrIylA8tW8xztYMaZPL7vVcSD20gHVfqdOcsL3OAvC2z8FU2O2ploeT0lMdyOS+u2yto/cHjWmvs7rhQiWcCvFq0UlaOmZ/n1orYsxgEECy9jaSFod0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974943; c=relaxed/simple;
	bh=PtVU0SSW8Q+r9akKwdKPVsKrNP03P2tj6gjaGItYTO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZMAwdJOllTF43CNfLquQLzyqokBwMerGz9cken2W9W5C5iPf26SyZ4QoSKs0xWinKStfD9pqfjtPgagSjoi4rsxLpMjkVy4ejvK0aIM4/8FAIPZmYdOQv6mPEdwSWZ5jGhnwFMDNxW/5TIJKx2bfNT/0JD1xpFdk96yFiJrgEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7E23B2007E1;
	Mon, 21 Sep 2026 09:15:39 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 21 Sep 2026 09:15:34 +0200
Subject: [PATCH 2/3] media: synopsys: hdmirx: add input status reporting to
 VIDIOC_ENUMINPUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-hdmirx-fixes-v1-2-495be0beaf93@pengutronix.de>
References: <20260921-hdmirx-fixes-v1-0-495be0beaf93@pengutronix.de>
In-Reply-To: <20260921-hdmirx-fixes-v1-0-495be0beaf93@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789974939; l=1867;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=vzQ+7KpEp+9NsdwUJ+LjHZ50sl7sOg4nnUfFimSzS4w=;
 b=Jyz44n+uGTfRm/9XrnhGgbvSsylC0mu3kYnZh3ZQ12h0JKvHUiSh18UlwYUHlKipE9YbMjn42
 z4x8SxEccK6Ahx5kqsEdijo7fX1cU4l70hHxbQhqx3MtMQ23GNq1V01
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

Userspace currently has to learn the cable and lock state from the error
VIDIOC_QUERY_DV_TIMINGS returns, -ENOLINK or -ENOLCK. Both of those paths
log at v4l2_err level, so waiting for a cable fills the kernel log.

Report it where it belongs instead: V4L2_IN_ST_NO_POWER while the source
is not driving the connector's +5V line, V4L2_IN_ST_NO_SIGNAL while the
receiver has not locked. Both come from the helpers
hdmirx_query_dv_timings() already uses, so the two cannot disagree.
adv76xx_g_input_status() and adv7842_g_input_status() report the same two
flags the same way.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 24ec6138a1fb6..75576a9366fd0 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -1199,6 +1199,9 @@ static void hdmirx_submodule_init(struct snps_hdmirx_dev *hdmirx_dev)
 static int hdmirx_enum_input(struct file *file, void *priv,
 			     struct v4l2_input *input)
 {
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+
 	if (input->index > 0)
 		return -EINVAL;
 
@@ -1207,6 +1210,12 @@ static int hdmirx_enum_input(struct file *file, void *priv,
 	strscpy(input->name, "HDMI IN", sizeof(input->name));
 	input->capabilities = V4L2_IN_CAP_DV_TIMINGS;
 
+	input->status = 0;
+	if (port_no_link(hdmirx_dev))
+		input->status |= V4L2_IN_ST_NO_POWER;
+	if (signal_not_lock(hdmirx_dev))
+		input->status |= V4L2_IN_ST_NO_SIGNAL;
+
 	return 0;
 }
 

-- 
2.47.3

