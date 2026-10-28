Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166743;
	b=fpl9+ueK58cs/Af51KtUQbrC6efT+of8iW75FBMXowhQTChokwWSwla+Qwfbjo21oEDj
	 dSPbvuBVEdSp2ZviBefovf2wlFBQ1vjMLq4ZBYzE1qe6TI10/e+0tq5RJH1qd8st5cl1C
	 tfZQ94OojJq485LSh23QIa7faQajh6gyJLBHoDibdGivcjwMIKxJbz+gkxC/0wNq8npQ2
	 Hobgh90BrjDn7UInvWyEp20fmAU9hyPULbthpDe3imbNuLceMGd427W5o1g/wCLHQnNbo
	 pdtsHin2dymlAazMit97Q8S0eia6AgbhjlA+l+w2K94R3nkCCvNX5rJsRBUjXw6tm7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
	b=Z/Yu67XRXMVpybKYHu7Qh58keBrRbT73dlWfm/4PucwL/TlMlrByKeoBiopE3406+tbf
	 phtJ5i8HpxUtszX9H8+1dk62InZHSxDw/7dw+JRnFKD/tf8htkutZXGhWbrMl5TN5NlUL
	 YX/21+5nY3qpGEjeB9wnaxXTOs0pO6eqGDo4oBGhBPE9bVz2pNkBMgrLSZJbSVFnbFxLR
	 6G/XhX1u4LJA2r5mPKFZyzRYidOsliK/c9X6LKXc2csH+pXRQHHyqCFdxuFjcvJmLRRTP
	 kCkO/CGbKYM4kj0sUIhrxeKB2h1BCqJYEU+9KAmM3NoIYmg7EvM5FD5yN3Qm7jFrWKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=u1CUAc5U;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A5E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=u1CUAc5U
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so353343b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793166742; x=1793771542; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
        b=u1CUAc5UGEIg8w651QAnSj1ilJ1Hp07nRBlYJYLip7lca9dtV+G4XIVLxIkkYk+9He
         Gi0KpLWies9ZXilvLmEHfJEIcvI8kzJ1Wyu473aUFgZ+EPn9NADS0gpTZFOInL5tm9Nq
         7qBSbt2D7PxHKFRNJ0ExDlyKLPKzHEsOpZICg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166742; x=1793771542;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0+YQ8IhrloxYZmXJNyf64tQivuQ6Pn/Dp36CBxwNv4=;
        b=PtG/p34wRvg5KYrmxAMIuNxKdpbn/XLUYka2XEbl2pEY26pTJgEyE3q+KfziLCsFA7
         daNlWa0HuAc8tqdtDtrn8itNGxK/sMKXfcmyGnaB3GZuSYIVwpZeLI30uhI4OlBTXbc/
         iDc4m18n2jDNL5Mhq15PTs6IutQgS4Go20q+zSUpZ+WJIetRT0SMtFIxVaG8JK8v2B3y
         lvfzvGrAllRwQJ8EmgE2C9jXTvptq/UtFj0i4CSQa7mI6xk2SoviAHle5iPFqyCD0we1
         cE3oLspqW9pmtWKbIcIV3pNgEtB8HhaqvB6V7ygYkptCVryEvgsn8fGKOwE7HzbQehnr
         EHkA==
X-Forwarded-Encrypted: i=1; AKwUvBxNMf8BLw2ovl8PmwMyg8Sstde8LhCSGENLcQR+b+CFiRodg6+azjVtE6wCe8+mDDiP0oIHk5+c0xcVlW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZOvWuSuUmrAbM6IQnnt9q+Y6CJmuj3Rqdtjh8Uf6ztnG6EUpf
	aEJpuPDu1SL7eWJfHXCp+8WDQbyanYt5j2tSA2mTp/yU6eQBKxuwtCjk9HdUb0F2XbQ=
