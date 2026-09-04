Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17132375F65
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485666; cv=none; b=aRZ4MhY+4IPkqObe5l7AdDjzvb62r0uTs2k5ix7usCHYSxloqgBbUJk/Z15LbOCyzS7d01oUgGZHMLZeaJLICMAE+XfWmaMUQaQm3b37kHyjFdRsYif6hJMfIUsb/AP1DLWQuOUf0TeN92vUUY3klKt2JXUsuRoe9p9CxFiMX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485666; c=relaxed/simple;
	bh=1vwLz1EGRsKiIvUCEaao5Sd859cQRuwJZcfrmgdHaVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvuvCDQbJEv7uJSbo6f07FqOjyJc0gSPyYHAA+LCQ2PfJO2H06gJDLNBvHpB9N2IwTDsRbnwPJ6GT7cVoWqvfOkYrXj6KjK04pQA9yC8IN7c2QUZ382xcLT7dw+uMfGmdgGZqYo0589RZ2D5TBeiU5puTEztkA5PLSFaisxUj08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6N92wRs; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6N92wRs"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4af173320f9so358989b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485664; x=1789090464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpZj4z1owQ+RYAnRDS+RDtSbTp7EykdRTXIHu5JR10c=;
        b=o6N92wRsLWmbbdc7ePp8DeUtCtcvxRUx+dOfEMXfLI/ZKYAc3DEeokl94aZNCHBpgZ
         U3MNUJyCbNNCHG0Bn4Y+XGSzM/2fVNGcave1dutFiTNRPJ6xLDh3U93KFFo7T3JnTWv9
         yRSDExh3r30lvSdUDmaIi5cejqj53WC8JJyLl+n6g8Nvkpj5n1iI4ZBvyu2VS8sFWojr
         dKYq/rj5YoAw4ZrzTjp/OuvdEFvsKNQIXNy9y6tJcRtBvJo3rHrHV11WfleqtznVW6dm
         PiUuSOmaSWX5R/UXoFJXG9oC8FiTZbQAJBKbl9Rkb2b2twwGCPeeWalSJqRNCFaD8DLS
         iL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485664; x=1789090464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpZj4z1owQ+RYAnRDS+RDtSbTp7EykdRTXIHu5JR10c=;
        b=d4F6xinsWj66hTXvnxB4QVOHF7T1r0onhuIHYWm1gGx84jco3NWBcS8Ds8G0s47BZm
         E1VRjzB0gwW1ddNfa58j64rAsM1WHlMcb/qI/vtFVxV8+0XHBCGSzTkDbgYykYA4poiv
         d77uMo7dmvXMHk1SWJFg382uQ6v6WcEweiec08704L7AbTSEzKcBjUHaXIUI2z6DGeyU
         +Day+tJrxvGGbE1B384/aNb7B0SbgaYLi5eoP411GJmDpZ9fVnJV8HWqNZxHK8Idr/K3
         YXIaFDrZijJlQyB9s08z+FEJiZY3fqo/risIb20C8UvVeSXwZZYCxRSkPRM6QmV4qq4v
         MW0w==
X-Forwarded-Encrypted: i=1; AKwUvByqUy3NBEKAE52swx+MJYrv6J+vR9rin1NbU4fRAkNKiEcn3hvs9BDufs0tsX5w0e0K4jAcobpU0hqIcdg=@vger.kernel.org
X-Gm-Message-State: AFuF++lcLYh/6wf0iRPvnnCUrC1z/Dp6y0SRl226hwO4ztUZO/g6dMg5
	lfIoy+R84DYmAkXHjje8zHrWP2jTX6PzvqZ9z2hFSqpB7Ofs2xa833LO
X-Gm-Gg: AYBFou1F9KKi8gebRR9OgOILmeXeQVqGkLB96d6TamuDf8QFPjiCM+SRrqb6VSGZx+r
	AqrJPybwUW3rCFQdhLUVsBHLNPSCfVq8x/MmkDrnF68NKaTzdiUMrUmtBCZax6iGoptpa9w0qHz
	y9IoCSj4oeU04rPTDgcf4wNHuA2XNl7dnobSY0d1UcozxAOwu1TX/kNNVsu+5Hxasck/Oh71u98
	3Q4qMEs6cRYOAiI67Yrxg+5D866EYUqid/lrfCfbMJ5QM73gty26BsSLoKFMsq7kBM9hr8bLoUK
	znifDfpnz/q6Wk+eC9eLkiwZw/wvVfoYwcvrfdSIS6yrIMa3WloBZnQS6ThS313jZbY3adRXmWf
	ThqAOCNaxMu13aynQvgJ59yNDmgWahycPZla8nHwy+tnzTaAWfzy7izD+5j1cwxZhXIJZ1zHO5U
	d7ac1u3/HS+5bwuqkRHnCO1j1pugV/x5UZ5eNcLHkmgA+I/beJAazdDwB9DhBp+nRLl99r
