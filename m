Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793928738;
	b=Y/GiCDABQwtHTQdH2paNuy2+qLu1DnQhQ3/wXixJA5orZ2iRkZ88EJVBXC7pgvCUq+DX
	 +tPk/+7DGTcab8ar55pRm2TvSH4mat5b7ekPFSoTgRswCMR07NrSEfU1lftNZlbXHEP1k
	 USy7sxrZz5sV/pLCFjvs2rOQ49vGTZqgknRccOaWGkW2eEMitRqdynBGCb21/B0M55bha
	 3mldX1q0XlIv9IN1shzHqshChsGTVvRDuF9iZs8BL/0ERTEslFcWiouLUqj7jgq6cVq3X
	 WCdA2y+NlMeKnThlJW55VGl/QjdjQulOCPoIyeOWXDhjUBGb49Nowkitt0xQ3rYXonw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928738;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iuzMFjzs4XaCAnsRAqL+NY7pq46rfWD8N5K5yw81NR4=;
	b=kJwVai1DjJv8q48HgdGyn+ajlMKbx3IRbAZJbtW3CaszxwnNesSbH3/qE/Dnxg26Cmq2
	 CAMIoIR5Dff7QrjCPtns4pEqgb07RiV2aptq5X8+PN+5iAcudT5tI4GtCKmWoIdicPUBD
	 fBxSqeGDLnb9pyLeGfmZH/ILaNRR4nbnzGMFneDl17Gmf0YJpW34JPrPSZSRS1eB4hTb9
	 o6hzw7BpxmQvKRbaS7Us/WkXWwz2I7FRuh6fjc1rHXulcA6zGGnGFMi4yIWCEBLJwN5/g
	 XUIGzIxgWWvgt6bLAIHNtMig0E/pUEaWJ2QH0nwFEZ4LEOXoMRmUktw//THtRdBE0qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Dl/4aoHA";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MtYGxPk7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A541606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A541606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dl/4aoHA;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MtYGxPk7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793928737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iuzMFjzs4XaCAnsRAqL+NY7pq46rfWD8N5K5yw81NR4=;
	b=Dl/4aoHA3EpIL5S5wexKrS/+/DdPHxNjhdJxQOo4mjoWBSGKtS7OkjQb5Ztry+rJR3Sgo2
	2qzt9MpP6pSWP7EpsIRClgNVzjLnnla3tZPanOPULe23OSastNdAijvnomB/svx6LMjHhX
	p9V3brAA1PHAveuFhKgjxthd3Zd220c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-xyoPQ_8pM5Gha6wMDiljMQ-1; Thu, 05 Nov 2026 20:32:15 -0500
X-MC-Unique: xyoPQ_8pM5Gha6wMDiljMQ-1
X-Mimecast-MFC-AGG-ID: xyoPQ_8pM5Gha6wMDiljMQ_1793928735
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so37731885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793928735; x=1794533535; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iuzMFjzs4XaCAnsRAqL+NY7pq46rfWD8N5K5yw81NR4=;
        b=MtYGxPk7Vyl36dDVjGABDLnpMlbhfnI5xrOJpPAOK7p2/ZlS8Q3bmPrnw4dUo1p5+L
         oTCRpxeKeAG7/9b8gG7o21mNjRkaXfDn7Nk5XDmg7QyNs7fQwtC8i8UL7Wb5gVQ+65Ly
         Z34Sfko9Do2FAhFUg9r+cdGc0ZUUqWZVbOkAvBQYbIqW7RLgq7S+dhAXQDc9Uc92ckuc
         +TQGcQqrm/boXDVppEoF/C7opUuCC17vQ3ILYHkJr38uk1h87dDGPtOmOFTeelWRssQz
         qvC46AktBCpzuEdQgtl5yaEBCUQNgRlZURlW7Ym4sy6axaYfElCcTqbCyGzgNxzUJp2J
         NIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928735; x=1794533535;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iuzMFjzs4XaCAnsRAqL+NY7pq46rfWD8N5K5yw81NR4=;
        b=cY9y5wO2GMMWesNuZVsm4m/A+nSwlreIOctxicLHSyv2/74i2FvvL2XBdOiqfqersA
         n3SspqztDoDppSrMmYP1kw8qSJoikx4l7WL9gUZvSWYf9dSytSU/gNyLHx4JFghG/SG8
         UuTXM5TwEf7OburzLRgMiuh3YKr9Ii3TWMBLWxrgUxgqn47nB9QOQxxPIiqbAJRZsci4
         9fmLeHLU89jzJ4wzyiQxKdmuN6KCH87MS44XVrAlNqcEo6LbVXBCsmptSCTW5C7umaGg
         esaoYdfhw9B8LwHIhQ9SnihVKkrJXonQ7jQeTA4/sFt+W/cyHcl0bvNLUCA1XXDx4dh3
         QUGQ==
