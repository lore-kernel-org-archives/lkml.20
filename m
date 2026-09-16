Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C935A387
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602975; cv=pass; b=L3xizCRa0lCl3z3GVg8kJHAXa+n8WOWMEn8M2IPUoKdQ6pHSVunQfrSVBiMkzta+77B/XWssQQ+TY5QoPHldvS1Gfk8v285JDMXihELeGl3tK2y8qPns4R/pR9QZNniluc1SpTv4IzKuk8Xg65Ndul0aKVFWOkmf9RizmLJ3tvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602975; c=relaxed/simple;
	bh=5tKaWdmu51kDXBBHcn30mMEVoJTfZmICHt+dSfRbXmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pInjhf+9+dPmyqbm9FC95q7TIwkwc0jQfjno/PIQ5pYGZPzpMnq/xDn7UCS2MDHnkCVCEE+U/ypVWkADNPoS1+arqWjg4PAdOejGUixdPJyP1JKamzJdKQUdjZSpYSQcW1tQtVTPOsyKMQdiUDxNbVviliYilFp/IVHa8+0YKUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mqcRcSQN; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mqcRcSQN"
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso148854e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602973; cv=none;
        d=google.com; s=arc-20260327;
        b=XdWOwocfhOT71XSr55Js/gpWd13T/4U0iJiMlETkpwXB2PYw7rcP33c2NnF2kxE202
         VNNb982Oys+1YELPCx1NMIwLbd9SmQJwG7AEwNU1cq7Vi7R1u8I+QAFp5WyKhnpu/TgS
         6Bg204sByPxh8qcnw/1C+/fTDYA6EPBeF0I4zzgOki7kVLnfsUBGRRaHw+WfX/fnQLvR
         Tmr5eFw+hZUenG9QMfCaBLCDOdlpgVPqc2naoSp+/F7UNfLuUt9a5lvxzVM1HfKD48Lh
         STJaZOTDBh/kMGcy5aVX9pM30RiUVJNPWIFPT1BAf5ZjFUvEP2baIUjiU6vyitDtTVkX
         Wi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRwA+HQjBliPkd+fmYUUZiunYG12ceL1uUJHyUv3qZk=;
        fh=OJITtme0eUFXwmQK0FUKxKxHuExcE3le/D1xN9KdSOo=;
        b=TQ/iNfUkX+m9ndxe6/PXFtVez9V0zxvFfGx7btLPXNUSUSg4QRElSC+nqJ3cge4lUV
         vuG9ucQ3bbNLfM5dZqJTbyN8LfgkUwh7FRdkk3Zxt3t/KPpxtS5eE/sjWZ/DND9TxJR8
         2hcdcpgXjXrjuAoDENO1mm2Kt0h8cw2vFIRjRWMO/uo1S5PGDxTBcZJYoeYtJ4sQVZqe
         zOSeBA0ZvqWiPbDdRqMLCUULFU4Dwh3EFNL7V37e0KW3pQrX7tKOFZ7ViewCziZMLScW
         sNAJcBR1Ri72M77tXfHo8P4hZi3uMrE32qFiFSge1Af7QFmkAcXycfV1boqoT38zfXI4
         q4LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789602973; x=1790207773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRwA+HQjBliPkd+fmYUUZiunYG12ceL1uUJHyUv3qZk=;
        b=mqcRcSQN9xkuxJOcjn1PYlCnePK5Zv6c9NB8AQYLh2+NWPg2RUZPWnU4LepZPyH9NL
         XaWUr55EgE9Z03CylPh77r14jmZitCgp92ajvAaxr3x4xh1ThDPas/lpT5ZHCQfaVzE4
         d3H1FOWDPxSg4GRtSjbKfzjWYYEFz0OazelYmrXBhuRHsb571TXF3ZtTq4+eoPeMTmWb
         whUJ+WQXr0eMIQ6e4gyRuspLODaKuhGrElEbnkgjPsKfQqfl1KN8aX1hwZp/0Lpa9dLf
         uZgTnlZZ1Ufwb/TH96MDY5hR0kcN+m0XwWwYqZqnjMtJ3ailRNanJPXrUUJz71/DRfT1
         j8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602973; x=1790207773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRwA+HQjBliPkd+fmYUUZiunYG12ceL1uUJHyUv3qZk=;
        b=aTYbAgS+bssqeMdyCdMkJnxS5AY6DA1VpIWFQoz38D3NdVjhM9pOzz4HgaLt4njPIU
         njQ2VNEPgHes9NCWYoF4cEZXt10dnzYbZ96EkxWWohSdId1T9iA/qe2iIqg9p0Y51r3W
         7AR9d9XbkwPRRtReqS4NTzEs1k/UoA2yKiF9YorR/fjk7md2B0c8bkoJ0xXC363/6Abg
         OtdIAqc0HMRN4Wxzc9M/OFdstMCfplYJ/QYwqKiljnLp/G9+QCHLtH8qkcda8OXGZ1u5
         GFrNd0uVr3A/oFhRacxzhJRPAU+YHn6IxWOmX50Q0ODapgnKJYHFmgoT2SPzLwJW+h1M
         bc9Q==
