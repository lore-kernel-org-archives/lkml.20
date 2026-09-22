Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9594A206C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106351; cv=none; b=NoKjRoU0x9bdRqioOSFmnvwFwlcxZQZf4Hq7EfPVI5oNeqdYJFe3Fq6J2a7qyWwoG/+9xaV0tObnL90X6hxk+l5gcfaVnFjFLZNpSTlHpc1SwC3p0d87seMqAw7h70dlPvYIsQSDBTpJ8nsCQC2uuXGXIiKqMp4n/ga7MhVSKRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106351; c=relaxed/simple;
	bh=qIMCCaTvSWDTxA3XuP5WL1+WB8BXmmqRBAoCppkztHc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HflG9lcqke0flEPb/CJ8n9f9W4UOt0LCucddOaVobhp32XNRnSVplwUXDyXwpht9P2Lw/SnEWkkBfoUR1Hr/UUVZyefxHWU03SrwuZ1U191dqTKO7k4JE1ZwBlwLwsjzwo7xd5EgokpN+hgFw/qHQWetoBKgt8rFFpj1eHOOA/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bow9y9QX; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bow9y9QX"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so216542a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790106348; x=1790711148; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvcRcnpVi8ICqxsH8+8hVW6wZ840sbPSq2HiKDG88Is=;
        b=bow9y9QXxCzVs4du4wnN39XFgYuKSSzS3X6x33Uy979X5SXJv0Z3aGzqhGVXqBAJ6M
         2TtpmiMPG0qRM3RsI88AkZ7mykZbovbziTzSR/7pqU8xPEKq09fpmmbVG+XNvCY8PV9N
         Ww9rocpZMlbukhmRDxDn1IQo4jLd7qqwpZPFYr2nY5ShZoKbZUxAfNFmbATN5qEtcv4e
         PqzFQ0h3BG68xqNT8phsNwojJxjfxro8vleS5/lTaNVpQ/LNcNoSe+5RYg7sJFcHoeMU
         Kxs7LOsGbInTfiUQfm5P3YpivvR33xp0+wpany3oBkUHO6Q73yjTCamCP87hzFPrycpE
         krnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790106348; x=1790711148;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvcRcnpVi8ICqxsH8+8hVW6wZ840sbPSq2HiKDG88Is=;
        b=dMI2gwkIx/nPbfEc6m7UkHKAQaNt09er92YrFssH/rLzssCZSoodQlM+amjpq6FlUh
         +CJdWSjjU+UyD5F62VpRX7DNJ/QbzNPq1zy0j2mh9OMd19KpFLJzsFp/2GuC0i8ckRLu
         Cj05LET1/8jTZKfmVO/8VeNbxOqkvLy5Yv75RZWf5IpMqhbYH5TJR3haA7CkJHCCDUYZ
         TAhKqwAyfFrjFNMHEM2nS75IbYFU/hZmahZtKuJQ5Aq4Ns5KDzp0uyxApFmF1xxTHX17
         xhruh0kFJo+q0/qSAx0S38KkVBkoH0CJcAzB/LT9Eq17Z+xmiySfInjtr/NDyFhkMxCb
         dZQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtTeCnXS2Jmkr86RnvfYb4ZYgDFZQ1/nVLbdrJ2YzQUCz8+FHPmvMC5o9dLMy1yLS3tt8TYjap0u0p7V0=@vger.kernel.org
X-Gm-Message-State: AFuF++moGL9FPZFNtOmsHnFUyPC5bHG+LZ7EworASbWolObRERXn+eIO
	QgPQ0EUThhFmt60zgxKiA0OposAiGpaRdSd0uor+hh13DwzNKXvntnTG0fWlsF8MgjlwvQJXSzt
	wl0x7cjBgh1sfgw==
X-Received: from pfbfu12.prod.google.com ([2002:a05:6a00:610c:b0:84a:251a:a85e])
 (user=joshwash job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:939d:b0:3dd:e2e3:30fc with SMTP id adf61e73a8af0-3ddf82fa284mr499447637.49.1790106347525;
 Tue, 22 Sep 2026 12:45:47 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:45:29 -0700
In-Reply-To: <20260922194533.631387-1-joshwash@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922194533.631387-1-joshwash@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922194533.631387-6-joshwash@google.com>
Subject: [PATCH net v2 5/9] gve: fix napi_disable deadlock when attempting to
 disable XSK pools
From: Joshua Washington <joshwash@google.com>
To: netdev@vger.kernel.org
Cc: Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Jordan Rhee <jordanrhee@google.com>, 
	Willem de Bruijn <willemb@google.com>, Tim Hostetler <thostet@google.com>, Ankit Garg <nktgrg@google.com>, 
	Eddie Phillips <eddiephillips@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When disabling XSK pools, GVE calls the unlocked versions of
napi_disable and napi_enable. However, the netdev lock has already been
acquired before ndo_bpf is called because GVE supports queue management
ops. Calling the unlocked versions of napi_disable/enable results in a
deadlock when attempting to disable XSK pools, as the thread attempts to
re-acquire a lock it already holds.

Update the NAPI calls to use the locked versions.

Fixes: 606048cbd834 ("net: designate XSK pool pointers in queues as "ops protected"")
Cc: stable@vger.kernel.org
Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>
Reviewed-by: Jordan Rhee <jordanrhee@google.com>
Signed-off-by: Joshua Washington <joshwash@google.com>
---
 drivers/net/ethernet/google/gve/gve_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index b9bcdc7619b2..3712ff364cbd 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -1706,17 +1706,17 @@ static int gve_xsk_pool_disable(struct net_device *dev,
 	}
 
 	napi_rx = &priv->ntfy_blocks[priv->rx[qid].ntfy_id].napi;
-	napi_disable(napi_rx); /* make sure current rx poll is done */
+	napi_disable_locked(napi_rx); /* make sure current rx poll is done */
 
 	tx_qid = gve_xdp_tx_queue_id(priv, qid);
 	napi_tx = &priv->ntfy_blocks[priv->tx[tx_qid].ntfy_id].napi;
-	napi_disable(napi_tx); /* make sure current tx poll is done */
+	napi_disable_locked(napi_tx); /* make sure current tx poll is done */
 
 	gve_unreg_xsk_pool(priv, qid);
 	smp_mb(); /* Make sure it is visible to the workers on datapath */
 
-	napi_enable(napi_rx);
-	napi_enable(napi_tx);
+	napi_enable_locked(napi_rx);
+	napi_enable_locked(napi_tx);
 	if (gve_is_gqi(priv)) {
 		if (gve_rx_work_pending(&priv->rx[qid]))
 			napi_schedule(napi_rx);
-- 
2.55.0.1082.g2b9226bbc0-goog