X-Gm-Message-State: APuU4Z/k6/QDfejBO7m058ck+pAzMdBTYNjQrWKqWXqYpYSlPnTnG1fs
	SN7L/APDbEkk4hi9hHtzOjrmimy/rmfPHOnJcYv4kuWXXRmMqaIBQI5FQEM6MumLuGYHGurxnoh
	zciZv6hs+VmpwNeTdXgqUPW7sQPih9icSrlLARFQl4L+vZofzVb3AOyu76g4yyeK9cw==
X-Gm-Gg: AYBFou1F/PREGMzu7F/Id7DjWEmlA4/jmZ+ENi0pKI/0+sgDQQIUcboRutNQV8yOqBv
	2SvMBWy6ipggUz4cCXPp0UCeh3jyYs1k17lxRjnhLB0Z+iqKOKimPOTtwj9QdOsqnA2GYIntIMF
	Bh34w4VNKogECGiHzU48aiP2yKKKsN3ZYwwKhPV8hL2sbIaz2ycAsRhH15RGRylJMsyC/gi0F7M
	+EcSJyjUZ3UmXi1FKJQYmTVhkhhZCy7EZiKG/FQ3hOwGmRxDTq/pA4bTLlIktNxOjNcM0KkxSRg
	5vgPuXyMrsUsEHcgiLdhbw7gRRVxZV0zbiKm2R7Kup0Grl5gqRx1QIRaY581PqLjX7qAyGM8GZB
	P9tv+4Nd3Lw6UHAcjTAFcvH6tZX6Ajhocv81l/m0blJK4I3faofeoWB842DSHdhCzkAsvD/hZ5E
	/gLzToheJ00u/LK+3B
X-Received: by 2002:a05:620a:260d:b0:939:4a44:5f99 with SMTP id af79cd13be357-945f335554amr164423185a.10.1793928734889;
        Thu, 05 Nov 2026 17:32:14 -0800 (PST)
X-Received: by 2002:a05:620a:260d:b0:939:4a44:5f99 with SMTP id af79cd13be357-945f335554amr164420485a.10.1793928734212;
        Thu, 05 Nov 2026 17:32:14 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5c324a9sm23671585a.39.2026.11.05.17.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:32:13 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 05 Nov 2026 20:32:03 -0500
Subject: [PATCH] clocksource: convert to subsys_platform_driver()
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
Message-Id: <20261105-clocksource-subsys-v1-1-b0b710681b66@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWdukLYqEqxgWwzjoKGlJB4yEc
 HcrLL/kvX8F5SSs0BQrJP6ISgwZ7lQAPTE82Mg9G7z1lXP2YmiI9NY4J2Kjc6eLGseIdYnna9V
 byMcxcS/fPXprD+fli2n6l2DbfmeLIjl2AAAA
