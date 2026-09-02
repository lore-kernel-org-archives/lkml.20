Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0A4137AE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355796; cv=none; b=I1cQck1yR/nzGgFcn1lMgWUWbnkvqsEPGHMNl8lgscb4zMj4gnZSmmluzddHO6CxvRbZUySBEnEgeDXYAn83HWjTDVC92kcITxuved+liVvCR0RAyq2k0ugrEBUoKKe8SypM9CUC1QTakVxC3SlJkiUZyy7koIncvQltdN4IPTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355796; c=relaxed/simple;
	bh=TqM7jmxGw13w30kSXUULf3VsHKwPzV2MjEepFkpUQXU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kKdtGFye2U+dg/E1pI3qE66CJ2rCK7h+p1zeLzxv7/FksHysF5bky6mjG6NYyqPIRoWqcU6qBiooR0yzfv1TZhwzyyJR4Nh3Q6mySO2g1uFH9YNLe2nlOHb6ehmEmUGPq0O1N9gZCxW1IIdGWTH23bVli+r/g8JfbWtnMGc4c8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a8qp2g9Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zVXkWdr3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i7CNFpdC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M8vN8FpQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a8qp2g9Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zVXkWdr3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i7CNFpdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M8vN8FpQ"
Received: from knuth.suse.de (unknown [10.168.5.16])
	by smtp-out1.suse.de (Postfix) with ESMTP id 754DF21D30;
	Wed,  2 Sep 2026 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788355788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JcrhHoLi9Dgkir2K1kU+9E3wacEKvPTtR3HgxM8VLPk=;
	b=a8qp2g9ZcT+rpjEdsDS39IubTtS+x2ehbhsLidZAJXr+4+HmM3pQqBtLXRgX7Bk0ZiY4tL
	XnkZ+ydbYZuR2Z3UdebjTUU0qK4f+6CMccMuAK/PTRyAmfCyGeCPNCNo5w5fhrtGhi40AW
	UxRby67B5SKQlN4d9RHy9LDfKlvwW0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788355788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JcrhHoLi9Dgkir2K1kU+9E3wacEKvPTtR3HgxM8VLPk=;
	b=zVXkWdr3892abkdxjA3uQDAyi8x9VDk4LdnUSScyt1O1zDizow7cB63aVuLj2AWm3QHMJz
	gaoe0eis6F1alCBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788355784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JcrhHoLi9Dgkir2K1kU+9E3wacEKvPTtR3HgxM8VLPk=;
	b=i7CNFpdCs5BKknGndwVSsiI9wy6UC5Z3CECMp2CtHvl8WEUPK/85+b4Ma8LVnoB7n1z9U5
	wZ3cjwZNYf8H8zBAJakVmwdOSJqCUMnHfsQnFv1C1Wx2uy+M5IWh8XYDQHN3REaPOHxAqC
	8hR4bBORuR88qnCTKDgYCdeDS+i81DA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788355784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JcrhHoLi9Dgkir2K1kU+9E3wacEKvPTtR3HgxM8VLPk=;
	b=M8vN8FpQm6FeTa5KX0O9PlTFreGfmKqz4y59LKN5KjQkyjyE4gRaydbLsENxQ16hBIyiCs
	FEnfwrP2rUy5vvDA==
Received: by knuth.suse.de (Postfix, from userid 10510)
	id 5CB02AE779A; Wed, 02 Sep 2026 15:29:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by knuth.suse.de (Postfix) with ESMTP id 42B67AE7799;
	Wed, 02 Sep 2026 15:29:44 +0200 (CEST)
Date: Wed, 2 Sep 2026 15:29:44 +0200 (CEST)
From: Michael Matz <matz@suse.de>
To: Borislav Petkov <bp@alien8.de>
cc: Mauricio Faria de Oliveira <mfo@igalia.com>, 
    Richard Biener <rguenther@suse.de>, Thomas Gleixner <tglx@kernel.org>, 
    Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
    Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>, 
    kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
In-Reply-To: <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
Message-ID: <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com> <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com> <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-669869079-1788355784=:4446"
X-Spam-Level: 
X-Spam-Score: -3.20
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	CTYPE_MIXED_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,suse.de,kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,vger.kernel.org,lists.xenproject.org];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-669869079-1788355784=:4446
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hello,

On Tue, 1 Sep 2026, Borislav Petkov wrote:

> On Sat, Aug 22, 2026 at 03:33:17PM -0300, Mauricio Faria de Oliveira wrote:
> > According to the GCC documentation, conditions in the flags register
> > (e.g., "=@ccnz") are output operands [1] and the compiler is aware [2].
> > 
> > Also, clobbers (e.g., "cc") may not overlap with an output operand [2].
> > 
> > Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
> > "=@ccnz" output operand.

Strictly speaking, on x86, the '=@ccXY' constraints are register outputs 
into normal random integer registers (though they are of course 
initialized in a funny way), while the 'cc' clobber is not a register at 
all, but rather a fuzzy idea of "state" in old cc0-based compilers (which 
the x86 backend isn't anymore since, ... well, about forever, 1999).  As 
such they both really don't conflict and ...

> But then I'd expect that gcc would enforce that. I know it can't have it 
> when the clobbers contain input or output regs:
> 
> In function ‘__memcmp’,
>     inlined from ‘main’ at memcmp.c:25:6:
> memcmp.c:11:9: error: ‘asm’ operand has impossible constraints or there are not enough registers
>    11 |         asm volatile("test %3, %3\n\t"
>       |         ^~~
> 
> but with "cc" clobbers it works.

... hence there's nothing to report.  In fact what an explicit 'cc' 
clobber once meant in cc0 backends (that indiscriminated flag "state") is 
manufactured by the non-cc0 backends (all of them now) automatically 
whenever an asm has no flag output constraints at all.  (On x86 that means 
it adds the "flags" register (internal name for the collection of flag 
status bits) to the clobber set automatically when there are no =@ccXY 
constraints).

You can regard all 'cc' clobbers as pure source compatibility, they have 
no meaning anymore.  But as they are so ubiquitous (even in our own docu), 
they remain recognized.


Ciao,
Michael.
--8323328-669869079-1788355784=:4446--
