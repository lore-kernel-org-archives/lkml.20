Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1654CDDFE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669267; cv=pass; b=b2BFAHID0dQ7SExzuvNi7mG38fdtCiVnnBP+Jjxjm0TvQB9ISrDU4OAcanWKaHnQr6pffIpkAlWN511m6M8c/6rjrB+mpJaP20OkvThscLiBujo47lwsZWDzwmXPRBU0o1eV+MoQZ+eYrYz0wYj4y366KqLhcwEm+sOvI+gJ5+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669267; c=relaxed/simple;
	bh=MtIc2pB2Y3s8wxjv1B3d5i62dl3x9sVZ6Pg311mYCdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dS0Yarc5IuBhIlkn+vUwT3oPyo8OehG/6VsyjPXfqEXEdJR2vA2N4BGG0iICF2krLi/UCU/sThNyWEWM+W/+SDRl40Of42y3JU+Z9UvAykExXjY2DuNBaZUXq/W5cZ3TNhjR2TTtQvaSgIGC7jTAy30x3MXZ0Daa2VBPFMaJDjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OQDXuBGX; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OQDXuBGX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso6081505e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669263; cv=none;
        d=google.com; s=arc-20260327;
        b=aiuJa4qkwfibfwyWbIUzCPWSl4InhE+njTJVawnRtE65Av7X7y5FgGkCTah+M2lqlO
         A/RFITd28cWhnFF/Tr288LFlbC+poy7Hry07NjGv7M6kytQUtJAkDPl8bjuGqt5g49Un
         m6FMGj+c5bxP62TceYlSn+zmyjxac8ahxSF95n6CaDUgrsMdRbSK39NZ/Y+0P7AtVTXl
         /cnQcBLTDDJItBA5NW33pSl51b0n/oDHeE38fYSXKxHa0eJ+E/g8te8Kft3uSSTmf9by
         GLVUx1UHOl9xy/hI5AYk2hcNsczjaCrSj6Rwakxpl5PFn2DPCu56XYSSwsuLvBvTGqiN
         wkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeUanOFQMGLva+Wv/HlVlWxsHp1h2Rik1mRUDrRwu58=;
        fh=D6pxfUbDoBhuI7mHPRA3vKa3FbV4dqnOio18LgsUCF4=;
        b=TtVe5fMsIosNYz6h41G0LsoDqXKD5VuGYew4447dwQ9PiG4DgT7JR9f90VeOcpi7u/
         6APIkiqov4mJxWxgN0kdTjX0c0VFQ8pUNa/HfCKoY4BBu1RSTSGUNjJPIBCie5HohhrU
         DCNjpeNH8N13/H4/8DBKxkUJjwv5D32SqUj61+rzwG7AiZfVDxmdftb8GYgAIuo+2eMS
         ufnvXucpZbJF6g0GY04N/sK1n50/l+P4FwO9RttzDvHWgmbWxRDICSk0c3yEq/Xh0K3N
         TYjc5RtM+XzQz14eIfmoYtxKt75mK2OpI6GQHt+RiKVgtzQcb6q7u2kzvhVdqBVK5wdI
         lZDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789669263; x=1790274063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zeUanOFQMGLva+Wv/HlVlWxsHp1h2Rik1mRUDrRwu58=;
        b=OQDXuBGXrANQsvcQoJkL1HPMSBaLSna0bNijCPh0R3k6Siu9HbP5IorcUCOgPDhpDd
         ta3alc+ecHos09aotLt0cUqq3jeFO3zazqApVonnCTLrQ7heDAvhdXGaJKCbQkRTFFw3
         yWxWeF+t8FFDT2NHKRx/q968PlgB4I+7j9BWhICOE1YlU1H5PiaNu6seXQd60EXCxntD
         WoxnzkUAnAs8JiFEV6YJNMoTLVErzYSOcfI7lk/Wbj0RbrKHiPoQyTT+oqEBGElWVwNB
         GHNofDx4HPjIdU2RY9kb7GEDi5dW4M+LJEceDG7saqCk0b6mFjswwr7xDWIsWrY1qm3q
         5rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669263; x=1790274063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zeUanOFQMGLva+Wv/HlVlWxsHp1h2Rik1mRUDrRwu58=;
        b=oLruk1CsPYT+mrJBATn6bdt0D0Keyur7WRL0CUJ45Uefas2PBuPtapubTIuddq2TUB
         4NMUTG9XVGmPxJtDCtsGAs85+027w4R9RC+z5BlSkd/4VF/ZPpyEEzanBSaAp3+B+lka
         V51cP7HT4ofPAzE48l9mG5yArT1fGSpJWCPARURoqtQgw+XuMAXeUbCLBqInJLHYykJu
         lWwv9RcFEP87jl5X5T+G+1B/BrIlUovMgjCS6eEfcfPhpFUXhgSVbe9l/Zx0xPwdsC6v
         8cLYacTaytsiISytB3qvB+YAsIrgHh7KHsTgR/Jn8OYiwqAuh5sbInizQz72YVxSJPiX
         Qtog==
