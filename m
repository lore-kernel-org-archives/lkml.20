Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3346EF9F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068026; cv=pass; b=uluAsQzjFWvwavzBRuVpoeeOYOwumEujK9nhCOSLJa4nlh0fqnQym6q1hVzO5dPHfeh3bHikyHZ96lDMuptvCjOi1b19jcQflP0Aqu8LalxRLROAIY1Qo0ePSsG20g7Up2GjU5y4EOIHLDgAFP/1BY+3CKBuph5kMEqbpTtCkd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068026; c=relaxed/simple;
	bh=fiGuXF8pnYZgt9VLhaHvZD8ERe5p+iX/cvkRE6nZgx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtZ12fWQCNiaRUCKwfkMdFmOG3cEANrqVTbRC4GayMFr9wzXNH4UrIPlbeOqKEGK1xuaarSsABmq5QhZJWaDaUjmzVECP8ub+UFdyf0oGtdDbVySfLhVSExZAahBqaiLrDbEwW3PjwZMBRIJw7T4STpJ+0RRoTn2OsFmXYyqtF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J2cliDoy; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J2cliDoy"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66c7e3a2332so38641d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789068024; cv=none;
        d=google.com; s=arc-20260327;
        b=jT9k6w0m/lFbMJnoPlX4xbwuzBJj77yyeDHVwDfj7agGevepNOiMHGtRDSiT0DSK5J
         5yTUf/MmJXIOgjoZ0hrhduwog6hzisbQi9wFBqKjL13EQ8KWElQmWL+3t12aPP9biWAe
         Iw469Xw2dkZbMQT371qcetB4Jd0iakDNuKGYpMySUDUFyaW1sR2ik2RH/cYRMSFd18n0
         Ftm8LW+yUz2YLJae8NLdWjAMTF3GSPr1nZhrMpreKYs6Ec/4T9DnjicsAZHb899ZtT+D
         SskYuGWMXggCXOw5yRFxTjA0bsM+5Y+S4PqtMu97ssu6FMAmvXW+jwxv2SDhNNwwmJhU
         i4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b6AZ6dwl+nPhR9lRn8ryaNJ3HAjOQF7wNnV4eGAN9b4=;
        fh=7rIyWtNJ640m0aSuy0WewSsq54rZuLuJUme1KXdspMo=;
        b=GaGaSyOVwQ7U/VYkia09K95fI8vw1yrwwGdX93TmLZhVxMTbtyXkpCwEtfEc/FLBkE
         nVChmewCM7XULH4usTOkWd5Xl1MpBUXOCJA87DfKjoraxCmF7bfeqWpIN3JELJIxOXke
         J7vkOVYWqdaiIB09jvliufYMKHjDml5hCtbeK3q9XMcRP9iMDqUfqi25TNGVvi2LgGTP
         dgESRjWvBkMfXiLWXqUg0dPWtUoimUTPBdoF+zQ6kq+vRHCwQNh71v6Dvz58C7ap2BL5
         K3vDzcLv8wWObV9GS36PDxB1iw4ntiYomYJPUrDMvrb+RpxOUXPi3iQJDWtNPds1Pioj
         YuYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789068024; x=1789672824; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6AZ6dwl+nPhR9lRn8ryaNJ3HAjOQF7wNnV4eGAN9b4=;
        b=J2cliDoyTkgg80jsWjGdwBZTk4xzKHYzUEYJLMIlEYq+eRQIxv1EcfV0W5LrGb0G8L
         daKbDeKtNSZl8Blo5/yHpNVU2PBal3O75AYKJXJ6yZ5eZOX3fRA49IEs3JiJinAMT9Fo
         IV6tZG9kFA1vmGu7lEUAtT0da/ScwQTAO2+Gq9tgBY7gVZ18DaGhPZ3CGRCqiiTLqM1l
         Tkbhw7IgRd6Hw4l153FTB9cYnxRMZlmU4egZW3Sjj0d3UiTfsg0quCBBys7OiFis6M3M
         PB0tmJR1luJyn2GsilfVLpYbuGgWsFwvuEqIHIjfQobC125FqW+hPl3inxfIsx+kC9td
         5EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068024; x=1789672824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b6AZ6dwl+nPhR9lRn8ryaNJ3HAjOQF7wNnV4eGAN9b4=;
        b=YEw/uk6vIyT2OiRl1ww1wxeB+JOSKoL0d2yrr0C1B6evGmnAjVt1tdJbaev2r0MI1t
         Xkxsv6PiK+nV6Bx+UUE+Wrkf1jLvC/xGiVVnuKFQfPoNBR7si9PJSQtJ094AQj0ALpKQ
         55BolU1Uyeu01HZaeeCEB5EvOHNqL/jqOjTKoP3aJbil0MFR+lB7DfKK0Gp2EMqVRvZ7
         A0hITlUbB5ImgMghk73x+h7jjbNxN0cDZx2fDGbltk5o9sGEFgdNqxXc70281Xc2yOks
         BMyriBrKvjdYt7oj4uFTk46/+sdmnf3NVi6xmhzW4P936Crjdh6v/k6W3F2vKafIV4jT
         iaPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwns9hU6hyaWlAo+FDRiofdMW0uREq+BSwYWYkyH0NcTApCOif+DuwoRoZX+6MLGGwVCBJf9xBe+MivvTE=@vger.kernel.org
