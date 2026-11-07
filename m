Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010731;
	b=Y4hoB460tjn8U8E/twr1pWxbX5FRdtnLv0Og2y++uU5Q9TFV1VvXPXLpPvi8zZr/SH6N
	 lVjdCSQihNuEDP4HH6vmw6TDwBq4yJwnVNlPXeANcBGBv4hWSQhGSlSxauiqjfKFjmnGQ
	 EjlTMuB/UwewNOY+oDH71kJcq7CZgrcSmiBcS/nXZyfIL60Fzi2jS4iyAP4czuVl6WyCX
	 pApviuzxRfYZFXIH0uFdJkVF2Hq15FDugytEugWFCS8cXZFie8xJzC1/APKMsE5EGEAof
	 44ItPxx0GmT+jJbj/ZLFlkroO//4nby1zxJyW2PHJ6pQHtW2e8FtoXuaABXUedL5yFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010731;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ErxVFob8NVBa8wQUtDLP+IjPTrx/b6Ac6bmO5if6hHw=;
	b=ABXPx7/VP7z1M+ESishBAnW/8LbK4OWdRZy9gr3V/z00P4PikuRx0BbFy2V4imsXL+8C
	 F9nn0EUf8o5HOGTZAH0sbTEF8cnm5LUMSNpWp8cFeSxAEOBl6t5G6KfH0YTR+oBJh1QNT
	 1AViWVqU+GCaGFwyp3S+wIZnZupwjdJCEjk/IXj/Is9zwYVAZgK5zueEvBiJm2DvEd1Zj
	 egowT4DiBq0vk8xtOwRy0NLVMBUO+Q8toC21Whw1xKgORL9Kmrt0DlKOD0L1nKat9kMse
	 YjfFlPevIenWJ/mXD8OjsVZ51pvzmkN3/7IjM3iL9fOMOgMIirPALUdO5tg8/AY3T3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQpVlCZC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kB9LTx4F;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CEB606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CEB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQpVlCZC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kB9LTx4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ErxVFob8NVBa8wQUtDLP+IjPTrx/b6Ac6bmO5if6hHw=;
	b=gQpVlCZCWXb2a/1cAYEEDo2vroggKQuYSjYUPAhZc+pZ/voesYQ6uSb1cRBSPsdsCcujoN
	oZypbCRcX8ExdWDVPCw3asss3hH3y6AcA49s3HtHQ8sZS0l7N227zXoV9LIdGd6wR8bhLY
	f/xrp1759tljXcZjG/sLur1I0cmZKv8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-MSb3fTQjM2qanfgtIfRASA-1; Fri, 06 Nov 2026 19:18:48 -0500
X-MC-Unique: MSb3fTQjM2qanfgtIfRASA-1
X-Mimecast-MFC-AGG-ID: MSb3fTQjM2qanfgtIfRASA_1794010728
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b937ecbb4so23712086d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010728; x=1794615528; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ErxVFob8NVBa8wQUtDLP+IjPTrx/b6Ac6bmO5if6hHw=;
        b=kB9LTx4FRvjlg0Fjh86oAu1WuAO/voVb2Yn+sBAd938lMJgh5geHsJQ4Lb+TvTebC4
         rN8skt/MuzbTdkjrnbCla98F15NvZglEU4vBKapPYWkQ+JIde1dN6gNb4xK4EKC3fYeA
         16UmFJ8gFAb9C8y2jSEtqhRo5kaO9xMtjJPuIyRY09XBzl5ZSUeb6hAFkqMPWZBK8Gtp
         sI8LaAPTBsOQFKrC3oXbsdkfSETsQuNejC+cNRsqu7VDbZi+nYYirMjlY53f+mgYX1RM
         1Na96HZqFUgLghIGooTBHkkBGjr/HYhSg5W2UtLUa9emBiG820993ubDxaZeSPWNEAPs
         YxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010728; x=1794615528;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ErxVFob8NVBa8wQUtDLP+IjPTrx/b6Ac6bmO5if6hHw=;
        b=VH0TpnV3CSxSv05XDmtXEbhC8MiLcNMAZlpGAWLTqdOCFnzFGJG0Ns8E+SbY4ZCrum
         LvQ5BzjDnfAKae/PdiHdknd4LL7VOevTBIRXJXUZf8DZ/adG3qhiz045Zmy59NKvILwg
         ISy8oPiP/YtYeAcUodeM2uYMeLiLezBw1cL3su+a4jietMVhExA7H1C1IUHGXUJmew/s
         2P1VfdxEp1Q3/3uLwM15zmsfktI7wgeyNiFaevAZ2WhfPXFbrSqUY+or51wUwko531YB
         Z8lWVlP23y97nJTwU70PUehv7guQCr+5vKnRbiIFDUDgHnWZOeZKxXKRyp49s3BWl+wP
         esLw==
