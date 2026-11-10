Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309813;
	b=m0fYj+sfheam8rWSc634jGH9DMVu40hSvE0xzqrWCE6igvVBjtAEESIDI0JZLzsXQXaQ
	 KT4h8ina319GtOdm8Ds3IGG3Az0EHswkT7oKAyTy0GGJvujMOSCX+xw1X+CUVOiZry4OR
	 6aQv49uP9tA41A5vH9vUt5IYKnBrIU5MvHx4oC10AhoCEQcRyQnaaI0FQVk1wW1AVUd9j
	 9zAD/4+oBwqDiWtAWKTSMvStLtORIh/HKIOR7GoqZTK/N5HxVxhg2p7f3S3ltYybydsCz
	 BW9NohFOgetfl6vjGyJU9c1zQdDyCNBiaVB4nVS0wPLfu7gjKhfBb0LxyALAR5NigTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309813;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nV9RvqWkqqUe9ueUa8RJ8XBgYpSS/wqmTlJFvrZtdGY=;
	b=ScX9mIYd1o39NQdr+zIBHkDbBDvuaKIK//NKqrhtv78g6FozYSKFQANTuxKYjdiSxd8h
	 Inw97pSEdoO5Xq0x8NP6RVyUd36us1VlyJTXVBF+9JynqJaYEuyC6A2K405sICVeyUN+R
	 09eNAoVXZNSEyBmUoCg+mD2i/BUezLQe+zgc02Wh45jVqzwKxbwtuYIR9l0VCTqXve3Yu
	 XM1U6bnHwAnDv/rc5t317AdMw4jKlu8MXtREE9TSlb4u7nDTBDS+lqNTCX4UUm0toOQad
	 WKdOAEWbUHju6vKArFyJKcz6D9ijv7W7JOxTKus+kjgWhto7EbXTkQQCsxrcwNdGiVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZyWx7RL;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QWkKDBsD;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE595606A338
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE595606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZyWx7RL;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QWkKDBsD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794309812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nV9RvqWkqqUe9ueUa8RJ8XBgYpSS/wqmTlJFvrZtdGY=;
	b=WZyWx7RLZl8/87J+rl0GXTRSdMWDaee47nzWclSU2pErmahfP+9WTKvw51Tf7P+AZe0zY2
	YB809PL/xCnXYgIuWLOu/BYdsoVEfv2I+gg9HtHdjsxDi9O8ZoT9eOCqkXrvuJKopMnbod
	Tys/yAooFKO6GDSmSgUCVLSrhhHriOQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-4eFD0HZ4PCCa5jUFr124xQ-1; Tue, 10 Nov 2026 06:23:30 -0500
X-MC-Unique: 4eFD0HZ4PCCa5jUFr124xQ-1
X-Mimecast-MFC-AGG-ID: 4eFD0HZ4PCCa5jUFr124xQ_1794309810
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eacf20364so39081666d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794309810; x=1794914610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nV9RvqWkqqUe9ueUa8RJ8XBgYpSS/wqmTlJFvrZtdGY=;
        b=QWkKDBsD0uJYwZXf23UgXt4i2t1fP81+Zl8jbuaC64YRBRMTmY07eb6Ylz93KcUXfq
         gBuLXREvTCVXqL1aZ/BE4xPh/xBhnQH1MQ3Jzk9zz8McrKMZVl1KHZPy/dRVggh9jtgO
         K/3ytAFg3LGfHZdO3LF/HBa6ajBlHXB7MCbJV79zMVqt6zlay1XOP12eOLkJ5fbYg/qM
         IyefqyoS9+LO0c5OkkQhrrjyv4ZzuBYyk5V3TiPx5C3c/D3IGU/T4iPrWJH+TRZbyQTH
         3XmIDqpwlhKNlqoaHJF6dTWtpYSwmOZagBENPlibF4zU3cIacfDrd9SZUvF9kIImvO/n
         6NpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309810; x=1794914610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nV9RvqWkqqUe9ueUa8RJ8XBgYpSS/wqmTlJFvrZtdGY=;
        b=yAjArmc0XFfVQ+pB1670YHM2pAN6/bJoN1QBcru8b2VSTMervAttB02UIW1x5JYDcb
         y6xgyVPnMIgh4iydRydvrKVdxdnLl1AsZ0P+eos/MdRpi/lFAmj04a98mJo+wtPPyIi3
         PhSne9/j1o7BdohngcxVtvRbGWhOkAvlfnCz3yRNKAOS2963jcsHawOJWqP9dcgkwchc
         KL2sC0beP3TPXVPeRuQJSgtDVWwPvCzqet66fA2f/EFb1Bsycw01cqluZl+iYYAkatiI
         Yb8eJNkLr1HG+v2tnFLOqBKGlmgHR0xaEwGZz4Vbj2XWkGTZ9y5j+CG+Ay0DdhDGtdSM
         /VSQ==
