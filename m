Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599895;
	b=ofz2gXNxdAWEFSFEELTUzXJhLv1Ilb2KJSoBvZ81XVF2kCYr/l77H28ivz71A6dZsnXz
	 B1qWZTKObCaVlx6XT7C+zC2bk4Mun1tfa2SKvlZEcgRU65bDN8F4jNSFb1qE9rM5xTsbl
	 6vC3ixJpzHbrTJJgSYbG6lxFPOR9OOLgD4dObY/zdWSCbuwbhxWvmt/28zCDn6nEWiOh/
	 UNTGuPMUq6OppB7HTnjiuygB5rd2iNwe2HPI8IeFiE7Ek5SkgauXcllxH1eTQplJ8NZ5I
	 NG8Wt5tXfJOvADYBooDQt1W47ISbfv7801uHp4ZZF+8YEL2RSngH5FuA8oeNeDKlDNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=SA/I1XcNdOqWCHpHPoabvJbPaHjQpV93aW+4lUY75XM=;
	b=OHiJypIjlPsGEaQxYbyp2u7mYad+h/+AEzovVwDRutaz7A4MCbMxII0E0Sm0Bx74FpmN
	 Z1+2r43CpAj3HuWQDjDhBcq7RS2WfFJTtghmZqlKzSq+Z7OqkzL+LAee76HPTsW9uTo7W
	 +EYAvAszK3LwI60M9BHQ7beomo5VgXzHf5RXnfDwjnJVW3JnyKN+A8V+AdPgBrvSJPVxS
	 yqE7m1RHT2/6jZJLDwRBgwhvPxkhIzehuWYSXw/UesJPNdb3MUbGznng7RoKmKUobuhfx
	 ITsW6cAGn9ZCZmq0AC6Zc+x63Mh4B9NZR+VFuJicSOga+KntO8eR52gFv/0hIByFTnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MAPT6p8f;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA536606AEBF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA536606AEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MAPT6p8f
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b14c80b210so310215a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794599894; x=1795204694; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SA/I1XcNdOqWCHpHPoabvJbPaHjQpV93aW+4lUY75XM=;
        b=MAPT6p8fzX9d12RkIjrOPm2Vue7u555UmawaN5NwZ3kF8eomxf1unrChz4ijRJddzc
         A6Md4fH+XjA2x1dmEsonbcoTNkR34hZ9Waa1GsLQ1GAOVnRCH/Sdpf5b2cm5q+JMAWSS
         pqOdCmIxo/F/Coty9/1uaqJON4Jn28u9Dc6ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599894; x=1795204694;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SA/I1XcNdOqWCHpHPoabvJbPaHjQpV93aW+4lUY75XM=;
        b=G5WoIfKOy4qOqMTrO4xUMyEo93bh00vvx5qjzk0xQC7j0uGhiNNHHsqM1WG2EvlxYF
         GgzODZQIAwIxJokcwqw48fIqDPazqB5OWaFjYrX3iJk3KKPsnBvHxHOWZqN7uj2iQQoG
         oRUOCrYVkJkv9wrH1RzxrWK9pVLoVlEQm7ZPzkrhAXi1wQRIFtrop7Z4CGGhky9CA4U0
         vTzn8PnRyrX54C05Sbxat+kcwlu8OWk0gNTeaDFLEwU/CJnkEzQ/QdxWsgMId/o0cN80
         ccTNto3gJydVGSkyv2SqK92flHPhvQozQnMkR2gBygqgWvFt6xHIyB2D5RpSGR8FgEE5
         fPQQ==
X-Forwarded-Encrypted: i=1; AL+hErH1Q4c/MOoJH1tFuIuHFgnJe9zJVA1oCt+9KdpIo2MhGgXCb7EZ3K7nncN2dDS6zl0DZ3w3UWeRTB9Na+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M1v4zxJs2OVlzOVDZSKZQlhyM/7ah/NFFRQdTnLQaGdxBoJUd
	eEzHLLgezSVv0r5YcGWQUgfMM9ssUPu/NXH7uvPJYKyuo3mPLdXqseVZQDO8oSg8668=
X-Gm-Gg: AYBFou0WDpMDVZ0hvw9GqDSa5qa8KKXhek7Cjn8FwjLAt9xc50wzB6+HYAW7Hdk/8MR
	VsC23Bqm9G9EO1cF0meiOTagLvtPshwIDqOBTsNEu76SJ5CneepDIU6+I2NQeyWeMJyG4sJ3rww
	rkrwetE1buXKe36LAxl0tg1TllujxklNRsiCxNU0ir+S/FgHwss6ORj7BTWLdGBzj8yDcktcgFs
	aS73dVNat081ym8gpDUZmHIwwfwMf0zaEzk8gv/VboZk0Ri9s2EofGiyo/W4q3cNObqOxTL8UCU
	qzypJQ8Z/wv1f4NCfgYHK+lgcfDJVlUeckpa30/CL1e8Duu2OGksRnNLw1ipJXHEWDw42Cyg5Ua
	cEJ2QvlQ8WYjpoIldc1HTwGjpeQ6evy5owcirElSNwViWVTxE8q9zRk+541g9xz5Y6yNfHZRbJO
	Tmb7QHPoJLLaDEptH2TUbebYNuGanQrschjajr41zVRfmOYy1PjYCCobQoGsjYxblQFyU/Wfhqi
	Dob8b8/0k5zA5P6oaBHqvVZbu8tnsw/yeR16VYP8OgFBgQwE+QrvU+UTrZNyT5yvnKdgD2FwAj8
	XUoMUtR/tYf2hbobQ8GIOxCNXTeJSZoWlGHSsMz9rZqHRbz5yMaUX7ytaT24+j6YTXLUCWDE+1q
	DMr12tIPci+KmRbLUR3I6aMlwEZd8HE7mbSgUDjj4fPHI4i3A6qiSgtMu92Tsyw2GK2Pjl+vvsF
	FoI4FPC7TYRKdiKXYrs/+Y5o9IyyxHjBfVmnE7LHO/wZnbESrP2lHUkWWCHxawbxYwdveQjMqfn
	jzTQmj3
