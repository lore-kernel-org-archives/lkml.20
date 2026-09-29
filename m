Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0830B5383F8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706267; cv=pass; b=BWLqzX2KtSXVBbVYI0uzyZoiGTvSXGjBkKw237MMZkfhBoNXKSSRiKSJTg9kS6QmfidANJHakEnY0VZWO5z8lXgPmIWhQKH2/3LoAyIbvOvjcty5sd7Y9Hf3CD30nkJHVP5A5SPhgWRP7lLoYjVzSQJijndjVv2TGC3BbN5eLIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706267; c=relaxed/simple;
	bh=xsSYztuAQh102Qqep6rxJgPu9f3AocHSYQyuiCkTcx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKQaNXSKQmGkLFT/gh88qUjtqi5xI5puX0oyaf2QK91t+oI/rsB2jBPG5OP/VHWEr/N+ysVEdl4scYS7f9gCY7eMjKPE2vHzRtOoE4XkpiBe/KqDCh7yds7xxA6Pz4AFDuZgxmdX8t4vDEdO3gMM5nIkIagHpODfS03ZpAtGOhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=spdpEB56; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="spdpEB56"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso2315661f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706263; cv=none;
        d=google.com; s=arc-20260327;
        b=CCl6mjDLR42UKGbIpIZ3n70eoiPdLBb/Ha5yMyeGYmcWSBHhCxgKm0FtSd+avqjxLT
         2fojtDdqVjD6T3jC5PtLEdVoyB2TnMxxoCeI62DcjYFM3RyCW5fIX189ZAMypjbnfbHH
         5Pjnvd9MJwXBJkzvBC3/Ps2VkmhNnhPMCeAvDQP6c1jcYYxw7dfTyr1zAaXkn8zc1xtR
         OmGvsMi+qvQxxiSXZ/KnLZWWIV5RMuzMcuoiF7E9jbLFIsvyyD5FqkcUVS42V2/+YNj3
         UMppyXHw88ilUCOpm9cw60+hkBZHaBmMOv808j64lAZeFXdQtG3TVqJM/MM6leNBPk3s
         MSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        fh=0KYKEq/6DJpXY75lVqIaM0KbvdeAswlGz+Qirn+c6Uc=;
        b=QXVhQTVd009MvNE0ncbfRwuQQiHLbnksHLWwCne5ky7ETcURVMoKJkk5AmtDly6AWz
         sTrYuzrSMdRGU1xekn1DEaG8MAXwIRADBxbWoAHZdnGUAC8vZd4aLp3Mw+Cb+CGxiI5w
         5dmF9Db2u2/jk/puv1gTvUGNOSOgJiUAZQtRWO9lFkOJEUdCHAmOWJdx1kIxY6TRYOaT
         7EDE32mIYiJ8VlRE8QMqPQkG/hWS/aT+svPig1RUcSKMPolAQD9ReL2M7x7/coRvHlDw
         9rWMQ5M9EsiIB1owm+BBhtQKnjkHNJa/YG6WL6/cKEk3XF6GhHbi/YtQUrBJnptL17RZ
         +zYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790706263; x=1791311063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=spdpEB56+rKMqGEDcpJk7aRVCrIHKOko5tqBZAefuZgvsdITSL3Rp1fYO3FTzIo/Qt
         EJmpKxB/DL04SvrO/S0EgJvp7d1E5+uAe5KcxkivZn9JvJpKRiV/xcPODYO+vy7aQRd6
         5yPcZb4OYvHcTxnEgm0E8TFDZLNcrJ4dT91t1xg0cyDr7OtwG2yvf9mHZM2pjlwE4AGn
         DC87WB7P0mnzhY2hswg0zV0zJoSde/AQdDqpx88gfjqBUqSVUyrfCeFN0yphFZx32SXP
         Z5QWIYn/JW+pdjhCk/zW2VXPib+8lMttbCjssnRG0ZQR/UhkRCHJ9mhvzbx5Z4eDMmkA
         Ar7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706263; x=1791311063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=UhWA3jBBdtiiB3far3w8ySXtOZJZ8DH+j4AtoQQkcWzky0uWJmWmigCfC8J0hA6Ot/
         MQwr9abAp4amzwLGDF52gcQGyh3dHSMRdX3iJReSZgMTtNKtW6xJ2cgyKf4qHzTwy5MD
         s1bcid/0E3rlp/4EllJK+Pbw713jfTPXtuKHjs2VGHgmRULbrHA4BbTn3yfQQaRtnemv
         mrtX6KWxaRZNW4k2HQ4ojh7IGwlR5R9BePeYtVyQn3VmZrBPav12QuetuE1RIPqYItvF
         RDPy+7chZ3IKmQ7ITky3+FEoMmNjcl/dkH4FnLiymi3R45Il1uxDXaFOCdkeeLM1LegN
         WiDA==
