Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565640;
	b=wcYsY9zdMc6+31ni2M9gsZSpS73haqvkbPSvUvTUfNRPy9pG19+P6ppmP/rgrmGiN5AY
	 veW3RJO1dixGVR5CBDda704zRtBo1XNV7D+aZOwzYkjCVLCxbVVfBkhRgUA2Qimw4qnoN
	 Uc22Y6azwca2gAiugDjajouBijzvOPu1+JeslnutgRGV1itHy6r4f4p9qCXDzIda2IxLe
	 1Qn01WdtXd9wcSJ9HBNgbhPD/2fL3QZXJpkNEapzldRvl2JOrbtJKWqp1eMRPBf8ZuP8N
	 ZYuFbUXETa2XZQt7y8M9D/n6i3oONWBKhMVpiDazmTZH2HyJP/ivV8OaTPOT971ZKDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lSjbfvSlvG6pMmE/hK/G+D9MbRxQjPsHAPkNYX4zGgE=;
	b=RoQglijYtkXovKy7M4HlPH3t5yiofyZzXH0rooCoc2VCpmknvo4vo0hzx8SFKj+hZxHo
	 3x80iMuLbp6l0SVAaDU4GnlmM9iNQOloZoauPio+Rc6qkdFMAVJzGPpIsI8WAHWKeAYIo
	 IcsgcQ5BH90/MHavM7tzS9DX/S7z+QyDTUQlCHQJBCZGld/+NOPNRxYuOCoOtfm7fSetO
	 7M4SnFqSw0w+mrHSQvywUoWNPyN1wpnB2Bj4Ro8q7Ajd/uCcun9caFB9m3HmGoT/lHUKx
	 RGkkUc68ypKMvFUOj7Au6Wh7erxifaXWCUGvHypumpinv8GnmmGsHRoTd2eHJMyP6Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grsecurity.net;
	spf=pass smtp.mailfrom=opensrcsec.com;
	dkim=pass header.d=grsecurity.net header.i=@grsecurity.net header.a=rsa-sha256 header.s=grsec header.b=qB4xe5Oi;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADA606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2ADA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grsecurity.net header.i=@grsecurity.net header.a=rsa-sha256 header.s=grsec header.b=qB4xe5Oi
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so1666275e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1792565638; x=1793170438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSjbfvSlvG6pMmE/hK/G+D9MbRxQjPsHAPkNYX4zGgE=;
        b=qB4xe5Oi639BB477DNXaZhyHhYJPif8sdb6SO+yxKZAuQP9MA4gDFAP6P6+aqjeWHH
         bpNY/06qJHTjXaojNKxHUqeHmIQnM8E0eGqjsTVj5y8v8rfOzvAUWmqL9PQXypN24N1H
         RUPaWziXGRo+PO6CbBeD1q0ePMmQdCE7a0umMaO/f1ntrK74dPh3EsUl72+CtSaR3z1H
         zmPot14vMRmNXultyiEommWEDhP+wycOw0BbuxoeirO4tuSuqf9H4GZz2qnJ/jYVoIl5
         ya0MdImdE3g1xMBDaxxiP/9Yf7KjJ+w1WDOzEPlOEm6sk52yATUsfTl7PW97lTiSwVqr
         I6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565638; x=1793170438;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSjbfvSlvG6pMmE/hK/G+D9MbRxQjPsHAPkNYX4zGgE=;
        b=AIX8L2MACRjU/6EuI91QUujreC4IDRZH5KXMgzRFj+f6LbfVn9lQSFxl4xwhdkbTr5
         29OE7cBNWmacJQ+0sbnaYtLZXeSPt7fHcBAr/01azGN64OvHSKVvZd3qkWk3khkSDHfL
         5/5SytExO8yf8Hs2sh5cXuZxX5fL1mdh9+oCbkpPBSFepxOz8Qax/NaoK310hgxMGDNl
         ecOzzVYj4yl+/CinUGXgDQLS1wktagKm3mLfUnmOShx9jWpltlL1agVXv/cKWFm9KPaR
         qM71J7Th/88CTQHl1kg/1Sk1Z67R693TmJM3vD9qCdn5Z/i7pu43kKVSs/iyhqUIWs0r
         5J0Q==
X-Gm-Message-State: AFq9FYK5lyc0w/0+zusKeJD1E8s0Jw0PL0T3URy1S0wOP4NG5CtVIpJp
	Dem8H6c1vImBsZuhDVc35kK2kwW3xv0fCcSyosuO/1EFNEhgTpaP69mBJMCbd256vJg=
X-Gm-Gg: AYBFou1iI5Gco4Le21f+fjEyoLmTTuxK0bzaoUPNWNF+JOms5QenEsQdSvXd/07Xm9E
	FDwbZ3BPsk3EGqL8mKXLX1NT7mvcFSy5Pf4XCqORRQJfZzRcCPQDrMOMTvwBPehGmWnEr09pvH5
	D2pXrPDLXt36KNfVDMsWk376+wbiGyXn09hDNLxT8LDBDTy8YFdJc4UV+F5Js3cM26rm1aappGo
	vLx4EI0ZKS2f1BcUt1VsaPJKX+UNEdopvXiboQjY33xgm+gknVGY+djgftQ39MAHslRICiR+N35
	jQ6qT2wv+pKaVVQnm8w3gaIUXWnakKfAooQE6JUO7KEnOFTMgRgdr/37LhVrCimLps6p+zfNCsP
	V0TXsVgWo+Xfbdi7EssKTA/zLqHgGaZCPh4BJcyo1966XTjSdhlG2gr6DuJUPV+sXpKD1Hnupqp
	QdfdejR8Tjozt27TMaThhN2bXg6uQ4+BbxlEj0PAl3jNk/gxXtvxl5wLJXNP6Sy4efKG4d/XmWw
	ZxCvtlf/DrRS5o9SjWpt3aKG7eLOyS0ua08MnIflniL3GKyJoDDa9XodLE/eKMk5weVnoYKMNK9
	F/KHjgkqmm4CAPx+RbpcxALXjqp7hsAbEieIStKYohEN+li6jPzKbXste7imPAnHhDO7Nbi+7yN
	4Jq3tWa9855Sy
