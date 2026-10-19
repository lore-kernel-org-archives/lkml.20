Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422626;
	b=3OtxfI3VJYlHUdujCU4u3V5LsyuDcy5DWuhdt4DxuFzpNoHC4BhdriYrNSmfMDZrHNz8
	 oI3xAvgCYcZqpcJsD/Sh/zUknZ/i3v95S7ggk6G7fthciLP0eE/MwrcnY08ge39LYVxD0
	 ynB4Zli2tBoavE/hE7ip6HJQef6vVk6DHA4Zg/MjXXnelPjzMioMFqtzun0kbcGu6AbyM
	 Dp6CrbdTOfsrdUGlGZe1E9t02gvu/Y0UHOmlA6OJoaa6B/2ukZsoJlMlPyCs57GcWf5ZR
	 PoH5W/pxLMzFXUcFxgLL7EkjCZpe7ulsGBHY5IdOqkn68r5TzrZswRGVu0HBu/RZGYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DEKJZghqVH93r9LYP/6FZEUXgj2QmaA9dtJHvIkBzok=;
	b=2Anwjz7gflwUUGO2eccyUExTs3DGdMrEK2CAygKttyT+G7yOgBV6itdGpGPPmeMDFz2J
	 V6WDex0eFMMVkjc4Md1rHwjv0RbrwBpoIphDkzJGZJaHjHkmdvo2iEhaDMoOksWxZ6BCz
	 XYzm1jbKT24Q+kybnVSXcOHSrcFxN0/Z01ZFJ7xJJX80T0OfJ/BdqLdjk4kdIzAiWZ/XJ
	 37heKtxlyg2PPEAsIpf8unC/gMd/ATl4sURRimDgtCIymbbO5SMWHabNXjRO04mEdTPbe
	 U7eojb1HZCFGTltQkPr+pKBIgUheEee4kxs08syb+Y29GztxEPFATaMkgTNJYs9nKMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="I/Ln/mJq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08D160882A4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C08D160882A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I/Ln/mJq
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db33db4de9so94805ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792422625; cv=none;
        d=google.com; s=arc-20260327;
        b=cjr2iQIJ6dgD2ubEhbnL8RwUB4Iz87jAeYakCjw3FQypWCM+RBNgjPQNoPvvb/Yvlt
         n1pF+9z7SOKfqVjqqvcS4SQ27xkuBRlbtsKPLx1IcIuoYHbLoBQ+X8C93hXW+RfojVrU
         YX/CN4IrddVNmuD3qduVz8L6KjsnxCLeoeavyPVM2xK/92R5rZwkJ6wTtdjkW+REmnJG
         VCYRrxEgPxhaYJpNR/wi0jMOP5WNL5TgSFbEs9or2Np5xvSIltWjiVfBVqV1hHdcQRNu
         Pp0UhJ8OfpKS0kEJ4eHo+qiT2QzRmZxshkscMULqHxr3aaWDBRJegGBMT/iyoP67rQxw
         XxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DEKJZghqVH93r9LYP/6FZEUXgj2QmaA9dtJHvIkBzok=;
        fh=UT/DAV7WNzsno7bLW89sLcBT689Ay1OTXXBS4c37f0U=;
        b=sEze4nmvp+Wm622C21lqK+oGQXzGuvHe8rGKCvaEBeqEqUGj5QGQ4l5Uo04PYU5QDv
         clW3JsekFOItPRjKRezOiFdUZch1pgYGn4WJ6daqaeQPKGTn5Dt0yjKRc4LNSvif8rsr
         eY9LjWZe+SCP6++R4Mj6XfOw7sGWQmhPpJxdzFXCx3XBgUlsYt5MLd4fQuJHmkjiRplJ
         AghKuX+Nml6R8hvEVr7ZGQRyKp98SYtb7jyGrk52TROYr3y2Z+X6dNB7WL4SajIhVAzZ
         Zhs6pj/vFKegU0poA7B293Y6HjNZmMR3v7DXF7jgUX8d6MWFs+XwtUxoS1NWDrIJmiGa
         6jsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792422625; x=1793027425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DEKJZghqVH93r9LYP/6FZEUXgj2QmaA9dtJHvIkBzok=;
        b=I/Ln/mJqIEQM42PuxrK4Wb/e3qG7nMS8tS8HiMxsHwFLIL4E+4xVur+yQhObgZRT8A
         JOx/kSn0iORf7hM2B+f/fCdWjjk4FXNyIwTgTn52V63kGDQP7QIeiYKtec+SqzrvGswP
         U+s3ktb1iYpEChe2kUEID8YpWPbEUveDKP77ot/hhfQcBkHzpN/28GUMA+hIVHCRK0Vx
         6Xof3onHzCMFDWb0aRe/Y2OwwSXMD7NE9/ruS4ulyhqFzhcengU14ztdzxswEbi2aCXX
         O8kfqP6DozI2yhoC6mCSr1bvUtzlkrZO6qJw8lVjmMH++px8VGOGr47LZqryWAIqE0Mb
         sZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422625; x=1793027425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEKJZghqVH93r9LYP/6FZEUXgj2QmaA9dtJHvIkBzok=;
        b=mR8I0qIdpXYKHTiyjEuq7HICQdnUBKlrsDWbyXZMngI39QgkLHkEKIvZXTtfPAoOs2
         rjQg/T6kzGqsano5222IXikkEwxHpqPVu//aZZO6guxbfLzbaILBzHOhK/V/zC9yysql
         bwIbNGYxwRASVXPKWWnUtKmLF0BpjkWX9Hv8QJrwtVOxNidCpWvW8lEBnZOkH43KbEZX
         hrL0oVnyjkKQw7ApJ+hzoFJUq39AQXOOPXgoQWlR/x9kV9iqdxQ/joDkVBij0Y4Vzm4O
         NVaNDduLWOmJd25gCZqWgs9kENNxrfUl45KvZ/6YG3m74TI1PpgEKL34lVJvDLiGjZNV
         mI6w==
