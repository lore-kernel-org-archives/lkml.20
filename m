Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F7F4AE13B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386561; cv=pass; b=IzNRMgaSvsdEeN/R3ghU6qQpTaHYhRhovjk5g+EpnDFg6bK6BN/3/t7zDULxWaM8YD6cEVZzlYGZU0nWQZCgh5YhLT3y4C54zpPFIc8e7PdvZO6PD7d7RQWpngWlQIHT/bTNJYiInG3r8GB/AVKsxo2VapvUvoOS+R5HxZnGtlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386561; c=relaxed/simple;
	bh=joRGIrqiwIoYdt0oy36VOO5pA7IOqWqvIlZ7DjLDbjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeFnCw5csX7W7w+qexp3p/sWxBHooWetrSQWRmLu40zn6vAWzJ0QAE6W2KMQJN02wV7zi5miV/qo7e4rfkC8/OSoaPAGmkBkHdMHA5anfMAwcAbzEDDUIHLUALjQomm1eNRnMDdsyZH6XY4kRlL2TZBKvOM2o18W7JzsikGb95M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxMiIeSF; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxMiIeSF"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so2658261a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788386549; cv=none;
        d=google.com; s=arc-20260327;
        b=MQ3/eEU55eqZrkhawjzYtnQD/IN/vqSV/fsmsvT4bQ7e+za10QRETDzBFGnceruHeC
         vUfufy1/+dDFnkm/PiukUEcNXE2kUD1SXTqdOI8YV1gD6E8UxtCTLlgZ5AonLzLKDxWK
         61UHXAG4I0kUa6ReRlPEdK+x3quOt7RXSnxOwbBDOmAnM8zDoJxlaqGjeRjD7D9Pn23P
         MaZ/dhCgD45ID0jKgu9Zz4H3Pc3N6AGl8arLPgfHMzAhZxs54U0J1V1mai091P5mw+LM
         iYE+fb9coe6c6oV91SxKXnLbMsTXGjOvDqhDx4xeFB9M2NFFXHIcOXq53XmF8ygRZmvt
         gMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=joRGIrqiwIoYdt0oy36VOO5pA7IOqWqvIlZ7DjLDbjg=;
        fh=EHDLv0oFqDQ9Exu8Y5dq6pm40aaBsvUIlbuAN6rPrrk=;
        b=TVGj1y3/1MrB79iVcT42ldyMQB12DW0ZQngpx2dF7m+KaqJ524eO8q1bNC8Nr902QG
         3+j7VJvnSyjXN8nBj9DBeeIESHEcACklXP+ECWFBZnVz950ayBuO5LL4jq1Z+mhDx6UY
         QJN2Au5BKKarZFtrWu6QW9PstEtjw8CQicC/Rwn87/ziEMyFyt+exWxdvcxy5uEFzH+e
         YXR09ijXfWLZSmy4XsfP9+tnm+/OPX7W/v2RyUQhTAhyzkzsBfoZt3pvYz0OXRQddOyX
         N5j94iG8idOMKU2SjRLurlotXTK78EocWjkiz75F2S1OTJD7MjM5O2pt1iRwzHBbeuph
         EzAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788386549; x=1788991349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=joRGIrqiwIoYdt0oy36VOO5pA7IOqWqvIlZ7DjLDbjg=;
        b=kxMiIeSFYSjZCUVfTIg0irPescMXcGRf04WusuTmIErkxxFFDUQnz/hNqGWYiKJYPC
         YziWto3BojizzjVHN+7rbAyx/cq/9DcEaLp+nwkHZvS8XThlAnuF3G8JLAP9D+tgzt7s
         8yFohk8fsu+QOAVJBvcx8PP2TTruf237Us/8D4mDI9hE4UQsX3WcCoX0RtnajRYIMmTV
         +WaTH/dJUgDddeNPVRZalMBkyvF+NeJTOatWsdzgD8AavB+9N8DO3QKPGRzUBddo1JFF
         pptIurkFFoKfIdo3T5x5pM0RhzAnhbSibOkmE7ihZusZ88f8yd5mimRbFh9pnJCjEDO3
         Dc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386549; x=1788991349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joRGIrqiwIoYdt0oy36VOO5pA7IOqWqvIlZ7DjLDbjg=;
        b=WGf19LcIdzeQSKrhWekKnKSMu0N3aUxRoJfsHKuArsfrvnYzB4OUUY3o2URN+B39ju
         JEEG7FisFHJBVLsnpFi/dDiZ+4ju0FFZhoY/fbx9ZLFjN3MqfRsDMKocipepfQ2p/xTH
         8+0ie5Mp6TUjRFfT51qH2RlzLZdyVzlZoCKwesoRLHwLE9PSwypiMDuaxMQpzd+6KlJ9
         LTMCw3x43w5mMAnPCF7uCIQQS730BhEHc8wEXIOOGnCU160CYCl/xDIxCC6qfWZGZWhT
         uq2h9M0ilRWtq5j4Jzmtslysz7ET2kpE/npUqHnjCEkvecqOubL287rnlxiEvhE6vNMb
         QntA==
