Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851929;
	b=dA4lfMzMIS0MZje4RIhBbm7lkra4cdJYPN5kBLJnwDm4zhF2NMr5GuL6FrdzU4CSlL5U
	 uUZr4f1EL7NcRHxKlt0bKKiz6fnHc9TXMw0ZSrkP/UlKXCyqqdfaK1hHAPWbExSX6Jfqc
	 +RQc0HxjyCbPE03Y6dDOUaZ0v2Cxw//4wZTxJ+RdfdlIH/h2XHXRV2pbdOGBv9RQjMPYs
	 XcSsBS9jPqeS78wmK+MdCB0i6173d3nxXDaNUxDmnUMTQaXQru6hLGV8ObnsFABvrPmUj
	 MQq/eZKdY+xK/qcmj3Kkwgvx6stpi5x2pJFotvdMmI+CpiHyYAByoUKK2m6e/FfW8Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
	b=u/IrVsm9iu99ERvNX36zULNr1MqzMWWgNHt4Kyl/NtpaBNXW6q1BN9kt6Vp8TDyIKENO
	 AdBdboXp+CMsfnIEUqJ1KVvyic3K6unvSaXmsBhRgRj4/sh8BsgZDArXiXg/AWeXd9oy6
	 6ESKePaxknsw77QlKFUa5DsVmodBx+p++c3chmVhvRYTv1SlXmM8hZfLxOV4FNbybgFIr
	 20CnkfgrEhvj14RP6ZMbe19DDi8QIz6q04OZrbpn6R7eBJYd65/T7AcWClxb+KYZlzVtt
	 4drha6/qwSStB6CozRlHgkBdMMdMW5DoaqTro5uP0SvZhGPNuyRLQiRhLGjKCLSk9FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Nsc7m/2a";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC48606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC48606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nsc7m/2a
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-497614c95f0so1813750f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851922; x=1795456722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
        b=Nsc7m/2aYHWLD35CNEWLYIGzTRtzPuGCtwMoRKpLkd5KLK+tTZZus24QOMY/67UY+U
         9sjpDWYUOxdCczR3F18jfAkyNGnY7EUVzwITRHfLbtA7YV0+xbdwkY2VpsBWqLmJeSe0
         wi8H1qdUCk0WCZ9klAExyy1qr6G34DUW84gzB7ZLdV4E8ktjxXv9xdySH/eBXQ3yn99f
         PpPKAzpYgp16NTRAZktauePNf8HLeWryfY+cccHbz4hpMoT9q0DE8UJTuVJ971YkcQTN
         USkVKtJ9aHLARL71Gb/a3ipFtqFaH8Jo4BcEriZoNm5iBr1MdJjDU8jlfnONS3Pmp6/G
         9Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851922; x=1795456722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
        b=xQfb+aYFd0vFLHA0O+5DaJ5d6DLAOsMPj2U3S0u02tcD2vpAyWnxQy7Vmveur0SZyZ
         0j16dbHoDq7EmFziGu0Y4EKXzfTzkR8OtrKdawD1GVpeSzLc4JzZa3N+5M78LGYGlSdh
         EZKXItwBOPCOrriumMiElCLchtUwnhM2tVbozw6c73mRC0sfQGNYx6NK455DshhoNk2W
         RxcjsIh/WqskvXyNz9h2ZysXgTZwMmi7Z2eqjqvjIgIdSJLeCpJCdOIfvnwGcLMRgYRD
         ejTLN1pqkrXffhOfhdxzm2K1skkPWIKjlGt0GcEJSIZZbup777lyTN2d59O11F3fYrcN
         3WBQ==
X-Forwarded-Encrypted: i=1; AL+hErG/tBPGhujPDllcGxF2p1rMmi05hF/K3y1HQlWEyRYezd5r9kfOXi48d0wb6ZkMDqWiuRRZNCGH3ImhiSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hl2AMj8Y+erJj0pQBS4qvVv9XKagrEpgxVRUt8jDMbcGuHfkD
	jjAsAN8k7mLHPgX67rW9R0b1vW7qO4JezhEAxRovND0I+av0MsEnaQAd
