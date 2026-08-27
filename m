Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EECF3B5306
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869518; cv=pass; b=LuZrMJ85/169tm48SdJ9dZ8vACjXvSymBEim01s2ym0bkDcmzMjMqd+vgr0+/qm6TlfbqmO7gKlaeR2ES1+RO2ncLewLeeKe7iQbfLFo2ooQXIUpBOcJi5RVCcM27ZkZuCy/HEvuCnuFVh6iydx+c9siLA2V4aUoFyffA9F+R44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869518; c=relaxed/simple;
	bh=/E1qm0j3abWKQXo6pZVeXLBEXmyK9cxZP8Mn4Y8KCu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQjTGwVX30CCH6UtDstF8XYRb6YSeVP96cDNWkA/pWqum8maprqoMwzWkG41RQlRgB7TE6hN1nray9VRRtGscwaw4j4S3fW7dCN9RfvenI5zMF/6sEZrLX1pMERfINFWMf8v0oKc5AWDge/K3AFgb0/ove59432U4DM077tuAY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rlg/BSlY; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rlg/BSlY"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4af173320f9so434284b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787869504; cv=none;
        d=google.com; s=arc-20260327;
        b=mx/S8HPRAjlaZeLN8hUg6sY3K48EjsiOiXS0rZQE20oHtM1+vv9OWUKuRBuB2boQTR
         K4to0laQLeQYK8u0SBjIdWa5MkFYjibL4E8DKuIeVkyS389uM3osHiQRhT7G9CrhkAZb
         zi0rrlS7Y9y8xXOx6EZw5727ZelSyX3ATfsGdBXrJcM5C8v0KEj+Il6/7B3ExY08wRmp
         jMPUGwmPIKKxTqBnj+wr0IFC1FJyXgYB3tbndaM1KG726bJLrN2EfD9dMt8xeLa95nwg
         j+y8UgXif8BbkvcWjuG6CBA4dxUrowgrNnthK+Razr+le3yTWkEKpKZjaZI+PzAC8BlI
         WuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8HPimuwgbeLD9+T7JiRFwzxuWXrmdfq6VOgvHXgXYU=;
        fh=Y2b8m6plocJabs7WVwukdb7x4FJoMiavtK9V3M6B9+I=;
        b=Ie0Aa/rs2yvu36VSRXV0a1tseMG3ZCR4TjuUrj6C4tghQrPT4Gb/XVeyEg8ubKTgKW
         XWY0zCclmyldGUnMZ6LNkuDJlq+i2K/Vdy85dSp+/EBScfeWrLJvPz656D3A9Au+BICX
         YDPOYXcAzOcLx6pNiPETRhVyacoBdBPEcpRVuPoh84sTiIkCmpCIJaZxVnXo6erPcwQG
         SFOMm/4nCpOTGI76HdlkYRnERZLBraT2jXewlaOQZ65kEZwPjISt8r7tjJvSm9574iPq
         PRYw0MH8LC2Asjvl6nQwEKnjng8nBX3oMcgYZYvCeTinC2Pf40IQUWwBd3i3oz3XwjbO
         JIQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787869504; x=1788474304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u8HPimuwgbeLD9+T7JiRFwzxuWXrmdfq6VOgvHXgXYU=;
        b=Rlg/BSlY/gpTlLV7z2nbfF+KLA2KWCj5YHmSGCZSjOxwxTyh5HF827bvPva0z3RfGy
         sVqLCwYDr8gLFOZy2pUzGUNNKlm5tmG5DpHrZH3RAMRbhGSoG3eidZrGrQgpCjVbvcqN
         Dj5b9rmiEbGFH/Qnsc0vlb89j7xwtUrQf1KuIjSqFjg3VFMMOiHpW5y6f/no7nYwRmjE
         q3d5Pc69UjGMNoW6iBFYtzZCK08SgqFhW6lVU9ygLoFDec4uNC0s8+KMm9iX9TA75nKZ
         oZaB4qhEedfMwPcwsrf2b4upCBZeek3ePgKCT2hXqXwTxjU88fW32SRdPm1hC57Snm6H
         YtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787869504; x=1788474304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8HPimuwgbeLD9+T7JiRFwzxuWXrmdfq6VOgvHXgXYU=;
        b=amm6yrt8nLBIruNxptkP1Si+rii9CaxMeol/RL3E1T4LC0ys1MHt1lhWz9jgz4E6OA
         ZbFzEuNup9LtyJ+EgY17H45Iu6bIiOB989OWYNiEZyJq7JeSj91fTjj/+uq3/2ecqNqw
         sJJ48bLPMrCEc1LQymMyc38fK6HldmoR3asJAGx16eFj4s/8tu3oAP1vQtvEL6SPfbIO
         kacUfLrDTwxpvDkwxGICKmVLavDKiqAVmF0uogUWEaNesMxxHkXVdDbiz7fEn90ZFInD
         LlX9YKgqplBnKOm0Pj0+G0eHoMo/rOMw/YLu8kJoQkSM0CwAosLf77pqoz3W+YaQL6gD
         +A+w==
