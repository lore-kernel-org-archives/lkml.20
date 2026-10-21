Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586914;
	b=4jYSb3g1eW/SfMG5V1Ew5NP86T+RPddo60nX+qGj/JZcaAkkobMXP5hKNCTTuhbIwjnW
	 cwj+dhXyTINEWgVA6eAQ96vridOd9PGFVvGQHjXCpteFgSqERwRdA3B1I6mF5GuxRAjHF
	 Ecar0K6QAJCDQsLpmU/gqzTkUzhRi1e7PZziheqCPMpk0otInP3Ky7LkPQxOLnDYZlRmW
	 plYK1BPqM3Rn10zKiygMvWqoF/ep4pEVT5WR7vpnb+j3eZQzxiEGHS9ppaObX8DjKj4mb
	 N9WjIFDzqtRwl07UFJGLzlpG8cMrjobdPrO2hn1WLSHfOEz9HcuaEdqvmmN8JyhoXvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jUm/2BR6ze1rcECKH1J15rNzpuOX+gPscXt8OLTMYMc=;
	b=0sis2T0dgJHbQYVxOJToYye5NxgjkUyiQKwfCUhG1H7lPwy6BbNiMd7KJlzN//M+5A4j
	 6aih7UN98HnWJ5LYng/4qHsNceglbcNGhjExE+Nk9LUjnHt0FIHsINncUSwOMusTVYWQm
	 dz9LhcVwHyC2TkTcusZNi1lh0/PQ+LsvAxHqlxaJgD8aHXvu/Ice6mnK7xxCfhftwfMRL
	 Mhn5MUglU8GVXIxlHlnEx0nOX0RBO5nfA8dp7wc7xVEYjTd6aXe9q/tF41CTSZTxo2POH
	 DEbfOf8cxFLDNduI8jb/IIMBQ39Rf5r6fOsOc/Uw5TZSrz/SDkC4S6Jy8ef2glGbI3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Soe0+LCc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD7B606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD7B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Soe0+LCc
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b9e758c50so8848716d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792586912; cv=none;
        d=google.com; s=arc-20260327;
        b=QHQrEtK0S7qJBT6YDbheDccvD7Bt8YSkKbd7FFJgJd/wh+AvWl4AfEuAO8DPgPMLYD
         d53A2zt0i9LwehFKpixcWKyBVBzohad4eIr4K6k/4bkb5qIBvZckPhFgi1QAs9F+8grq
         wiSXV6FSp3JZuZ0KKqLLYexxS+qhk2Kz7kxFqWEh1aw0a+cZv2e5zCE6xGeR0kCnCTCy
         qx5mv1KX/qD5VzSdsXjBEIbZMTxPEApf4WXNwjZY3E/C6sWOwo/661i+LkF3sJJUWXK3
         W1IedO/L1RGQWiVxqRSV36WTnReVIGx/6XkNq6wSWv7HITMyFWMIZ1O/XEDWH3yky1GZ
         epIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jUm/2BR6ze1rcECKH1J15rNzpuOX+gPscXt8OLTMYMc=;
        fh=RyFWEG0k25P1sx3ogHP9i4iYBOVNtKARpgn16zKVyOU=;
        b=SPAzROXR6NaiaDkwe0flSbjxQNMBr1Rd2B9nHWqbaih/TmvRZcqFoGervCEJrVQDua
         D04jV2DTRPHXQi4VFDXb6RI1uA3zyMqYTO2DHoCyenVNykD6r7fjFGs9i+KOEhJemqUV
         5iMAyRe5GaEdxDQj8LrqPkj8uYju0QeQ86dLwYpU15AW5307ZzFAcpNDLkaDUoLXw5nz
         bNXheOGyFXrzckK0fZrPukTKLoXPlzgQJtNhsBOHp/IBp25f8wjPNh9hcrRQbJIc+GcK
         Oqx8OzgvSujvmfxpN4NABmrXwTx8t6v/P530cab0Bs19sQYUQilBRf3KmAts98DNZ8CT
         6rnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792586912; x=1793191712; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUm/2BR6ze1rcECKH1J15rNzpuOX+gPscXt8OLTMYMc=;
        b=Soe0+LCco3Pw35ipiXqjfCaEI3OPNtN4FImHef2F4TBwHhHt1OPZLaIGg2oLlYR0eX
         GHQYL+ORtH1KKwLeh6zCvzlwOX2ELQEGGfy5PuLOMAvVbYCqUIjAMuy7L/9Q8tnyEGaw
         gcmE9FN2C3ZwkuQVXLnfKLHMPz0c93IoHmQ69SG9F28TB3qxKkD2t7ilDLZjDA77OZmG
         Y4pgvbIN7ULCF7fh3NUZ0hFwmLz0TK7F2FtLXhef+UuUadT46HoDgugfl0binsR+a7Fd
         ATe/jpzKWMldv/C3mpEm8CRURgo906zNu4VbGhwNUkXLmravANdGrJqJ6Mw419nbOkZR
         NTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586912; x=1793191712;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUm/2BR6ze1rcECKH1J15rNzpuOX+gPscXt8OLTMYMc=;
        b=ap6A9BuQq73cgl9minEzS1NBU6fIQrh7r8ntxznNHd7eIE2IG/sG7YRlfaNhrKpbe1
         KeH4110R0tZqv4ugQHz+yfDL0rfFpENCeJXhkF5QN/1pttzvBnnq+MbWK4Lzv1OMVC6u
         bPQEwbOhOZIyptTTNkXAQcndc+sJ2W37q87h2+ZrmM2N/T6hlGjEKniWUkZZU0Ph+pc+
         Nh9MxXi95iXwgSLucKMpVF0MzPLKFTQIxUuv7CdMB0csfZoB6xyYuVD9YGgblbfji/kO
         6zJrhxmeGzCf2Z4HRN2suRETHWpObbDSZHlOiV3q5Al4pDhwh0If420KXUb/U5ALgyzh
         lVqg==
