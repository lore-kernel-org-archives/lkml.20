Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389379;
	b=v3UzQbtzE5HfOcyBlvDeyA/ocyTS+K8znPiMOdu7PFJOLvWmBKifqYTEZNRTERUvVOg0
	 cOh47BPEnhcfqLxCfNhef9ENuZF/oTd3J22nF3T6H4QI/WIaGNbIJXTCc5uSFd/6v7Wua
	 8X8C/UhwuSoZ+owOlXvKpiH3Xldwt4oObplfFNRWhJoclgkBJ5NbarrgOHXXKsWECeXP/
	 d1DFzPLo+UuyvaoqrRpd9w68Nf/CZD5iNV2rr0OYN7xqJUrw3BxtEdwtXYrIkdqck0ewf
	 40am5g5usKHm7AIddLJ8bS4WWOMkclqrGQ6FOql/umADX9lflkp9RXuf32YDUE00a8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/wyfEDWWDuIr1slw1zxcxTDWKymMx6jtSpk7SY5bUAw=;
	b=sLMfHlVYUSJffPLH8PTPrlvq0u2462PDGK+tW/uRqKH2wSRNJJwlKuAL+RV/EcXnpc97
	 OYirQDlXVQx6bzudKc43uPzxuzlbEY56zKB5h0LdOEO4TPJnYcD2FHD4I2LgX59WsGz0C
	 +rxLqdCj5zr0uC3ZrxQ/i1Iw8iMtwTBr0X12bI1wCDBna+dwGdxcnRZUPbnf6GkieaZrn
	 9aag0qZAbj7k/uCoNSG2oODzPRBOK6ihP04AB/ehfPgdXDFBJZKjFa2o6DdalAfqAVviG
	 5luiVtWQpKQojb7gCer19r6a+FUgje3+ssIVxvIAC8Qdt7STI94llyAb9cbYclABYQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIz+x5NO;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A65606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A65606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIz+x5NO
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491aaed7565so1770846f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794389378; x=1794994178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/wyfEDWWDuIr1slw1zxcxTDWKymMx6jtSpk7SY5bUAw=;
        b=mIz+x5NOpN2cIR1fstIXQYnCW6VsEYNhbJ5YAA4meZT+odupw2IgpROiY5YB5r7r+c
         mOJp+AdCWXCV8euzxhSfUecwtVnnQx6Cm6lKaIOf72GX6vB5NbP36m7XxayqEzrlDDye
         h7JdokGCk4+FYZRXUrHOIzSsGy2r1+W1dB/VK53iq19VzP8AjqWhJbuHwsZa39J3h+62
         CLdXEoJgSJVs0DHIW/THzxH0zM9+UGWQX4smgoEEoiexr6wF6DS1LIlx/phcG9iY1eBk
         rQ8rqqKfkn8zLr2LbSEPNwkwQGoNBwiCmB9M0uiXjHKcgQyBN/Segh6x2BRAGsjX0fLX
         zISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389378; x=1794994178;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wyfEDWWDuIr1slw1zxcxTDWKymMx6jtSpk7SY5bUAw=;
        b=oSRdgczUrXLqpLlWw/Q+gMZ9/g2OxWgnGJLz22mC8yorzR19P2iCIMuYkdDqYbJtiw
         5H31O5R+JvbyzWk/gbrQw3BETocD7T/Hq4R7t/xjGbWFKJPZLclFyfFJCMShcmeNkBG6
         PfVJJN0gPgGHopMZheY1Zp3tjpfXcMBaZNybJbQFZR4A9GEMBvfWVW8LUkLidcBqXEyK
         JcxCS7oCxH9Nvae+Kk7mlQ/+FpJgPimE3Klw8zlQ/d/uWB6SmNIHzbNoZ1NO5X15oRbL
         biAYyilTqfP30l2/2k8xiIy8JhPrmLLRxYyUw0y7VQ54cXP3y0l66uJHMa4iStgWZR1B
         at2g==
X-Forwarded-Encrypted: i=1; AL+hErGMaJG/kxvOXE570K2OlHdAHtRQi1ulZ+03tVOR6DVYOcAjGduBkfO2xikOtevpxm4bFfr7NcdFNzDJIC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sGmj6BPTMywMBIsacpy3lx9cAVEZm9+ZTRT/ySaiFGJNGzZh1
	9br4VcGaNVQTzObmaaAGyUhuQvzc1a/M+lsA/uDyVlfFiCfLdz+tn3f/
