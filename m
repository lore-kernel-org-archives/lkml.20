Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121345;
	b=vDZeXOOAUmw2aAhbu/03JZHIA4BzXazBvxk9VrexkHkiWIe0b9LjZz8h0gburqtI+Kw4
	 SXCjURvxWAPJwd1WL10WPU6Emjvi/pecKxl/J+vXzUMETJD0vTYgK92Wg500L7B5wAffp
	 1ltr0MRjgk1dHPr8dzox+paKElvlKyK+fT224HXE3nMoDN+Nh1JERFjMS6HxrPRkov4Vj
	 OsK1XWNogLwxcxpO0Z+GLMNND1acWjlhmJKMBdY7Z+tUtchlEfRCBlcHZHmFVH2+1G0Cg
	 3S0VgR4UmX7sVJovURcduKBDauwv/5Yc2QbiihAegHBDBrRiEzgbz+kvq83/KcViDDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BPbhhk5NK1NQUpR+D8C26PMm7Zm7rAAg7WS9+6YlYfo=;
	b=D8xk8CL6nCJwToy/cA/BjmXplO0u4/cssTfRhxsMderAtF2KEjjnrFI8VHKgX2oVW861
	 JSG1p3hc/xA1+B5WQzyt0FPSWBXZfMfoBOWAa2BB1BvifXRKS3GJsL5fMsuBkvmt0GN2H
	 WseWp6IG058Okq98rEZbukhwPxFaDr9PEKG8U2sxdIvgRBdg9AKb30xp7cYesPJdE25mP
	 Llgmbzfh56AqPDaJinkd4omPRMzc/eOUr7Pa/v6+45KirXbNoblGR6HR9p16kcpH61tRu
	 4RxUfucq6ZEN9aOnlDtkCByp4vtTBmDPz6dj++I84iJi4/k+muLEDH0JPE0etM+Cy0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="M45/9I4w";
	arc=none smtp.remote-ip=209.85.128.98
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com [209.85.128.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923C8606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 923C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=M45/9I4w
Received: by mail-wm1-f98.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so7483385e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793121343; x=1793726143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPbhhk5NK1NQUpR+D8C26PMm7Zm7rAAg7WS9+6YlYfo=;
        b=M45/9I4w0d9YCytxCe5LhgJSicqsUlutj91GfE6p1YPTCTfgOP0DAMAK6PJ+nZ1b2b
         fcN6vVeuK+cr0tadZRZ6LuxCZ7qkzFTR/nzfkp49leM6wRz1shtvOAOzAGy3Ixz8tsPv
         jfFjwbx23NRdpP9xtmoMw/15HAk979MDx5ZcoiO0mqA+nuzPnv5gIG2p/N/1JTLoNYvb
         V/yaZ4WY4hml+tKsUgw9P+G7yCpP7O+a5mYk4IlybbGDxw3UXAzjZ6AXD/djDZRLedOw
         ylFggX0xIMY1cVJRPULlVBNI/yk9LaPOE+POAi62Dzpen0poA9BCjej5+UBz+uwULMvx
         9DJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121343; x=1793726143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPbhhk5NK1NQUpR+D8C26PMm7Zm7rAAg7WS9+6YlYfo=;
        b=nvV28oh+yD7cMb7pIbprtPQiCWegNivnq4d05beUWLdz8t+tFlDrI1TMpq1wwATeiB
         dD4sdPv+49eFMP9ZAyvnXUzl8VJs8XRbpIKUh33f8xGPYrpQSwUWpt152OQhGiEP6TZW
         ImVwu5ZR9PvzXDafm1p2s1Ig35cd7FqGzStFhKxVM60ZRSFF6i3uGT3CSQVfayoJZ2jd
         762dZrrbMfm/3utp8NnKkajVMM7+9Dfp/XhbgJtFuNJQGWkz/Adko1x4pU+Tre6SmKSE
         3VDeQEVXdXARo6sEQwkUboNEEavFj77T04912XX7XT+n3uusBAFV9A2YAhWMwSjHjvmU
         Lqug==
X-Forwarded-Encrypted: i=1; AKwUvBw+zhnsiXIDrZ/S9tpLJuoFTIt14BJb6ZrCkqhCsYXMZ/jmtENPlTJqDEfSQ36JCOCnvB3viY41jrAXnxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1E4zdhFxfwQLPZODk+snmSc36Rn37LVrdTYFra4NPAVNPxmEF
	c6xeAJ+YXAm9Fkko09+PRsjpuLVL04OKoXE9x1BvJ7MIS3Dn4CHZ13AKUPFkAOKetVpDYkTqUtc
	4V+47Yf4eVys5FR9YqVMYb2IMrkNyT32QIYPd
X-Gm-Gg: AYBFou3kZIaUjLKrgWdqNK71yIeWlqmzPl9aHREF2Xo3o5GkcUy2HebkrGMlzIyrz6l
	CYor96hY4PA2T85IegZUn0hcR0cZ68+Sf7iDde4EKKf6yjRHeoNsokXrqvNY2c0B7sRXZjlcZeW
	6atX0wL/kAqwIw3HNqJDh/P/Vyvk5Jk7EtG2Qvf5gxj+oFYhNidR81UwBXS806HDdq0TM5hNJ8O
	VezlxwoDSkE0t7oTHRbaDEg7Tpp6q+tMcoBzcAFRLnXVVJ/9JKdQxAbiv9ReqXWMdwqMDGwEV0S
	xCH0K+F7HNorxM+sQUyciVj2VCmLkLgGwOT8fEtwp9vQL/1jh8UBoh6Vgjo75NUIvI45kwgWBQG
	VTtXOySuEoUW1p0a1QoEBLprn46vHQT0Geg8=
X-Received: by 2002:a05:600c:c049:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4a7c100b0c7mr52810595e9.9.1793121342804;
        Tue, 27 Oct 2026 10:15:42 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4a931902eb8sm212955e9.14.2026.10.27.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:15:42 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 2C3804013C;
	Tue, 27 Oct 2026 11:15:41 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 2667BDCE124; Tue, 27 Oct 2026 11:15:41 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	stable@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Boris Pismenny <borisp@mellanox.com>,
	Ilya Lesokhin <ilyal@mellanox.com>,
	Aviad Yehezkel <aviadye@mellanox.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/2] tls: only install push_pending_record for a TX context
