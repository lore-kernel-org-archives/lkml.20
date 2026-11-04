Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773559;
	b=BW9gRQrmR0D5pFpR5OnhjiWIm2OYFxMAizlTfgeMAYQKXp2pRlUbxWrkU3sSEZCOdSBH
	 SL8AIXqT/VMtI3ZZI/1wy1fzyVdP6M6IC+VJudymg72iEex9kyfoG3VeWyvve5ZyfLrS+
	 akL4PJ7ef8mGXeRXr7Uj6FmcfLrGtjFIL7pMpSubUhEBhANqg0O8aRz8bN8wiYB9Utz+Y
	 4RStVigbpcCQV9jRrXV92iX8NUqEXNlarU9XvpvCiKmoSBuuF4d2S3abKhq2ZjmA3ddB5
	 Vkm9wjWuGhPF044mk4NGmw1ch3rTKtSkEdq1Mx0FTTLssmyxgTWdSo/2ZUi1dZ+YuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Eed9z5suww4/zRV4jVvjzbO04jNWYIPB5y+W3yGdy9E=;
	b=u2SLCWurtO85v+dDQZ9z3mtTNNRbxwgc06MvuFu9heDxuBUgehKuQoWVHL0dW11tISIg
	 Xpz/r3N1yYi89bULeullyY6G2XFTmoJeeAOqNfZEJnf4wkCe5GM58Q7L1KxbB5B0WMzkJ
	 gCGF+cQLBu0ceZaiZPNTp709nZx1DqK7mcqSD3iORt9XFzevTEtDlDWUEXFFw2rtZ18lS
	 XnQZnF++T/qAb958g1Aw9LjYJ11pBkn5UEi2rEKlHl/A1UoVNdgyIJr6SWDRgzaRk2aPE
	 6IFoY4ZVhX3gme71eGv7p48uUwCtanFcopuhpt7616UgaSLBMVonID2GyxFtjsP6brw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=UM4QTsp+;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C096C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C096C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=UM4QTsp+
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso223891a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793773558; x=1794378358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eed9z5suww4/zRV4jVvjzbO04jNWYIPB5y+W3yGdy9E=;
        b=UM4QTsp+PqpxBSBnGqCzNhSX3eLBiKNzmrQYPknx4q2n0jGhih7gClXbRIzKaj1Tyl
         b2Druavk7Sm7f9O5NktMHL0U7eOtBcRv2rkls8rBpmfL55JVLpT4sEgGw5GDMTRcMNVE
         dzX8ZP57XnfnaPvxoh6ZPTZxMoClmZSaGi5i+ANPUmFLTgNkVDXcJ1tsaoFYESnIpTn1
         Zf/1DUI22oiGY5T5c3Ks6BgVnnWSJ2L3SHgF/PRxOLZDOP6M8KX6ynX4tKw/CBrTU98l
         yiw9ILmlTGooTjid//JulEprh/ZCbowjDfZWhNPwzgK0SCAMA4FpgZ0WhalKRDPENsjt
         hnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773558; x=1794378358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eed9z5suww4/zRV4jVvjzbO04jNWYIPB5y+W3yGdy9E=;
        b=hvaVM5o3OuIFPJyYVQIolvh8TC81b4y8WWiye0HEEMibMqipkoBrfV2wmKXEBanNc3
         ZQrx0oHpfPI/nF8HbudnceOoIwWtTqcHQE8bhjpqrWROSCSwFxOOZ9zf0ok3u8vjWZiX
         jZz1M1vN34EPFPxnAO0nFXjV0xGjsigJd0TDy9yy5G5jtrYjsGYN+c6/mlRJOaJO+oCv
         LCR/gy34iy7M+ZQVrDleeDqfU3JHFBZ8Hr3nlXpuO0d9Cok2xmgGKAPXtS+riZUOrWzp
         Mk92OHQlfIaFNCV8AwczpYlKabmCzNOjY7svb4HwaZfUc2Po2eiB9ZUh8y+5oyL0kiAN
         3M8w==
