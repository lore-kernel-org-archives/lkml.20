Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613A59C999
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889494; cv=pass; b=HI+O6nqjaYrV1uAz6ghHr83xZIaHZs6o57YatHu4NCou5K5B1F6Z834YeYo+JbZjEvAC1rkuk6IjNENPAaygc5U5M/wgLnyjREhMOb8s4Zm34hyXI+MR9ZRej2cp4wZvK7ufFCFR2xkAKdfDmhafnuPcRSxVbYEGhewHvp+Y8fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889494; c=relaxed/simple;
	bh=ShkHwOUomUiQJMzonDM5h/5GA/lpUuonj2FuUCvW7zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksQOlyy+qzAP5Jd/j3G5WzD4xI/AZjp5G7qadU7Bw9WpkzZVgOAVSUSjgxWHL+cSj/X3sxfUuu2PR2kcQN9H2xNCwrdFkYZVj9tw1kICIz45KWf1xdGq9QEXpZrtuPv35CuS+CqBZHWJEOef6A4xoLEMiUAw7z87rU4MxIexVmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPdGLf6a; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPdGLf6a"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c6559620e3so2145168e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788889491; cv=none;
        d=google.com; s=arc-20260327;
        b=KqP27opUBR5VRHuImii4rEy5Wa0Pqm+MiKCdUCa+kgd+4/O9qsFPyJZmnqLdAmvDOx
         OCxluho63LB2EkpAwVe4B/lCAUxkL5URYtiTmFbekTlkLr6bwqS8dyfCn69x7bALIQrw
         fip5a1ArwznFwgtt/vPTmu114dgqAPe5RYOane6lv4iARKc3Ct0Ge3+ZgMUoqhdny+6p
         Gyh66vWu/c75F6T2LI3qjIsjkHsFCxl1vWzxq/a4Y6/MlUacIFPoma0Ferxonx+2Wezt
         sw8paqkyPwjGqgvOZEUsjlgn4BrIT8hskAfNLlu7X6qIyVdnFHNSDnLmy23N8lkBD/VZ
         mDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7o7XRFDV4hk6Nyyh3+8nvjhrOOUNY907igWbOd3YiI0=;
        fh=6fpe/BU0ZbUahkf66hX0s83xEnZKuWcHpaFI7TIqLFU=;
        b=X2qPdEibEObn4XTG6rwjm/bLtVmcmPqcWUrOfx2G+UbqzSUWrgPnNxwlDig2eoTuYI
         kT5VXhZ8hYuN1iD63KMCqFTKQ9B7DhYM/E/mZevxCxEcA9YA4r85Uyh8jHH90yhGxq0C
         9TtOOGKGUzJmCCDRkpDbLV4YRI3OVddWroOh8qwnFwtke3UQcpG8QrmxwqCL+tV1wAYo
         voFekAhtqo2D8ALzQwuP6YnqWw+utozwtnT8g5juha/yix9xpWjTrAAQC6zyl9HBV698
         Qo4XQl/nzoDZg3rCnNjDKArTAxT34ZLxCGxEHqPUpPCaP1Ud4HIXlZec5kiEOlVX4v1f
         6RPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788889491; x=1789494291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7o7XRFDV4hk6Nyyh3+8nvjhrOOUNY907igWbOd3YiI0=;
        b=DPdGLf6aqmjpNGDMjJmIzcOlsF4qgfTfUd4okN7RLVz1S9S5HSUVqTEzbmry7iXxKN
         1CSU7N+1DMUa7w4ETqcrISkMTnvyw43UfjsxUzZNuVzPZSJ7DMhlWREnO3SMP9NS5l4J
         ecnTVCDphEr8sZdzR7QqpVMsTgFd3nyPW+bR9MDmdOK8ghhFUXYGFp3QPGXhcdxykFYH
         fIUGaMPpm8yethfEND5BcbUdrxYdkZjBtq5u5ce43CMr9xsiP5IDfCHaYIxKVDstzA4E
         xDEmW3rqRXLdSfnGe6vc5vggH+ebdoWXJlFR9twHcZyf+E2HoKPvd+KS13vBc9kL6680
         Gvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889491; x=1789494291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7o7XRFDV4hk6Nyyh3+8nvjhrOOUNY907igWbOd3YiI0=;
        b=gUUPHYASOkpAj2a75PWtjsvqtWwhVzg+hRTN8X0cqz+fHeP5JELwLOi4JCVdpFp0SP
         51tgtRIRDdl6UQKl6Ky0KnCTIhfuNcQUuGhaWSbb36PnOm8JccZ7JnTFAufKzlhIyglZ
         pNRORCGwAsRXI6cJqkED/J1qpHyfODw3QqUpBJ1dYT3rAsXvqGJM6NzVNz1dzcyogLpL
         AocUQ44o+Tu+npqrk8lz7JOSex+iCBY+2ZIYY0Tukyr88cDMQwMJm89Sku3XoeCG66gy
         XKKUplp6nT8mIcmU+U1qtJSXEIACKY8DpyhqNmn2VeTp6VyGuEM7x6UQ1l7p4WmFkQwA
         2viw==
