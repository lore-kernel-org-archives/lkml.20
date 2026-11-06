Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793928500;
	b=C1yXNfol++Zhpa9hn2E8LKIAPyIDX8C2jkjl72FYpvF6Lg34h3W+53PWpIlgZDifYbmi
	 CT0zvgJgw1WD+NaX4eV52kIi6XnysKRZQeWb67oC6bHVIDem9j4M45+mkvPWVbQq9XYzR
	 3k+x6Uy0crfwCCwkq6CyLBOyX077iC9v5goZWeD7wv70rXvAxtS5SMeFuxTAIwnT0B5+U
	 aV+LhyJY638Uv7IFybwdBOM+3Lbm+aZCB1nsUlly4lfp1ZnSLctLPt94K5uiLG5eNautS
	 15nWlaPQWMfu3nSSMpy1Ml+0dJy4DloBtFET8OeGFKBykDsB/0IAhBo5ZrxBRBpyXyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928500;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OzmeLVnOJ/ClYIo+ngL8aNFa/8nEmpmvX7t0mnKpTNc=;
	b=pzmKQr/1JahrTaGiDWKgwYjgBsXSbCwF+PXIYZU9dpagMvq4oUsNgjTG4PKKdiShdHPB
	 XDQMhpJi7Y2Rw0p0zNJuLLwP/L5pmAj3dV2ElGsX3Rp1k9oAOfm5xegxZ7gHm0zRfzyvW
	 Yf4iHcQesmNYvHecpjceOERpmIK07d2SgE+2em4KWeuKAJnqLjAsv4tmzS7QlkEei8fLF
	 NzfcWj16CHFod5tR7QsC8qMhT136ayuQ22dZQERFttiCG1lc0ZyKfqGfSpT4dkFg9tIfl
	 BO8TzDo9bOygYMKBABicfRcQyh5vohmu05Zz5O9PGzD50cCzVJoI4WwU2NwJimqdYPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4OCNn7d;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MD9aG4fx;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE70606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE70606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4OCNn7d;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MD9aG4fx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793928499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OzmeLVnOJ/ClYIo+ngL8aNFa/8nEmpmvX7t0mnKpTNc=;
	b=d4OCNn7dwrKuo3aevgp1a0LSJgKT/ImwujOlucixm39X5wc5krT88ti0zTCIyuocNkj0hL
	0PBxQwCwMRb5i1/Lvy4v8zqFk5J0Sytq/u+tORKAQxANzIuD00heK3nhdBt2lB1U5QMado
	Uwecp75xHYXZMlSEGl/g+P2CuF00+vs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-nkY1FQZTNsGM8cQRNszUBw-1; Thu, 05 Nov 2026 20:28:17 -0500
X-MC-Unique: nkY1FQZTNsGM8cQRNszUBw-1
X-Mimecast-MFC-AGG-ID: nkY1FQZTNsGM8cQRNszUBw_1793928496
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337b591609so1143261cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793928496; x=1794533296; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OzmeLVnOJ/ClYIo+ngL8aNFa/8nEmpmvX7t0mnKpTNc=;
        b=MD9aG4fx4mCWQAH03sTcLmygk+gD03T71HtAdTGykHbhtNlM13XdY93yBRtatBMjBH
         SBuMfuYXWLITwi55eZQC5wMX8vz7kGMGQWCdBqe7UCFaXQfpyAIMEo3Av12Pazmh5bpz
         dfrctM/36k/GTpECGxzojsSITzKqSG/7fCTDL8fNH3NcpWkWEhBdsIYPW2cnHDrz+H/k
         UJS+zKHMZkokav39o8H+f2GlzjxPRMocuduFjqMGQd09ohM+9jGZgspOhNwKRACPse4C
         YQk6TphBxcOTZ+NNXIwtqFRbp9HMpfZEG00Fy0jNQO+DIbUQ/wYyc4WclOYDEbRz+h8u
         BwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928496; x=1794533296;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OzmeLVnOJ/ClYIo+ngL8aNFa/8nEmpmvX7t0mnKpTNc=;
        b=tixDlZ5mHtmIB7Cu3L0uJkx8ZP1XR1dw4/GNhM9fJL92m/TKxvT4S+t7OjNLn/FfAS
         HeguNDcalkoc2SxASLg2iTOVVVccoGnEKvGuS0z8OnmUBdC4aesky6Qmk+aHZPGP3ysE
         5TmfNRT1Iu4fXEIZJwuZTgExYlMbGq1Sha1AKP2KZjlMsCCgad/FwWdslFu3C0YEHTQ+
         oDANF7PkNnl2ajRj6CCthA6UeArcv3C3/4mpYx4s3oEmNNGNpFXNAFzcLrBMAim5/jc6
         PAeg49COorRfCqlp+oDkQ59NiIuk6riO5VbXcyqOVg8VGdfAMvYhiJmHnpe3dalgCNBW
         KSNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwWvwki1hqLauPAB4lrMV415iPwFSAgnN+mzl2BRzVGJUBU3zkQ5j4uT7AMs3nkFE9SS0xxPLYYeYmgg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qtb4HVeerU2mXhiWmU40ewVyrQM3owEOf395Qqoq0kCRj6t5b
	7vUxowCnrh4sPJP5qAoTZlNVP5sNgixVpPFkpaR6hJFXXbNQYBDv6LHXLUe3m/7arFuQjb52cN/
	spEkSyrabtb52uReECfQELPt0ZIvPe+xZSFvaJ8sQtEkEkQFXPSvdzYOKzTYRChFbK1UDNp9nG3
	2IxwcdJW9K9I87Vfkj0BZjsUxMkjKeFz98kVmn+hFHpo2wQup2
