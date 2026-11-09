Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248959;
	b=NmrV0/wzhyl8NrthIBcbZGSL1YUiUlprCtalKFcSIUfnZ0DecuaTdJDRWorxBDSbZfXr
	 2tkPz6TXWYErL+TQtTYSiTqHajv2P7NmOGMd1B07G3fQFbcS/0z9uQO4Ki1oifks92cCz
	 gRHKTMhPStcBJGNRrWBdrgMPoSZwDI/NeYBC7gW5EX9QmEySWvVOMiX3X7lOE7LtIEkNH
	 4gQSZZeBsMhesqZnaP5osYoB8ffcEVh7+0W68P55FWlpzwxyMktQBTEQm1z3fPDbwzmIq
	 jRH1FuO9hBGdeJb94EC41eIDB34pgbo1OfpB5PS5zkCTcgEKky4NJoMYqXA8adqVElA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
	b=uFsq5zn8u/xz6GSXZ2B9WV+y2OwAiH95mL4Kr6ZmryKSIJ65iUGONrC2HIxFbWXXSqbo
	 GjKvlk4gODDlxWGu2P+V/4BO+KbR0pVYgfq4b1YyIKuVFRAGBnGz5ExtGqx9r7oQQyBfo
	 jOkkfPyhxYJRRKBeVBnwyni85lgPs2Hn6EN/tr0CY16sKgb9fLl7Qb5zUxx9uFwNxGnRT
	 tsf6GDvbHxzADMtENTJ5Rlmv+TLhZJmESf3vQdLqOaQT5bX0q5lawHB0F94zV8P1lYB5E
	 KKzokDQ1nGxyX74bpy2PHDKKc3EFkCvB0GEBtl97odhRMZmYKJvcDWivnW/iMDfeq5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLFcnmT1;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA623606A5C0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA623606A5C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLFcnmT1
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so550148eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248958; x=1794853758; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
        b=jLFcnmT1udEkBHH8ARZmBU+AHoffdfpm15WgGjDE73KYjuYejVwNQNw4vhBCFbzzSZ
         3HdPMNTl/3sOA+nmNz9n9I3cN0gI1TLo2PuQhNV9jjJ2mdGIaLXQuSR9lEXNTqJtiEGT
         b0ali9Y0D/2oBxr5WuI6PYyCSKic/EPQHdL40/bxKAyTduon4WIMOaG8Czke1mc5FuAn
         7NXD3qXGcob7VykrCwbrZOpUZfPsRvMEcatTaNLvZ4DB/VrDCPWBmccSqLSG4klLZ3zF
         cOKVFzgLV1jlFqnSNxPQQiCRxZa/1qLNeXnSMrUteziGLz6fVM/kBOjY5Xi1sgYAs/5P
         UlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248958; x=1794853758;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
        b=0PtFqfuV57yewC0DuXR0494lwYlnu/AJBeRGyq/kg+y3tTEg9Sw+q1iHcNZ5VJMfTQ
         mmbo4DiHWRjKNfEHhawfy5b7XEid9dMUmRMWqYz5qiQjmOrqqyp7ONkZSuXMvQeOBnZs
         sD/D367gw/xqTYBEqllEusH9Rs0whQqgrndIxMAF4GgFBp/xLL3+kxZvxTKUzGQO7nBr
         Q+adAn04rqDDtaFU1y3UdTdGAJZ16J26EmRnyLT2y7BAaxNCqL4Gi/V5180pWEiL+mf7
         96HuLD44fF7fJBdGppbMn8DXQsitiraDKkPR/WKUqxWvH25BH9JaPn45Q0mSmzk5Sr4T
         SgAQ==
X-Forwarded-Encrypted: i=1; AL+hErGi09kX6e7V3hHXliGpA54OEqdVmNXKU/ck6dTZlK5kZ+H5yp7tPgqH+V7OxN2m19DWtYkHCUnsga2RC3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sdzEPhU44nLe0vBY7BVFNsWzN5xH0wnx34VJDhGJw3En0XO5d
	jRmXqZYIwGyFabTEMyWunn5BmWH2IG/jHfMJ5HgcyWW9IhpBMx7sEIiN
X-Gm-Gg: AYBFou06WpeSRbOYKQ2Ivpji7bhl1QReT2fjXoKVzWeNiVIdQnLQJr/UZOZr7RHj4VB
	JvaDCKlPgr4J/Tsxslas/XzLrOu03Q779c1lQql7Hag8YcFKqCWpE7TbiOSJdqLi6H6DuXsHzUZ
	/IhQbmq8HWMxciC3Z8fwMPM8YuZn5FbjugAv+lGQv4TMqGwWyrAQTYmEGT5riVVFJ+flvNV1Oh8
	24rGPoVU87/xwt8DXYvtytBPkJK/+5lSV/TnU2G5A5cTeqvhR6ApzrXIr434AqSDuK/QX5gG6W3
	LeaKep3nbSWTTNduVOZ+xOf/ia7qgv5Fs434O5xBlk7WJQXAbPDDc5jNEkCZlkUeTiIhej3Gawn
	GtQSLCM7u2g1snfcg8ziU7yHxUSeitAxV7CzytaKMi9li15a0dasNo2Ky2yIKoLi1HK7jjGtaHY
	GPtDDxRv/X0QvXPiqtSkfWoaAOZ63yrZ7y1OKOs8WWuDazy2mDWNmVbZrAJutCqRfXuk+vB1cn2
	rNE5mv7SAxhJWpvbHmHWJ361Q1c8OtoZwcT9OL1onD7qF8wYwJMhK49dXdDG6vOeXG51jiZff5Z
	ygI6O8WR03OoufVlRFEEEcQIxQbE4IjGXMUME66qSIhO
X-Received: by 2002:a05:7022:b90c:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1b3b5fd4344mr353755c88.15.1794248957752;
        Mon, 09 Nov 2026 10:29:17 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm722817c88.2.2026.11.09.10.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:17 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:16 -0800
Message-ID: <3d2b8463b7ea74cde9327a3b8678f1e5@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418738408.994134.12387400537759262351@kernel.org>
Subject: Re: [PATCH net-next v3 8/9] net: devmem: size TX net_iovs from the
 dmabuf sg table
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

> [Severity: Medium]
> netdev_nl_bind_tx_doit() now passes niov_shift == 0, so a hugepage-backed
> dmabuf gets 2MB TX net_iovs. Can a devmem TX frag then end up larger than
> dev->netmem_tx_max_frag_size?

[..]

> Is a cap applied only at build time enough to keep that contract?

It's not, same as reported for patch 4. In v4 tcp_clone_payload()
won't merge net_iov frags, which keeps the cap with large net_iovs.

> There is also a related issue in the same code. It is pre-existing and
> was not introduced by this patch.

[..]

> Would either of these fix both problems:
> 
>   - compare skb_frag_netmem() and apply binding->tx_max_frag_size in
>     tcp_clone_payload()
>   - don't coalesce unreadable skbs when building MTU probes

Not merging net_iov frags in tcp_clone_payload() fixes both. Mina's
series also compares skb_frag_netmem() there:
https://lore.kernel.org/netdev/20261108013838.1454450-3-almasrymina@google.com/
