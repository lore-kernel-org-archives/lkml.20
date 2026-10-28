Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186531;
	b=AvBymtBPQxIS9rbFTWObcDBLicU7W/ZZfi+az17Fve2Xf+CXagB0yHKSdW4bz+qFx8Pm
	 e1Rh9Eod4H5qsjVbOjnpxuB/fncJV2i6DXEjZhE/ixdBDlHFsi4612Jfc0Ew3tSSM/Qaf
	 Kla92PKRSw4KCN0f5LOPz9t0JFcIjJ/TunchSmbWeYA1kJWWpgjL4IQCLf0aDvxaMkZ7S
	 IFrsUZJeezi25DtHBviqA1BR+O+awv6wXXvs15gwfJnJGWObVOz9HLczOh4R1foelCJr+
	 8zulB8ITnqvdS4NGHH3pZ2CyPdGFfjDVHSfZSpuEPdbEjSzR83raBPcuq9awJ77Qhtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hq1+ntt/iEffpsZs3NUeDNL9muD9vYu5VwqXCAfAeHc=;
	b=xhEdfGyBc4RyDjFChJcbMUZHBPhn6iN7yJxmw3ucWiwNLSbIYtISONve6QGqfTm0/Dlv
	 pnoQg/3Xyx8o56ucfkt4tZgdnrz/VQ/TLJHWx8P8TGZpDGsqKsvd8MhaDSuuQOOwmfSgy
	 lKt8VTFeZoalkBt98qtv9UKJHKp0hcKLPLDqkXHjQ83J004KdrxrWTg4Z+KXkB1buMv/v
	 wN0ZjEWoi6sbubQGc/qIkfvr+bXw+XCfM9rcChdrdhuT1YdPJBWTjWolsG/hUTUxAKh2m
	 HHoMD4EpoDo+joXF2JXWBEg96YYR/tfI3jHQksQTGtN+BkVDXFAZTnPE6S1GWwBASMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zE5Ypgth;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99C760A2625
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99C760A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zE5Ypgth
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2eac75d4143so1161075ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186530; x=1793791330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hq1+ntt/iEffpsZs3NUeDNL9muD9vYu5VwqXCAfAeHc=;
        b=zE5YpgthR8gElRrgY2abQjB2zWIbHsL/HjqGIOo31Mdp5ge+giwVNAk1x5aozJDksT
         dbubHSzaBc5xalFGw2IiCHUpi1i3qS+ZxojiE7q1pKi5Zqatk5Je9c57jc6NO4MImSnZ
         Q4+HF8GBsJiH7OlU+scpTEc0DIhvHPAzS0je5QYDciSltO/j2la+ZJMH8RxMFC+WHASm
         JrCuHJ37zlgs2gnuZzxa/h3k19DkE3UsnQ2WR5MUxF9p2vQVCjaWZU3KIF9oI37Wdt+A
         a1cTESkf8sIJ92tBxZ9FBLn0bCFxXTPcFv0hc7LbUW8Re37a/r0ZEPGXBky+ANkNilHi
         TmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186530; x=1793791330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hq1+ntt/iEffpsZs3NUeDNL9muD9vYu5VwqXCAfAeHc=;
        b=BqB7cYySjpgA/4LMoNysWePxusqP6eWcl7B/191J5cPstPsTl9jj8B96kY7N8P2rdD
         GYBpx6yWf9roQ0VEIVto9o4soWsVCwHCEJcYquWbxEFJSFhipP6bIZJJAeagBnLIB7qg
         +itBYlHwS3oNgkcztBIcgw5L3GlZv4WD60KYiyVHGr4e4nGRmaPaOZf+cqYy/i9LlbU5
         04T2U3wZ0YNSx1XLco9zywCEZGSI++INeCvPjiIGnBKxs4QaVRTWZcv6rLgyfIxQLkky
         pI2eHLcPE++QQHDclNfDe9ZF20uqbneJOAQ6QK4zrjc6SahDa678a9Eps8Y81QGXcpVZ
         lR5A==
X-Forwarded-Encrypted: i=1; AKwUvBziOX9PcczbFTav4CPXFU9i/gP/q7bljyS6de/f8pRP0HLwnMJIZBRZ0yNdwLtIqqiE57wHt1PI4PNLxIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL61XMxog3ub7LdFi0gICcEIXFrGJ0qZHTVeaU3D8Y7zDqNMm3m
	1fziDGdyl5CyVFZvC1mJbhEQbYBTsla+HX6dtsO64vjf+xuAavaVau8o
X-Gm-Gg: AYBFou15rzTbIg18DP0YX6Y8QJVrcTPjEWd/LWAlFUWJ1g2mE7toi4EXDXxYE3SGR7D
	+sW2niONA/z+sIvtxF0lPIJd9yMI1h4Q9PJ7SH21It2tAmwPJ2JRzP2USk9AP8yrOUhi9MOCRal
	wXHcQ5zoFZjPDM3RX3PwcMva/oCUM9QzJl3aFfUyw/rhYdzF2ZIneRoUMRAWcLDh3XRrc9tToQh
	+pE1hQf2YTwJUoKJl6Pjd932lcTeXyXIIOBT8mEGn+ppYN51if5fSMIbFsAbpLLTQgX5m1VHcZB
	Y0c+fMk7EGZhkibbf9FHr0sUcuOWKxcuOFlwIf1hl+GYuhQ4xTvDUN2GwmYyoDykwRBPXEHVNGE
	gQgzCb1xS1zgiW3rGA5Hzpcg8v/UaWPeN3u6S3b7CrsvDAC5hggJeu8SQ0kmagPRZTBUHC6eJOA
	k0BNDLZmA3hbzI3rIKlUBpVU5hSNHV/WA6guREvhtQHsylEeI0BVveXvb5lk50+JoVSgbiSI2ej
	JWKecaHIVsQQv5+oif9rF0WzAEs3tAnt7LIykwHPom52tov+BGHvCdf0bZaseBE70ADptC5R+ZO
	SF9QLHbsH94IP3gJhR7dBPJeDVTONXnvyiKzE5iyAUl+BRxzdde85r6q+jck4jNopogCX0wRIIv
	v1rp660ak33ZEAjhsRIMw/FfJ7HgDjb73xEkYMLFJrEVZ87MVi8F50JOknavhBeVBROr3fn+2Ud
	0EXQKLEa9CUuQBHkHciPw=
X-Received: by 2002:a17:903:3905:b0:2e9:5714:607b with SMTP id d9443c01a7336-2eaffb64751mr32808085ad.0.1793186530083;
        Wed, 28 Oct 2026 04:22:10 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:09 -0700 (PDT)
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
Subject: [PATCH v2 4/9] media: i2c: ov7251: Reset vblank when the frame interval changes
Date: Wed, 28 Oct 2026 20:21:49 +0900
Message-ID: <20261028112154.855185-5-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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
index 2db6c28a6e34..859bf6c42341 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1259,6 +1259,10 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 		if (ret < 0)
 			goto exit;
 
+		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
@@ -1412,6 +1416,7 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 	const struct ov7251_mode_info *new_mode;
+	int vblank_def;
 	int ret = 0;
 
 	/*
@@ -1440,6 +1445,19 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
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

