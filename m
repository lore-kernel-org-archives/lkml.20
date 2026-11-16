Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841345;
	b=46HEn8IAk9SKUqsQ4fQ62au18IlKZomBxHf84OlClHkB4S+IXKKD00lA57LRjH3Hsywf
	 9tpl4Qtn+y55dp2RWkhbyEDNz/Zc4SGiFCSXqwX2lV6wSsaQnCWMjOrpBc5g8ggx5YZzr
	 IjDT5sPy2keyhWsmtfm6/ylKczQqVMRemJlHEF0MRSOZAbpYzapfvzaI5Vv3rGKeU92PB
	 kXnt6ZSHV4C4GkMQDnkdU72Au2tg1m6MJP7aK7EWZFY+tWZ6+jsE0mvFcwVPSjmZ5iQH1
	 NyjToEe1oA73szYY3hSGcKB51si7ff+Xt/2SEsT5IVnKHnCFrzgLInFJ1DfJl4skxBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N21p8k+CduSxruihuSfvb91U5CN+g/FwS5B3MC7guXw=;
	b=tfZGOD5LYixpDsa0n1RXNDXvF+zArQtNWj2t9mzMQcBl0PgtEgzPuljrZBbyo3djNx05
	 11Cb8gxpTbNE6bQC8iC7xa2w1S6+Iebqesw7MOsYWGJHIO1cTjBJ9cqp/KRTaU57XHZMu
	 qvmSpWFKrvFU9ZqwnYTs5ZqsEZHGFflGZcHyITXijG5M/04ohI5PDPHbxxvUZFn1r1AwK
	 J5l0Lr63XCEyakdL4hblDQhotOJ7VhXtqrzNpbvZPwgd9TBb/x15AtKQqApX+k+I6UzpJ
	 PzviXgDzIKyfNZLgr4QsqS1ISt9C+izzk+p3mPXgoytgirzb7lg2FY6E6OCO4Vapa8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AKprLcnW;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8683606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8683606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AKprLcnW
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so37938325e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794841343; x=1795446143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N21p8k+CduSxruihuSfvb91U5CN+g/FwS5B3MC7guXw=;
        b=AKprLcnW/Vw0JBEGVtDSBHNkSuYiTwhekWo51MsaelVlg2ca/TKcyY7DbKK+aKmiFN
         ErmJMQmBgQnkFBE1tra+njmU4a8/BTbf4WNlXdtm6cL6/Lnmkhx4XQQENncfvcqgHUgv
         ITk8jT3qdnEHARDwEFOjsIMDDMgOWdOQ279O8cvzGPnJRQLqu9t/Eb3Ob5l1xbpPvHX2
         ahjjxusft8moSBk5iuM/yCBQ2L1rV4DYFUJ+6WiIjFqYttIXx0BnT5RwJ9D5hiPtaBJy
         05Tpt2HichRwP/z33xtKDYIwEupyQtxaZZ6cUtAY8uodN9v4tfv/IybYcFlOzqM8icrO
         lXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841343; x=1795446143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N21p8k+CduSxruihuSfvb91U5CN+g/FwS5B3MC7guXw=;
        b=IAGfmjwjBgKO1q3J0UZcP7xnvP0mGwIq3YwcBf4zUxCeHHpKNZecF8cee9e2tK1oVO
         El5adHKvF2rcHyPDqhpY2laoCYY8E5TOMaFOc3m3YrpGYg12pf6+t3X/0WLPZITPPD48
         17A2ILvlsVbjWm4u1oIF9Uu9hfBRIlQRp15Gt0U/5ovDSFqXVDJz6HyUhQDLt5yoqXl5
         MUXkRBeLXz26nEHyL4auuwOTXaLZs/2OT31fZNDF0cZfgv8t4QAaXTFvGX8bgYVAMXFw
         3g1gSKw8ho2EBguKjczc+dyTfW4ylGjm6vkp+RtWL9LWcDWR7zpHXfuRZJ3hEvn1vNkC
         89kQ==
X-Forwarded-Encrypted: i=1; AL+hErFOoFvRBKXLZfTcqt2lOuLj96uXeqzio//04sq+lSCZhFHV53rUJ9FPVf5Jl+WDxGwdyGsQrn0QcqgiQ/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xC/FTG6Ij8y9/ihlV6MF16gniHAxMwLZT+RJAd5+3AcFmBGcg
	4xIS9Qf3JPkGfmYKbgcdFRjmo5/S8l20GCJsAs1D/5rgcvkgjwQXSmNAzKsmSC6Efmg=
