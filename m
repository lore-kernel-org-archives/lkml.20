Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9105446E007
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323085; cv=none; b=LPZV7exhvgaL9ED3ReBQsDiKzasR0cA6QDdvci3lEbtU6rpdYrwhOvCpk7LFtxqPmDVx1z7iyyDstiQ5rqkdLptJ3XWyUNpAyBPk/fbaNboLMIsqnjG+A1IWvIOet5u7D621OO/Jspwik9JXgFkHbQF1XAxLEDAYNosPaYU0dOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323085; c=relaxed/simple;
	bh=NnimjNGYeRpqEEnGVNPNk8yFJOtE8wIsFabklpIFFTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWroBgQmqe5gAsUnFc6iwyR4Dh/nVHGJe9Lp+vj8p6kfdd9WOvub2CZjS6CDICrz9yyK836tyxSnIaw1UkCUArAr6c7pHD/lgcU4QTHfuMEyDhntRPLhZiUl46XKgEdzDmFbWtKPyvLtMR15oVywbES+JAxzKJnGGrXH5Pk7IHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fri8C7+3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fri8C7+3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e73611928so8372705e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791323082; x=1791927882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tifiX6481R40hxu/k6vU5/7L0B7Fp/9nw5hn1d8poeU=;
        b=Fri8C7+3/pTdW74614MCQDOeFBrL+x7xZdhlvTz6F+vx1p33Q33zF2pX62GG+C0WW2
         IicUWx0IQpjEimlEMOtaE8ZqAu1P+nmFm5qTMom100PGgxsxHNwp43sGufEmb/Cy/X+F
         R7qXZ1KLRWccHSrlfySEpEQwEJHcy/mQjWAPRur4AgsD3HDtvbfky9AMchwBLQkHgXzY
         mO/APB2DFDN69IUVGrrNTpUFbh4UFw9AMg6r2cSaHHwKrrpSCbV1xIvmE+v/fDGsTYJ+
         JAPL369YjGR9otJ73kJAnu2yU7IHRH6qThRy+c4CY6i1wMh623YvpXCg5b3frcb4/F4Y
         CeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791323082; x=1791927882;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tifiX6481R40hxu/k6vU5/7L0B7Fp/9nw5hn1d8poeU=;
        b=NHn3Zrb+8+pmpO3Q27lihl212FeIMIECqf0KHIXkrsC1UkERZC6D3CAYMv9xG/opGY
         9CpUckEklW1B2VjegIPzcGXl3/llQNuegJKjCj01YcsffZ2Dh28n2tKYT6UB5FuNoaSP
         76njiRv9FIJq0vWzYJiCIAZIDI3XQf9gcxKB9rrWz4mSHKtiWcACbZ/mAJ5J3WIuHtDH
         trgux2bc9tiz91CPCVikDl+TBe83SfPh1KFajWZEgXndXxO6JDIlLvQVOhvTqWrrDXqC
         OrdRWmdY0G+UelUukmu5UmJf7CjG3+9gDG4WE5ZHgpd9eykt+WxkAlG/Vq7csGB3hOqT
         KdNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxv/7yN6ccL/eEpMjgdjCE8VYbZpCusUFNcXJsdrgURtG3Qbqv+g5IqN19k2jo/90dAcOYrC6KTlHuRbs=@vger.kernel.org
X-Gm-Message-State: AFuF++nIh8HJiDlEJ72o8jMdpdrmm+Yl+3OcybMeqJeKJCCqiNYGYXv4
	Tqb+QINupBhUGgoNzJvkdE+H0+wGN8MW466SkOvwtArv/e1q9YrjLi1B
X-Gm-Gg: AYBFou35pT6O/xFMMqg5z3JoeeDQ6CWQaC9Ka75ioxWeBvB4+adydMXop1V9MObV854
	Y9qD+tsDIfXkCmMhq4kuOHv6b41TEEJ/GyEmKbzKMCjdIAF2WC50ZwsNFIJZMRjnXp/SgCreLo3
	RV5EJ0hQVrnip1JaTsvnf/uMuIglnG/2Wj2RTHiEv6KGfOInWM4XwxriUDLn9tPwfx/NtF04U7o
	aKcfQeTC0czAQo2ggVYolGewk7QQJgE/z77M0P6VsEg1MC8/QxiWxXXddrvvNPRhuRYIRLaU5ja
	dQNb/RQuaCaAbaQxLsZS2wJggTiQPpcNgVFYF/Ekucj7b2Dl1HfFZqUpR9bhY55jw2QIZzIMpNP
	sS6+yL+yuivWYQiWvnOuua9TaPO/ne6h+4owCjf94RyEsgYDXepjOYZQRSaAFDCJpcUIfQXYBjC
	uJTIXa9cXbIaPbkgp+Fsn4EnWFEC8fseLeg+CSfTEaPbeKNOlljbAB5HgTZh+sQNwF0lABi/fr+
	ZhNi1AaM+CrxrFbWUg34kcJdPtd5LAJuX0=