X-Gm-Gg: AYBFou0NeceeyGvzCxTxem8wSg3cyvCt7eNU2IAMv1HGPmML2POsUAcSf8jBKDxA7ap
	aBJILAR2FV6B5fVnyObiD9Z69MeSkNxbMWFX5kIMfTHdvWDv6iAvMQ0ohTUyOu1stuK70XyXYep
	X1kfy0FNmhXESgZnKSWHuJ1PbkgMF8GTnZ3QsmPhWTp50Bfyfw9B10gTYYQEQSw9lOIzS46o6Kf
	8wW+N42keh3g2VDSbsq+aPOXJyG2+m/SPfJ4i5Gg/fCqW4fdtLAOI/a8I0X1PUdAG0jeiQJtDXm
	EQyldDI0W47dyv16EXhnIq4eAVlumU9eFFusu38rQL8DdGwfeIdRZj4JQ7rdKp4GXUI3mc8vAl2
	IuqsGbu8ptzWDKmICqxPMXniyxBu3s/2JRgPm49ssAB8YinCHoB64wd5wfo9jAqzXQoFCRAgeab
	dtkQn/dVbCLSRL3hJFrylX1bTB0/k2Hdr30GG7PYF+U/IbdgaDbuxNwd9pk7iZGMimgxiVCHBE7
	lpERSnGYMGTaGGQ2j+05hkCDpmhUzYYLRaRZ1/GdyQGDu83pfBAkGdRMTZVgd5vkLYzTKa9fD64
	hFxdPkb3ErQWZJrOUwlDya4z+YOdiaMQ4/in+hOwaA5yjkBLRoL8lLv9TqDz+htJhg==
X-Received: by 2002:a05:6000:4011:b0:492:e1a6:90f9 with SMTP id ffacd0b85a97d-499c72712e8mr3087990f8f.18.1794389377659;
        Wed, 11 Nov 2026 01:29:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm10160123f8f.11.2026.11.11.01.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:29:36 -0800 (PST)
Date: Wed, 11 Nov 2026 09:29:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Rui Qi" <qirui.001@bytedance.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, <will@kernel.org>,
 <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>,
 <dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: patching: Fix instruction byte order in
 aarch64_insn_set()
Message-ID: <20261111092935.4d6060ee@pumpkin>
In-Reply-To: <3b540bc9-69b3-42a8-8431-75dd6079bf4f@bytedance.com>
References: <20261010084721.2197683-1-qirui.001@bytedance.com>
	<20261010085055.2200241-1-qirui.001@bytedance.com>
	<atEGBsR3eI3cXKay@arm.com>
	<3b540bc9-69b3-42a8-8431-75dd6079bf4f@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 14:52:44 +0800
"Rui Qi" <qirui.001@bytedance.com> wrote:

> On 10/16/26 12:57 AM, Catalin Marinas wrote:
> > On Sat, Oct 10, 2026 at 04:50:54PM +0800, Rui Qi wrote:  
> >> aarch64_insn_set() passes the host-endian u32 instruction straight to
> >> text_poke_memset(), which memset32()'s it into memory in host byte order.
> >> AArch64 instructions must be little-endian in memory, so on a big-endian
> >> kernel the written bytes are reversed and the CPU takes an UNDEFINED
> >> instruction exception when fetching them.  The sibling aarch64_insn_write()
> >> already converts with cpu_to_le32(); aarch64_insn_set() does not.
> >>
> >> This is reachable in-tree: bpf_arch_text_invalidate() fills freed JIT
> >> regions with AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64
> >> selects HAVE_EBPF_JIT without a big-endian guard, so the path is taken on
> >> BE kernels with BPF JIT.  The direct-fill loop in the same file already
> >> cpu_to_le32()'s the constant, confirming the expected byte order.
> >>
> >> Convert the instruction to little-endian before the memset, mirroring
> >> aarch64_insn_write().  On LE the conversion is a no-op, so behaviour is
> >> unchanged.  
> > 
> > We are just about to remove big-endian support (in 7.4).
> >   
> 
> Understood.  In -next arm64 no longer has a config CPU_BIG_ENDIAN and
> nothing selects it, so 1/3 and 2/3 are fixing a configuration that no
> longer exists.  I'll drop both.

Should it still be fixed in the LTS kernels?
(or disable BPF JIT for arm BE)

David

> 
> 3/3 ("arm64: module: Use text-poke for late PLT/veneer emission") is
> independent of the byte-order work: it routes
> module_emit_plt_entry() / module_emit_veneer_for_adrp() through
> aarch64_insn_copy() so a late livepatch relocation that falls back to
> PLT emission does not write into the ROX .plt and Data Abort.  That
> path is reachable on LE today (klp_write_section_relocs() on a
> MODULE_STATE_LIVE patch module), so it is not BE-specific; it carries
> Fixes: 91b89a634487 and Cc: stable.
> 
> I'll resend 3/3 as a standalone patch in a new thread.  Happy to route
> it a particular way if you'd prefer.
> 

