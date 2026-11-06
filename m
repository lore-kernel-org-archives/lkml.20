Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793999958;
	b=14G0DeGCxVsFGDjvpzpvcBWhd7ykQITNZy3fYJrtSSyFMqcEbDaeyIc8Ra1oi0wFLKAt
	 snuEfTz/vDig6wy4Snxv5KcnBuBdVhKvn+EbVUpiI1omndiFshPrHQuQRrAjxymVRjjAF
	 KFMoy/oJ4Z/SizEMSM2kHa006zgWsg4J/O2kbI4opIDT78zvUEA7g7lyk8I9s2ji989c8
	 ghbR8n4Qygn6uQXDVGhHm8fjYg0r7pswrc3BwaRIPA8kbIgy19srex8mnxhuswg560UtT
	 ppoxIfP/KrUp2NDEZKWnTB2ZydT11TbdIB2EQGJdubAb2SBbZFbF95A5a1qHthzcyGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cjYHmUqxGl1gIMoX463n6uK9Cl8H9jhL6J91Ez5YTbo=;
	b=jsKCEkvCjf/OXMjwb6J68B1Bskc9MpJKNT8m2xilo4ZcxDKSML3e5xWyGvdLRIfPxxRH
	 zr/VGFdR9dX6EVyK8I4w1C71Zvwj3aIu8xdQ8+Ju/Sn6wTxwjqtxcqlHRr2gKD5nA5dph
	 b3NBOCnQwoupgcPXrm/iQQTCVxBMD4GY6pqSUcG3iOHa3aYT1fH8vnyFf5MWRdDBQ6qyx
	 VdqvkyxxvOBHp9/4LadPIIhfiXhlsbCDrqij1j1a2s5IhkAyBagyYOFankiYNaO6HbSBg
	 f83kWeIzF1vwiRTQR43Lt/blCYHBxlkBrcbhPS5Pj4CD2ZRuEpChSmkYEd7qSVUVbsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="nGu/a0P2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E50606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E50606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nGu/a0P2
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso1815a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:19:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793999957; cv=none;
        d=google.com; s=arc-20260327;
        b=XX3mebesMHVlG1wurXGf+Q86J+qWK5mdc69ao+qsPsFbFLW07gLmkhAvMKWj8jviQE
         ctlj3AzHPU5a3KI+ft/gi8k4hagoSbSxVa6zdxu4MaL6jYkkGO0FI4OuAtTOh+inUFQD
         Z3ucEMoB/Zw+R0Ts5wAu0LF9E+92x5S0CnrTvzrT9qLRzwZE4/fTFv+FgL2UPSj2KEy+
         nGkINFXMKwQjYXNW8fCrZ7UUy9A/jxxXK91cnASCdAKZEzZNg0v7JVRyP0U5v0cCnA5t
         crXOpSyD7ojM1O1GvOHQE2DRe1nFZRDiN9v2QKJggT3y9bj7yyHtTAN7GdW59QbZVmci
         B8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cjYHmUqxGl1gIMoX463n6uK9Cl8H9jhL6J91Ez5YTbo=;
        fh=oobg35NdcNMsIWZWFDEUh2BAmnCBqix1jz6NaJC4lRU=;
        b=RoSzSl2PiTppAYgFQUQGTmo6StOI9Gnts3ppQ5zxUk/zEoZtGYoIKwCh7mnNQHxWUs
         tl1t9hJrfuszvZqpdpZuzu+OHT/p+9ASNwilAUKUv1+d2CwhR8NUi25sQ671AHF78rO1
         3rDN9dpTE/XcpsheXu7uwfeGss8r79HIM5PM5iWvwAd2niwStyvcXhScuUODDeE3IpUD
         VeIt05bfcsboYELahHHKcMVa2DSZYd/Mi+ktxhzdgowfRjswFof0208rlY3azTR8KEnb
         G/1GG0fkKWnvPqzQmQcH/g1OreLqc0s+N9ZruH8WxezCt1PYhTbSKm5BhugsGE/lh3cc
         v3Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793999957; x=1794604757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjYHmUqxGl1gIMoX463n6uK9Cl8H9jhL6J91Ez5YTbo=;
        b=nGu/a0P2ZPgTxXDLZqgXVDqVkDHlObPQh7ris5tCGNoEEX3e0MOY2/D7uMy9A5v+OA
         LOoo8QnY7GM64gQncZaTjeEP1tzLXHJpKpUtbCpamwpmM7ARo/RfpslN9HqzFhOD5sqh
         nPorodsw2iI39/hQVCRUscVspUllnJm+uczjRcozaStSrj756CQ9rtdXIWVvDTb8qvhl
         Kc9kAIMoYm/YY5/Nhdn6bF5aP3mZfF/Q6mxPEggYntwk4qR/E41H2G8IaGtavjalJH8o
         FnCIOv6PKjN/LbY5aUY2iLDcfnJ/fCw55ttvQmmoFxqmE2s5esxzlsl8cbtjZz+KjIY4
         BPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999957; x=1794604757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjYHmUqxGl1gIMoX463n6uK9Cl8H9jhL6J91Ez5YTbo=;
        b=vk9UqKQUAZVmE4PwpESqjSEeIyS0Ng8hpXW2rUsZwsQlwFluQXl/vidR9J7pRzoIv1
         v2WDNDUgoNAEtdpzHtkbn/lVwOfkf2wXMLsAcER/M+QBLRliRZzfhQk+f4BeyH/AT443
         bspEck9r0QRMWAFftwBNpyBTsDkIG25qbyQDe0J/mzhUTlEdSQcYpczkFfne19TU09Mc
         u9tlf2YfBlgbnAv6E8eD3rlb7HUULE4G6J/D4SrBUkXkzyBTNdFLR7uufB5pTwa4IamX
         TeyshJRE+MZI5vDU1M2xoa29VSJ5GrNgRbS7US9OStsXC4H9VyFwsjiFBVZh/9bL8m49
         ssGQ==
