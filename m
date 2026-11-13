Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537699;
	b=lALw61BnlzmhQR/SCLvXO0rP2SZCAA/1L+Qv6suvKUJ9Ymy/UdUTBjsE6UUG9pgkZQHM
	 5ijV7QVOJxUeJQXn/O27+UZe8DH9dH+dVh1S9eoj61sMIkyBTmwkuS0qJQpCv3tUWOhu3
	 GoiAR9vB4g0OKyN9XQpLsLKLLvFSlEag+jjA4YOFw7GGRYN2ADTUbeQqfhlHuE1xRi3he
	 hc6RXkIRlA7vXZau7M+t99rPf8ixteuO8Uiwr3VVCjgbgNbY2QHpD1l3MTdTH+TlmHM1D
	 N3zfzb0SNfXnISHe9ml+4Fb75G0lU5etpjtx+mz2dX1iEccj8bDMBoZwYo7BTRLg6sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HXPaDe1GyDmDZyt1zBepWwW/7I0nMtcyrpGqoJCQR3A=;
	b=iI2ZINvXo0Hbwv+qiHf0N9uumTRls83y1xwvMTptQr+Vxq5tPNYejSV4jqqsOCLboKxh
	 mKsIjlgLGQluntnNGQili5E2WE50iDVUcHgrj4aRSCbnWL7SqruveYUzYOevxiCbUxItH
	 bEpP0VJXbyV3wGjluW5UyNSvX9B3BQbRGOEyZiKnfP3GPM+I6+e3EoZuQLvoLNRG7XrVC
	 /E21jQewE/0BlLF4X4wFNfYAkjoJlO1fl9dQtNBf/TyON4F7Pj3yed6jaVdfuuZxDH0Ja
	 wBAlawnJ83oXHGRGJjmqczlpNHBRowLVN/ktyO4+5grAgA07WurNX4n9vi0ReYMSU1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTgvzN7O;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B34D606A885
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B34D606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FTgvzN7O
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33c10faf6easo68471eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537698; x=1795142498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXPaDe1GyDmDZyt1zBepWwW/7I0nMtcyrpGqoJCQR3A=;
        b=FTgvzN7OSkT3vZRg+VtPKcEXeRf/ywtn/+H4mOytppQa/L54w5w5VcB/9lNqJ0+Wfq
         zZ3nty79bXjcflr+/qAawOp8qmGYeBj72os/92CXs1q36AAfOZbq5eq/1D+8kZkTBnMx
         l8dSUvtunlcXTbpjDY9UpOz02+D2JRFRTjUE7DDi6uaGIKlXeTo1iVeLLYqvKUQ5t/BB
         KTokuP4G8cqX6VNxrGSe9/z9IIeA3NXOo7BSQgMenv+uPlclYfoL0J3igB6mbTPnLSOe
         vlzmGoJZAl2udrhl11n9GxPyFlJrobRZQRLyZul5GYpqFuuWxGI++I1RaYkWFXeLjrl9
         QYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537698; x=1795142498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXPaDe1GyDmDZyt1zBepWwW/7I0nMtcyrpGqoJCQR3A=;
        b=Vwu7hZqfHvrXdIuD8iCWEPPYVxSa+9w9zwmtwdiKpJptuYacYOKaKNSLITtGv32pgI
         3+tnsnAK0rVNrFJKdPiUh0t6gL0gbXX786DJWQbPHdWUy0R3AeA+ZiWDlP5VyIdsukP5
         ZkPb8WZYsrXPSsrXzjAeh3bAupkxmTwWzeLJD0L3sWZi0uLKgsNISyKvXm0Xr402GYMz
         6FQLgkWk8542fsv2o80HL/lCRFI/A316G8Kt9jcwF8R79OmZ4XUutJZEUlOMHnwHF6YE
         6m3ReOmmZu8AAJudKiPuqCFBSHb4Smygge+eyKH2vQPV1GXKajOCbmwFLMZfDpT0MUyy
         fo+Q==
X-Forwarded-Encrypted: i=1; AL+hErG3wcvbz3watSAw4str9Knzew4Qzji8OuD45sKjViCbWI//gHtfDBT2sIoFMpZDeKj3RCUcxbuHb4LaNN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NfDDxHSHPsRg2tvYT5YoeEaPe13cqPYglodAKfraUMTKMS0D4
	6C+DQCjIc1IG5g6kDhvOOqw4f6kdP+3ywFcjL6NJiU5omujmTA/kxFWl
