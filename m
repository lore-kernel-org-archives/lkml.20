Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854523;
	b=2jrdDw9O6R+dd1oQ78TR0BWxrX/hmKMVl40gJT5A5b4S1ORU00CoWf84Row8TyiqlXg1
	 AYIz1lrXKgZwdniAIRQPjng9s+BmP9TedWRVNysiyHKJnc6VIlzBaL1TcNZLpHFyGQO4F
	 BaXbO4myebbqBoXmNZdMO5QRCYJJeRznrU2NYoVr+g0j338hxhNq6c0p/WQ/8+1T1UmoW
	 Qr4Sa52vGM1AAkbwrCka0GXozW2VUZv95zCZa7TNFhxRq1omST6o5QiyHC0puAHvi7Ja1
	 Wzc/hhTNHp+VIhsOG+EEf3BV5SHh78yU/KVQ+KIGlm0C7yow+2BrEAiZo9LndvTiTxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0K/OpJSJDyeiHFgRi2dD4j6fShhHweBIMHEcvs+4Jvc=;
	b=jTndQ5pDKEO3vM/6uTs2EPAUZVheACvDqx7ZbNFRzhSo6rHthZVNg2kor0QKVdhbW3Cc
	 p/4px0qMQCbSXNLQt+UITN3/y+7jG4RwtG1DbUEJb1roy2HB3BIaH7kijXeN7TQugxoW2
	 Cde8TFr767TgH3GZ1DjbGDgXQw3s5/J6Iz0ZXq51q7/Dg8eZAbmbohqPHrlNuNPldiWbi
	 QqlQFvIKcBmhgVl13c4j4g7eYPHsBdvUtXNHkNrYOcuXV5oWxB5zM21blZ+MJrKd3qbyF
	 ihVQdjmMs0RzPQRb8qMz2+FYBxuuYI4pke6k/EuxO92fQvkNYq8F4X5eEPot6V7P+nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTKYyYeV;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC1606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FC1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTKYyYeV
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso217397a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854522; x=1794459322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0K/OpJSJDyeiHFgRi2dD4j6fShhHweBIMHEcvs+4Jvc=;
        b=mTKYyYeVr7uxttrPBh/zbgdicB4GtUsAEPY7xWdW42ONQLpFWniKAVmHzgolRVnz1R
         7cGjdcpTCPUuQy/A64lwRFiyY3CHLGj3nlqbK6AEQwT2zG7biKPOWYGbyqYZoXfGRvF9
         VMNjEFP/372eFVw5FbTuSsi8X8vRwpvlmPjZMD5VyyudE8jzRBB7z6J5DpdMGoY7Hq5p
         KRhkUg8+WaJVVEcdue/XWCVzhYJgAPz+7SROTuyUkDUJZGvY0euOB/3t+nKtd4g2liXU
         30ygp2YrQxS3ncCjh2vsNdYieq6M3aMH+1rBdw0W/ieO4AuFjVJakOI9Kr5nAz8+hS5n
         ycYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854522; x=1794459322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0K/OpJSJDyeiHFgRi2dD4j6fShhHweBIMHEcvs+4Jvc=;
        b=sgo/p8gtLrp6q4Ata4RFpICAvCEchTX/gYt+Vef+rBvNx0veBWsd0zmqHTgxxwy7rQ
         Z5e4+dkhCPW2HL+YAQ7hFWUtWPQIg/09bY+23fKiYa+3R8IjfWRGBHg9ytQdv5rHMNTF
         hPskAT3n5LF2DUkyPyWL7n1yjgHJ5g2bDufDAjmYL2UPBoQUg47yis/JiEIOjkoilKx9
         Sn43yD5VfP1WYlBx7sV1NB7/qHEH0skuZ1hwaIVPypSxhvE1e4r7Usgx/BCVg38gphPg
         Fw/4ju6qJqRAw3+sW5F35u47enp7+3svnQPub9dw2BlRxrfxJOER6tO50nOePzjhNLZ+
         P3yA==
X-Forwarded-Encrypted: i=1; AKwUvByogBB7ITxzYZn+liCxdXlmTs9LI3u6YlFNjsSkrzjDkHzkIu0C1ncZwRfYDmreUa7IHpiPZLdZp/Akr8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9krbx3ZpdBMj/FxhqmfJVw2nCZewfE67uIPrgisfr78toGgZ8l
	iyGI3Xpo5JFtK1jk84UvevcQIKXxV8ZNZvu5Glcyp7qHC/jz39iN2i9/
