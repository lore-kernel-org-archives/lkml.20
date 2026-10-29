Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793304091;
	b=gMaMWuvzX9yNBBwNhmZm8ArGUe9YqCqQ4QksijyRSPlVlkYUEOWPVSIuaYjxoupgrkLV
	 IQY/9147Bbi+qA9ESOkMXzTWMreAkP3jLN0KikKw8rrITTym1EcDVYT2T53VQloYn5fjb
	 Y3M/YunRqD8E4cnr+zoSilJ2NxjKDCm2cIEDQY2wt8f3j70gp6jezDgxSJN67ti7Ucchp
	 sWpG+Ffv3Y8D7C0KTwxZe3wuSwBm9S4m1DegRigtosh/hA9aBroOLCAJsTag1FuLkmRjp
	 aoAxDl7znYcsircTKDxqSOWck6S7SXerWtyaAiTF3MBlUKUxtHZczKPQjSuJ5HvNhtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
	b=VrgZgvfsIwca8GlWJ9r+a5yjss5HScYNPQZcvFQQcQfrGMvABkhbrFM7u4zrVbPNq6/L
	 w+7ehx3XllS8KP36DwTxJJhXjiUGiKfmeGZtpv7K2ZGI45h+oYRvvXPEnqL+fA7yFStLT
	 pmRobnRa4e2h/57+UyRTkftIraIki5pxCZNTkA6jpTp+NIloRewH7vJQbpYXTCedWtzxv
	 Vu8QqUN/9sODocYpjr2Xs6xduUV44tBdNKC3aHW6XMrLLxlUjC/6J273m43gB2deFclN+
	 WCHVtMH3bp7yWX4tMlkfrmTNAlJ5APG04d+j1oeaLS6WBVdYuC7mk4y0scNK9dhd5Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WzkVwYzI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C6E5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WzkVwYzI
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e64d52949so202843585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793304090; cv=none;
        d=google.com; s=arc-20260327;
        b=i5EWII6XgW8U4pWnDc84QA0MRXTpDftViK5x6lQ/VjQDEfuO+ldTNeLsehBILP00tL
         rcAHvJ9EUH3SB4ONofbtjBmNTiewG8rcUeV9mJncWkkqXqRUS2pqgs5BZ3BC6C/MtL1I
         +NtAIBaPiFMrSw2K6h8VBCwVwDp3p9uiYWa8SX/Q6Q745g82QpzADCXQk8CVoQ7WgpQ4
         rS8ojLdsCUuzh1FfpQ4Np6Y6fObWAIBIsVjkuGLLmpZjKh45Ls/nyS/h4+ubBPcpPrnK
         FT+N5MHBhFD+AYP0YIjcYCSWwso+fDp6/opCiIHXeURVpOwnbwRRTsg0nmJGD3hZfufB
         9GvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        fh=ntxx9E/uQjif7cfEQzvk6p5FkK8fx9ziGq5Pk2/CCuU=;
        b=BokFyLUYBHXn31zbxteIeGTgV0YQ+Nrz0XICQCgZyUNZ0+a9dOhw+fqdBz5dxf2CUl
         7TBqBzdCyvmTiOp1N1mKifl3XZVb6IH3ChTJ9AtObaeV93cy5K5VHLVQdW0tsjMPU94N
         iHqrlXpEvZxhOPOAAgM/HITN638laA1f3YnkMNG9+RWsKgvPn7c6Z7KCuLROBdgkwa5w
         LsUYtNdzMoKRe+79cElKS00C5In6j4mh7gcbCeWwoibivkYMofEu9soi9anXSChqUdAM
         hpIOJUI2gxkb3erSXUZvxG8l4EnABE2mQScRP2tx9e7+XHMOvOPfSEqWO3tFm8Nm/vsU
         syGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793304090; x=1793908890; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        b=WzkVwYzIEvlUD4jouGSIwB6FRlfF8hxTgPyyNpqGmkTWIQg0Ole0rsRJIpCMSLmcYo
         xny2WIjTKOduGBsjO3M3Hy3Y5Gpxav5pAEQ+dey/WDXOYqqnfW/4s9rt/5qtlD0o1JQD
         qgNWqEb/ESz1VmMIS/1NOS99QXo6xUINV4qKkkXEUdhm9m1VegHsAvLzUItKmZOIN1QJ
         iIqXI//Wxc9ozlcrU7fWVky9rHoQfM3GQHS/Ns3ot/06EY6+UkCJJuj9LxgFC9LLrk2R
         hMe7EXKbU+My2iqLUjxXv7+wewDozb/5zzK2zqO63rDc2gOPzlMplP5cO5XTnsm8pZwT
         JcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793304090; x=1793908890;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        b=xcRKbyNXWKqjTGq5e5ifTVQRL1nnWzur2kmpyE9PP2NzXuZl+EC8PplF6ubKPEOU9i
         2Dbt5icoUYWrbXIVzR2luWiIg1W5PQ1zoW2pnBY12EOjWCD+46Kf+xWhfLxAXYCsHnj0
         OST32FLrRe/7mC87PlM0+94i/ipUZEwiCpJQcfz/6uNKmK9bJNGlE6W+4reRKXzm3JBb
         yHakk146PwXA+qBZee3Ww9M3Jx8nReGI1+NakdUdHp9QDbB1fa6MbZG65fUtEo12dLvn
         QLAPwIxE2BdgoZpbvk7ZqLSZRgQUwsHu1wNiildMtTw0jdbenWPZuWx0SGZW9pWDQEQz
         cnZQ==
