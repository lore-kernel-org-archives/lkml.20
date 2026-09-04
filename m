Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A942640D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561876; cv=none; b=hM5gKxh+e2oUp7+VEq9Sih3nkpbpR5HTeMZNF+cQgZk+jaKdPjSoNHzdnpYfHQihrSl3JYW0e+POhXs8ZqT1ls/SUGocRrXo5cOMaZ8ZcxVSJJi1UqouYMWuRbLTwMA5tfr2mxz9qJRp9eJeP6Sv4Qqr5qnn1ds2XHpnJof5fyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561876; c=relaxed/simple;
	bh=eycwb80GRPdzJqSiuHxtVNsrmJFCiAJPjZJsePfY7RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaoBC7UO4GAtTk7M9dqrtedbWmm1heLpv3bCBFzf9F97mRSFXgpx00D0DRDvpk69hP6Vmlyg1TVH5MzKUpFlbTo7E04FStFfjpRybvCnJoSI5YTCq8JqfkTWGL8dvzybzwODZFyrXGf4OBUFcYHdOJNhEtmfE0Qk+z5qnuyFOgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYLCUw75; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYLCUw75"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso1804837a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788561873; x=1789166673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4vl0CV1KiLa4KMsh3ZdWy1IL1A4UgMhQyPsKMFr1lk=;
        b=ZYLCUw75HAElLG5r8h2G/OSS2GgX1TG72d+hyISqCFG5S66pRqh8VZmyXFgXX15PcL
         1MQGTbUjhKNvGFF6fsRZpSBm6OVc/y6YI7C8GZKIacJyoBNaEs3uMvqouz4sBJ0LsT7J
         2xZ9M7NBmiDWulF4JwWzLAh2QRnr0vHJ3DgwB63oLj81y3jrAunhGeaxDtZZ1SHHzmQD
         /DrcJVGuWJec6I1QuW5EofK2RdfyVplG2GHmATwN4Nd5k6e3PMYA8rnil4G9Xi78xi6k
         f2GmAGqL0qfC1CwmMXKlORgKyYLGg5VfOIyG3jr8T3uYDy0+bGzj8nPDJQe+Nlcn0rnH
         A/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788561873; x=1789166673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4vl0CV1KiLa4KMsh3ZdWy1IL1A4UgMhQyPsKMFr1lk=;
        b=tZMHDGMPTYylckF3sjpA4lyturSyOLp1qMe9XJWdjg5CdW58NbcGzMMv5qt7rsj0JD
         5CuaHt1b8DN4zLQe+18CTvQflMkibzzC3duWAApHZlI2ujLPT+jRrVTv4e2kn2hJzBfB
         O4TCbT3C/MwscDOlzn3HM9r34aN4m4P/fbIqJ5E6FDFz62YrNuFmZzwg6HoXFO5iAf03
         vJDLndw+k9oko+XBCB6mYyHO2xu1brEw/MOw8dGvNiFvcs5WPTGZso+xQchEWv1nktWG
         bKzD6Aosj1YEH640Z4tSIC8X90RRp00NvVi0x+SXnDl3WzLP6HGaZq0Kz4CPibgNqX/X
         Decw==
X-Forwarded-Encrypted: i=1; AKwUvBwWrd+9/HXN4rkGxy4s+CJQRrvUBpCBIkIz4Bh4Pe/m2LIC1NI+F8243eN8usETsTZeH/JcaW7wwyryJ7E=@vger.kernel.org
X-Gm-Message-State: AFuF++nVjm9t++P/z1mUvSV2D/2s4Qosrke+L1PS2xfKWWzDv04mUxrM
	tFgDQxfMtvPvaVMloSbd2R2XaHAsGc6U91QRCWAU2L4bznCpUN+K2keh
X-Gm-Gg: AYBFou1xcxv0n0NXB2hIzFioqJWKF4kN+P/YFIEg5cy7C8enaWwbVH66qDd3i4HnDmu
	gSaa6i2WLWdhluzccjeWiDCyrcDaqF6UqJpSmNINtX7B67NC/r1y9xNYQQCrk0bQJhP4aZ45BXJ
	Frgd3rncb0qSQGRDQfQ9YRfd3ed8p5F3Ybk9gfhqlqLFplzN1lK0HUyHpjJPDmA1wQ5YGINFSvn
	vRRrCY50vW90XmN9vg9offlcvEhuusT7urqlZC/kFP0CgaZK3r4W2WAd5Yq9l7Tl6yoWcNLSHwU
	fe0QS0yWC5rlcZLfJla1+EZp3fYqygqvzGsAk0Stp9awCj5cJDAxTYOjWgXd3PplyUvuY6K8v/C
	SmU/7VanwGdoPjqiksNvU4gxwQXmGQDnnoR0gzRWEJCyZwDuxaDfGq7r2gQzrQQ6of+lNvuHSGp
	Z9otzs3NYf8J72HpZk0Ab1LPTBHqCgwu2HIztPsNdrjBG7FF3bWC+JN8gMiLHRi07MQ28zoOShS
	33iIRu4Bw==
X-Received: by 2002:a05:6830:67e7:b0:7fa:5c49:5250 with SMTP id 46e09a7af769-7fa5c495568mr6198374a34.23.1788561872439;
        Fri, 04 Sep 2026 15:44:32 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:51::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f67947cbsm4319996a34.4.2026.09.04.15.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:44:31 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:44:28 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>, David Wei <dw@davidwei.uk>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next] tcp: devmem: only pre-allocate tokens the
 receiver can consume
Message-ID: <aptJzJ5VtKsb06lo@devvm29614.prn0.facebook.com>
References: <20260902-b4-net-next_devmem-token-refill-v1-1-81d8990e5e17@meta.com>
 <20260904151146.602c61a4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904151146.602c61a4@kernel.org>

On Fri, Sep 04, 2026 at 03:11:46PM -0700, Jakub Kicinski wrote:
> On Wed, 02 Sep 2026 15:24:19 -0700 Bobby Eshleman wrote:
> > Testing on a CX7 w/ GRO and a steady sendmsg() flow of 1MB per send, we
> > see a typical RX-side skb touch upwards of ~32KB. With a 4KB recvmsg
> > size, probing shows that ~75% of the allocated tokens are not used.
> 
> 4kB seems unreasonably small. Is there a real life reason to use such
> a small buffer / read length?

I have workloads now that deal w/ varying sized tensors (<32K up to
100MB), and data send/recv is done per-tensor (with the size/metadata
sent over a control path via normal TCP). Right now the application just
safe guards against the small tensor case by receiving anything under
32K via regular TCP, and anything over via TCP dm. Figured might as well
try to lift the restriction. To your point though, I don't expect a
consistent flow of <32K to be the common case. Could be something we
shelve until it really becomes painful.

Best,
Bobby
