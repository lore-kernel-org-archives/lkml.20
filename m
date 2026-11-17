Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897477;
	b=Uy7Gqze0VIDLWHwpiVjyRXPMjTiugaPZK6jrF35XHfyaDLUnlvJQVDA1695xhZB0Z4ZZ
	 8f0d+0vLpSNaH3k2H/wFEPveB25VyP/fFnUt9x96Vr3iJ0eyKjkcubAlUnaaqzTJmrfST
	 3xC6QtzEUjWQwBXWfEzw7QeawqvFr7mFlDlIETl/MGX1MnpHCUeuX4pQXJdebSqWufHQM
	 x+NZ65j6gKTbXPXT9g6JGpK4Y41KMN7LF/2MckSEgcesi8iE1lVcdda2HL5tbfBMoSTaQ
	 4DJ1yRoOWRonJwPx2kUeYemrmXQZr93shvEFd2MEUq0/Ilm1BkGBrmEqgGgWVujlkcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
	b=CD07zpw10mLktck6jVZheFhW4LgXbDjPE8VyVmQMSFI2jCkcokMojYsLt9H/dHoDwQxo
	 oCsCs2rtOij9OlLzo6TQdg9aIiZ/eCir/ufwjz010PziNeBuX/70MpfHN1AsjdLJ9y0gp
	 ZFHgZrCyeGAqaa0euDKiOlQSUE/noZa6mtwyzdW41fZeg3lh1ZMiDS1fjpVD4hKuyU8UA
	 ut5hgTS+fBN4IPYRnEa6X0LHhso8vra3Nb2rf+RUozIWGKuo2ACto5jD/5t4D1Rjug7Rh
	 V1WJzU8LtBZTGJaRrdlMTkWmPODCB6WDdrERTsE8m4q2cpNETfObria+9FugLG31hcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZw3HLQ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E59606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E59606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZw3HLQ0
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso6093001fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897475; cv=none;
        d=google.com; s=arc-20260327;
        b=MeEF7Hvs+HN557ahT/6/cOxnBl+IXPK+GDU76zsn08G88f0sQSdD1dsCObNS1G5bl1
         KIdpFSBBCxt9x+MMHYt3trM14XLnjD9YOJDCGDTc/jE79D89knX6DyRpziiT5RcrUwi+
         ZCpW77kOPbQGlbdtCdaLBJj5T6rRc+J//VkHuPZKnh9hE55X1TlCN8bLJvGQEBBnCVg6
         cRC1MvvGSOwuLL3K30FBWwpt9z4Tb5pjP7wvDdPK8F2Bz3fmfTBeEk9d6+ePqd7kH+Ef
         s4vD8oXgFJw3L+J/ztl7dSLG0wL+maV4/IHZg9R8S47y68bHRXn1C+tncbzn65VclqzO
         j8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        fh=0jptgYaCijy/tR4Nbbvmtslb0CRV6wCOS9DOx+9db5I=;
        b=FYSJLd0VVULiOuONeYNCXktK+yKMhJtMTMg+Yt3UMl+kfqCXHDbEMJym2QVTjup0dV
         odfeGVLvctapl1nK21E8F0IhDup9RoTlsibhmOfhmgJoT6KBuiyS7tbkiJ9NTw0AqwNQ
         R/hSLw6aoDjYBYvhDMF9IW3n4rRNOAK9LrS1wm+OiW4eGKFFVPwSvpJD/fZYu4ZJKsZ1
         ECDQhHmJA7E9nxPaPFecYwmifu2YKlYxeZ4tTvMl/dTa9PQ9HvqrFSocLS9+hwOQNHBh
         IMT8+jrsuHiksUwD/fat6djFBmQSGEMArblhtH7cyBPxGNxGeH+uPC/KdChhSniaBhYQ
         mqpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897475; x=1795502275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        b=fZw3HLQ0nzuknu6xZZPoDZvl/L7k7TrZwsx5O6x0BB261gDfe1j2et0Foeg5z5mrdz
         pdov38qEG4e1cj1Xgv+BF7QG8EpS3uTPToJ/cPxM2P3pBo1pKt88mp1j6l8Lr9opRwrT
         UQol3T/ikaaqCg/kx4o+Pd7HKYdjzlhzq7ad2AaU1FYx4ATArJAAzvoJ61gTlvmuHGY0
         O6JvkVZ1OeI8Wuw/z/I9wPty9+oUFsd5ZIVwdZbnK2TVy5pfasGtQ3u+l7nglYvngY15
         oFQLd6ZP6sSDU4BH7A31BLLxMC5vw8UQ7K+BTZZJadCh3+IJ+RKhSEbeZVDIcTdJoU7H
         innQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897475; x=1795502275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        b=t/392g9xGPxDKSTknHpDfNvooAt3WDMsWkQyuU0GczxBuQKo5LgxNDx77qGmvkvXUK
         jSxHvVFg55Lx4iP1PnuWinkHUhQqFQ6II+6+/++3bCORYk4b9NzfgjGug+Qy3HVlI6NM
         XSOTJcw//z8a+THdiBw88Au/6xlwbvGrR8MqBuvcPlSWH9i8D7P2zhxL35rv4q93F44L
         SJ6Hi8ujIXRW2eXlLNEQ7eAKf4sGx5u8uUbW315gAeCjXxRf+Y9CuHtBtf8Cc6/UwJpW
         b7pRG5XQGBd8OYJM5ENjHMDl9W3yKHdMEIF8IfL9tEDukHT672PI1HrxxjG9tBuwwvgK
         ffxg==