X-Forwarded-Encrypted: i=1; AKwUvBwylnnjeTJF33G3qL5Dk89F2gfFsIvbyoUh7Ha21eTMppZVMJwQF0cHP3corQ+h6muLslU9uu+ENhkzoSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL12GkOEEI6BZ+61+mdbeN6VUqNawVPm2hNc4K5BQpy5x3tTnZa
	vxPfmvRYkdIlh4sz7BkkvRucjGXsIDVrcFvAXkqszJ0OhPX8NOHTIdiz7Ziu99uoOtbqpIb3nVj
	JEwgPly4W+ezIcmE7L1OP8zotzSU4xLoGP1xPj+WF
X-Gm-Gg: AYBFou3Fi+C6f/EGyyJuKbbClUweh6hkRiFU8c1EnwVfu0YzblYZ4GXkFWSgc/pcj6n
	45sVTEWenjHStKsz5h521YZIaDwzUwUuV9qPbM6fiqmlZ5ANRs2V4EiFwDPkz6iAVouFH6eCUoJ
	GHB4263HKnwxPDxNa6MGlw29Aro2D2bwlygSGDmHRv5H6MpDwQV8TYlYzpHw6DKc8OBBA7WjVt0
	10FWT3eKsPwNxbdWx3Ig5xbgWRuSZ0+mnpjnF/2pQJj30xwXPAwDM8HC6xz9Fs54dEPc8AeOoj/
	hBh97Wy7/STX4z2wEvyUVmYsAtr/Io6FazBbq/MyuXe3ylVAT/R2OJH2WvOZ8b79AwJM8PkO7n2
	uSg3pLX/JNn0=
X-Received: by 2002:a17:902:d590:b0:2e6:344:7bc4 with SMTP id
 d9443c01a7336-2e9b3282e7bmr8097645ad.15.1792422624252; Mon, 19 Oct 2026
 08:10:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com> <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
In-Reply-To: <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 Oct 2026 08:10:11 -0700
X-Gm-Features: AclHuK_o-N-kLXCI0lLEF59ENPkLHYZOeNWe0US5TrjT-e2m6RlJOiYKtkm8cxg
Message-ID: <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:37=E2=80=AFAM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 10.10.2026 08:04:42, Ian Rogers wrote:
> [...]
> > So completely fwiw, I speak to the compiler folks within Google and
> > there has always been unanimous support for code using memcpy over
> > type punning. I'm not sure where the inlining decisions would be
> > impacted, as to my understanding those are made later in the compiler
> > pipeline and things like __unqual_scalar_typeof are almost at the
> > stage of the preprocessor. If -Os is not inlining small fixed size
> > memcpys, this sounds like another compiler bug. It would also be
> > completely valid for the compiler to lower packed struct accesses to
> > memcpys.
> >
> > I was trying to reach an implementation that avoided undefined
> > behavior and benefited both user and kernel code. Performance
> > regressions aren't a benefit and fixing compilers can be tricky, so
> > work remains. I'd prefer to avoid undefined behavior at least in user
> > land. I'd also prefer to avoid config values, so using packed structs
> > for __KERNEL__ code is a possibility. It seems a little sad that we've
> > lived with a strict-aliasing-compliant implementation for a year, and
> > we could regress that for the sake of ARMv5. I don't feel strongly
> > enough to argue for kernel land; hopefully, Thomas can say what
> > motivated moving the patch series forward as I'm pretty certain it
> > wouldn't be undefined behavior in the perf tool :-)
>
> Can we revert commit a339671db64b ("vdso: Switch get/put_unaligned()
> from packed struct to memcpy()")? It touches "include/vdso/unaligned.h"
> only, so the perf header will be unaffected. Or is there an automagic
> copying to "tools/include/vdso/unaligned.h" happening?

It is a little more manual than automagic :-) When perf builds there
is a script that complains if the tools' version of files is
out-of-sync with the kernel's:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/perf/check-headers.sh#n28
It doesn't break the perf build, it just adds noise to it.

My understanding, biased by my opinions, is that the preferred option
is to add a config variable controlling whether to use memcpy or a
packed struct. My preference, to avoid undefined behavior, is to
default to memcpy but set it to use packed structs for ARMv5. I will
vibe code this up, and apologize in advance for any offense such a
patch series may cause (ie I'm sure someone on LKML will want to
complain at me for using memcpy at all and give me a lecture about
strict aliasing being nonsense, etc.). Arnd or someone else may have a
different preferred solution, to which I'm more than happy to defer.

Thanks and apologies again for your ongoing problems,
Ian

> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
