Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437265;
	b=puxY4jd2EnpFZaTa3EX5+iKYWv+Ai9wBGA50PxDSRUjDRjB/4AEGsJ60wReF6Q3cOe3p
	 SuCR0h9Xe30L/VF9JPvpmryt7I66wv3YnvIruUELaMw+0jeuWdEvyc1DDKyBFNCIMhy+M
	 m39bzwYw7ImdV3+qC02Jw5JANau6ABGVIDe+SSAkUIwBSqVa/bbn8PCnn283AzOmLIlRN
	 qNVgG3CZzbDALfE0O3k0YpFIL7FraNIj/JRGBF/PA+iNkonMInbrEr1F3OL9BPr3d2bXv
	 qTyroHszF+yaREw8D1bb8dNGsFHH6uT6EEBf3r7YyLzmhoQg2ZIciDiZHYfLau6Y82w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Dq1hQpydi2wrIY3E+2+cBGacPDEy9liEsySwd8fpB94=;
	b=0vetH5CIiziBpMc8/tFrN4dpz6JcOPUOVK9Isa4HXbW18ONNZKeT9Rj6bXYENNH1B9lE
	 kgxSSZBXxbvURd9Xw6Poi8QBemBtu9PGmi481X6xDyHvfd9dQ1hOsnAg+1KTt0tHK2VQy
	 mUbF1IH1Mn4KZC/Rr27vTMYHDKNFAEUIyEwzBKs82FyDJUxWrImrfY4/VaoH8RpjsHu5o
	 /hNUY4Asq8MczphMGKYHGqV0MHafYndMKIsZ8P2dQGYIffPyu4pvBzGmQUwN5id3Tw66j
	 Ct07IqluKR+kbQwLb7GMM0Lv3AO1oQmtDEAeG2oYIsQ2qWLZgWsiSTZ8bgSmldUHB/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1c6NaCZ;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A67606B750
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A67606B750
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1c6NaCZ
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso2239875eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437264; x=1795042064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dq1hQpydi2wrIY3E+2+cBGacPDEy9liEsySwd8fpB94=;
        b=r1c6NaCZvim/rCQsAEPbradnxzOy1ENh0ovKNL3zF/UsFD9uYRuSyBeIFY8HpYnqlE
         SEzXoTF07pWhFs6Tx3qdY+80IQOWBpr4mtUvE3z2qQCm4zdofOf3cZL9LGQXlYlVnCNg
         wGwuiMKNq9KHXyJS5Fwe+6ug/NZa2Z8QNy9NQ/0/LL6eVrkIqyQuF9+pgtsA9n80p2Oy
         PnYMbNKpENvlhMdek218/PBzd5U9LzIb0EDn4DX/2GzQuxeqxKRrwvMIoaQq7m03LdSf
         JbL6I2F/T5lOKkwKvWj/nPOHwBCpJ6e/qFVH9o6X14X9rfQ3UomsZ8RINrnZqCr9mAdu
         xdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437264; x=1795042064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dq1hQpydi2wrIY3E+2+cBGacPDEy9liEsySwd8fpB94=;
        b=xlpNxDrLEOU2d9CSFBnCpG2M3iePXwlnlLavHV4ZjnpGOowcecElPLbzY8sYWGFhuz
         w5roiLB/Zku5vbNZFrbhkG7adtERrdqM2BciSGo2JDbxyzJ4g15faxROCypOum+SZLSX
         wilUSeOtyoNTuqdqEAxJDA0ERTwmZkzDn7VaFzYQ0ywb2pVuVW7+QLN75U6P3ZLhCdDv
         2jZQM306ho0juzUH25eSTsjfEQ4VIjET9m5XtxlpayGOnjfo1/COQIsB6oQg6h3zM0yO
         HiucWMHC77GZyroh/0/Cou2Ow0Bp3BEPRKP2rC5ozRZn8xePiMvupMC4v1YrlenXJ8Or
         dR4g==
