Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F8A3AD509
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781093; cv=pass; b=VtdxAmfES2Bd/XwCuy+xb/plTdADePRb5CMh8PU7IPQnaskfaPDbig3dVQnt/5yMADVIoSXec1k4FZP7MjLozWj4Qsbxm8p4AbIB9yyySwhV2sf0sIqKKXJ+IbsBhSYzZ4QItAXQfXgpvuFDrbBpLzKYPZgjO1Sk01llWip10fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781093; c=relaxed/simple;
	bh=CbeNc2AaMhtIK8r40L1vtYnXZoUmD9EShDnhDcrXSPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqB41Y/aFJ/cZs4ZIpUhlD6P699TAbrSuUC2t530la738SUzwU6XRZn+uuMlTDOkdza3UKmgnAMm7wo90aZjRQAzispUbA3w4ot/Kenwah8Zbb2BkDCcuqmBybQTS8Hj4nuB4wl0I3quvpPsmCUYdF/eUucZkyn27BAJe/klqto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeBJ0/qb; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeBJ0/qb"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6af9befd04cso1496920a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781090; cv=none;
        d=google.com; s=arc-20260327;
        b=kehswNUiuiLdW/vWfQl4ystTB3T6ISeXvJ5JPejsNEsbKb5o+fDVfItc6TmI9z/2yD
         vwf/oG2XZe46mmTVL2IH0+a9GfT3Lpqh022erIw51tcVeHvTy2EdqhSCplCXdt2EmehG
         n27XgKxsiroXgjo/DpyIaTJFIXIgCRWIL/qSKSUgW4rx/yTr9bJg/bVdtsloaARBYS1A
         d+RiJqf9w2ENi17G+fET1RpjgJbd1WmCTiFV5JUky5E8lspKD1KeOmhGQEl4geWSUb6/
         vKZSeYmWsyx9CS1EwODP+mxlghayVz40fUZQdy/sexM92THRn3mRsPNlMB0aIHtGkqhP
         HFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWJ08ytHN/opOqIBCvIGVsDXGqGAWZ+1JMUfudfTNpg=;
        fh=uXd+xQJmU+c7NkVwpVxJaiZBZO/vtieAR7LSfOjJep4=;
        b=TS7TIaIREetTqW5C/tvmkItQRLp2iWlj/LuvW3DkkEjPGCfXh9/9sFzcVUrQDfhYjk
         B/PPHm9E8otrT3NjLKwdpmIRdqiyNyRCSpvPjdK8h5Cd49iXylBLwIeaL+zFT3HLWgS9
         T62OvIhxk/UqsrK6Ewp7n9reRPZNdps5ycnkQ27EZzqdoV8RsyBjzFVdsz/szipfrmB3
         v4g2BvVqmrfoaxq8UvXjoW0ID/anqZzag6tkD4/qa8mIPB9LLLdDVUzEjGLLNjHI17Cv
         zRXyuWjZysT2tPjLtlHoWv82sWusK08aaJswkQoJeTTralq3v83pCoAqN0c98zfA1kwJ
         o5aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781090; x=1792385890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWJ08ytHN/opOqIBCvIGVsDXGqGAWZ+1JMUfudfTNpg=;
        b=UeBJ0/qbkwVutzI3PJszlxt/NFhopJsuKy9vPURJl0ihJ/sjjk6uDwl1TXizXD62Ed
         Ao8oLXkvyEdqyRcbdrdjH/ZEmrjbs731ZhYn4GKrPW9t6gMPWTEpEjXlZG8lm9TQVL+N
         ISTE6Bs04K8Kg8n77F5CZumTZbgwQ2T42xyw27ruHRhV4f1lnOmyOD4fYKtwCfpuDcax
         osbzyjCkX1u83YVEU/P9lIP+/Dg3OtjjHhHoSAVJox+opwbJV/d6XgfwLwMUWhDVSihe
         7grdXN8stDnnaN6bC1RQZElcR/KoBZgH4O0Whqo8NpUA6nSf93RxeDXzbDZY8YF3wZrK
         xemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781090; x=1792385890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWJ08ytHN/opOqIBCvIGVsDXGqGAWZ+1JMUfudfTNpg=;
        b=FLbRqBXDuUVn3lqYpTKku+PdWF/qfRW2xxeQCt47XUJ5jYTC3eEexMFijkeDQjKkN7
         r3mttc0cnh8oAuJsJfE+EpL2UOfDnWFvR7kwGJPKr5cc5AdVzlRzydby2YdttmeqtXIO
         h2kEPcZCe+rnKfPp2uIRgil++g/ZSxjWXf37badQ/OT+OZcPKSEJm7KIrbqtNIjxrZXA
         QYsgaxsCKCrfFng0fTHCr3mlF+zocpbfWVYgoX3kt+a2FgIi8PT1lgEWEX34NF/xi8DV
         r+S5L8itoBSqX8CQ54YyhqRdJGUPk3Rd+jwthxKQXpyQ0dwFeDVAngxaZqvxWMCJmNUM
         VFsg==
