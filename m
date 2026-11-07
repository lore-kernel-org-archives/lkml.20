Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010005;
	b=KLUOvH0UyjQLpXtrbUcXiX0czgsSHrCKR1JzatvuChURzYh5V2Cn+eNdrP4FglU0SKub
	 i+Di0+Ko0bbIPm+ZDBOLIctxeAq+DVAGeVQFStEe7v9lWI9BFsWte/9DLOHRdjwA3pTKK
	 rUBwn5hc1haxVLXE3p3/rPSGjsTP8pbUI8KCzv3nAUXd5W7soycIdAdxFh0Z+WC1wZs1F
	 TDMuBTEwUX/IDdE+CUZ+T9LDvyyPy1c2Y2sYHy0pVxWfTwfQUtDz2F+a0fVQSwxQvKGlr
	 9q6CF9/d1U0aXsb2FZW8p8IL5K+8RAw/01ndOHX6f5LQSbveHP4TdxNTIf4gPT24DBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010005;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=1FOxgxrm2sD2mVyTHQUKwu+igGobYh48RMjtM89HnjoLG2pRi6y4TM8g8XG201BHOvA+
	 hcZutJqTogaFH5YJz2aUyp/9y5WOAxGy4ErPmd60nTJZ3RlD/Mz2l6mnKsLRFmKnABjCy
	 ZjFMrKgrHYgodcFNOZaoSgCrz+Dr2Z/tR5YqAnliknLA7DlnOqYX6LT5wAyiP/Q5PihaB
	 ObV64GmfZbgdCNInckOc5eUm9wSujYrAtkCp5X+vI0jdeDWMuc/sg4Bq9t2rJQX6qveyW
	 NDnYoQ0eTwBoZfSft+pWXw8oTHdqtthT6Un+82efp10L7e45xWdmPR1ixK1TTSEVtbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QaItErdm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB8606D803
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFB8606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QaItErdm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=eRwlbATGuePqRoUfDSZ9qs0RrDdYZ+KAJ7W8YOSwyruxWr6QSwtuhfpmSEKbs0RkuvS3tq
	nDRF7ibxDb2QRowCIcx4fyeXiTxtwfid4l4jQyVnUyDmgMfNi5M3QTGt59FIsuMAveEHIT
	gklSeZm9ZhWhFE3Jsw4LD7nznNwoFKE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-Ufsc6iffO4eszZflAZY-hA-1; Fri, 06 Nov 2026 19:06:43 -0500
X-MC-Unique: Ufsc6iffO4eszZflAZY-hA-1
X-Mimecast-MFC-AGG-ID: Ufsc6iffO4eszZflAZY-hA_1794010002
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c046843f1so28101566d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010002; x=1794614802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=QaItErdmqNV9RHrJfk1jyRqVWmy8RPzwOr7/Gtt6w2WUgRRJ6D0jInjmF5bCO3A7AK
         FR3SVFDmlMjislejJMo/Ar10alCPHZEt2I8tyH2fn1GhkYTU8kW9oh8J1iyffzPKMiYZ
         wylVm2eqyZLnRSPbiXmrQsX7EuqfZI89sCkv0aXfetBOr6S8r0FrtWWER2kcOpgac6Wm
         Iv1NN56YIdQ2ABVw+xx6zF7IfZsGq4rodUcM+kHHpmNwEgFmAlcImhz2wIqnksbEtRq/
         z+O2OzBY7HH3iPr/MQF0JKQWyy0/UoPnofXD/0eYC/NfyziFx6u0BH8ubf3Yh8qNWVU4
         /Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010002; x=1794614802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=f4VTAsm7zG7D/ggwMDoPl2qp8afF9ci5u3F0rxl78B5b8FZMuT3jR3Esk3T/yMrLLC
         6cgzTMtg7BD0zCXclup8P6kYIXu76hfcelZDbNUIr0z5DCMVZC6eoLQAqvyuRm/qCEIZ
         13NwOVab/U7faS11I5eYFic6Dau7ilmNe+eM1XeP2bjOANU8X0mKtYHaBP99LGsZzQgp
         8gmyyLxJgDAFlcYUboFz0ME+GOfGaIgdT4kmKR9XeS5DWjU8zXiZqiFs+uUzrjSDzwaS
         adIVKik0Kl686SWTu6LXFS6dQuAg7thIGxg7zL3xn3wHWfhZZHQqMI3WqCVaXCzyuEH/
         H36Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBZNJRkxEVUsf0B8/ump4RVHVgB4T5sjKiV8SAXg0d/7GLm0v8lX7D7hZCKjZuBXw233ziErdFmlsW2Cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bQ3KvEtunDX6dP8ET36JX8os3DLTxL8nCSI31+GvKqI5EGOYZ
	GzaR93JFFDpQwoHUAmmFyUv9ZcfY/Z4FyKgT3Ioxo2xtfM7GzKU0DK5Q9Nbr4o+sgAgD/f50a+w
	1M+k5coley1KUWAmor6MIXmuzUyGSx6J8qffOpGe3fd2HhYblPj+HJkctJwW/WhNAmw==
