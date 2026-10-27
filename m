Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118075;
	b=4BR9sLh0LpyVXwcBP25ZT4NR7CaCRF66fIJ/HUbN+fYPXfSZ7AIJGaTOFGbv9ljTFdZs
	 ljAjEK/o5SNiHK47pF7zjHRt6VD86Tnyz5Gqv7meMUig2KDeW1zO43QorfZoBoWqZSRu3
	 kOC9SSguFDSAjeAnYGoahLYutwX7wh/NHO640TsbQF8aHaqm+eUt1m2oZq+6twcKyNgYp
	 E8bywQqcLcd4icDifAbGk3SFY6T/9VFXtimDmlOZwSqA3WOgSLJaKkRCkMKiNWuXnPKZB
	 r/xwfCDJsVw00e9JElJLPisTQjEQMCXyk9QGYvbu72h+dpcaRsA664njfR/vbhXbfxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PxRb990Xj/uwND6b4fXh9A/3T5i+xI2zB08D/68nqZA=;
	b=eZeB2Vaw+VigzNWEGuaOiBL/Y8cWtGzkQ/sbmD1taSmL1+hql+RVsS2nCP6y2uEUzyQU
	 Gqd5Xvk9udO40qZDDqcVo/ff8sp2/0ZXYmc2fqU1hRJ4MQCr717s7SIrHGQpDNHGXSnSi
	 xDsvD6i5b2S0J1imR9xhjtM+2428By19mcvMWU9IBKm179y1eEsX0//JjcTV3q8m58jr4
	 jRkcszfq/WRnzk3bZFNHZU+Nf86/SYVGgQSSNKrdwu2HVL4WowVeEmKxw63+V4fQ9xOSe
	 sqioruWM9sXGWCKwfGz1p5TOTh/J8zBjSJfDwbx+9V+QPuyHZdfeC8bLcxJ2BOJlapA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I7Y8uOx7;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA64606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA64606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I7Y8uOx7
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso41227e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793118073; x=1793722873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PxRb990Xj/uwND6b4fXh9A/3T5i+xI2zB08D/68nqZA=;
        b=I7Y8uOx7weI4v4W6AXn/znpVoq60HTz4BzA4kZYqzylWKLMgWPEI/kHDMpFAJKaxEW
         dMWp56tqyuqHCMl0aXjxrglevtltP8ipvkBRGG46atadiYS/JtDW4cIxH6WwLsAUvip7
         fZ8N0S6JoWn+bDQAJdo2DtJ/gxo9c3hp/BnaS1RFijYBIda3/v4GLitqnj1Ws/B7a2Pn
         fz1qPsy0Qm6tmUdB5d3qOcYc4P2QrsfWBQLhxtBJ5rdHgq5XNcgZNUNJT5T7j4P/2JjO
         Ecm98gklWri2xQ8NhdNb1FWUN/6eG4JjOrFzPdIZ/BC1uGg6ea6CeIaDGLqn09oiPzXZ
         wVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118073; x=1793722873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxRb990Xj/uwND6b4fXh9A/3T5i+xI2zB08D/68nqZA=;
        b=hYBmEIas30mh60gb/C4Jtq74Loa0ekHDAWAsNip3Rvmlu4w64w7dySWO/U/DrUrBFK
         ygI7HtFNbJt2/VB8DaBcOpN0f5Moj6bZLoyQbS8SUm1s3IkKKFLIFpwMMDFnSJ9Pu6+k
         v4ufybfHgq1tRcFq4kOKSKMBSOVq1LnNuloxLLybAw0TLNv6KwvTEUBuZxHQrmqjWzgE
         GMQMmBA8dd7PUaUu0XBGeZSew0PSzSKD0UOSgsN5mjEx92dAP+d210mLz2Bf60qtybv0
         yQVm+jkfH0DEyWZUrIUiFeDKYLjM+99NieUsRh6Si6MW+o26u5U1FHcI7MoTxP20sZDH
         LW9g==
X-Forwarded-Encrypted: i=1; AKwUvBx6ukh4sja0B5fe429g/Z7PpS6r7nLTqWta2Srx9y6YY8ZE8x7FAxwJlGtufwWnYhQZYs/s+hDW186yuL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQdwDQvgy4ZeiOEGIn+RF76ROz0+mEdmknEsILUJrbV/5Qg+Tu
	vLMABjyq2RAVJ3PwPOI5ld3mxd31CRzX7MCGIAebPZYHdmluJu4+Bd9NjXM197EN7QU=