X-Gm-Gg: AYBFou0u90ABKrd2UY3nzCq6urenMHJ0XpkexCYC6JvoxpBBoiApqTLbM6OvtlFuks3
	RWCf6YC3JVx4WmqrfM9qpzEs5dvD3jYXQ1NfeHhlmVFSh9ZDTh6ih79kwITgefnle5B/GAbrnHa
	Lg/G8Iz2vIVYa4vrJ3OocD7ggRfJ+SbWby5F228D6wz7L+F5aIUk/RZqAE/K7lcp1I9/bkP/9iN
	H1R8JsqXqhQlbqV5Xzkj/eBbb5EW5nlz4KJf8mToa5TJQuwX+TOepM082paTfQhl51OcNZaaqpu
	XuaeAczgL+Y2yjmB/EMDokrWvXyb9vNW7yHclSWc1qyYjtk2oe6WRxjsprm+GH0D1AzTM0EFHMf
	CDIPn/ydbJooDPH77ulQQhkrqvRoIlVJYDRRYTnsUgmULnijuHfq4KFa6+OuKRIaRd6Ow1KgBkX
	sgO6et/XlIi7JZe1W7zOn0maTNo5Y/O+rrx/tuNJkhwlAJ7pwjpTLlWldd+w7vIMiJh2YKcHesg
	V5N6A14TeTVW76UOiRR2eRUuAbXzIMpCiRJv/P7Y3Gi6Rd+wHVsNMQLQ6X3iTJuSV6E+Si0/1Iq
	FS2Z2RIOBukHe0HM8sEyGooCe5CqRMJuAUzV3/bm0Xzs60TlwZEzXOeka1zH0PLZuQzvAScsRMS
	yi/JpXqo8RuG2urFEprcMW/5wR8hYm5OY2naN0xzTUrmcCvzeh5odFFX46OtU3DSDzIN0PJt+
X-Received: by 2002:a05:6a00:4b4f:b0:88d:20ff:15c9 with SMTP id d2e1a72fcca58-8a6e7acb277mr1168038b3a.17.1793166741947;
        Tue, 27 Oct 2026 22:52:21 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cfc785sm695363b3a.38.2026.10.27.22.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:52:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:52:18 +0800
From: Chris Down <chris@chrisdown.name>
To: Jeff Xu <jeffxu@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] mseal sysmap: Add mseal_system_mappings= boot
 parameter
Message-ID: <auGNkhSHpBRd2U_5@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
 <auCxjbvY3qPv1sV6@gremlin>
 <auDTMb6WMFUpxeZy@chrisdown.name>
 <auDTptDQsB4xBcz7@gremlin>
 <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <18e2972cb8520c2e.3137322e32382e342e3434.279dd1.0000sendgmr@google.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Jeff,

Thanks for the review!

Jeff Xu writes:
>Could we please keep the test coverage for the unsealed [vdso] case and
>avoid unconditionally skipping whenever [vdso] is unsealed?
>
>There are two regressions I'd love for us to still be able to catch:
>
>1. Kernel or config regressions when sealing is expected to be on:

Yeah agreed. With the cleanup it matters even more I think because when sealing 
is set in one place the most likely regression is probably one that unseals 
everything at once.

>2. Regressions in the new `no_mseal_sys_mappings` boot parameter itself:

In v2 I can check /proc/cmdline for no_mseal_sys_mappings to do that.

Lorenzo, I think that also may inform your question about whether checking for 
the disabled case is redundant, right?

>   When booted with `no_mseal_sys_mappings` (or when unsealed), running
>   the assertions in Patch 3 (verifying system mappings have no `sl` flag
>   and that `munmap()` / `mremap()` -- and ideally `mprotect(PROT_READ |
>   PROT_WRITE)` -- on [vdso] succeed) directly verifies that the boot
>   parameter works and doesn't regress.

Sounds good.

>  or keep strict failure as an option (e.g. `./sysmap_is_sealed` fails if
>  unsealed without the boot param, while `run_vmtests.sh` passes a flag
>  like `--allow-disabled` when `CONFIG_MSEAL_SYSTEM_MAPPINGS` may not be
>  enabled), so CI environments that expect sealing still catch a broken
>  seal.

I like this and I think we can do it without adding some of the complexity that 
Lorenzo was not so happy about:

- Have check_sealed skip as usual when [vdso] isn't sealed and param is not set
- A new test, say expect_sealed, fails in the same case
- run_vmtests runs with -T expect_sealed when CONFIG_MSEAL_SYSTEM_MAPPINGS=y

That should be pretty minimal. Lorenzo, Jeff, how does that sound?
