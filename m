Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389901;
	b=lkueMT02rvCihtfodpi9jFaCtydPIRZCfTofcb1gRhVGTIMHNG+Ni+EJg1bJqJ+vnCA/
	 I0h6DgrqtbgLyYwfa4A1UYu+6K+O/poeodLxp3bNTT8plU9iUSU593yJv7FAmdKHxH7Wj
	 3sRzVkexJgdKO0BLSy/h70fJXhFcSsH+JbB8/t2Ow/FfzV13ncFebyTIOu5JM0phCcLzD
	 0Bq1IFyLchZxrVXjxav++K2mo48s0N9x5Tp4Y2LijiNPFlMNNMD6anvcqmuFcxrZkOjy5
	 JcS8v0UXGXRB6UOvveruD2d2HE7BXYFf0KKTgfGtjl2fEzEVDi+sySGbO1DBEo0Qzrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mcP1Za+h/1XIgDOTVtisn2Oic4OHK4yE4jC+JPQehyY=;
	b=fqAjeEdi4STsvtqr7YCID0BICGHxBUu/N1FSciypFkSJIIDXy9E0bJiycK5r5rh4kfvP
	 KBPiGN6LKBXXFIReR9EQGDcNHdthXzakcA6C787zR+bHP0L9wce65EmAHV3SfZalADRCv
	 pePK4MwL0H7b2WTewYXQxehR8B1iMW2ZGsfYltTq1BWggo9pAKJq1aIOwEsDH3d5C0246
	 Vj5az6df5haQkwEj4uzQS7c0OQx/WNvXYJWoBBc4rtBMtEDXgDYBaZDXoEwUUOGjMr3OI
	 ORhxkXEhTkQCiQN1iH/HCNqTM20RBQQa0iVpfcSxxr6zJjhtHmuLwiMHL5ofuKhd7OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pcc.me.uk;
	spf=pass smtp.mailfrom=pcc.me.uk;
	dkim=pass header.d=pcc-me-uk.20260707.gappssmtp.com header.i=@pcc-me-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C2w8b7OY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174360A2636
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F174360A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pcc-me-uk.20260707.gappssmtp.com header.i=@pcc-me-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C2w8b7OY
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso391956a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:38:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794389899; cv=none;
        d=google.com; s=arc-20260327;
        b=V7DWBfhVTD5YTLYraGA6mFekOrnsN4CFJ9OIC4wyq++OCSoqioDqvE7MbE4WbJh6a+
         YJ4WkTaK0Ei4mFGd8GIrea5UrduWCAGO2N5HznuQsEISbnA6oJADmUTkxKiq3mxIO1C6
         cGy0OH/mgd1GYlFT8Gl42gFjr1IlEiZszfZTEBLTLBE8StkgURFTRLukMZroiQgEka8T
         n45RBM/6+Ae+79mhOwJs7qV2JPBODoQhuHH6YucbFg7cNt60KGSZcgfZHUwjsNINLrlG
         vU2ExTO07b58BjqMxi9n8vNpE9nhU+zSMLw8lv7L57j1aCSzFgJODwv2Hbts5Hkg6azr
         2PSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mcP1Za+h/1XIgDOTVtisn2Oic4OHK4yE4jC+JPQehyY=;
        fh=/ByzhoosHpy0iD4M71jhKG4KwTbZK4Ujj49vEGz45Tg=;
        b=fbiMJCltknz4tJKHemmdwqy5Kdg/d+Fbl93/l+NMMn509+JC6+7zljcJsAR8qPI4YV
         ZAQRpdSrBW3GS+6v1p7QpTJNNoyfUQsJzNEf6RuGblYGg5sA6a1YZFLk3QISRCPjmpjJ
         OkZpwxgmA0hmnsQ+QcBHRcxXyDNGSJSngQifFoOf518JMGsfGBdD0vxD0gRXr0T5DI9O
         YWhKhyfHthM9KfRog8v5i6RJbDSAbEtrrvL0hV3IFUp5R63yrC0i23dgUM89T3cAkQ8l
         FTf4M+X6zoelwVzTY6w8Wp7aXE4LU1QznqkF8SH4+RTO3RPgcLQ/vqZBlv9bc6tvfw07
         JORA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20260707.gappssmtp.com; s=20260707; t=1794389899; x=1794994699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mcP1Za+h/1XIgDOTVtisn2Oic4OHK4yE4jC+JPQehyY=;
        b=C2w8b7OYkg7O6ncEssqboYxo4r22YL6J95e/T49TeMXUL2k0xnALN9YymFBsayWC/Y
         /aiCRjZweTxNor60miNWYMu5GTviTVd+I2jgn9sJflJJMvEgRDTFbUcBWBtVxkBJ8nKK
         e7AAdO+j9b0hGq41NCxDbWSFFg990yTj4LaDBrvZWHkhJnGNh4fA3ISsavIbx3MYZDyf
         SNMIilWJLam/OsH0oK1KbGIH2rusvJilQJoU5oDhHomPnmCf+zIoHZkLL72MuOlrwaC9
         u4BXGOqjXz0vDDexPr4YyiJXEX2H1cc+QJRfyjzBl6IaAE6Mpn9EnyX01x3Pf81XuVXC
         1+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389899; x=1794994699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcP1Za+h/1XIgDOTVtisn2Oic4OHK4yE4jC+JPQehyY=;
        b=oaD29Br6hxFjluKYqf2wDJi2N8Xj5K6eHbgHS5R82PHZEuaqsZH/QT0D7HpMfue3zl
         24o025Dkjv3Qqqns5yhAHD0ZKhNqUejRG2+b23SKLgxgWrD0ofq2nOxrZhGtOmWvBOlk
         ZA0pd/d3D04sOR2T0EW7/jivKfYw4ZwE8UYQxV6E4u610yTzjNASOruG74tdRgueeick
         iOl86cHN+swjLiSk/bATFMGj7kEnhK1vyLjSpgsCmGlsW0FWJ4gBeKP7CXLibsGo1THp
         TaV/Yb9kFiiplsKnbX9DGjlhEaO9O99fpsq0JBb2fJS901XTYc2sIy8szfZkCJOu69Zl
         Ct/g==
