Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18F43E07A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494976; cv=pass; b=nzu6Adf04S2Ksq3vixJeX21xZzY2sKSnNHgwm9AIGG+erYxW8fnGFIunMo0o443DKfBq8N9czL2z1Y2PkjIiQKATcnm3OTFONCZxjw1HVYuw0mTpkW7YzXC2vZDfROr+IJOoBJ15Uoi3KD+WRSEDO2Bul0gx6533d1L21GUj1/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494976; c=relaxed/simple;
	bh=P7a2zFFMvnl7AMMV9J8HoSFvOnO26MuCDolXpy7oTxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPqYqKuZKfgkmTosdfWQRTyVxe3BHPYZ1SbEojgFdQP73zFAQWvCjTI16FAMM7Q06aeOrYoBhZoWhx9HBVHLvUMnf/NM5z86F1NiYvFEAWjaNqI2heCwAYaXEQV1Lv6AL4M0vptj+s250q/p1ywMB2hR/xlJLO/m5D1SCnNpU5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a6KqVcGU; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a6KqVcGU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48442ea8f59so535893f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494973; cv=none;
        d=google.com; s=arc-20260327;
        b=nt18xZ8fN7cG4eJIvZCgNdhNHSt5Ak9lq0bcyOMm8M8ZE5OtqKXnnMipT1+bYaSGeU
         rs0d13tjL0DQVZjcvN597JMqMRa6/aAvWcql1KObt3Uud9uKmRZYQlzH0Rn1O6IlShFs
         kzK8Rmz5ztvl+urOhLfh5DL7o4rhjYC3UxdS1b3z8J94/TGkaC04Ql6/e3Y4tBF6Llqg
         f/Q1CzoQvyvnx0x2q6ObIV149lUXo3hDnBErKEaSGEWnUfEN5qfYLFxEfXsJzMHbpkpq
         uxNmkuf/4YZNJkojmdDI+d814zMkHyPvc2NFRJk3MgZQy6zEUQzGwzNJX4RJVAEjr8+R
         qB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        fh=XmVg2iHcR98wFYSQYvvPM9YH/oSjx4K1c5GYs4rtibE=;
        b=aGs8xcZBFiDK9+Mcl9RAK5WGZSTjOI0vf0xf1eGmPrvUOK84ngZ9+RvKksmUF0O+s6
         BuMV5xcwEkYRY5s08I8jGXCp/PzXPuJRNOGd8g6c7udeKoDn4URn1ywTbC+a97v/hLTE
         7SKsLwpFNwkZaDNdLFhN/2TdFG9h+Ijih0i3iLWxBQdHPfLBZH9cx0EXdyoLVEiwJvIe
         EuiFdwirakLXVD+hhr3QY6OAEAUlxSJhW8GxpbXNwHJEGViOLtBCP6DAI07BXveqjuNS
         mH6BLWBMf9h/wG7BrB6n7IVxpt29/YY9RI9FuUtEqgeEAbU5NR9f3jD9teYFRn4xQQ1B
         A3MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494973; x=1790099773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=a6KqVcGUw2fLFtF1Hm9cc5yrvLvRY7YxPEhLHNJIfcavwgt1rbW5yhhfaSMX9+BAED
         DGIeBSCgb1PlyB68lxCyUYa/zeD7s7Lo+A6Qmv93dYvmxfOjOqiT4T0+b7iIrlo89kl3
         YmXf3optvEP5cx8oa/c2vYZz/Cpd/9YBfStzMILEteq521PB7cv0n4n8ZyMgrCmgFcCE
         lMSUEJYprCL+/e4j6Ny2nYOmfUuoU2z79ZlpeYGa4QTjMUcNXGJrHFAK5pWg2+Dyb0Pk
         ebFFkqcbAhZKuXXO3iWlS5mmW4BKwKJfkzmb/CfloFnTWbyEEabpV3Xv4BxGONXxY8dZ
         5NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494973; x=1790099773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=NKvUY+685C1HeHxbISJB1t1z6QGR41jsmpazGRMsyPaw4hkDQ8LCoEviD6iTjJ0+5p
         h0om1TiGYGmvAQwzHxx0BQ8gRtY6luzH+2Jd7SC0oSKPWsl/kAzbNjHiyTlPRrvzR8Yb
         n8sU61LlenvvyIeG/EEw8GALkdkhbOrIdif8Z0u8/rkv9Q1yI/ltXbYgdk+KxQtYfwMK
         Y7gOerOzlvO2x4xBfLllaccNfOnGdfVk64NiuEMEBzFFgUbJh5+5dJPilXrEputsq8P5
         RTDdAjbAKvZC8njsvXzqDRMBeH3wiCieNZGQRhTQ9n3+whrriO0NB4hfXslPxymf38Nz
         4qDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNs0fGkeBeQH0ENgiPSHDPMqewlwXBvQx04dNpNVtG/abErtj/6iVwdCSKgZUMWYVvtg3Nord2N3Ya3kE=@vger.kernel.org