X-Forwarded-Encrypted: i=1; AL+hErHJbUUrs667m8nhZaMQUDj3N7LS2WWG/2KENmSRBQc/ISAWy5nLk/DDL8Ie9ZvfwN4HS7/tlU/3HbKebpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I9qbTl2VL3TPDMAeXLQvGiW3ltBekAA8mGB0+UNNixDM2Ohg/
	RwmG0oh6Bzqf+PDOw4FliHubAsxOS4vfhj4/Gb2dnkGitQGT4mMiDJG7daC7iT8avJpoy9bB/Ex
	YvBtUCXjsoDzJVm/Oz7+1SkwQA4myE2JkVQUSyZSt
X-Gm-Gg: AYBFou2uFHCQAOfwNLkKEogBqVIRMcDiWbyFVTSrHw9ldTVl/Rq7kbfBMWER85HjmFs
	qijLLOaH06FroZUiyiBqDjmowGKvcrFe9E2FwJTL2jClKgt49wN0tqQs+LZjSt3rAaIgVYarecb
	J6SAeQYBlPLkD+EOG7YMRDZkcugZ1GNLc6oHhR9DrskCH7nQ1h7NyKaAZaupfpmRMgoEZNwGxvv
	QN66aBhZkDMdjt+KAAMh1dm9HMn/xVVLeFJJpFGW9EkbjMz8CyJikSe0oBDy0pZsYvjDTCjjsl7
	il1p5XQeNf6z17dJsDJGAo4y5oQL+6WuxUWmXvx1cWOJj1OwBt01g65vypXzSUJWJ3g76MPXLk9
	fsJcFKq1UTVMNiHR0nd5gV+OEFiqbEZhEQBT/oayZa/5KVtJ+k7RyEzEMtCoUp9704WmByj8K
X-Received: by 2002:a05:6402:23d0:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b6f845ff3cmr21307a12.15.1793999956326; Fri, 06 Nov 2026
 13:19:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-16-zide.chen@intel.com>
In-Reply-To: <20261106013927.166209-16-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 6 Nov 2026 13:19:04 -0800
X-Gm-Features: AclHuK97vQGFWhElUQz9Hvlo0UtCkuHVJtTKpojbcuYIAmqir0YZFds3plYc-IQ
Message-ID: <CALMp9eSC61v=xo8V_zm6AJjFUxyV-EphhwQxm80WjwNvWR7Xtg@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] KVM: x86/pmu: Mask only OS/USR bits when
 filtering fixed counters
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:50=E2=80=AFPM Zide Chen <zide.chen@intel.com> wrot=
e:
>
> In preparation for supporting AnyThread deprecation and Fixed Counter 3,
> mask only INTEL_FIXED_0_KERNEL and INTEL_FIXED_0_USER when updating
> fixed_ctr_ctrl_hw in kvm_mediated_pmu_refresh_event_filter().
>
> Masking the full 0xf nibble would cause two issues:
>
> 1. AnyThread for Fixed Counters 0-2: When a counter is allowed, copying
>    the full nibble from guest-visible pmu->fixed_ctr_ctrl back into
>    hardware-visible pmu->fixed_ctr_ctrl_hw would resurrect AnyThread in
>    hardware, defeating SMT cross-VM isolation.
>
> 2. Metrics Clear for Fixed Counter 3: If an event filter denies Fixed
>    Counter 3, clearing 0xf inadvertently strips METRICS_CLEAR_EN from
>    hardware. If the guest sets METRICS_CLEAR_EN and executes native RDPMC=
,
>    metrics will remain un-cleared, returning stale data.
>
> This gates hardware counting without clobbering other control bits,
> matching general-purpose counter filtering which only masks the event
> ENABLE bit.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