X-Forwarded-Encrypted: i=1; AKwUvBw8ohBytPHJsBnz/TW30MKa5sVvXsEl1OnYN4PTSbmx/8SH4djXc+WIUabrNGN+rH97IoSMRRPkD20Mzjc=@vger.kernel.org
X-Gm-Message-State: AFuF++khA9jsL8Q0nzGCQBbHiuyH0bff9Vl4pZfF16jHYAbPHEUsiGC1
	YkhCzuL0CNALZAgMHBVgb63QmlDjD9+mEibO2X5IZIC9kuG7LhbK+5F1yvivzwJXDf74l3IM3PU
	g67rPmzkInCGykHdvKRm2q9J2SodDiX8=
X-Gm-Gg: AYBFou3ZPyDcT+xs8lbI46pxQ3BvPW6d6MV+5qVW1KWo+MV+YToYLrpX7vTwMb4RGGK
	DHhrgpLdIR0fyG4Ndz+0nI/5KlhYi0bh/qoI45rBpXzuGePGS3QZ5uV9H3NWNg210uTDcyNxNpp
	lbU4w/GggR4hmJ2QB0LjDNq5gBeKtUlQaF24L+7iaFYrblkH/Id7T0kVcKe/In72AdRaJ3a3Kfi
	3LsQdGXxwE21fGfCCr31+MKVBLBt4LdgtcUb+IEGwkVRKVW7Gnr9CX2r8PYRfe4v5Ltkue53Cnc
	2FnJirr3teGA76/ucnpBijHccHeSj8HTba4lky4HHzMsQA3+9CPvd1ZJLcPmrJF6vFEUN6o0bC/
	dQ2x3xwSXixeRFBnT7lM25QdS9hAS8gg=
X-Received: by 2002:a05:6402:448d:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6a68316aa76mr5614219a12.8.1788386549433; Wed, 02 Sep 2026
 15:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <ea0081603ea4f745e7c10895e83a1cfb4e80baaa.1788277742.git.mattst88@gmail.com>
In-Reply-To: <ea0081603ea4f745e7c10895e83a1cfb4e80baaa.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 00:02:17 +0200
X-Gm-Features: AcwNN1UCPbkWI1NL6EjKRneil1vTlVTQ9KsrVdNDjYDjauNTjiiPn9Rr0PDNIPw
Message-ID: <CA+=Fv5Qf1YNNi1nk0UoJESmNyCcDXcfAe0SdYrHMOkBmLv1zzg@mail.gmail.com>
Subject: Re: [PATCH 18/24] alpha: select SYSCTL_EXCEPTION_TRACE
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Report unhandled user faults the way other architectures do, and hook up
> the debug.exception-trace sysctl that controls the reporting.
>
> The message gives the faulting address, the PC and the user stack
> pointer, and is rate limited.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---

I tested this on an Alpha UP2000. With debug.exception-trace=3D1,
unhandled SEGV_MAPERR and SEGV_ACCERR faults produced the expected
"unmapped access" and "access violation" messages.

With debug.exception-trace=3D0, both processes still received SIGSEGV,
but no additional messages were written to the kernel log.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