X-Forwarded-Encrypted: i=1; AKwUvByyHAL7pVuAy0o+2z9bK1i/GsHl359iFvsHOABDO2d/m/yGvi/t5rU3Kfpm0PVbWCzqfXgKfFqB8etfRXI=@vger.kernel.org
X-Gm-Message-State: AFuF++kFoauarxHGB99lvAr8QBlpgLlTCY3Ue4Cz/aazcwlfju7Xqu6A
	00T+WPPXaJjBPXp7nmxGu/wLhnnw3dgFtNEODPsDqjpACiqn5Lcat0L4AzrlNIHDjxb2kS1E/jU
	lk9Ej9H2DmaP4uUXef+6gKNvZCQpugvHIYGTyODg=
X-Gm-Gg: AYBFou3jpH7elxj+AqOBpgFo/BMooTc8TLtI+72UMO/xoeAjpbLV7hy3gaF1MKwCXm2
	/zXq7B6uopbMgJG2R++alEhQxK3tFXfTdxCEaOzpbJPOKeZ5eZjAJDa+XlUy09/E0f8W+S05OGG
	c9+tfpvUD/31sg68aZCG0uwc5VOJ2ylHDg7uZ4VvhTSECUBunPtRXY2+QbQuwpGh1kWWKFm9aVS
	mE3JJdLY4oTIaKfJb//5P2NYcynuXgs0C1aPRiUcZUnpWPMeelWOgecHpn4NkOtVOfD6t7onp2h
	o6c/A1bP3Fb1wol4f10wAnpUNY4/LSO4lx/p/usjgIHBzlc/FhwNaL3b2IFWFz0sgRWLvCBL+oG
	N7Hh1rD1z3rjz3QiPUraZ
X-Received: by 2002:a05:6102:1624:b0:7a1:f7e2:aae3 with SMTP id
 ada2fe7eead31-7a1f7e2f578mr1223176137.21.1789602972255; Wed, 16 Sep 2026
 16:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916221528.1256283-1-morbo@google.com> <20260916222125.1259631-1-morbo@google.com>
 <20260916164711.1cf51b0c3f085639dac5d690@linux-foundation.org>
In-Reply-To: <20260916164711.1cf51b0c3f085639dac5d690@linux-foundation.org>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 16:55:55 -0700
X-Gm-Features: AcwNN1V6pZlAsSvT8PHa-4kEYXErDLD2dlhlA1kYs4I7L9QvkcLNRYmodw5KG84
Message-ID: <CAGG=3QWmJZP72d12B1T5o56YbmVFRbyWFg0j_mFOyZUnBtVGrQ@mail.gmail.com>
Subject: Re: [PATCH v2] seq_buf: add seq_buf_strlen(), seq_buf_init_append(), seq_buf_puts_trunc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 4:47=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 16 Sep 2026 22:21:25 +0000 Bill Wendling <morbo@google.com> wrote=
:
>
> > Converting some strlcat() call sites seq_buf need behavior seq_buf does=
n't
> > currently provide, either directly or without introducing subtle bugs:
> >
> >  - seq_buf_strlen(): seq_buf_used() reports the full buffer size when t=
he
> >    buffer is completely filled, even though seq_buf_str() then overwrit=
es the
> >    final byte with a NUL terminator, leaving only size - 1 bytes of
> >    actual content. Callers that need the true length of the
> >    NUL-terminated string have to fall back to strlen(seq_buf_str(s)).
> >    seq_buf_strlen() mirrors seq_buf_str()'s NUL-termination logic but r=
eturns
> >    the resulting string's length directly.
> >
> >  - seq_buf_init_append(): seq_buf_init() always clears the buffer it's =
given
> >    via seq_buf_clear(). Code migrating from strlcat(buf, ...), which
> >    appends to whatever @buf already contains, can't use seq_buf_init()
> >    without silently discarding that existing content. seq_buf_init_appe=
nd()
> >    preserves it and positions the seq_buf to append after it.
> >
> >  - seq_buf_puts_trunc(): seq_buf_puts() (like seq_buf_printf() and frie=
nds)
> >    writes nothing at all if the string doesn't fully fit, whereas strlc=
at()
> >    always copies as much of the source as there is room for. Converting=
 a
> >    strlcat() call site that relied on that partial-copy behavior to
> >    plain seq_buf_puts() can silently drop content that used to survive
> >    truncated. seq_buf_puts_trunc() keeps the leading bytes of the strin=
g
> >    that fit.
> >
> > ...
> >
> >  include/linux/seq_buf.h | 60 +++++++++++++++++++++++++++++++++++++++++
> >  lib/seq_buf.c           | 35 ++++++++++++++++++++++++
> >  2 files changed, 95 insertions(+)
>
> This seems a lot of code for enabling some strlcat removals.  How many
> is "some"?  If "3" then perhaps do something different at those
> callsites?
>
In the series of patches I have in the wings (I sent one version, but
it was a bit scattered and need to be resent), there are roughly 7
patches which use them, some more than once. While the impetus for
these new functions are to help streamline the removal of the
remaining strlcat, I believe Kees suggested these in order to keep the
mathematics involved in keeping the seq_bufs correct was behind the
API, rather than relying upon each user to get the math "correct".
(Kees, please correct me if I'm wrong.)

> Sashiko had a couple of comments:
>         https://sashiko.dev/#/patchset/20260916222125.1259631-1-morbo@goo=
gle.com
>
I'll look into them.

> Should these new functions be added to lib/tests/seq_buf_kunit.c?

Yes. I'll send a followup with the Sashiko comments addressed and the
KUnit tests added.

Share and enjoy!
-bw
