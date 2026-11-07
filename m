Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010499;
	b=d7NQg1V3QPgVa2ubZC3C5lzoI7z5Z+YCW67sVYu8Rz4mM0pKqoFvUL+jKIaW3M/739vl
	 x+T677vZP5nmcgJiE8iWyH1b4BITlUmVzruJ6utzoub+coQWz2+7KeVluR9gJtcbrPQhH
	 G5fwpnL2LnAmaGw97k5qsRz/ZgECKNMSgiDIUUv7t8fSuyUuLeTJ3XS/RUCP9CHbhOns1
	 GG03eZL7uyALOc7ZZA7/pjLlbq3K1Syjl4fmAxPd6QzCEB1NXQgx/QBIlvFScfFCFN7jk
	 wqm8UEcLRTuthkgLw/X2+4p9hZuDPdR9CAX1Bp5mTOq5rYX1JxCe9waBA5HlUXBTdUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010499;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=;
	b=boCQM1YbIDjze0tyqF71Yehc6Y3FnyX/l4rs5kbmOmMOgpy8hXp//kscDA4O1NlyZv8e
	 ICXSXvI7HM5DcGb5L0FPw3iGCRPI/7NDL6EH4rrneEioPs8CutOrRdB2P0MKAu1SnzSP1
	 X4GiTERehoXljVuOikO53BpeFfHJznKyN7bSoLo8MDvsSh5gAmu5aMriIMj8EFIFsPDyh
	 c7OhFMo1lzCRb7DKghB5Tt63QKuf31nkmFxZSAxqnZVAKhkBYmwXKqz1X42w109NzA7bk
	 uznhmTAXSROuf3C2YuE89XCdSI0iWaiJjwcxNXRMFHnkHWYeznGPFCKabfrUvPn2x1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TT6lDaci;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="B7ky/h3k";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A69606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A69606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TT6lDaci;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B7ky/h3k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=;
	b=TT6lDacixGosxWdcD2b50CLxI1afEyyBKYMASU0D8pTGnvD9DyrDE4BeK4DexzBRGnWH+l
	srnIzef60tmrrWmY0j1PKL/WDjothdhJQ+RpJs1ku9sGI97iuNSqZhJ/6+ybvmTh9Jl4vk
	cpA2r7AKJx+x1oIdhqy1jj79YWZ4xOk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-Bz7MeDcSP_-79nGNDMPOfQ-1; Fri, 06 Nov 2026 19:14:56 -0500
X-MC-Unique: Bz7MeDcSP_-79nGNDMPOfQ-1
X-Mimecast-MFC-AGG-ID: Bz7MeDcSP_-79nGNDMPOfQ_1794010495
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-544019b1831so23378931cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010495; x=1794615295; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=;
        b=B7ky/h3kzmy5rpcxw4LimFhyu7hl8fwyWmkS5x+ew+y34vWScYhlT3kdVUH9Kon2QB
         XZnRvXCnGwMKGlMztKE5z9Vzasa16kR09Wy2ZFbULFbSgnYlvFF1fchcigpVfWEzuBml
         MXYOcKD0S0ZFeo0ufjOeiYziHul8Aq29OmdMbuTXrnulKRwhBrT0V9RIuxtQYKrtYis6
         UX8UBm8x5QvLfOtGfoShrdJ3b+gzfHbx3L+omJ0OnSUryNUrkn5Lceq9Stx0YTKILEab
         gL3FgPJf5Hc30AB+aeqbCgDKw3b9hLJ/wwBSeAIpg80KRO/UTlIarGlXJPJHuo6bpm0N
         hFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010495; x=1794615295;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=;
        b=TeJz8FI7r5zgDwY9KaBCCdUH1UYcgelBEcWx7l5R4M4x+wQNxf9iGL6YdQrd/jKyQG
         qsVGR0NwUeCAEgCR8hvFEBepJU5LqGg48F01UXXd/sp3LCzy0tYkkKLJcswyQxarqUw2
         NUAOZ2K9ceAZMsRvj+cC7VlXwJvzclFupSvkR7AnAo5kaCYe85NozOcpYfcg1KEz97oD
         VT3tjP2OG0wma4ZECduQ/u29aK9ZmUUkeUwK8XkhaLKRz8bKIwRrQYBIHARj6fAS4fCV
         pmNTO8qpqzguauzNZiWx1jyqNoYzoWRcYHq/e2uYU0CH4bgogNyRE6uOdlRjZ8rQPXEZ
         hy6A==
X-Gm-Message-State: APuU4Z/R08YuJbvi5YJ46QiWDUi43ghyUuBNIQ08MQh5+n2PulhsAxSu
	uB7q7ymmqwzOSH4qhYTFEgoh5MXqqFQ5Wy7Yypuek3BCbV8Bu5d6JPuCMpXDiI9lQ7VGVKt2a1j
	Zh+pFBcZ+JYk50zSTKKpQF8WcMy+w8wuoQcv+MMU1+oxHssXAbWI//fCe0crrTY84WA==
