Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548208;
	b=J2vxV0FlEU1O03zeyIrwR964pblmCIhvxs21YcK3EW88SK7nfxNp4K8uv9ROfMK14pk6
	 GZcio+Y+8YI/jtBPIxwlBZmKue/j8AyYYkJgM70bojq/SGEwwWwBPW/5eFTIgvIlg+XKQ
	 40U/60gsD85nqDBJ6izHX24BIAO+wuRdKrcFRrBRro1p40/Ya3y9spofNFfvLJojxuzAk
	 5flE1LI/yzBXzH4a8GXUB40NDw6Qk8YQlI/WCQt+SDal/3c2GjEYtwSAikMPcUY52N9rJ
	 Br3usxikiFItzAIHzSIykap2O/uaMKUp4tPVpHb1UtyZyiywoiDRKmrWn8YuObA0ylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
	b=2rtn/ukAMBaCGDOCV9jwxiC+QCvCI07aAuDPr18aT2+p7isDzFioj+p4bRtqrc/UTJoR
	 INMxekbePSh8F2l4EKKsii3uzPaeh69wG1evgLQkOYFtOIHOcIHJ1Mvy3FO6X4NDjk2S0
	 DTLKCdfgL2rvBSfkSjVjtK+NTEFsWoBBrqlVzzDfTZfI8Jlt1GSIIqgD7REqkovxDrNcc
	 R1o+CDK0HryhKsZYixDozIVisRJqUEoHCzGbwm7mAMb8UlF9XwkonQcgvvjdwXn4lXIUd
	 xppgupJDjwwwVrvHqlc9GIidZivHe3BeSPhik5k8mkvNq6sW42IC7YdyCAs59RN5UZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I0WcPgM0;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DAC606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DAC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I0WcPgM0
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1047924c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548207; x=1794153007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
        b=I0WcPgM0JbD3FfxTYT5J0HGnQrDgbk6nAbHGIXMOXSzsnBcUZF3mApN8BFhpSaLx63
         /6SCyPJBCS9n+8eAhqLkAzYeRrmIvXD24t/MnJyw4Cdbzhoz8lM623vsNsmWlwcgCWlg
         ft+TpiTTKYr9XMtAtZZqj/5TdSiEQEcmhP+TFmbjn+aKAuw8AZj6ooSnev+KkLuUSfCM
         vmu3AyhAGLrS42yVydnvX5lbmUgqzjTw3SZ5OKI2kq2Fi79cgQe0iGCaIRcDKHV63EhU
         WIwGxuSiBzC05w83+sqdfml3azgR3wxOrv2/hmGRsC7mr07eluDzdMNEERPY+ALiBaa7
         AMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548207; x=1794153007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
        b=Z5HKYnKOo2e+zjSARZ3uqwhxMqvED+7/vNzuOZkIdZRbvuNcCqKcsvRPEqY2vbkN32
         VwzSMIxedD5jJaowuqwZfRsz42Jr1IHMvSRTDkU3EBCkgcLAcmtp7lQvazUmqSrEBugl
         Ezjv1uBwHI6dIk8rzaiG4yemrUrOPVHhLaUO9SbWhpPtlUhCzJEKRCwLi5o2W7r6wrPC
         UOIlfgiMtaxRZr5FxM/qKZODwyOb+6f2qpp/VC/LPttBjCVRexC2FYwqXSmitZOk1Jm7
         53MUh8YUPNRELVnc5aPwg3s3cIp9+OPOFTlAuoPkfwHTNC2pCTzS/vrrJpViSjgvwQUF
         gYJw==
X-Forwarded-Encrypted: i=1; AKwUvBxT4Uqg6cfUwvKgf5K8zli9v5kVdRIsHulXaA0t1q/lGpcvpm5ORwAOwL0Iu0GiEQ3AOZFAMjjMd0nwUI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJUtp/Wq9j5jYeT7JmWzSyhctInpuc/zKhX9VqRLOiCVqquqoT
	wnKWeJpkBIeWaEomdq5nJLM2HGJeGKq+2E3qu1PqiqpOMedgNY5lITpJ
