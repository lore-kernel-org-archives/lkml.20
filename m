Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742890;
	b=agO/iRsqlbfvXmqgtSIU9ztrhsRJgWvqsKlIGfYkg44+uwdvmUXqPvc7CgAowtu+8fy0
	 TKPBD7lyNHGbkzn8m2gHsiO2ZGjC2//3tgIZ4VOniVFJWElFqfZqKN3A7UjtL0NA4rd3u
	 kDeD5xRyM8C7+dF3S4fBme9AYfCRz/as10x4sGBybSJww+E4RBSQLXuRffGofDadv4vUI
	 djokI079RCMacY7h7NTgXzhaFztELrOBfXCY32D65Wx3/Vn0g6RnORNa/3SBNsrrNKV2C
	 aZNJ5CXfy4L/0m98yKbOO5iQe5Sn07x7oGH7Owyn3AjcJ5XWlunh9T/ANFy5Vfu91ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dsJ1Z8U35IPEXIiop8EnuAFRBYPIToUsEh0hWLkvSJg=;
	b=C/7N4FGBAynNy+DqZzIFKZsr8bgzDPY+zwYhXfCu8EDuvWK9vMj6aaxsYH2CMLgIse0o
	 es06E0QLpAxFVn1ryI27SfT5+zjy9hhKRKRc1AbYBZyh5kGeD8j94XaNUn7AlXwZ/uXKh
	 Ed50m+rxFeaNw5DmlRsaiVuNgW9+pSGww1VgpuaQlGt1ZECAszKo9TNpN9MK9NxLXs226
	 c8lNuJmdryeAXYy2KEuOMvG+IUSkedMv5gP231hk9S7uM6qEMMT038m1tNOECAnATIn+l
	 4rnAx53k917YM6SAo3oU0KiWXGrEPvnsIcP2W8eXMVnRc+1LTOqa+cmodhb0yv/Oshg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFndjKIS;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF49606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF49606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFndjKIS
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so11901385e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742888; x=1794347688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsJ1Z8U35IPEXIiop8EnuAFRBYPIToUsEh0hWLkvSJg=;
        b=vFndjKISh0pYzREfCpZfm3scn4wXMjbDb+M9zJY+or5CMvZX6bi7AiNpu6d3mQfj9F
         6ehn9LEXgHfP7h0H58IJxkn2DJEEmD9x8AMZU5pO8CudOveh80p/8F2UEHlCDuWcx5Hy
         7byr9Ty1KtF6aGjVo0nmH261aL1qXpcTozVyx/NL5CTiDGVuz2+W7AlxPHu72ysteMVB
         Y1HmUl1a232SYhWXFt1QiRiATN+gM3dubXwRZnn0jCp02pndU2uHyDYtFbFkJVp+fBV/
         Ap6aMhbre/63Z96gtTole5h64rTmXB1HEKaWvptfQcsfuF84+owVXXoUoBu0sHMA3vBd
         PkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742888; x=1794347688;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsJ1Z8U35IPEXIiop8EnuAFRBYPIToUsEh0hWLkvSJg=;
        b=or2MwaP7TEJA1ZecK0pUJBIc4jNjwrfvKg7USKW+OohkzzCmSMSbIwF/XvZA+jG83v
         9D9CHcx1FTHC8Ivca4TdTcAJ69latja7x3Ihi8Efz+fm7Pym+0PP96FJZfBdnwbj3csj
         NZvAgpE2RbMf+0lcrDXYH+OLubEwjljVuFioR92haipPvkDti5XVq/XWxUkJciiNMu81
         eB5+DlVTpeQClfKkaUs+okYtG7hkWjcJaE7hrfILPgXiJnpD5kLvk24N0o+XsBHBaphh
         GU1jgrNMi8iuBIyouMRCGVjoifWpnaMRufFDfOIB1rle9PW1p0zLtJNITEnNYBiMkW9G
         Plcw==
X-Forwarded-Encrypted: i=1; AKwUvBzLogByuNtVp9s9CgSCK/GPSy7h4XJqV06sHBQlaAvDAfivtbzHQaBiufw2foXXbfs7wsKwkkpMwTSnuwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F4FTYpi7Dv/elyguzI2wPWDui9nchV4DjE5+kbA+6L0GIKsie
	rTfv1Ck8h9k0ps+4aShExjIiALwVXr+NRtvJRJLqwhWQJw1i1HO/ASRJ
