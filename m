Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857904;
	b=WySs2jo/x04iuAF5HvBqJ3wu4tslaUZ9X92cUZ0rdxMCaQ0SNZNUXP4maBt8KeZe0l0M
	 vV92/K+0aJ/vwQO4ishihYLOXUmBOaMkiONdJzJeL4nz+xIfX4VZKZkf9+rc5KlFXrONr
	 udRC8wPagOONQgoUuTYoCdUti9AILOBGTi8iuDcI6+A/clLWJ7NkBQduFpEJnm586LVFg
	 QzIcX2hhd1+YjXDEfUBUO8ZgqNfdUnJQEbODY8sr0tQoiKA2uJmIjOGuqK13XkFogCrTl
	 nWwrB7Z8B5/l80MMwsKqK4prHiuVX9qxDHXzjqHDOjiL8BqR0UML9ijYV51T3xchqsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
	b=RdUnyB6/VcCDynb5aNViZD4DwXPgyN6SNoPuuQWUQ6xykfcoFwQLZp6P+Ic4EsRGPPin
	 MUNISKrGEcxYnwHGjeaEY0Qzt39R2PyPWCLKVNfM3pQoLyJE7x1RHDdKLvpu+oskPU4jK
	 qesRRAGyUroY8eWQg/rGyRyBbtK09onJzat05gW5ci4vDG5GWKu68NfvA8QmfWXPdRW2t
	 PFZ/nuGe8RPQyHD8iOrCOXnK4+cIIRv22cL1vFS54rudYvkN/s8sG2V10ds/rZ6y3BrWu
	 bXGXgKG+sp8vcqV4DwRJSE4svnM9M4XyniY+eihbilIWRM4YDjg2TmI2F9RjdiKZO3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UP7tqSIg;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF1F606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF1F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UP7tqSIg
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55d03bfd477so25373261cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857903; x=1795462703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
        b=UP7tqSIg+Zq7+LwHBwpTHoLbN3LwuEyc94bwjDub/kzmA0gGs0fz7b/MTO1qulRMm4
         z6aZmiuXiuWs7PrvYN9s7AD8FGW6PzS5VAu8NKi3Hogxa+vDE6+MnJdS/r3I8/6CtALU
         pjzzc369dq0nGNUuMu4UBd5ig/bpJIOKOLpuJZ84CBV0FFdOqzt3TuhP8/5cclRXMyZL
         jHDEo7Lf08rka0zDNQ2Ao9QogTC5TAdtyslpzbaM6/EOiCUa42r+wBxysBUaTM2UeIBf
         kQ34MT9B0u2/17/9VdIuXNGcf5LXeoyUsISgFKQpTmoGF++cfuUfL7IEWHipaMSGrHOm
         zyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857903; x=1795462703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
        b=OO7GjE/jg5+oAIEb/Lv4QfmBKtWNnDzLJx6PytQG1GsMvfKXTcwrGJihCbos+E+qM3
         DKS5dImzIriI3ke+9SZpZ0aNINd/30yhLspVcJdBfdtNaKUyTv7C9/Zu3+hFnt0thKfW
         o73VQA4wKLb7mQNZH7Eh6wugboqUDkRtY2w2I/vm01FTqlzd4jT71Gfqleu3T9iTOtLX
         iUXZRh3F0asdi7myu4l/BumJ29fSf6iyJY+ur2b30DPgCtZ6uUBg+Rn2mPQ6Ep+ocxnk
         yy96hUgAhUQBYhhRgPxQjuZ8TTzaJxw5MxGtVRM34DxGgVo1W+Uu01a46BSZaQJEicnT
         tj0Q==
X-Forwarded-Encrypted: i=1; AL+hErG6nztVXUgRRB7YVpF5pnSZONE6qUF7u6vmWwU7qlSingXJqd75JuhJIEIML9Wg7gaxiJJsMB28GViGzzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HNAfUo7WHsa/o9dZ5kP1Fc5RPNqfhOMLZrchhVas4+jaiwtfo
	CM9jLjojkVyu5VIsHMYoWcVXc4viTVj+4Ps4S/02k9K9iw6Qc27Q/CInXgxmslbHLiM=
X-Gm-Gg: AYBFou1V2JaODGy0fgUpFa4W8LPrbgcPllUbN0kNGhL5iqeNjUtHxTEkS9D7mBOz0QY
	y42WErTPX/aA1g8ArCy4ZtueMqGc1kSTeUahSaoKtr96e/EA0wSMW4RCOsS9B4M5+gUCif4KDju
	I8UUNtquNiOD/C1MoLjsmrMHAcKQHHo2O8UaoYyCfORYmYLTkOCMZCEXI7xw3+LFAw8J+5fjWnZ
	Ori355W6pRvw1ty2TbZh19+U6WzmYWO5bKQ8XhEu82XBHinS3wMESjGjUoI9cMowYowX/NiFutM
	Kzz8SR5i2UMLnW0IU2bFjKoQrt+RuFbx2h+TmwYGKRKo48gOTybv3nccroutnhpCv5qrLbryPPS
	xORaM0Np2Rl5TlEhNp7RPPbqiZB1B1AtvXS2D/yNeYsg+Wjhnb0LzIRyftZ3M7hgv9HINKHlFeh
	WmKigp/uUV35PbKMZF3Rbup62VldY7URcCunGdSp2n+pmG/l9U2dQHvuqrtcLTHLPLdpFUBGVr+
	6HXcNo4pJtlITKAepTGmKHgQDU1FBkKW6clhA5SCpa+nqVqKaQiiEta1buuxw7YqTXEl/ldCDQ1
	/XvXXw==
X-Received: by 2002:a05:622a:1f94:b0:53f:8b7e:c0e with SMTP id d75a77b69052e-55ac755ea54mr198728171cf.24.1794857902540;
        Mon, 16 Nov 2026 11:38:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d3610521csm36870131cf.23.2026.11.16.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:38:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2Wz-0000000AK3c-0tcq;
	Mon, 16 Nov 2026 15:38:21 -0400
Date: Mon, 16 Nov 2026 15:38:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261116193821.GC2452510@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
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
In-Reply-To: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>

On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> This series adds a Rust abstraction for IOMMU paging domains. A driver
> can allocate a domain, attach it to its device, map pages into it, and
> install a handler for its faults.
> 
> This will be used by the upcoming rkvenc driver that my colleagues
> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> [0].
> 
> As part of the security model, each client will have its own IOMMU
> domain. This is needed as the submission model will let userspace set
> most of the encoder's registers directly, so the kernel cannot check
> every memory access that a job makes the encoder do. With a single
> domain, one client could make the encoder read or write the memory of
> another client.

How do you plan to get the paging domain in the first place?

Using paging domains directly is very complicated, I'm not excite d to
see DRM trying to do this at all. IMHO there are many unanswered
questions how it could even do this safely.

It would be better to come with a user so we can try to understand
what you are even planning.

> Patch 6 adds Domain::with_fault_handler(), which allocates a domain
> with a FaultHandler installed. One handler can serve several domains.

You intend to use fault handler?? That's even more esoteric.

Jason
