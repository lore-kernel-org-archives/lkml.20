Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335150;
	b=0yWmlk3WRYGSxLZ4szFpsmnejobkHosB1RsAWWyHIGylvtD0/l5qE/ycA01NGWnJV8R2
	 Pvbmk2AS2i+15vB0bBjvcFd1chjlyExGqyPtmVElEj2TZfg0exSGLJj1lRO40Ng7aRV0N
	 6mofKq+7imzOZP7ET8po5HnJWTDiGzCouRQxt/CN74zqi4OWSKUiTFJJzluky8Gt0SFUq
	 ZT6T0m09TTjGak8chmBqLwyIwt/snBKlXsxw0OSvwwDwIZFv7oRHpmd589PBPjB3vxzCG
	 BdOSKVR/9SP03UoUnKoeAmjYXKHMq62Z0IyOMdLEhtLg3NU3QIlEC3HLdK1d6a7xhoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pg8+OEnjDNmIa2RbISOLY8VoGEN6y0ux1Fnyr8R7io4=;
	b=4BNdpBhh6VtP7vNAZ064yWeqNpTvpJ1Ddpj1loo0MMiDKjE1u59SXv2Ssah0A/hgMxYC
	 DHYBnBuWM4HWMlnfmxh/xJIsEW+qM5jbChaWjHkHzFUwNYZJnV28vsjfJejhuyQcZ4/Gz
	 sCYWjMSZQmyrm3vWvHCFNAIK7XCbpfMqJwgmM9KVgEJnkNsFRZVE6ipPx+TIKGz5n+UtM
	 o5Kewo/u9nBWPAuV+orxSoaZ6BswPeFPqzR3Iq+SZ7P8bGyUGhyrvIwJLKienxQNeiBjB
	 WUItFZ71wW7JsFGu3+f4ZxFERYBsNw5g2nvtUIyWxGGx7ttmVRMQWTfzLeyCYdyUh9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ss2sAv1Z;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF8B606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF8B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ss2sAv1Z
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0ea6so2739045a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794335148; x=1794939948; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pg8+OEnjDNmIa2RbISOLY8VoGEN6y0ux1Fnyr8R7io4=;
        b=Ss2sAv1Z44xGCzrouTTSNStulPTKhVCnUO+g4V7Ttgr82dioG8oDl/aa9BFjmSvCYi
         euurrMXPzpvjVfF2ZfKzD82qUQBBtXAN9f+MJkGikK45Tj4cAehpSd8POZHmWpeSUTNa
         ee90SX5pk+PyA8l2gVtwImvYurJFi/PPJudDUyeLNd3LrsGsvH6KnVfocewpXHvIiLKq
         VjnnbVpNS7FQdGG2Lc5//B4NgFsI+lF/Az+FjkxpMpXT6wrqHKPZtvcjAcfxV7sSEMxX
         WSc7JvmUyi5mGyRJmJ514aI1wQP2Xz8QRVxCIv+4tiJbD3usEEvyGPpAG5S96WBYg/hM
         99Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335148; x=1794939948;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pg8+OEnjDNmIa2RbISOLY8VoGEN6y0ux1Fnyr8R7io4=;
        b=oBuvApwCSkJTXpW6ILWe7YV/zdaGdlj9KhNhxWeIv+3H0pSZQ6uq6sYb0xA36nq/oI
         oMWne4cUfC/iSZnmjWGi6r/QFRSV2lZuWSN35Iu480VIbr8zf0kMS3f7Hhx/jNfmdmul
         +7WD0WsyeNS3LRQSHKUI/NpvpgV3UMxss6LVsDEF5r1FWCdjIMrRbnFSmpMceALBHipq
         dSweL0Fs4AUJoh/a74/2kG/BNWjRJneh7NHVbGS2XC2aoBF+V6OKzaN6NAf6Nme9hA6l
         jxCgCU7AJZfglnpdewUQwwN6FkiL7sIRKH+E4K86qVl/mGW/wCuIDjBoir14nMN62WRM
         A8mw==
X-Forwarded-Encrypted: i=1; AL+hErHehclM7AfzV6JjJac5EB5heWL08A53ld2VCoMOPFSrQQaVv0aOj1V42K5aVsCqSCebw8TPX7pGD8Baee4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sOA8nKWirkZ9P3hmRyO1HEOPok1SrqDWhw0Hwy5UxEUdmFYDG
	A+zNC/+RY2XqpASQjpz7d4pXiIij6wpDqqNnlJ6L3Q4EPRNSV4Ohunlxfr0VtivZJ63b3eYer8b
	Ko/n1eWdkaUJ5p0rzzg==
