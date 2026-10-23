Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741919;
	b=4pLFu7VwptHvaYbNxrJuU8+agZTFMcQlJshyQIyuuneKlHCr4KXGSaIUAf1APN53r7px
	 a0edW7zR90fb1yCrcaQszz/U/CkBff25/RHP36uAMfXxq8EkdtcZhQ/RcWvVE8h7rvSvP
	 8B7Ira3l60j1d9s0A67t01Y7sjvwaAEFUHaW+qRawQvFSMMSMMNRPsTWyIbuEExz+IzgD
	 5yL21EJBhgtR6rTi2dwwTUnP3aPS4ijOf6gShRq3enrVYU2ErrhEB8CS2EEbTBA2wbCyl
	 u9laSYRyaYihIsk3NW+syV/goks2kp5unLWHWRGhoeqzYIdRc7b6t9F1pxeTP8LTXLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YqasG4hoa5HMln8cuz36jlojNM8+bH53t/aSP0CVnp8=;
	b=buIA+X3yYoyf5XetpnbLXIdhz1h053C7O0Yu7pTtrJFka3nPg4kwzLX5cBGjh7sjI/nC
	 T8fbXpTUVq4ITCR0jYcO5VYPqfyTXj9KVIo8BuzMzcEt15ciIxvGTWN4f6BJFFjLJlhog
	 vWHBz5OVMFAe+KOVyvjDVVD+5M7voJIcmCmGJpOmuKjE0CN0UeF+GfidsuB94+sLGSulj
	 S7HZEHhk4yTS/WdFN/3f9iJFBvYh4co0RwZXVMCRJpkBcd+cTeiSZpGRdfH8v4seVse/q
	 CHL4Kq+eFjY6Bu/Hcv6jKIqikm3jmIaueAhm+hlxeQbCBcJ6MX0zAfbsMSczP39mtAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RACWuQxq;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238960A260F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2238960A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RACWuQxq
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ea7190aea1so2520545ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741918; x=1793346718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqasG4hoa5HMln8cuz36jlojNM8+bH53t/aSP0CVnp8=;
        b=RACWuQxqcNvxZdCaZkfaqIrUNiPiYMBz5+g6sqBaI+yYIWvMYlPkMnUBWaiKQID20f
         bh2Cf3hmYtKlRrrkw7TbIPZRI+BPP2zGFWKj57/PIlqsbw9+8Haf1V5bs5dDRM96eNJc
         oQ7+LK+uvdX85peHEnZ5eltX6FH8J7DGBj+3uPXtWNSXuhwKtd9VIsIbAVlppPnkIJ3n
         lgUYHZJsb6OxDwAXLpzlISBSrzFyrRUa2GPhpiP1Vpce6lVuo69sPz3NKWKb0s51L+gi
         M7UPzlUqfiH0Y8WvsePP3dfmCqRC8Jv+OqfolzDJri0D3izC3LaPXwXNovw6Hp+QOwi5
         vRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741918; x=1793346718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqasG4hoa5HMln8cuz36jlojNM8+bH53t/aSP0CVnp8=;
        b=lP0QRfe3VaQD9Gd98HLL0IphFfN7POw3QkPw9J6/DjUMnixiDbALFniT2UbIxoYm3p
         5bRbJ1ewR4fa/dCKVqWmHvMiglWdaTWqgFdkoXiHQilu9bcZEOkh4cqhB5VCfu6kHo0y
         /iGkW9vcD84MCipIuVomdtV5EPenKl2nNyulE/u/JJ2In900n9KsY0hB/ySxd8akREbS
         YWyRfSa4ewAHj79rNfAB8/gq5rp5fLpQZrYauOG8nd/rdxSAV/j4pesPX10gPaZCJ1E4
         mRdWDuH4ApXYQTPUe7trUV42Leaq2Im9mpJihWwc7ihPyxCmFS2mYg6NQWS/VnaD8pUj
         p80g==
