Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011141;
	b=rwvAy3Wi3ugHI9b/XCRFEN2MtU5h7xh97kza5Z2K0KwBlt/80zV7kBRW3H9luqZXTWRU
	 u1+USUzDIhhEweAAM2k0bGtECWYmSL1G8G91LmXXP73aiXoroEJVqWlPXIrLrIwS7/K/R
	 qcgEKavKvjY/dro1fh/nlCEsgn41dT44ygSY7B1I8jErLVFlydhrXTQMm/wUveqVR0E9k
	 uqZeqbyQtcWmANRtglWNKgN29zDPje/KdzvGgYo2RMgyO+82JlN7mKHV78cflYoOss/MQ
	 UR9oyntRtAra1zVXcfo2EhqD4zPE620p3C0Zj2ACLnlIBD3h76E461nezGdxSGsklUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011141;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cg9pFndiAQ2c3E3VGmGq+B5hFIactzj03FyWxZNckcc=;
	b=i1gMZwa021KUJCCiPH2jxnVKbN2AY6Ubp6kxZo3mk5PCQs1kmeW1Lun3a+M51V0UAH3c
	 hwnveNXeb/xLwgqX2ehas0YAkr0hsjYLADSEbOiYWmlZH27Jq6i7UXIMpaFOSYLGRP3wP
	 cOCbWbTJtzeoCHz/g5TlqSoXrztiV7titfc6W/nRGqdaGZCyu0EiNtclEdYM2vvBfZg6N
	 kW2BEdzxZIcAmYv7xok64MrJtcuMK7my/EomikERpocCdQg4xo3K34k5QmzIHjVniz3OM
	 0HfOzaAUA7oOH7ZWKTzdPWRefiazSUz47VavYtL9+waE0HoMt+4Zs4reWQGL1ZJkAYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="E1ulno/0";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IC4FofNJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C41606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C41606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E1ulno/0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IC4FofNJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cg9pFndiAQ2c3E3VGmGq+B5hFIactzj03FyWxZNckcc=;
	b=E1ulno/0MAXz0zUCh8mjcWzFOTjLfBQukvH38aUnCsPWHzb5/SnlTxDPXnxbkLOvVM37pW
	mnCWoLxrNTbYnogMhHvl7dpkOqgYAb7IlEFEiafFwbbe25Xux8kHxKlSkeKdhmsK2KvFFV
	+U5AUP859KkcEqPkZNTkfAliTRtbTnw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-y_wlGGuiPwaYcBn0ENwHsA-1; Fri, 06 Nov 2026 19:25:38 -0500
X-MC-Unique: y_wlGGuiPwaYcBn0ENwHsA-1
X-Mimecast-MFC-AGG-ID: y_wlGGuiPwaYcBn0ENwHsA_1794011138
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so279815485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011138; x=1794615938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cg9pFndiAQ2c3E3VGmGq+B5hFIactzj03FyWxZNckcc=;
        b=IC4FofNJxzmljsIAPVXNin7VXR8pEWLB5cdC9bm0XPYLr4XlFN9LYtiD6Iv7J9ni2k
         X0dJI8BZ2KLyPlH5hAe7vH9NEvRJjBIq6aAConoVChZLfeZioTkOHndDksUHZEhWLLhq
         7GivJvh2XHIW4U71hmWwGEeEbVJELhsx208AjhyO7dXlCLsfkN+BlGXF0YU1XhW6pN5A
         cUes3YohKeMqA1HgPZvqX0pPEpztCQgSeFXJPw4TNJo/CNOsfovaR5OfYhnkCr+WO+Bx
         Ev9jJzS5bKuVd0gsTZQtwIY3cmi4oD+gRi9jDSylhhwS4zReXpe4d9CJio3vJa0tnb38
         tCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011138; x=1794615938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cg9pFndiAQ2c3E3VGmGq+B5hFIactzj03FyWxZNckcc=;
        b=JyDOBGLcSXxN4K8u9yqYdLdKsU+m3tYVWBN2sOsxYTqot2qxhBT0ty9nO7XkvImGAC
         HiaSqmdR6ZyHCJpPwsKpiF532jrv/cO8U80S7cweWVK81kYbHCAyIuuf7T/GrKuh/Clh
         t3qg/gElSn88RQ5JhkLdqlwKSC08luWo+tqtiEzAp0q/XOFL/DAz4+ssXetI/jVZfrbR
         IFXeUXzjlUeULX85RwElVSWpfFuV8xu9jq3Q71q5rG9LKXIt0p4PN7OncMruUjHTxA1+
         9Su+a/otI8tExumoJnUljs/EO3qMEyyGyd23MlKJx4zeCW2c0MpqezR/J4IUf6wSqmN8
         dRVQ==