X-Forwarded-Encrypted: i=1; AKwUvBxURjeQ2PLHx881bfZCQwYDlYbJXYI11qrNRSm1Laj9TDXwk6VkaltPF/vRM7VbeT9WM9kx6NvT4sbQnRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z85TcJGdWhK1+YFrCy54yXWIfdQFtlUBCB11sXvl/T9msFMYcVE
	04yxYTbNUOv0Rmilo0wUkfPF4oUOaznuU8RmU7SDGTpk+96BWVm3sIql3xTRfV763i0=
X-Gm-Gg: AYBFou1KH76rukEs9E3m6SEbZo7C9At0I2KO+AnCciiuoiYD8rvqHrv6Yf8/StxsgaP
	mj/LeMyis7LieiGyLGsij1HhbBKiWkf0DI7hhWFxEvPmrDEfynG3hbJt/KKqkflr5srOa0dmio0
	oY6w0Pd/fjjqm/3loPhEMmSx83hEwpBB/5qf1BPJ74M6BsHMFXvC51+isVWOHN2V0vWHzNpo89o
	heOus64ZTH7iZqWDAxrnFgJUbpDWXG7MaLZNBYoYiNxmZ6kMQwSNRUOmEVygnIYy7yAncaxI1I/
	yMp3sAnaZ46qrRQkg3S9JpGoNKcgsuQe4ZLIzAJ+HhUKYoWZKv8qj6fk/ULdGTp2nqD41hybj46
	cSKSJdi7IvYFN5mjUTU0UHfN/y1eiDo9P6AXSFqsf7PrB1rQ7yVdz29GiZYUKGJwyjkL02XGSE8
	98iec7KscJH8zzHmUUjg0qxnlebDTeOLQ3k8OHjYGkaFxD5TCHhQUIgFLnwwCzSkTiPfN2lfpGQ
	azdNCPdF5cyU9CjKztNdFJEdDKY26tMG30DYF5L6QhcrBFAIrBlP0QY+GRfUj47IMe2J+CWTuig
	oQLvmegk2u6spNfGQ0z3/NZp6KyLS0lWKW5E8g==
X-Received: by 2002:a17:90a:c886:b0:3ac:80dc:f407 with SMTP id 98e67ed59e1d1-3ae89865dcfmr11962403a91.60.1793773558155;
        Tue, 03 Nov 2026 22:25:58 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F ([61.251.99.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093c499a5sm2672357a91.2.2026.11.03.22.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:25:57 -0800 (PST)
Date: Wed, 4 Nov 2026 01:25:24 -0500
From: Gregory Price <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, akpm@linux-foundation.org, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, kasong@tencent.com,
	qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org,
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
	baoquan.he@linux.dev, baolin.wang@linux.alibaba.com,
	rientjes@google.com, rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, muchun.song@linux.dev,
	osalvador@suse.de, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	ying.huang@linux.alibaba.com, brendan.jackman@linux.dev,
	hannes@cmpxchg.org, bigeasy@linutronix.de, clrkwllms@kernel.org,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, Bessel.Wang@huawei.com,
	jiang.liu@huawei.com, mgorman@techsingularity.net,
	anshuman.khandual@arm.com, stable@vger.kernel.org
Subject: Re: [PATCH v5 07/12] mm/mmzone: read each zoneref slot once when
 filtering by nodemask
Message-ID: <aurP1MUp8HhhjV75@gourry-fedora-PF4VCD3F>
References: <20261101021340.2251928-1-gourry@gourry.net>
 <20261101021340.2251928-8-gourry@gourry.net>
 <DML8OO28WT5O.3U6NG100XWKZP@nvidia.com>
 <a5270059-e5a7-4c8a-9f04-96135f79ea72@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5270059-e5a7-4c8a-9f04-96135f79ea72@kernel.org>

On Tue, Nov 03, 2026 at 04:00:45PM +0100, Vlastimil Babka (SUSE) wrote:
> > 
> > It is better to spell out the rename from zref_in_nodemask() to
> > zone_in_nodemask().
> 
> Added:
> 
> To achieve that, rename zref_in_nodemask() to zone_in_nodemask() and
> pass a zone instead of zoneref pointer.
>

ack.  Assuming you don't need me to respin just for that.

~Gregory
