Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0AD430301
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381338; cv=pass; b=hGMA6gW+vnsY2ULg9melmzhxs3ZsjzwgPnOlKx9zAy8zwBZfczPpFMhxNiBLm5l62jIRhM1PXCQ26jlYauZaS6pQ9mPfny0CAp+1N7mQsWFos01gvL4gYPsBC6z7yCQq3ZiQefdnGpmprQqdv1cK9bODahuyRSxHKM4EWWKcwlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381338; c=relaxed/simple;
	bh=5sxMBe0snzkKFXuvy6PdOP0I5NmWDgN+S+DvqQKXO1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwKf/ZRBCfkEPtKtHaJ/zegCWSIIevPknPmq51/nANkgzjWdaBuNOmLx6MFCvZggNRQkOccCTJu9j8Bq8ams6h6SxJTfRt3DUEL0jcONiISlZ85WaZk72S5Z6PjJReI+3HnHMc1dJvztYhqnqliRGKEBYy4igB2dKyl4zDxA248=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RScg33f1; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RScg33f1"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4661960a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789381336; cv=none;
        d=google.com; s=arc-20260327;
        b=RHeXmmhxcoU3weeP/3jWXZu+RYibAW9jrkSsniGLO2MpJQW8k3rtccE+Y5SftN7zxQ
         vyjYGLSR1TEZxDWqAmnIjIxPEiFcjbEme9CEIPsutye2kaxhFtpVrahtDJULRyw6vI5V
         E/W8ZQ3/Eq1A1x1gTNZWl3OSXVEUH/Kb8EB/OivChTvQcO0V/GQpygOkBIWji2ReE8a9
         WKVIYl9aFVmpMBKcb+4In/RaJmeQlRxYQXgKDBT1tWSvvj63vAikT1f1nh9nTYgErwsn
         ozwoVBQrtZSAsp4k9jjcxCqxf/cH65N/c10Y0Dz+TU+jqiWihBeec/gStaSuRfx6huE5
         m5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FT/fVqoE/mHKs6Mc3emQvCK5DcIHjdINJZPlNBzcoJs=;
        fh=Thz1AOPQowsbXkxybMtT389cbfpoY4cJww/umwNbNq0=;
        b=PBlMH6T5dyj4vjIsKPobybKfsIJktxWMrylZLNyW/z4S5t4c3CUz9tKnA72ZANdu1d
         yZzHrsW/q1OO9zbQS9OBDeJp2+swGlXGCoAPXJzlq/Emny0QWpsrXwPhQ9ohtrqO7IFI
         p97wp4CTroUn9a0np7HDPw9BW2OKreMBLQaSpB7ReEuHEUZcOvgh1texy5bo3MY9kcYL
         l11YbwSbb9ucyrEU9w9SlMAB2AUbGuGpNQBIua/p3V5rR1B6//ORrTqVG5fBASOgvKWr
         UWPEkEuVQ7WdF04tCGl2GECmksGoUQQYbR4HhLzib9Cn39wVKezEhbSOTZJysQZsqXkI
         jyWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789381336; x=1789986136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FT/fVqoE/mHKs6Mc3emQvCK5DcIHjdINJZPlNBzcoJs=;
        b=RScg33f1P4DAE5qifoy8vZQFwQbHS75RKsB9sHT+VyvsYLdYbu/kYHM8XmXcKHHjKO
         Dnq3RAgAiJF3c5HPNCHTKgAgnHlhibzF9Ekg8NQuQAH1bA5BEEJpYUGLMDVWWjYV0905
         TP5HyA/JU/XvmJkgabPhssosmF77OHPb2Xyky1l1SWRmEO3otOtVUIbQvZjEWfM/Burq
         wwTc44uYvcKLuY2/D0tpL+RKHCI9DHIZ8rG2ss/TYiE0iEM93TFg7I+44+OQSbK9pkx9
         h+m2WEQvtis+Uo+FxtiKg634r0cTTGksJXcKoemQ0G/csTGPGhnW3RTw2vZvaPpiUhGA
         G2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381336; x=1789986136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FT/fVqoE/mHKs6Mc3emQvCK5DcIHjdINJZPlNBzcoJs=;
        b=RuUGIACio16r8NkQR9iBzHe3DTX/ayI9Efn/esyhcYfauo1Sobsbijnslo2af4PyML
         HUeGWmH37IOmFz4y0sJVmpj9/rl+6K5kE6IKL9oatkh9+Mcr7GVQdemTxHPxZYHt7Leo
         /swBHVY81e9S/oPmXZEDOXFDGk9xbCFTTe2euNT73SxRn2BzRjQxFI5IrvfVmhMz7ZgY
         hiqtWHNYMT7RFTIvBQgyUEnfFg0ONqjLu0zU9YJljM4LvgqItzHFML6zO4qf4dbmT7d4
         HbGAtjdRCSB5m55Tn2Fb8XVxRxLhXqnDd1SFsEAEZdFycT0ZglKH3Q25EYJYd1bx1Y+u
         qmnw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ9+vo7mIvQY9WZADEtAMVhBYi6H2/ad3iOXne7uPKx/Lk0MrpBu1e0M3U9ueHePIlbcl/W9pcTMi81M0=@vger.kernel.org
