Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793182515;
	b=D38mvcK429J0jJ1oh2ShjEGM7sV62Y3+Vmciss6jkGrH2ZvMe/1gRBzT64QHIZjGiQZI
	 lO02mds1gOK0EmSHyqtQM4277VVFcESzUTWtFWRDp+bkY6gCntvt0y0pKvdUm7a7Mz3oc
	 KFMeKputoKGU7mbFXI0gsms4Hhy5B8192SN2+ZVzyqKfxHfs6jh4/K/QBwhA9vC/bORcT
	 2oDYJOn0TxsnqHSrLY4T9t483GTF1BK8LCJ2OFRT/xGwdsQIB3+UzQ6PScfzX5PxR/5co
	 LH8cOHQhgff3I+9/GzWCbJQaU0HIMt1VZ/uKv0WFGYLKwJ4dV5wxLhjXPbit6dzgUAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xASf3H34vKfEdpWHAlxf1Qg2aZTjpgUXhsOYbYP9MTQ=;
	b=c9bqsS4ztqFkeWL+mPb81ev8O1KVIHy6ralmfvxQRPo76rCLdan/pupeyz+Z8mYMPeIl
	 vJsFrRUKIiGTkD5yZG+VemiGqLzXD48gs1ZgwOodkXa/eH4fpSjOOLLSBuiTmwiwdsF31
	 fi7J+JuDkQu/nDMuYQTyczaY7Qjzir0vf3scZSCn9Y9fuz/3vSttylEUG1ALaO0MvBsNG
	 lDhmExIqXJetkCjqzBqvomLTspDpVlc1dbltc1i7JhBhm1piyLdBIKDgqXE9i1PKO3vnI
	 XlVvw5Z6R4GvLJpVialwrwm2svkyroQbQLzengPKPNpELaAs7qwYBnCgEFgXFsPDgVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nz3SFcA4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5200B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5200B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nz3SFcA4
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso401329b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793182514; cv=none;
        d=google.com; s=arc-20260327;
        b=YhzSW2dIMcHDFiwvD0dHFqUshD2sdT9UVl+wAWxZ8QiTdAOrbxVKKsv7xZBRuD9rHO
         sWwWZzbPk3Kny2ukDN/E5vmIcSxawzVMisyGZOH3wABqXYmhTGnC4MqAAUL5h3Ji6+FJ
         fQSUqYroEJLm46Od0T56eRJpqZPIirjb7jqsM33sUV08yujFyuwnF1hQNqGfAPo+/jH3
         5wXICcyzpYHK4PHoFnnVJqv/pzG5iRt2Au7AcPyOhgqtjU3dtBf/wZxSq5HuPo2UfLAl
         OwPEVuK4WWfAG5u+DP+dyIswmPPBReQZ+KbY8In30Om53kfWjPY3FEIjpTtSI4/Yy+RT
         Z7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xASf3H34vKfEdpWHAlxf1Qg2aZTjpgUXhsOYbYP9MTQ=;
        fh=oX8Pi+SnFHkz0ZXhKTzF3ChBb7kPg7bwZq70SmxYWd0=;
        b=kTTBZpXpRRohopNlI95eb8mIiU+Pu3LNJTiDEMLWenyaGIOQu2HB81Do3AlwKuj9r7
         Uy4V/CY3rzDN+e+DTFy6lhrcuKu+2oglPnm9IiHpqw7QeB0KEJoHHX9W2AxSWE6kvSlk
         CMBjiSgPt0NWjywkxjixnvkEr0Iqh4DmJ231PKJj9ibpHWPuhAmlbymczNO0Ql6u4zlF
         jM4jtUvuH3TOS+DUfPXOLQ+y6coeXzt5cXWQJwTlyRz58FmpPx87E6PbihJeZwK2imE2
         gKWQlNvBeveDiXuObaXCqJoO7VYp5H+ZPMZcIbXRQX4gdUtpDL65jqiO2zbFtBahIk0F
         ZEgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793182514; x=1793787314; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xASf3H34vKfEdpWHAlxf1Qg2aZTjpgUXhsOYbYP9MTQ=;
        b=nz3SFcA4MmVd99ZXvkipFGVwU6TdNvdytyOiM1yxBoDxp65tUVl23fs6lhGrvTkDkH
         SrgxhF/ZmBkpIWlZgXEggbeKEoBu+YR0+BEAK34LUZSFGWkiWd6BxSJxP6h6PIg7C4Nt
         SC2wLmR24TO4SX29RYWvxWumHng4gmQx9a+qWbgDUiKXk7jSY9drCX/pgjAzXomrfEQx
         97UcETJ4hLF99asBgtmCYoLh3Wzw6S92GaiFKZVJ6z0dRF69CzfUUFeLZUtTObgevuSV
         pxvrp6QScx8DP1uOnoNbXX5kOqAqpOTJ/WXSxVCVfZNoICwBMlrhxcYML9fA18m5rtaN
         ymSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182514; x=1793787314;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xASf3H34vKfEdpWHAlxf1Qg2aZTjpgUXhsOYbYP9MTQ=;
        b=sDy9O2GZNJDlBgIrK2PtT8R9DoNSQ1THW3UAd2ocF2YrMJq36OkmUzVOcFN/b9TD5x
         pdSs1kxLo2LVxwKWqfcox7dYe5lqy6wjfBz3uVkOfiTWZuMpyukVRwTcvNLWhzZB2+yK
         415s0sraUMpJvoWjkgDYux76NrKPyPUuLAENdx6SdhoM+Z3vbgKIgcms0PkaUwXKAkqa
         7CuGZVuyfW+ILSqLeKLBEsNUQ/zmxMYW08HyGwCKrVnp68WgQuF8AbVBafDWFXzdfJvn
         7fIt5oWlyPB0jIxSiQC62zRy+XibguUGzjKJqLHqO1E3tdu5D73AVWQqIWaZWEodTX3a
         sOfg==
