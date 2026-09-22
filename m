Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13734A6892
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106344; cv=none; b=kU4K36EAeS1YyheaZAbBaUONyI26gdqGoaObnTwsI8qEtcRJ52k1XpKU2oOastKWPgld+8SUSHRxDoVDnqwLWjivUp01KHEgH/nTz+U3knjcXfXJdp5b9qsLlFaSpJB0tz+8mROBBdwZ82Eg2lwwfR369eiswN4hmpcfa5tJyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106344; c=relaxed/simple;
	bh=UljtQ9XO6rbJkLCDeJXSzP2hU8m8OSu/SUn/z/6iVUc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Akf2yDfHlLjvjkTj/sqwZTflQHOwNT09R+3ZQblBx7Mcdsybg5z/8U0YFv50uE1xwdrTrOUVmARhRFfckCcVpdQ63hbq3ulKLS/edy/Q3pyCTpVgceSQtzwujl954yPwt0rf2zxp1c7QWcT7OJwLR3rAFnLYitSkoSnKyEeRrDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vDKzk+Jz; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vDKzk+Jz"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so402137a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790106342; x=1790711142; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWYEebvN53sOkHrhhlwZSz3/5d2DYKttJmC/W8rasEc=;
        b=vDKzk+JzBBTn6rAfjEqBMyPU2CXYQYNh/ugXqd8cMGmLPm1jN30z9cZYqEM9IJcpo8
         Hu8D7nZ3GFr85WwKsQXfhIBDDfr02V3PqsXNM2xnqbJzJcq6EsO5SOfLOjclN3dRO0Gi
         7morU4+CIzeCDD++Ned6Oj19jkgZQCYAX2JmICR/KjYYQFtskRSyjGIUbqh9Q00TypkD
         +pbPYJr52TPfLqP08nwLIWflBMDl2rECoIxmMbCH7tLq53NMvs0xKjdO1xIhArLftL/m
         wUQQUKwcAqQgN3KaIWzWKR33FZjfXECy6w8/f6JfrFwHQB3ofm7Z5PMtncbC6lphsT0U
         jOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790106342; x=1790711142;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWYEebvN53sOkHrhhlwZSz3/5d2DYKttJmC/W8rasEc=;
        b=nJPRpzVQ++xB4yKmtxFZfk3abdOEPzuCbNMIRWcgZ6DeQPk9SDE0bb23RkL7XRaoDl
         qg7Oq1j9D8YwYmm8R5RA3dawTvLYw6ytxQvOul6UHqnDOj/tyqSl/VstXnAelOjzTGco
         7Q2pEYZy8QfXpCZeeaC3ro7kaN2nXOatG2MNvbybAfgR9/C7EBJrFQC8AApHu7N2b7eU
         QpRNUrfgY9U3OI572f4qlK3FWOwBsupSDNhm0HwBhrcvSt4XjerGFVyWeLexU0dE4+fK
         irIyGst2wxDxRIgr+y+WjFwiyFxLkAqiAWMJ/T3U3J7hN7s+AVyRxWLXrgyvHf/Xe91h
         36yg==
X-Forwarded-Encrypted: i=1; AKwUvBx2ykhNBD2F6/cKeCqllWKLa81WS7ngN4SXF9cE1z/qjdZ6jDOwMCnR2wMi7Zc5PtZXRQVd7P4lr1StmZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nC9p2MrU9Bo8sRU/UL6/OaNrCCxzmbV9PnjbpCkTB7k2zgtir6
	cJXT9f63LKXFHeX/KZvYTQDFUfphOSzwDNsT0yijTD7i80fxzo2yndh19g83+k0F+4xuyiBLkjO
	ZAjHcYOwgWX1aDA==
X-Received: from pgde21.prod.google.com ([2002:a05:6a02:315:b0:cc2:1a89:e586])
 (user=joshwash job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2fce:b0:39e:6c68:c77b with SMTP id 98e67ed59e1d1-3a07e6b5895mr430876a91.49.1790106342068;
 Tue, 22 Sep 2026 12:45:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:45:26 -0700
In-Reply-To: <20260922194533.631387-1-joshwash@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922194533.631387-1-joshwash@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922194533.631387-3-joshwash@google.com>
Subject: [PATCH net v2 2/9] gve: fix XSK buffer leak when rings are stopped
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

GVE does not free XSK buffers when resetting ring state as a part of
stopping queues. This causes all XSK buffers which are posted to the
NIC to be leaked.

Free XSK buffers attached to an allocated buf_state when stopping rings.

Fixes: c1fffc5d66a7 ("gve: implement DQO RX datapath and control path for AF_XDP zero-copy")
Cc: stable@vger.kernel.org
Reviewed-by: Tim Hostetler <thostet@google.com>
Reviewed-by: Jordan Rhee <jordanrhee@google.com>
Signed-off-by: Joshua Washington <joshwash@google.com>
---
 drivers/net/ethernet/google/gve/gve_rx_dqo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
index c3f4a76b0fac..3a88b7e98b16 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -113,6 +113,12 @@ static void gve_rx_reset_ring_dqo(struct gve_priv *priv, int idx)
 				gve_free_to_page_pool(rx, bs, false);
 			else
 				gve_free_qpl_page_dqo(bs);
+
+			if (gve_buf_state_is_allocated(rx, bs) &&
+			    bs->xsk_buff) {
+				xsk_buff_free(bs->xsk_buff);
+				bs->xsk_buff = NULL;
+			}
 		}
 	}
 
-- 
2.55.0.1082.g2b9226bbc0-goog