X-Gm-Message-State: AFuF++kX+gJz1wSjC6PG5JSeeBCQq/8MC3YrkZauq60gxh4knHXy7kxb
	vOyxsvYd4JNrFLb7KuhPmUyHmZf3pwnbvDcPcBVZ+g2kFUNOhSKeAqHu15yhSWAAyKUM7r6/aYi
	8GyT4pqHiPRqEK9s9gHcBKIEG4bstJmBbw6+NdHS1
X-Gm-Gg: AYBFou2/+j6Ztkfti6JStayYXXdAEwCbG3T1KpyCV12pF6r8ir5LpJd8joxO+fNqPpd
	0Ab5Q34QGpqifrfhpTZ794tz5NONdwhcy8RY/qwpdxMaVUCwW2KrYnjiPepb3KW8d3c2ypYdeyG
	IAtLxm1IjoK/kxTkePEncxUZbAHA2sF7e4YycIZg89Qb8xPp8kfpPQkJz0J0AtiBLqEKMz0+Sqa
	gwnyZ2pk4ANnXLr1je7ZFyKx+l4LbtjVP+QiKYFkb5OJOWVP70K9R0J7xkzVopipkoir+78DBfr
	fxVcuL32Cfwy4HL89WzolTLHtOrrU8G/68rV9bxS61lnKLvJMnRqylznKfFFomxprYK64gBHfHs
	9x2wvCrVRDQ==
X-Received: by 2002:a17:90b:4b05:b0:398:d8eb:cb2a with SMTP id
 98e67ed59e1d1-39dec0f71a0mr4165652a91.23.1789381335363; Mon, 14 Sep 2026
 03:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724192122.73080-1-kmehltretter@gmail.com>
In-Reply-To: <20260724192122.73080-1-kmehltretter@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 14 Sep 2026 12:21:38 +0200
X-Gm-Features: AcwNN1WiFaDqTaoL1d81mtHexcenNZZD_Jku709_U4oDv0VrSwzDpRvghU8dNqs
Message-ID: <CAG_fn=VTpkAUHUqWgcqigQ8UaLDtikZJmOE-VozemA+RbyJVnw@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: report the first spurious PC in the interrupt selftest
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Marco Elver <elver@google.com>, Bradley Morgan <include@grrlz.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 9:21=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> The KCOV interrupt selftest enables KCOV_MODE_TRACE_PC without a
> coverage area so that spurious coverage causes a fault. If the fault
> path is instrumented, the coverage callback faults recursively.
> Observed failure modes include a stack overflow on x86_64 and arm32
> getting stuck in abort handling, neither of which identifies the
> original coverage event.
>
> The recursive failure is not new, but commit 9a79524d1420 ("kcov: use
> WRITE_ONCE() for selftest mode stores") made the selftest effective on
> configurations where the compiler had previously removed the mode
> store, exposing it more broadly.
>
> Use a two-word buffer to record the first spurious PC. Once one is
> recorded, disable KCOV, report the PC, and panic. This preserves the
> selftest's hard failure while avoiding the recursive fault path.
>
> Add decanonicalize_ip() as the inverse of canonicalize_ip(), which
> subtracts kaslr_offset() from recorded PCs, and use it before printing
> the PC with %pS.

Looks good as it is, but increasing the buffer size would make it more usef=
ul.

> Fixes: 6cd0dd934b03 ("kcov: Add interrupt handling self test")
> Assisted-by: Claude:claude-opus-4-8

Documentation/process/coding-assistants.rst mandates writing:

  Assisted-by: LLM

I don't have a strong opinion and find listing the specific model name
generally useful, but 816d9992d9ed434ec52cfbd63080d518e535a41b has a
valid point.

> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>


> +#ifdef CONFIG_KCOV_SELFTEST
> +static unsigned long decanonicalize_ip(unsigned long ip)
> +{
> +#ifdef CONFIG_RANDOMIZE_BASE
> +       ip +=3D kaslr_offset();
> +#endif
> +       return ip;
> +}
> +#endif

More of a note to self: fs/pstore/ftrace.c defines functions similar
to canonicalize_ip()/decanonicalize_ip(), we could factor them out
someday.


>  #ifdef CONFIG_KCOV_SELFTEST
> +static unsigned long selftest_area[2] __initdata;

What do you think of increasing the buffer size to, say, 16 elements?
This way we'll be able to detect more than one spurious coverage event
without needing to rebuild the kernel.


> +       if (selftest_area[0]) {
> +               ip =3D decanonicalize_ip(selftest_area[1]);
> +               pr_err("spurious coverage detected during interrupt selft=
est: %pS\n",

Nit: should this be %pB?
