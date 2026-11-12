Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445839;
	b=rpz145RuTZLxVlpqmipeRRETSFhHX7AB4wXWeW6kBp9Nicb6BQ7DJDWcBilpaJfpt6rv
	 WyJKFVBnRX1XEu4zicuP8Q/whcYJBBckAl0X0kDR6vEJJn20GECPbU0BZ+F/s2WczBQu+
	 +bRy29pdJbuj+EnhXoMwadVf9sNUhaCvc8D1c4IO9pwQerJPt63maYl2v22xbxumNs58H
	 FrG3G/GTgvt/Szf5cyxXfRz0usFXZ7GQ5vj2PqTgggyczLaJoLPSF68AHi1Y4PNra61WD
	 sQU6gms9u39bDEbED8O9RPe9K+b9dam4Aj+IzokLUth88aJPLtMgES1S9TlKuYki+9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
	b=TOgJ3Bj1r062YDZpveW3Q31o31Tld4u2OW955syxBsRdMarMoxC7NWm9Ev9h69ibrPdp
	 +W9T5yGaNZIJ6YRt3Uru2j9htRKVX9meskQsJL5Z9aw7CR34Zu6NYhG66ygY1nyOjLaRB
	 1Kwuzc67COPPHCSn9QMOOTni9YvC0IkoHprH6BQ1yoalTNBWZW8ywhKw3vwPgHEuIDDXj
	 snSVGZXXdkbWGcDB+McvjcXMSRSkRAjjr+GT0Rj+NCd2G4uCoZ8ASIUMuDYUFIRD0w1Ck
	 +YoQn+H1IXeyE+ZwHU3m/z+tlo1aFeyS4WCVk4Nk/rJ80rYzySJnQnns+PYA7z91UFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPhiae9V;
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D4606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064D4606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPhiae9V
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-67bdda532c4so1568286d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794445838; x=1795050638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
        b=FPhiae9VhKky2ggLWcSUiklrtrMVy4pLyo9qcbzdaN6JNm7714vgYkniAB02pDuERk
         1lVRk8xAp8AggRKi33PiQACUETWTAgQCTOR/aZCIoL1zGyhQwd27UZIBL1K2j0d+F5nN
         6iekq6nsQzAnH63Lht29vTAOi/YeBn0Asj0FFQ7BPDJpfzrQkrtIUpIHZTeZEmvlkDAq
         9DZ47/k5E5N5oUWEiXPVY7HfUquRC5xRaQoidNygGyRm/YBbGiaM0rWg98ewAa3LpD/0
         ez01sr+kmFSvEARX9Zby/jrizzeX+T667tgIZcsqVWsQgqPzveH/wXlfhQaW08b48Gp3
         XC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445838; x=1795050638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gm2pXlyoDZjy2jUYL1gRIjcpASld1ugjhk6MsltZUAM=;
        b=FQY0AaUppnshJUeR9zP7UY9n86/lVdcdcmuD/jHqH6Ljmv6DwbfuNCGUfDPSdIbx/t
         mvOr1096cDx2R4QT5GT1AL1nGD6n8cd04Mcdm9T0BfKjO/GUPeFcRYQtJILAXt5r7o1c
         G5aAsRA9tF8tnaJ7wUmMUF4i4JJ92IbLdhsDnbnr7XEP6atd2h+4NN130BaQp6iWgjxN
         CeVr7sVmQpLyAOjHLMhcVKP1a2DWol7uIPdrrNbg4WPljp+D7elR2NfIWDD7QI1ZRfF3
         KgLqGQydVvaNjgl9jVMY0WGMfPkkMYZSeVjAEzArpNeC/VP6E+bpsyuKGtRlbW65/oMD
         14Ww==
X-Forwarded-Encrypted: i=1; AL+hErGu6LqNJsPvjARqJzTPde26boJ/N6Kmv7yglF6HYRKDzNklq/Otz3+6qrud1/AEw+VB7AoiIm/dQ6XtKR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yA8p1GXr3gSA1QaI4NExaDP2idHAm2YHcatt0vnLh54s49aLU
	5YEAugGq6uKcdPStaoZjVLQZnPQT6uIdfF5YEaE3+YTh3ILY/8sIywgs
