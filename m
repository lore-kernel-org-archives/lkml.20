Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C43BBFD8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990008; cv=none; b=hTW41wAUGWZG4m3z0RPOMjigntHHJliRCWhBnR6b4XaAWtFlazGEL6uT0i0q/EMsqGCsVTLe9EQJxHAwuu2uJ1jTGqNwOd1fz3NYI0z/oHObRV/zlCwEZAmvG2zdtVeM86DKy6UxTZCR4QoxzjEAYfnEaoTuGOaqLgBqaN1LChc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990008; c=relaxed/simple;
	bh=AlBtpgfRVu8vEObii+chGfiT3YBbebpadbPpl0qtalo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQAt9Sd+526s7emYp9pZAIk5fuGy52MA/0Em2XHgDAsz4Ulze4rIRANHGyYYen6OPC3fhm/sTgUt/AsMEkMt1SALxEADH0ZgibkUHSf2rqkx7uPvU52o7O65jcgaLGyFEuTEZ1bgoB1iVs8TPdRjfXpvt3m+vG8kAoW17I8pqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mbq/9tLU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mbq/9tLU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so1157385f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989993; x=1789594793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEVD0ONiRBgZcGn2NlyLse7rj8h6967aW8UFFN5/dyY=;
        b=Mbq/9tLUwVonvH2qdQIpPUA9ZkNkOlspbdT3ZO3j6oclwaaytXiKwlta82wAWrmQW2
         k1BpLWx3asPdNsmjNekJAdophdWD6DYO7fHd0HHSSym3z33k3xJOzdQ5qa8w1qOYsH/K
         bhJXUJVb4dvLKxdQhS4qZ737LLzWn3CJ5qk6mNS/7+63oUJ26ncLYCDlo3WcJGqSmUEs
         lzfLzDAGq/lHuTqTokzPZxditRrtyHQxx7NuzipoUSFClXnDxv/Twa8xxoR9pAtg9uj8
         aQeLBlc4lDHIMsgGuDJJPlO33wRaGN8ILZEIKW1TsjeFH6Qf9vp/uAB1mK6v5ajBsxk4
         MNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989993; x=1789594793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEVD0ONiRBgZcGn2NlyLse7rj8h6967aW8UFFN5/dyY=;
        b=Dz18FDfRdErdC4aPaYusM5cuDzlONXz7/MRrAS0ikOksx0WQjQdGkMnm/zBc9Dw4wy
         8IQBSigebQwd80dyUTTYeZZ7QyYmm5WxIou4i+nxiIV0CBszHwK/aMPNU+lOpg7/La9J
         XCdbuNr+9sssogsCJvs+1nt3s+J3e6Lm+WmM2fggUqH8zssEArI5k6W4N0cdjMgOGoK3
         vTddQovEPcUZzYrNWLAxF5LLtu9wEw9XgFQLE4ITuLSF2IeqIx5jzRYjhsLbyS5ooCih
         j5Dz0MYRMAF3dyTlkTmKicOBrYkgMmOpKBQzYNPczT168XEsmyGo9YY0g+WxEWP3VGRc
         +cfQ==
X-Forwarded-Encrypted: i=1; AKwUvBycH1XIjTvSNPoof+CPyhZ1WmOp0hZUcp3xVBLzyHrBzwaydzjiyJAMhxdWmNBXbV4xB7+7UT0eY7BcRac=@vger.kernel.org
X-Gm-Message-State: AFuF++nLZ8NLfvnnnelqFiADDmBNJQ1TG7VH0iSJSnaHsOU0R0g+/wHl
	u2OzbCyX6qjqdLfQCD6qR3bG6wxb/bsUKwYeYsg75ilYMUX9/MrbioCF
X-Gm-Gg: AYBFou02ffuF8OlkiTUDcMkZPfVrMS5KpM1Ujf/atiL9DSyVv/D3cghh8pT4m9zK9rz
	56MlnBgMpuyQh6CPdc3FmX2ACP5Hh9DSmHhANTaZPA6cSA3vBFx6NBq8zsZ+CCt81HmA+MQ/1hW
	lKafjKVDsEvfZ9cB5vtDV8mCBHhhyEvOaciYPwu04ssSssuU+OZLjCP3lmQD6Q3rdrINZPUJ6kP
	0e1VV/ZfO/C4JwhH3wTQRHYfNsv3TUTR2CTS699vlyZtpJxT7uT38VOLB6jt5ihc/aNrXLLlb4N
	5TWUpOa9ePNjlaKumctNtJoBeuHKGDKrxsXyvjMKBsXjextC3UguHm2Tr/fmYmbSAjvXPrZKIXu
	JD/03tacr7uZocpRV0ZPjeASTwkOipXXgOQK/6PLeRcsYp06eFf6UzKz6hDaOZOhutHlAE0Y1Dq
	hYjdlLt7LCSZ1TH83TprBjFRO0G9obAzOatYreWBkqvB9P4ze7ivzn7QEZZwxNCfZlT8J4JdoiO
	Wn+bYIBjoXPQvqRbynIX62I0ndIGyKKCgni