X-Forwarded-Encrypted: i=1; AKwUvByvlN0ZXusMEb7GNR10jHxOxQaMijnbcLbfB+RnaNvU8RgxDAomjzo2VbzhFxeHyqvXxev/9D1bprP1o/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFbmUaH53McBST+uAKy0VA+lzi2bTFOZbNgAr42a/NEM0GA1WP
	8P+RnTNLYsw0kpVuGP/X7PeBdQOwo4lFokIun5guGjzHExmV+DQWox2mLZx3gInmXy1Vr5Gw1Zw
	FStbLXrj2Nc/Gn5Xh689opw5mHbHEDe1/nNVNQ1Ke
X-Gm-Gg: AYBFou2d3q06OSlyjODnZZVDbLkpZzwAvSp89MyLiSbh+yZb32FvzI+G2HNBWU+RZ1I
	1QKekgic4quqaGXu3mO/8v1JR05GWPufOgcBU3vZXG3EhSu3SUpzdWNYa9rBwt9MbqceolaTQCS
	Sm4hUm22f+igvdORgjpWHyz810rU0qGm+OzHyqMIkBE3r1JaQNEDInBJvQdxiS/HWQIszVvQDof
	mQWbqMBm6NBx2zZmh2MBDevMb5SEeAPhKygcXoB8erYzUHiZbe381bxo52ehLm/9b4VbZUmXkv6
	ggIhsBEcwhD4ZJsjC41xRtX14hRDF5m17jjTRRfaROQKIwKE7ZrsEAD4gJsDASlovoY3GEEHFZe
	NsD2oETmUUdTMea+JC7Zq9esdQyJz8xgpvXounciPcdn56mr8I0+Hu4ka3cK27iZ4Tfsmg1wns8
	BM9Afes0FN8p9+eSHYrR425tU=
X-Received: by 2002:a05:620a:439b:b0:93c:b6db:8c with SMTP id
 af79cd13be357-94421400aaemr54046085a.0.1793304088692; Thu, 29 Oct 2026
 13:01:28 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 13:01:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261026064424.3003536-1-gongtao@google.com>
References: <20261026064424.3003536-1-gongtao@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 13:01:27 -0700
X-Gm-Features: AclHuK8yWAvbtrHc6IRHr91-GPti5braQ_xMkumtHHr_gZTK1th84mOiXH74nIU
Message-ID: <CAEvNRgFtgAFg_nBLXwvXv69zrCQDKRSvLC6DwYPAw30N+BEoeg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/5] KVM: guest_memfd: Add KVM_LINK_GUEST_MEMFD ioctl
To: Tao Gong <gongtao@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@kernel.org>, Ryan Afranji <afranji@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Sagi Shahar <sagis@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, aneesh.kumar@kernel.org, 
	Fred Griffoul <fgriffo@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, John Hubbard <jhubbard@nvidia.com>, 
	pankaj.gupta@amd.com, "Alain Gefflaut (HE/HIM)" <agefflaut@microsoft.com>, michael.roth@amd.com, 
	Samiullah Khawaja <skhawaja@google.com>, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tao Gong <gongtao@google.com> writes:

Adding a few more people to Cc after today's discussion at guest_memfd
biweekly.

Sean mentioned the link ioctl as the line of sight to sharing memory,
would like people's thoughts on this. Captured some of today's
discussion below.

> [...snip...]
>
> Use cases
> ---------
>
> 1. Intra-host migration of VMs with private memory, where the
>    destination VM takes over the source VM's guest memory in place:
>
>    a. Userspace passes the source VM's guest_memfd fd to the destination
>       VM, e.g. over a Unix socket.
>    b. The destination VM calls KVM_LINK_GUEST_MEMFD to get a new fd for
>       the same inode, bound to the destination VM.
>    c. The destination VM binds the new fd to its memslots with
>       KVM_SET_USER_MEMORY_REGION2, at the same offsets as the source.
>    d. The remaining VM state is moved with KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM
>       (SEV only today; generalized by the follow-up series) and the
>       destination VM is run as normal.
>
>    Linking does not revoke the source VM's access; the source simply
>    stops using the memory, so every private page keeps a single owner.
>
> 2. Sharing guest memory between non-confidential VMs. Both VMs bind the
>    same inode at the same time, each through its own file, and the
>    memory keeps its guest_memfd properties: neither VMM needs a
>    userspace mapping of it, and inode-level operations such as a hole
>    punch apply to every linked VM.
>
>    A related use raised in discussion is Nitro Enclaves-style memory
>    donation, where a guest gives part of its memory to a sibling VM on
>    the same host ("nesting without real nesting").
>

We discussed Fred's "aliased" attribute that was going to be passed to
guest_memfd through .get_pfn(). "aliased" was going to indicate that
this memory is shared between two users of the same memory range.

> Alternatives considered
> -----------------------
>
> [...snip...]
>
> * Keeping the memory and its attributes in a "memory provider" and
>   creating two independent guest_memfd instances on top of it. The
>   guest_memfd inode already plays that role today (page cache,
>   attributes and the list of files), so linking gets the same result
>   without a new abstraction. If guest_memfd grows a provider layer,
>   linking could be expressed on top of it.
>

Sean pointed out that we need to take into account that at some point
there CoCo protected memory might need sharing, where protected
indicates protected for a given guest (and let encryption be orthogonal
to protection).

Then, we'd need to know which struct kvm the memory belongs to, to
determine whether to share or not, and for that, guest_memfd would be
the natural choke point that understands memory, which kvm owns it, and
shared/private state, and hence memory sharing should be handled via
guest_memfd rather than directly through the provider.

>
>
> [...snip...]
>
