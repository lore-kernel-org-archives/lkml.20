Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051954;
	b=QlRIuUUQYyI4wiAIXoUm1cvKVDg+0QqsQk2eroqT35h5rDDp8HVYGCNsGiy1HFnGsDJN
	 FUeJ1mnZnSFZg8UtqPblWdjZ1evCLsxr5DHyOHB3+jJ05ler8PZ6TewVAwDAL0ZL6P8b9
	 9GcFDBSrML/O24WvOW8plvxpHuCTO0l6cobVp+1EiGUuAsa39W+OcgN6PC+NLNgTnZidK
	 26HIEdN+/bzB/IiGdmvbFztgRG/FBD/c6R/y1cOAgGXWbhBWxUO5ApyWB85NUtkPYqY1s
	 Rs6gEgUBbGX6ng15eoMtG18Ra9eKEdRfyGRwBxP4Kx1ciCtOxqWJaOkSS5LB/nKQ+bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Sr1zNGFXUyUQTl9XNV5ciB4koZb58s7llFG2XF1rzeQ=;
	b=wQfQrddUwWsq+NnjqQdwMyP7GqQkjHdSg+QHSvajCWDDKmeG4e5kMtIDCea4Y2xUCkAC
	 dJkbGrtwEovnVwXil1BXq/0q13tQ9k+VGm5eJEWBHZLNhE08mL/DSJ/iejcU2LcDSiJpv
	 AgFy0PMX16Ol4C/o837RwDpPzJd4JxvvFqsdVQvNa6mICeWnmbsA4fDuKqDxbaFuTgxNV
	 MgDul4Op/XgkDlBP151RReeOJhGf2imXMdEFrQo8NnD781hnLDE5du2dbgPe9Z2KtcS5a
	 W+/saoLbM8jPPB7WXTRbwRC3VuoGYqOHCXqNjVlXkJOPfiRyfTyijlV4PxIxlop7YWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPutONwh;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F086606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F086606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPutONwh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so13200625e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794051952; x=1794656752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sr1zNGFXUyUQTl9XNV5ciB4koZb58s7llFG2XF1rzeQ=;
        b=nPutONwheTmtaI5GQn7Xa+eSIIIS8E5VMKo2Dyey6usHGph5YCcvSHUqp4NFXYxoH7
         XJqKhn4x32w4qTwf+Fmy08fCw/FuVOerTlBtmmnS0L7XgkEnZU0IJWZMKIorIQukRTHH
         l/658CS+WTKwX/lIAIBbhu+xz8Fb6l5SmepVNjh8tBE0zis9mpeKiuUbcCAaUK4PzMmO
         qpzC1IFfoplkVbus0pw66uU1uyBUjpnwxzHiIGX3ou4leV7QKNCUHv5WO2ramKtitbad
         xmp5Z+rxaRacSNGXDsKKBCx8txFtyCffN/A5FvIzVSGfegIl3vyi9oat5zxAPjcoWz7m
         8WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794051952; x=1794656752;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sr1zNGFXUyUQTl9XNV5ciB4koZb58s7llFG2XF1rzeQ=;
        b=nvNd1cHcANwSUJ0fY96AEmkWFVlq6fIsHdQHEBmNcnSgwt8N2R2PbC9lIlQrBjPeYd
         VXkiCfaHv6d/pxKSsY9oLMqS8zBaJLL1t+X5hfH1EmrTxywgVT/jRo+fs3t6tnvStiBP
         smZ0TqXDjlna/F5fu9aeoCWQZyyY7CUoQtJDbuCLSxE4Ks1E9WOeB3p7kTX5iUaDRX1v
         uAaJ9jsMAQM+YyN+P+LW7gNzQp30vyLzTNvAlAp3wrfRjjeDc4GBOlYHUD/9Si6nrXHc
         G2Ks0jVBgqBDRgf9ZiZj2YZ1gikLa0m65iR//1yN+F9mLYg7xxopoaoKG/bgsk34HOZ6
         LVNA==
X-Forwarded-Encrypted: i=1; AKwUvBwn87O7wYbsx8Vsojtg2/s8f9jvSlYPl8O7ntV92C+9wpcN7/ag1Aa29blvs8yovNmQWcEjfs8zPUqWx20=@vger.kernel.org
X-Gm-Message-State: APuU4Z991Fn6Dv0CBl66vhvFjM+BTwWJU5jaQsInN9CoUxlvu5smfn/6
	KRzGedOoJISb8CInbKKBlhZgL/pdIv4F1lnGzp7P9HzmXQcofkfL4PGD