X-Gm-Gg: AYBFou3Fp3/KxzH09gCF5E5GrTKHXbIbCYgbJmBlfxQ6u8PtSIaeMNarrBFj+CTOCEl
	QHfq/sXx0j13sKIByDysOxcE94grzuZ/WgX8SwNHWfke85kHw/k3U4aegP2VmSaXNNUkwdhRlga
	klenpSjKJhGpPnPxaj9/hTtxMgLdgcxAMdNNsNaQUL7nMZ5Vtkobu9/WQ8mtX5hvTE/g4jZbdWh
	tY68aYSr6sBuSo2dzfmYcUptI+lIPVskDGsGL7RH13Vv3ae5Zorazyq+tm0HiZXpIU+VYanXRy3
	fSCdCrfSkBTD7ZgeqQKPztQZvx8tB3MUjWakq+wot7qpck3isLvqfk3uN8TJZ/QzbJDzCgHOSRf
	P9V8bHB8U4UBusKKxmnLttArVk5DMCp+AY43ZEbMn3e+JJFVWrdqC5BS77G1dH/whYfj6YG/QTe
	VeEUcwZlGl8q7f5PgKXsew+Y1615lSYYWvXRo0UMW5LcBY3+wtuUsNQZhrAI/28PgyrCDltUMRi
	+OJz9Fe2NWtmJKHPeNXb+kQFLBBtomV/vyAJxXZ01/pi6TYrAvR4APcLWaTmL30oyinisVsTwrW
	pF72taWmTfIZZxmw5E/IymLuyTHupm/lRkMCtidXiY0Dyq9DDLXjCth9ecgaBkvlV8c0zQw4wfB
	DQB9Z5iJRybmqkcPhVP0gWmR1KgLVqQ==
X-Received: by 2002:a05:6122:1352:b0:5c9:c60e:3a40 with SMTP id 71dfb90a1353d-5ec232e48ecmr4515149e0c.18.1793118073126;
        Tue, 27 Oct 2026 09:21:13 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4a5f26c7sm304662e0c.9.2026.10.27.09.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:21:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:21:11 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, tarunsahu@google.com,
	Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <auDPd6tjzACQVszf@google.com>
References: <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com>
 <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
 <atpNFEFIlqAoYIwH@google.com>
 <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
 <attmFVIFU_mS0Y7p@google.com>
 <CA+CK2bDXDWbww_d3sD6OZqpo37V1a3t76_ubbrXLQS=9DB3dWA@mail.gmail.com>
 <at-8vkVpN2SF3XgB@google.com>
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
In-Reply-To: <at-8vkVpN2SF3XgB@google.com>

On 10-26 20:49, David Matlack wrote:
> I still think it's not advisable to define name##_wrap since anyone
> could accidentally start using it on the incoming path and we wouldn't
> notice at first (especially since same kernel Live Update tests would
> keep working totally fine). I also don't think asserting the combined
> size buys us anything. The header size is just a function of the
> number of features, and what we are trying to protect against is
> structs embedded in the payload changing size.

Fair point.

> 
> So I would just do:
> 
>   /* Marks struct name as a KHO serialized payload with a kho_ser_hdr. */
>   #define DECLARE_KHO_SER(name, payload_size) \
>           static_assert(sizeof(struct name) == (payload_size))
> 
>   DECLARE_KHO_SER(luo_memfd_ser, 16);

My main requirement is that DECLARE_KHO_SER() in include/linux/kho/abi/ 
must be enforced by the compiler rather than being just a bare 
static_assert() that someone could forget to add. Since kho/abi/ headers 
contain both versioned structs and unversioned sub-structs, it must be 
mandatory to declare versioned structs in kho/abi/ with their 
static_assert size check before the kho_ser_*() helpers can be used on 
them.

So, how about adding enum names like this, that are going to be required 
in accessor functions later:

#define DECLARE_KHO_SER(name, payload_size, nr_feats)             \
    static_assert(sizeof(struct name) == (payload_size),          \
                  "struct " #name " size mismatch");              \
    enum {                                                        \
        __KHO_SER_SIZE_##name = (payload_size),                   \
        __KHO_SER_NR_FEATS_##name = (nr_feats),                   \
    }

> Plus helpers that allocate and initialize the header and return the
> payload as a typed pointer. Both the outgoing and incoming paths find
> the payload the same way, by computing its offset from the header,
> rather than through a struct with a fixed payload offset:
> 
>   /* outgoing */
>   hdr = kho_ser_alloc(luo_memfd_ser, LUO_MEMFD_NR_FEATS);
>   ser = kho_ser_payload(hdr, luo_memfd_ser);
> 
>   /* incoming */
>   hdr = phys_to_virt(args->serialized_data);
>   ser = kho_ser_payload(hdr, luo_memfd_ser);

These would become, where without enum, the init would fail:

#define kho_ser_init(buf, name)                                     \
      __kho_ser_init(buf, __KHO_SER_SIZE_##name,                    \
                          __KHO_SER_NR_FEATS_##name)

And payload can also check the existance of DECLARE_KHO_SER, using 
(expr1, expr2):

#define kho_ser_payload(hdr, name)                                  \
      ((void)__KHO_SER_SIZE_##name,                                 \
       (struct name *)__kho_ser_payload(hdr))

We can also add an optional kho_ser_alloc(name) to allocate, init, and 
preserve.
