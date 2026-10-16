Received: from mail-ed1-f97.google.com (mail-ed1-f97.google.com [209.85.208.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C6370ACA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124778; cv=none; b=O16nuQN8BdsmL4kMCju1qVa1zfcd0AMTH0Mtw/vJ9Kl3k+0KWxhs+cOsJL/NcpykTj0Y1IMTGvQEe5jOIeSy2avOk0tGPuG/q2HhSFku1XXmQUUKLLE+ajr2wYdMnWAXUnHkkea7Cq+aCBPvAy5ser3VNHrZ/BwKgQfpz9i4ekI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124778; c=relaxed/simple;
	bh=XhuBJxvrFU63QJqVPgO8OLPmkeIwMQWgsRFiyIW57d4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=boNp7mQEDhtoACrnyRaR6C6HnKk4/EKXNiiTP9ImcczchsWG2r/XcbCW/xYgpXu5weQSiw15ZNUHG/92wZ9uhOxVh0iI215Psao4Dpi7BK/Ia8RwYAX8KNEhRtu5R4A1+6jX9nohJJwhXvvx8HmNiDH5m2/QXGZqHBiEactk614=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Dr8PN3In; arc=none smtp.client-ip=209.85.208.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Dr8PN3In"
Received: by mail-ed1-f97.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so3974227a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792124774; x=1792729574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6HjbkY/HYrC6drUiJxPoewo53hju7P5AQYetis26ew=;
        b=Dr8PN3InoxaRbBl6Z7sLbm+kYKszkLyV9qlzWHjzsOLNke/Wl20erfaBvHn25t3crX
         EBTLIJHk8OncMFqHwTK0zjl3l4I9Frrrw4GsUNACPmFanAvd8gQHHxmzd6+7ntVolChN
         m1K8CaNtKPzKMt4gNJGQJ/bkmrvf8dfIimH3+VyFJYWtkTzpY4VVGckNvpI/sXu7IZYG
         L/ZF6UjJhJuUi57SxlsU/V5a7a6VUS6mTrHOQRzbh5a45Y7Lv/Zg1R5JzcnBzTSmxBUp
         mbQHvgL65e7yQdQnlwfEeoIqtfTFUVu53rPVxthmwi5z7d0xUAg3OL8LGIybmrYRbQ6o
         apvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124774; x=1792729574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6HjbkY/HYrC6drUiJxPoewo53hju7P5AQYetis26ew=;
        b=M4dMcYUDWzabMSjb4Y6X5+N2woVIBlQSXRgPYGIcSMLy3/vbyBI/cZfgUjIxc6TJIK
         LuaJz+wD2+bka7ufWUodIgsUl1zGh6APEUriYee72pLZCnz+InUbhkgDrkYD+LR8N/zz
         ZUKKv9MBkNvKlVRtKRlxSYs9NiYKMVmp4jINCEjeDGkJhndYNz6A9oLKw9Je4urQ7AFg
         ZSr6deL+c5p+qgT6A4MSPXUZNvAVM0E9j1WWr9EHfdp3RwBFOObjHCT3nIRQKIsMTl7S
         8np5sJBG1y6fLwIPexzWPpDXj/mCMKiDKty+hYzVSTfFHWZMepy7Nhpiy4X+J/FWpTvi
         Ft9w==
X-Forwarded-Encrypted: i=1; AKwUvByq39WnN6HXtp2fBteuWcvOjnkfBdCKszan0TQLIGyI2X8+01EgZGM8RPM/gmueRWL0LTi/VfiQj7vXeX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmhINhfGIUr2QyIYLPa7N6qgfeKT3dcww2NWG49Grt5hhuyGyp
	79QzFmyuOg42wUj6aYOcM2bVKDtyEBbqqlY6fWVN0BjQG1oKBjUJSnYQIqfog0ngVNVYtL9sQih
	QWH9ejH9VP9joqbGalb4LQDZrCUDS6eKCje9kvXwUHFAlqheCRq0L
X-Gm-Gg: AYBFou3T0k56kJQKhp1YvZbB8nAXA9mwzPWg39ioQAFz1ltnc2oJrPonx/Kmhb9qloc
	syGXxkbrmHDzt54/Lj6vxNmevhIXUyt16HG5LiBPVD5j1ZMaoGUEdtMX/3ttNihaEeQEHI+Gack
	yh2TvtAT31Y67+5UsWwf7TiGCz0ro36bRKmW5YdM5Qd9g7ZTxesbwa6iOaB2BlHaGvicUZgurLl
	w++ElM7GENMBdo1fxIBAfP6IXaaJHD8aUqXobXVIcyY6aaYRcr+lE3D8lF0BYw8IubqYo5Smpa3
	vMKhxByOBu4yma8PDfILUFopBgugf+1T3ZJm7qCxaqHsFD4EF/BFO6t9bomkUlTLQtudCBzBwyt
	6FvzfEQ0cjn6oy3wcBFdv
X-Received: by 2002:a05:6402:5c8:b0:6b1:ef9d:9d73 with SMTP id 4fb4d7f45d1cf-6b1ef9d9ff8mr7915116a12.28.1792124774162;
        Thu, 15 Oct 2026 21:26:14 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6b38a14d0ddsm242711a12.1.2026.10.15.21.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:26:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id BEE71400B8;
	Thu, 15 Oct 2026 22:26:11 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id BAC6DDC12FA; Thu, 15 Oct 2026 22:26:11 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rishikesh Jethwani <rjethwani@purestorage.com>
Subject: [PATCH net] tls: only install push_pending_record for a TX context
Date: Thu, 15 Oct 2026 22:26:04 -0600
Message-ID: <20261016042604.357739-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tls_set_sw_offload() assigns ctx->push_pending_record for both
directions, but the hook is a TX-side dispatcher. On a socket whose TX
side is HW offloaded, tls_set_device_offload() installs
tls_device_push_pending_record(); any later TLS_RX setsockopt overwrites
it with tls_sw_push_pending_record(), because tls_set_device_offload_rx()
itself calls tls_set_sw_offload(sk, 0, NULL) for the software half of a
successful HW RX offload, and so does the fallback when the RX offload
is declined (NIC with TX-only offload, tls_dev_add() failure).

From then on tls_handle_open_record() (a TLS_SET_RECORD_TYPE cmsg after
a MSG_MORE send, or the close path with a pending writer) runs
tls_sw_push_pending_record() against priv_ctx_tx, which is a
struct tls_offload_context_tx, not a struct tls_sw_context_tx, and
reads open_rec from inside the offload context. On x86_64 without
lock debugging that field overlays sg_tx_data[2].dma_address,
which is never set, so the push is silently skipped and the data
buffered by the MSG_MORE send is later sent under the cmsg's
record type, e.g. application data in a handshake
or alert record. With a layout where the field lands on a non-zero
value it is dereferenced and fed to bpf_exec_tx_verdict().

Only set the hook when initialising the TX side.

Found by code review while developing TLS 1.3 HW offload
rekey support.

Tested with HW TLS TX and RX offload on Mellanox ConnectX-6 Dx
(Crypto Enabled): after setting TLS_RX,
send() "AAAA" with MSG_MORE, then sendmsg() "BBBB" with a
TLS_SET_RECORD_TYPE cmsg for a handshake record. Without this patch
the peer receives a single handshake record "AAAABBBB"; with it, an
application data record "AAAA" followed by a handshake record "BBBB".

Fixes: e8f69799810c ("net/tls: Add generic NIC offload infrastructure")
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
This is independent of the TLS 1.3 HW offload KeyUpdate series, but
that series' TX rekey path (tls_device_start_rekey()) calls
ctx->push_pending_record() and depends on this fix.
---
 net/tls/tls_sw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index d1ad31986cf2..b3fe153c3c68 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2591,7 +2591,12 @@ int tls_set_sw_offload(struct sock *sk, int tx,
 		}
 	}
 
-	ctx->push_pending_record = tls_sw_push_pending_record;
+	/* The RX path shares tls_context with a TX side that may be HW
+	 * offloaded and rely on tls_device_push_pending_record(); only the TX
+	 * setup owns this hook.
+	 */
+	if (tx)
+		ctx->push_pending_record = tls_sw_push_pending_record;
 
 	/* setkey is the last operation that could fail during a
 	 * rekey. if it succeeds, we can start modifying the
-- 
2.50.1

