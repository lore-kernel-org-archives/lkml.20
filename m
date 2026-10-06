Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330733C8C52
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791321951; cv=none; b=a4LXLNhUwXGj6eiEe5H4oMfi98EJZifZ+F1NetGcgeRA5WJzaI768NqIf1MW/Nefa0gSQO85mXPEA72y88MPpfqv1ZcGgm8t7XEgep8MfIhnX9diGM5fu6Z5+YhVwAbNYKxGrHh1g4Don4kzO1EcxmhioKEaWQpxKIKzjG1edJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791321951; c=relaxed/simple;
	bh=Si78HOdTuh5br4pOEzzwuy+CScE3tTEM1svLlsWQ2Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKxBMO6lCeJDlzSMNiXdNCtLc5mp1DzOiBWP1FuIVW+UMpDXGNH8OQFhUztoWNMcJjzumhvqzZjugfIhW+it6g94P7JohmvCrqt+K1F7PlO1DK5ZsPHrPoQ0tcGJivN4b24zAM5ggwepAOJ48bWh/u6ap0a+6sDZQR40TzMUMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZrbndYo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZrbndYo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24334535e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791321948; x=1791926748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzistxaYnghCdHKPFD1L5qK7yOScebgk7YUgF/bSWzI=;
        b=iZrbndYoI/+9FWS4vMPgXAxkymOoMgUvl+ZRBmhnfuaFQKmCA3MlQ/IT4RvkC8hLGn
         B9wFU4WzmTZ9XoIaGRyJClHtuElFuwpa7Cjdg0YUGlrlx2IyQWrFhy50RV0zFFb1CwOD
         UPCkcEtqMNO5XuU5NXn1FaHTsnsbxRIzblxu0f5LMLyRCpvqVynplFbc4Asvd6JqbRNJ
         g7ZyGuAGCqFpIumDtElFAHkNtuIv0n6T+TSCqgxZpGvS+5L033E+T5EgX2YTIBYunZHP
         NlrA5EXKbM+J6pszGDEwz+FplvgYS79PziM7TkxvSrgLvDq1Pcp6Zlrls+gjT9udJNoF
         /nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791321948; x=1791926748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzistxaYnghCdHKPFD1L5qK7yOScebgk7YUgF/bSWzI=;
        b=L0SR7Cz4uDxCEeEctXqh3try3jAIT4kw5iR0jibeUY3GGbDUHolU734n1dw8fGe68o
         gNmVJdgp6OGYrI1Xu8EtU7DBx7Pn51Hrvin8OKYxUgb29vj5TkykwS+71Rg6MaKzaF20
         nFal1CkQ4zkFBAbvDHl7C/ERegod1T5B1aENGH3VH4PtqIcyMxUCLPuWtT88xNk3FEcQ
         QZTbhNblnaUHG7NXnOX1vkKlxvKXixNhkj9VX6oE9ag5AIhik5xA1UJ7G/imaxXESC3V
         JBdoDalo9ztPk+XRdY30tLvc96eOtr40W7tpKyqO0BLCLv3i/0KQT8+NHAWGZjJzEUmo
         5c/A==
X-Forwarded-Encrypted: i=1; AKwUvByO9vFHc2PwtCYk9LE6jqHJx96DvrMlR8IQcCB0pENB4te8+LfaYYvfAb2W1zBYMSDkg9mcblVItdW1z78=@vger.kernel.org
X-Gm-Message-State: AFuF++nrep3YegT9T7iyTB9xowF5du/C6OGjQ13ZZBwdrXnfoRx9dwMP
	KnP63zG3TzrBA+BH9lCD7Cr82QQJECcL43+noAeqWKvYimL4smvR6rup
X-Gm-Gg: AYBFou08xxbU/Kwpec2nf180MIeD9yGlb7fzaNKO4nhf+e1zRe6vl97MsEYPS7T4plr
	VFrO4XQDHyimxFJeAt9iLwi2HLS9Bc0EGBHYXG26tPhHhACBF7lugd13ikiDWi0YyuAyJT7EO7Q
	aT/e5L6FU4Ms43IsxxnjLWADMk9+N/5e2fBMeq2SvC2sGdjYBF18toaaQKvO6HwzXcjDwZc5EJn
	L+FoarczM1q3609JwrIUqRnCxsTPtia5vSz5BU4ic4lo/pqzN5fxVUhgsicLOGwxGXAwWCpgY34
	zO/Sval/TBYAzoVHuiCwjbY7QfreRnCK8flYiUiiodqzr3mteiizh+/j1nzF9egnNWd3x0EL6H5
	LmslT77aig29PrKyzO04US4zfL7PVB9mFgyteRESLjC/6szCntq9JzVm696OXN/NOoez0LFV8Ra
	5e3xQ5fC8p9EIOfj3hHsXUsigki6Mqn4NeXUU4+TlvAf3AyaydH1znSuwgF7JowbQhCjzfAjoqd
	LJdpr12e32rNx192QhXQR4x+0zn3XfyyD4=