X-Forwarded-Encrypted: i=1; AKwUvBykImq2pD64MiAu5VTDpe9gnqRIc2ewNdM65YpjB9V0Os+WW5rlfyVVco1bmprTlTfEEkjY1nAymW7hwfk=@vger.kernel.org
X-Gm-Message-State: AFuF++l1rGTUeSs5nQtw0+sb2Qeu+FPo9Lz57fYILaPDEyUecgWXhYyv
	qRx4dJXpBku3xm2oP2g+aCVWPUHW3ND7lscT2Yd8iM3Hy+9Mp4nOAz05NaXv+NzjCgEJL6t23oO
	3DQm90oL+19WlpXlFeB9Hzt4wLwA84SRUZqRwmA8=
X-Gm-Gg: AYBFou3JGR4SwDexsiF4h6zrme3h/h+XsxFoy8rN5meQ2qUGVX+6MXN/5aKJIIXM3pS
	xcOAKlebEtFnwg8hU+Fobb5xukwLOIkH7Ddv+U+eiVv9iEJdtbmAcOlhSpPI6vcmKCy6EXR2r7S
	a5WWPINFoQmtlK806PM4OEu7yVGSTbpiYaWCfPgHurIBCNkvFnEbnP+jfmIAZhYu1buMnTt2jDU
	aVAYLWkPbHgy67XYRxgWVGEgeR+Ojb5ZAfq3Erm0MntNr01ZUxxMJcry5M7lvrUia+2BHUIuXTi
	KUkFM9NQ0TmTpes67VaA2n9wbK+uYtWjnO+2zSlrzmek5IAPerpTV5yTE7NpTeiOfcJeioM8/vO
	tuqJhu8wE4g6h6HZtZEkJE65rkk0/QkevMqhiLWYJmQ==
X-Received: by 2002:a05:6122:2909:b0:5bf:a181:d46d with SMTP id
 71dfb90a1353d-5c7ed4201ddmr14549302e0c.3.1788889490770; Tue, 08 Sep 2026
 10:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823125155.1136740-1-morbo@google.com> <20260826220041.4075333-1-morbo@google.com>
 <20260826220041.4075333-2-morbo@google.com> <20260827152612-d0c71c10-cbe5-49f3-9be0-47eb76cd9b48@linutronix.de>
 <CAGG=3QWPTL5z8MfAxJLpHb0P-3Ah6K+FzgrVHyRRcvRK7-6dSA@mail.gmail.com>
 <20260831111423-400ed79e-6e52-438c-aa9f-f289e6dbdee5@linutronix.de>
 <CAGG=3QUAY4BDiJM64uTX8C1A2WPg6dPRexbgUQZoi4QKkkpP9Q@mail.gmail.com>
 <20260904091410-3a87d211-edf8-4ead-8b91-004a4a96a161@linutronix.de>
 <CAGG=3QV1G0=19riYPPWhTXrW2X0YvyESdY=GesWm2F_8FEZwMg@mail.gmail.com> <202609041620.81446C2A@keescook>
