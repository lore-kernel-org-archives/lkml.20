Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209635;
	b=qwXel4J3QVfcJAJvIoOF1zgdJnKsxBVsF4B/BKpIVLz83vSrxyYBnQENmWJN7ZoDnAlf
	 kXiUgbonUNB+2K3vmSrF+EemQxIoKLQjavSLSxpbGeaH3EB6TbkhuQjApE/L566EV9cwq
	 WjN8jeVYh7/qC02zOYDMmgUlCEDDk70SQZD8uJoSLyer+l0cu7g84OutzOxJEQzk8HtGx
	 AV18SCjhSejHnhXRNBUFT80QtCbg1SD4vQWxjOhtDj7s0EGcVupnP7Q/QoXJ7JealkhGu
	 A+FfnHZrx1185zbYTEUmXSsLHB2vi/xyCW+NNV8VUdGe2yf7ShGOhZf7A0rhzL4v/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=tOxsbn2WzdX0v59D7Zs82WgtkG4cFGkj3ewz31Uolyw=;
	b=csav52wooUdwDmok3WExHyX/7SwT65YtuU7fhE5C105dpLzhbK//b2ZpAULOsyzY0Ggr
	 uRpGISnruMtCe1ugFNgj/viclEddqqXEboUHOPP4M90HL7VDQbcmrvH3dHtGjVRj7egXQ
	 0zhW5Mf3HxhqN+WEV980Pa4v8pwNh4zvw3vEghIM3nGzOLR15GWD2o7jVZhJiL1s07pyQ
	 1zEEjn6lru36jnfznyCW0vTWjGArMAsUYcp2HwVEaAJjGJwPSoFJS+/MhQOF8yN7rhg/b
	 2djfEsu2IHsrt+0GAKkmIkk9xrn4W6By07FljVHaoC17iDCaU+qibzX6/HeTbjEk3Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TD1Tphal;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B5606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329B5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TD1Tphal
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso486505e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793209634; x=1793814434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOxsbn2WzdX0v59D7Zs82WgtkG4cFGkj3ewz31Uolyw=;
        b=TD1Tphal9MmPmFW1OAcHF/1klWnZxSWsLxd9CIm64eCSWcLG7mG8zrPQ3838MtFr4w
         ZTKCFSl3LqqxJqx29pzfAWYQn1mEBphAMjxHQh2ZHPqCNzRbnJPKUjX2PRrurF12ETcu
         CqpI8q6ywMMFJMi3OCCZOyjdy4BmQdRRXzkxus9AfgMjqltqf3IgwcGXKdaAfyNZJuvk
         HngFug3/3BeoVvKeVjohQauw+bz3WMJQ37zeQDc/5Xa08m9CibytH/i9Kqr3FZ0mRD9u
         xfZJ4xMidWmVes15PXyLTH2PjJtuANBfb2w8XVOA8lDU7YBkZu5NB+fyh6+p652P4J5j
         lCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209634; x=1793814434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tOxsbn2WzdX0v59D7Zs82WgtkG4cFGkj3ewz31Uolyw=;
        b=oV0sEGAroItewErqO8HR02QFm1WB7fDPC8Zqw6rzTQltB+Yq+JMCXohnI/JIIttafz
         ENlL96naKbGh6ZIiButtpzzt2XaBPmib+ZJrHgzfvB0JHyP9+I0a8UabvSGs1QT/Sw9I
         gDR3osU362y/YE+Xk6Z8vkqumuMbcaw/7lua0ruD5hL9c5KopRmVHLJR2bZPJaoD617J
         C2/bNFpTaLhPxp+7RUZCRVVr+QjZBxnfN8NyYByEetG8KkPvsxZC7fmWBTC938/S1aHk
         xtpgwCssplhRyiE2cxhDlJPxqZJHKcOW7XQHUhAxtwmOOEkSKF9ahCBMvjMVOcjqKzJ6
         2f5g==
X-Forwarded-Encrypted: i=1; AKwUvBxrcYsCcamMKgVd0i8PSKfwHaePWiSv5iPHiS3f8dQHtIptv3IBdiY4BFJArOG66v/s6loXDqWEylmWX/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZzikxwdg8T1Pf47/v6I8babTPBa47Zjm1Fvv64AxgSQxGP2id
	edeTxz3pUi3JXWt09eXKPjq1fOnoPFKA9MWCSE+BCno9Q1qlcJYCqFaSmBfUrrJqPjA=