X-Forwarded-Encrypted: i=1; AL+hErG1qyxYHqmQJoO33nNzrWzIRQLnQ8JiynqzVvBp8US4hl5CrcRUBO9fZIe5sTpjl/xVMo6TXi+lKv2LG7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ODwnjaG+2VFaQY0RT+DGOSNl3naqpU2A1WXzw0FZufzBt4l/H
	87o8BIOJVP3qmTwZoasn/N04UIAS4znSo5ad1S94AWRSsD/gvPqpDAdpaolhoMptvus=
X-Gm-Gg: AYBFou3TdL6eCvIQMFEjAdd5gfpVMv8fT6oNQtEa2N+CwpiRJ9kjZYtn8TsCeEbDRy2
	7UkE/AILfJjd5usMkTjR6I+vg3DB3g7W3wsas/jz74AZM9+dVUlgwWacLrlY7vRiUhrZ8H6Zxtq
	zryWAjuJdv13k4ftSfRxvIeIK/v//7uhlnLs86lyZQAtA6uPOamp93R2A4KqQ52iIXZO6EsPcsS
	KydkH//hZGe0+eKkK1ggTC+s1IKyLdRC/JYAI0/EBWIb+4lkxyVMz3NA9u9XCFqkiwaLXYVU1YF
	miHB09rwOeW4NwAej0ri05uGzr+pd9wRmYoFbqSwPbabTFVqto+fM+KF2jnIjXuHNm+c/GODW0w
	5FZLTSaM6Vqtzz9tj2EvmIoq+GXbotTlhI0s2MvdsOCtNtE7ZgCT0zodhkIW9qeeFFWDg6+hIUJ
	N3oRJuIR0lhNt0JPLOpF629r0P1GQ7WCLDEjNh10x+tJic2OKA5s68eOw/2tU3geMFm+LvayOUR
	bdgOPRouPBd5HtrluP1Myou7w4YHYIDIDMaLSeHhaq37TGE5sVI3v7CVUO3ypnDcpzrZfo5SYJU
	VyrADpwDZgfkql2NdAFr8gw=
X-Received: by 2002:a05:693c:65cd:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-37686176002mr4557181eec.20.1794437264329;
        Wed, 11 Nov 2026 14:47:44 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm20837742eec.27.2026.11.11.14.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:44 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	almasrymina@google.com,
	sdf@fomichev.me,
	leitao@debian.org,
	dtatulea@nvidia.com,
	asml.silence@gmail.com,
	bobbyeshleman@meta.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 2/5] net: devmem: charge the frag length to TX skb truesize
Date: Wed, 11 Nov 2026 14:47:37 -0800
Message-ID: <20261111224740.2744522-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
References: <20261111224740.2744522-1-sdf@fomichev.me>
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

Devmem TX charges each frag the net_iov size, PAGE_SIZE today:
zerocopy_fill_skb_from_devmem() adds PAGE_SIZE to skb->truesize per
frag and __zerocopy_sg_from_iter() charges it to sk_wmem_queued. TCP
uncharges in bytes as acked data is trimmed from the skb
(tcp_trim_head()) and uncharges the rest when the skb is freed. A frag
shorter than a page leaves the difference charged until then, which is
small with PAGE_SIZE net_iovs.

TX net_iovs are about to grow up to 2MB, while frags stay bounded by
the skb and many frags share a net_iov. Charging the net_iov size would
charge up to 2MB per frag: a 64KB skb with two frags would charge 4MB
and fill the default 4MB send buffer on its own.

Charge the frag length instead, which also matches what TCP uncharges.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
 net/core/datagram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f8302..489d92fe6dae 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -737,7 +737,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 
 		netmem_inc_ref(net_iov_to_netmem(niov));
 		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
-				       size, PAGE_SIZE);
+				       size, size);
 		iov_iter_advance(from, size);
 		length -= size;
 		i++;
-- 
2.53.0-Meta

