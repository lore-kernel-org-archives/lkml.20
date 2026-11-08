Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156126;
	b=WiS9heHhjR0w9GN/rQDpTGfKmgKqbNqDXG+Ztt5VUbdnXOHzPjaNZNJe93fNuKT2+HsH
	 Wfgn35z3lbtiPow2+rya4XZl58xCPykHw/ZS0JSoGmUuG3cpWIIo4xes0pKZKBkdxWfYZ
	 wH83lS9xL4RMJZWyQXtWnWEoXu1OGep0TaHIdKuTHvvtRt7qJCUIC0iAtifEJ1/Y/GPug
	 nGwuCsBNuU8NkDWz7PakJzpAxoQ1zzs1rNIFVrdyGHjWxSPdBH6L6lhd5XZt1o2WLMH/Z
	 DMlmWH/k+rxEwr9M52Gd6xsOZQXzL9RwG/EAVghbTtmJuqIdSZe6uyx8A7bP5TdphYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156126;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=w1Tj2Z9J9o8m8hRTXD11Mow03qvAjz6ecNswvnSZWy0=;
	b=MEPhBhtv2UMYszMftq11p8+lezzLNnzjvoqOykOB8efB+tlaSwbv9AYUyzHOsR7YFl1b
	 WSfnkprT3v3ZEwtGcSvssxxbSJk04D/LpX9qLHAuZDPvUQHT7ebzxzbtP0eRQe0YQnmKn
	 WlwOew7+6dt3lEHV0ez8RPzx2B9uIQBhBT03O9IIjUxVTdQPCm8GeaujOaFgWWGTB6PBp
	 RjZNOHUmcyAQrho/LyyE70wvTd17wF7+fYhzxHv51NL+Pawq+oxa27lqQM4AYd7d74Pc4
	 6ruFBoT2xUA5l/px9fm3Aa1HNFBqmA3BIio8+CzdBj8V6TS4zXbVmk4s647gGEpxoog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=2f4OESIp;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=igLB8vWY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.1
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1AF606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1AF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=2f4OESIp;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=igLB8vWY
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794156125;
	 b=EA6Xu2Tlg91+FYIDVboTzq9wnUbmiCBEDKITFmDywny9usft3u3uv3NUpF7TOSuReeQCSqjIpv
	  8TB1XYpPfydjHVZmYF0WORgbYaxon8VYj1Xr7d1Ij0pc6Kj0vLr5lOHSMJSYvAb4zgfLnZ8Dwo
	  d8oUxL2lwJPXHIc9gGG38ILOu4qjUJRdLcygjPsGtaOe5p5z72xQxwl4ZcaAIyJ4MDuHQcSCRb
	  AqYkNq23kHRduixLO3X2pdNBiJiQT+1CVb8QfAm6MvGOYcKaX6NNUtZ5QQ1oq8FpRanU78EP8Q
	  hcHpjrFQj+ZfCnT6KEnL4tuTZBPt/bNBS8rp9A47MJ25Lw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794156125;
	bh=K8+bAteAwtybhhFDjzqGVKnebM6Q9hxkFp+VHoMl8LY=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=cF77Jhb5G0aPsGcnakJ0mSZwhDOWcFk+nSCs1QUDvwt+gP2XejcUKXX4LSJ27VmCeJg5YmRHeP
	  NYUvbCmsWyFq7WZAOpiql8eNT9LpWTzW3EQ3uPhsnwzG58KvzwSfjYx9kJ871VUwL4GB8OJMeU
	  3YRJlz7/aVAbNCpW9smmKpsQd8yONI6R9YHKYKiRhv/0i/UTwvbbqsPKbW5v7o5eu3uhIuBKfh
	  F/9fITDZWLJ06G7RPS7pok5WFRCJsocdlDfYPcIh8te6CXV6AShq584XicA6HmtxqNX1Wtt22y
	  YLrzehYe/73RCe+QghkXoQ6+g4yc7rw5HJM06qG9Gs/QCA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=w1Tj2Z9J9o8m8hRTXD11Mow03qvAjz6ecNswvnSZWy0=; b=2f4OESIpoOFoS7ZfctTBxAsjrZ
	y2my/ysZBydvWRnx5Al+/UT5/9U8YVoLruyfgnkPr0JIbtGWxrHlKB2Y0Or7qSYSTS5DiooLJLDwL
	zz81Um3HuULp2eYdmbqxoOTMbpk/X/nRSKn5vqUymDqdZtnLwmadpEiQSHSckVpaMo1Q=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQ5xs-00000006KK7-3yJD
	for linux-kernel@vger.kernel.org;
	Sun, 08 Nov 2026 16:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=w1Tj2Z9J9o8m8hRTXD11Mow03qvAjz6ecNswvnSZWy0=; b=igLB8vWYf1YOB70o7UUC+/TzQX
	rIQXNKSVcwI1q2CCUq8DiQLW52vqAgI86W5tlrqP4GTQ3y3HBWwsMCJZP4utGOIF3Uazr2k2xis9N
	1xYWHU5b6zXjSGvFSHILMmVbB9vo+w8n7z4pCPILX7P5r805YzRJSpHYdHyoTaxEC9Mk=;