X-Gm-Gg: AYBFou0Jzg3nYBhKY0RvfG1+m0iXjZzZCbw6lp82RjIOqV0br8M4aYZDdvx/nv//ju9
	rtj0MC7OSn3MpSMeyLtFcI8uRdrUnyF4ntRDbjgsndxU6Ule7PHb1gcY1yiYavJVmUP3IJ9Fpvp
	P1N7dF3m51wrKDV6gNYEFFEIzScPXwsjkLOpAkM4abFBmvGgfMqQFshC4IDOd1wJ8tWEbpw+wHA
	nabEX/Ae0152AzwOcHl83/UXurGMUDOBK1pfItCJQUBXnp/WfG0xZKKnBXEVkHfNhGIAVHp29LO
	gSPEVmKEBUA8IIR0Hh/mAq/yYa5nE+nnQdM769cv6gdyeM2K45jBIF5gvLu4rywXAORJifC8od1
	EO9H2uZvJfoNnJV3r7yYgDCNF266pTmfBjATnT53X8EKG2wCdHn6x/Kw79Wlbc14QMXqeyZFNAw
	Ml6JMNT07sOpZ9/VJHtvMklypoJQJ1IvaKuYWVAKDxPX9l3JECdP98nVSlfdD7le5/GdqHwJ9yn
	TCD7/UgYB6/yw2ZiBsReVQ+9XxYwanxrxdXhpACs23kl2DxSA3ltai4yA64IvHXI6Zgr5epYR7E
	o9gf1cKYdCAru+7kSDuXIgqVdJAT4yR7xwTaJz39McoRmMvpaTjZxUQ0SB4T5eGJ4pkbeepV
X-Received: by 2002:a05:7022:7f02:b0:156:d588:c881 with SMTP id a92af1059eb24-1a9420e36c4mr15374530c88.2.1793548206589;
        Sun, 01 Nov 2026 07:50:06 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm25437817c88.18.2026.11.01.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:50:06 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused atomisp_get_pixel_depth()
Date: Sun,  1 Nov 2026 15:49:59 +0000
Message-ID: <20261101154959.381-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
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

atomisp_get_pixel_depth() has no callers anywhere in the tree. Remove
the unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 41 -------------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 -
 2 files changed, 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index e66a7d1c7..4f876b02c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1080,47 +1080,6 @@ static int raw_output_format_match_input(u32 input, u32 output)
 	return -EINVAL;
 }
 
-u32 atomisp_get_pixel_depth(u32 pixelformat)
-{
-	switch (pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_YVU420:
-		return 12;
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-	case V4L2_PIX_FMT_RGB565:
-	case V4L2_PIX_FMT_SBGGR16:
-	case V4L2_PIX_FMT_SBGGR12:
-	case V4L2_PIX_FMT_SGBRG12:
-	case V4L2_PIX_FMT_SGRBG12:
-	case V4L2_PIX_FMT_SRGGB12:
-	case V4L2_PIX_FMT_SBGGR10:
-	case V4L2_PIX_FMT_SGBRG10:
-	case V4L2_PIX_FMT_SGRBG10:
-	case V4L2_PIX_FMT_SRGGB10:
-		return 16;
-	case V4L2_PIX_FMT_RGB24:
-	case V4L2_PIX_FMT_YUV444:
-		return 24;
-	case V4L2_PIX_FMT_RGBX32:
-		return 32;
-	case V4L2_PIX_FMT_JPEG:
-	case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
-	case V4L2_PIX_FMT_SBGGR8:
-	case V4L2_PIX_FMT_SGBRG8:
-	case V4L2_PIX_FMT_SGRBG8:
-	case V4L2_PIX_FMT_SRGGB8:
-		return 8;
-	default:
-		return 8 * 2;	/* raw type now */
-	}
-}
-
 bool atomisp_is_mbuscode_raw(uint32_t code)
 {
 	return code >= 0x3000 && code < 0x4000;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d3d1f2574..937b64ac8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -284,8 +284,6 @@ void atomisp_init_raw_buffer_bitmap(struct atomisp_sub_device *asd);
 int atomisp_enable_dz_capt_pipe(struct atomisp_sub_device *asd,
 				unsigned int *enable);
 
-u32 atomisp_get_pixel_depth(u32 pixelformat);
-
 /* Function for HAL to inject a fake event to wake up poll thread */
 int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event);
 
-- 
2.43.0

