Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EED38643B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327538; cv=pass; b=NB4lNgN6I/ReFLCiIGV1P9HBAMuKvki/FJEsRaN7GVl/Mee3TGgmNB/V88k3tegYDs7Nkl5kpe8Md2QIwRXgunl6ALuRickPl41j/jZPrx9o3o6cgUWDbdW5Uv1H4AtrD4RwGD1A60q9wpePdG0+wczAIGDAo5AgKUOTwtKqxSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327538; c=relaxed/simple;
	bh=gE6vkTgnAHnamDKA+igQgYq/8m3BMccvQocwRHbGwhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbgIoTW+nsM2vlDtif1BS1AfO8mNqPVDWVdDVMUncAZESzgBeaVeSLcl1vdy2avAHbWuRvJnih/sg33T69Q9MyYcYUgl1qP06OgDhlhpfaOtkU9KUOguAaHz1nwlZFEUnRRqlYtvvFP+7KykYsbV8pDLYhOS6vjV50AeO/jImk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9kfJJYA; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9kfJJYA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so1065743a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788327535; cv=none;
        d=google.com; s=arc-20260327;
        b=LgQS6Yp0PKJoSNunm1+WCXSvGV8xFKrQIZ8MAol2I3k1zSg+jaZSePCoClBs7FXWrY
         MU/BjRj8/O8qTmPkG350RDObkftsTMVQRpMzsvAEGp8ziiGFNSQZiL2ezjBuzBGOW7gf
         rP0fhYM30vTb3hfMtWkSdzitiHGMF8z6fvJWccPN2QbsTHG+Nu6+F6KTk4Z/FnFRCtWs
         C+vyzukgh6aV7yWhbts8R1vV8yhHLawSb22XQVgq6NaDl4E8ItRUBErxbYJ/BEL5P7Z2
         q9GJzsYo3giodiYQY/Mf3uYw1JB/aMEngEAAjMAD4SoshImr4nZjtPK9BbwHw+WmMsbY
         74/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gE6vkTgnAHnamDKA+igQgYq/8m3BMccvQocwRHbGwhA=;
        fh=3hJ0erQ35/Sa3K8duTLH+Yt3DiBsS7RyIy46iPnnmx4=;
        b=ssZWuHp7Gp1lbsUaUylME4CcmU2i5YG+i4Dw4sN6BTquiFHx8gX2ratWSUy06bE7Nh
         w/ksh+W6XXumusiam50wdeONR9CORH6iwOL2tgrK5vWDfVqYKWDHNjLvQ5X+cX6wkjSA
         3oE88qH6Gu1cOxk23b4mkKWwz2tz83MHtMGuBWfPSsiJTGnd/izepOq1O6iotn2ilcJO
         Na166qufzOezo4zw4MPoHxeg/OIm9kqsS9YXqtNhIVkrrw6tQRdbJYJNZKmNGjDwt53U
         Uvz9ucxxaoWH7HSyj9CWbuLsefHArsrzPQuQXJoZjm0xKsWifFuTfv5Y+2jJwQeHXjHK
         jaYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788327535; x=1788932335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gE6vkTgnAHnamDKA+igQgYq/8m3BMccvQocwRHbGwhA=;
        b=l9kfJJYANtiQ+u1ltTK0WO3ROSM9otFrx6JsdH94A8+tWe2XvNP/j79xEzs27T81uV
         n4Mj0BAMEOt9q4ZtLYbP+ekCBMd6NaJrtbqsAZIi+7XqtyYIiK+hv5yj2dwbPjE047rG
         rpXyvHsFji4ebYTSibdHe6L8e68P2LTxn1P/2dYXSpgca4wIsaVHPwGFUCLoi/fJkAWG
         TnuaJw24IqqKrwEeVbVw3N3/3MfZDVpH2TtO5aC9C4m91VGV2xKxIaI4YaaT0zmwqB3y
         Er+p/48p6Oldpee2VtKITJ/0zLU/LUCEN0x5b8FuotB1HszJKQy40UeroS4P5mGfCUNK
         dyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788327535; x=1788932335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gE6vkTgnAHnamDKA+igQgYq/8m3BMccvQocwRHbGwhA=;
        b=hEYHPrjcXowTHkjtZ0bwxbXPjT9i424XQYtsrYd8t3lnu0FOne17QSRJtP9ePl4DPB
         cly0b50nP6MUJ855tZ1qO9qAgKq45XewUZ008FLMckT1JHc77VWUZ3KepkDLwkPFA8Vf
         jBlUCj5XXXqTTvn9aFiF8whYUIAPajFvQSUjpoUBGNhxS/DVDI+Zm89iBIK6NVdAZjYx
         UFmdoOV662W47FSuQbhWv+c1vFP+beNofdMwWITkF+ZW22FPEmtiq1HpSgziBETbTR9r
         SApCU9zKxkr86uuITRvQJSy89+FP2CzdIfIMjtlIh3Ec4dotfFJQHPt6Nuje9ZaNQl9Y
         1Drg==
