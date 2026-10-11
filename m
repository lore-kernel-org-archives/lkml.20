Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDD2FE074
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748896; cv=pass; b=rtB8vlkqQzLfpgJ+qB1tU6m8sb5nY0cvcXhFYPZDO6Y2mta+l+gk9+3fvZie8DPCtoHvTvsvIW6lPVP1TPEaSdSeRpMpcDGTrPW+QX6R1LbXBEIODPCMl5fweLW/GEDgk2MklyQUFg6qSNqyp+9eljY+KlvaoNnbYzPQUO+oY+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748896; c=relaxed/simple;
	bh=1tzJN88GwpvDiyz/lrjVdtV8dFKQy4NpjoeYN/PYPdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdLyuPi4Z1nalBUT0ekEp/17H5pAJBf8TzCZEMoLV/+UANxBH6+Qob8jqOXmJT/wya7Gfs+hA4f9aOEiDNIPh7E5vPkR5rdKYMk4Mzx8/sTNE6hbQeEfKoFCcKgAgaMmIBA7TPgkrJo4o3Ozs3+swkXUsYuBa5RskdqvBfn2dp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj2ewtMT; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj2ewtMT"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917d595138fso10127566d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748894; cv=none;
        d=google.com; s=arc-20260327;
        b=Zq/13K5f52R/1oRGjbnFd9njzdkXNEJCtV8nESG4DveazpLXZM9F57qDsaTm0ccQ3I
         xfmKFCA7Evmm7Zkfgx2vup8ipmJ/BxEnV2NZ40kQ1y9fSFP5xtIfrYzlT5QVxlBPmg+L
         23HS4gly51kd/21DoIvurFzEfWwCyQYpdDXDuuEFchwK58wt918Vzka+cJ9HaEq4JLee
         Ew8WFD/OZgyP9BVtFdaAoPIv77Mwcf9caBdQ1wKquVk9viehP6FxBsmsH1hYMfnB5BH7
         9PuMdWadBWXrLFKdksdGVHlFtTJd2i6XygWy9HcPyNcl+gSbGWCgn2g3vBi/wAq9uKY5
         B2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6S4lTE+OpEhZb6bjQs47nv2nou0BGYnNK81t93sALC0=;
        fh=Pd2h13zWnwBL+SYbu3/NP9rc1rdTN0O7MXbSSEVaobs=;
        b=elv+OVUTcqeVCIzXDQvnXN6twf6/NilMOYd99UEsPls5kL7ekrKlxWCXfbIE+LmM/u
         Ch5Hent8h3wwyBEyCB1WxBRShiyJA9tLVNYJhSjjUHL31neprgyjhQXxj4UJ7timZhvK
         bF/Uq2lqD/u6xhsPsQq77ZQHpvK/y762ZuSS1aCcIGnq14xwJ63vA9n3f8ls+eToKJgN
         2ipfmhJgAlWgdN2AD4dvMrIv5fOFLT6+C1v1hZES+w6a4Wab02KOYd2tJg5BRJklbGc2
         qZnI0TsPJ1Bsu22PhoZeX4QAHm3M5X4oHnyMv/GrDAWbpNTaYK2GWUT1Qa7D9Ueg+MBp
         l4Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748894; x=1792353694; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6S4lTE+OpEhZb6bjQs47nv2nou0BGYnNK81t93sALC0=;
        b=hj2ewtMTYwaSPbrexTCOwRAPkXV3L3WMdGnMxNnKEXWjM1lgUP7/hoB9MO3WjNFY5A
         yyGnWLWUBJeMvP/e15LuMzRTlpitsx7fdIqU4BqyXqWpy0Cwt60Xy+XQYf5OBo30y+4Q
         eDzxtBu5LRYWr2j99RNZRo0Kheqa3GwPMtnav1Hsqb9jdvoc+ULrPS8/vBYHAVtfJIEj
         4mpJiG0qL3XROaPoZog563FR4gcFSPyN+L2ud8QHWI3z+SsDBD5uCNlFazHExKSaLlI+
         ONyrDnkZrrJDXSNTO7tPieH4Eo06NF7nhCkbe2DP/9/6Vsu/1yH8DEAtQBsaC2k+MsLp
         WSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748894; x=1792353694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6S4lTE+OpEhZb6bjQs47nv2nou0BGYnNK81t93sALC0=;
        b=hQN2ayoHQL6zfRIiBsxzM3UEnG0F7m7K5Cef/n0uZvdzjAqnqoBswPEOpBgVyzB/7v
         cCavQOE9J5+Qbix/WLgR6e5jgtgERNm+gLJp56HLQNiAM1mZyHZzI9kkZ3aNyNA4He1e
         jnE4bu4UAjn2nZpSO8vj5IIQ0i+r8SwEfCJePsqCddC1a3Po66hMSiklmswNaChZr/n8
         0lKp4MfMYpTWJG5M4oLOw7s9inX4cPyecW+PluQiZ4cqfjFWVvV+XnXwxcCM+tK+mQyz
         iKA7LfEX6d6yMDGAmTqkA8NfM7KJ+l5hs6w2AsOnik7lHJR0rgz3q7UBdnKX4WDHdhuT
         PPlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTRhoAy+KlPv591HR6TluLQPhqrDKoUrtnbIWBnIF7HVPjR9Ra2xccNw4fqmc59dPthzEeM2z6sI8k1bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8NY36QxbX7eFfR1sjwQRuZEJHgQkJX/OWqIcUT1enUwX2MWBZ
	RnUDg0bYlG5wqwrtWfzCCTWP2y5TZGire4PB/g34wUt/wGSWzpdoDcIVg76JHT2mVrpqUh/EeyO
	R/oA441maV7FS/m9nEsUo4OOnbFj8vVk=