X-Forwarded-Encrypted: i=1; AKwUvBwQkd4pCpOEQfWVxS3BYxMDLf9CS5LDb0ylgdvLQoPqUZY0xwx872qw4obk4p2Kco434dis6y9fwOoHPL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yAwEvdkokQrI252oChLaK4/8sxbJwtjQUMJDu+bztupTq4OuQ
	e0AKz6lyVkOdFiFJhaFGSrY3KjsW7Y8P6S65xRs8V39RkFa88QMqdm1JnKsrjVdcumuLrMtB1KW
	IaM3pCWGZcwnu5HUpyoRcX7KQV6N2vVlp1rbPG2a3qti3DuXcIOYFrHr8KnHKzQZ5aA==
X-Gm-Gg: AYBFou2xu8E5uewewpbplWwbeMjB59cDqW0+j8DW4BlTyK22VbjQ33KiZH52Kbnaoaw
	c//Bju0Qi2WQd23DwIrm86/OJStlbUDyk9sqq77FoipEAxjwGMcqR74Bf6CXOZRN4eEsxijN6Fi
	lECIfHXFiS2DMjiK68axS+fB9/OULSty8RUoxO8CMkzv6fEna1VGsgfSapzeXzswUD1wzT0XK1R
	sGP5/VcPLbY5ChvH0MlcVm5dNWc/XOW/luyUQ+dZgqkcktsXPXNGAXnysGaW7iK9+En3TzBWGQB
	hl6GdACcQjcFaksmFhjvlKgAYduKfltoTzayAlENcfUWzEHl68I1VGWxXjDxopuP7BLgngfb3AH
	LI2urT/zdlI9XBifmWFWgmZLUt3mt3Ru6NvmcVuyD0RNQQoU42i2bmjhABD43nva18bdSxEPs0C
	tzjg5rp3hSRxQCNPyF
X-Received: by 2002:a05:622a:1b22:b0:535:232f:ca25 with SMTP id d75a77b69052e-54e100e583emr65111341cf.7.1794010727671;
        Fri, 06 Nov 2026 16:18:47 -0800 (PST)
X-Received: by 2002:a05:622a:1b22:b0:535:232f:ca25 with SMTP id d75a77b69052e-54e100e583emr65111031cf.7.1794010727151;
        Fri, 06 Nov 2026 16:18:47 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e26b27a45sm32610361cf.22.2026.11.06.16.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:18:45 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:18:35 -0500
Subject: [PATCH] media: davinci/vpif.c: convert to subsys_platform_driver()
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
Message-Id: <20261106-media-subsys-v1-1-0b5d3d5ca71a@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWtiKAuvIhbVDkbikg5CxLsrl
 l9yzn+BkGcSKKMLPO0sPE8BGEdgezN1pNgFQ5qkBWJSqJEcGyVbI6cohzkabfNM6wbCZfHU8vH
 lqvp3WA5k17cB9/0Ac22ngHAAAAA=
X-Change-ID: 20261106-media-subsys-d151a4c5344b
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=rU9J7t1ikbpEBkofPfFfsm/l3KTCXyS4+WAhXWeiVPQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5SXMd5a/OKdu0o9XSx9+j5vc8YbteIdfkb3wmwf9N
 katy3Ofd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR6c+MDFv8cv/VGyr9kvlx
 t+rAyhvdhr8qJbfrTZ4ofnPS5yCHjwsZ/rszNIRNnLLnjk15owCXLPdhvQp/fdfqtilsUj8OMNV
 1MQMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/platform/ti/davinci/vpif.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
index cc0b0b8cdb89..0deb91b7fb9d 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -595,15 +595,5 @@ static struct platform_driver vpif_driver = {
 	.probe = vpif_probe,
 };
 
-static void vpif_exit(void)
-{
-	platform_driver_unregister(&vpif_driver);
-}
-
-static int __init vpif_init(void)
-{
-	return platform_driver_register(&vpif_driver);
-}
-subsys_initcall(vpif_init);
-module_exit(vpif_exit);
+subsys_platform_driver(vpif_driver);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-media-subsys-d151a4c5344b

Best regards,
--  
Brian Masney <bmasney@redhat.com>

