Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BF53D9672
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982709; cv=pass; b=U/zC9FM/aeVRBz4cIHGaKnYgkXYyj94Nnf2F+TUaQO6UBa4MWmRGVlpdbznwf3lCQjLPPWNTAgR6mgwkjme2ju6ChzJcaTuDXey90zSE2ai+grQvkjiAhlDNoAJefnjQp1VypX+3ZBy5ulyjyOtwcgRg+q5/c1MAbfWOfYCYMb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982709; c=relaxed/simple;
	bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROnuLeTdhT4niFNo/yqVejEEZH56SiM/RHE50LnksSn69sZMX75KxJSfstwZbvDGU/uLtUQiNJpeFSp9XljhaX5E+1G7uFedbdtKtZ4Kuz5djYXb874Xqzqz2vhh5UKf2vu4X7cvyTrW4WUJIndK3MQ88EYMb4M1FtAE16gbqEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9V1mn82; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9V1mn82"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed441so1081016a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788982705; cv=none;
        d=google.com; s=arc-20260327;
        b=b7qXDG6eFv7QDQxG870EXm0a1r9sBmsRNxJpMs5Y89slpkIabAfDYLpYdjYuNp/kNc
         ZJOSg9edtDph2nJfBG3rU8C9Kd+yUB/2WGFfUYpNhs0x5+G/fwaYDM4pQ8DHKEAHmX/h
         7SGUdK3G8hVHkI9nVj31HO+FQlQ14adsERLdC3g9ijh/DHmwBIMUUFMPg3CMO+hbw60s
         +CN+m5hfW7kT4WKYyJun+RRpGi1lZbkDEtXhlKjTuZsrdhM2r7ejzdGe2wRxIxnuZkDV
         SJhHe3sOmeIlY1+kRJdaJYfRXccTKDKQ+7Ftu0CRxDb2VAihuXwy0MB1gTu6Y1CaR4YP
         AAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        fh=xLN0yspdDAQsSKMC8ehN4zsOIfiNHRIf/fU1Ne5j3xY=;
        b=KtiGpbHMWavteVN5jCDwfm+wLKk1nFaR/8qcLymZRJNysvlX4KCt3tHR8YwzmjR2K3
         YYDuU1N9h9DQCFLWF7b3IDuUmu/h7ckr/PQQ6UjwfY04Bovv1NVi9mf4jw3dcCI8uS7i
         /N7KcckMcwE7rnHqhZnw0So3JtNSzVByE0eeYk8kUaQfIs29vW34skaOo8OeYdjELIIt
         EmYeABCEeEqvuWf25ozSOwPMZ0ht7mmFGtG9yU9VvuL3Bfpao0SGmwXIo7E5nKfdhkfo
         88kOn48c2Am2CTF6J9l9A5OCDGP4Y2zVisJh/r8jhm/537xGGgqvdHczPq0Zz+VhqUd1
         nxmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982705; x=1789587505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=O9V1mn82dLJDJpoWkpJ3uIqIF6FnMmw8HKITWUuf0+5gF9tsWFQvJeqtuvXWVufZ6M
         WV9sS6d8PY3FlMamLDg2/HWYu2ToFT5hITdCpWxDuCc+cL4fMdLCp5VGqvUOnJ6dXJ8C
         8hPDf0onGOvKjlaqh834XmZcICJPaGL6gkNzUTEND5TaAJdRp8B3DRjO8U5MgUy+VG/i
         vNUxzIuRGbgs/dQsoZjiOkN7PDRGh1JoMmOGgnGAj/YKMASmOnNmAK7yaZfExInbXu5a
         EyCvSXz88ovLxnHrYgc7y7jmMl60j4R55wVeecNSwYBDDPcZ8AeLU6oDoA0MRQqGMd3d
         95Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982705; x=1789587505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=U6Niba9CfUNU9NFtd7xsCVTirxi4l/KVdEie5d9O2kdz0p7MJ5H/IlW0An35lFrl/j
         6SsgUJCYwu1F9Ji5r9PFikFrkeeo8givXbCRBo4cDg0WFluD2s5ex/hEuUquK9fcyjpi
         07rGxE5a3jI1QBuPWb0KlZLDKqjclzXmevGHbaOAd7thZsqjoiIdTwtimTJYl1ykPC6W
         rc4jc74aMbbjpIIzddq/vReOKo59r+BIVYOknJqQMVfxRHn2dquS/PnWMRZZNpMKpBFU
         rnhnla+1Mide8Sx8MrT7xmMNiXA819k8zp5xZZAhQfBh5GHrBBpKynu/qWjTNnsHOw2u
         imJA==
X-Forwarded-Encrypted: i=1; AKwUvBzsfShv0pVNEEYyqzjM4wfIFOT3VxBg2gcO4owpk33y83jJItzd1N6Xj+vhW/eZWsSPzF/qheZlUV6clHg=@vger.kernel.org
X-Gm-Message-State: AFuF++lbjliQKPoviLaGKcZOWqYsytG31yPVW0bPEeWrSdlRCMi6RGj4
	Wd0ROhSkYBIPTjFCf+o9RJ6U5Cl5wtPYkBJVdDatA/Vh3hdbC5oxRKIMBZRY+Copjrv4ejjT5KQ
	r6JBcKb3JAv02uU5DGmwdIRpuQEfUEV0=
X-Gm-Gg: AYBFou3L6qA4d5oWbH9SzXICAJZnMCn5tqPDDaFH77ND14CuWcVg7gsC5jUu5iAFM+W
	DK7JIT3ynK43a2kwR+XyR0iZEGyZufaYtqfIZwqOhkCkZehMmtXTmXTrFLPu0LAWvWxg+1TA+E6
	ySc2UmrD+n7RA/RDnTFoXxeFrJbPJ22K/++L2IRsp0Q0B678blPZ1DbQ+ezlDU51kTPnt701vrA
	Ugwch0DPEHNbkV5IbvRXG2Dou52c89ydvutBXIpM8131bR5LbTnku7A4wj8WhdhXRpp+/eRt3K4
	YPki48AVdhBPSLV8ssQNb+hQmED1ijTwxClUUppYQ90OlG7DVOa075Osd0YYYqR0P9/R52NQE6j
	BHjJvHHY3NkSFGmp+PysXll4nFtjVXzNm/qTpnxUe9ygDnZXI9mVRDQ2bynYSIKEKuBcFDO2eBk
	u0awnE5ZR5sXHX5HiYrzhk/cux1O/+sZGGjtuwrdQN6bJoMNn23gw=
X-Received: by 2002:a17:90b:3fcc:b0:39b:3505:c72f with SMTP id
 98e67ed59e1d1-39d77b83048mr824934a91.6.1788982705356; Wed, 09 Sep 2026
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
 <20260908071911.GU4120091@noisy.programming.kicks-ass.net> <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
In-Reply-To: <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 21:38:11 +0200
X-Gm-Features: AcwNN1V9A4D3jn7pum7crGv8bcA9jfLyy60O95H9hOe-jZGhQ7AzCwKSAv7z5Dg
Message-ID: <CANiq72=T1487Y7TpAa4c2eTJFMLHoe5Qc7+tRkbkmvrDjfmuvw@mail.gmail.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:33=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> It was going to happen, and now we'll have to suffer the instability of r=
ust...

What instability?

Cheers,
Miguel