X-Gm-Gg: AYBFou00lg+zrAnechwnn+HD3TA6GrVGcYy9ENPoiIW6J5OnyPAM3IwuGg6eEUaL+gV
	m3KYdcs94JlTJWjTKeNt7PooUtUX2H3hWZj9FvLhyPaqaJ0fUlj4GtFvQ96i4CfS2Va2i4qkRIk
	kayvUBz8oG2xDUx+9StZrYTapZZUX/zI4g1w4O6as9hCSqptGqkju5tv4Id8EdCUE0Rg489Z4Ou
	gd3DomKTPKijKaqSryST9bfx2Q2sG9vOJw1pySBxlJIyJH2J7iQ8pRtSqhnhXRxKEKOwAR7ixxU
	Jwcnffp4jVvfLd9edYT7sE+aguL3iL8aQ4uLmw9RWt0BSW4B+WFmvJGQMiZ4pjShPy8Xm+IXzC1
	3R7TAbjE0BEdFRmU2vQhNT7aVhfJzCZBnSOOZdCVtVm6AqJGQUuf/eJQ2w1zn4bogg/HyEPCfqF
	3/8hE2s//Da9fcGFrUILoGY4vPHGXVnA7y7lj2UigthYfonqPAP4qgjEk/xbYHa/AODRbPbEEPy
	QV7vMNAa68wiEYuxyy6QsfbHdZVGltKz26677kq1UUISHLOa+Im9hLyKuiOWyN2L4c7Q8cewdhP
	Mi2TSGYq5sJQikDzQi6Sy1PSRWU23FWnNChQfq1OZ/hKc51TsVG7MstpgQa9Z9J5qU9d0ABBMSP
	tx+vub3wWm8gBQB7vROvFMn/nLpEAeGL9S5QMveLl7xfy/B7nMmtCxhUcIOMbYXHKwdpdgRcRkX
	B6RJXt6yz6Mg==
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3796057b529mr1567197eec.0.1794537698330;
        Thu, 12 Nov 2026 18:41:38 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:37 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 4/9] media: i2c: ov7251: Reset vblank when the frame interval changes
Date: Fri, 13 Nov 2026 11:40:54 +0900
Message-ID: <20261113024059.1087031-5-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

Setting a 60 or 90 fps frame interval is accepted and read back, but
the sensor keeps streaming at 30 fps.

The three modes differ only in their frame length (VTS: 1724, 860 and
572 lines), which each mode's register table writes to 0x380e/0x380f.
Since the V4L2_CID_VBLANK control was added, s_stream() applies the
controls with __v4l2_ctrl_handler_setup() after the mode table, so the
VBLANK control rewrites VTS. ov7251_set_frame_interval() switches
current_mode but never updates the VBLANK control, which keeps the 30
fps value (1244, VTS 1724) and overrides the 60 or 90 fps VTS at every
stream start.

ov7251_set_format() has the same issue in the other direction: it
updates the VBLANK range and default for the new mode, but
__v4l2_ctrl_modify_range() keeps the current value when it is still
in range, so after a 60 fps frame interval a format change would go
back to the 30 fps mode with a 60 fps VTS.

Update the VBLANK range and default in ov7251_set_frame_interval() too,
and set VBLANK to the mode's default in both places, as is already
done for exposure and gain. The VBLANK handler then also restores the
exposure range for the new frame length.

Tested on a Microsoft Surface Book 2 (IPU3 CIO2): after
v4l2-ctl --set-subdev-fps pad=0,fps=60 (90), v4l2-ctl measures 60.15
(90.45) fps instead of 30.01, with vblank 380 (92).

Fixes: 1b598f413c7a ("media: i2c: Add vblank control to ov7251 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19)
---
 drivers/media/i2c/ov7251.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 65f3fc2d5889..81520833120a 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1260,6 +1260,10 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 		if (ret < 0)
 			goto exit;
 
+		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
@@ -1413,6 +1417,7 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 	const struct ov7251_mode_info *new_mode;
+	int vblank_def;
 	int ret = 0;
 
 	/*
@@ -1441,6 +1446,19 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 		if (ret < 0)
 			goto exit;
 
+		vblank_def = new_mode->vts - new_mode->height;
+		ret = __v4l2_ctrl_modify_range(ov7251->vblank,
+					       OV7251_TIMING_MIN_VTS,
+					       OV7251_TIMING_MAX_VTS -
+					       new_mode->height,
+					       1, vblank_def);
+		if (ret < 0)
+			goto exit;
+
+		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
-- 
2.56.0

