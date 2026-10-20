Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792538025;
	b=fp9iPjpW8p1EvP4AtCblEo4lb4R9/chC7pAM+hoq1S4TlSmmfS/8eRyoKjUS+OV10t9N
	 6SGW/bjQhzQ5kxHTSpSglTnXreIvOZAMnjXkSlr3gZkS0kLWto+/mBuFkkQW7Goa4K/4W
	 BQrlBi34D9CYvGvv+q6bJRgd87uSOWMARWQrUMY0FAQcW6ru1eUWDmCXxPGMjf3dS3U7U
	 +SD+3NI503gvnBrh7vI87OliSLW8bVOsHFcRWt/0nC1qStiI0Q7ie/2Eyu8repHMP1aUi
	 ny62xOssvEGU3yF8abUra9Z0Hxft8Je18GI8mnVqz9liO5fwCNNUmL2AyS8wBkHzXjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rJ15NYGDexAwiy4HWGRqahFWgTYhKLwbhvNqgPq1/FI=;
	b=Y3nfKUqZCkueHq9C3gF/Rszi5PQJqYPQgFn2RBWjR4L8hCnB943D6KmrzqExJ4qCEpCo
	 MgdqDO3En88glKWiST7WuOTcVNAKc1yEXEKURzbowvSQujmYGyal5w1JHaJdjNjKPEsJr
	 0dooBnx10+dFHGfSTpsv0UzdMFfFSZ70pXnhThfaZ9Y1xZayrnMrUVOMF7UP2bZLTz0jm
	 3aFfJi9SV9cDcBW1pNuNMAkOiCbpK82moGuUNDBN9Cxq7aQwG+xL0LEptjDUgo63j+Oxf
	 asKLnwgtihUs+oTsGaHAevxn0kKm81bHoXq/leybyII2XATN5EqKaZoXe+tdpcA5QEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ccTkz4he;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A8606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ccTkz4he
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c4818e4165so128843137.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792538024; x=1793142824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rJ15NYGDexAwiy4HWGRqahFWgTYhKLwbhvNqgPq1/FI=;
        b=ccTkz4he0AFx8q8gX2Y4zERCLVWLeXCKRJcETB4Q4zQmAWIdlDYdokfGMTpUmv9ifb
         lYUZ+G2LBtMNKJegq49JC9MGtwhO8WubETfYqguFaYXh6ThI+T5JHcxfmLYGgv4mNoal
         xzd8btA+WJoJCJs+Sma+SY4qraTuXyxvVe6qwdJGyo9iq3u03yWfe1R3s7BYdv4Xmctf
         56I3WbcJP60v2ZVnFlnsDyqC6Wu6yFZV0TiN4bRPyIi1XL4Ucl0cqX/mP3up8iZG3H8D
         dDmM5+BR8TU7Km7T8Vr1IgSp8FnnB8AhgWssfKKUgFoVwAdJ6Cws1MvBq6hRjWn9E/XQ
         w3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538024; x=1793142824;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJ15NYGDexAwiy4HWGRqahFWgTYhKLwbhvNqgPq1/FI=;
        b=dVTh102cwCTFWvX3Hqbi2xgvfPuJZz0T1qV7ZAXsjfn/LRXwUHr50X8WVlnD9UMDal
         zRDv4XIioo2nvYcKTh+oZ7lRU1y+mwcx0blXeVlwwNn2UPvJd2WZRZjI/rrb4USDDO7C
         LKY4LZ9IaCN3Ge0HczB6CnDf3K8NtCTZRLOP/90TMrdpjplnyXwn21HREy/PTDcdZDY/
         S8R91monzLu2tBY7KQAcYddkxKPLaA4YL+k8mc/47k4udmabcJB23ZFRxMzvlg8pKj1K
         PMISXSvNvNmUhlxsvF6M01mG4Uj1nJSdWNBGCzDMHAHCUGthTW1cpus4u1xaol2MdZJd
         aRQA==
X-Gm-Message-State: AFq9FYKFDSXWzRs98iIYiX+o6Moz+dfgQ1ZOmIac88fZUh+UpKiqeDhx
	J9L2XhktFwqNXOiFFotkHGco2GAOdd8usfDN3cZZq++RFp+tQH757gka
X-Gm-Gg: AYBFou0aIWsnlO75E8NjxuLaOZDQFF4Fxb5WGLTogXicLNLYofd9yvC2hIlBrgIqtTU
	VONFFphC63VnxZFcILTigcE5YeQwKVFSDebSpzhLk0IuLaO4NiGRcEeroN8LpVlXRstnw+q7Jzf
	mhdY+cDr6/BUdTtA7p+RqMR/IWiUgnLI78uVfqlfkfqolGThOaNq2/1ieRoxzjcEZuILLA27rxR
	+DUeplDuGfbhGNPL6IbHYpmBGyUdlLgRwE/8ZIegP23IH5tMwq9grGSvy4nmg69z4nNjzl3JBSf
	yn/XPbMfU97rWbMEIp34iZCrP2NHZ9SRea7mawd/xJB2cbY+4XVrzIjRTvevO1IdcE+qqrX4BgG
	fQAIb8TNLNXQR2tLxlxouUcvb5jQOOaPpApIuOlHtZawsz5wRk7pyHAfB3PBLzT1L+cSMfPhSYH
	pG0GV6mknND8PtKVs+lF8sR1CocP7NcP/DVAd7ltw/R6JTeGw/LqEO/HYUGIoGgB4eFlTValYxU
	i5DKkZjFFb9YNaq8zXEIvBqQauPBAzyLnligWhOmysvIUOvyzGKtqj6RgOAa8XQcGI7WpSPvNrR
	XjP3D26It/Gr4DqvPtBjo/y26ar20p+4p3GwSA==
X-Received: by 2002:a05:6102:291f:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7cc926d26a9mr190460137.6.1792538023910;
        Tue, 20 Oct 2026 16:13:43 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc9236f63csm803396137.5.2026.10.20.16.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:13:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:13:42 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Simon Horman <horms@kernel.org>, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.34b42ddc625c5@gmail.com>
In-Reply-To: <20261020165610-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020165610-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH net v3 6/8] net: add a sysctl to opt out of virtio net hdr
 checksum validation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > > +/*
> > > + * Protects changes to virtio_net_hdr_csum_check_disabled_key and each
> > > + * net->core.sysctl_virtio_net_hdr_csum_check. Readers don't use a lock.
> > 
> > it appears that they take the mutex_lock below
> 
> Some of them? But
> virtio_net_hdr_csum_check_disabled doesn't, that's the point, right?
> 
Yes, but the statement is then too absolute:
_some_ (or most) readers don't use a lock.