X-Forwarded-Encrypted: i=1; AL+hErFD0cs1SFTb31qtTwtHpeM1VSndzP8qnoRUCQxrioeqL25xi0UMkoGU9TXNn4gnBVsRa47fMhiT3iTaieQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CuWh2zDj3UIKRWMav0Azj4KjqjwViphlMfyu2dlT7ayjlrWyO
	nRrg68B8POkQSjYInW1L+5c2FAGBvqNqpvHdPDzXih3CtPzqveRtYyWasgCqtSp30+DU+VK3a00
	Na7Ps0TTaFETZPmjoDbDOw9eDPsq005DJ0vgLnjZy+PSDeFMlDzY2AxVMrxwtlpxpyA==
X-Gm-Gg: AYBFou0dqGbLUYVWsnneQhEpu/TBhu75X39dLam+AEvk+3zC77tjgileC/4qUPjKFKJ
	GUdqzeAcPAHs5yRjwychg8m4pjZFeHzB4etKeKGUUspoS6I3CKTcf40HpqFmTmzwGWBDObyx+N2
	vTZGG64VKVrKtxDJN3f1zrlVzfb8O1GeSlqG/MkqTTFODxa3zoltxsQMF977ckrd8L+id9aJ7/g
	WxZA1rqJ+/sjRwHwuG99ISnu180+tIxorHVLsYeLUntABlctMMcxk6POfQIGybssS9X7U0M1zKc
	TuQQqaBx9kzjXWLpL++JgdlPCJaUAiBBkHimrQAie5iXwxzaYRGHqvkl9Tbqh/Qm7qj4UGmzNdh
	MvZBdW4sTQfhxdgVDcJ0wQkQXm4hAG80FLax1SR/wIpvTr5evrWdZgcFQhI/PuM5sK1OFdWLxjj
	b+QmmLy7mtkAnnoBrplTkASfWT8HOxDGqBZQeIRWIWZzFqtZdTQ/jtMIbga0IKGbg3vtH+4wKge
	xLVzLm8ZSBkpPikFNQm9Bw63b6aGa54TU98TlDeNjnywjqq5lz7
X-Received: by 2002:a05:6214:21e5:b0:91c:cd1f:2471 with SMTP id 6a1803df08f44-91eef81b291mr39214046d6.22.1794309810136;
        Tue, 10 Nov 2026 03:23:30 -0800 (PST)
X-Received: by 2002:a05:6214:21e5:b0:91c:cd1f:2471 with SMTP id 6a1803df08f44-91eef81b291mr39213586d6.22.1794309809498;
        Tue, 10 Nov 2026 03:23:29 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04e7315sm18569186d6.22.2026.11.10.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:23:29 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 1/4] net: preserve splice iterator progress on rejection
Date: Tue, 10 Nov 2026 11:23:22 +0000
Message-Id: <20261110112325.3263078-2-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110112325.3263078-1-amarkuze@redhat.com>
References: <20261110112325.3263078-1-amarkuze@redhat.com>
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

When the iterator is nonempty and the maximum length is zero, the generic
extraction path reports -EIO instead of performing a no-op. Return zero
before attempting extraction.

The extractor advances the iterator before checking whether the pages can
be sent. If a page is rejected, revert the unappended extraction
remainder, as the fragment-append failure path already does. This keeps
an accepted prefix and leaves the rejected suffix available to the caller.

Fixes: 2e910b95329c ("net: Add a function to splice pages into an skbuff for MSG_SPLICE_PAGES")
Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 net/core/skbuff.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f676411724..ee7a1bc72cc2 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7554,6 +7554,9 @@ ssize_t skb_splice_from_iter(struct sk_buff *skb, struct iov_iter *iter,
 	ssize_t spliced = 0, ret = 0;
 	unsigned int i;
 
+	if (!maxsize)
+		return 0;
+
 	while (iter->count > 0) {
 		ssize_t space, nr, len;
 		size_t off;
@@ -7578,8 +7581,10 @@ ssize_t skb_splice_from_iter(struct sk_buff *skb, struct iov_iter *iter,
 			size_t part = min_t(size_t, PAGE_SIZE - off, len);
 
 			ret = -EIO;
-			if (WARN_ON_ONCE(!sendpage_ok(page)))
+			if (WARN_ON_ONCE(!sendpage_ok(page))) {
+				iov_iter_revert(iter, len);
 				goto out;
+			}
 
 			ret = skb_append_pagefrags(skb, page, off, part,
 						   frag_limit);

base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
-- 
2.34.1

