Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480E317145
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227867; cv=pass; b=RpcIXoTJ+59HH2UGg24yJO/xK4T2AfJvLyy4nLeuK290IagiEio8VUnSJamTDTgBfuIC+pNosQTd7bcgm1nUQqkj51JOIDOZYZPpSfdL9ZWfEWxRcFkdyVU/C8wiMF8O984O29bwo4ANwDVd18cVd1KKDSo6kUWXW/UEe2ph9ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227867; c=relaxed/simple;
	bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvHIadqql/3JPA9kgYQctKgAddxWNwk7b74rti7ChvK6C4vLm5CyvJV3ljuAKXOS7q7TX+UxTbnUG8ws/a3ldrdVI4QdjTFcupwWcLy5Yoog72FAHTjzvMq1ZlaTSCGk/lfwWET95lBGOocCInVvZRKClKAshb+eXMy/U57/eKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLXHO16v; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLXHO16v"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f13so864555e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789227864; cv=none;
        d=google.com; s=arc-20260327;
        b=OGyGvHjODPkdIugmVMn1pTKlexg3+hz7QAPFYgCpxe0WWnNcr/wqCsJoajauBH5CiW
         NH+bpLkxy/CYWyFM2zVtpiIq9HAReYgB/397bTXjlHYA0v3cGSgZjgIpxDuSX9tuHs1y
         8fCmfAOTZ2Pa7VginbQ0w/yISyCYjsuxLO3MwnLlhkURZO0HdV3rWYHqvPPQxPEKK5M8
         SQEx0w+7Ord8eP0HlhzHHFS7YdiSX7qBpwZ7qVYKxVi3UlEgJq2aLaUr0E5qksquaGTE
         S6Bqw9jxPy6Rur34jRlYdo09SxKRqMzZ8aLiy6SQxDGpv3NslvZSVukm8TMf5pO+QTM4
         1giQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        fh=L/Wtxj4oZQZxJlOX3HRkHkExaSvVDF1pmrPfzrQatK0=;
        b=UG6buT0MfXAFXFm3cn7mCLIW3S8zGHstxq4zyCrtAQEZdrDZRIXSi8RioxdqVKYiFX
         ddbH+oIiNPXwSS7tNtulFS1PUuc2bXAbtcOCEvyVwWzIcZsGOs6Eax36lRvVrgEDbl26
         xrwUk3ywAPa46eiagLiUxeoNiO0CcOz9dabklWYk90NKhfE0OQ6gn3bsHlRj1huPN8iA
         o2qI3AekjaAYUENUxrKCvUCDHdsMnFVD2v4j1+ItQgOe2uaqF6UvJZAsvVbhFMlaj0NX
         P8he28xTmdKAck1XoJYVm1+xQ6MzYze0c9AO6KHtnXPxbKICQpsB+aFQ8iYJH350ZDS8
         zCZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789227864; x=1789832664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        b=lLXHO16vmEipU3iTCm2IB0johNZws/1Jy5hLxCsWZzWOBx4dnS0xu43zl7h+0Qg01U
         wpFCOWQ+ZpNpkymg0kkU2S9VZrip/EuW495N9HwAPOVZO2C4imK1Q4y3tU1DlsOJh9oC
         FlHFK1rM2WaO6gK4ndIwwT9tq0FJxqEyUEKwkl1zQ2A1Bb0l3vtdjQ++86bfRJuae60K
         7/12BdmLzRB1csady1zUwaRCK8L15zWWBlWPIq/r1xMNxWpkdYcp780O1+E+erjInT93
         fl36N0GlCb4OcvDsFFd0IaCSJKNJu3QrrVhI89lsU5btBAsOakpQrAggtCM99I+qTmpF
         hmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227864; x=1789832664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        b=AseVgXvVJ0uYpEYGSkfCD9yx3PcRtlMySIZFlvGDb3U7EmzY2Hn6cyVJ1vovJje88A
         6ZkhoZjSRobcp7OerBZLj1jkvZJxPSaFPkNCO13ZiHFeF+aL5ACNtF62U+dRl93Cthac
         po+B5wwkLvrMFI/J3DD1AA58J5XIrk9OCbxNzBfr+nOm9yJyvt55d0SDJqtRaZAGElrj
         2NvQALfo+PkoVYv20R9zRyr9GD1nZaIWM3WE1JxVCYSZ+DQy6PdpSSDzAc79UF5b/Gvw
         cBvomLzhYrPnZeYqgrGk3wxCRXPcsQFvDtfo0j+q4r0SoHF8OC2nKApzoSOmvUoW4SBd
         wGig==
X-Forwarded-Encrypted: i=1; AKwUvBz8W84ZkD6eOP0PnsRd8rFVbMsLT5Mp+QVtbRgiQc3I/gL/CIiw0Uzrd3+k9F4/Kn5os6TWDclLP8jgd5U=@vger.kernel.org
X-Gm-Message-State: AFuF++nSYUfdSQYtA/qXO/phJZYHY4zFdW810j1+vuGOZgL6+tBj/WV/
	jneRbtk5Hj4Nzuq4orIaOp1U9LVIcm3UlgPp+gTBFZaHY3N2Oer7jf88YmASAf21wFi+9u3XBjd
	jcnArp7ho+rdCHyEPsQ6HQ0ZA9Kr9dgg=
X-Gm-Gg: AYBFou1YnXILUX/VoG3GVxObOioTTOibPFrphk8lX9UUABmHxtkhMRJZ1ZGWd8BAknj
	D6YKIaEOLyrLsUHDDKhlAzFBYhjV/HRbUfHG6Qpqu8pO8ZLQsbuVGU1KYgyezURitBv5HhGmwfv
	IrrehCYidAcHclqZ9xV3htnquCRLROt/JZ779JNWJTOEPV7u9AlmYeKHong9v+yEmzdfduy47ug
	ARjE7SUjyDq1mcu+h37qBlXusxv3w2qnc8/8ccOQA0pRjucSLtIt+VOABUkEFNCelp1c6Dk2C/p
	noWexKKeom13hbXbxNYVAhOPwao5Xwrq3USiL3Vs8J+cUqH+6iC7LdMtfw==
X-Received: by 2002:a05:6512:318d:b0:5b6:423:7f0f with SMTP id
 2adb3069b0e04-5b8a0339cffmr4190697e87.29.1789227863611; Sat, 12 Sep 2026
 08:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com> <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
In-Reply-To: <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
From: ricardo barbosa <ricardobarbosamscg@gmail.com>
Date: Sat, 12 Sep 2026 11:44:12 -0400
X-Gm-Features: AcwNN1XRfFcNPuNAyFywkEbj9gVFTQEx20WFI7Say6LdEin3F6clCr5L4UmHlTQ
Message-ID: <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, Andy.

As a beginner taking the LFD103 course, my main goal with this
submission was simply to validate the workflow and git send-email
toolchain with a zero-risk change.

I'll look into more meaningful tasks for my next patch.

On Sat, Sep 12, 2026 at 8:36=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
> <ricardobarbosamscg@gmail.com> wrote:
> >
> > Remove an unnecessary extra blank line to clean up code style
> > and fix checkpatch CHECK warning.
>
> This is the lowest possible priority patch, if even considered. If you
> want to clean up this driver, there are more interesting tasks.
>
> --
> With Best Regards,
> Andy Shevchenko