X-Gm-Gg: AYBFou1b9pL9v5IPf7rg9AloaW/NtCP9hgF87ZXYwH34LE5paKsFG9hRoxTDlPXalK2
	nmr+qwR3Tlf7bczuglFSQsud6R/lSLFK9rDQM4/hjzS/6xN68ZoneY5OS5Hmejb7bYQgski54ap
	5JbvX+FLULWXKtRiwNBpiJ6S82GscGBo1ARJ3/IdKCJwMcbqQD/s5N7seB/3R5wkSlBrkBtbzP6
	IbWVNZZuGmDqtcI+ZgXemoak4wDHVhPrHf4N/uplh7k5C9TdVwI71lNp7Fxy4wvsyHCwe+ZTQDm
	wSYyRg0T4gy+68onWJZ6PSUo15J0LQuNtn4HNPuekiPWOHm/cC332fPz5B+Cis5bKhwzNYRJxYU
	gtoYJHpY+N0xn8wsjfovlU7WvqEZDkyOt5ivdp58I/VbvFgFfUjNzvhAbupr3rgWYYAzGFzUgeT
	u92uRw7Esz73EyMivL
X-Received: by 2002:a05:622a:4c0a:b0:532:9b14:96c5 with SMTP id d75a77b69052e-54e15762f20mr17086301cf.60.1793928496198;
        Thu, 05 Nov 2026 17:28:16 -0800 (PST)
X-Received: by 2002:a05:622a:4c0a:b0:532:9b14:96c5 with SMTP id d75a77b69052e-54e15762f20mr17085971cf.60.1793928495520;
        Thu, 05 Nov 2026 17:28:15 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea68fc43asm8983646d6.3.2026.11.05.17.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:28:14 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 05 Nov 2026 20:28:02 -0500
Subject: [PATCH] backlight: aat2870-backlight: convert to
 subsys_platform_driver()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-backlight-subsys-v1-1-ee9e4cbc8cdf@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWvSSlxfRSzaGgyCdBAi3l2x/
 JJz/gsYHSFDEVzgcCemefJQYQC201OLgmpviGSUKCVjYbQdRmq7VfBm+GShUp3rpDaZNAj+tjh
 s6PiSZfXbL3u069uB+34AqBad+XQAAAA=
X-Change-ID: 20261105-backlight-subsys-17a9a6db80be
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=H2Ld4en7JsjVIIhCDl57TIyk/SGKDX29aUAga9OP9iU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe6mrezL7W5KgvfvdaGM+czQYGWYu0H1t0fz7VHWW0V
 sRNWPBPRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM5uoGRYbax8+fouQ21RXqP
 jl3hvcV7cPWUkxfcj1dK2OQsbuvKzGf4X7BCjlXHm4cve/05l0Mie3cdcmLyn/WO+yPXMt0lmm+
 LeAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/video/backlight/aat2870_bl.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842..2428427e11aa 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -189,17 +189,7 @@ static struct platform_driver aat2870_bl_driver = {
 	.remove		= aat2870_bl_remove,
 };
 
-static int __init aat2870_bl_init(void)
-{
-	return platform_driver_register(&aat2870_bl_driver);
-}
-subsys_initcall(aat2870_bl_init);
-
-static void __exit aat2870_bl_exit(void)
-{
-	platform_driver_unregister(&aat2870_bl_driver);
-}
-module_exit(aat2870_bl_exit);
+subsys_platform_driver(aat2870_bl_driver);
 
 MODULE_DESCRIPTION("AnalogicTech AAT2870 Backlight");
 MODULE_LICENSE("GPL");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-backlight-subsys-17a9a6db80be

Best regards,
--  
Brian Masney <bmasney@redhat.com>