X-Gm-Gg: AYBFou1c4AXyPMG/Tw6yFnn5Vb28A9LRLT9kpACacblFA39KV5zqXSj6Y6elcuhPbye
	h6Zhx3oDiuUyNwX592psl0wIPess6SuRKbfisbJ+6tj7CU7yoNsqZkQxA2pGYf6uu+iVAx6Y/z6
	4/rQun051ECbjtyWXllyBmXCqn8e/PjH19DPG5xw/POG0wg8u8vzCo6UNgq0Hk0Vr3oU6qFzGZZ
	KXbdaH8CUOh0U29OWYGv+MBxFYuQxT+CQ3RQNLGlVpiEXrOSUTQ1iLncTNnGEdN2D9YPJPD4k9s
	SiG6R7ti2ypp7zfDtSvEs6ohu6hrtCMbw9RUbNlfG0UHeN9KuOBuKp6kbnYyVMmcypJ1ULc2xLU
	2iJKGt3g3Ir7lG+MGQeWpvZjhgclNUMScylZ/JreKzFRAwwlibAFF3nV9NzjnvigNULxgTCYiDq
	xxobYbhZV895zvYH+AkLSwVlNqKAluPkOWzlhwRl/VQ9BeziarKf5QKe892ZUqW9fV00yeG0MQ3
	r6RFxvu3HPXODG5SttcqcNt8PtDd9HW560MTzWeLaIf3WGyybhiwFn/sxnJTtY/c7doWpBVZGcM
	hAarxfTDEtf2f4eYnPllvl/X1DgY8tAjZ0NGVcvh1X2Pm4e0AYZZYrRQnPD1Hhao7L9g/4m6Yv/
	ikjZceviyO2FdWKycV/wr0p3zKJ+g7DW7ubFZ3dvIo5AyMMGgKM44Rg==
X-Received: by 2002:a05:6122:2896:b0:5ea:fae8:e69e with SMTP id 71dfb90a1353d-5ec4cc4f065mr1774474e0c.11.1793209634129;
        Wed, 28 Oct 2026 10:47:14 -0700 (PDT)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec57e4e556sm445088e0c.5.2026.10.28.10.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:47:13 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:47:12 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>, 
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, oupton@kernel.org, 
	kevin.tian@intel.com, alex@shazbot.org, dwmw2@infradead.org, pbonzini@redhat.com, 
	seanjc@google.com, will@kernel.org, Alexander Graf <graf@amazon.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <auI02M-pZO_aQ4jn@google.com>
References: <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
 <atpNFEFIlqAoYIwH@google.com>
 <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
 <attmFVIFU_mS0Y7p@google.com>
 <CA+CK2bDXDWbww_d3sD6OZqpo37V1a3t76_ubbrXLQS=9DB3dWA@mail.gmail.com>
 <at-8vkVpN2SF3XgB@google.com>
 <2vxz8q3hoicx.fsf@kernel.org>
 <CALzav=eG5j2n5omO2Mxqw8xA4sZLduxdbBYFcnHpPn0PDpt9Hg@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=eG5j2n5omO2Mxqw8xA4sZLduxdbBYFcnHpPn0PDpt9Hg@mail.gmail.com>

On 10-28 10:24, David Matlack wrote:
> On Wed, Oct 28, 2026 at 10:17 AM Pratyush Yadav <pratyush@kernel.org> wrote:
> >
> > On Mon, Oct 26 2026, David Matlack wrote:
> >
> > > On 2026-10-25 04:38 PM, Pasha Tatashin wrote:
> > >> On Fri, Oct 23, 2026 at 9:50 AM David Matlack <dmatlack@google.com> wrote:
> > >
> > [...]
> > >> The reason I care about keeping the header compact is that we are
> > >> defining a foundational kernel ABI and want to use this header across
> > >> almost every serialized data structure so we can evolve them later
> > >> without breaking compatibility. While some top-level structs are on
> > >> sparse folios today, other serialized structs are tightly packed, and
> > >> we are looking to add KHO slab support in the future where tightly
> > >> packed allocations will be common.
> > >
> > > My intuition is we will have a small number of headers per preserved
> > > file and per preserved FLB. One for the top-level struct and then
> > > optionally a few more for sub-structs like arch-specific data. That is
> > > why I am less worried 8 bytes per header, even if we fix the folio
> > > problem.
> > >
> > > Maybe where our visions differ is when there are collections of
> > > serialized structs, like KHO blocks. For collections I don't think the
> > > elements will each have their own headers. Otherwise the elements could
> > > be different sizes.
> >
> > kho_block today doesn't store entry_size in the serialized payload. It
> > relies on its caller to do so. With extensible structures, this can get
> > messy. Sure, the owner of the kho_block_set can track the size somewhere
> > in its payload, but perhaps we should store the size in
> > kho_block_header_ser to begin with?
> 
> +1000
> 
> KHO block should track the entry size automatically and not rely on
> the caller. Otherwise every caller is going to have to store the entry
> size in the struct that owns the KHO block, like I had to do in the
> PCI v10 series :(

I am fine with updating this as part of the versioning change so that we 
do not have to do it twice.

Tarun, could you pelase include entry size change into the next version as 
well?

Thanks,
Pasha

> 
> > Anyway, not a problem this series needs to solve, but something we
> > should eventually do.
