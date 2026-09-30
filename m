Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EB14F4047
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781424; cv=none; b=GKCbRLlAs14jhdgY8KdOYk398mLeYyNADBKVOKs8yaTBfHFgrRjdtMfFJ1TkVxCsXmEegYtSxZggofZtCYasNWA1zmgHE9PYXtaWXpqQG5ZcgN0TYeoUwCD9hRI8rBX6gASGdTsrh7Xnrc7fquwKtXnPDoQjWeWQ6Wp1EzNp5VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781424; c=relaxed/simple;
	bh=yDrsOb4hwWXIN+T6cItrahv2HmKPc/RBpYKbK6q2uSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFDGC85+sxB/im25fy7V+7Am9U84u0fKazG6IMRc9XkT2IZ9IH/DcmcDpclA8FJOT6FK+5Ss+z/Y04PzTVc1SsJ1dJy8zZynLz3YzXflO4D+e990ls7lXT/h1Tnv5JGgtAOheP2HS1xx6GiZA6dCMwNoFbvbqYr+xxFp6qJdzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=lif9OX7R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lif9OX7R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF811F00898
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lif9OX7R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790781409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YhJg/Vg0kUrlQnIKq6WPQNTQH9OtFetyfT9AbDxDuA=;
	b=lif9OX7RWafdyPA2vmfDWOKBdoGlxav5sM0R59juNsSHRGOJ3cLGwIQADccYOr0Es7uHaM
	U2JHgEuRoM4HW2gbTSyzrG61iftYLSVR+tHEfiptGXjcTCXFxk1AM8v9PuFV6tI2DiwHi2
	rpAspPBUZghSjKDFVGIGFAwuxgjbmY0=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id ed57e3d0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-kernel@vger.kernel.org>;
	Wed, 30 Sep 2026 15:16:49 +0000 (UTC)
Received: by mail-ej2-f19.google.com with SMTP id a640c23a62f3a-c2940ff2313so158442366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrEIY/KcSV6n9PIyqGxybULu4vbwde+fZTBckw24U7GHW3m9jhltzmLFLVaY2eEL8zi0dVSIO6R6ufA78=@vger.kernel.org
X-Gm-Message-State: AFuF++nVgxr6aY2Bb4xO9gjtxDe8fyyDvoMmEuAa4kuo7H8VxjVq25v5
	g5I5PGEteIrvcKmMVZiBc3Ru42LMhEQ5yu2Rh5M4KILgmZcGWzl4Did9gU8aTnGXQiitkSbdR3o
	++j85YUebs2YRUAF6rHtGNR7IbYzNJk8=
X-Received: by 2002:a17:907:6095:b0:c29:c575:de84 with SMTP id
 a640c23a62f3a-c2e240ee3f5mr135965366b.8.1790781405942; Wed, 30 Sep 2026
 08:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com> <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162> <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com> <20260930151337.GD3142230@ax162>
In-Reply-To: <20260930151337.GD3142230@ax162>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 30 Sep 2026 17:16:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
X-Gm-Features: AclHuK-3j-Oh9f_5JCjhD5NbddIhsNHXCyGk_sGVp-iO-7Ny0UWZ0eR4ti5Aiu0
Message-ID: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Sep 30, 2026 at 04:44:29PM +0200, Jason A. Donenfeld wrote:
> > Nathan, would this be okay with you?
> > https://git.zx2c4.com/linux-rng/commit/?id=3Dd216701724b7d8209ff4215065=
8ad5c712bdb503
>
> Can you stick
>
>   Cc: stable@vger.kernel.org # v6.12+
>   Closes: https://github.com/ClangBuiltLinux/linux/issues/2183
>
> on that? Otherwise, looks good to me, that's basically what I had for my
> v3 locally.

Sure, done. Also removed the now-unused array_size.h include.

Jason
