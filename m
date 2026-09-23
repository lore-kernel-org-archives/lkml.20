Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC4332909
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179781; cv=none; b=QDNJjLZx8qTDK5nSBK00BE+HtfACsfNqALpcGKymrB4UXWRzweu7oII1tEiVuJK2NvcgKWV3YwxW95kMsTRaX86TVs+u6cUIUlNeXrLIwDRxGLrXIKvPJp0i24F1ki6UdrDgbHqfeTumyCj3XEKq+3BXcxx4sdziIp8RwAP/jj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179781; c=relaxed/simple;
	bh=b8GoUajCRwb9rZRbIIdBSuxPXV3lysEPgXkA5wCrXH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BpsyvFyRP1sJP9fZDonPcLD4M1YjjxWZDzfPEOUN/Mb6+aQDqsMjpYDvBMKm5WXSCNBA7XAb00g6TVfaXZrNgCbtM3zZYnswZ9S9yNoH4vaf5DCdJwH1xzjnGcVRIaz/0lPztySkaGql15GEugNyg94I9RfHBlqIde6xApuaMyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai; spf=pass smtp.mailfrom=getfieldwork.ai; dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b=VPsaBzyj; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b="VPsaBzyj"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4858bc96fabso992220f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getfieldwork.ai; s=google; t=1790179777; x=1790784577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P4EdqqA4ozfcfNKKYMKih9kDVdA4+iGB2GWN5KjsS+o=;
        b=VPsaBzyjbR91Wl/rtL5hVBUKZIbWoC74mtKPBtr6XtyF1+YXudMp3auwqAx8obp7Jy
         0WcTjjRVm2TDMzyT/wRi9eJ8tji6SVLEJ3osGmrQYlSwPULZPT+tnrqknjvhZdNHqxrG
         raj01jxBA9pjP5KWSUwvpmIAvx8JZVg1WvcML8CcfPKbgkYQPwrs2qrEqUQ9g7um7QC5
         COxZDfXNsBhjAK7hhjhYyC9hFkqGJpUm2StE5r8xDMFQY0Gz4Ksr/b4LCRoCFWjkRdyG
         BqZ7xAJdOQoA18LNbaSMf4mtiwwJz6ZKAgf8Kvtrym0vVERZ4zvbgAOY5JJV3QQOvPmq
         JugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179777; x=1790784577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4EdqqA4ozfcfNKKYMKih9kDVdA4+iGB2GWN5KjsS+o=;
        b=cKP3FQYPYNmF2xYyGWup8cfmKyUGnJLOQjT4yN1JFHZBc/x64qWnp4JhWL4WRXMlNF
         ZRBcwtKiiaSFQIQ+vTNrQiTfakEGk5tpHZaI+KKjqvOmR3CTSVYNmg0tXD/jQqlH+LKC
         g0Z7OGaaiykHuJx3oIiaH+knakCcMlcjA6cRFNHr6a9LwFvFSpdfY+NOca0xDWBm+KKS
         /U9Vc15BO8bu+WfdGHkn9ocTNrVmc1SDEjFgDug41t02kmf4QRJGy+M2pR97Abs9t6Kc
         Ujx4R+4cpsjB+qPqc+6eaLSOfPjOeDRYLYt0SPdHEhLRh7dM0c3ithdGmvyjb1d8Sj3/
         q9Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxht3Uzc2CGnVTkBpmjLsCzwbiH7C3ZkCeB3QNz5HgJVH6DgizmvN/XMCEjExarwFOsz2/n3a6FYTvx1BI=@vger.kernel.org
X-Gm-Message-State: AFuF++kXWzXrGVKjwvoq9/nb1KV1spMap7hpQgdwsHEkdLcwE9fB8gVa
	V0htIbWKqyrhquhUoKrbyc5ZNUhE6haXm/4RZqeoQGuY72qkyDfDnuWGoQKpRSooPYcb