Received: from [79.17.15.196] (port=59083 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQ5xk-00000000Aqg-1BMM;
	Sun, 08 Nov 2026 16:41:48 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 08 Nov 2026 17:41:47 +0100
Subject: [PATCH] virtio: check for driver remove callback before calling it
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
Message-Id: <20261108-virtio_drv_remove_fix-v1-1-23da1a7c3900@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPjdgIlXxKlKCmlG3UFM2GgTx7
 qb18RuY/6AAYQRqsoMEkQP7JUE/Mhrmbpmg2CWTyU2pdV6ryLKyt06iFXx8hB15V8++q1FoU7g
 KlL5fQZr/3fZ1O2z9G8P6i9F5Xn7P++B5AAAA
X-Change-ID: 20261108-virtio_drv_remove_fix-5ba8e3123d7e
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Rusty Russell <rusty@rustcorp.com.au>
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417; i=francesco@valla.it;
 h=from:subject:message-id; bh=K8+bAteAwtybhhFDjzqGVKnebM6Q9hxkFp+VHoMl8LY=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkflnnrv/jz8u28v5s+PvhYNWFPnu2GgIzbVqs1d9o2W
 v5Y32dwpKOUhUGMi0FWTJElZN2Ne3vmmn9L28D4CGYOKxPIEAYuTgG4yEaG/xWXOOOs7dZ8P77W
 Tiqw6en7Izf77av991TICv+W2MD44C3D/4KjN38YWn42m/5lb+Ty66/SV7NMK3n21e948K7H/hU
 TfdkB
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7b05da59434ddce049f8ed042c726bd1
X-AntiAbuse: ID - 7b05da59434ddce049f8ed042c726bd1
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQ5xs-00000006KK7-3yJD-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The .remove() callback of a driver is normally not mandatory, and the
increase of devm_ functions availability makes it even less so. For a
virtio_driver it's not marked explicitly as optional, but nothing
enforces its presence, so check for its existence before calling it.

The NULL dereference that led to this fix was seen in the wild for the
spi-virtio driver, which is currently the only in-tree virtio driver
without a remove callback.

Fixes: 74b2553f1d13 ("virtio: fix module/device unloading")
Signed-off-by: Francesco Valla <francesco@valla.it>
---
The behavior of the spi-virtio driver is not conformant to the virtio
framework guidelines, but that will be tackled in a different series.
---
 drivers/virtio/virtio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index a8588d7ad109..067d32c67b44 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -374,7 +374,8 @@ static void virtio_dev_remove(struct device *_d)
 
 	virtio_config_core_disable(dev);
 
-	drv->remove(dev);
+	if (drv->remove)
+		drv->remove(dev);
 
 	/* Driver should have reset device. */
 	WARN_ON_ONCE(dev->config->get_status(dev));

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261108-virtio_drv_remove_fix-5ba8e3123d7e

Best regards,
--  
Francesco Valla <francesco@valla.it>

