Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567B48550E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776825; cv=pass; b=lJioKLPov2aW7QFBYPBMGhnFPSWzIR/vnD2LRp2hhLf2D56aEn2+1i0W1+asMv5v7x2qQWT0xv4NtHDe3FVnZQSk1HLC9iUtuX1vQJTdiDQFITRojoXNylnTLd3lI0qwWBdlad8oDH0TAzwMUhu+FkxddvcqdDKdUutcWt49ymA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776825; c=relaxed/simple;
	bh=DLRhVFUdg+p/7Ncqbi3cT+hpMW0oIOjZT9fcaEqNBng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJgx/AYZzh78Mr4TqZviQhjpbzl63MM+wvC9Hik7qXIhKdBDlkBO9NKZ7V4J3oSskn9dH/R0A6xnJVBgClrlhQh4TUB81g0f8HhLkFnXv5mVXex7/3LBpMX1W6NGMY757WNq/TjqcyUSqRnwm7N/srjquxO2fTxzuOGsEK8o5hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JeGcgsP/; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JeGcgsP/"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7542a2ee156so956171137.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787776820; cv=none;
        d=google.com; s=arc-20260327;
        b=F8gvblZNgwgpTFo89darRbsZu3xufmF8RaqxwTu4LEZzOsYrWh5+AHwZMsJuL70dUM
         eMoCk5qx5Hb9J3dj1+4xm8XQL70crQjHjyJdMvEaTEolS/UGzXPvVBUbTx2K3wmaYim3
         4fQZc8Ytmkr3owDCIKpe9FgGeSfhm5tQIAzk46vDRenLkTfg+IG+jX+pOQglrBxI1/qK
         bN8tQ4NaImeNVD0hfX0eVWoRqP/o0+B+Ic6tpvEl6t4DCCns9qfOscsTKku6NEmQIEYO
         solTRcD9Bj0Cla1Fkd0DZDxjVDD4LFS/8GRlpd/1eLXuMMk80qoy7xJG98KLoJVsJOaN
         imOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lB1QrtcktRM6zvfmeGkEq0i93fG3paSF09YYzfmPgSY=;
        fh=WfLAfsEQmZVYXEgRnho0NXhV8LX7w+AYqKQSwkdl9Gk=;
        b=bgkNMgK8PZ/8z0RdP7YwygE3+Oil94HKkYkdX0VTiTOFWs9wLYKzplhj9C1bttfNka
         Tak5TKiYIkNBISnT6wmM/ay8Lm0UdaqvwARMV8koapSssKA08pYM6GrVO4/3NssGv3Aw
         wv/vtP3aNDF4uic7On6h7XKAdvH6Mg+6ST3s2XgJNqawZxLa/CwpEEdqlZUTBxJeyRli
         MU/Y8VhHyRnYhUhvKIKEgY1Z09RXDKqKJrrnlwnR2n3P43ZEwIaABhBbI1aQVwmaO+HG
         okhTLbChxxDdC31+SRbvzfEoYMEw7nsxsy4ta/Ns6cBQTGq3vRMuMulDALeBN7vvD68c
         +ekg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787776820; x=1788381620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lB1QrtcktRM6zvfmeGkEq0i93fG3paSF09YYzfmPgSY=;
        b=JeGcgsP/jcNsg91bIjD229nF878UYWIi5aNa1V8P0NoUPD5cRCKKSKJ3PXfRX0suMW
         jB+LrRhIDePOIqg4iWYbLOF0UXN/okuE2gCoiY2gALKcRKOdyT9dWLJrRvgbSUaygGlM
         yRNH74uAOHCw3DWFSCxMvvU7ecCLjWMAjYhV2ao43lLJpj8ZX+u1DQ4U0APjCJO20+1l
         GCyz9nnB6vKBDOTdmXMwTAgNaIYiIzSlCV3cnZwImZjrS/lDEQ6U//6osG+emCvoyFDO
         BPRinfXKG1j3LmwyL7KrgmQ3I6EBS1+imsidsvcImC8ADrG46lqB1tIERYo8tNO0ZPJP
         WzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787776820; x=1788381620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lB1QrtcktRM6zvfmeGkEq0i93fG3paSF09YYzfmPgSY=;
        b=f/bej7fHJqsYrQ/wtqI1XNa7FP19ZoVZ0lxwlKu91enDnggrrz7q6Hqqi4CcpbDT+S
         Bs6Hh1sZ5RApkPdknLM/jWhDtMlFvB231ZJ1dVuPtIz/4ukIAk3e9DdUFoM8FG+pYnpJ
         m0BzzPyMltGI9f7eanz1y2Ym0+JJbypLST5hGitDoTo1P76N7tCkl5sygiskkvElB2k6
         Kzdq0LKkQ6eKjhZK3dm8o0hMh0uANy1Pp1JkTqTkz9Fq4y2KRK/Ah+qaA6mmt9E2qsWL
         opIM5NlNocxTurDxHlkCzxQSn5EGsWtkzMI99CSNRttWNSS0rn82aybqjadtf08JB4uE
         jyng==
X-Gm-Message-State: AFuF++l4214Xz8RFEapk4De4150LDfpvbHUD5k8rojwftfZzE9cI5bQh
	QWAWdz2TfQ2z8V/iPQX9U28huaooPvqXHxv7RWPkToczIcFCVeeYSv9Ns50jmyvcmGBfolNcaat
	2g33ny4tntL6y47yr2vTYOHvwaQ2zOd1lzq8w5tDHIyZ0Mi/fFw4RKlUaFw==