X-Gm-Gg: AYBFou0xSDtiK++5KQIDq6LkP0bYWj7/1Ljxd/u6/hNyU9Zau85aFvZGsblyxUYsVLg
	biXmm8UnmD9clGM1xj0Rtgx3l7sHAtHS+HXdo1INXGVLROfR9yNe3GRmGbPxiVmRmqF/YC6AbAi
	FxUkeTSzlb/OgnkuGcorSUHbFuUGrHIM0WHxteoDuU5wn7j1os55pjSEavSTYH8Ck0k+OHH/4AP
	mXr/7udyjvERmG8M17ZpNEHO27ZRxOX/uCLr0qgJi2NCJkpNYbGSR4tXjKShNtr/+C5IqqrVAnY
	2w1gJFBzA9qRhkTigTp105dxocAsIHT7fKY4gT1PYzoDG5n5Pkp65BvOtv/ch01J8edAvy64NfW
	+nZqOnPy0rRbOo6xsT69tL7JpJmxaT8wO5/Q+hEPNVEj+pZ/2rhNKyaA58bNBzl2b2DDzt69p6S
	Nw2GgUdzKVK8yftfZ9M107oiXAu47p/hNQ7QJ8YvcMuCRdUOW19kerHIV5Ijat5uFVSiaosRQBP
	p21r0aVYDvd463fWc8LDjnv63GGPMUbVGKr1iEi5PT80xu9Q0NUf2RUqOfWMwVD8Ab4Rv4sX7wE
	hekoJOgf6DmskryqxPvSYcxQ+U0OSVE=
X-Received: by 2002:a05:600c:8819:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4bb55a6ad4emr208585635e9.20.1794841343209;
        Mon, 16 Nov 2026 07:02:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm406661285e9.15.2026.11.16.07.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:02:22 -0800 (PST)
Date: Mon, 16 Nov 2026 16:02:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: jpoimboe@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
	song@kernel.org, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/9] livepatch: Add support for scoped atomic replace
Message-ID: <avsa_Fq32BH3pRpW@pathway.suse.cz>
References: <20261026133651.40061-1-laoar.shao@gmail.com>
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
In-Reply-To: <20261026133651.40061-1-laoar.shao@gmail.com>

On Mon 2026-10-26 21:36:42, Yafang Shao wrote:
> Atomic replacement is currently all-or-nothing: a livepatch with
> "replace" set either atomically replaces all previously installed
> livepatches, or - with "replace" disabled - it replaces none. There
> is no way to atomically replace only a selected set of livepatches
> while keeping the rest running untouched.
> 
> We previously proposed a BPF+livepatch method to enable rapid
> experimentation with new kernel features without interrupting production
> workloads:
> 
>   https://lore.kernel.org/live-patching/20260402092607.96430-1-laoar.shao@gmail.com/
> 
> In the resulting discussion, Song and Petr suggested that it should be
> possible to selectively replace or skip individual livepatches.
> 
> This patchset introduces a more flexible model using two new fields in
> struct klp_patch:
> 
> - provides: an unsigned int id identifying the replacement scope of
>   the livepatch. Livepatches that share the same provides id replace
>   each other, so at most one livepatch of each provides id can be
>   enabled at a time. By default (provides=0), every livepatch that
>   does not declare an explicit provides id belongs to the same scope:
>   loading a new provides=0 livepatch atomically replaces the
>   previously enabled one.
> 
> - obsoletes: an optional array of unsigned int ids specifying
>   additional provides ids to be replaced. This allows a new patch
>   to explicitly obsolete patches from different scopes.
> 
> A new livepatch atomically replaces any existing livepatch that
> satisfies either of the following conditions:
> 
>   1. it has the same provides id as the new patch,
>   2. its provides id is listed in the new patch's obsoletes list.
> 
> A new livepatch that does not replace an existing one can coexist
> with it. In this case, the two livepatches must not modify the same
> function, or use the state with the same id. Any attempt to load an
> incompatible livepatch will be rejected by the kernel.
> 
> Previously, setting 'replace' to 0 was the only way to keep
> certain livepatches persistent on the system, forcing developers to
> disable atomic replacement entirely. With the introduction of provides
> and obsoletes, developers now have a selective option to keep specific
> livepatches persistent while maintaining atomic replacement capabilities
> elsewhere.
> 
> IMPORTANT:
> - this design deprecates the traditional non-atomic-replace model.
> - the behavior of replacing all non-atomic-replace livepatches with a
>   single atomic-replace livepatch is also deprecated.
> 
> The new "provides" and "obsoletes" attributes are exposed through
> sysfs and the kselftests cover the replacement and coexistence
> semantics described above.
> 
> At present, KLP state, shadow variables, and callbacks are not
> integrated with the new provides/obsoletes mechanism in this patchset.
> Support for these features is deferred until Petr's klp-state-transfer
> infrastructure is completed and merged:
> 
>   https://github.com/pmladek/linux/tree/klp-state-transfer-v1-iter12
> 
> It is based on livepatching tree's for-next branch.

JFYI, the patchset has been committed into livepatching.git,
branch for-7.5/scoped-atomic-replace.

Note that I have fixed the subject of the 6th patch as
suggested by Josh, see
https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git/log/?h=for-7.5/scoped-atomic-replace

Best Regards,
Petr

