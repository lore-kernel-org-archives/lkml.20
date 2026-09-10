Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE134414404
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069751; cv=pass; b=qkco/d9nwc+/leRXeaTbRsDpNAUIM09kVfPfOG0qwSOGR5i5+m0NMpmuVPCdBLFI7Sz4ch3Q/0JOktsWMcBcozObrIRpyAkXW4qQpUPb1LsOAqIAb8R6c/FwDsegYKR6DxONbDka7T/oA+r8y6JDncEABmeh3jGv01KExg8fBOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069751; c=relaxed/simple;
	bh=S5QyluVCeJaGYGDzXLLVWroaz+aSorb6LrOcEvmKFPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtxCrRzrebMGaeElChM6olx8bH4RZITch8Jp6CqO7B76CfV0sfC9anhbImeYQEumBmD9NfsfX/rMzHyka/6klynCFIzEeEYYZ384wjersxWi2fVSDG5T6sDfJvMYSNwO9bzhYoRyUH7u1NFH6O3JR5XiJDFlIsXgKjr4kIua6YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJJSjbxd; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJJSjbxd"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97ccaa61510so153496241.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789069748; cv=none;
        d=google.com; s=arc-20260327;
        b=Q0ukJE0hGlQ08RZ+KQfQhG8m5xpnQeNdP2N2bVdNw7GvRP6KOsiyhcN28IHoO29djG
         otKHMeX/clSFWPKOR39zsweWBOvabahDLstBr2SnGsIhkiok1bZu0bQ1wBCVpYryAVrZ
         er5WTDUqOr8t734n/07vxeHLkuC+NpcLwgpgZcb120A8RuIIlPDFoqBHwnC2dvIKlP9E
         Xg643MpZN32G7wKWibzRIwJSA1ge7Y7hHQfR3HT5Fq1JFlVuneaiVivaitlnDMTToxIR
         qEfz1BJsqBwxJYBb1Wz7NSlgRPjGVmzNqOzfysV0qOBYt44/lBiwx7CXWSoquxc16bEX
         Bszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c0ksCIwXvtdjyIyjGDoU93CuaajQfyrtF2GSd2bTtEE=;
        fh=MGIX/YDuxi71jDZNg09m8P+2wFwyXHYp6N1veKvnynA=;
        b=UBxmd8R2WdzZQVci00tFgpVvqRUlKATQ/rKw2RT6Ws+hzTFQeS5DVQ2RwFKfT0Ih/5
         Hc58ZM228woMc1Pn2aFX6r2vm7id6+bvU98jOK/nEm1hwyJUYoNzIkVlZ43sGGzjplwd
         C7260hF2t+x+4KMmI5D9kjgY39uH9s1WUIKJNbbzPuXdV9S7rkXpexEmJTu38j5Yq/+h
         TjMrOSKphYVfTvxATOWgg1VwLhZOqcjfhPD3YX41a6VY7WbpeENqt1ybbVJ5XOZJRaS9
         hLdMkMqfLokf1mRIV1qiz86v71tExlcWDrKe5sFteww5JmmdXG/cpWF4kbZGt7pGF5aS
         lTLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789069748; x=1789674548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0ksCIwXvtdjyIyjGDoU93CuaajQfyrtF2GSd2bTtEE=;
        b=hJJSjbxdHExbOZDQ4jDMI4vrXo/29l2llpvCiaKyLmKKqTMMIwy294VXpFGeQ/p3BR
         tCQ50ZDcFEFcIL3QjVEPZMx6/gj2aVomkGt+CH8HQbkMYu717o8wOd879EAbuw9Z1Fau
         Atekpt4+s9in5YNqB8E0pWVgQHVCIgrn9kaYS+WB8nOyxwhQQunsPdYU7posiqVdICbR
         Fom6j6jgP5dHRP1mj3K0P/VNW0EfdkYvCLWvn/0EmaUZ09/3LOHtNRYN8P+uCJ6cWG3B
         HephzAUWwyh5eLeWeOgGYQYIZYJuSG4ZoxIsCfxojuFJei3gVqHW8nCWWvaTBXN+6jwh
         3g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069748; x=1789674548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0ksCIwXvtdjyIyjGDoU93CuaajQfyrtF2GSd2bTtEE=;
        b=GQcX1flxfgYOr38talB1im/66Wpm59Ppn2MImIFml+7TLaK4+qTw3svRLTtw5mHl0R
         bthTdoAXru4Dudj1iJUjWT/7uAPNbdywg/bAlFwBxBjYOgr9dlc1tH0SpKTqLjMw4zwy
         uofVZZqDWiUsgxESNRuqvrZEC1GGokuHIw8/fdcSIp5vnSacJ3tgqWb6yLGpO4V+Ir58
         qoK/UvEYpfMoX435aVkvhqG55VRwT60hqUzn3AiAD5qGEGl5aNRbwKm/JRgDHy0yNABS
         cLF3dOfCETaM1djM7K50cGAFbHl+UiSaiVH1pvQMWuTPxKIuYJh1nPJyHSiawya9trV6
         CoNA==
X-Gm-Message-State: AFuF++n6jHNmYomxZQX0Y+GKRHvInhmmTsO6p/Yif1Qjo0ZQC00jDIl1
	0fLOC3X4V5v6OsbiwLpgOj+On4kZrLgXfSyJJwUZyBg3tc746cKiCN68DfshuAJ7RZgWrIW0JW9
	XwKFxjpkZ1mRC/pL+ta8ZdRI6IKG5+CsPFjNAfzo=