Date: Tue, 27 Oct 2026 11:15:33 -0600
Message-ID: <20261027171537.2317025-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

tls_set_sw_offload() assigns ctx->push_pending_record for both
directions, but the hook is a TX-side dispatcher. On a socket whose TX
side is HW offloaded, tls_set_device_offload() installs
tls_device_push_pending_record(); any later TLS_RX setsockopt
overwrites it with tls_sw_push_pending_record(), because
tls_set_device_offload_rx() itself calls tls_set_sw_offload(sk, 0, NULL)
for the software half of a successful HW RX offload, and so does the
fallback when the RX offload is declined (NIC with TX-only offload,
tls_dev_add() failure).

From then on tls_handle_open_record() (a TLS_SET_RECORD_TYPE cmsg after
a MSG_MORE send, or the close path with a pending writer) runs
tls_sw_push_pending_record() against priv_ctx_tx, which is a
struct tls_offload_context_tx, not a struct tls_sw_context_tx, and
reads open_rec from inside the offload context. On x86_64 without lock
debugging that field overlays sg_tx_data[2].dma_address, which is never
set, so the push is silently skipped and the data buffered by the
MSG_MORE send is later sent under the cmsg's record type, e.g.
application data in a handshake or alert record. Enabling
CONFIG_DEBUG_SPINLOCK, CONFIG_DEBUG_LOCK_ALLOC and CONFIG_LOCKDEP, but
not CONFIG_LOCK_STAT, in the tested x86_64 configuration moves open_rec
over sg_tx_data[5].page_link. Once populated, its page pointer and
scatterlist flags are interpreted as a tls_rec pointer and dereferenced
while reading msg_plaintext.sg.size.

Only set the hook when initialising the TX side.

Found by code review while developing TLS 1.3 HW offload rekey support.

Tested with HW TLS TX and RX offload on Mellanox ConnectX-6 Dx (Crypto
Enabled): after setting TLS_RX, send() "AAAA" with MSG_MORE, then
sendmsg() "BBBB" with a TLS_SET_RECORD_TYPE cmsg for a handshake
record. Without this patch the peer receives a single handshake record
"AAAABBBB"; with it, an application data record "AAAA" followed by a
handshake record "BBBB".

Fixes: e8f69799810c ("net/tls: Add generic NIC offload infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_sw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index d1ad31986cf2..235b868facfa 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2591,7 +2591,8 @@ int tls_set_sw_offload(struct sock *sk, int tx,
 		}
 	}
 
-	ctx->push_pending_record = tls_sw_push_pending_record;
+	if (tx)
+		ctx->push_pending_record = tls_sw_push_pending_record;
 
 	/* setkey is the last operation that could fail during a
 	 * rekey. if it succeeds, we can start modifying the
-- 
2.50.1

