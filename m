Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745818;
	b=5BoYJS12WI0Gzz3pmdXP4VzwmS2GakkqkkAnNZRm0fsD9gKqVIJ0S44P+4cXpT3Fj8hB
	 b4FidM9HFUTQoOTK8GVnlJkJYMEDb1y+5y2swKQFO2rGVnIDviu9p7kjk5V9iAT8GAyFE
	 CFDYc6SXEBFti9Rw514CDxTdZ45uVZZaK8s17YmmoIoDseHhtdj6a+c0p2B5/9+FOkOJm
	 Bc1p7FxUuTEc/NyXzSibXXiRAepEjVzOeEfbUOHekcjK9lhm1fnadiuMTkUgXIAwMRSLp
	 kbanVs8Do21XMqwHj0bIRIut/dr3UyPc1gGg4WQk5bqZlDexJHxb7TjE1TLPMjHYsOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TEsmJhHG6UzOUAsN1CLfuPQCNGFTSJjKfJhnGZfHeUo=;
	b=urjhKRClYK8MLklIZMFDOsO/lRfzktl9UIkNEufpADn2HBwuafbJ9t8632c5X7R9H2cp
	 TXvPxJQ2Ft43ktVuFlBkz2FM4/X6J5GMNtT1pCLRrRM4f4D5y19/Hl5qXpiSTnTR2SSTZ
	 L/J0rQtmBomzdIEg2B/X07z42LUraGbYgEoZkVPLTVvY9TAxTc7TE6NM2KZpMC1CIa7lC
	 3K4UQzEfadWHHh/LYovChfB4cvbCJwbt44l1vLgnpn0XFpCnUADeA+cIMKNHxm3xcoIzF
	 9TP0sYb0d7IbyWzlvnUnwhf7uoMqQFuyPWmEXyMoGQ2yGBsShRRKxXEiPpYpLA2ZwDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nSm1Ta/L";
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F82606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F82606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSm1Ta/L
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so38496eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745817; x=1794350617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TEsmJhHG6UzOUAsN1CLfuPQCNGFTSJjKfJhnGZfHeUo=;
        b=nSm1Ta/LRGVYs7LSmDicg4qmLY+G3QKwOL6aUalRgmoK+cIOBxQOc6eQQ72XYNymGk
         1WjM6CiaaNZpDFPIYFWywDYD28bYZqKUI1qOJ9/6cCvuKVnmzVEIZtYlWX4uQeL4rDrQ
         In/H52J/vIpQLculr4W56KeYPDFPpiXr6NGH8+4lDLej8vMr0dCSTMnR7J8/gsJvj5wy
         fduWdiVgaax7kmUfpEagXnqcGhgF9AnPobHCc9NBLlWIWb5xxZ2OqVEMkisW5E3iVAmj
         sXonf6pxJ8mRtSHNJK+vrB0K0nak3/2yF3P+RlcjY2hdbBw59GdWH/6OmT+LHjGpWCo7
         S7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745817; x=1794350617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TEsmJhHG6UzOUAsN1CLfuPQCNGFTSJjKfJhnGZfHeUo=;
        b=lAGvjv0QwjOhckqpBbtGDsTm2eyb09eTqryrXhj0VU9R6lyzjMcT+zfgJVK0ekMM2y
         7QJbdMZdnauNuv5MJtuVviBtRYsK4rpAv6LvEvO2JXtcXTdxuX87I7Nv2tVRswhvsIjy
         iukEPtTM4gracbMnaFgwrhgp17enFeGKNxnLtmvGSNLss8X/vWnyH9BC88suhktvOu7S
         MhDnwKLJ83N5agHi53Vd08SkbdJWREkPyWwKRV41RDf+/5/g6s7QigwxImFV3LodUsDc
         xHC3I6I4A2KTEcNmfBFEfOng2pP4KHvH6JiBpYQiOEj5kNaKbKLce+UDEqeFlxWrcOYP
         RM1g==
X-Forwarded-Encrypted: i=1; AKwUvByLqxNkGxAxfEOhVKkIT8KXyIabKrenJA/o0uib887J3yB0lVVlgEGxafiImAuXdrXnMsD4dBj4WFKaumY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2nIm6TUimDp2wqX28wubUYo2K4npkA5AomPk+RTlxiCF/QG9g
	un8jAxCeDmcIZ7xzMZrARXqsGzLjLTY5962a3iWvvyYCOrRVrjGielR9
X-Gm-Gg: AYBFou2lSUqvBjiAu6KpMt59GbgXH+VVxHxM5TcMXKN54otCG9dd5tMfz0BoAYs8yE+
	pat/toYpnThk//xZkz00c8uI/r0MdEwPzHZRXXoVm2uwsGJaTMpho3DK0ylNIj6KaX6nx+jh0Jj
	3yLGwp/FkMLGh14g6lfHwYyt5e0L6rPt3+sBbRTgUu77D11+RJLwSiienz68XaeMNSEntlultnX
	gd+jRFhOd0fFEPvmACSMS0afo3bvAwvbCHwJkNulyPCPDX1iPLcmSjXpuAX41UCRNmriNu8CSAE
	SFd8cHUwv+m2jBcdON8rOSUAQzfrOSXevLsaN/okfu21RBqmhwy6l8lqt3CPj/IDMDyNZm/NPN1
	b0961eVer75QYKCAFcJ/DDEG8yXlSE4h7n9rTBf0GzE4grPPG+gpgI7ivIxK4dO/lzFyuBPICHS
	+3iy0YO9OXe1GVdzecFejWGJoD9B26QjZrBYL40BheTo9Mcof/cb4yQAa37VKp8Yi8nwN21UP+/
	K6yrWyq8t5kJvhwf6gMdOY624yhTNp5Gxfxwy+vBcUbuafA7dUIonAMmG4jCUjPz2nF/i773rN9
	icH6pfaHoeCBIS+hw5TMbQ==
X-Received: by 2002:a05:693c:87c2:20b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36a6ae52e67mr10824936eec.17.1793745816953;
        Tue, 03 Nov 2026 14:43:36 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:64::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm1372736eec.27.2026.11.03.14.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:43:36 -0800 (PST)
Date: Tue, 3 Nov 2026 14:42:13 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Subject: Re: [PATCH net-next v2 2/4] netmem: store memory provider private
 pointer directly in struct net_iov
Message-ID: <aupiPcDWNkZAucKe@devvm16445.scu0.facebook.com>
References: <20261102231827.4088254-1-almasrymina@google.com>
 <20261102231827.4088254-3-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102231827.4088254-3-almasrymina@google.com>

On 11/02, Mina Almasry wrote:

[..]

> Resolving the memory provider instance from a struct net_iov currently
> chases niov->owner (struct net_iov_area) and then dereferences the
> provider-specific container struct (such as net_devmem_dmabuf_binding
> or io_zcrx_area->ifq).

Chasing niov->owner is true, but I don't see another dereference you're
talking about? net_devmem_iov_binding does container_of to get from
area to the binding (and the area is the first member of the binding,
so it is a already a nop). And IIRC, iou has a similar arrangement.
So I'd vote to keep things as is unless you explain what I'm missing.
