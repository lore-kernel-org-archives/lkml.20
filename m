Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591329;
	b=wN4ch0rb1BAtJZRsidEDxZ1nGhhljKQcP64kO6qACv98u6eVmoymk/BkdFPgpOlboPk3
	 DIIdB/k1LmEtdUfKYLiA9QLKCrxR1qNf6HR6gGjVFL0VLQC5HcXvXaEOYkraDtMb2DVru
	 Gc+ZRMyVbumQ/pdswoNffom3A0pPbB9XX60IgLXrOkhIzO0LyWIBV42JhXAE17Okw7AH3
	 brUIOjt6HGTNrHZH4H2tg1CPnIpY/ZiD55BqgQmcL9GfFC2Zs+OwlKtQxsEut64xlxA4d
	 celpRt1V5zdEx7WUfr7KqefIXEaDvZS57/58jK1L2V8uWbmiUNih+EUYqy5dSmo5c3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=L0Mb1cUmBaGcuD7f8HqUf3sbOqkGvEZn1qO7O09574g=;
	b=VsZekAqVUrQXqGWLnxiEjwrNzThRUtVSbEbUcCcjjMhwaGKSt2eAwIqiqyJUJSfY3wox
	 9vQO3jZhOmuWMAMfD0mOFZhm3aSvDIEa9zd5Xv6aRKkYaZF0v3QgVHVJy/sCwXDrNm/zG
	 EPyjtmkuztMA4jbYD5yPfL11NS/8ZwyIOC8TDWejdB0azTefMZOMdoHrJbUmQmTJ8Ej7b
	 LNiC5JDI2h/JQ1uZrTg84hBf8XHPLkW3+Si3p7cxIYajfE58kF1x6fqwxD9ovmmnBK61r
	 OH86LuUWUZzh0LsU/T9QHXpJ4W1iFgSFb+ZJY8GfkpWSCAljwQfvu30wLE4pVM2I2Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcdD4k6a;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCCE60A6F5B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCCE60A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcdD4k6a
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1628810a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591328; x=1795196128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L0Mb1cUmBaGcuD7f8HqUf3sbOqkGvEZn1qO7O09574g=;
        b=JcdD4k6akF4XtaIk3WQ3KS5Wt7v7EXn9H2QdsGW7uDkCbY6aF0sif2TEOgE9JIiYQE
         +YN0rIB2UoUmzCzKvRELiu7rro4mQFjzwJKm1kUpv43rpgKCyLe4mvrJ2JOpK5F9GPnf
         QiDxSCFtQ0H6k+8DzJL3WqYlzZvuImpM7BCyeIPq0coBYutGDb3zT1W+XGiT3hRxGJ6i
         SXTUvwyusOUZNb8mYh8dA0fGNHxBMLTjv8551MpYmvfFVGw9dnSp/kCR7dyZ42l6nA2O
         p9rJcDy2BiS1lUcQ4hrsjSGsB2VSIhk3DKM2mXQ623XJPW3BZ64EDDaNjtMu17n8WTbY
         WoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591328; x=1795196128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0Mb1cUmBaGcuD7f8HqUf3sbOqkGvEZn1qO7O09574g=;
        b=uTUvusZK+Ppg2Iw6VFrYH6zRJL027oMM9VH6HM5evHQYJqbK8lCsHWPEPEC2gCiIvY
         RdiuHnM8nmM7w/lcuGMXYUT6fDcd9skDlq5ERhVSQq2xiUUsfuLje53hlUWEVoOdHmDe
         poWAqpi2pYpAAjzMPvxARvdMSEiMu8p70HQLgoyQ2S6rAB5tlfpenS3PACM9JY9Dfs22
         kiEauJO+gp0sj0skUk2HlRWTv5sYw6BxjCuF0V3/R+KMBdpNxFV0Eh1Fl8u+qmSKlRXl
         G25nVQrKh5fFs6101icIteipyJKBsYdtbcsJmVb84Wo/WxaCsdGHHTaVut2ERFZ0A+LT
         EzUA==
X-Forwarded-Encrypted: i=1; AL+hErEMtogO0Wj/HjYemEZHY1VaHXaY9z/+pTr5wCS6us0oSjERPeE3ARNjtwofs+7pMLNCEInXRxHo2qEuVOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QhQ6HFiuOy/icjTEfQAhA9f+oL/HlnZRoWYxFUY1652imMdui
	f/fZtvhK+DRUFpufOpkkZqw5tPqVqCelhJRUyIIePXsQX/h3yXa0J+dR
X-Gm-Gg: AYBFou3MDfbwDgrBgcPCuQRTabQqJeObycEmn40nIRyeOPtmhL07iID/vKqTxZEDHyK
	NoIzeRB5cuCqn05v2wRPImbLD3LTqc+M1jzCqJumSyaqM8jsbe4TUzdAoGB/REZnaK0XzSOHISE
	6w39vbGgZkWu8U/3ULSTWrEam/Zey9afx+lVmCMEJ4D4UzB0O4E4e4zgmrTSFTW+vYObZ6CbBEq
	BCCmGu9PLqH+6PwZQ0RUd8gOTsWJ2P7URZBc2XurjWd4+i10lmE+p66Ud6wleB7spH+59BAsyGI
	/FivqKbPmRxHt2IE2av7WjFBVhH7aRP17vPHbGR2S5aKGiu94APaklF1h51mCy6DBXs8bjnzirb
	JmRkQ5ARmJfsigV5Hf/mnUUYZlvax8xoIBlrW2x+qIoZ/WodCmfPw1fgMYd+IObCBQ8M/+rtAOI
	6lb4cZG4OzmZpleUmRY7x3AqMwN+RU71TNerl9eUSo1LWGR/NNchwTSAYPXE0Jou6vB8Y0xkgtP
	QGncMZwsMytBlnpENmu2pmyWQqKV6GmIEU0CO8qdAyd9Cqbz3yiCd4rT7MwoP3wECmPcrZdn5Wh
	Jo0mqyGYod/twaMhjKawGGIYduBfy/iUlt+MQIFBsespE13JU+Ue4kVLY9c=