X-Received: by 2002:a17:90b:394e:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3b1b0b60493mr3259630a91.54.1794599894079;
        Fri, 13 Nov 2026 11:58:14 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec66f4csm5853480a91.14.2026.11.13.11.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:58:13 -0800 (PST)
Date: Fri, 13 Nov 2026 11:58:10 -0800
From: Chris Down <chris@chrisdown.name>
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: dennis@kernel.org, tj@kernel.org, cl@gentwo.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org, boqun@kernel.org, longman@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net, acme@kernel.org, yonghong.song@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev, nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] local_lock: do not put btf_type_tag on the lock guard type
In-Reply-To: <20261110012235.1024461-3-vineet.gupta@linux.dev>
References: <20261110012235.1024461-1-vineet.gupta@linux.dev> <20261110012235.1024461-3-vineet.gupta@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113115810.cd33f9ed58c02dd9@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Vineet,

Vineet Gupta <vineet.gupta@linux.dev> writes:
>	typedef local_lock_t __seg_gs
>	__attribute__((btf_type_tag("percpu"))) lock_local_lock_t;
>
>	typedef struct { local_lock_t __seg_gs
>	__attribute__((btf_type_tag("percpu"))) *lock; } class_local_lock_t;
>
>Both put the tag on local_lock_t, an aggregate: the first on a typedef of
>it, the second on the pointee of the guard's member.

The typedef is the aggregate case, and it's the only one of the two that
GCC warns about. But the second one is just the "T __percpu *p" spelling
that 1/2 keeps the tag for. _T->lock really is a pointer to per-cpu memory,
since local_lock() passes it to this_cpu_ptr(). So the tag is correct
there. This patch drops it from the guard's lock member and the
constructor's argument as well, not only from the typedef. I think it
should keep the tag on those two and only drop it from the typedef.

>Every variant of an
>aggregate shares one DIE, so there is nowhere to record it, exactly as for
>DECLARE_PER_CPU() of a struct. clang writes the annotation into DWARF
>without complaint, but pahole does not translate it from that position,
>so with today's toolchains it reaches BTF from neither compiler.

That's true of the typedef, but not of the member. With clang 23 and
pahole 1.32 the lock member comes out as PTR -> TYPE_TAG 'percpu' ->
local_lock_t, the same as any other per-cpu pointer.

For the typedef, clang 23 puts the annotation on the typedef's own DIE, as
you say, so there is somewhere to record it. It's only pahole that doesn't
pick it up yet. You also mentioned GCC patches for type tags on typedefs
in the pahole thread [0]. Once those land, does this warning go away?

>Unlike the per-cpu declarations this changes no BTF at all. A tag in that
>position was never recorded, so there is nothing to remove, and the one
>percpu TYPE_TAG that does reach a local_lock type comes from those casts,
>which keep it. An x86 defconfig built with clang is identical with and
>without this patch: 152551 BTF types and a 6828300 byte .BTF either way,
>and .text is unchanged. The patch removes a GCC diagnostic and no more.

The defconfig BTF only stays the same because nothing in a defconfig uses
these guards. lib/test_context-analysis.c is the only user in the tree.
With CONFIG_CONTEXT_ANALYSIS_TEST=y, class_local_lock_t,
class_local_lock_irq_t, class_local_lock_irqsave_t and
class_local_lock_nested_bh_t all lose the percpu tag on lock with this
patch applied.

Nothing in BPF looks at those types today, so this doesn't break anything.
But it does remove correct annotations to get rid of a warning that is
only ever caused by the typedef itself. When the guards were added, the
type was only ever used as _type *. The typedef came later with
3931d4b98039 ("cleanup: Basic compatibility with context analysis"). If
GCC isn't going to accept the tag on a typedef, could this be limited to
that typedef in cleanup.h instead, so the guard's pointer keeps its tag?
As far as I can see, lock_##_name##_t is only ever used through a
pointer, in DECLARE_LOCK_GUARD_1_ATTRS().

[0] https://lore.kernel.org/r/252c53f3-3f06-40f4-9cd3-795eb298687c@linux.dev

Thanks!

Chris