X-Gm-Gg: AYBFou2BN+0peMbXJpFMYyWA35pb9rFJcB6Ek52fb0mXHNbgXcTwgU38+2bcmM/Kje9
	l1BfzPBpZTW3hqSYL/mieb0dvA/gSmG9Rxmtu1Zbn/L2v/gX7dpYijXAgtd+5aPj0azHqYYxR2t
	mcvAtFJqLsXK+Qhqpcw6ABylpsBI4oDqhnDNbxkK65CJz1RyQIwONmS6Ib5G1eevrFDlWHAPyj8
	FDlrswuDxZIkqp5+/DIQrBqMZhow1uRfn20oyIgUX6iCuDdJaiQJxK/69/u7kRnSbktJd/2izgw
	Xqum7MLuo6MGPCapqXlwr5PyiuGykQUGX3C7ONm3/4szy5Mz9TpJUrQCqYc9Gce14Yy7YDg3NAP
	CVG98Bv6/JTrr3Vc0OVAWmL16oHNLa3kuK7MtxHzFaEk4w9m8IX2qFS1N/sHbGPB0TuARBjZm7B
	37nOoA3DsGVg3xnlg1SjN186xmy3XFkCAm3HaFrFQ/EVZSGNa0zP5pJmyaf9javyk01SKPrLumf
	tpz+MAhsB2aAoH9/Tl4QNja5d3l+CiXeRszodVyfUnJ7wR9SEq1HB7nUN/kxPaOG0y6dgjMxf4I
	RQbh8rdpD3i/jUQkevQMgi7KAFKRwA0zjCEyEtP7gT6R5HiQubyA6zccZw5N
X-Received: by 2002:a17:90b:4487:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3ae89626108mr25602011a91.2.1793854521680;
        Wed, 04 Nov 2026 20:55:21 -0800 (PST)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944eb1d1sm3726000a91.0.2026.11.04.20.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:55:20 -0800 (PST)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: fuchen.dust@gmail.com
Cc: coreteam@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	pablo@netfilter.org,
	phil@nwl.cc,
	stable@vger.kernel.org
Subject: Re: [PATCH nf v3] netfilter: ipset: fix double free on kernel-side delete during resize
Date: Thu,  5 Nov 2026 12:52:10 +0800
Message-Id: <20261105045210.1179991-1-sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026102957.5530-1-fuchen.dust@gmail.com>
References: <20261025090609.v2reply.4093.fuchen.dust@gmail.com> <20261026102957.5530-1-fuchen.dust@gmail.com>
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

Hi,

I discovered the same double-free during ipset hash resize
and confirmed its exploitability by successfully exploiting it
in my test environment.

While reviewing this fix, I noticed two remaining issues with the
deferred operations in net/netfilter/ipset/ip_set_hash_gen.h:

1. Failure-path replay can resurrect a deleted element.

In mtype_resize(), cleanup clears orig->resizing before reaching the new
drain path. Packet-path operations can then modify the original table
directly, while earlier operations are still waiting in the backlog.

For example, starting with A absent:

  - During resize, a packet-path ADD inserts A into the original table
    and also queues an ADD in orig->ad.
  - A bucket allocation in the resize copy loop fails. cleanup clears
    orig->resizing and waits for an RCU grace period.
  - Before drain replays the backlog, a later packet-path DEL removes A
    from the original table and returns success without queuing a DEL.
  - drain replays the earlier ADD, inserting A again.

The final state therefore contradicts the later successful DEL. Before
this change, the failure path discarded the queued ADD, so this sequence
left A absent.

The set->lock around list_splice_init() protects the list, but does not
serialize replay with packet-path updates under the region locks. The
RCU grace period does not prevent new updates either. Could failure-path
replay preserve ordering with those updates as well as within the backlog?

2. The new deferred-ADD branch can return success without queuing the ADD.

In mtype_add(), the new branch for an existing element sets ret = 0 and
jumps to resize. If allocation of struct mtype_resize_ad fails there,
the existing "Don't bother" path goes to out with ret still zero.

For example, starting with A present:

  - During resize, a packet-path DEL queues a deletion of A, leaving A
    in the original table.
  - A subsequent packet-path ADD of A, without IPSET_FLAG_EXIST, takes
    the new branch.
  - Backlog allocation fails, but the ADD returns success.
  - Replaying the queued DEL leaves A absent because no ADD was queued.

This branch relies entirely on the backlog to preserve the ADD after
the pending DEL. Allocation failure should at least return -ENOMEM for
this deferred-only case, consistent with the deferred-DEL path.

Validation of the two review findings above used a userspace harness
containing the extracted add/delete functions and failure-path replay
code, with lock/RCU stubs. Both sequences produced the incorrect final
state with v3; the corresponding unpatched baseline cases did not.
The baseline was mainline commit 05441d697f7f ("Merge tag 'cocci-7.4-rc1'
of git://git.kernel.org/pub/scm/linux/kernel/git/jlawall/linux"). These
are deterministic control-flow checks, not reproductions on a running
kernel.

This review and the harness were prepared with AI assistance.

Thanks.