X-Forwarded-Encrypted: i=1; AKwUvBywBTeABGUDTLkAEgBUbRioevb5Jfs6pZEI4kzVVcfmau3WuL1tPK+S7f6NcoYGnyNnmWbfBQvrCIYC3T4=@vger.kernel.org
X-Gm-Message-State: AFuF++lfKaGrIrdsjDnzN/6GPakUwKJfw30347fc/WaJ+riyt6psdO7S
	Mca4+MC3J7v+ZNum9LKB5NuiSjNWtKnctOkYt+J/FjwHBd99J4n8bjY8/3EtFjeTAuXJRoCIHlk
	GJnqQY1LIIlvVbKVzh77/+yIFut9x8R4wS0fx1xwQ
X-Gm-Gg: AYBFou2CcfOwaGqH1/dxQSU/rqXHHE2cdB0ieEiU88lWX9/HoV6GRJWxLtETDiMYrZV
	gmvOwYDpTtDbLroIBNXKjAZ3BX6z+A6WyXExopfnGYwfNjNlx15o601cfBJsVXlE64kf26CDUW9
	FL6C8AcbOoskhouK7C9ZAdnk5NyqO7lzw3TTOU0ZxYfa7SNjUa/dcfhWfbCwcdsiKuADKgot5Sq
	uzPIBq/EQEhylk8b7wMBWAaE+S6vgF+pae+zOid27eMC36yP0yIXf89y8IrV2K/y+4OATrNNOjv
	00iGtghHkNoQkk7cwFxKO7UPSsMEJr5Pp4XapF+cLdVLFD6WzBV8ba/luNl28TVE/75ad76Xkm+
	8VH4Dt+Qe+bY1hxUALB3qxP5HnXOKw13JVvBWvOMct/+MBLDq23H7bHZ+G9iON5R2MRNvLg==
X-Received: by 2002:a05:600c:4708:b0:49d:93c:d903 with SMTP id
 5b1f17b1804b1-49eb7322de3mr97138325e9.20.1789669263065; Thu, 17 Sep 2026
 11:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
 <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com> <aphc5Xf0HU0SWcTI@redhat.com>
In-Reply-To: <aphc5Xf0HU0SWcTI@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2026 11:20:50 -0700
X-Gm-Features: AcwNN1Wnnc2Ja2BVU5SbTKTHMtdnYNybRfE_8sC9RSapHxQS6CIO6M07Qcg-v4o
Message-ID: <CAKwvOdkQ1OL8Uu+wBO-RtVr_sPTWJBYpM9PEDcec8CvLF64FdQ@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Oleg Nesterov <oleg@redhat.com>
Cc: Elliott Hughes <enh@google.com>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:29=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 09/01, Nick Desaulniers wrote:
> >
> > On Fri, Aug 21, 2026 at 3:46=E2=80=AFPM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > The register offset macros in <asm/ptrace-abi.h> are guarded by
> > > `defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
> > > were left unguarded for 32-bit. This causes havoc for userspace that
> > > happens to use identifiers colliding with these short macro names
> > > (e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
> > > userspace is forced to be super extra careful with include ordering t=
o
> > > minimize the chance of collision.
> > >
> > > Wrap both the 32-bit and 64-bit register definitions under
> > > `#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
> > > User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.
> > >
> > > Assisted-by: Gemini
> > > Link: https://github.com/llvm/llvm-project/issues/217413
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > + enh (who pulled this into android for testing)
> >
> > Oleg, can I get an ack/nack here?
>
> Oh... there is a little problem, I don't understand the usage of
> (magic to me) __FRAME_OFFSETS ;)

Yeah, my Assisted by tag is from asking Gemini to triple check my
patch before posting, and it pointing out to me from a local review:
"did you intend to break the arch/x86/um/ C uses of these macro
defines?"  So I'm just matching an existing pattern in arch/x86/um/
for 64b with the __FRAME_OFFSETS parts of this patch.

The patch started off as "why are the 64b macros behind the
__ASSEMBLER__ preprocessor guards, but not the 32b ones?"  I went back
through the pre-git history tree, and FWICT, those macros have always
been guarded for 64b, since the introduction of x86_64 support itself.
Dunno if anyone remembers anymore _why_ the 32b macro defines don't
have that guard (chesterton's fence?), but to me, IMO, it looks like a
mistake.

Hence this patch.  PTAL

>
> > Or someone who knows better the
> > history of UAPI headers?
>
> Certainly not me....
>
> OK. I'll try to read this patch tomorrow with the clear head after sleep.

Thanks for taking a look.
--=20
Thanks,
~Nick Desaulniers