X-Forwarded-Encrypted: i=1; AKwUvBw2P6bZG+5BsJvX87VgJdx74ovQi4ZJll3AzUETrI/Nk5keSsO9rKyQxVj4rtfuRMnTkOmom2J7FirzP+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW9q+qQHNGDf9CWl7Oft7GqVIhnq/iiSOnF6SUqPauFto6QUjp
	jvucK+otFqF9k9UQUHVr90kSqR0vzxtFrPKiOUIwl0TGk9AMqYjEC7VerHMrhvo0ttSxguiBXnG
	okTNfy3rR4508nm0ofnq+ADHXTPwLaKI=
X-Gm-Gg: AYBFou38C30kHmqgaVwx3sUC8xvRV+l7G2gYFRoqwhuxvVDtEhswr9l5oDhfYLPbixG
	CaJaivncyouZtnbxrHyIullHECJsXNy1WSPu1R8IEOUPFnsZ98AK0zPc78d7vdRwdA8vWK+7vfA
	P2iwmlHJUA9BbXzn1NaNscAxsyYgOquwtSmCZi3sTipfDrL+L4FZ2yud5HHYOMoIlcPgQ7fNU0m
	5E78m1Ey5khCfMJrBybGaAyjDC/dMuT3MTgzG7QIzvNQ3cJQX87/vikRLS/eeGMcFVRP2MZla89
	mR38w7WAsSnFxFp2pZhMBrtlmN2xbffl+fP8QBrjbqVcQJLDHc52EkxAr2UkxxUlkZxuNbZm/tE
	QySRWP8xaOkaxdau4U1+2bJENsEyldoY5i1zrVNOAEhDUPEfmcUNTOVXoWmmPmSjrwWOjqpL/pp
	iLGDTxkfe1xkN3i05ZPe4GfrgM2W73WLS8csQ48JhIzXOJWV7UZQ==
X-Received: by 2002:a05:6a21:6f17:b0:3da:15a9:a18e with SMTP id
 adf61e73a8af0-3e902291f4fmr1507666637.23.1793182514538; Wed, 28 Oct 2026
 03:15:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022084040.31181-1-phucduc.bui@gmail.com> <20261022084040.31181-2-phucduc.bui@gmail.com>
 <CAMpQs4LpM1C6diap6JKYgLTYLoaC=W5wEsp=Y9DAj0Mwg-q7BQ@mail.gmail.com>
In-Reply-To: <CAMpQs4LpM1C6diap6JKYgLTYLoaC=W5wEsp=Y9DAj0Mwg-q7BQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 28 Oct 2026 17:15:02 +0700
X-Gm-Features: AclHuK98SBr74OryFpSWxRN0Z3YHcvuo8TePrT044k44OXomYiT9ECiHc01N7CA
Message-ID: <CAABR9nEhqWP9rbT5o0sa=KUoRgbRGynratygQRaOoq600FdvGg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ASoC: loongson: Fix IISConfig0 update in
 hw_params for rev 1
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Yingkun Meng <mengyingkun@loongson.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi  Binbin,

> > On revision 1 controllers, loongson_i2s_hw_params() reads LS_I2S_CFG
> > and ORs the new LR_LEN, BCLK_RATIO and RES_DEPTH values into it
> > without clearing the old ones.
> >
> > The first stream after boot is configured correctly, but any later
> > stream with a different rate or sample width ends up with a mix of
> > old and new bits, so it may run with the wrong rate or sample width.
>
> I tested this patch on a Loongson-2K0300 and Loongson-2K2000 board
> (LoongsonASoC sound card).
>
> I ran consecutive playback and capture tests alternating between
> S16_LE/44100 Hz and S24_LE/48000 Hz, both in stereo. After applying
> this patch, switching between different sample formats and rates, works
> correctly.
>

Thanks for testing this on both boards!

>
> One minor suggestion: would it be possible to define these bit fields via
> macros, or use FIELD_PREP()/FIELD_GET() with GENMASK(), instead of
> open-coded shifts and masks? For example:
>
> #define LS_I2S_CFG_LR_LEN_MASK          GENMASK(31, 24)
> #define LS_I2S_CFG_TX_RES_DEPTH_MASK    GENMASK(23, 16)
> #define LS_I2S_CFG_BCLK_RATIO_MASK      GENMASK(15, 8)
> #define LS_I2S_CFG_RX_RES_DEPTH_MASK    GENMASK(7, 0)
>

I'll update the bit-field definitions as suggested and also apply the
same approach
to CFG1 and rev 0 to keep the code consistent in hw_params().

I'll send v2 soon.

Best regards,
Phuc
