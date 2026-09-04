Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326D43793D3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485679; cv=none; b=Nb12rPbjpnA0veQ1ivy62pw576crGRZswflmItT0qEJF3C3viiwWopGBOVmfY3aP5bG9DobcSI3BG18REt/9EvkQ2IOSEVEkY4WsfiXZHU9DPotcjicuqq8wN71nANRR/IqqW8D+BSUtzbRhtCV2OgPp4829i6+G2qmgxciT57A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485679; c=relaxed/simple;
	bh=OXLSqoh1FDwPOdeniUjIOxy7ztUXSmy1LVFgVaxlxXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8O4+ON/5uyP9kPn7CDarubmv8PxAyeKUIfGg8FtkuSVARby+A+pG2G9421YilChEvsEIc1rrupTwz1qtge7xiA1r25ZHhVZiuYgZlFV5CCf55AOClYrU7qymSutOF3sRwXcJfrdc9tRi6o+RbZ2ZPt8OzKJJXSV1GYEtNDJ3DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4IgwnWi; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4IgwnWi"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4ab89cff9c7so180222b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485666; x=1789090466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nYD/5QHvA/tTrz7YkNk4zOJKjnO4i+yX0Rf8b9DSJo=;
        b=J4IgwnWioUpCnRdEiiO2BuZOl2rYWIGpSrHvWcJs5oMEjWI54OY84H5TVo+iVi95sx
         udYYOC+8mqcDV3cSLYyx3IFR4g3ZQYC3zghbGT+1PuwAY2kBlCVllgXY0dk0ghk+kGjX
         WHgjYIemkPYAMeuLjxVoQFQffkkqiLsuCcBJEx+71oc9dOBHTLvUNMZpaerJyVEVIXU2
         snc/HPHqbLdOmTKxjW4qJ2SnrgKBm7+oAymIf07ELmXslManVm7tmne0Tv6X+mrzmYeS
         6743tNaa2BbJ3jNdgduWdXLoP4xqpEPpNanBQn/06zsNOzV47wfIS+FYtgBEnzZKPM9S
         xtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485666; x=1789090466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nYD/5QHvA/tTrz7YkNk4zOJKjnO4i+yX0Rf8b9DSJo=;
        b=DNV2yYdPSe/zZ8pRhtakTAJaBDrXG20Iug2MXp48eZL+6FKA3HaTE2k41g7xR0cLba
         rmIOIwKKOehPkgmhYt3imBLhc+ttqRRWDaDZ7h/tUZS+gNPGPi65FFf+LGVvI23rfHVZ
         2L5qQUu4jnUdVa0HQDJ+LGC/XujtiTLNfjU5N4e9wKxEcrdPiNHiAMx/n6zDjF5YAdq0
         xVEWXXChdUyrrUBSmL4oBseSfE1y3yD2VaXes23cwM56xPErSuA027BYNMk+nfukDODW
         KYKGZDC4qLkY5uGzVmJj1HZw9Opx2lGUMioVo1Ds6DcRNOFFyx2MSWe1QQN1jF0Rqa6V
         yyEA==
X-Forwarded-Encrypted: i=1; AKwUvByCi/qRTaljnULPUwftPHXB0RXNwK4C9FSaJiL6CRjzl+D+TDsQ2AzQN8wOU2RzKkqDEOGSXzgFCc+dsNE=@vger.kernel.org
X-Gm-Message-State: AFuF++nOLIVctq+RnhFgwzx5AsBDEI75gpRSxee9Cw1JZjfMPUCW188N
	XL6LSNVJ7QOdbdtHSwjsnFhm0lA+Kfj/MIqZKVRHVN6ml95ljsuLT2kc
X-Gm-Gg: AYBFou1ZEQyXgN6vO1GBLjSox0ZXv4iw7+iHNb2WWPXLQXQS6iWkHaN9USwnHU3dLmr
	LNDowpdL0/LobFH7RuY/mOBkv/G+9upDGkn1w45j001oUFX7D8HhyC56HJTS2naJWzg/0XqgAWf
	viULO6ZW+5rdMlcdm3lc7hOgahj9vNXCRimLCNHsgH/6Mh3ZsCHSqC7BT62aoCt+AsRkSfqgr3A
	/btyeHS0erkpZkmUZjwGxi4I9yfkWFs6jnzhr87LCRaGuZOkMc5OSDI7QBJQNzbio2HppZ0YtU1
	RJHookRmv5iJSjeJ8isKK9WxuJ0zjc2+0av5p0WwfnnstWlRb8qfxRVlgx/4Z1vW/0ZtXR6b+P3
	IjhNZILuh8Hu0O3d40bgah8xOVFV33xeKVYaajY5cKXbZHRSB0mEACjD/LbEucOzt0ddJWOdla6
	6cm00tgEQ6lP0ehddkK3SCHLQgbx1Q6AgJmbdNqyT8VR2PpbGjG1ngv6XL
X-Received: by 2002:a05:6808:50a9:b0:4ae:f5be:fe29 with SMTP id 5614622812f47-4b965050305mr2252385b6e.5.1788485665945;
        Thu, 03 Sep 2026 18:34:25 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b97124b081sm1058916b6e.9.2026.09.03.18.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:34:25 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 03 Sep 2026 18:34:02 -0700
Subject: [PATCH net-next 4/4] netdevsim: psp: drop tx key ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-psp-prep-v1-4-d47e9c4c375d@gmail.com>
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
In-Reply-To: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

