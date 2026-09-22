Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4957457E61
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106350; cv=none; b=WeDWIK7VP1t1VTD4/195Q8clETQlPBxtcqWtoUhlPgs67Z80n3yFJmt7RLa8IJnfrWqAIHeQ9EUBblThebEgUyql/NCgapNKirKTT5frJ3P4Y6n2tCW0YN2O+lv+nfcsATJVQ2LQCQQ0cSXLnwLhO+FzjfY5r5gd4hdPODhq/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106350; c=relaxed/simple;
	bh=wRLASX/97yU9zKBfZV8vy5gzmtHXRvnvGYUyP0j3LM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wc82ZRHrUXyqY0I1elLgdAL7MG2J06pUNxs7CSGDmZFIJEz/7Bai225zmmuG07o1Vpr6FKFzV9N0yiIy15G4MEMmJLzs5PVfcu7PR785HSiHTqVA0bvmBFO3yAczHXagY/d1RYorcnM+msDwjl0UhhojdUzQtMCNkPfUp9AUvMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ijWuoUaj; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijWuoUaj"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86261e66700so198364b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790106346; x=1790711146; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=suMSGTXypfIdrYAcS87e+4uWOy37tQcyCih/ffX9UDg=;
        b=ijWuoUajYq5qsBoxzCYhs4T0TIDziDy9fJI7ZpKf4RQhogTx2Msw7Bc+/mdhn+C2RI
         GG2iEwC9gfSNuN7UHZumTIcdYOwkcL/A9mGgyKs2mA15sfvOL3rVD2LWF+58wx0ua245
         3eA5b7MtiEQJM1Qckh7xJoExx0orI0lYxfTo3XlGXwBUe2NtYmoJh9yKJPKECJDItE+U
         J/ZpeKWn/XLsBIuhzr2RsIwEEZtWoZdxbVdVByH/qwELVi3LYYTpbK1+RkyvLLqvhof5
         ZIynH45jCR2RFxyno7RHzYzQxwO6SfcxzVEgtMLQMfNEDRY8uBoc/dav/pHiSFhsZbJB
         qqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790106346; x=1790711146;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=suMSGTXypfIdrYAcS87e+4uWOy37tQcyCih/ffX9UDg=;
        b=pKmKnjAmzniPzsvWTzCjAINSfyZ+sp3EC5c9lqAFfAVY5X0mXvByMVoYmzGMvVmZ9O
         cZjqQraoTq89BFIBfE6ZLL7UhbLmC6xB4sdczpeiiZikXNJMD6QfOkCHJeNKOr9S5Aof
         dt2r9QBB6zcV8QnhmfL5iI7X4wQD7tTet5htO2WPA5BEMP5dijFSOw4UPE+Lhzv2q5LK
         5HV7w4+HrG1ca1hkrXB6+rb/rhJeDKRcQ5Dcup5NM88PoC5KEG1XvcQsQqo5B/h8TKm7
         e5cGWaG4HApS9lstrIOBi0IDqYyrmfPAEcyaLyygMUnN3VZIKcQacn/E3X3FUEWJqVza
         Gd4g==
X-Forwarded-Encrypted: i=1; AKwUvByLhuEa05LTvHWrtTXsXVg6FK5X/5W7U94SAyIwqBS4RyCvAw6/yuMKB2Adbns2347xXXJmy07j/8RHkpM=@vger.kernel.org
X-Gm-Message-State: AFuF++kGxPb7wlSkpCxT04n53U6cDB1xypUg2ZROAPbBMMDc6sVN5uqG
	jceo78js9fmoGEp0CNaDTVOKNPy3/54vnPyzpWa1f7E8niMSG9YMGdajSy+m0RMQ7SofDf+bBpT
	aTk7nAQBu44wWeA==
X-Received: from pfko10.prod.google.com ([2002:a05:6a00:214a:b0:87d:d4a:136c])
 (user=joshwash job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3316:b0:86e:8deb:fbd4 with SMTP id d2e1a72fcca58-87d1a7af6fdmr683675b3a.11.1790106345528;
 Tue, 22 Sep 2026 12:45:45 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:45:28 -0700
In-Reply-To: <20260922194533.631387-1-joshwash@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922194533.631387-1-joshwash@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922194533.631387-5-joshwash@google.com>
Subject: [PATCH net v2 4/9] gve: don't register xsk pool on pre-existing
 queues in RDA mode
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

When XSK pools are enabled after an XDP program has already been loaded,
XSK pools are registered on pre-existing queues before queues are
re-created with the XSK pool fully registered in DQ RDA mode.

This can lead to a race condition between the RX NAPI and the control
plane thread wherein a pre-existing queue sees the live XSK pool and
attempts to use recycled buffers not backed by XSK buffs for AF_XDP ZC
traffic. This causes the following kernel panic to occur when attempting
to DMA map a NULL XSK buffer:

BUG: kernel NULL pointer dereference, address: 0000000000000050
...
RIP: 0010:gve_rx_post_buffers_dqo+0x99/0x190 [gve]
...
Call Trace:
 <TASK>
 gve_rx_poll_dqo+0x4d9/0xf10 [gve]
 gve_napi_poll_dqo+0x76/0x170 [gve]
 __napi_poll+0x28/0x160
 net_rx_action+0x2a0/0x350
 handle_softirqs+0xd4/0x280
 ? sort_range+0x20/0x20
 run_ksoftirqd+0x2d/0x40
 smpboot_thread_fn+0xd5/0x1d0
 kthread+0xd7/0x100
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x1f/0x30
 </TASK>

The XSK pool should only be registered with current queues if XSK
buffers are allocated on-the-fly, as is the case in QPL mode.

Fixes: c1fffc5d66a7 ("gve: implement DQO RX datapath and control path for AF_XDP zero-copy")
Cc: stable@vger.kernel.org
Reviewed-by: Jordan Rhee <jordanrhee@google.com>
Reviewed-by: Tim Hostetler <thostet@google.com>
Signed-off-by: Joshua Washington <joshwash@google.com>
---
 drivers/net/ethernet/google/gve/gve_main.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 9cc343a16271..b9bcdc7619b2 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -1654,20 +1654,18 @@ static int gve_xsk_pool_enable(struct net_device *dev,
 	if (!priv->xdp_prog || !netif_running(dev))
 		return 0;
 
-	err = gve_reg_xsk_pool(priv, dev, pool, qid);
-	if (err)
-		goto err_xsk_pool_dma_mapped;
-
-	/* Stop and start RDA queues to repost buffers. */
-	if (!gve_is_qpl(priv)) {
+	if (gve_is_qpl(priv)) {
+		err = gve_reg_xsk_pool(priv, dev, pool, qid);
+		if (err)
+			goto err_xsk_pool_dma_mapped;
+	} else {
+		/* Stop and start RDA queues to repost buffers. */
 		err = gve_configure_rings_xdp(priv, priv->rx_cfg.num_queues);
 		if (err)
-			goto err_xsk_pool_registered;
+			goto err_xsk_pool_dma_mapped;
 	}
 	return 0;
 
-err_xsk_pool_registered:
-	gve_unreg_xsk_pool(priv, qid);
 err_xsk_pool_dma_mapped:
 	clear_bit(qid, priv->xsk_pools);
 	xsk_pool_dma_unmap(pool,
-- 
2.55.0.1082.g2b9226bbc0-goog