X-Received: by 2002:a05:6820:7094:10b0:6b7:a12:75d5 with SMTP id 006d021491bc7-6b70a127c1cmr1849103eaf.27.1788485663674;
        Thu, 03 Sep 2026 18:34:23 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:40::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dd07214bsm1835951eaf.10.2026.09.03.18.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:34:23 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 03 Sep 2026 18:34:01 -0700
Subject: [PATCH net-next 3/4] psp: allow drivers to omit tx key add/del ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-psp-prep-v1-3-d47e9c4c375d@gmail.com>
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
In-Reply-To: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Drivers that don't use an SADB for tx key storage don't have a use
for psp_dev_ops::tx_key_add and psp_dev_ops::tx_key_del.

Allowing drivers to leave these as NULL gives PSP core a simple way to
determine whether a driver utilizes an SADB, which in turn could
affect how PSP core chooses to handle certain situations.

For example:
- deciding if tx key deletion needs to be delayed during a rekeying
  event to avoid in-flight packets using old key handles.
- choosing whether or not to report device stats like SADB usage to
  userspace, which only make sense if the driver uses on-device key
  storage.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 include/net/psp/types.h | 4 ++++
 net/psp/psp.h           | 8 +++++++-
 net/psp/psp_main.c      | 6 +++---
 net/psp/psp_sock.c      | 8 +++++---
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index 87991a1ea02d..b8905efbd604 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -219,12 +219,16 @@ struct psp_dev_ops {
 	 * @tx_key_add: add a Tx key to the device
 	 * Install an association in the device. Core will allocate space
 	 * for the driver to use at drv_data.
+	 * Can be left NULL if device does not store Tx keys and @tx_key_del
+	 * is also NULL.
 	 */
 	int (*tx_key_add)(struct psp_dev *psd, struct psp_assoc *pas,
 			  struct netlink_ext_ack *extack);
 	/**
 	 * @tx_key_del: remove a Tx key from the device
 	 * Remove an association from the device.
+	 * Can be left NULL if device does not store Tx keys and @tx_key_add
+	 * is also NULL.
 	 */
 	void (*tx_key_del)(struct psp_dev *psd, struct psp_assoc *pas);
 
diff --git a/net/psp/psp.h b/net/psp/psp.h
index 8acf9ca84b55..bbb39e2f5b0a 100644
--- a/net/psp/psp.h
+++ b/net/psp/psp.h
@@ -53,10 +53,16 @@ static inline bool psp_dev_is_registered(struct psp_dev *psd)
 	return !!psd->ops;
 }
 
+static inline bool psp_dev_has_sadb(struct psp_dev *psd)
+{
+	lockdep_assert_held(&psd->lock);
+	return !!psd->ops->tx_key_del;
+}
+
 static inline bool psp_assoc_needs_tx_key_del(struct psp_assoc *pas)
 {
 	lockdep_assert_held(&pas->psd->lock);
-	return pas->tx.spi;
+	return psp_dev_has_sadb(pas->psd) && pas->tx.spi;
 }
 
 #endif /* __PSP_PSP_H */
diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index 2556f0d46ef4..91473f96ad21 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -68,9 +68,9 @@ psp_dev_create(struct net_device *netdev,
 		    !psd_ops->set_config ||
 		    !psd_ops->key_rotate ||
 		    !psd_ops->rx_spi_alloc ||
-		    !psd_ops->tx_key_add ||
-		    !psd_ops->tx_key_del ||
-		    !psd_ops->get_stats))
+		    !psd_ops->get_stats ||
+		    (!psd_ops->tx_key_add != !psd_ops->tx_key_del) ||
+		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add)))
 		return ERR_PTR(-EINVAL);
 
 	psd = kzalloc_obj(*psd);
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 36eb06faa54a..6a4becc38b55 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -181,9 +181,11 @@ static int psp_assoc_set_tx(struct psp_dev *psd, struct psp_assoc *pas,
 {
 	int err;
 
-	err = psp_dev_tx_key_add(psd, pas, key, extack);
-	if (err)
-		return err;
+	if (psp_dev_has_sadb(psd)) {
+		err = psp_dev_tx_key_add(psd, pas, key, extack);
+		if (err)
+			return err;
+	}
 
 	memcpy(&pas->tx, key, sizeof(*key));
 	return 0;

-- 
2.52.0

