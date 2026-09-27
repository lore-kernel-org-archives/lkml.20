Received: from mail-wr2-f24.google.com (mail-wr2-f24.google.com [74.125.225.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B053BB66B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507347; cv=none; b=GG3YemQ1PSXyu7Y7nMu1xgN7tkC6jBQJrunjC/ciNminIlwREMnzUMwS+r/33PzYmW3k4GeL3vtpgDMHh28LNxMWfJLkxQXS64qL4xG8P2z3PvCpNdtwvUOXIqK0kb2x9GkN6qA29QIB0In8Vspby4VsRQHF3WTEsb7qV8/avuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507347; c=relaxed/simple;
	bh=Z81fYpBC83tyl2EahQ5uVBovVzoQMII9SPGovm+WyHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mtg1NUCbvQAh/3TiSEZGl2HYt74rBiqYF5eGlYqbxrN+lwKUvmr48SAPEPQ4lV1QqlgyrjJuQEDYmHLqZgkrLFiU1zKQWHK8s5Vogmh6NBwhuDOapW6MSYunU08cMddZuAzbjdm9MsjD8lFjGVCMmmSiz9GgjxP/XaefJbbo9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/FHyv1X; arc=none smtp.client-ip=74.125.225.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/FHyv1X"
Received: by mail-wr2-f24.google.com with SMTP id ffacd0b85a97d-482f63546c3so1714424f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790507344; x=1791112144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Yd776XVUL5K2a1r38X9yNDWujw1AE8eowaD1NftLV0=;
        b=k/FHyv1X6LMBLb0zXGYJ4mdH5FhmpLWDuSr0uym5KRDqs7LZQcYAPTo/miz84fj0TT
         Fw3ZTrCKfYzOMXXyt9je2i+YNMVDWWL8ao25Q9wHaysqmJZD3C0o7bjxLxw9ePe8wUBo
         PrvRO0pWsAm4pDGkl+ATr9yS9lLS5cIxnIwfECixuqFPkJUBST48vkilQcpvBzVcsnlQ
         NV7eXW7xuYJoL8F3IDXnpvXZ/8QwEOGBteyIGZ/1wtuCtfUjxZ8q9lUYQt82bT9GBohW
         MvIODoBjA1U231CahqQwTVCABEv0jkGlqqIiMTnOV5ReBT05Qn/KLZeEgK0eOJ4aw9O3
         uADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790507344; x=1791112144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Yd776XVUL5K2a1r38X9yNDWujw1AE8eowaD1NftLV0=;
        b=xd1tPVpp8We/g11Ra7PiUi7Ux6JMoZ+L21L2H8q1OHh/x3EMzz/AqwbzSVbVAzhvWf
         QoNr8fy1LXCUcredtyIVmYteLlyiqVAvgg+BGaKMokZusO8x8zzWUMT/RbyJBEOo3W1f
         02k9GvqKw2PncnHkh9tv7FsrmC2tnK3xNG6NixcHIMIoKHBo/kde78LDwrR0Ruutt0R4
         bC5BYNrKTeDnfIsm6859yX2BU/rHpK23j+b2qEDqMAy7JpOPn1kox02bLXGwbS++UWGd
         tjRWs0wqOsgWq3p+C0NYkIEKYCOf47DvhfdNtX/0AMB2MFzH3FUr+enFTHT/+1yWkcn7
         c00A==
X-Forwarded-Encrypted: i=1; AKwUvBw7EjvTT0T49rIsZ+G8p4SmHfFxC/uTLEwfsAMwUPPvRZ8NonKDyWaX+cCBE0EcQ0cj5Qqsb/VZwr+W6L4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4zQ/OftqJqj+JDGm8k9N3q9HjFnCoxulKvC9ZEtkJZaCBbQ10
	CuYeNuG+T41e24NXNQi3WuxmtMcxwbI8yOXDbZqDnqWKR6AQdaxk7Lra
X-Gm-Gg: AYBFou2GpbEBF9hEukMVBR1CjVQcFZDvwqyrJ/AZSkSSOE7LhBdWW1sfJfphmZEqt6w
	Y6bumKj0YgZ16TDbzvY3kRw8tbQiGWYIeeVYf/MR4cuoiMh5lNPx34j40qBSJM+bILw/UT9I/Yy
	0gkuSDSY5PMHtXnGNKJ59Koy5rSzOn68sRL5daWRGid9RfYXQEPjoFXdXTgnn8jvhoQABgvpkqd
	aN0jV/ATww9rd7jAOQjGL3R9Is425iv5T6yLkbm5FtnrEOOncaZ34dT0yZOJxLO7ar4Q3ts1ntL
	x8EDQgiUdRf2aLv8xtsmVq5agIlQ6CtCA68z4Zivx4+zWH5W4Uqf8A+EJz/zDvDKLCceTxzyV9v
	E89Pv60lfJEKd97suYzdyxdV7oO5QmlH4Bd8OPHW58jaFGfpi/6CKm0elZ2u0EUrRiQtL1oT//H
	UPXG4i0f0Ao1JajrAYlSdmt5HX94PoCBbPMRmrlYnfuTtt2UWmhXpqT7N1EIu1Syl81A8T/A==
X-Received: by 2002:a05:6000:230e:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-4887175f986mr18594216f8f.36.1790507343764;
        Sun, 27 Sep 2026 04:09:03 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm18090168f8f.31.2026.09.27.04.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:09:03 -0700 (PDT)
Date: Sun, 27 Sep 2026 13:08:59 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: syzbot <syzbot+89001660f14fb7684c83@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, dhowells@redhat.com, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in
 rxrpc_destroy_all_connections (2)
Message-ID: <arj4xgLi_4YZl929@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab29768.514bccd6.255447.001e.GAE@google.com>

lets see if this works.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git a7bfaba4823e

diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 611c790bc6d0..111f0844b0d6 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -274,4 +274,15 @@ static int rxrpc_process_event(struct rxrpc_connection *conn,

-	if (conn->state == RXRPC_CONN_ABORTED)
+	if (conn->state == RXRPC_CONN_ABORTED) {
+		/* A CHALLENGE packet queued for processing carries a ref on the
+		 * connection (see rxrpc_post_challenge()).  That ref has to be
+		 * dropped here because the caller frees the skb as soon as we
+		 * return.
+		 */
+		if (sp->hdr.type == RXRPC_PACKET_TYPE_CHALLENGE &&
+		    sp->chall.conn) {
+			rxrpc_put_connection(conn, rxrpc_conn_put_challenge_input);
+			sp->chall.conn = NULL;
+		}
 		return -ECONNABORTED;
+	}

diff --git a/net/rxrpc/conn_object.c b/net/rxrpc/conn_object.c
index 0ece717db0f8..1295f3de3725 100644
--- a/net/rxrpc/conn_object.c
+++ b/net/rxrpc/conn_object.c
@@ -487,2 +487,18 @@ void rxrpc_destroy_all_connections(struct rxrpc_net *rxnet)

+	if (!list_empty(&rxnet->conn_proc_list)) {
+		struct rxrpc_connection *c;
+
+		pr_err("AF_RXRPC: conn_proc_list not empty\n");
+		write_lock(&rxnet->conn_lock);
+		list_for_each_entry(c, &rxnet->conn_proc_list, proc_link)
+			pr_err("AF_RXRPC: proc conn %x cid %x state %d ref %d act %d flags %lx cache_empty %d calls %px %px %px %px bundle %px\n",
+			       c->debug_id, c->proto.cid, c->state,
+			       refcount_read(&c->ref), c->act_chans, c->flags,
+			       list_empty(&c->cache_link),
+			       c->channels[0].call, c->channels[1].call,
+			       c->channels[2].call, c->channels[3].call,
+			       c->bundle);
+		write_unlock(&rxnet->conn_lock);
+	}
+
 	ASSERT(list_empty(&rxnet->conn_proc_list));