In-Reply-To: <202609041620.81446C2A@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 8 Sep 2026 10:44:34 -0700
X-Gm-Features: AcwNN1WR73l0ge2WjdsLbGVpDM_YkwGwW3TPZUjUosckf5D48hKt9NjzjmEqtlA
Message-ID: <CAGG=3QVB2Caght=56JLf6cGj1Xfvoky6cqyFz5b=KndL+emRxw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] userns: Add KUnit test suite for uid_gid_map
To: Kees Cook <kees@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Bradley Morgan <brads@mainlining.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Anand Moon <linux.amoon@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, codemender-patching+linux@google.com, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:34=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Fri, Sep 04, 2026 at 01:37:00PM -0700, Bill Wendling wrote:
> > On Fri, Sep 4, 2026 at 1:02=E2=80=AFAM Thomas Wei=C3=9Fschuh
> > <thomas.weissschuh@linutronix.de> wrote:
> > >
> > > On Thu, Sep 03, 2026 at 01:21:27PM -0700, Bill Wendling wrote:
> > > > On Mon, Aug 31, 2026 at 2:22=E2=80=AFAM Thomas Wei=C3=9Fschuh
> > > > <thomas.weissschuh@linutronix.de> wrote:
> > > > > On Thu, Aug 27, 2026 at 12:27:30PM -0700, Bill Wendling wrote:
> > > > > > On Thu, Aug 27, 2026 at 6:37=E2=80=AFAM Thomas Wei=C3=9Fschuh
> > > > > > <thomas.weissschuh@linutronix.de> wrote:
> > > > >
> > > > > (...)
> > > > >
> > > > > > > > +config USER_NAMESPACE_KUNIT_TEST
> > > > > > > > +     bool "Test user namespace map insertion" if !KUNIT_AL=
L_TESTS
> > > > > > > > +     depends on KUNIT=3Dy
> > > > > > >
> > > > > > > Urgh.
> > > > > > >
> > > > > > ?? What's wrong? It's identical to the conditional for EXEC_KUN=
IT_TEST:
> > > > >
> > > > > Sorry for this non-descript review comment.
> > > > >
> > > > > > config EXEC_KUNIT_TEST
> > > > > >      bool "Build execve tests" if !KUNIT_ALL_TESTS
> > > > > >      depends on KUNIT=3Dy
> > > > > >      default KUNIT_ALL_TESTS
> > > > > >      help
> > > > > >           This builds the exec KUnit tests, which tests boundar=
y conditions
> > > > > >           of various aspects of the exec internals.
> > > > >
> > > > > The problem is that KUNIT can be built as module, which would pre=
vent this
> > > > > test from being built. We have include/kunit/visibility.h to expo=
rt certain
> > > > > symbols only to tests and avoid this issue.
> > > > > But I can see that some maintaines don't like this pattern, so ma=
ybe they can
> > > > > chime in at some point.
> > > >
> > > > Bradley commented on this earlier (which is why I mentioned EXEC_KU=
NIT_TEST):
> > > >
> > > > <comment>
> > > > The test is #include'd into user_namespace.c, which is builtin (USE=
R_NS
> > > > is a bool), so =3Dm here still compiles the suite into vmlinux. Wit=
h
> > > > KUNIT=3Dm that calls kunit symbols that live in a module, and the l=
ink
> > > > fails. Make it bool and depend on KUNIT=3Dy, like EXEC_KUNIT_TEST:
> > > >
> > > >  bool "KUnit test for user namespace map insertion" if !KUNIT_ALL_T=
ESTS
> > > >  depends on USER_NS && KUNIT=3Dy
> > > > </comment>
> > > >
> > > > So there's a conflict and, because I'm not a KUnit guru, I'm not su=
re
> > > > which way is "best".
> > >
> > > It's subjective. So as mentioned before, the preference of the mainta=
iners
> > > should go into it. The aproach I prefer requires a bit more setup boi=
lerplate
> > > but make the tests usable in more circumstances.
> > >
> > Because user_namespace.c is always built-in (USER_NS is a bool),
> > compiling the test into vmlinux causes linker failures if
> > CONFIG_KUNIT=3Dm. Using the "visibility.h" version also strips static
> > from insert_extent() and sort_idmaps() or exporting internal user
> > namespace functions into the kernel symbol table, which isn't ideal.
>
> The export namespacing should limit it to just KUnit, so that should be
> okay, I would think? My guide for this in the past has been "did the
> kernel get less fast/safe because of Kunit exports, etc?" I don't
> _think_ that's the case here.
>
> So, I guess it's down to a matter of taste by USER_NS maintainers? I've
> move Christian to "To:" from "Cc:", as I think he is the defacto USER_NS
> maintainer? I don't know, though, there is no MAINTAINERS entry for it.
>
My understanding of Bradley's comment is that we could use
visibility.h, but that doesn't give us much because we couldn't run
these tests with CONFIG_KUNIT=3Dm anyway. But as I said, I'm not a KUnit
guru, which is why I'm leaving the decision to maintainers and
reviewers. I'm fine with using the "visibility.h" if that's what
people want, and it works.

> > > > Test (3) (which I'll add in my next upload) throws a sanitizer exce=
ption.
> > >
> > > What is the point of testing this specifically for user namespaces?
> > > Normally we expect a used subsystem to work as advertised.
> > > It is that used subsystem's responsibility to test that it does so.
> > > If there is currently no test that validates __counted_by then it sur=
ely
> > > should be created. But not here.
> > >
> > This would directly test that the attribute on the struct field is
> > caught by UBSAN. I'm not sure how we could more directly test it
> > otherwise...
>
> It is tricky to catch the traps sanely with KUnit. All the Oops tests
> I've written for it are in LKDTM, and only __bdos is tested in
> lib/tests/overflow_kunit.c. I was playing with catching Oops in KUnit
> for testing KCFI recently, but haven't come back to finishing it safely:
> https://lore.kernel.org/lkml/20260618210946.it.538-kees@kernel.org/
>
I was using the kunit "run/catch" functions, but it's not complete
because they don't tell what underlying issue actually caused the
trap, only that a trap occurred. So not ideal. Maybe the LKDTM is the
best way to go then...

-bw
