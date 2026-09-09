Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F5F43F4AF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993708; cv=pass; b=aPp1VDTohDtQ9H8nDwHWvkHRtjMDYTN7uucJdLGf2VJRkFaX+fU1Dd1uHJOb/u90R/GMAyO8nFENnVG06Qrm0ayaBLEa9CKeV94/X5+K+26AY2wsxYz8FX7+ZnZOU2g0j/gzola9+XAoBOC47Oq2HpMNH5LSaOctjUCh+V22DQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993708; c=relaxed/simple;
	bh=NTWMXK3qBllEwS5xxNNJmOXFEuix2lqI2KW5LUWH0nk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RsUv1Ks3N5nAo+m5qGYXjHEKLCTD5paSfm89xHCYbnORbqpF6KdcuWzgdFEmgLW2HBAZsTIU9MBIgRMevDKjPQDprcOc6kdp8Fcv/nk1A96HFIlUG5036AbRZpHCJo71FZtijPCffVkfgBBVBAVRl7JSujhQNEyqOTlfurDNAHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G2rqbkcd; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G2rqbkcd"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148cso17420366d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788993698; cv=none;
        d=google.com; s=arc-20260327;
        b=R4gWty1Lm/CUP5l5kjWr8/afAa4OO5UGdveHslQYkWRgZFHND8Dfr1jRghbon5sZsb
         6aYGtv0K4ipSmUCWWspNqZLnoHxWybZHtxNPHUOYXqHypN1a+CRpQK8R+dK8yNDiz479
         MOW8UuEYOlV1D7MQemUPzn3wb3h+dDZrFwxj1WEtaGt0fBge8Mdr+PtFmUT0cAsP0zyk
         YA8LRiVxozzAgDDkSVEKINGRxmJWrYxUx04zKXrLmSst2nb6T6/9qfinKs7xXpbYklm4
         o6NHUbRvkBCjJutQQXztc6mnWvS4DXsxkqQ3Lf2BHjAH1+KdSJSI/djx/cRHTGCq2hO0
         1L/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=K7y90OKfcw5Kem65C7oA0LNo0uX7jIHf03YJVGFM0dg=;
        fh=GyeOdIWkpXiBM2dWa6slLHcYKwUqmJ8MX3yKNxIJUCY=;
        b=FkQ2IaAIQAc/TOlsxr616S8SvtV05uDzBL+vsNFVDdhlOJ8K6xAe/cf0X3xU/aq0hN
         s2sCQmntWaoPfT2fj5IoKIJYEKg1OZ/vDb22A2nwyIIUEYYYzd79Ye9qAzzRqhKwNEM0
         PnKCadzHVs8bwcxbuzG0lDfpn6JybjLYYKe/5Agj5KqjvmqgVzQ0InoEXBdtYSEtpI6T
         MKQu26A5rNZE9OIt35wJXUba4JyToV9j+b47TLxMEl5/8u5IKnKgRewK739vQdzpTLg6
         wlTBJETyWltgDhz/Fxhc4ekdjHmEptsAEw0PHJ8Ldg6UH23i5bS8YoxlxeT+wxhlv6gV
         l1gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788993698; x=1789598498; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7y90OKfcw5Kem65C7oA0LNo0uX7jIHf03YJVGFM0dg=;
        b=G2rqbkcdAr8tmLVUFqM9mdb/wGB3yaWC7Ys+HxXHpvuyU4TxjC/z2rCxCtc5RHaJkE
         Nabtmse/5Y7cQKBLwqW1DLuOk52CmzCmNGhIxRDAWPS9ecNe7UJcIOUDFo3HsGh3F65m
         O9cAPg5qIMovmw/N+e8WKKKzdTxUyF+v05AjXv48R6ZO+/LEzT+BqDj06Js2iSkSVLEg
         93Wm0GH0710DVzUecZtrwmpMfdE7uhDSkq1CG3uGWIaNvzaJ+vIa41reLT3IShT6ONWo
         cVcgnOOyCO6hK3bVOcCrTXtACRZhbIXgFtW4oQqlnD2TDB/KS8gQF0q6lIcXEgT4wRP0
         EHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993698; x=1789598498;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7y90OKfcw5Kem65C7oA0LNo0uX7jIHf03YJVGFM0dg=;
        b=XlgoDtXOohbY4uHr+tOBqCIT4u3rwwu4Bb6pGeRMRHLUOi5nNaraKlXp27o5GhymvT
         jwxTnT2MlGFKxRr2hVR+jyevXAzSkQAYhk/s8N3YH8DezyXkq5mCVRpzN4RiHP0oqf0N
         L5rpIu8I8bDFZ/2WM2RoF/erpEcI7XVXaDUNxcYkPnRBh1m4c3c6kTeyjDeahCMyj/WD
         Gg4YppnZAYZnG1CMhiV14j/naKsKKMyYmxhV0ET0UqEAAoUXioHQWIKgaZSmVCQU9uF0
         OcQWGkC0vOSv3cLDJ6WNFxYLbu6P44hw0KeXyc6UyTyVCIOMiiIFT9PKK2R12ue1d5oS
         u9WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzumzm/8c+XF62/qocArfkt2bcIlJZGU/eI4igOpqKpIGIqyFbUE6M7haBjFLO7C6qu/EAr244pp+8VSvs=@vger.kernel.org