X-Gm-Gg: AR+sD12waVB0r0Eg5/d6CzbU74hVw1QJM5LCb5bA2RfbVxV3GE2IIhOHhZzozjCiQGc
	yf6l1W9Qoz3kHvmdlHEB8jI8u+Dv1OI1MZLVOoq9378gfciKP26uLOxgMJztn8rPg4j3sZAkFxT
	ZSbDJVcKpR1izUH2tpg/FGiOo7oslgzLPCYd9HSx4GtwHDsl+vkkWvTcm9e0WMserkjfa5SDkWq
	vzjiKdwbuEePTra6lxVvy3AlnaYJIoviIFA1GI+t46La2BwmF1GsEnEYcwMwNb4n3dIZwWXJKC0
	8C/UcIdFQ2aPaEkNHyu1PdTYqqc+hsofK9xrZWqWmzCNcReVyx0DhPUEGVjzMCYMjS5qoeK4PgV
	ljMYR4QOGvCfdSH9XENL+t+GOo0pQ/eFGnwhct79JkQ==
X-Received: by 2002:a05:6102:448a:b0:780:31fe:bcd0 with SMTP id
 ada2fe7eead31-782c0bfd665mr3789233137.8.1787776819645; Wed, 26 Aug 2026
 13:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823125155.1136740-1-morbo@google.com> <20260823125155.1136740-3-morbo@google.com>
 <20260824080214-8b12767a-8b04-4344-b48a-cd2966ad36de@linutronix.de>
In-Reply-To: <20260824080214-8b12767a-8b04-4344-b48a-cd2966ad36de@linutronix.de>
From: Bill Wendling <morbo@google.com>
Date: Wed, 26 Aug 2026 13:40:03 -0700
X-Gm-Features: AcwNN1XcBuT8Hu0A7Z9qKDs8wo_Jfo1FVXqJxHd5jnUUUXSA_JKZFdnR9NqrXew
Message-ID: <CAGG=3QUCowcrBT-7ZUyOOrX5fjQtFSmRyqvnYkZX0tO9+MKp+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] userns: Add KUnit test suite for uid_gid_map
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Anand Moon <linux.amoon@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, codemender-patching+linux@google.com, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sun, Aug 23, 2026 at 11:13=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Sun, Aug 23, 2026 at 12:51:48PM +0000, Bill Wendling wrote:
> > Add a KUnit test suite to verify the insertion and sorting of mappings
> > in struct uid_gid_map. This test suite validates both base extent
> > insertion (<=3D 5 mappings) and extended extent insertion (> 5 mappings=
,
> > which triggers the allocation of the forward and reverse pointers).
> >
> > This is especially useful for verifying that the __counted_by_ptr
> > attribute added to 'forward' and 'reverse' pointers works correctly
> > without causing any runtime bounds-checking panics or traps.
>
> AFAIU patch 1 is supposed to not change any behavior.
> You could move the unit test to the front to make that clearer
> and also validate it.
>
Patch 1 generates code to assert if a memory address outside of the
bounds of a pointer is accessed. So it does change the behavior.
Should I still move the test case?

> > Assisted-by: Gemini Next
> > Change-Id: If0c2c197a35cd7429cf0d2d6e3b33f0d9f0be66c
>
> Change-Id should not be used upstream.
> See Documentation/dev-tools/checkpatch.rst.
>
I had removed it in v2. :-)

> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Aleksa Sarai <cyphar@cyphar.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Cc: Nicolas Schier <nsc@kernel.org>
> > Cc: Gary Guo <gary@garyguo.net>
> > Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
> > Cc: Alice Ryhl <aliceryhl@google.com>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Anand Moon <linux.amoon@gmail.com>
> > Cc: Oleg Nesterov <oleg@redhat.com>
> > Cc: codemender-patching+linux@google.com
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  init/Kconfig                  | 10 ++++
> >  kernel/.kunitconfig           |  3 ++
> >  kernel/user_namespace.c       |  4 ++
> >  kernel/user_namespace_kunit.c | 87 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 104 insertions(+)
> >  create mode 100644 kernel/.kunitconfig
> >  create mode 100644 kernel/user_namespace_kunit.c
>
> (...)
>
> > +static void test_user_ns_map_insert_extended(struct kunit *test)
> > +{
> > +     struct uid_gid_map map;
> > +     struct uid_gid_extent extent;
> > +     int i, ret;
>
> (...)
>
> > +     /* Now sort the map to set up reverse mapping */
> > +     ret =3D sort_idmaps(&map);
> > +     KUNIT_EXPECT_EQ(test, ret, 0);
> > +     KUNIT_EXPECT_NOT_ERR_OR_NULL(test, map.reverse);
>
> KUNIT_EXPECT_*() will *not* abort the test when the assertion fails ...
>
> > +
> > +     /* Verify sorting is correct */
> > +     for (i =3D 0; i < map.nr_extents; i++) {
> > +             KUNIT_EXPECT_EQ(test, map.forward[i].count, 5);
> > +             KUNIT_EXPECT_EQ(test, map.reverse[i].count, 5);
>
> ... leading to a crash here if map.reverse is invalid.
>
> To also abort the test on assertion failure use KUNIT_ASSERT_*().
>
Roger that! I changed them to KUNIT_ASSERT_*.

> > +     }
> > +
> > +     /* Clean up allocations to avoid leaks */
>
> Pointless comment. This is true for every single call of kfree().
>
Kiboshed.

Thanks!
-bw