X-Change-ID: 20261105-clocksource-subsys-1eaa83a476f0
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=3813; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=A6KCIB6QFUn1wgapzJM/giPG1XXmKTuqxemPdeDyycM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe6kmujGnx3qjbbFJfYzWB5fSdb2cOrbrEV6hyNlDkw
 Q4DgbkJHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzEnpWRYf/NiXk/L8W1TFOr
 Nlu85cK8s5Vr9vSqN+w49kyZa+qDnRcZ/pfK3LdyrJl2+7TvuTUiGq0fZNX0vU61bLz5x4jx4GP
 9GFYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clocksource/em_sti.c  | 13 +------------
 drivers/clocksource/sh_cmt.c  | 13 +------------
 drivers/clocksource/sh_mtu2.c | 13 +------------
 drivers/clocksource/sh_tmu.c  | 13 +------------
 4 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/drivers/clocksource/em_sti.c b/drivers/clocksource/em_sti.c
index 73a3357d173d..b35c32fbc539 100644
--- a/drivers/clocksource/em_sti.c
+++ b/drivers/clocksource/em_sti.c
@@ -346,18 +346,7 @@ static struct platform_driver em_sti_device_driver = {
 	}
 };
 
-static int __init em_sti_init(void)
-{
-	return platform_driver_register(&em_sti_device_driver);
-}
-
-static void __exit em_sti_exit(void)
-{
-	platform_driver_unregister(&em_sti_device_driver);
-}
-
-subsys_initcall(em_sti_init);
-module_exit(em_sti_exit);
+subsys_platform_driver(em_sti_device_driver);
 
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("Renesas Emma Mobile STI Timer Driver");
diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 7977507f6ce3..0bca806f8405 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -1168,22 +1168,11 @@ static struct platform_driver sh_cmt_device_driver = {
 	.id_table	= sh_cmt_id_table,
 };
 
-static int __init sh_cmt_init(void)
-{
-	return platform_driver_register(&sh_cmt_device_driver);
-}
-
-static void __exit sh_cmt_exit(void)
-{
-	platform_driver_unregister(&sh_cmt_device_driver);
-}
+subsys_platform_driver(sh_cmt_device_driver);
 
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_cmt_device_driver);
 #endif
 
-subsys_initcall(sh_cmt_init);
-module_exit(sh_cmt_exit);
-
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH CMT Timer Driver");
diff --git a/drivers/clocksource/sh_mtu2.c b/drivers/clocksource/sh_mtu2.c
index 3aca86d6a2d4..a45bf9406581 100644
--- a/drivers/clocksource/sh_mtu2.c
+++ b/drivers/clocksource/sh_mtu2.c
@@ -505,22 +505,11 @@ static struct platform_driver sh_mtu2_device_driver = {
 	.id_table	= sh_mtu2_id_table,
 };
 
-static int __init sh_mtu2_init(void)
-{
-	return platform_driver_register(&sh_mtu2_device_driver);
-}
-
-static void __exit sh_mtu2_exit(void)
-{
-	platform_driver_unregister(&sh_mtu2_device_driver);
-}
+subsys_platform_driver(sh_mtu2_device_driver);
 
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_mtu2_device_driver);
 #endif
 
-subsys_initcall(sh_mtu2_init);
-module_exit(sh_mtu2_exit);
-
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH MTU2 Timer Driver");
diff --git a/drivers/clocksource/sh_tmu.c b/drivers/clocksource/sh_tmu.c
index 8b3cfa6727bd..38bfbe8d899d 100644
--- a/drivers/clocksource/sh_tmu.c
+++ b/drivers/clocksource/sh_tmu.c
@@ -636,22 +636,11 @@ static struct platform_driver sh_tmu_device_driver = {
 	.id_table	= sh_tmu_id_table,
 };
 
-static int __init sh_tmu_init(void)
-{
-	return platform_driver_register(&sh_tmu_device_driver);
-}
-
-static void __exit sh_tmu_exit(void)
-{
-	platform_driver_unregister(&sh_tmu_device_driver);
-}
+subsys_platform_driver(sh_tmu_device_driver);
 
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_tmu_device_driver);
 #endif
 
-subsys_initcall(sh_tmu_init);
-module_exit(sh_tmu_exit);
-
 MODULE_AUTHOR("Magnus Damm");
 MODULE_DESCRIPTION("SuperH TMU Timer Driver");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-clocksource-subsys-1eaa83a476f0

Best regards,
--  
Brian Masney <bmasney@redhat.com>