netdevsim has no SADB. The usage of psp_assoc_drv_data() was always
obsolete given psp_validate_xmit(), so we can remove nsim_assoc_add()
and nsim_assoc_del(). netdevsim::assoc_cnt can also be removed. PSP core
can track the balance of tx_key_add vs tx_key_del calls in a future
change.

Delete psp_assoc_drv_data() because there are no more callers left in
the tree. mlx5 accesses pas->drv_data directly.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/netdevsim/netdevsim.h |  1 -
 drivers/net/netdevsim/psp.c       | 33 ---------------------------------
 include/net/psp/functions.h       |  5 -----
 3 files changed, 39 deletions(-)

diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
index 55aec41237b9..181b6baaba7a 100644
--- a/drivers/net/netdevsim/netdevsim.h
+++ b/drivers/net/netdevsim/netdevsim.h
@@ -122,7 +122,6 @@ struct netdevsim {
 		struct dentry *rereg;
 		struct mutex rereg_lock;
 		u32 spi;
-		u32 assoc_cnt;
 	} psp;
 
 	struct nsim_bus_dev *nsim_bus_dev;
diff --git a/drivers/net/netdevsim/psp.c b/drivers/net/netdevsim/psp.c
index 6b3532b5e360..b7452c49b581 100644
--- a/drivers/net/netdevsim/psp.c
+++ b/drivers/net/netdevsim/psp.c
@@ -23,7 +23,6 @@ nsim_do_psp(struct sk_buff *skb, struct netdevsim *ns,
 	struct psp_assoc *pas;
 	struct net *net;
 	int psp_len;
-	void **ptr;
 
 	rcu_read_lock();
 	pas = psp_skb_get_assoc_rcu(skb);
@@ -37,12 +36,6 @@ nsim_do_psp(struct sk_buff *skb, struct netdevsim *ns,
 		goto out_unlock;
 	}
 
-	ptr = psp_assoc_drv_data(pas);
-	if (*ptr != ns) {
-		rc = SKB_DROP_REASON_PSP_OUTPUT;
-		goto out_unlock;
-	}
-
 	net = sock_net(skb->sk);
 	if (!psp_dev_encapsulate(net, skb, pas->tx.spi, pas->version, 0)) {
 		rc = SKB_DROP_REASON_PSP_OUTPUT;
@@ -149,19 +142,6 @@ nsim_rx_spi_alloc(struct psp_dev *psd, u32 version,
 	return 0;
 }
 
-static int nsim_assoc_add(struct psp_dev *psd, struct psp_assoc *pas,
-			  struct netlink_ext_ack *extack)
-{
-	struct netdevsim *ns = psd->drv_priv;
-	void **ptr = psp_assoc_drv_data(pas);
-
-	/* Copy drv_priv from psd to assoc */
-	*ptr = psd->drv_priv;
-	ns->psp.assoc_cnt++;
-
-	return 0;
-}
-
 static int nsim_key_rotate(struct psp_dev *psd, struct netlink_ext_ack *extack)
 {
 	struct netdevsim *ns = psd->drv_priv;
@@ -177,15 +157,6 @@ static int nsim_key_rotate(struct psp_dev *psd, struct netlink_ext_ack *extack)
 	return 0;
 }
 
-static void nsim_assoc_del(struct psp_dev *psd, struct psp_assoc *pas)
-{
-	struct netdevsim *ns = psd->drv_priv;
-	void **ptr = psp_assoc_drv_data(pas);
-
-	*ptr = NULL;
-	ns->psp.assoc_cnt--;
-}
-
 static void nsim_get_stats(struct psp_dev *psd, struct psp_dev_stats *stats)
 {
 	struct netdevsim *ns = psd->drv_priv;
@@ -204,8 +175,6 @@ static void nsim_get_stats(struct psp_dev *psd, struct psp_dev_stats *stats)
 static struct psp_dev_ops nsim_psp_ops = {
 	.set_config	= nsim_psp_set_config,
 	.rx_spi_alloc	= nsim_rx_spi_alloc,
-	.tx_key_add	= nsim_assoc_add,
-	.tx_key_del	= nsim_assoc_del,
 	.key_rotate	= nsim_key_rotate,
 	.get_stats	= nsim_get_stats,
 };
@@ -215,7 +184,6 @@ static struct psp_dev_caps nsim_psp_caps = {
 		    1 << PSP_VERSION_HDR0_AES_GMAC_128 |
 		    1 << PSP_VERSION_HDR0_AES_GCM_256 |
 		    1 << PSP_VERSION_HDR0_AES_GMAC_256,
-	.assoc_drv_spc = sizeof(void *),
 };
 
 static void __nsim_psp_uninit(struct netdevsim *ns, bool teardown)
@@ -230,7 +198,6 @@ static void __nsim_psp_uninit(struct netdevsim *ns, bool teardown)
 		synchronize_rcu();
 		psp_dev_unregister(psd);
 	}
-	WARN_ON(ns->psp.assoc_cnt);
 }
 
 void nsim_psp_uninit(struct netdevsim *ns)
diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
index c5c23a54774e..b23c30898389 100644
--- a/include/net/psp/functions.h
+++ b/include/net/psp/functions.h
@@ -24,11 +24,6 @@ int psp_dev_rcv(struct sk_buff *skb, u16 dev_id, u8 generation, bool strip_icv);
 /* Kernel-facing API */
 void psp_assoc_put(struct psp_assoc *pas);
 
-static inline void *psp_assoc_drv_data(struct psp_assoc *pas)
-{
-	return pas->drv_data;
-}
-
 #if IS_ENABLED(CONFIG_INET_PSP)
 unsigned int psp_key_size(u32 version);
 void psp_sk_assoc_free(struct sock *sk);

-- 
2.52.0

