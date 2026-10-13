Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B8B3A7F6B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869864; cv=pass; b=TIkyylNv8gdCmaC9zby3driCsOe5/8qSClw5gqbXRMgvbsq86F9OXCO0P7bDeTO0WtXgYSyrg36oJB8GvPFEg0zEg6xEsLuKNX1lFn/6NwNNY6mN3UYgtoPOsnog6OS9CP3/cw7sJ8PJeVRiF6c6rojuVWvhzBwLS4rlVHrE90E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869864; c=relaxed/simple;
	bh=/zPpkCpGpUzh14I3YBtDsGa/MwxiYOQTelF5FVqDA5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj6Ott6W1HDkJlE6THHdxuQpmflwd794IjGNfGISJj4XIUZxVqy1HCB1hdF1hboYTcHyEtxefNbh64Sb1HK7ni7OYKVIGBwBEQ47MlUtqvpru1h8CaSvIUZ1voS5bEXWUjDbZUSX8PINV4+vdnud6jC6aZpq9+bmR+4301IFPYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkzzHC5I; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkzzHC5I"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so3754451a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791869862; cv=none;
        d=google.com; s=arc-20260327;
        b=PqDfXjn9HR6P6aVjzkNmCJHB9Zc71x0sM+ihJilJbQlkT9acdJedJjXtber0hf8k3d
         OIUWF1gSNLnAZQpP9d2NpCsKgJQPxIVfVlyqDuaqMD05O7CujxdC6o53R8YyowkhNdrc
         nxmkQcyHsv5ynrJrDmFIs2a5065Kjc6EqGCw0/nr8217kITXkGG6KWmcnK07EwL+uDdL
         XKZlNdmUjoLsBtqcDPls29zP+v56gbqc+ZbJjLg1K3Sn5KV/16U2YSfhC5XYJ0+gJ4qD
         Q3kSQeIkYN+VKe0WFB7wH4kUXozliyEHHcj5F0YCRYMuaNpIT1nT3wC3ahUulj2XvbVH
         /orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Emtdx2R9x4ZRsBc5vXH6nvBta4+jFC7pIdT0qhibpOk=;
        fh=b3pooTrgzopGJUiyMJWiwRPMfcDwZhvoZ4kULB7VyV8=;
        b=KnxMLJZYzrCNHp3V07TcHjnTHO1/wqchUvt5CXDQz9PH9xvYM/x4TL8Qqj4BEmTQ35
         wf+EWy0hDZ2UKxqsSiMKalJJWU9YWBRaiSKol7H4ufN1607d7vHoPLZGTo7YWUIa676u
         Hm08FX/QyDlXnigW4UyoGEfty0CPZI/55/Ir/V2XIHu7W4usWJnhdAbLIYt2K8U0Iwom
         0LBGUOwaWkUYRzuyuW2aV5BS9w7lRAIrRCsJPaotNlWL57EAcHmkF+Iaz65UmMK6yxVf
         L0UfDkYOAoREivUOGmMR/Whygq+TahF/fHOgR7X0chPUFMcLzDlsUSa9BVkkRx1QkDFb
         yHUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869862; x=1792474662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Emtdx2R9x4ZRsBc5vXH6nvBta4+jFC7pIdT0qhibpOk=;
        b=GkzzHC5InTs1tqSjidKObNm9WcOOzoN+GZLlzNjA0NLYFlxFQJYN82AZNrlfFErxSP
         u0urpKrjahsLtAcV/TRWafmmZWHLUuzvCFf2ROEutpnNGowrdZYH15QuJL+NxDScyFQw
         ieSVly4yu1Zpb4LUD6HJ/3lonOJA/eDS2Xxo7KrdLxRDlbTnfs10GTip0Kq29PCeIAbM
         mU0LppOnUi22+a8UIRjZGf0bW+UYFBphetfDZZHYzhvoFU0BgBe8Q3BFvXDmKucqe9kj
         lmmPTQa22/ZRzyujiVlua+X1KUAo4eJzLziqQyAPm1fQ5DNbZCG1PNFE9Gj7CuczWu8X
         uWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869862; x=1792474662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Emtdx2R9x4ZRsBc5vXH6nvBta4+jFC7pIdT0qhibpOk=;
        b=KMZVDt2BoJNGqoED2WUozrrQ3YDZ1K8x4ymC3ldg8pAcvSts2WpvndAbUDGY9SRAfz
         rFCWzTWzJcAyeUZEe4Rd0W+HySo5shcyq07petNtyFtRLl15YkBwe8VJrlShxRN6FDAZ
         Kmt5bcQq+WdxlL09Qf2368n+uiCReguBvssaMAOTtv5hqTlehxuKz++KItTtESNdkFsH
         Jo2BSRbEeD0+UGvB4WCdM7UDQr3cVTP+EpWEhWFKoIbwFcaOgEbXdQZxakY5E766xJgd
         RCdHiw2MYS5LLN4pc25Cj0adCANg3OnzrlwKdvtZFyE3vO1ERB6ygsBvpg2MaXcXE/EI
         WFCw==