X-Received: by 2002:a17:90b:4ccc:b0:3b0:97b8:d6b7 with SMTP id 98e67ed59e1d1-3b1b0cc971fmr2608365a91.42.1794591327813;
        Fri, 13 Nov 2026 09:35:27 -0800 (PST)
Received: from google.com (61-230-1-66.dynamic-ip.hinet.net. [61.230.1.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm10485256a91.16.2026.11.13.09.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:35:27 -0800 (PST)
Date: Sat, 14 Nov 2026 01:35:20 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: Wang YanQing <udknight@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Yonghong Song <yonghong.song@linux.dev>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	"H. Peter Anvin" <hpa@zytor.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v2 0/2] bpf, x86: Fix i386 JIT signed ALU32 DIV/MOD
 and MOVSX
Message-ID: <avdKWKhsV6dcZ02W@google.com>
References: <20261113-i386_bpf_jit_wrong_code_20261028-v2-0-1dd0b03072a3@gmail.com>
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
In-Reply-To: <20261113-i386_bpf_jit_wrong_code_20261028-v2-0-1dd0b03072a3@gmail.com>

On Fri, Nov 13, 2026 at 12:23:41PM -0500, Nicholas Dudar wrote:
> The i386 JIT accepts signed ALU32 DIV/MOD and register MOVSX, but
> ignores the offset that selects them and emits an unsigned div and a
> plain move. The results differ from RFC9669 and the interpreter, and a
> verifier-accepted program can use values outside the range proved by
> the verifier. In i386 VM tests, three verifier-accepted programs
> supplied helper lengths beyond the verifier's bounds before these
> fixes, and the helper wrote that many bytes. With the fixes the lengths
> stayed within the bounds. The test programs are not included here and
> are available to maintainers on request.
> 
> The series is meant as a minimal fix that closes this gap between the
> verifier and the JIT. It makes the two instructions the JIT already
> accepts produce the values the verifier assumes and adds no new
> instruction support.
> 
> Tested on i386 under KVM. vmtest.sh has no i386 target and test_progs
> does not build in full as a 32-bit binary, so it was built with
> jit_insns, verifier_sdiv and verifier_movsx only, with a strtol() to
> strtoll() change in test_loader.c. The commands and output are in the
> patches. The six jit_insns subtests that still fail (arena_zero_off,
> cast_to_user, staggered_jumps, acq_rel, probe_mem, shift_counts) fail
> without the series as well.
> 
> On the unpatched kernel the unprivileged subtest "MOV32SX, S8,
> range_check" hangs in the kernel: the wrong value takes a branch the
> verifier proved dead, which for unprivileged programs is a jump to
> itself. The unprivileged verifier_movsx subtests were therefore run
> with both patches only. There it passes, and two others differ from the
> expected xlated text by an additional zero extension on i386.
> 
> Claude Mythos 5.2 assisted with this patch series.
> 
> v1 -> v2:
>   - Dropped MEMSX, 32-bit-offset unconditional jumps, unconditional
>     byte swaps and the load-emitter refactor
>   - Added the signed DIV/MOD change, which was posted on its own [1]
>     and is superseded by this series; the code is unchanged
>   - Sent as fixes for bpf with Fixes tags instead of new support for
>     bpf-next, since the JIT already accepts both instructions and
>     miscompiles them
>   - Tested with jit_insns and the verifier tests of test_progs
> 
> [1] https://lore.kernel.org/bpf/20260731002950.179573-1-main.kalliope@gmail.com/
> 
> v1: https://lore.kernel.org/bpf/20260915021338.1520964-1-main.kalliope@gmail.com/
> ---
> Nicholas Dudar (2):
>       bpf, x86: Fix signed division and modulo in the i386 JIT
>       bpf, x86: Fix sign-extension moves in the i386 JIT
> 
>  arch/x86/net/bpf_jit_comp32.c | 76 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 68 insertions(+), 8 deletions(-)

IIRC Alexei mentioned previously that he didn't think anyone still
cared about i386 JIT, so the i386 JIT patches were not merged?
Now we are seeing more i386 JIT patches. If we really think no one
cares about this platform anymore, maybe we should remove it to avoid
receiving more patches that we don't plan to merge?

Regards,
Kuan-Wei

> ---
> base-commit: b7cc45994c3f9c5f24397fcc0251f6c23bff9bd8
> change-id: 20261112-i386_bpf_jit_wrong_code_20261028-7246b0231fce
> 
> Best regards,
> --  
> Nicholas Dudar <main.kalliope@gmail.com>
> 