X-Forwarded-Encrypted: i=1; AKwUvBwV3VxgRZPizbtWjqMg7YBHphfCaQOsVI7h2zqG+w3WLx8G7mquhGS/4YoTZuuKscbkuAUMzndysf0aTVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG8eYdrE8Xo/SQ2fm/vF136NSdFp7IdQOXgTqPy5tZPq6kqVhu
	ybFZ2XQxxlT0X+vhzirJx2i7llv5cvArATzPQFKF90TZTQSTVbnW0iXkj+3AFD400Hd9m5yudlP
	d9Wqw0Abayli+Y9kF0l3ERhQ7C012N18=
X-Gm-Gg: AYBFou2/DvTQ/OPl8eAgskafe81qpxQRNDndRIJh8IuEX9YKjAisM5u7AfGWbtSXTyE
	ACr06m2G6ZLLCQCltHgGop6yPdRIX6Dx1YVZ0pai2jNWE/HRyVP4zOSLyd3PsO5H3fOY1h1ORkZ
	ahRMfIxY7SZTMe0Ocm9T23H4Q5Cp0zag5TDnfGStpIFH9sjGxgw6Ro5oMZAP4N7SD4jjDK96oLi
	we5HeLvEQ1B0mZnK9na3tN7c9i1a/J9hXr60ZsHTG5H2wYb6/DukMciToGedLrOfAMpAjNx5qTn
	JAxT6VXteLeQAhTcAbXaZ9ItTSXykGHgMovLXG85oLZG928mwOVZ5UcHXAelJGleTQ+vh53ru9S
	V2dDZp7F3WB2yqHQgd9uwcAmNpVJ/jXUThBcJT7lxWA==
X-Received: by 2002:a05:6402:1ed6:b0:6a7:f5a1:88b2 with SMTP id
 4fb4d7f45d1cf-6b17c2a41fcmr7878845a12.14.1791781089790; Sun, 11 Oct 2026
 21:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-7-linmag7@gmail.com>
 <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com>
In-Reply-To: <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 06:57:56 +0200
X-Gm-Features: AclHuK9J7B4YJ03biBN9Djiaei2hQpnXUSq3U9jXETC2EPL7QR24Bon1lKqKQPU
Message-ID: <CA+=Fv5TC4OTgVKXdnqDWawXBm4M1m8ZHPJoX6wL8K8fdyPo5xw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write
 parity errors
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 10:01=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> > +#define TSUNAMI_PERROR_FATAL (perror_m_uecc | perror_m_perr)
>
> Why PERR and not RDPE? Bad parity on data read from PCI seems just as
> bad for the consumer. If the HRM says the Pchip poisons that data and
> the CPU takes a 670 for it, please say so in the changelog.
>
> > +             perror =3D live.perror[0] | live.perror[1];
>
> The changelog says incidental PERROR state on a CPU or environmental
> vector cannot trigger the panic. It still can on a system vector: UECC
> or PERR latched before an unrelated NXM will panic here. That may be
> what you want, since the error is real either way, but the changelog
> should cover it. It also depends on the PERRMASK question I asked on
> patch 4.
>
> Two things that I think belong in the changelog:
>
> A CPU-detected uncorrectable ECC error (670 through
> ev6_machine_check()) still does not panic, so after this patch the
> policy differs by who detected the error.
>
> A PCI card with a marginal connection that asserts PERR# now takes the
> machine down, where before it logged and carried on.

Thanks, these are good points. Would it make sense to drop patch 6
for now and address the panic policy in a follow-up? That would let
us consider RDPE, CPU-detected ECC and previously latched errors
alongside UECC/PERR, including the impact of a device asserting PERR#.

V7 could then focus on the reporting and acknowledgment improvements.
That would preserve the existing continuation behavior for now,
without implying that continuing after an uncorrectable error is safe.

Magnus