X-Received: by 2002:a05:6000:4607:b0:485:a32b:1ee8 with SMTP id ffacd0b85a97d-486e0fa01ecmr1480012f8f.20.1788989992817;
        Wed, 09 Sep 2026 14:39:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm38982359f8f.20.2026.09.09.14.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:39:52 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:39:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauricio Faria de Oliveira
 <mfo@igalia.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260909223951.1fe5fe25@pumpkin>
In-Reply-To: <95D5AACE-1D91-402A-9B6B-8D03C3D90705@zytor.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
	<20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
	<E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
	<d1b9ff734b918889eaf8885d64141bc3@igalia.com>
	<20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
	<e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
	<20260909093831.095b89cb@pumpkin>
	<8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com>
	<20260909202838.28071bff@pumpkin>
	<95D5AACE-1D91-402A-9B6B-8D03C3D90705@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 09 Sep 2026 12:33:40 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On September 9, 2026 12:28:38 PM PDT, David Laight <david.laight.linux@gmail.com> wrote:
> >On Wed, 9 Sep 2026 06:43:01 -0700
> >"H. Peter Anvin" <hpa@zytor.com> wrote:
> >  
> >> On 2026-09-09 01:38, David Laight wrote:  
> >> >>
> >> >> Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:
> >> >>    
> >> <broken code removed>
> >>   
> >> >>
> >> >> On 64 bits it compiles to:
> >> >>
> >> >> 0000000000000000 <memcmp>:
> >> >>    0:   48 89 d1                mov    %rdx,%rcx
> >> >>    3:   31 d2                   xor    %edx,%edx
> >> >>    5:   31 c0                   xor    %eax,%eax
> >> >>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
> >> >>    9:   0f 97 c2                seta   %dl
> >> >>    c:   0f 92 c0                setb   %al
> >> >>    f:   29 d0                   sub    %edx,%eax    
> >> > 
> >> > That isn't the object code from the source ...
> >> >     
> >> And that's the ultimate hint that a cut and paste error had happened.
> >> 
> >> This was the actual source code.
> >> 
> >> int memcmp(const void *s1, const void *s2, size_t len)
> >> {
> >>     int lt, gt;
> >> 
> >>     /*
> >>      * Note: for the benefit of 64-bit code, xDI and xSI are reversed
> >>      * compared with what CMPSB uses; hence SETA and SETB are also reversed.
> >>      *
> >>      * The XOR statements set ZF = 1, CF = 0, which is required to handle
> >>      * the case len == 0 correctly.
> >>      */
> >>     asm volatile("xor %[lt],%[lt] ; "
> >>                  "xor %[gt],%[gt] ; "
> >>                  "repe cmpsb ; "
> >>                  "seta %b[lt] ; "
> >>                  "setb %b[gt]"
> >>                  : "+D" (s1), "+S" (s2), "+c" (len),
> >>                    [lt] "=&q" (lt), [gt] "=&q" (gt)
> >>                  : : "cc", "memory");
> >>     return gt - lt;
> >> }
> >>   
> >
> >Try:
> >
> >int memcmp_2(const void *s1, const void *s2, unsigned long len)
> >{
> >    signed char lt, gt;
> >
> >    asm volatile("repe cmpsb ; "
> >                 "seta %[lt] ; "
> >                 "setb %[gt]"
> >                 : "+D" (s1), "+S" (s2), "+c" (len),
> >                   [lt] "=&q" (lt), [gt] "=&q" (gt)
> >                 : : "cc", "memory");
> >    return (signed char)(gt - lt);
> >}
> >
> >https://www.godbolt.org/z/6hrxGxb18
> >
> >Saves the XORs - go away completely in the usual case of 'if (memcpy(....))'.
> >The 'mess' on the return statement moves the sign extend after the
> >subtract.
> >
> >David  
> 
> The xors are explicitly in the asm to deal with the len = 0 case (this is for the out of line version!)
> 
> We need to enter with ZF = 1 CF = 0.

And, of course, I knew that.
They also zero the high 24bits of the registers.
Given the setup cost of 'repe cmpsb' I suspect the xor just add code
bytes.

David