X-Gm-Message-State: AFuF++lOYg/DnL29CEAlasLsuy/rJfzIfTpSXVoXhSCLX1RLKuoqblYE
	HgimW6oi7En+fjYPgVYh08Q2i9tAUZZlJk6dCi/AOruLmW6BjwXXLjaDTRxbWFzBXlSQteTAFBr
	aq5nFbaKTKdZJSYRxm1UiDTfwl660Owuu8D7zMyQ6
X-Gm-Gg: AYBFou1T1jm3KGFV+H4LUbmlm6fi7la+w3BUQMFhEyzVke05FgmIOGNgewVy5I528Gs
	rTYBO7n4jBRStD6x1NhyOBKW2T0xYZhB6/qMDIbQVfsTKoXsfc7Sn5wn12eZI/JWx7sxD1DCXC4
	eyHpyaTThnaPjN4NQ0+m9quExJvxAan/tsoKzwXLYhBSYVHeXovuwOg/WqhQ2MrePIDos7bOUen
	n81IGk/fbTOQNT3xpI0Tn1kJsdM2ZozGWIJhWm9BgDdr06rYNYcUl+vq2nPp+x6dN5a+PW2U/fz
	IuQ7c6918Q7m2dCxQYDmYlDSSKg9z15ybGN5Pn2UdKffRyI7sPJkNdOZOrvpO9urITjSh9t4dBQ
	fXZrG5E7uzg5ZRyXEhZzYGxcjUeZjn80iBvqEPV2n
X-Received: by 2002:a05:6214:4891:b0:910:345b:954a with SMTP id
 6a1803df08f44-9106b448140mr149416676d6.37.1788993697090; Wed, 09 Sep 2026
 15:41:37 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 15:41:36 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 15:41:35 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260902194657.79075-1-gourry@gourry.net>
References: <20260902194657.79075-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 15:41:35 -0700
X-Gm-Features: AcwNN1WgHJXiyXU_ZBa_1-DE36OkQO7Bg_jMLCkg3DfJNHdXNcM4XNk-5IPdjJI
Message-ID: <CAEvNRgHWyBaBpZ4Bem1Eu86b-cuEA7NkyjxTJ4D3FnpGe1B2Yg@mail.gmail.com>
Subject: Re: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, pbonzini@redhat.com, 
	seanjc@google.com, akpm@linux-foundation.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Gregory Price <gourry@gourry.net> writes:

> guest_memfd allocates its folios through a per-inode shared mempolicy.
>
> Today that policy can only be set after the fact, with mbind() on a host
> mmap of the fd. That requires the fd to be mappable, and it cannot reach
> folios that are only ever guest-faulted. Neither holds for a
> non-mappable (confidential) guest_memfd.
>
> Add GUEST_MEMFD_FLAG_BIND_NODE and a node field to struct
> kvm_create_guest_memfd. When set, KVM builds an MPOL_BIND policy for the
> requested node and installs it over the whole inode, so every folio is
> allocated there with no userspace mbind().
>

Instead of a custom API to ensure all guest_memfd allocations come from
a single node, how about these options?

1. Using cgroups/cpuset to constrain allocations (could be troublesome
   if the guest memory is not preallocated, unless the vCPU threads are
   running with the cpuset config)

2. Process-level NUMA policy

3. Why not request the guest_memfd to be mmap-able just to be able to
   set a memory policy?

4. How about something like fbind() that takes an fd and offset range
   instead of mbind(), which has a prerequisite on mmap()?

This doesn't exist yet, but I'm hoping to discuss this at LPC 2026:

5. What if you could pass an fd representing a mount to guest_memfd at
   creation time, so to make all the allocations come from a single node

    Step 1: Create a tmpfs mount, specify mpol for mount to MPOL_BIND
    Step 2: Get some fd representing the tmpfs mount, hand that to
            guest_memfd at creation time
    Step 3: guest_memfd allocations will always come from that tmpfs
            mount, and abide by that tmpfs mount's memory policy.

May I know more about the use case behind this new feature?

>
> [...snip...]
>