X-Forwarded-Encrypted: i=1; AKwUvBwqsnA3r4Y5ReU2KBq2/hPuF+4a4F1FlaMI8Gl5/gNfy95wCK1ww3JJyesrV4JsmhPQh/KVHAUbhb3I7FU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOvtawmDH8/lJ3bTZqZ1iv/LfgdbnC6KZhUzq2RvUb7FTldmrI
	v3b6rU9CXzROpWHpAXYJ4NsBpymWM29PEJt9iLyv9hZfJT1yJ1ycd9jCaR7YJk6ds4gUqZGkzNs
	/gKC8ve7U2zOK6ttVmFU+ZfoBDS1ZdsFuwUz3aJ8=
X-Gm-Gg: AYBFou0UDpIZBH4XujHF6AlW/ukA0DOuz1UppN8LHmuSELZAoeMzFJKeSml8Anaf7oA
	6AkwC76zdc8kMIo69qeF9pNk0Abl5MEJQF0YJcksgTSLEWm97oZZvzj5kORnpKEhO5tm5WsRC7R
	YDT3FtYiF/ncau9Dqcx83dNmBM69I0PUaeDzgF1AJ3lOGz+Wc1jn7dCBvGKcECefUW13kMY5tFZ
	wi9i4CZRZ0YGlLrRFpaP7uBfodw/hoi3pmTR+BZyOpDZAcJaRTZa/48Vq41E2tRO4iQJJOYw7BA
	PN2U8CkT2OdNJahNoxRWk3oAzV/qatmKKCZdTRsBB6g8CKaj2tko8hjl12+BBDyqPxU+hrQNgLN
	hHK8O459aUGYixDlUzYSTrz5+mKgBYIoSO8pNlvDIA9mWn7uVXV38
X-Received: by 2002:a05:6402:5193:b0:6ab:e30:c9ac with SMTP id
 4fb4d7f45d1cf-6b17c2002d1mr8952418a12.6.1791869861425; Mon, 12 Oct 2026
 22:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-7-linmag7@gmail.com>
 <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com>
 <CA+=Fv5TC4OTgVKXdnqDWawXBm4M1m8ZHPJoX6wL8K8fdyPo5xw@mail.gmail.com> <CAEdQ38Gcfco9N62rXueiwFBF+r=7A+SptYUsecOdq_ipihKmKA@mail.gmail.com>
In-Reply-To: <CAEdQ38Gcfco9N62rXueiwFBF+r=7A+SptYUsecOdq_ipihKmKA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 13 Oct 2026 07:37:30 +0200
X-Gm-Features: AclHuK_636Ez25TyDTMPAHDw8LMknG62w8SHUbBj7c5o_llp9_f4GKNC3D5_8zo
Message-ID: <CA+=Fv5R6AjLuNhQ+1BLjjkUh+LLmzbte4HM=S=1+8ReBvoj4CQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write
 parity errors
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 13, 2026 at 5:20=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Mon, Oct 12, 2026 at 12:58=E2=80=AFAM Magnus Lindholm <linmag7@gmail.c=
om> wrote:
> >
> > Hi Matt,
> >
> > On Sun, Oct 11, 2026 at 10:01=E2=80=AFPM Matt Turner <mattst88@gmail.co=
m> wrote:
> > >
> > > > +#define TSUNAMI_PERROR_FATAL (perror_m_uecc | perror_m_perr)
> > >
> > > Why PERR and not RDPE? Bad parity on data read from PCI seems just as
> > > bad for the consumer. If the HRM says the Pchip poisons that data and
> > > the CPU takes a 670 for it, please say so in the changelog.
> > >
> > > > +             perror =3D live.perror[0] | live.perror[1];
> > >
> > > The changelog says incidental PERROR state on a CPU or environmental
> > > vector cannot trigger the panic. It still can on a system vector: UEC=
C
> > > or PERR latched before an unrelated NXM will panic here. That may be
> > > what you want, since the error is real either way, but the changelog
> > > should cover it. It also depends on the PERRMASK question I asked on
> > > patch 4.
> > >
> > > Two things that I think belong in the changelog:
> > >
> > > A CPU-detected uncorrectable ECC error (670 through
> > > ev6_machine_check()) still does not panic, so after this patch the
> > > policy differs by who detected the error.
> > >
> > > A PCI card with a marginal connection that asserts PERR# now takes th=
e
> > > machine down, where before it logged and carried on.
> >
> > Thanks, these are good points. Would it make sense to drop patch 6
> > for now and address the panic policy in a follow-up? That would let
> > us consider RDPE, CPU-detected ECC and previously latched errors
> > alongside UECC/PERR, including the impact of a device asserting PERR#.
> >
> > V7 could then focus on the reporting and acknowledgment improvements.
> > That would preserve the existing continuation behavior for now,
> > without implying that continuing after an uncorrectable error is safe.
> >
> > Magnus
>
> Yeah, that seems reasonable to me.

I'll put out a v7, focusing on reporting and acknowledgment
improvements, preserving the existing continuation behavior.


Regards,
Magnus