X-Gm-Gg: AYBFou11bd5nr3i7/Ou4dRyipxka0+L1cfUmP4Ll/AgLcW15QOXJ2TN9G0abz3eTrTE
	TfPAUU7Qjshgv8qqYMQBxP6sCohvJFjWIPdwvxloD3g8s1qtL/8KXjaC3+MPr4/kZJ+5ylenhYp
	/sxLXOwpW7FY2v+mlX1B5lVOw9KigEJfU3xUa+KdvYs7FE5g3CIr4OeJKqDf5LyYdnEADnq7Hox
	PKbaEKhsIZVGUFPvyWX+gY9ePAc6xRybNF7U6AtL737DTfsnWp2WzfqIMTTG+2DIPuxEfWiw2tO
	nKHFQ2fYk6pAc6i0ELy4826OA8ZwvruOIS1ohABUUdXRsHNc+wSqdgq6uXDvYZ78R7mlHteDLFP
	7kpnEhHoRpXlI/pbTF+j5qDQSP9BdTn9z8MDf9m8itXpKWBRWn6/wWfH3aZL/kJ5C9/LcdjiHjb
	62zimvTJK0QdzjW/AdTpu5kSBuflsJbInCmpM+uTXQyZe+3b0aCDGYwdakDmm2oAdwiqNMKbFf3
	e8uoyENln/KfkpGc0/3mzsYvTgMwIwamDXPpe+gB4hP+zm4g9R/n2EnPOL6IUUBMX1nmG/u+ott
	ROvaAuZAIY/8377jvAXm9G3LeJrXMnNsYDMe6HJP5mBwyX5+htwSzwxX066YhQ==
X-Received: by 2002:a05:600c:19d1:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4b6de691614mr91237845e9.22.1794051952338;
        Sat, 07 Nov 2026 03:45:52 -0800 (PST)
Received: from SurfaceArch.localdomain ([207.188.128.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501bdedsm43331655e9.3.2026.11.07.03.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:45:51 -0800 (PST)
From: =?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: Clarify that gain is Analogue gain in OV7251
Date: Sat,  7 Nov 2026 12:45:49 +0100
Message-ID: <20261107114549.21301-1-antoniovazquezblanco@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally@ideasonboard.com>

Update the control ID for the gain control in the ov7251 driver to
V4L2_CID_ANALOGUE_GAIN.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
---
Notes:

This patch is not mine. It has been carried out of tree in the linux-surface
patch set since 2023 (patches/<ver>/0013-cameras.patch) and has never been
sent here as far as I can find. Daniel's Signed-off-by is from the original;
I am passing it on and have added mine. Daniel, if you would rather send it
yourself, or if there is a reason it was never submitted, please say so and
I will drop it.

One deviation from the original: the second hunk now wraps, because leaving
the call on one line puts it at 82 columns and the media subsystem asks for
checkpatch --strict --max-line-length=80. The wrap follows the style used in
commit d938b2f29be6 for ov8865.

Testing: Surface Pro 4, which has three OmniVision sensors on one IPU3,
ov8865 (INT347A), ov5693 (INT33BE) and ov7251 (INT347E). With this patch the
ov7251 subdev reports

  analogue_gain 0x009e0903 (int) : min=16 max=1023 step=1 default=16

matching the other two. Without it ov7251 is the only one of the three that
reports plain gain for the same kind of control, which is the inconsistency
this fixes on real hardware.

Built with W=1, no new warnings. checkpatch --strict --max-line-length=80
clean. Based on media/next at 7.4-rc1.

 drivers/media/i2c/ov7251.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b5120..6ec979c5fb35 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1052,7 +1052,7 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE:
 		ret = ov7251_set_exposure(ov7251, ctrl->val);
 		break;
-	case V4L2_CID_GAIN:
+	case V4L2_CID_ANALOGUE_GAIN:
 		ret = ov7251_set_gain(ov7251, ctrl->val);
 		break;
 	case V4L2_CID_TEST_PATTERN:
@@ -1580,7 +1580,8 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 	ov7251->exposure = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 					     V4L2_CID_EXPOSURE, 1, 32, 1, 32);
 	ov7251->gain = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
-					 V4L2_CID_GAIN, 16, 1023, 1, 16);
+					 V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1,
+					 16);
 	v4l2_ctrl_new_std_menu_items(&ov7251->ctrls, &ov7251_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov7251_test_pattern_menu) - 1,
-- 
2.56.0