X-Forwarded-Encrypted: i=1; AKwUvBz+fOuYsS+seR2EBb5/X7C/y2UmxKrrH8a7z8hmeooXfoA5aY7wd0KN8XGhDDsEos21hYWr6PKvbfey/jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSGVreb8aEmqXWx8LCYC1VenZAaFpiB0Cg/dGbQ1HUNWVar5+O
	orT2jBZ7SasNDn1Zgd0ML3jPyDeREEMhngggWwR04X0x8xqT5p5QBngtdSlI7QfQP8U4xGHorYx
	lD2BWz58LoNKZu57EHOzE0hZsEWIoDtWvxj1KnU/8
X-Gm-Gg: AYBFou1ccDGF4yod/UuC6x52FA97yruq+vLNMXmaAqRi2+ZMUNCZ9x5Z4o6a96Egpja
	uFQeyN11h2H7KrrmIgKydQ/I4V3KzjyFy6HUYqSOWICFtwSvvQhggcPejGDQvjRxTF2mpTuuCKh
	u/7eBAxDuMXNCfuynleg8Ymt0bJkrqH6niaYDV3xBEjJ8nFQfeDlScBE9ih9l9CxwDpBuHzcMBv
	7NiwLG85/XZdCcg7yHG+BoP3I1ls0AnkKYPYcZRUHBPG35c5DvE2jLxgP5q9IInrtaZZODAFH3U
	g6aClf+6SmjZg7I+0FeuywfwBO0pMh2cNX5vuzEyOdeFapqOd3LDhbydP4GD/KGCqoUfolV0hhE
	yjY1sj8vcy8IvX6uDQBGvt3oLA4VDDssFY1eL/wQC5R2xK0tqPEW8PRn33Js6PQRa/+YFqBcCnS
	eFDwFr6xxp9iPB
X-Received: by 2002:a05:6214:4589:b0:917:a1d0:890c with SMTP id
 6a1803df08f44-91c056b270amr87924726d6.17.1792586911258; Wed, 21 Oct 2026
 05:48:31 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:48:30 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:48:30 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261020131447.122096-2-pbonzini@redhat.com>
References: <20261020131447.122096-1-pbonzini@redhat.com> <20261020131447.122096-2-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 05:48:30 -0700
X-Gm-Features: AclHuK_Dm1J20mdRZ_zyhTFrFUGVGiUQEI63SZVUaH4uZSxjd5cCfTtyvwhdhPw
Message-ID: <CAEvNRgF89=xb2t1xAOLZJAE68CuSDW0asYh4n3karuffsnrfdg@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: split CONFIG_KVM_PRIVATE_MEMATTR_VM out of KVM_VM_MEMORY_ATTRIBUTES
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: Fuad Tabba <tabba@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Shivank Garg <shivankg@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Paolo Bonzini <pbonzini@redhat.com> writes:

> With Linux 7.4 the "private" memory attribute was moved from the VM
> to the individual guest_memfd file descriptor.  The old semantics are
> available for backwards compatibility via CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>
> However, this ties support for VM memory attributes entirely to
> a backwards compatibility symbol, which is a problem when adding
> VM memory attributes other than PRIVATE.  Thus, make
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES the equivalent of the old
> CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES, and use a more descriptive name
> for the private memory attribute.

I see this fits into your other work on adding other VM attributes. I
thought the plan was to do something like this when the other VM
attributes get added back.

> Do this now, instead of waiting
> for more attributes to come, before distros start adjusting
> their build configuration.

This is a good point though.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> [...snip...]
>