X-Forwarded-Encrypted: i=1; AKwUvBysAoy6Fm3Btj38Ah8NgRGu4UP+3X7UtACLakoPUQpVMBMt5XZQriQXVH1N7cQvWNfjO8NfAHzVn5O2PF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v8rgDEzW51Cwg/FZglIwcuKQlkyf/5VXIcnZIJmjk8aIgaX2/
	f2MHWGMP0N04W14NB/Fp7KZ8+fFf/THWgwJymJy42fWQ4q21ORxewS/XgQO5V3dqPI/0fciil22
	vhogEnJwLBDJFeKobe0Q/inTBDJQXZqwRHxHOSlO3pHnBBiLKSHDM/ScZeBxfRBAZ3w==
X-Gm-Gg: AYBFou21Igk6HOakT91x5gEcSu1FySW25sSZWLGmew5aoQNbLzJZ1O0Ph0uhM26eMyx
	WuSAYZEHvPYcy80rlY1NAojepteSRbEHKTFDsjRvaoYamkFidOCMeL0XOAGCi2ImamftSSZ/QZI
	lLyyuIscPiGnp+8YYo6Ys/XcY34aFWqICl1uCfs+dozosPO5t7O6uEI93krKuRmnjJNKFH+4He8
	6x7Ym5fF5N/onTERB0ppSNtA4ouG8Hxc+T9TxsROhB/xTrAgODlCjrurYNxJcvMQfYMqSVNVPBS
	1zJ0dgqJkeKNkVqy9ML4UbBW3xoImltHtJWmzWNzpTBW4MqEcMunCGG3M2rXp0H2JZOpasXzVbO
	cK/B7Os02Wjbb/nOBPfnvALS/dwZiCawxwZaSIkOr/tjT3cgS05P+WdlwnnXlwEnwCcAsfwAAP5
	XNS/boY0Cx9ORIqF89
X-Received: by 2002:a05:620a:414b:b0:940:f224:5a70 with SMTP id af79cd13be357-945f362ec8dmr668083185a.72.1794011137497;
        Fri, 06 Nov 2026 16:25:37 -0800 (PST)
X-Received: by 2002:a05:620a:414b:b0:940:f224:5a70 with SMTP id af79cd13be357-945f362ec8dmr668080185a.72.1794011137017;
        Fri, 06 Nov 2026 16:25:37 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6ab543csm32089856d6.39.2026.11.06.16.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:25:36 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:25:20 -0500
Subject: [PATCH 1/2] phy: ti: omap-control: convert to
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
Message-Id: <20261106-phy-subsys-v1-1-9a443422e563@redhat.com>
References: <20261106-phy-subsys-v1-0-9a443422e563@redhat.com>
In-Reply-To: <20261106-phy-subsys-v1-0-9a443422e563@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=lQFgVtCGl8A4/MEJxmwBSoolju9xUsS+nYB3gk5iu1Y=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5f92P9xRvnqXvmvGY4lpy9fEnG9ha2A5YVP/xY5jB
 8ODdp/VHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkjTXDf487H5qm/Q4O5Awy
 6nr7LdT8x6FcjmOHDxx+8Zz53fU5jIsYGZofn9rO4cI4ec7Msi8SMhs+ThbvNtX4zmhx19cw8Ex
 iKxMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/ti/phy-omap-control.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/ti/phy-omap-control.c b/drivers/phy/ti/phy-omap-control.c
index 4968434312f8..3747401600a6 100644
--- a/drivers/phy/ti/phy-omap-control.c
+++ b/drivers/phy/ti/phy-omap-control.c
@@ -322,17 +322,7 @@ static struct platform_driver omap_control_phy_driver = {
 	},
 };
 
-static int __init omap_control_phy_init(void)
-{
-	return platform_driver_register(&omap_control_phy_driver);
-}
-subsys_initcall(omap_control_phy_init);
-
-static void __exit omap_control_phy_exit(void)
-{
-	platform_driver_unregister(&omap_control_phy_driver);
-}
-module_exit(omap_control_phy_exit);
+subsys_platform_driver(omap_control_phy_driver);
 
 MODULE_AUTHOR("Texas Instruments Inc.");
 MODULE_DESCRIPTION("OMAP Control Module PHY Driver");

-- 
2.56.0