X-Gm-Gg: AZFdTZe3wDpqg9F0tFLuL0FnwQUtto/POQHPl+chUGNwHaWDm0Fvj5DJuVDVqKu6J98
	OgDHbGFRO9YYhqL2SjQpaMg20AAei+q6hGXExQoDGwjyqsi04L8xGGqRvRsvxW4R/Ni/7hRkLx7
	UKPQfmh6k0IlJAOLDsZ0jGWSOy8C0LrLfkWqWaijzjlN2NAXqi3aSQJHe4gmAg/4qHU++rv91Xr
	orafYq53jSZtFHdGOULxBrQ9XGho6S69DfjqHxF/nV4YHGmjp+C9vqDL6YMkJVg6525JQF4x4lL
	59JXEoYiaq7zy2PEkBdMhO6dTNI0KOwL1R7FFwqANm45ldrh8AGM2h4/8KyqOrtnHWvUmXrjOy+
	IwKtDvDb6sKxiV2Udki6c24IgKW46aju49hASHHo4SZNHOn0RvPoK+p2BNxPgKxF/Z4zka9TTLs
	3GlnE4Xq2iOFCcm74BIAYueTeqvG4eVyhTICuyUZBQij7Ei606/bYpxFSa/aJwSVEqCtRh6/dIC
	carH8+8KP0f7fI694tJ+RQd8jSKkRpUhVnhrTpzCgxgNejffdSNwTPQG0SKuJM+Ih4Ne32cyG+r
	EtMmvE+ONMlyXP8M4UR9sZ2vWZllLeHyEl3ObNpglhW3xw==
X-Received: by 2002:a05:6000:1862:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-49c7439bd78mr26344360f8f.44.1794851922165;
        Mon, 16 Nov 2026 09:58:42 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:41 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the preview pipe can't output
Date: Mon, 16 Nov 2026 17:57:49 +0000
Message-ID: <20261116175750.21905-2-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175750.21905-1-volodymyrchapman@gmail.com>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preview mode atomisp_try_fmt() limits the size to 1920x1440, since the
preview pipeline cannot output anything larger. For sensors without crop
support atomisp_enum_framesizes() however passes on all sensor sizes,
minus the padding, so VIDIOC_ENUM_FRAMESIZES lists sizes for which
VIDIOC_S_FMT returns a different, smaller size.

Userspace which picks the largest enumerated size and then checks that
S_FMT gave it that size fails. For example PipeWire's V4L2 source cannot
negotiate a format with Firefox for the IMX175 rear sensor of a Lenovo
ThinkPad 10, which lists 3264x2448 and 1624x1216: Firefox picks
3264x2448, S_FMT returns 1624x1216 and the stream fails with "error set
output format: -22 (Invalid argument)".

Skip the sizes which do not fit the preview pipeline when in preview mode,
so that only sizes which S_FMT can set are enumerated.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with this file built out
of tree against a 7.2.15 kernel: ENUM_FRAMESIZES for the IMX175 now lists
only 1624x1216, and Firefox 160 streams from both the IMX175 and the
OV2722 front sensor through PipeWire. This was build-tested on top of
media.git next.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Fixes: d86c33af672d ("media: atomisp: Clamp width to max 1920 pixels when in ATOMISP_RUN_MODE_PREVIEW")
Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10..046a95857 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -532,11 +532,11 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	struct v4l2_subdev_frame_size_enum fse = {
-		.index = fsize->index,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
 	struct v4l2_subdev_state *act_sd_state;
+	unsigned int valid_sizes = 0;
 	int ret;
 
 	if (!input->sensor)
@@ -546,8 +546,24 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
 	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
-	ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
-			       act_sd_state, &fse);
+	for (fse.index = 0; ; fse.index++) {
+		ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
+				       act_sd_state, &fse);
+		if (ret)
+			break;
+
+		/*
+		 * Skip sizes the preview pipeline cannot output, for which
+		 * atomisp_try_fmt() would return a smaller size.
+		 */
+		if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW &&
+		    (fse.max_width - pad_w > 1920 ||
+		     fse.max_height - pad_h > 1440))
+			continue;
+
+		if (valid_sizes++ == fsize->index)
+			break;
+	}
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
 	if (ret)
-- 
2.43.0