X-Gm-Gg: AYBFou1Ck17XDvoEX45d5k537vhevYal9c2+uSr7Tex8Z9MRVitjLVXn/O2gfN5FOgK
	urTLPaYIHgxwWJWcu97ZPQVmiBKTE9O3eQo4AB9h2MP5Jdi/wpB6m8emaBo8ji5DDYyONoLikWu
	/3u+Q4gwsh5EPUhJfLM+2h3+qop5sR3axwHdMnaXj/LzNw5uKoJXwxhT7/noN/xSGMHFcP2t+2y
	R3Y/Fq5GHyJ/+AD9Cv1SQr9Y17D4s7qLTskVaTnlUa0kwu/ULrVFzQdke8Znnt/fR7XoejBc8gO
	q5mk5fnJPvAoa7jsOtoxifZz4306fflDBfeWXajC5xm/wFWqDSIS+Zm/lUUV8MnDQcw6GSRfK+s
	HeRtyNvvvubDnQwaxesKRdXm60VQwNWOr0P37YP/CpiXXESHwilOMTsBMq3tPzUJTFKU1i5g=
X-Received: by 2002:a05:620a:a41b:20b0:93e:c12c:fbd1 with SMTP id
 af79cd13be357-93ec12d08e0mr831249985a.77.1791748894091; Sun, 11 Oct 2026
 13:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-7-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-7-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:01:14 -0400
X-Gm-Features: AclHuK9hH6WUDnezreEOOPO2jeyuAE8H0CKQdbkUt_jrQI3BponjxKRx6Hgy5is
Message-ID: <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write
 parity errors
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#define TSUNAMI_PERROR_FATAL (perror_m_uecc | perror_m_perr)

Why PERR and not RDPE? Bad parity on data read from PCI seems just as
bad for the consumer. If the HRM says the Pchip poisons that data and
the CPU takes a 670 for it, please say so in the changelog.

> +             perror = live.perror[0] | live.perror[1];

The changelog says incidental PERROR state on a CPU or environmental
vector cannot trigger the panic. It still can on a system vector: UECC
or PERR latched before an unrelated NXM will panic here. That may be
what you want, since the error is real either way, but the changelog
should cover it. It also depends on the PERRMASK question I asked on
patch 4.

Two things that I think belong in the changelog:

A CPU-detected uncorrectable ECC error (670 through
ev6_machine_check()) still does not panic, so after this patch the
policy differs by who detected the error.

A PCI card with a marginal connection that asserts PERR# now takes the
machine down, where before it logged and carried on.