X-Forwarded-Encrypted: i=1; AKwUvBzrNm0fAIG+ckuGN5EitKpHtyK0grgja1ghs99XSrGtSDUgfb9uldxkmo+DgIdhsJ46D3IiwsDDRaNDbRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkxLfHPNBeZLXcCOfRa6UmePl0k+rghMM8sZDRQ8W3BHlIkqpK
	daBKqgp++EAxvwyL4ZTrzWEBuLUdG+k7omxV/htJtHCoayt4j5CodGGLT+0J+Jy7MZ7xEMq60FS
	MGXOiB/aX+xaj+RCM9iBoRm+mchiQg72ONHe4iWPa
X-Gm-Gg: AYBFou04B9YHgLKDvtFbdQRY+EJt3J1F8YLIV+d4EgLbsj85Ole6NoQpMpea3NlAqhm
	gd1ti3yP96yBT/KQ5MyIBPU9aRNe5+DqTbtt4OtIugXHEl7MNW2BA0+qdFd6zFNMLygzSuU6ity
	McifMvzV6aWMsmL81oBIAIgqkTG2pd5Aqhojh1GAYrhl1W/lXp9mOLO/HtydSX7b4rYEoSh7QXO
	OKjtLGqcIRyN2CtJmv2JRZO9t1PH68tgAqYx4H9Z3ij9MNgzL4/WKasz6BbzcZqi6WmdMLHVIKy
	Xx6eYehA/lYBnENexvFGOcQdY8/y3E70sBeJlnJb3IPXQRF6bPnVH/Vpg8lZhryay1YMxTTIjGn
	CVNFk34OkM7sCUe/uEoiQZzlV/I4cMhukMAZaiNq4iZLHHgT4b8bXzVMYbAc7nv8S44U=
X-Received: by 2002:a05:6000:2381:b0:48a:fba3:d5b6 with SMTP id
 ffacd0b85a97d-48afe7ab8dbmr265943f8f.56.1790706262469; Tue, 29 Sep 2026
 11:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
In-Reply-To: <are6s5e6On3hpD3M@zx2c4.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Sep 2026 11:24:11 -0700
X-Gm-Features: AclHuK_OlHRHmRVZkjU6Ad7ygjuA5O41_jDQwI5Gzaif3nG5KjlJX6HrrO4nUUw
Message-ID: <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Nathan Chancellor <nathan@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:29=E2=80=AFAM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> On Sat, Sep 26, 2026 at 12:55:34PM +0200, Christophe Leroy (CS GROUP) wro=
te:
> > Hi Jason,
> >
> > Le 26/09/2026 =C3=A0 12:02, Jason A. Donenfeld a =C3=A9crit :
> > > Apparently not on RISCV, which is what prompted this patch in the fir=
st
> > > place. So I suspect Nathan's v2 here is the way to go.
> >
> >
> > Don't you have -fno-builtin on RISCV like we have on powerpc ?
>
> I think Nick mentioned this led to other problems and didn't exactly
> solve the problem.

Sorry, been very busy.  Getting blasted from a fire hose of AI
generated patches to review...

arch/arm64/kvm/hyp/nvhe/Makefile has this pattern for exactly the same
problem I suspect.  Maybe that's the right tool in the toolbox?

```
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makef=
ile
index 8dbf2532a573..27fa72d8fb86 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -27,7 +27,7 @@ asflags-y +=3D -DVDSO_CFI=3D1
 endif

 # Files to link into the vdso
-obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o
+obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o ../../lib/memset.o

 ifdef CONFIG_VDSO_GETRANDOM
 obj-vdso +=3D vgetrandom-chacha.o
```
Fixes `make -skj"$(nproc)" ARCH=3Driscv LLVM=3D1 mrproper allmodconfig
vdso_prepare` for me, as per
https://github.com/ClangBuiltLinux/linux/issues/2183
(Nathan, don't forget to link to that in the commit message)
I'm surprised I didn't need -fno-semantic-interposition (or one of the
related flags... -fvisibility=3Dhidden)

If we want to get better, (if performance matters here and we want to
trade source+build system complexity for absolute code perf) I would
start with that, then worry about clawing back performance via things
like:
- __builtin_memset_inline
- -finline-stringops=3Dmemset
- -ffunction-sections+-Wl,--gc-sections to dead code eliminate the out
of line copy of memset, though IIRC there's potential for wasted space
due to alignment requirements (maybe the out of line copy of memset is
smaller...idk)
--=20
Thanks,
~Nick Desaulniers
