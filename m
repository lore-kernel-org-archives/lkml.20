Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858124;
	b=wNBcldzfJ94sKhIKpcUPWwNb69pUyybQc6trxiLoXLAUljdRpOdstk4VT2CmXIknYqHO
	 s5zFZzrMLhRyzhP6rrHVMXQGX9xauhaJ3PSpOXmascqj9tf7hsywZV09LdPk967e6nWey
	 2hFYW6brpLUKgV8Bw8G1wA8i6pDH58DURXLOF/DVicFqJLPk/drAzQ5og8bSu4aYGYTXB
	 UMNh1kpU5zEvYtIWP6OEkP3hix1xULLz+CRftVJ53ICpHQmb818FRsYfKZjcDor/kx0Nb
	 JqpGafacEokVv/NBNgobruh25Hoc4umPHgS58ACgYO3+EPCfgUro0zqYQTdwuK/JwGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
	b=LMyhXtR4QZ34cyfLSQ1GJ57kMlQrLZhuHC4Y/KQUq0PJQf0/kqg9iGHbNX2i6le1K1xO
	 e8LFzLcKm3oGWecZ7qN9kWBh+hbRvomzx59h/vzmGAltsyh3cRAS1+ehVn4sFsSCH1tSn
	 ylfRTEmQDuhuNDK1KVzHuqFAP05/hF7JcLyzR7ttFq6+LLDTqjbdYfGYDP1Zh60lY3lwJ
	 uR990BDfqknura6GrO4vPzdZ7kmkUWfbtocBHZb0/WACJX7WWJLBxQ5OKNkR4mo7WB6hN
	 /vZ/S9/JlNCmdTQ9gwKGvev+5XeYt0+UI49/m+sauIonCz0PYl3Pv80zBSrKtQdgTnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eoWff0YO;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE73606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE73606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eoWff0YO
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d427836e9so513744166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794858122; x=1795462922; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
        b=eoWff0YOlKIoIHjF1NQtRoRnm8FUpD+Y+ES0aboA/2ep5x5Zghx7qc5wWe3xqvFIq5
         tLFABPvvov/AaKN+xXjGw9J7GLBZRa0WfosWqmjeG3+hmpXmqdMIfACR+fKVNwT0aPdR
         3bVvEL53CTKRlo0pUJynlr8GV8cVqYdq2rZXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858122; x=1795462922;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
        b=Jv6VmVhAJagS5iwnLv6OOolomgHw/TMLBE7JEuQFHc1bym6lz0+e5qINyiroU7djmY
         vDWpbWoVgGKvm2aSxJ/Z5ezLzuWqMO7fHFBy2lGYipeTXTHqLFUbLK7i+Fa1HFky7MAQ
         3hjgCTnfcynVV58KaTyZqRjKCyV4mXi60Dh1SLqgko9vwKIkTd2ShdGYJduffqAN2jQb
         ynk63p0SAHu5TNqIBgTL9xH/omevqZ1fLViVVqYIA0LaD29a+FMxTrEDkPLlGCA98gzK
         H8Wr9t3rl7WcPOwLetZSADi17Exo3HN/ipPNeOpSqBeXP5B0ZqsmNmJ8mIgFxVp/affl
         iJpA==
X-Forwarded-Encrypted: i=1; AL+hErGm0TU7ilXgv9IV8ns+SllvmhOv29jCc4DBSE10UcKmE0x7iE/0U5Df8SlfewzMDjtxhg/AQrvBvGF9SuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BiDRRj4OrUX3DScjiNizNTLJBO6T8IZyNHH0p9/BM+i9G4K+i
	L4QPiLOm8bR2Nv9mG1m48vxs/P3/OIQEduZaf1QPZHGNDjVWNFooB+6AK//M4HIMlO+fu53iLK1
	qQ3Tfn+YclA==
