Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695909;
	b=uVaMj1Lm8aefTDRdZzi52N+CMHBZEYPJLk0L1ougVu8CIUc/nsszZb2h+pc0Tgz0yTBE
	 8pb7LerXqvnua50+WN6rdzcBwPPQ2grT+6C3PiMbySlITgyWB9m6tKW/DqcQnqN7rUwbS
	 dloEcqLS5QTqU3P4gJUcYteHEAjeXpdQUmVzzyM/FkhzeEu+fNNbU5hufHsecyJb4Yf/p
	 onha0BQCN88QZakKFiu+C+mArohVApWngM3QncuytOtyO55sKIvC/EjaseuXsJVchtqB4
	 Y49fT2hFvaay9Yhc26T6IBTx9LLHbmi2cTQyv/GoZc/at4d2cakknz6ruvOda7fjglQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695909;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=j+3BPXD40gd/4m9XzSumpuXVLjI3f9knyuC9D1sbOkc=;
	b=OOzNwcyvNxyl2CEdsrvqaqZqWzyAMtA6/XwaKIUc60Qlen1kSMDEf9uTBeHDxouv3IXw
	 vvkuFByf+T4Ic0bMHlubsTsuI90IEKxMg/zMnxu4VQmxWiMHZ9tyEY9rKio1P5DFy5ksM
	 ZSxtlOzh0ef80GK5QGD56BLcIhigT0hOLX+Y+ZO3l5kx/XYnOugbM6gHLCCEoljFwnjPd
	 cj+nYQz2xgy/CAxQle+VRR5wil/kcKupA1Eocyq/SawZyd4/MgCrWTWFK4Tg4FN/QrBCK
	 gSiwRIVHzT0/QT7TvbWd9kyoR30NZk5+XPs9oM7oAKSd99m6PHpSI7ozu9QYainrGEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VICk0y7t;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB48606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB48606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VICk0y7t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j+3BPXD40gd/4m9XzSumpuXVLjI3f9knyuC9D1sbOkc=; b=VICk0y7tFmDowx7CHe+0DsyCY7
	LClgNjNRNTmI9Prr3a1bDclClA3ff/AlKrH4MNC1fSFIVL/epGrQMKxQejHa1tRZChkVKxMpd+rtX
	32Qs28YT2lS+pOBqEi0lJC/hYtNmSt9Y0wQlj3vhpTLeGG4r8YMHUw3TRoKYBBD3iLAfpUYjOP1ja
	B1kZfzwY2r25iOTQI+OGL+nNb9R3Lmi6RWms1Z52LpfvuDS1QAHSoxiKJwKCXyajO42wtcUQGRynO
	944lZYbGF9TkclyFWPHQSUTh2TsUfsDlLXggu4K/a+7Gjvta9/xWx/Ih0ZyeEAokcte6Y1C1uLEB2
	qvth5kGg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAF7-00000000D2H-1iIh;
	Tue, 03 Nov 2026 08:51:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8EFD43002D9; Tue, 03 Nov 2026 09:51:43 +0100 (CET)
Date: Tue, 3 Nov 2026 09:51:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, jpoimboe@kernel.org,
	leitao@debian.org, keescook@chromium.org, hpa@zytor.com
Subject: Re: [PATCH 4/6] x86_64/entry: Mark all syscalls __noendbr
Message-ID: <20261103085143.GX2668564@noisy.programming.kicks-ass.net>
References: <20261102112549.714541309@infradead.org>
 <20261102114000.771366690@infradead.org>
 <20261102170630.1dfc00eb@pumpkin>
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
In-Reply-To: <20261102170630.1dfc00eb@pumpkin>

On Mon, Nov 02, 2026 at 05:06:30PM +0000, David Laight wrote:
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> > @@ -4672,8 +4672,15 @@ static int validate_ibt(struct objtool_f
> >  		    !strcmp(sec->name, "__patchable_function_entries"))
> >  			continue;
> >  
> > -		for_each_reloc(sec->rsec, reloc)
> > +		for_each_reloc(sec->rsec, reloc) {
> > +			struct symbol *sym = find_symbol_containing(reloc->sec->base,
> > +								    reloc_offset(reloc));
> > +
> > +			if (sym && !strcmp(sym->name, "sys_call_table"))
> > +				continue;
> 
> Does that slow things down somewhat?
> Could you do it the other way around??
> So remember the bounds of sys_call_table and just check whether the relocation
> in inside it.


--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4676,7 +4676,7 @@ static int validate_ibt(struct objtool_f
 			struct symbol *sym = find_symbol_containing(reloc->sec->base,
 								    reloc_offset(reloc));
 
-			if (sym && !strcmp(sym->name, "sys_call_table"))
+			if (sym && sym->syscall)
 				continue;
 
 			warnings += validate_ibt_data_reloc(file, reloc);
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -556,6 +556,9 @@ static int elf_add_symbol(struct elf *el
 	if (strstarts(sym->name, ".klp.sym"))
 		sym->klp = 1;
 
+	if (!strcmp(sym->name, "sys_call_table"))
+		sym->syscall = 1;
+
 	if (!sym->klp && !is_sec_sym(sym) && strstr(sym->name, ".cold")) {
 		sym->cold = 1;
 
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -85,7 +85,7 @@ struct symbol {
 	u8 fentry            : 1;
 	u8 profiling_func    : 1;
 	u8 warned	     : 1;
-	u8 embedded_insn     : 1;
+	u8 embedded_insn     : 1; //  8
 	u8 local_label       : 1;
 	u8 frame_pointer     : 1;
 	u8 ignore	     : 1;
@@ -93,11 +93,12 @@ struct symbol {
 	u8 cold		     : 1;
 	u8 prefix	     : 1;
 	u8 debug_checksum    : 1;
-	u8 changed	     : 1;
+	u8 changed	     : 1; // 16
 	u8 included	     : 1;
 	u8 klp		     : 1;
 	u8 dont_correlate    : 1;
 	u8 fake		     : 1;
+	u8 syscall           : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 	struct section *group_sec;