X-Gm-Gg: AYBFou1IEkwY0DdZbB6seV1rvwXkjg5XjrcI0TaEWep2eL1nkR6zURBcq5PrkEewsLK
	YpPLducsHg3al0IvRrZRBuYJcn1wSF3bFpeVsU325dzBYKJ2/rp60R0z0/qH8c27SgZ3EgnotsO
	iswtS3qlNx7trvYvLtT2MAWLtnwGgvt3ymOQewuSR/IhOReZTTatMJ1Jb/LRlYnw1CA1JQCfMf2
	lKEkQhgprRIqfMivb3lUh0O/qNneo09z7Tp9Y4JmyMJKNi7eZK3b0p7dW7uco47WLksApLnhXER
	Nf68Hf8Ihn5pKvH2MR3Nz4iwVxp8HF0SG+ANMF9xnZTr5ou3ztQJ+H+4ghC5wU1PzqcMvsxk8nI
	f+qKRITw/WPHbzIzUURvDiBYL0Ey282zCHetXovU4lnV9srK/X6MI1oFB17pUni9o9zfgVe5BFU
	NZdrZSLld+hIq9iTCN
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704445485a.40.1794010002562;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704441785a.40.1794010002132;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:09 -0500
Subject: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
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
Message-Id: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FjTOp1M8Xy8WBCnxDwFzONX6zQMkkI1R2AYzFx+nwrU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbdoi/pLp60VjjwvcUxslVrirb5DV/utktpvPDq5W
 Wn/wb71HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykdQkjw6JqyU0+3VVfSzWl
 u41X9l86OG0B89PfCwV8v3te0lN3YmD4K1PKxrDgtUqx6oLWQ+/ii6VYfpw6XSt0c6OA5Me1z50
 zWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/imx-dma.c   | 6 +-----
 drivers/dma/ste_dma40.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..8e0e82df8c5b 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -1238,11 +1238,7 @@ static struct platform_driver imxdma_driver = {
 	.remove		= imxdma_remove,
 };
 
-static int __init imxdma_module_init(void)
-{
-	return platform_driver_probe(&imxdma_driver, imxdma_probe);
-}
-subsys_initcall(imxdma_module_init);
+subsys_platform_driver_probe(imxdma_driver, imxdma_probe);
 
 MODULE_AUTHOR("Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>");
 MODULE_DESCRIPTION("i.MX dma driver");
diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 2e83503f71d1..4fb54c8f2d23 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3990,8 +3990,4 @@ static struct platform_driver d40_driver = {
 	},
 };
 
-static int __init stedma40_init(void)
-{
-	return platform_driver_probe(&d40_driver, d40_probe);
-}
-subsys_initcall(stedma40_init);
+subsys_platform_driver_probe(d40_driver, d40_probe);

-- 
2.56.0