X-Forwarded-Encrypted: i=1; AKwUvBx8CPTOpG8JkSMkMmmJo9Nkz9iG3mDeP1Or4FmU+r9MCUVnPiRlOvJzcSFZ86q5Q0d5R8D9O/FdyHw4Ij4=@vger.kernel.org
X-Gm-Message-State: AFuF++kfsXSBif5UgVkEbWHpFQcPX4twi1lhCrPESFCF4/3VGTqIvOSU
	UTzvm0NlMZd7sGKl0VGGoRNQrs1BApxbhPIOPZtLQWNfgLRS6Yd9vZ+QhchNg+od+w5BPBJdk2r
	SGoP4Gwo6HrOiHU8F1IMyX/azQWsqWaE=
X-Gm-Gg: AYBFou28WWp+pzNXquRjURKI/mBGi7ltgVfJTcZvHuCS/LhVRd/gbQbx3sIeMk67Jsc
	LHDvMgGP6L8ruSaZnmRLWbVoGPJv449haz85aYAiEaQr57Ka+ei8nPi/6FOSgu/4feJM4kpTeHJ
	ufutlw9ShaNTcCzTq7upHT62ayhUIw6INV2xbnPoDzExzCUcwV4vLWh7ApWAlvzCzOTQxK3Rk3T
	NM30iQqKL/OHgkBgByEylYMTffYrr58KfU7tHc6jkxVp/pmr6ssrWsZZK57QosnQyBU0H+DWTvU
	ZbVL2H0XxJDOIkV8s7Nzz/tF5a3sy2FKKH+zNR5KzjdFsR8uAFTdmK83VL2UMUE2mw2mluMqecI
	zQWH6214T74Y+yV1drBgyvezPnVntxhUqg5JxfqswJDg=
X-Received: by 2002:a05:6402:4406:b0:6a6:75c8:6bba with SMTP id
 4fb4d7f45d1cf-6a68a55196emr379910a12.7.1788327534406; Tue, 01 Sep 2026
 22:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901214611.60560-1-linmag7@gmail.com> <20260902053540.GB338380@ravnborg.org>
In-Reply-To: <20260902053540.GB338380@ravnborg.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 07:38:42 +0200
X-Gm-Features: AcwNN1Vu-Vp6k3k-HA37zla-acUKeXYAi2KMc4dYXKBa6LxbxZIme52Bazb2qHQ
Message-ID: <CA+=Fv5QBPP6mjZpXePrzCwUt5YmkM++5g624N0hruDR_P1PHEw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] sparc32: replace sp_banks with memblock
To: Sam Ravnborg <sam@ravnborg.org>
Cc: sparclinux@vger.kernel.org, davem@davemloft.net, andreas@gaisler.com, 
	linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Wed, Sep 2, 2026 at 7:35=E2=80=AFAM Sam Ravnborg <sam@ravnborg.org> wrot=
e:

> The full series looks good now, thanks for picking this up and adressing
> my review feedback.
> For anyone looking at sparc32 code this is now much more standard
> and you managed to remove ~250 lines of old code.
>
> It is now ready for Andreas to take a look.
>

Thanks alot for spending time on reviewing this, and for all the
feedback pointing me in the right direction.

Magnus