X-Received: from edfg4-n2.prod.google.com ([2002:a05:6402:a244:20b0:6b5:813f:c569])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13c5:b0:6b5:76be:be54 with SMTP id 4fb4d7f45d1cf-6b777829b2fmr85425a12.35.1794335147866;
 Tue, 10 Nov 2026 10:25:47 -0800 (PST)
Date: Tue, 10 Nov 2026 18:25:47 +0000
In-Reply-To: <DMRMLZSZ0LAZ.D4P70QWX0IHB@soleen.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com> <20261110050202.529473-6-tarunsahu@google.com>
 <DMRMLZSZ0LAZ.D4P70QWX0IHB@soleen.com>
Message-ID: <9huz5wy4tufo.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 05/19] kho: Add feature header for fine-grained ABI compatibility
From: tarunsahu@google.com
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, 
	maz@kernel.org, will@kernel.org, David Matlack <dmatlack@google.com>, 
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, loganodell@google.com, 
	arnd@arndb.de, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org
Cc: kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"Pasha Tatashin" <pasha.tatashin@soleen.com> writes:

> On Tue Nov 10, 2026 at 12:01 AM EST, Tarun Sahu wrote:
>
>> +/**
>> + * DECLARE_KHO_SER - Register a serialized payload structure with KHO.
>> + * @name:         Structure tag name (e.g. luo_ser).
>> + * @payload_size: Compile-time expected size of struct @name in bytes.
>> + * @nr_required:  Total number of defined required features.
>> + * @nr_optional:  Total number of defined optional features.
>> + *
>> + * Size and 8-byte alignment are asserted under CONFIG_64BIT: KHO and LUO are
>> + * 64-bit only, while !CONFIG_KEXEC_HANDOVER stubs pull ABI headers into
>> + * 32-bit builds where u64 has 4-byte or 2-byte alignment.
>> + */
>> +#define DECLARE_KHO_SER(name, payload_size, nr_required, nr_optional)	\
>> +	static_assert(!IS_ENABLED(CONFIG_64BIT) ||			\
>> +		      sizeof(struct name) == (payload_size),		\
>> +		      "struct " #name " size mismatch");		\
>> +	static_assert(!IS_ENABLED(CONFIG_64BIT) ||			\
>> +		      __alignof__(struct name) == 8,			\
>> +		      "struct " #name " must be 8-byte aligned");	\
>> +	extern struct kho_ser_hdr __kho_ser_hdr_##name;			\
>
> Remove this extern.
>
>> +	enum {								\
>> +		__KHO_SER_SIZE_##name = (payload_size),			\
>> +		__KHO_SER_NR_REQUIRED_##name = (nr_required),		\
>> +		__KHO_SER_NR_OPTIONAL_##name = (nr_optional),		\
>> +	}
>> +
>> +/**
>> + * DECLARE_KHO_SER_HDR - Declare a feature header variable, field, or parameter.
>> + * @name: Structure tag name registered with DECLARE_KHO_SER().
>> + * @decl: Declarator (e.g. *fhdr, **out_fhdr, or * inside DECLARE_KHOSER_PTR).
>> + *
>> + * Declares @decl with type struct kho_ser_hdr while checking at compile time
>> + * that @name was registered with DECLARE_KHO_SER(), documenting which
>> + * serialized payload structure a feature header pointer belongs to.
>> + */
>> +#define DECLARE_KHO_SER_HDR(name, decl)	typeof(__kho_ser_hdr_##name) decl
>
> Remove DECLARE_KHO_SER_HDR, use kho_ser_hdr directly.


I added this, because wherever in the kernel a serialized struture is
preceded with kho_ser_hdr, it will only be called `struct kho_ser_hdr
fhdr` which does not display (to readers) that this declaration of
header variable is not alone, it also holds the serialized structure
after this variable.

Using this macro, it clearly explain, that "Hey, I am header to this
serialized struct and I am compiled time initalized using
DECLARE_KHO_SER for this serialized structure and my pointer holds
location to both feature header followed by serialized structure."

Techinically this is just for readability.

WDYT?

~Tarun

>
> -- 
> Pasha
