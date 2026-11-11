Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794422911;
	b=iqsqJ8L/Ef4PbfEle72gGluy94u98Mg0LA2K6bw+oUC9vID7hJmTamR3ZTBQinE6b38o
	 FDp1iuUb6Zij4ufbtvbBeUbJ0B89Ca7mmhv+moOSIh4pvIB1CwqfkZ+U5HeR41i2kHM+8
	 vNSkbiFleLWyQwBRItoe2/x+IK/+PQ2wQXZAVnu4INCUzeKr90svhG0RVzpSzPIhD0GiI
	 A0kHdqcyjW+Y6ThIDJBLD6IDPlcq4GYr/SYmOXKzm+9JS7CUhjlBn3exXKMw1zvH7MAQX
	 yvOhVojcRUzfOmjS/pVBrRaZbDCaMY2I4wANQLqZ+XcK1kL7u4+8EO1Azcbek8aB4GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
	b=b2bCjisoIBLCfsRSNrS70Ms+HMnEhXZUXwT3ZEB1aNJgEHKiOl0HbuKC3P3JxmiQY4oc
	 EoinmHjLRP1Z4n4zCdfrqoAE56e6WJetiLFJLF+XBQrsmMzQaSnrVBGLWoxodDQNIZSl1
	 bSug9uOTnMlW0wJdssOuEQLgOefex6dvOgYKAwwIY3Ybfesbq2krMDwmA8R3LOCvI1Zg+
	 ojJk4guT+aoQ+liujEcw9SKA/VOa6ytPzuihmS+dUyGf7/NrWzLRY47kUedjYNnZ9IQ4t
	 NIKoE33BuKrouNmmzP6ivV9e+5p9BIQ07UMCmps7vZM80g2LPacYY1k4Spei+3WpUoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQvGP9hf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5574A606A880
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5574A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQvGP9hf
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37123334649so87443eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794422910; cv=none;
        d=google.com; s=arc-20260327;
        b=PKYu7RDfQlWyFTmUoB96ZUnSotYz7SfBGBcAfFeDdOKKWzVf2WBTI0bcHH+RcGJS9O
         5fOVz521PSnRW5/UNBVPsI5WOkVvlcWoukDF+2ZRzBL1IOF8QB8gxtIGgkpmH/tcJb1d
         Hu7figZiCmonLeSTar+IgFlg1n8Yao+XAuzTCLBX3ig3VP68jl5BoIpktxfHdgmqBvVx
         T/ewR5/43Iu66OFq2yKbNaTC2lpM81kqn+r/56G4jH6kJGJ+cWzR4KsDLgz5yOkVQ+EX
         3jf2o/WrTfDO/m/X72FxdIcDW6AzLmi0IU7YjVFNDftMaACTAtMPJiCpR4bFkII5rUCY
         cqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        fh=Bdu/bCHu/rde9vXmccjOFXCxRp1aCbayEyppsOUl51M=;
        b=d++beXdl+WUCGtKaqMalsyOmANQbbYTMBwDNUU1BkXEoxFTP8+ZFor4ZtOwTEBC0mK
         5zi/WVZSjOsksclnTPHdn+KNMh1cIIRmgRAO1rXM3eAs3c2LIyYWlhG7vHR+A/es40jR
         Yw+I/grX8oUpYJlZCQuHILjwrRS04XTjv54eUlhxOzT/lnABpLprYw3lAVCbmnSDMbol
         lZHAo/412jrApPE7TfBILcgtXkAwb4gn0LYUm4QcIKMpYzY1AZr7tc8xrX6DtDuddAIZ
         mtE130fy1X4Qzj4S1joglFOl/kvuuAYKJyySBm/iUsiVGizWC9kK1PK/jUd1M9KG8s2W
         tEGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794422910; x=1795027710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        b=PQvGP9hfxyl7gyWzaV5E6lfNLMerBHS1TFQeqNTFlBRgy1u2mHjTPPrcCd91suTPNw
         q6Uaf4dfQ10dB87Jez9cMUGPN2gIfnP8MYt4fvSB02tD98zGsncssuArw8oLO8qQtcLp
         44smcorCOoOla3ApsviUxCt5qQlre1HcPD1CCXW1rVJH/qsAwOgwDnYiSivdmVp0xx7L
         wBCpz75zey138eMCPfYNHtAFbF55MWh3FJ9DeyUoLw64eufFG/QR3X/fHQG3aoNdfuHi
         X5IJjIOOyJP1lrz7jfv+HjWLvw4QJiYpCd+oQQEZvYr1Ngdvdq6KHAniGxemBtyICNhx
         xxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422910; x=1795027710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xlc03iFGV9jOFXUn7/nevfuevA4V1xlT8nxZ6nmNEW4=;
        b=DVU4HsdtVg2sFELnORfKBVwQkITxRDwu3rBFltj0j60dbHD0J/u5B+oT22Y7IZyJIO
         /mmeu6euTgAMICv8SAcyqav60gHYSCqys79eCZ0FyBwuXD28QCA01q5wCCXOPfF6kZic
         PUaU72BSd3YInGoTbyrpXj0QP7ewt+woY57VMLB3oNgkK3uC15O0gynkIHm660xQaQgY
         qZWPgL4X8314LZ9GxHWnzQQfmXDSptqtJxfqf51xNjJQxVnwfFH99zjsBP234eb4ujlW
         cBLELQ4MdiPY1uzFKC8vL/mR2bsJm1RNHXu8TSjFlpGR6Rpoti5+j3R0aC0B6a5H6dNf
         yhuQ==
