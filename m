Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793279032;
	b=GscVirxNZU2O+RQL5y+1Wylsqtv+yFNphxa2ZQ9Y48+5NUA8GAXOvpQmk/zTAw5WEPvy
	 eckxEMmnrJO1b9Q81OqiQOrZGN5U2Df2ElUAa+ANpRKdAVcHlW9uhONjviWDg3k4QA4E6
	 Z7zLrxrB52AyaPcDvnLVupdgqFT5TPQnadxQSvkAzI1Td211Tsqqoy5MfhyOZqdMMCe0j
	 Z9n0DkO3R5blytbP17NCpHF9JFhlorVZPj5QlQSOL5KJVQJ7cvCi050FCvn2at6KLm1Sb
	 iEZkEKBGB7oauSOj7EpY0cApi/wErI/4tTNuQhthbzRwNHTDXvAAnISVoejCi/f4NKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
	b=5dkqjaGsnZqbS/ClxSEq03LwBqJCGrtFbzc/leEOadPHTFKjIqRKiwvwR8ZOzkp+HMsy
	 jSvT2toIBY8ztRUam0wLIEl0iwVKAE2yj5k5iJWKn939Mh9EwVS+8qjyL98RxzaxXQr87
	 k3KQynF9iaomSXPCNs/D8d1ll/nTwayfjoYGDVhNkrutIJppX7idVCORqZ2IGjNGKqCTZ
	 k3EA2uoZIi89PdGtvk1AMMAduY3uiQN66dXpZBQTbly4XOjcU/mMgo27reeF9hpjcP8fE
	 eWwk8nt8e9uzsHgYs0x+PKUcySzTS3XTl3mDWZ701kHhD/w1zo+ouwWvGxLG94jjntw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C50p55VE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D4606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47D4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C50p55VE
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533778ab0bdso26565801cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793279031; cv=none;
        d=google.com; s=arc-20260327;
        b=p12Y9On6TGWjOsY7fE22bfbFJFsvJdfgepyoba9xpd8OCNUvtTKyTBaDQpbvzBJSd+
         BJcczij7gbzbeTExf/lkG/xT9017MbzAIny7oA2uGT8hZwtU4w6j2Ates5P9RWFuSK05
         VKu46X1/l/GaqyiYaM9tsgtxsAvIOPGYN+hlbjx3SNRr2TasRBm/2iXCUBdyLitiIirV
         /QPIQliXXpWJiBinPmZxwPUjqqw44sn43Zv2aJGOE5JtfRMoHfWU7axLGln1Ew7LJ7TP
         nD9l3ghMB7JVY2QXyU2fNehPRqvSvKCwVIjJAAmoxW/RaCjLp5Mh4t7l9NeogObiaibB
         VTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        fh=PvryXN9lCp4zrmfChmCSzPNFPS9DB4cSw2Pc+vGN0/E=;
        b=baZrEt37UU6xKbTU2KRscuuPeKIZG56s/GmW/dpkaLfImdzOq0nj9qw4kYXAy8FmL4
         Oa6JIevFDFHcP9aucc7TDMYbC1TzkqLvMmaHl2tMNEwyNZZkRuLWJ6WKF3eyjMCkBvxa
         NZCivPAW143Rdy3qAphLE8uR3u77/UgtlHR3Q09i6hxKX7iPBlLfseccbZRPcaKppcVa
         glRK9McbJa2f5a8cn6uFjpzw1RroyMkCf8GVp7ll2qxPIqMMt0g1kQz+NoKPyR3efrX3
         7//zddsc7u/QdtcULww+N+b+Za+gJaTxtNIAw5MSSUUlbjhNwur6nL3ok1MVgmDuU8Ml
         bFXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793279030; x=1793883830; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        b=C50p55VE6UDgdJKjElhLNYeFnq2Z4W8Od9eebfXsNR9VAhMbuaucrBe3v34nD049Xh
         yXm9F3TtGHSCUfiyL84unodeE/D/DA4pXmQUqEyGn/jbzwUXL1qz7UhjKg7x/77SkPix
         fsjUQTeybn8SfOvtOZp7Ze23YYniYqtLT1UwOhsEzcphyyhlfKEtsn4tdZBRLgc6VGnn
         khGCfASslvGnrRTfZsJpLUafVUjMR4da5X1aPxkPViKfkQjA5KDrJs0J0Eq/vsUuWr/y
         tjS3p/M+jkqfdwuGB0zuj39WLEgzFkDffjSEsV+2WjPvf4qzkU/p2d+HMbeijeMHkNP0
         cH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279031; x=1793883831;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        b=gc0CQHjV0I1w0w/IFX+t2djYPFYoFGiW32FPRJuSiT8I+93jRQQW6zpQvqRivzdfJP
         OCc4OOflDbRqQ7D8I93QoRZ4Y9IvxWDuCw5CmXL+6wGuG/97xbuNgWOJMgLmgV4NjgwC
         XJPoG5FDqJhIgYaqJOI3CS6BQEf/xck/SHSP2zRGHIsMuwXFkOPC1lNuL3SwuH9YojF9
         dpi43dfxmnj4EJ+I1F6/Enh6Vgnl/ChUAR79kxmsfAvkxvuijwwsPqaVDTgqk+mTqB39
         a8X3Foo+b51FmW7G9AMosm6GnHWCaBpRifbgkwH5CUbKyX7WAdBfX23/XAOHgaiaXJ42
         ylXg==