X-Gm-Gg: AYBFou1/Bs8SUoaE2W14VOoILegiRVscesBzlyElp8CUeJtDdiR2g6/ZkX2sfqD6lbz
	TMvmAgs+Qgy84McsGQRXxBo9FzbFZX47IUwhiYrKogiAZRE6t+OZzoA2WR8gesx3BZLt7Vu30kp
	fDBwfB/NHb4pg3tgQDPwogCJebw95uTwu+QEBcg4JAEAHC5oEO6V0mC3KFE2058nlk2yztwpGBC
	ZU4eMfWsE7AjYtQri2Z7aMYcCIqTEqi1nFLjcJL7SEhj6+9BSqWoOomR4Ko9TsZLgw3vo1NlVZk
	w+2qhh1mpifUsEZK1NeFlle5kUCxGwZweg8c6TizSDbz/M8C9yAUMnYStxVVq2ylsipYKGSUfw8
	Y4HR+p0gTTdj07jJgMUisoEEdn7XtLjvvKExGS1Vc6oAJ2wCOdZRm
X-Received: by 2002:a05:6102:6402:b0:790:c7bb:43fd with SMTP id
 ada2fe7eead31-792a93b09acmr1242358137.8.1789069748029; Thu, 10 Sep 2026
 12:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823123549.1120133-1-morbo@google.com> <20260823123549.1120133-3-morbo@google.com>
 <20260824083538-d0eff358-e1d4-4af6-9e61-d4d816783266@linutronix.de>
In-Reply-To: <20260824083538-d0eff358-e1d4-4af6-9e61-d4d816783266@linutronix.de>
From: Bill Wendling <morbo@google.com>
Date: Thu, 10 Sep 2026 12:48:51 -0700
X-Gm-Features: AcwNN1V1PayGvWHzKjDrmg88i9kvWNJySD9iq9lUAMBCtIxwSRTkDSXpz02lxUY
Message-ID: <CAGG=3QXojhEsqvk-L5vT3w37z_VO+p1=8vrJCJ44sTz_V-YRGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib/tests: Add KUnit test for struct stack_trace
 __counted_by_ptr attribute
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Petr Mladek <pmladek@suse.com>, Kir Chou <note351@hotmail.com>, 
	codemender-patching+linux@google.com, linux-hardening@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 11:41=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Sun, Aug 23, 2026 at 12:35:33PM +0000, Bill Wendling wrote:
> > Add a custom KUnit test suite 'stacktrace_counted_by' to verify that th=
e
> > __counted_by_ptr annotation on the 'entries' field of 'struct stack_tra=
ce'
> > behaves correctly.
>
> The implementation of __counted_by_ptr should be tested by a dedicated un=
ittest
> for that feature. And I am fairly sure that already exists. It should not=
 be
> tested in random subsystems.
>
I'm looking at `tools/unittests` and...what in the world is it
supposed to be testing? It looks like it's testing absolutely nothing
of substance. I assume you want there to be a test that runs and
produces a stack trace triggered by an invalid access, right? I'm
unable to find any tests in `tools/unittests` that do anything like
that...maybe I'm missing something?

-bw

> > The test verifies that 'max_entries' correctly limits and validates acc=
ess
> > to 'entries' when CONFIG_ARCH_STACKWALK is not defined. If it is define=
d,
> > the test is cleanly skipped at runtime to prevent compile-time or runti=
me
> > failures due to 'struct stack_trace' being undefined on modern
> > architectures.
> >
> > Assisted-by: Gemini Next
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Brendan Higgins <brendan.higgins@linux.dev>
> > Cc: David Gow <david@davidgow.net>
> > Cc: Rae Moar <raemoar63@gmail.com>
> > Cc: Ryota Sakamoto <sakamo.ryota@gmail.com>
> > Cc: Kuan-Wei Chiu <visitorckw@gmail.com>
> > Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Cc: Dmitry Antipov <dmantipov@yandex.ru>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Kir Chou <note351@hotmail.com>
> > Cc: codemender-patching+linux@google.com
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Cc: linux-kselftest@vger.kernel.org
> > Cc: kunit-dev@googlegroups.com
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  lib/Kconfig.debug            | 10 +++++++
> >  lib/kunit/.kunitconfig       |  1 +
> >  lib/tests/Makefile           |  1 +
> >  lib/tests/stacktrace_kunit.c | 51 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 63 insertions(+)
> >  create mode 100644 lib/tests/stacktrace_kunit.c
>
> (...)
>
> > diff --git a/lib/tests/stacktrace_kunit.c b/lib/tests/stacktrace_kunit.=
c
> > new file mode 100644
> > index 000000000000..7ec48edf84fe
> > --- /dev/null
> > +++ b/lib/tests/stacktrace_kunit.c
> > @@ -0,0 +1,51 @@
>
> (...)
>
> > +}
> > +#else
> > +static void test_stack_trace_counted_by(struct kunit *test)
> > +{
> > +     kunit_skip(test, "CONFIG_ARCH_STACKWALK is enabled, struct stack_=
trace is not defined");
>
> If the test requires a specific kconfig symbol, then depend on it in kcon=
fig.
> Putting all of the code behind a single, giant ifdef is pointless.
>
> > +}
> > +#endif
>
> (...)