X-Forwarded-Encrypted: i=1; AL+hErGSsAGegzX6nfUuo2KjPL4u/hjytUOoMsEj77e/ifdvcP/bmkmWrVks+WwR6IPPZxZcIaSWEeONi7lrxfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OthnaTGf+TstylKgSxgBcMmsMPbL8oKb09etO+cOXHuuNSb+r
	7ZwXHq7mSSj2cWBTF6m4MLfBxRdU7ypA1oe2rNzs3YoHzz7Cg8w1CPNcBNAmfdBBpbn7v3lahqK
	9hdBIa95k5smp7lhoKy2MOt1ZthYth3/HJ0Etbz779Q==
X-Gm-Gg: AYBFou1oiYXu7Boxqp8b6gmfWUZgH1dB9TtUzl7z9Ful1DuienNMzPN5lrPbLwGE0TV
	6SbtZsQtOCWUqH7sBMbU33oS4WP0VTtV3RCQ3shUDZRRwC62TUMjwB6aWtU56itaaAD9OrEymh7
	r58VCnHuhs8M/l4T2Jk1wi3doSWy7BY5lq9y4KXg4XvzceM5JNMU06pG98e0LE/uCS6yJUmsulU
	XKgCcS3TahD+ndviKav1McxmepCtN6KnIzb52/gfWztQtTuygWQDaC26338c6W5N08pU6Lwm8Cs
	wK29QC5FSEJND0a6x1O5FVodyLuZNIMObcwGsCgeL8Z1926T9QEcKWMjKaip7k91yhSYnGG8OTb
	0ojyOhoSrhWX/rP+TjZhD8DRDgiTIadbKeKxTcI/6jisD9LvZOTpT9ngda+I+jWjQ3p7u4g==
X-Received: by 2002:a05:6402:13c5:b0:6b5:76be:be54 with SMTP id
 4fb4d7f45d1cf-6b777829b2fmr1504916a12.35.1794389899169; Wed, 11 Nov 2026
 01:38:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
 <20261107-mte-kasan-split-v1-1-d84ea5f30f94@google.com> <avNjcKtuQkZW0_Sr@arm.com>
 <avQqdBEGwje1iVlz@google.com>
In-Reply-To: <avQqdBEGwje1iVlz@google.com>
From: Peter Collingbourne <peter@pcc.me.uk>
Date: Wed, 11 Nov 2026 01:38:06 -0800
X-Gm-Features: AclHuK-VneSANYCNXJ36s2sFC-63re0-bOqlxxsBmGtmuBf0Sv7UobeBKGGbfM8
Message-ID: <CAPQLkRi4zdGZRy=59SeaRz67Vj-+jEJKH-eWMZZ=kk8t-=3-kg@mail.gmail.com>
Subject: Re: [PATCH 01/24] arm64: Fix lazy TCO clear when enabling user MTE
To: =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:57=E2=80=AFAM Pierre-Cl=C3=A9ment Tosi <ptosi@go=
ogle.com> wrote:
>
> Hi Catalin,
>
> On Tue, Nov 10, 2026 at 06:33:20PM +0000, Catalin Marinas wrote:
> > On Sat, Nov 07, 2026 at 04:36:07PM +0100, Pierre-Cl=C3=A9ment Tosi wrot=
e:
> > > On kernel entry from EL0 with HW KASAN inactive and user MTE disabled=
 or
> > > in async mode, mte_disable_tco_entry() leaves PSTATE.TCO set to avoid=
 an
> > > expensive write, as it assumes that EL1 tag checks are not needed.
> > >
> > > However, if the thread is in the process of enabling sync or asymm MT=
E,
> > > set_mte_ctrl() updates SCTLR_EL1.TCF0 without clearing PSTATE.TCO! As=
 a
> > > result, kernel uaccesses miss tag faults until the next context switc=
h.
> >
> > Nit: next context switch or another syscall. I think this makes it
> > clearer that the only potential missed tag accesses after the prctl() i=
s
> > a signal frame write as we don't have other uaccesses.

Or any other kernel entry such as signal delivery.

> >
> > > Clear TCO in set_mte_ctrl() immediately after setting the task's SCTL=
R.
> > >
> > > Cc: Peter Collingbourne <peter@pcc.me.uk>
> > > Cc: stable@vger.kernel.org
> > > Fixes: 38ddf7dafaea ("arm64: mte: avoid clearing PSTATE.TCO on entry =
unless necessary")
> > > Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
> >
> > The patch is correct but I wonder whether we need a cc stable.
> >
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
> Thanks for your review.
>
> I'm happy to drop the cc in the next version. The rationale was that this=
 fixed
> an unexpected userspace-visible kernel behavior and closed a window durin=
g which
> tag checks were not performed, which _could_ be a concern when userspace =
enables
> MTE for security. I can see how this doesn't make a strong case for backp=
orting.

I don't think this needs a cc stable.

I'm also skeptical that this is worth "fixing" at all. All that this
patch does is move the TCO disable slightly earlier in a way that is
almost unobservable except by sending a signal to a process at the
right time. So this patch only has a useful effect if it would
otherwise be somehow possible to compromise a process by taking
advantage of the kernel's signal frame write. Even then it doesn't
really help mitigate anything, it just makes the window of opportunity
slightly smaller.

Peter