X-Received: by 2002:a05:600c:4ec9:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a1802ea1f6mr2426525e9.6.1791323081543;
        Tue, 06 Oct 2026 14:44:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f5507a0sm12623125e9.6.2026.10.06.14.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:44:41 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:44:40 +0100
From: David Laight <david.laight.linux@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, Geert Uytterhoeven	 <geert+renesas@glider.be>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: lib: Restore r4 in shift helpers
Message-ID: <20261006224440.04ab3693@pumpkin>
In-Reply-To: <cfaeee0744ee2e2148114ff5c65f74311b7479f2.camel@physik.fu-berlin.de>
References: <20260714104147.2016549-1-fuchsfl@gmail.com>
	<85c4e0b40ec4b52b73c1525c2340cdaf31fd7d6a.camel@physik.fu-berlin.de>
	<e2d4c042a53eddc1ea8d800e171e6c59c9d3f7e1.camel@physik.fu-berlin.de>
	<asU-6UBmN4OjNsLV@lithos>
	<cfaeee0744ee2e2148114ff5c65f74311b7479f2.camel@physik.fu-berlin.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 06 Oct 2026 20:54:30 +0200
John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:

> Hi Florian,
> 
> On Tue, 2026-10-06 at 20:33 +0200, Florian Fuchs wrote:
> > On 06 Oct 07:41, John Paul Adrian Glaubitz wrote:  
> > > > Please correct me if I'm wrong, but after reading the code in [1], it looks
> > > > to me as your patch doesn't preserve r4 but it's actually storing it into
> > > > r0 to be used by the selected shift sequence.  
> > 
> > Yes, the value is copied to r0 for the shift sequence to use, but only after
> > the r4 original value has been popped back into r4.
> > 
> > The shift sequence themselfs only operate on r0 and then rts, so nothing
> > touches r4 after this point.
> > 
> > So the caller gets the original r4 back, which is what GCC expects.
> >   
> > > > With the previous code, r4 is pushed onto the stack first but not restored
> > > > before the shift sequence is jumped to, so what your patch does not make sure
> > > > that r4 is restored across the complete call of the shift helper but rather
> > > > restore the input value in r4 from the stack before calling the jump sequence.  
> > 
> > Yes, it needs the selected shift sequence to not touch r4 as well.
> >   
> > > Could you comment on this and maybe rephrase your commit message if you agree
> > > with my analysis? The patch itself is fine, but I think the description is
> > > somewhat inaccurate.  
> > 
> > I think your analysis is correct. The selected shift sequences don't touch 
> > other register beside r0, so I think it is currently not necessary to make
> > sure that r4 survives the complete call, even if the selected sequence would
> > touch r4.
> > 
> > Is it more accurate or which aspect would need a better message, or do
> > you dislike the "across the whole call" aspect? While the patch doesn't
> > really make sure r4 is always preserved, it reflects the behaviour after
> > the patch.
> > 
> > 	Commit 940d4113f330 ("sh: New gcc support") reuses r4 as scratch for
> > 	the jump table offset and pops the saved value into r0 in the jmp
> > 	delay slot, so the helpers return with r4 still holding the table
> > 	byte. GCC can keep a live value in r4 across the call, which leads to
> > 	runtime data corruption.

I'm sure you can write that more concisely.

> > 	GCC calls __ashlsi3, __ashrsi3 and __lshrsi3 with a special convention:
> > 	value in r4, result in r0, and only r0 and T clobbered.

That misses out the other value passed in r5.
What is T?

> > 
> > 	Pop the saved value back into r4 before the jmp and copy it to r0 in
> > 	the delay slot. The shift sequences only operate on r0, so r4 is now
> > 	preserved across the whole call.  

That seems unnecessary detail for a commit message.
Why not just:
	GCC uses a special calling convention for __ashlsi3, __ashrsi3 and
	__lshrsi3 that requires all registers except r0 (which contains the
	result) be preserved.
	Commit 940d4113f330 ("sh: New gcc support") reused r4 as a scratch
	register leading to data corruption.
	Change the code so that r4 is preserved.

If you are reading sh assembler you should know it has delay slots
after branches.
(I've not looked at it before, but it is the only way the code could
be valid.)

David

> 
> Yes, this is much better. Can you send a v2?
> 
> Thanks,
> Adrian
> 