X-Gm-Message-State: AFuF++mnXCV6wgCkh0YGsnuWKS3Y9xkxqovo3Oi741IvESyBmupXvotX
	Gq995drnWMBJwb3QG8Y+Q5kZkPepetu7Cme6X9MgX1vdBmBgUF5JN8/mbLYHQ/UVrv73lG16bMS
	Hc1VtJuAZObTDRwuwMHUmXKBsfLHoKm73W5dmOuoM
X-Gm-Gg: AYBFou2FUH8QQnIe2VaDsfDaFCv43C6WDq5Il323R70pecyNvHmwdKCqTJ3v5w3QgSW
	MeADoDsEv8syNN2d2pUJgSqJB4dJIwpetb0V4dV0AXb8IRn7P87/TpUhFTzqaKl6/RF9d6Z8gbc
	2wfwM8Tzj9AWq3wTApweFrY2ksDo3Vh8/Ou5I6ihRPU6EF19Vq1PAeYINM9jpCtSrR1z/HXtpLw
	Gyk+yFdqBDIFBFK8Of2z5qlyJJCYSK6KKQRYBjJOSQBPvKPhpvrsRhwY0u8dOSqZL4QZdOL7sXA
	gad13VXVUNtFo/u/g0CqaM/5sM7lR29HBH+F9nVwgngE/ydVtbZ6WAGHrlcCEd1kwcjdU2nrzRZ
	sxiD+d48xHcI=
X-Received: by 2002:a05:690e:80b:10b0:66f:c1bc:c097 with SMTP id
 956f58d0204a3-6712476c288mr382065d50.95.1789068023584; Thu, 10 Sep 2026
 12:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <aqLhHOrXsa30PBVU@google.com>
In-Reply-To: <aqLhHOrXsa30PBVU@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Sep 2026 21:19:46 +0200
X-Gm-Features: AcwNN1XEJG4HFWxM40HlnJmqF0_xrl9dxVW2S0hyaOIau8OztfJYTNDdG5jUhc0
Message-ID: <CANpmjNNF44Y_k-Jbx6TikXgTnhE3G_aRDFXAABosZexOkn0jeg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] KVM: Enable Clang Context Analysis
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 18:55, Sean Christopherson <seanjc@google.com> wrote:
> On Thu, Sep 10, 2026, Marco Elver wrote:
> > Enable compiler-based static context analysis [1] for x86 KVM, along with
> > prerequisite lock annotations in virt/kvm.
> >
> > During the initial annotation pass, context analysis uncovered a missing
> > SRCU read-side critical section in x86 PMU filter lookups; patch 1 fixes
> > this bug.
> >
> > The remainder of the series is strictly non-functional: it establishes
> > basic function annotations, guarded_by annotations on core structs, and
> > straightforward refactorings in hva/gfn range walks and guest_memfd to
> > eliminate conditional locking patterns that cannot be tracked statically.
> >
> > Annotating the MMU (mmu/mmu.c, mmu/tdp_mmu.c), i8259, and Xen requires
> > more invasive changes and is deferred to follow-ups.
> >
> > [1] https://docs.kernel.org/next/dev-tools/context-analysis.html
>
> ...
>
> >  43 files changed, 745 insertions(+), 236 deletions(-)
>
> For me, there needs to be a _lot_ more explanation of what this buys us to justify
> the extra annotations and ongoing maintenance burden.  And to a lesser extent, why
> we should rework code to play nice with context analysis

Patch 1 is an example of what this buys: static checking shifts left
and prevents bugs from actually being committed. Context analysis can
be seen as an extension of kernel C, improving its safety, and the
nice thing is it can be enabled incrementally (no rewrites in other
languages needed, though yielding modest safety gains at a fraction of
the cost). A side-effect is compiler-checked documentation
(annotations), which helps humans and robots reading & writing kernel
code.

The question is simple: is the cost of ongoing maintenance with
context analysis greater than the cost of the bugs it prevents?

> (I assume we can simply
> opt-out on a per-function basis if we don't want to play nice?).

Yes with __context_unsafe(/* explanation */) attribute, or
context_unsafe(...) expressions.

> I'd also like to see what the MMU changes look like before committing to supporting
> this.

If you're not entirely opposed, a v2 can include that.