X-Gm-Gg: AYBFou1k1VgIYxlYey8qClgECR4c8MGMkZUAuzAI8adIoIrh+O61h+7CulUz9iJjdp6
	bnwgminl+/sUTL1V9S+WNGpwH98fz8JqTWfrIDRfoGOyetG3h6falKawQB8GoKl1Vz62fTEfCMZ
	tp3PGa6xLqEoLtqQpX0fg3vRZoq5sSzv0Z6e3xVu4lQ0oGKUZUe80OJEyWqZF+Gk+aAORJmvm7C
	rVpZmE4y9KwGXu+LgpyRrMe6Fjre7+Rd1qPP9AByuq9Hu8FH41ReomsDL1wSVJH9eOg9a8t9PoQ
	aAQP5PbjO3G/vQIrYV560jxx2ym+NOHxoKCHaS9VNG1bBqP+bU/LtS1Hba3EUuFPimJQiFBbK2T
	16S6MTWZNzhUlx68S4lRI2SD7OnRYuMlhlYCCbOrWklDjsKzFIHpF4S2vvrg0kAXOA1dGyJhFJa
	2oksmI/QrKjVTt++z9yOLlrGdS/Jd/grRrnUnp4VY2Yi9pY43P+EeHicklW8WddBDfpLs89S3Uj
	S5zjr+KdtH9Fi4m+Q6m0crlE/1np59ur3lzOvZbq5kbjkReHKTpudBJ54pl6xPrtsmEbaN0rqtg
	vY1Ojsj4AK93UBe61MdYhYTN3sC09bqDrPRocK/xrHgQysLrywFwZGJwvBGTOrtN
X-Received: by 2002:a05:600c:5595:b0:4a2:d6cf:86e4 with SMTP id 5b1f17b1804b1-4aa8a7ad60bmr310402295e9.10.1793742887762;
        Tue, 03 Nov 2026 13:54:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99d67sm246869f8f.24.2026.11.03.13.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:54:47 -0800 (PST)
Date: Tue, 3 Nov 2026 21:54:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, jpoimboe@kernel.org,
 leitao@debian.org, keescook@chromium.org, hpa@zytor.com
Subject: Re: [PATCH 4/6] x86_64/entry: Mark all syscalls __noendbr
Message-ID: <20261103215446.5d27d33d@pumpkin>
In-Reply-To: <20261103085143.GX2668564@noisy.programming.kicks-ass.net>
References: <20261102112549.714541309@infradead.org>
	<20261102114000.771366690@infradead.org>
	<20261102170630.1dfc00eb@pumpkin>
	<20261103085143.GX2668564@noisy.programming.kicks-ass.net>
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

On Tue, 3 Nov 2026 09:51:43 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Nov 02, 2026 at 05:06:30PM +0000, David Laight wrote:
> > > --- a/tools/objtool/check.c
> > > +++ b/tools/objtool/check.c
> > > @@ -4672,8 +4672,15 @@ static int validate_ibt(struct objtool_f
> > >  		    !strcmp(sec->name, "__patchable_function_entries"))
> > >  			continue;
> > >  
> > > -		for_each_reloc(sec->rsec, reloc)
> > > +		for_each_reloc(sec->rsec, reloc) {
> > > +			struct symbol *sym = find_symbol_containing(reloc->sec->base,
> > > +								    reloc_offset(reloc));
> > > +
> > > +			if (sym && !strcmp(sym->name, "sys_call_table"))
> > > +				continue;  
> > 
> > Does that slow things down somewhat?
> > Could you do it the other way around??
> > So remember the bounds of sys_call_table and just check whether the relocation
> > in inside it.  
> 
> 
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -4676,7 +4676,7 @@ static int validate_ibt(struct objtool_f
>  			struct symbol *sym = find_symbol_containing(reloc->sec->base,
>  								    reloc_offset(reloc));
>  
> -			if (sym && !strcmp(sym->name, "sys_call_table"))
> +			if (sym && sym->syscall)
>  				continue;

I meant save the symbol info for sys_call_table (or maybe all of them?)
and just see in the relocation in in that region.
Seems better than checking all the symbols and then seeing is a specific
one matched.

David

>  
>  			warnings += validate_ibt_data_reloc(file, reloc);
> --- a/tools/objtool/elf.c
> +++ b/tools/objtool/elf.c
> @@ -556,6 +556,9 @@ static int elf_add_symbol(struct elf *el
>  	if (strstarts(sym->name, ".klp.sym"))
>  		sym->klp = 1;
>  
> +	if (!strcmp(sym->name, "sys_call_table"))
> +		sym->syscall = 1;
> +
>  	if (!sym->klp && !is_sec_sym(sym) && strstr(sym->name, ".cold")) {
>  		sym->cold = 1;
>  
> --- a/tools/objtool/include/objtool/elf.h
> +++ b/tools/objtool/include/objtool/elf.h
> @@ -85,7 +85,7 @@ struct symbol {
>  	u8 fentry            : 1;
>  	u8 profiling_func    : 1;
>  	u8 warned	     : 1;
> -	u8 embedded_insn     : 1;
> +	u8 embedded_insn     : 1; //  8
>  	u8 local_label       : 1;
>  	u8 frame_pointer     : 1;
>  	u8 ignore	     : 1;
> @@ -93,11 +93,12 @@ struct symbol {
>  	u8 cold		     : 1;
>  	u8 prefix	     : 1;
>  	u8 debug_checksum    : 1;
> -	u8 changed	     : 1;
> +	u8 changed	     : 1; // 16
>  	u8 included	     : 1;
>  	u8 klp		     : 1;
>  	u8 dont_correlate    : 1;
>  	u8 fake		     : 1;
> +	u8 syscall           : 1;
>  	struct list_head pv_target;
>  	struct reloc *relocs;
>  	struct section *group_sec;