X-Forwarded-Encrypted: i=1; AL+hErHzNOwBVVGy9B+2iwJTW4edzgRncLQS8i6Po4NzjodP6+3cpkKBeP+Wpdmvv3egkf6AVBmN5BCFHLivV2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uoOVXrcgan3hLWV3YlJdX0SNSz9uag3BB8fbCcHahWTgeb5Ws
	pxIZgYB9SPGin/KqMgUaVyJQwhXdK/DrdMmzwG0Z7xEfnqEWJBd4X8OSy0odVDyXXEAlwcmkf2/
	sZzDL+VgHZKiCsOOBG1qC07xuBK69pyc=
X-Gm-Gg: AYBFou2zeJXVgwGHe1Inq2E8RWQrJTQsuI/st+vyj/kqpJoCz2suR/cx1LryALGS9zG
	Dwxgy7WZ51XL7ooQQlbTzsbXAVLwK8IybGaNH6a1PnDG274svCPnHMMUY8WXJWG2pTlp4yNarv/
	06v6gNP4DZ/4fN1n6GrUgHQcNKeU4igTMpm57VGEHzHIcP9a7bAnOOnj5mLJQOZpxPXq1JiZSA/
	H/8UDIjhml7XXnPRMATTfJXyLTdrJOrhCzasYQyuPkbKNXfjBwUgydvoOpOkcfuy2Swb4YOQKM+
	2GFYIEXY+N/IzXQKX646Sd/r/6Z19TgG3uYzOtXxGzxM79nPpuzU/dIxm0pQFn+PbOxHCKUjmE9
	Q6Tup1Re5qqC7pziGFeECThfUkA2uGZS1RO6VMCABm/hPwXjkgf5nWPxQ2L3hP8PiDUI62Q8gd2
	OQhDeVNVdCvPbr9ld/8lLSOvQ2RBINcfIb2enjqhCRDDP3gLcTGkq4cnDSoG++bLjG2PQ+LXvPT
	PqNqztXyQRyE1tZAWwwAKxO4jvCofbEE4EuhzKA6hE3CyeD/zz31AgchBIf/wjPfsz/EROySw==
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr5667796e87.0.1794897475024; Mon, 16 Nov 2026
 22:37:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Nov 2026 07:37:43 +0100