X-Received: by 2002:a05:600c:1911:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a180661070mr1425175e9.22.1791321948177;
        Tue, 06 Oct 2026 14:25:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1802cea1csm3575155e9.3.2026.10.06.14.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:25:47 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:25:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
 vgupta@kernel.org, guoren@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 arnd@arndb.de, glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp,
 dalias@libc.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20261006222546.6b667d1a@pumpkin>
In-Reply-To: <84b6f3c7-e498-4931-97c2-75ea5158b99a@paulmck-laptop>
References: <20261005120700.383058-1-brads@mainlining.org>
	<20261005190205.26f17469@pumpkin>
	<84b6f3c7-e498-4931-97c2-75ea5158b99a@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 Oct 2026 11:16:42 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Mon, Oct 05, 2026 at 07:02:05PM +0100, David Laight wrote:
> > On Mon,  5 Oct 2026 12:06:57 +0000
> > Bradley Morgan <brads@mainlining.org> wrote:
> >   
> > > This is v5 of the two-byte cmpxchg emulation series, reduced to the
> > > three architectures still missing after Paul McKenney queued the lib
> > > and sh patches, ARC, csky and xtensa.
> > > 
> > > The v4 attempt at these folded in a type checking idiom,
> > > (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> > > to compile. The kernel test robot and Vineet Gupta showed that idiom
> > > breaks real callers, fs/crypto/hooks.c passes a char * and an
> > > unsigned char * to cmpxchg_release(),  
> > 
> > That ought to be a bug...  
> 
> Perhaps it is?  Here is the code:
> 
> 	cmpxchg_release(&inode->i_link, NULL, pstr.name)
> 
> And inode is a struct inode, of which ->i_link is char*.  For its part,
> pstr is a struct fscrypt_str, of which ->name is unsigned char *.
> 
> But this is either a 4-byte or 8-byte cmpxchg_release(), depending on
> CONFIG_64BIT, which is orthogonal to this patch series, which provides
> 2-byte emulation.
> 
> Therefore, I see no reason to hold up these cmpxchg_emu_u16() patches.

True.

David

> 
> But please let me know if I am missing something.
> 
> 							Thanx, Paul
> 
> > David
> >   
> > > and the conditional expression
> > > then has incompatible pointer types, which is a hard error on gcc 14
> > > and newer. So this version only adds the case 2 dispatch, the
> > > declarations the architectures already have are kept as is.
> > > 
> > > The ARC sizeof bug that v4 fixed along the way is in mainline
> > > separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> > > to use size of pointed type not pointer"), so the ARC patch here is
> > > only the case 2 wiring on top of that.
> > > 
> > > On the why, RCU previously used single-byte cmpxchg(), which is what
> > > motivated cmpxchg_emu_u8() in the first place, and Paul has now
> > > queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> > > it into the architectures that need it is the missing half, and
> > > there are existing workarounds for the missing two-byte cmpxchg() in
> > > the tree, _Q_PENDING_BITS for one, that can make use of it.
> > > 
> > > Per Paul's suggestion each patch is standalone and can go in
> > > independently, they only depend on the lib patch already queued.
> > > Each one was build tested with the real cross toolchain, ARC with
> > > arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> > > builds Vineet pointed at, W=1, with the macro instantiated on
> > > u8, u16, u32 and pointer types, confirming the new dispatch is
> > > reached and no new warnings appear. The pointer instantiation
> > > covers the fs/crypto/hooks.c case that broke v4.
> > > 
> > > Bradley Morgan (3):
> > >   ARC: Emulate two-byte cmpxchg
> > >   csky: Emulate two-byte cmpxchg
> > >   xtensa: Emulate two-byte cmpxchg
> > > 
> > >  arch/arc/include/asm/cmpxchg.h    | 3 +++
> > >  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
> > >  arch/xtensa/include/asm/cmpxchg.h | 1 +
> > >  3 files changed, 13 insertions(+)
> > >   
> >   