X-Forwarded-Encrypted: i=1; AKwUvBwaPwWrLMvMWnqNljrBrBmeekBnVMMk+qTaFKM6mn5Cl7b29o/zHqSCsv05FrZu7cUehXOSQ4Kurp3VZ4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/XDFHYMNy9a4squLFgBFI65ebosZ+sewscsYJGkpWiIPPEqjd
	v8tAiGZIjD/rUHoxL89OQgtPEzA+DoFH9LpmVA2n9PxDPjvEKANEPmL4h75ze2nEn9Wcwg4bQ3f
	wVwBaGEtFK7i6Iy4CckDXj1P7AzZ3mDN75e4Vxoz4
X-Gm-Gg: AYBFou1QceJpCdSBIV95/fsBcQ9LWrU9Cbghl+OfcnhMMDsaVdW2XFq+cZi5Uy+fDax
	aNCzwolAmGC1SC7th/fVExfD4zTOO0Rp6eOcUlXzKpSgCJtG5eMl4QruaMfsGoSE9eaEmr5DCAZ
	9wo+3KG+MgeCbGxrxr5ujqNhaVsiHzcun6McuBrOuuW6Eag0oGhADWfpY2krRWJX70SeNNcECCv
	CiBbvVz+JJCEorFTScYZVcsSBkcj6a6V/lXi6jutGedmQ+Ttf9xkXNtQwt++nz78Eki05uTgJRl
	JnKCEe/btnbfkeVoVTT1A32tlAOPea/JaeeIXqanWFcVnbM7FmGjjdQBtHPUF75F+TtGSQycNCC
	X7iytp1p/vPAI4vz5eVb7I/tfgCzAcDr0MlR0j+G5r4BWTzq1hc8=
X-Received: by 2002:a05:622a:528f:b0:537:b9f5:e05 with SMTP id
 d75a77b69052e-53fcc7cc0camr87903901cf.69.1793279029444; Thu, 29 Oct 2026
 06:03:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 06:03:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261027154649.91571-14-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-14-griffoul@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 06:03:47 -0700
X-Gm-Features: AclHuK_J4_B8WHMj3lc3Bqk_zMBRzyMWVypxyBk9aFiFYwwISWnD_-KRrJmOcto
Message-ID: <CAEvNRgFYecSKycFLkxwyK7gWZqKTXTPJVetSZm8YBbo0kg9tTA@mail.gmail.com>
Subject: Re: [RFC PATCH 13/14] samples/kvm: Back absent pages on demand in the
 sample provider
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jianxiong Gao <jxgao@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Mike Rapoport <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Oliver Upton <oupton@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Tycho Andersen <tycho@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

> From: Fred Griffoul <fgriffo@amazon.co.uk>
>
> The sample provider fails get_pfn() for an absent page and keeps its
> frames on a punch hole, so tests cannot exercise a provider that backs
> a hole when it is asked for a frame, one that backs more than the page
> asked for, or one that frees the frames that a punch hole gives back.
>
> Add MPS_NEW_FILE_FILL: get_pfn() then backs an absent page with the
> whole 2 MiB block around it, and put_pfn_range() makes the pages absent
> again.
>

Can what MPS_NEW_FILE_FILL is meant to illustrate be illustrated with
the ioctl that sets memory present?

> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
>
> [...snip...]
>