X-Gm-Features: Aa3M54p7eBlg9yL8nKjCRYF_cKn6fvAcKLXbakSS16n9mf6XS8H5ekFNr6S-Wr4
Message-ID: <CANiq72mrpgxyb4d9C5p1KS0n87GmYTXcyUX+dhZ39T2vRtOQwA@mail.gmail.com>
Subject: Re: [PATCH] x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The C compiler is asked to add a `cs` prefix to the `call` and `jmp`
> instructions that go through the indirect thunks for the `r8`-`r15`
> registers, which makes them 6 bytes long instead of 5. That gives
> `patch_retpoline()` enough room to inline them, e.g. as `lfence; call
> *%r11` for `spectre_v2=3Dretpoline,lfence`.
>
> However, Rust code does not get the prefix, e.g. for a
> `CONFIG_MITIGATION_RETPOLINE=3Dy` build:
>
>     $ objdump -dr rust/kernel.o
>     ...
>       e2b: e8 00 00 00 00        call   e30 <...>
>                 e2c: R_X86_64_PLT32  __x86_indirect_thunk_r11-0x4
>
> Moreover, since commit 4a1e02b15ac1 ("x86,retpoline: Optimize
> patch_retpoline()"), `emit_indirect()` assumes there is enough room
> for the inlined sequence -- e.g. with `spectre_v2=3Dretpoline,lfence`,
> the kernel warns and dies while patching a site inside `core`:
>
>     WARNING: arch/x86/kernel/alternative.c:736 at apply_retpolines+0x2ee/=
0x400, CPU#0: swapper/0/0
>     ...
>     Call Trace:
>      <TASK>
>      ? _RNvMs6_NtNtCshS2CUL9MEDn_4core3fmt8buildersNtB5_9DebugList21finis=
h_non_exhaustive+0x5b/0xd0
>      ...
>      alternative_instructions+0x1d/0x60
>      arch_cpu_finalize_init+0x5a/0xb0
>      start_kernel+0x1f4/0x280
>
> Similarly, paranoid FineIBT rewrites each kCFI call site into a fixed
> 20-byte sequence, i.e. the 14 bytes of the kCFI check plus a 6-byte
> call. For a 5-byte call, that overwrites the first byte of the next
> instruction, corrupting Rust code:
>
>     SMP alternatives: Using paranoid FineIBT CFI
>     ...
>     Oops: double fault: 0000 [#1]
>     ...
>     RIP: 0010:_RNvNtCsdVypMZsLRAh_4core3fmt5write+0x1e9/0x210
>     Code: ... b8 68 81 16 9f 41 3b 43 f5 2e 4d 8d 5b f0 75 fd 41 ff e3 <c=
c> c0 eb 02 b0 01 ...
>     ...
>     Kernel panic - not syncing: Fatal exception in interrupt
>
> Non-paranoid FineIBT is not affected, since it only rewrites the kCFI
> check and leaves the call itself to `apply_retpolines()`.
>
> We added support for `-Zindirect-branch-cs-prefix` [1][2] in Rust 1.91.0
> [3]. Thus pass it for `RETPOLINE` builds when possible, which makes all
> sites indeed get the prefix:
>
>       e3c: 2e e8 00 00 00 00     cs call e42 <...>
>                 e3e: R_X86_64_PLT32  __x86_indirect_thunk_r11-0x4
>
> The kernel above boots fine with `spectre_v2=3Dretpoline,lfence`, inlinin=
g
> the Rust sites as well.
>
> For older Rust compilers, set the LLVM module flag instead, which
> has the same code-generation effect. This means that every Rust version
> that the kernel supports gets the prefix, that the kernel boots fine with
> `spectre_v2=3Dretpoline,lfence`, and that paranoid FineIBT no longer
> corrupts.
>
> In addition, add it to our target modifier workaround for `rustdoc`.
>
> Cc: stable@vger.kernel.org # 6.18.y+
> Link: https://github.com/rust-lang/rust/issues/116852 [1]
> Link: https://github.com/rust-lang/compiler-team/issues/899 [2]
> Link: https://github.com/rust-lang/rust/pull/140740 [3]
> Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