X-Forwarded-Encrypted: i=1; AKwUvBzQJrqT0pEqX+16ZdjKvsNKB+f0+MvD8qv+OhFcelW54dEWCFWLlceMdWAj2RlE0y00LH0EqO2X1ZArsGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUaTqUYPk0zsF3FrAgZnSTpAbPrYgm8xnQVqG0kHioImiG96Jg
	3dUluD5fEdtBZjoM6UzSpJ8y+VmFzj4R8Tyuwb/EiBmxf5bJgNzhGbeY
X-Gm-Gg: AYBFou3HefsGslyom3+eL/xGCuaDK3VOFwUL+DqGDHNBLBS5h2eu9VbP2kSGnd91SaE
	DqribmY9MDSsftBiM6+V4tgQuDQbR6tEyFxIi282MW+ekUEjXYpq7tGEX7ziwHJn9AZxxYo0qBS
	+HfI5d3JlJgVhtfcOf5vS5XpU70NzBEk+Yz8B4MoT1jg5CR9UXWWJB/hkJtGl/tZqK2aInjuY89
	3KJXTMKGi8OazrVkE2Cc2CkSG6H5Rb5AfDeA4m8es7sTd8Kbyfm7jVGm5Tl6kZvUKcR5kGqUukd
	MukCDTaJxnOy8Oq+CKdQfe0q0rbLaXGhqcm7hwMwS9xtwJCmT8pDHQIxTDq2dP1y91UqI4Mz4RA
	8qaKZ1D54CKcTCZTF6ef9ptE+UUoPfOrjVa46EpEO5lE+abhgXhtp8exvZgXjRVYB34A4Xpcaad
	GHLVD7ZxjeYHV6RCPR5WkhXwyxrxZ0unQfvm9wx466ewRxQEI+BN+/YYK0eNnmJmBM+gju0LR0A
	g8odwwG1vMNs26ci4sYAfV3YzY+U5kc5CtivIGbCPf3SmFWeJdqIl8y6xPTHMVbt3YsxjUfkpyq
	bdU=
X-Received: by 2002:a17:903:26c7:b0:2e9:6be2:1296 with SMTP id d9443c01a7336-2ea7c330b3bmr15087225ad.56.1792741918158;
        Fri, 23 Oct 2026 00:51:58 -0700 (PDT)
Received: from gmail.com ([185.220.236.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b368c90sm7208265ad.29.2026.10.23.00.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:51:57 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: netdev@vger.kernel.org
Cc: stefanha@redhat.com,
	sgarzare@redhat.com,
	bobbyeshleman@meta.com,
	mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 2/5] vsock/virtio: factor RX skb metadata budget check
Date: Fri, 23 Oct 2026 15:51:37 +0800
Message-Id: <20261023075140.9613-3-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023075140.9613-1-physicalmtea@gmail.com>
References: <20261023075140.9613-1-physicalmtea@gmail.com>
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

Extract the skb metadata budget check from virtio_transport_inc_rx_pkt()
into virtio_transport_rx_buf_full().

The helper retains the existing condition and will be reused by a
following RX batching change.

Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 net/vmw_vsock/virtio_transport_common.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 43325d7aebbb1..2a9cfed085515 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -576,11 +576,17 @@ virtio_transport_collapse_rx_queue(struct virtio_vsock_sock *vvs,
 	skb_queue_splice(&new_queue, &vvs->rx_queue);
 }
 
-static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
-					u32 len)
+static bool
+virtio_transport_rx_buf_full(struct virtio_vsock_sock *vvs)
 {
 	u64 skb_overhead = (skb_queue_len(&vvs->rx_queue) + 1) * SKB_TRUESIZE(0);
 
+	return skb_overhead > vvs->buf_alloc;
+}
+
+static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
+					u32 len)
+{
 	/* Allow at most buf_alloc * 2 total budget (payload + overhead),
 	 * similar to how SO_RCVBUF is doubled to reserve space for sk_buff
 	 * metadata. Check payload against buf_alloc to be sure the other
@@ -588,7 +594,7 @@ static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
 	 * queue growth.
 	 */
 	if ((u64)vvs->buf_used + len > vvs->buf_alloc ||
-	    skb_overhead > vvs->buf_alloc)
+	    virtio_transport_rx_buf_full(vvs))
 		return false;
 
 	vvs->rx_bytes += len;
-- 
2.53.0

