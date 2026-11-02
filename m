Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639778;
	b=SNqLZrkhlgwKr7fal0L81gSY6D+XegHVElXRrsbnkUpIZPgIZceFZwNHDxutD3UZEsCD
	 7Z9CdGgwSP0bjGjpi+BjkHINcKCV0Wlmo1sn1XRmwxqCMDL/DS6tDcncUWRPm8N9+IuGK
	 1AWQ3ZsmIQhj+6kqMmTxCcTKYdI22CARuUwbsM68rJmCXMfmj2VmN0r/2lOVh1CK5j5B0
	 rsCuJGh9ybf+4l6D5xWfYtBfJOpDRnqXXyuEY8sLCcaTHHt54XTBWZe7Z4O9mbEOSX/OY
	 xeP0YJS0l/5I0nTf5q3vRI+XZ992hjIDmPNGxP0AjY31qFsZjRwjevHd67Vqh42FgbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y64Q+8Q1ZhpnOCPcIn/HkC4IMP55Z2r9DID6/cPOxcY=;
	b=ova2Cj7BQeHH2N0DuAlx980rPS1gxJShf0Q93ltUDSr0EsNtb/EQXmYLBTMTT+FjNNks
	 7ZnBNayivn49DbhdIiEa/GmkHnCllYo1wAPFCJqiUzFqtB1sMhizvve1oNTgGPvQytP12
	 IRJGfrIYRzdbY8X9gYKFYCHlOzESOtjjByk7hmAgS1RGBvY60UmHkRm1L4MBrGjKKkB//
	 DHZH8zzOTLOyf6IaJrsl/QN+uQ3Qg7Y4E375pRoUlCvL9c67SfwOx1mqvr8kOxiE2yFUj
	 9M5w5xqoB3UemPaoz+4DkQ98eZ28xwHY42Sxkg3AF909aaz0r5k+ODrGHlcLg/9wVMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VOGnZa9H;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E8C606A934
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E8C606A934
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VOGnZa9H
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so29356715e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639776; x=1794244576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y64Q+8Q1ZhpnOCPcIn/HkC4IMP55Z2r9DID6/cPOxcY=;
        b=VOGnZa9HYa09YdmhXZF/uGcbNC2VXZbbSWjQPgoxhmHFQOVTLqsQAuoTQEWeTIrgI6
         adz0jqM8ZYQpoIpFJrPOvTVSoR2361QfYz4wHNS4V53JODd4HT/eWK2E/j3rJLAATv1s
         mQgb6FV+BVlvEZmNo+R0Hbs8V7Q4Z2DbuIuxYKOh8pn+osDGkSoYE5QXH5SvTtGTV1Bm
         rBrN6anGxSAYR9B4dC06KKYSViICVYNRKXKtSTPunATCoBJzYJYQmIbJgP5taNBcD5Hr
         4EiKmJaZvP3WkYaxOn36Cc5R+2Itx2sB1BFgAK3KH9mlXRzOAuIaTWf5Ng8bC6xbfgG9
         +IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639776; x=1794244576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y64Q+8Q1ZhpnOCPcIn/HkC4IMP55Z2r9DID6/cPOxcY=;
        b=Xl+sJr9Ioz63bXUQR25VDUoOag8RZbLRvDBPVrjqUBPTrenJsj57V5dg2nKFE5DaTy
         qXz9oMyDBTBQurpmFoM3IZGpbmISTfvrC8dhXh8A+PzmGFp0YopgYL4rr++k7ezPtiNx
         d72Nh8QXRcghOxNbHvR+EHHRu4JVH3UPrIvfkA1xnRtPC16ZZSewN0Nm/uVcyPDxu1gV
         xXv6ML7xY9ccEwDOO9plOsRzvw+wTXqRA8aU8qpYW/Xd6+3nNuSeDFEl7J4TDHBPjggY
         T5dzweYkjpFy0BemGEg04jBpcLAjFvlExmhkeyuUzG6IZHJ9u/ByP3tdNbjvbtqlrRYG
         40Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwbsx8FAaZM5BIwX8mXFp792/y6wpSiZYYRi+mPMEWkOuCwYbe5mcgFD7o64Dtofi6crwq71jcTaXLn/Rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzEo+SLZnATyT4PCjbArCc4hPIy4wBGt17Qg7/9/doGZ/6m55p
	UahZe66NbmVb8W15FtBO36tks0PxpgUAJMoVJwmuLVBPmoOSp69PtGKr+1ycCLL1Yuteew==
X-Gm-Gg: AYBFou0ZhdqAH26que4ntDFY3Vtkf5kNpwQP0vRs+Zfy8gYkEF6JmVtnTwMI0IDIBLb
	VGvoVv9uRTPCsd/RzESfZ6l2hkNbMvgH4ulEMgCJy4nsvUN7ykpU1vBWD9O/QNN9blpHrbdZWyz
	ZOB0DbsdWylcMPbzr6wKIJYE9R8QU/Cng+8n/Gjuf0mk3RdXrraVMR56YpBPhdnuRsnnm0mUS2Q
	kVtpx41KRLJ3F4feZhnyqTjBqyarrcxNSGaDAfU/iMLMOFT/xBVjbe6fhVDLJy/WOQzOACBwK1e
	0cNEN7z0PbuEtntKrFn8gwoVdLRZlNTI4qWo9EVkfWfjfOUlf+4tcKLkvfj6sKYEPv6vpfaSFbP
	6dCX4Q3NmcElc4snAQT/aCzetstyL6X8uKOrK/j98oEN/kT8gmGsLP21GBLLaOmFWMntFHLvFF4
	gn9VFZ9JSai8ODLcWoz704ibI87nLtaVs38fkcljVsy/ZkoBPyZ9IM3ByjMwAD2wHL9PpTgwcTD
	UGAvoLSo/kKLiqWcCTxv2GaDDAFdWIh5ywfA/M6zUbkccLAYCknFetPLxX24hDLTHl+ORQTpQio
	8QysR0oY8UZ9c63NcO9pJK51v10t1HdUNYhxaOStIaNMsXsJ0U3ZdBSmw8z0Ve0T4jVbQB6fHoo
	rZAEKB6a8
X-Received: by 2002:a05:600c:5d6:b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4aa8a0f4e16mr218253975e9.6.1793639776324;
        Mon, 02 Nov 2026 09:16:16 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm23598760f8f.6.2026.11.02.09.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:16:15 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/4] wifi: cw1200: don't update the beacon in station mode
Date: Mon,  2 Nov 2026 17:16:00 +0000
Message-ID: <20261102171603.368298-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102171603.368298-1-pmazzini@gmail.com>
References: <20261102171603.368298-1-pmazzini@gmail.com>
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

A station has no beacon. The XR819 firmware never confirms the
UPDATE_IE request, so the command times out after association.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/net/wireless/st/cw1200/sta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/cw1200/sta.c
index 5d8eaa700779..f3f31aa52499 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -1744,7 +1744,9 @@ void cw1200_set_cts_work(struct work_struct *work)
 
 	wsm_write_mib(priv, WSM_MIB_ID_NON_ERP_PROTECTION,
 		      &use_cts_prot, sizeof(use_cts_prot));
-	wsm_update_ie(priv, &update_ie);
+	/* A station has no beacon to update */
+	if (priv->mode != NL80211_IFTYPE_STATION)
+		wsm_update_ie(priv, &update_ie);
 
 	return;
 }
-- 
2.52.0