X-Forwarded-Encrypted: i=1; AL+hErGOXV0Y7e2NQnbFee4LM88gXDvkQBBC/2iIVK3ONCeIxYoMHVAD03MJEtpPPbaiVwzH02/KwCP2AYnewcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ThnLXFqhDIT0uf+Jlrm8SrwuWDGQSqaV7e2ATBGTz0uQ58YOD
	q6HJ7KMgXgiwHFZQxWG6o0yp3hJ/Id9Wlrb2t9pzq0dZNB3gFtqBMPijeYZh3kwORNnZLW54OBW
	mEg6uukYK9Y9yT1Srs5IBhKMGqObI+Cw=
X-Gm-Gg: AYBFou3aYebNHMM2j6nbFcqRriKOEf24hOaZVejDeGbBVYustJ+yDV3+18AKbZJge3G
	2o6qlVd9DDrx0mFfa42ta81ZpO69xTKVXC98ct2d9Ri9J7QN4YYtF6eaBO+pulsFx80etb6+/b7
	Sj0+R0hbGYwzp3fBSI0wo//b78R9Q7MisQt4duq9hEVawEo059k4TjQe124nDoF3HFS192fK69F
	3F14mGE6p3S+XRMbRWHYp4s9Ft4oePTMn2FEf0gd9lrcfMRNtbbGWEKlJhUqEg75wNjJV4zLi+8
	zQesR+ljlnJYT41qFkATmoXTZsohFCQuLv11yROaJIg+TD8QgvndjdsEzK5tH0cLBHLAADYULW1
	aAYuLBnLApSgQr4SYMVQSSTHHKQCcwdxoQE8e2QKs+o9nfi1gvLs190xtO6RIvCtiRmI3P451QZ
	tQ3wY3JiU4tFj7Y/vPDA1CcOy4qhrSaLhmUTe8EVKbxYu4kjlr0llZcpXGyzxefhBYE38WriwCR
	HEuuO8WVmwAUETL0F3EizWiKB6NjplX5bM=
X-Received: by 2002:a05:693c:26c5:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-3768460b9dbmr4877420eec.1.1794422910327; Wed, 11 Nov 2026
 10:48:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031030807.4101384-1-jenhaochen@google.com>
In-Reply-To: <20261031030807.4101384-1-jenhaochen@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Nov 2026 19:48:17 +0100
X-Gm-Features: AclHuK9PxmaMrHpe5K4M3MU9aV3mfSN5iKc2YgWLgeAIQXIiJu5uOX8RyqAehXg
Message-ID: <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
To: Jenhao Chen <jenhaochen@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:08=E2=80=AFAM Jenhao Chen <jenhaochen@google.com>=
 wrote:
>
> Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
> and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
> post-llvm-link $(CC) invocation in scripts/Makefile.build and
> rust/Makefile.

This sounds reasonable, but my LLM spotted that Clang will run
`AddDiscriminatorsPass`  again, i.e. on the optimized bitcode that
`rustc` produced. So the profile ends up indexed by Clang's renumbered
discriminators, and then the build that uses the profile will not find
a match for some code (depending on inlining decisions), i.e. that
part of the profile is silently dropped.

It proposes `-mllvm -no-discriminators` in
`CC_FLAGS_RUST_INLINE_HELPERS` so that Clang doesn't add them, i.e.
using the `rustc` ones.

Rong, Han: is that expected?

Cheers,
Miguel
