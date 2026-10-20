Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519913;
	b=SYVQixQvrTgKMkle+wJEpPPEc1bVQ/BY1syYmwyHN6HZMbcjZMtlOLl5yf5DUrD6a0Pi
	 z+YGtrbQSTeLJ9zk0gWsU/nm20D9XO9TursFJQEd+Mnzqa275aO4ayCR12u6/GceC+b0A
	 Aqqj3T/9Zf0/9/c3td7j3d0lF9bxYFY4N7j/ImQ2WieG3ZFEIUKaY/jKE/8xuIBqUoxWI
	 VoFoRsO2SWRGkfoE/avd/XWc7r+nX1irh97168w+SIeEkXJv+iLBGQxxBpsYICA2Bfhw3
	 npPr+dAeesYisu2iMWS7rnX05nW2enIOUnFOYpuOXG9EnD670+H1LazSi87D7iF9A3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BPbhhk5NK1NQUpR+D8C26PMm7Zm7rAAg7WS9+6YlYfo=;
	b=BnIU94Y/O5yJfMicbRxgcUbAtyWoTSj/q6gN7AWGQNSN0jQ61BMPkHw0Dv/HsqCE72AK
	 lJTu/85K7ltWAsuCToagNdJYL349Xr4PXQB+Jym7ukr8il/RRLAT2R8NAVi94eTqMr+fu
	 XoiDUwRnOyw8Zt1dGYOgZzOvs1R+ZbfWoiAI5KhtdlJ2sNs4jAq0SbwpZRT3E+8cjFqij
	 xceuXDaRtcYXKfQ2wgtPo98fj4JcOp5Dyn02cIuI9tAKLWcT+1wQZlRaqZ5hzsePD8cgM
	 zwDVQP8a4cNxPqqaZbCY73ZQ5Tadc3MJooLbOd/DwYOOKvkwFX7BV+WUjbNZnEA6MIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ZYZu1zIm;
	arc=none smtp.remote-ip=209.85.160.226
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A335606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A335606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ZYZu1zIm
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-5365f9bef55so8890181cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792519912; x=1793124712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPbhhk5NK1NQUpR+D8C26PMm7Zm7rAAg7WS9+6YlYfo=;
        b=ZYZu1zImX9WMX/rFkuJxTpa4CpQD8olv3B6PFMVBfdaPft1oNebP3X9+MP2SAGGnXL
         Ot3cQmbbBEe1c5UegJlKl/3eOj7jax1tCP05sDGd+TrFA/N3KEzpNKJDchXD9fnSOF2J
         uZPv7BddQ8b9jZxQ1vgn8q0m6wuU7ZLn0es0lkRC+a00sG/M8Pog0dJrTy/vVXSx9V3U
         1RY4nFhKJ0p+eIQDM/yG9iKUy9LBiOncZX48EKBBvVAq9SvMgYF969VjyoF4Wtryq8El
         aS94R4Pal5Hf65gMCvBfitLyrO+qozNGlGEDyytBySpUSOdDlrdvKwntNckjGQAZAh9d
         KKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519912; x=1793124712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPbhhk5NK1NQUpR+D8C26PMm7Zm7rAAg7WS9+6YlYfo=;
        b=yE4sd80DImACIJZZxvAZ6nc+jHdyCgJ4rBxSZTEZ6fE9+WN3UQo6fw/9ThUjdod7Fm
         rRUYQRYf64WLI7bCTGrAAZ72BIndLsT6qGF1mrH9ROXvREyii2A9dfxbdpSht06Rl8PO
         QOzlgfA/PaqC8Fm45ip7ogNQN5O87+p6RF5ND1PNnRd57swZ45hNtVI/mCi+h+E2pNbk
         MIGyaocRfmVGQRvUGrrpPJMKJ1Pc97bO+rk9bi9bqI5AhdN2H1wY6hoMeeKQl6lCkb86
         NFAm7cbqOl0CU6HRUIXgp2Z8DUMOadJ5gEeHGEl+DJF9v87S3SFi8abV6YTz/sN3FBDu
         sfzA==
X-Forwarded-Encrypted: i=1; AKwUvBx9kkYRgsGpuQYH9GTrtIbtROL68sQ7m3DUzyMd4wm5x+Uy6zKjv+pDrbP5K12A7rN4bjYTX/StUSWZpz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlh2sv0hYLe2btykuHyuVQ51wzNnXqdVMzk3NSrc5q0zHXgJBJ
	UTtX/sJYsmlcPi884NiNRYdhMS1lzANjlE9PhoLqG2az2EWQGx0qSFlcWCti0GoLjpMq9sagWc9
	K0PwRJR/4+p3ujWv2SB9NVvz3H6pA6PfK6mQ8Gtes/jaQdT16fd75
X-Gm-Gg: AYBFou2h5gP3hrFI0LuKZQ/CauDitr2BvCks2qqbQLLBNQaNeE8TbaeEMyjKtAY9RMs
	Vt97JKFj5QBYhJ7JhAzKbPwpDn01CHRgVuUIsOm76F+nozogV9l8Dvbtgi6waTvZh5OHvkyQvsW
	LFL9O41o2DHTxsfdPu4oR1FScuCXOeXlfyc3zfqGC7efIZ7Dq7OdMXRvFCNRS7CIFCd98M1uqKZ
	ENdglktaZ4NwS6YO6Wd2HvMOzR9LzsF9vwux0oJVh2YS3Yz8knkihucBAqlxT3nOK8DCE313OCO
	rgrlhg6/k4TYHT4Q5Ah4A2tmjub5oNN6ENT3hIuId/r2I8hHO8SX8rfExxfVyzESgatsX+Ixhvk
	0rLmqdITPImVtz1V/9uU=
X-Received: by 2002:a05:620a:4441:b0:93e:7ec5:2cfe with SMTP id af79cd13be357-93f57f8fb91mr5540985a.28.1792519911865;
        Tue, 20 Oct 2026 11:11:51 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93f56e1d0ebsm7756285a.18.2026.10.20.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:11:51 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 3D9E2401E4;
	Tue, 20 Oct 2026 12:11:51 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 38884DC0D46; Tue, 20 Oct 2026 12:11:51 -0600 (MDT)
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
	Aviad Yehezkel <aviadye@mellanox.com>,
	Ilya Lesokhin <ilyal@mellanox.com>,
	Boris Pismenny <borisp@mellanox.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] tls: only install push_pending_record for a TX context
Date: Tue, 20 Oct 2026 12:11:44 -0600
Message-ID: <20261020181147.939575-1-rjethwani@purestorage.com>
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