X-Forwarded-Encrypted: i=1; AHgh+RrhiLoz7Vd14UF4IB9fWrY/EkacbBAuIPQ9cj6TRb+pB4ASlG6kGdfBQWS7OfHqs9vlxJlkdXT+PZzFj2A=@vger.kernel.org
X-Gm-Message-State: AFuF++kKeYZy1aCkhmr10LET+50q/DBQ/TTuCfxefsiygcPz3P6EX58J
	mW/+XzeRWYAwOTFcK7+YxOA0F6ide4H46/6uJ1g6hZ85bP5EIhBRjb6EyY0Wr5BgqXxV5ept5BD
	r9Z8Xl9+n3xJeWXP4ISeqb5VfF2lAo6c=
X-Gm-Gg: AR+sD119oOBh513++Hk7uWrCyjJuj3JaoEDYuw1LwdY/bVOSZnDGadP+JyBNpogK5Vr
	iPSBDv1ja52reItljxdxHTN0VSjuBBwy4Fl9KjtWmba0k/uoLz9CzbXx9AUSCv/Jr78N53896y9
	hU09AhKW+AiX6cKfXezmJF7uESxVZybFYM32ZfS9CTWZNNZL6vP6WC80jPVa60cM5sJPaFjsVwS
	hv4yfuj8LMW/KaCWtQaBhNl/LOzov6DxhYShSyqB7KCwO6HMpfUUC+1NH8iitA1TbXBW8R0i3Mk
	LF3WqxcPWDNrqBYrApYFW2SOyhG7n2HUQCCuN9emhfZFKL7zrY3Fci2cyCeeGoVMBzMhTSi6qOO
	KYuN+1mW6QyY=
X-Received: by 2002:a05:6808:c1e8:b0:4b3:3e1:4999 with SMTP id
 5614622812f47-4b398434703mr2911222b6e.15.1787869503851; Thu, 27 Aug 2026
 15:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826213140.37437-1-rishab.madhugiri@gmail.com> <ao_cCHTp9kKfOV-U@ashevche-desk.local>
In-Reply-To: <ao_cCHTp9kKfOV-U@ashevche-desk.local>
From: Rishab M <rishab.madhugiri@gmail.com>
Date: Thu, 27 Aug 2026 15:24:52 -0700
X-Gm-Features: AcwNN1V1VmnOS3aWyFnmKIS-D0GyiW-IwL_nYHb8pdkGVa2FiKvsmCJoIXlfs5w
Message-ID: <CANc32tPtHyJdg-PJa0iZHcqX4WDtMFikZFD+4aO96B1+zmf0_Q@mail.gmail.com>
Subject: Re: [PATCH v2] iio: core: Replace BUG() with WARN_ON_ONCE() and error return
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback.  I totally understand the perspective on code chur=
n
versus making tree wide cleanups, and I will let Jonathan make the final ca=
ll
on whether this is suitable.  I've also noted the wrapping width feedback f=
or
commit messages in the future.

Best,
Rishab

On Wed, Aug 26, 2026 at 11:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Aug 26, 2026 at 09:31:40PM +0000, Rishab Madhugiri wrote:
> > As documented in Documentation/process/deprecated.rst, the
> > use of BUG() and BUG_ON() should be avoided as they could
> > cause a complete system crash, preventing further debugging.
>
> Right, but deprecation doesn't mean the _old_ existing code must be immed=
iately
> changed. I leave it to Jonathan, but I see no value in this change except
> the unneeded churn. If we ever want to drop BUG(), it should be done tree=
 wide.
> Hence no tag given.
>
> > In iio_get_time_ns() and current_timestamp_clock_show(), the
> > clock type is already validated against supported clock
> > types prior to these calls, making the default switch
> > branches expected to be unreachable. Replace these with
> > WARN_ON_ONCE(1) followed by an error return to avoid a
> > crash and to log the highly unexpected condition.
>
> There is like 10+ character space on each line, the commit message should=
n't
> be that condensed.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