X-Gm-Gg: AYBFou3kaRAJq8rbGtlTBzzUb7Uj2m1ERSaZ8XuL2+pt/RH7v+KEvG9Kf8l208h5/No
	NuKC60Kjwvwh5BKsc/3WaNOrwiIKTlwfpiMHdNit24cT2ImRQjosX2/JiW0ZsWZ6lXpWQCRCti0
	/2xlba1x6j58mUaEACWoA5jFPrVK9M0FEf3rRNwZsA3fVr2MlRjkVNEweHsL5zGY1R8wuxUTnzT
	ySHNQ3EPVtkbqzo2obuiCAt5lBM7JaRVOk7b7f1/krsGwCm82rLco6c0t4xPzgckHxF3oBSqh4T
	rWznAndajpGzT0LQgeXda4nCpOMGEHjfBoCYXrnvVYcJBtrgESN6TOokhpZreIbV6TQDB4JNZx6
	B5825XRp40Jfd2qbO0yztPkVUiUVYQ73paOu5wRcPc9Kd8XZ7UquIp9/VIJk77hX2b8UpfXaJy3
	poetAmBTGuvAcZjArsOwAzfrdYqXgD+ZzZCO53NnJlCBudp9A8sCK8zVYOnIgxMNj8h3RjDgk09
	QvLguaR82MkzD9yaUNUReHuDszYrQrY0DEe8yjK6RRjSpXP7JZy9H7zMALl8GdLo/AbcEQd8OFZ
	FlDANw2Az1g/W1y4UwBHjMifg0uUvj6Su0zNgZFiJNb6LjQ+9Zb4x8xSIHgWjVwsAABzlu4QxFB
	D0x0=
X-Received: by 2002:a17:907:8b90:b0:c41:b94c:4539 with SMTP id a640c23a62f3a-c5096118f5fmr913832966b.6.1794858121917;
        Mon, 16 Nov 2026 11:42:01 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b427ddsm457563066b.43.2026.11.16.11.42.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 11:42:01 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50a4a2132cso507582066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:42:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFkwx61Wq636x0nm435djZdNVEnPxx2wwkbx9033FTm1DOa4mLnJPLTAERbyRh3USF1zWLQKj9j8qYQeTk=@vger.kernel.org
X-Received: by 2002:a17:907:60cb:b0:c4c:d6a3:f4bb with SMTP id
 a640c23a62f3a-c509634503cmr1008394466b.10.1794858120895; Mon, 16 Nov 2026
 11:42:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164719.1831477-1-sashal@kernel.org> <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
 <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 11:41:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg-5cWvYgmnE2WH4yys8tB5AwwRQU6kW0r5VoRYBLT7TA@mail.gmail.com>
X-Gm-Features: AclHuK-GW-sq_aqp10QbcNSLO7AtIlmoHSb6NWDtJ770GEzenoCICUrGbvxqol4
Message-ID: <CAHk-=wg-5cWvYgmnE2WH4yys8tB5AwwRQU6kW0r5VoRYBLT7TA@mail.gmail.com>
Subject: Re: [GIT PULL] Kernel API specification framework for v7.4
To: Sasha Levin <levinsasha928@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 11:36, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And I see *no* upside to any /sys/kernel/debug/kapi interface

And yes, the documentation calls this part "human-readable". Nobody
cares. No sane human ever reads and compares specs. We shouldn't
expect humans to do that, and we should not design *any* of this
around "humans will check it". Completely pointless.

I think the specs should be purely for automated checking, and I
suspect any initial spec should probably even be *generated* by tools.
Because the kernel API is not something that has ever been designed
"by spec".

The kernel API has grown over time, and pretending anything else would
make the whole project be just a fever dream. We are *NEVER* going to
change the API _to_ some spec. The spec needs to match reality, we're
not changing reality to match a spec.

Then, once such a "spec matches reality" has been generated, that spec
can then be used to check changes. But neither of those phases are
ever going to involve any humans, because competent humans have better
things to do.

           Linus