X-Gm-Gg: AYBFou3VOU4TGsPuYret69t++gAIwA6eaaxWYyOitvWzK/SztDbJGj8mahClrdx3dSF
	JJES/7E/mzd9FVnSqj7XPQDuhUUQ1u1LBCNqpLTK+tguV03lMEuPZQKP3qw/vXvcMb5IYHzLPWE
	vAT0dCtFOm6XqvkrMT8RSUv0RPVjuBcgDRamJLZVq7NCUvbA/+eMrvVRf/EjkPeYraG5Wd1ln1z
	ribFOTyN5PrvTBi2EEJrIRTjy66QPSJkR3qvPmrHUN42UxS0GbPC0juarDD+BhxXfmd4UxnLu1G
	lCIHg6qoLmmTdwLF2wdwpcHEZtQg9wMfZgb49sH2BSnTZi9KKPqOfYS5W65Znv4daAZDl02/QWG
	y80p5q06qNUqxW2S4F02X2nx3pHPP5IFSJWn7oxGshMjh4lmnoP3QRtDy6NRUknJ6KZvmR30DES
	3NQeaoWQNor2/IdZ2YDs03oZXbXLGXhWR6b6jArBFubLGrWCK3r/bmu/KCdaP8gMeAB3DJySyi8
	e3Vz2HkcwUl3uN9byoyV777t7C9m/vDk3POXNQOad3PAG00Aibpoopjq+vaWm6/pW7MYlwsUaWJ
	+LChfNDbtmbckfWRbpvD5Z7+2eUGJB3tnndFqN8Wjw==
X-Received: by 2002:a05:690c:39c:b0:8a9:cdd:faa with SMTP id 00721157ae682-8b3a81dc415mr23588437b3.93.1794445837938;
        Wed, 11 Nov 2026 17:10:37 -0800 (PST)
Received: from athenadria-developer.attlocal.net ([2600:1700:1350:96b0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c6e207adcsm2591300d50.15.2026.11.11.17.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:10:37 -0800 (PST)
From: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Subject: [PATCH] staging: media: atomisp: Remove unneeded return statements in irq.c
Date: Wed, 11 Nov 2026 19:10:25 -0600
Message-ID: <20261112011025.101375-1-hmjm081106@gmail.com>
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
Content-Transfer-Encoding: 8bit

Remove the bare return statements at the end of void functions, along
with the blank lines before them. They have no effect and checkpatch.pl
warns about them:

  WARNING: void function return statements are not generally useful

Signed-off-by: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea386361a..6ca8fcd61b36 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -60,7 +60,6 @@ void irq_clear_all(
 
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, mask);
-	return;
 }
 
 /*
@@ -104,8 +103,6 @@ void irq_enable_channel(
 		      _HRT_IRQ_CONTROLLER_MASK_REG_IDX, mask);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 void irq_enable_pulse(
@@ -120,7 +117,6 @@ void irq_enable_pulse(
 	/* output is given as edge, not pulse */
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_EDGE_NOT_PULSE_REG_IDX, edge_out);
-	return;
 }
 
 void irq_disable_channel(
@@ -150,8 +146,6 @@ void irq_disable_channel(
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, me);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status irq_get_channel_id(
@@ -212,7 +206,6 @@ void irq_raise(
 			    (unsigned int)addr, 1);
 	gp_device_reg_store(GP_DEVICE0_ID,
 			    (unsigned int)addr, 0);
-	return;
 }
 
 bool any_virq_signal(void)
@@ -251,7 +244,6 @@ void cnd_virq_enable_channel(
 			irq_disable_channel(IRQ0_ID, IRQ_NESTING_ID[ID]);
 		}
 	}
-	return;
 }
 
 void virq_clear_all(void)
@@ -260,8 +252,6 @@ void virq_clear_all(void)
 
 	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++)
 		irq_clear_all(irq_id);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status
@@ -302,8 +292,6 @@ void virq_clear_info(struct virq_info *irq_info)
 
 	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++)
 		irq_info->irq_status_reg[ID] = 0;
-
-	return;
 }
 
 enum hrt_isp_css_irq_status virq_get_channel_id(
-- 
2.56.0