X-Received: by 2002:a05:600c:3b98:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a1fd72aabbmr22708445e9.0.1792565637378;
        Tue, 20 Oct 2026 23:53:57 -0700 (PDT)
Received: from ?IPV6:2003:fa:af11:b900:8855:f04:e797:81cf? (p200300faaf11b90088550f04e79781cf.dip0.t-ipconnect.de. [2003:fa:af11:b900:8855:f04:e797:81cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3597sm127838305e9.2.2026.10.20.23.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:53:57 -0700 (PDT)
Message-ID: <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>
Date: Wed, 21 Oct 2026 08:53:56 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: prevent building single targets twice
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20260923123936.2227924-1-minipli@grsecurity.net>
Content-Language: en-US, de-DE
From: Mathias Krause <minipli@grsecurity.net>
Autocrypt: addr=minipli@grsecurity.net; keydata=
 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
 RzDVkdgPJkL/NFTKZHo5foFXNi89kA==
In-Reply-To: <20260923123936.2227924-1-minipli@grsecurity.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.26 14:39, Mathias Krause wrote:
> When building individual targets via 'make path/to/target.o', target.o
> may be build multiple times concurrently, leading to build errors like
> below:
> 
> $ make O=~/O/vanilla-7.1/ -j$(nproc) arch/x86/pci/intel_mid.o
> make[1]: Entering directory '/scratch/minipli/obj/vanilla-7.1'
>   DESCEND objtool
>   DESCEND bpf/resolve_btfids
>   CC      arch/x86/pci/intel_mid.o
>   CC      arch/x86/pci/intel_mid.o
> fixdep: error opening file: arch/x86/pci/.intel_mid.o.d: No such file or directory
> make[4]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:290: arch/x86/pci/intel_mid.o] Error 2
> make[4]: *** Deleting file 'arch/x86/pci/intel_mid.o'
> make[3]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:551: arch/x86] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [/scratch/minipli/src/linux/Makefile:2229: .] Error 2
> make[1]: *** [/scratch/minipli/src/linux/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/scratch/minipli/obj/vanilla-7.1'
> make: *** [Makefile:248: __sub-make] Error 2
> 
> Please note that arch/x86/pci/intel_mid.o gets output twice and, in
> fact, tried to get built twice, causing the two parallel builds to
> interfere with each other.
> 
> The reason for the double build attempt is that the target can be
> reached twice, via arch/x86/'s Makefile and via arch/x86/pci/'s which
> both end up in '$(single-subdirs)' as both fit the prefix match.
> 
> Only the latter should be used as it contains a cflags override for
> CONFIG_PCI_DEBUG=y which would be skipped when using arch/x86/Makefile
> to build arch/x86/pci/intel_mid.o.
> 
> Fix the multi-match issue by using only the deepest match instead of all
> possible ones, which requires two changes:
> 1. Limiting 'single-subdirs' to a single match per target and
> 2. filtering out deeper targets in the recursive make invocation.
> 
> Also de-duplicate the list of target subdirectories to simplify the
> use of '$(single-subdirs)' in filter expressions for multiple targets in
> the same directory.
> 
> Fixes: cc306abd19e8 ("kbuild: fix and refactor single target build")
> Assisted-by: LLM
> Signed-off-by: Mathias Krause <minipli@grsecurity.net>
> ---
> I ran into this quite a few times in the past and only now gave the LLM
> a try to dig into it. The bug only affects certain targets and only when
> mentioned on the command line, so regular 'make -j$(nproc)' isn't
> affected.
> 
>  scripts/Makefile.build | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0f4fdc119e58..d5f58513d02a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -534,7 +534,10 @@ endif
>  # Single targets
>  # ---------------------------------------------------------------------------
>  
> -single-subdirs := $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(MAKECMDGOALS)), $d))
> +# A single target may match nested entries in subdir-ym.  Descend through only
> +# the deepest match so that two recursive makes do not build the same target.
> +single-subdir = $(lastword $(sort $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(1)), $d))))
> +single-subdirs := $(sort $(foreach g, $(MAKECMDGOALS), $(call single-subdir, $g)))
>  single-subdir-goals := $(filter $(addsuffix /%, $(single-subdirs)), $(MAKECMDGOALS))
>  
>  $(single-subdir-goals): $(single-subdirs)
> @@ -548,7 +551,8 @@ $(subdir-ym):
>  	$(Q)$(MAKE) $(build)=$@ \
>  	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
>  	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
> -	$(filter $@/%, $(single-subdir-goals))
> +	$(filter-out $(addsuffix /%, $(filter $@/%, $(single-subdirs))), \
> +		$(filter $@/%, $(single-subdir-goals)))
>  
>  # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------

Ping! I know, it's the merge window but this patch may have fallen
through the cracks as there was no response so far. Just trying to take
care it doesn't get lost.

Thanks,
Mathias