X-Gm-Gg: AYBFou0xVGzgQniYKazKDAFXfUV/lX/2hj7sIeG/5pvPblWtzNPAZnqknk29rxnSkv4
	d/J+3k0iGyomhLqYbU0j4xrt///YZ5gI4IbMJBonzgRB3UoERZMgPmm0xv6ZlXBYYZrqojZ0XIN
	Civ4LhA0tiCgrsyZEmt22I+ll7pmxaGAR1IkwQ/ktH5PExZYJjQyLYMTmDPmrvjYPpQM3jD4ErO
	oaSlVqBbYLJw51GWLi/OTQ8ALy77QKZhvyJ3ArcrUOKKI1hND2lDyq8sRDBt8f6yFjHIp4TIlqb
	9kKU6VlGaYBa501wpSIW4Nkc5r3jVnRskfXmWQhmUNQMVKGNLAuze7gYFVRdMD8NcY9PxL2mPyT
	a0+qV2ZTgfXYSjxj58ObgUkAPUNIIeswlBjo2zs5pAJO5LvL+PQpwxlmr97rXJshLUBn3Dx6hY7
	9l/n2Oq8QXvofieBQ1/wk0nWIW5MepQXnkTDFoUTAOarxeOQYWPGdGzAZ/U71ySv7Lb2vaOP+jI
	RtHQhdEvmTU7hHZOwCZ+bMTHGsTbvAWWtcHXNjAeVZWeMhFsizjysWe8l4spQl3o6lpY2GaPeSg
	pwqTIhdEmfceK285dI3aWfActTfsc+5K2MGhd0Ayfh8TTqFIMJEpOXHZays=
X-Received: by 2002:a05:600c:474a:b0:49e:7c83:4733 with SMTP id 5b1f17b1804b1-49fdf25339emr44310815e9.32.1790179777452;
        Wed, 23 Sep 2026 09:09:37 -0700 (PDT)
Received: from NicksFWMBP.taile41d51.ts.net ([2a00:23c8:b064:8301:d1bc:6ea7:7a71:d69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm82865825e9.8.2026.09.23.09.09.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 09:09:36 -0700 (PDT)
From: Nick Rogers <nick@getfieldwork.ai>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Brian Daniels <briandaniels@google.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-ioctl: zero the ext control built for VIDIOC_{G,S}_CTRL
Date: Wed, 23 Sep 2026 17:09:36 +0100
Message-ID: <20260923160936.33445-1-nick@getfieldwork.ai>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a driver implements the extended control ioctls but has no control
handler, v4l_g_ctrl() and v4l_s_ctrl() pass VIDIOC_G_CTRL and
VIDIOC_S_CTRL on as a single struct v4l2_ext_control built on the stack.
Only its id and value are set, and check_ext_ctrls() clears reserved[0]
and reserved2[0]; the control's size and the rest of both structures are
left uninitialized.

A driver that forwards the controls rather than handling them through
the control framework sees that stack garbage. The virtio-media driver
under review takes a nonzero size as a payload to copy from userspace,
so VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL through it whenever
the stack is dirty. GStreamer's V4L2 encoders set their profile with
VIDIOC_S_CTRL, and cannot negotiate against such a device.

Zero-initialize both structures.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
---
Found running the virtio-media v9 series [1] in a VMM with a host-side
stateful encoder: GStreamer's v4l2h264enc fails to negotiate because
VIDIOC_S_CTRL returns -EINVAL. Tested on 6.18 with that series applied:
VIDIOC_G_CTRL and VIDIOC_S_CTRL now reach the device intact, and
v4l2-compliance 1.30.1 reports the same results with and without this
patch. Build-tested on media.git next (arm64, W=1, no new warnings).

[1] https://lore.kernel.org/all/20260917171921.2810550-1-briandaniels@google.com/

 drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae70..b7d248ab7 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2357,8 +2357,8 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
-	struct v4l2_ext_controls ctrls;
-	struct v4l2_ext_control ctrl;
+	struct v4l2_ext_controls ctrls = {};
+	struct v4l2_ext_control ctrl = {};
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_g_ctrl(vfh->ctrl_handler, p);
@@ -2388,8 +2388,8 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
-	struct v4l2_ext_controls ctrls;
-	struct v4l2_ext_control ctrl;
+	struct v4l2_ext_controls ctrls = {};
+	struct v4l2_ext_control ctrl = {};
 	int ret;
 
 	if (vfh && vfh->ctrl_handler)
-- 
2.54.0 (Apple Git-157)