X-Gm-Gg: AYBFou2iKgo1NtjanX4oBPgH5AcIlkR2EgFWK6AForJbZGWTx1IR57xxDvsK0Ynq+MV
	zTQl/fjESCTdbBIYmoAhQPBb3nd83tlvT+Vcyxro9Y2AuCZ/O/TH9kfymVv5tZl3iQ//HNL+N3k
	/Tj16MuOQyBgXldZNJg+1JDKD2V85gjzEVYU+SsOYDxTa3+pcU/9K3Dgk56FNOwLtJSGuNWJosK
	zAiRuJQBoQ/3JR//xe1lqW3N4D/fnSUN/GtdA4cS0WJp3lFGS/VyTnUmkKPnXsX2EiiGITIOX3J
	boxBsRo/kEnTU0Z8mONRVT2U6i3UNDLKQ2FqoCMHpaK8+hdeAjQ57j4aVAOYYwriZDjwvzJH8w6
	v+csswoOzAa7hi4ymqVdlJpSx4scbyToeJguRFZ8LBZ0rpoK6rm6OGsl/qBFwcaTNS1Bp3x45Hp
	bJFgEFnKKC4PACSZiR
X-Received: by 2002:a05:622a:138c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-54e138860femr73961121cf.28.1794010495442;
        Fri, 06 Nov 2026 16:14:55 -0800 (PST)
X-Received: by 2002:a05:622a:138c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-54e138860femr73960931cf.28.1794010495047;
        Fri, 06 Nov 2026 16:14:55 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a591a4sm31938846d6.20.2026.11.06.16.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:14:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:14:21 -0500
Subject: [PATCH] mailbox: convert to subsys_platform_driver()
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
Message-Id: <20261106-mailbox-subsys-v1-1-a0696237223d@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHNuyhLgVOWBnMPLXDiK5d4vDp
 77vvUDIMgnk3gWWdhaeJwfte2C6ampJMTpDGISJ1kGixoqHej6UbLWcojJEjKMUIyID7rRYavj
 4gkX52y17Mutbgft+ADFe+d9yAAAA
X-Change-ID: 20261106-mailbox-subsys-9ddd537d3eec
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=2807; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3AfqlmxfhvtOFs2P8v1lkeNi768e0FuNou3yM1xZYxY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5Va/njKX4/zvh8ZCU29Zn++fUlxuaP7/8lR/lw+nt
 x5I/K/a11HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBELD8x/FN2Dr8RvTypYk7L
 5G0vZQtW7Jh4dPsWLhmFiWsSK35ysSkw/E/vjD12wDx/od6djL7jvetjL7icSr0fsDtr9cdTRTX
 7S5gA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 13 +------------
 drivers/mailbox/mtk-cmdq-mailbox.c      | 13 +------------
 drivers/mailbox/zynqmp-ipi-mailbox.c    | 12 +-----------
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index 1f87a84e5995..f489bcabceff 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -243,18 +243,7 @@ static struct platform_driver slimpro_mbox_driver = {
 	},
 };
 
-static int __init slimpro_mbox_init(void)
-{
-	return platform_driver_register(&slimpro_mbox_driver);
-}
-
-static void __exit slimpro_mbox_exit(void)
-{
-	platform_driver_unregister(&slimpro_mbox_driver);
-}
-
-subsys_initcall(slimpro_mbox_init);
-module_exit(slimpro_mbox_exit);
+subsys_platform_driver(slimpro_mbox_driver);
 
 MODULE_DESCRIPTION("APM X-Gene SLIMpro Mailbox Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 96462ca84471..262832753fa5 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -875,18 +875,7 @@ static struct platform_driver cmdq_drv = {
 	}
 };
 
-static int __init cmdq_drv_init(void)
-{
-	return platform_driver_register(&cmdq_drv);
-}
-
-static void __exit cmdq_drv_exit(void)
-{
-	platform_driver_unregister(&cmdq_drv);
-}
-
-subsys_initcall(cmdq_drv_init);
-module_exit(cmdq_drv_exit);
+subsys_platform_driver(cmdq_drv);
 
 MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) Mailbox driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 42d2583e44ca..f2a082f2dc7e 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -1023,17 +1023,7 @@ static struct platform_driver zynqmp_ipi_driver = {
 	},
 };
 
-static int __init zynqmp_ipi_init(void)
-{
-	return platform_driver_register(&zynqmp_ipi_driver);
-}
-subsys_initcall(zynqmp_ipi_init);
-
-static void __exit zynqmp_ipi_exit(void)
-{
-	platform_driver_unregister(&zynqmp_ipi_driver);
-}
-module_exit(zynqmp_ipi_exit);
+subsys_platform_driver(zynqmp_ipi_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Xilinx ZynqMP IPI Mailbox driver");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-mailbox-subsys-9ddd537d3eec

Best regards,
--  
Brian Masney <bmasney@redhat.com>