X-Gm-Message-State: AFuF++kLX3YkOtMVf2xhKI5z4iPq0yLQPu1F9PguLNoeBS4n/Ddugjms
	bBHK+Rs4PfJz5XiIjxv0s/sb47yRj6z6kPgCBuLBIh1pvVjhfdg7jLIwM4QP8mR19pNulPjqF8o
	iYcXMDm9TINVpUTEAP8qalN/uQAyIWilZijzZqSD6
X-Gm-Gg: AYBFou0UkGt4w/ya+G2/B4unX4t0ZaqB+h93ghO4h7wvGyF0V+zhuLbVWcJQm54rFv5
	zErkBoHnMAxUXsDa5pJO5yYepgWXMrNelZwxx6nBuAF5h5a8fck/7BTy6amq7SazXgEQfIJ35Fk
	ZG806KL9eCn21xsQ/jxySF3VokKV4gwSqjWoNLPCUjvntGDagZZAJ2e/rebwYV0LofVMzAc1Jic
	5dbav+aylqvtJzyRxmNOC6uVTUYKLJZHSP/uA3rhSO4d1mpCto5eXmIpjeXV3B42L4ERo3rgI6W
	mCujlLIZYVGtgm+IpSJCndSGubQMNR5jRwpzqH1ct25QInUQ7jklgZXh8HfNJ1lCHOG/C42oOUy
	KbQ2I6/DMBHz/XE5lZiB3c+Y3gTiKEsDG60TMR7t/ztOkC+qulNgws+jxvuh3xN1g8Fw=
X-Received: by 2002:adf:eec3:0:b0:487:13f:4968 with SMTP id
 ffacd0b85a97d-48705b5d792mr5756089f8f.11.1789494972051; Tue, 15 Sep 2026
 10:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org> <202609141056.6AE2C82E@keescook>
 <aqkZvtAKWYf9-1ZW@gremlin> <202609150943.000EC9277@keescook>
In-Reply-To: <202609150943.000EC9277@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:56:01 -0700
X-Gm-Features: AcwNN1WPMMWK_d5_qt02ICUH5UNGl72dPPgrM0zv_mQxUiZh6yRKMNR6HBnx31I
Message-ID: <CAKwvOdms6QWc7RMW6hJb3qzgmpK+aw40C7b_h7eG161ie_Y8ZA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:49=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 11:44:01AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 11:00:27AM -0700, Kees Cook wrote:
> > > On Mon, Sep 14, 2026 at 10:22:13AM +0100, Lorenzo Stoakes (ARM) wrote=
:
> > > > Module finalisation on allmodconfig builds consists of a large numb=
er of
> > > > very short-lived jobs, and the make job dispatcher cannot possibly =
dispatch
> > > > jobs fast enough.
> > >
> > > This "cannot possibly" sounds like a weird LLM language intensifier. =
I'd
> >
> > Again that's my writing actually, probably best to stop assuming LLM no=
w ;)
>
> Apologies; whatever the opposite of the Turing Test is, I have failed.
> :P The AIs are winning: humans are suspicious of each other now. :)

Is there a term for this yet?  Cylon paranoia?

--=20
Thanks,
~Nick Desaulniers
