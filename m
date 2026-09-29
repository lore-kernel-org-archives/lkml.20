Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636885437FC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703868; cv=none; b=INd6EZuHmYN56FIdtSWVipUiDDPgEPWXTf3ik64SM4Zj27pjdTUPVsFgbpGb/e95F83xGJW0YnAm3Tvzpni8UHPPagAEuvc01+ta98QDsyTo87C4Fdzr97K58J8oZCXFpbP4irgVeWreyNDf35GU4jnvwQcAfLFLZCSFNk0LTGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703868; c=relaxed/simple;
	bh=0xBkcPblbpjG4vkQkMpJRewja3D/3gtloFXrU9YBVy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dfryeynxYwxpX1503w4K4Pcq5+JzZ72G2yHpHBuPX0JDNY51KQR9FxOULi/Qrfs64B6JaoGBw+Ky1A/wMf2JnSlGYJJc5bsoqf0MR1S5Ay7hH8QgombJ5a37xFTkQNnQAJkGcSfSUZEaWWhtNIsHHmPENIFb/7eupwosw27mRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at3cWKpM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at3cWKpM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso18134565e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703864; x=1791308664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=at3cWKpMhGKj8d+1+sqvMlItz70CUXrkUiivMhFNZII1Utz24VaNNZEW31ohThwo2f
         PDFYEGDTa5uSmd7Cl5FcwfCxHUwR0n0wQgeY2PGZtlHs9u0kyvaTHTYj3ue2tWCW8SZp
         y146QBqMApBK9L6BJHy3Ls55QWIcVruXpBR3yViRPUoXR19yXE3oiPp3u91/rYAc72+D
         /rIvXfGnZJ/SEt9KohJUaGHUuAV25KXNKQRjA+oxpWAzYAtfmgRHvjrl0O+fs5FVC8CK
         oBk1n+QFMa6a//dDx7Ge5rXzjwYmYlbhOJUtg+W/HTkWD1SlsDVcz3TISIpIVaGTZCPa
         M+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703864; x=1791308664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=TRX5VrQ/rBhzoIO4r9eVG1K0pjfjLfqh1VIKWaEqoyZKbbPoCLn3CW9AmVjB0m0Vuu
         FsaNRCpfq1AHUDY3nrwyhtkivgpFMZMCrfn83SSbzTsR62sd+17QKoBdAECpGObDlgFO
         NGlIDOlabd455cmSAI8cXf7+A2gJf8wCBQQy2HoJv4GWSwraUnRepuow2sjJBA/i+A5A
         PMx7MStg8QajmbKc51rQJjOPx/jEJulcEMX3lBgoT6fvY8hmSSRDC00MV3pKwIi2YaBg
         /zjAbr6zvG4WyLH9wb5mUgHUavBG85UbDTDnfm8ZogHugFok7R6wGJhUUftShs1Jz/Zn
         osPw==
X-Forwarded-Encrypted: i=1; AKwUvByf9sRaiBalHCf1WByILo1HxqJssGSLZNGFm4y8Eh5HG1a112Rizz6O3UI6n8Ei1gnd+n3EnA4LYFRBLeg=@vger.kernel.org
X-Gm-Message-State: AFuF++mcGxJPENPQDeblWkWnHXXnlzHvfGfHNa6ziMere3Z9S4DxtfhM
	/ZK88V70DzUFnbua9dv59eTA2V9y4K9qzRN9tCRg2FlpTuQRtT6+wNOG
X-Gm-Gg: AYBFou1FQrU+UxS2v9WiPY404CXXqscGIU0dx4fkwxIO4riKvPVI3FFD6k1PJ1D1r1H
	9QbQRXY9nsZq5CuhK6k04uQY4ATPVZZvTdsRNdxJ2jWDBMvxlSIzefU2IQfm8G06J6LgRAKYmLK
	Mg79sFpfJKBzteDAWVGuPolSQli1DY8t/cy+I1jxsOOL9LFCDm/SPyRusMR68Cf2CyzbaQX5VUs
	ksd5Pstau++EXmoPm7ixaevHapoV+rYoYcZWFqEtaC6L+7cGOdcMfA71Ks0VliUweMsXnqD8VKX
	dOy5aDSIS+NyPee2chSAarjwXshvAUSBiZS5WB8hscbr56hyDGRCKPIz+5y54fIryFfF8fXqr7m
	4PXMBYUAchxVgBF8d15W7PqZTUXxPLbMxU8nft2RgKYl5xq/m8p1DoecccW+Ne9LB9w3U/AyBNy
	Oa1cH/8u2tKms0bYwuO5AEpwHHZUD5s5kKxSecpZl+y/HDGXhpb1L2tgXrvw/XJDi19eJhFZUps
	zdd4OO2qUNSxF3NzwHNEe0UUQD5Xqq6iEo=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr305056015e9.14.1790703863276;
        Tue, 29 Sep 2026 10:44:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm103285395e9.13.2026.09.29.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:44:22 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:44:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260929184415.1920fe91@pumpkin>
In-Reply-To: <20260929165939.GA1890629@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
	<87zex4ic68.fsf@linux-m68k.org>
	<20260926121927.GA1486962@ax162>
	<are7cfMIHZZn6jLz@zx2c4.com>
	<20260927080225.37534e7c@pumpkin>
	<20260929165939.GA1890629@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 18:59:39 +0200
Nathan Chancellor <nathan@kernel.org> wrote:

> On Sun, Sep 27, 2026 at 08:02:25AM +0100, David Laight wrote:
> > On Sat, 26 Sep 2026 14:32:49 +0200
> > "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:  
> > > Do we even need to return a value at all? Might as well just make the
> > > function two lines:
> > > 
> > > +       for (char *d = dst; size--;)
> > > +               *d++ = value;  
> > 
> > Wouldn't it be better to add a barrier() or similar in there to
> > stop the compiler playing unwanted games>  
> 
> Wouldn't that just result in the same code generation issue that Jason
> pointed out on my v1?
> 
>   https://lore.kernel.org/aquyVkdYceiWdckX@zx2c4.com/

I missed that one going past....
You only get 'rep stosq' because the compiler first converts it to memset(). 

> Maybe that doesn't matter because modern compilers have better options?

A lot of cpu will run the 'rep stosq' very slowly (it has a big fixed cost).

At a guess the loop is 3 clocks (possibly 2; but that usually needs
you to use negative offsets from the end - and gcc doesn't like that).
That is comparable to a mispredicted branch (and you might get two of them).
It still might actually be faster than the 'rep stosq' version!

I suspect the fastest code is to unroll the loop.
	xor %eax, %eax
	movl %eax, 12(%rbx)
	movq %rax, 16(%rbx)
	movq %rax, 24(%rbx)
	movq %rax, 32(%rbx)
	movq %rax, 40(%rbx)
	movq %rax, 48(%rbx)
	movq %rax, 56(%rbx)
8 clocks on old cpu, 4 on newer ones.
But more likely to be limited be I-cache reads.

If you are going to use 'rep stos' then you might as well write
13 32bit words.

David

