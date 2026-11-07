Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059941;
	b=zBDfUXE52HqBwp682LyiusNIMryOd0UPlQSXgiK7akDjkovxmblCj2MWFJYysJNLjkOC
	 174uV5wwVaV47BPFWhJs4Odej2HsYEB6FEM38z+OyhwQ7CWvR39Tqsi3VnX6dUrBG6mpY
	 c2S2vEmV2auULoWOYY6oEAdort+J/nLOQURTOtgpwWzoVHFqQbsC/YHdl8kMM5TqRADDn
	 Ceg2xnmAVG6JrJjTvDhASLWJgATJSvCZZSNB2/defraa1A69MTViPbmO3xC4zXGdGhrH/
	 g7sgeCzB1NIpiZfS9wi7bDSlGNGGbjLzsp63gXKxwbG5kxfBzo6vRCf4JkktkkA3S5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
	b=sV5LzoX0fbQ/5a0Lccir82utCMgknlu9Dj00Z24PpoF8wyGI4yCJoBfB/LaOsdnxr+2T
	 2Z7EvLQW+pThlBLTNMVGTTzTSini7WAth9XavjNooQUWr0MA9yEJA6p78lDB/dXKgQJgA
	 wR9RSI4REMukVHW+JyYaiE2QHlpnJqu+gEK2BbH0edwtAzciolUeJBWrlBq8Vc8eP0tTV
	 lWkCWbVoP2L6B0AYPdYgjrd2c82rx90X1kadWFPJStZnqZptCcLKvaOldiSKaCi7KO4AV
	 dn6uzTJypu8I4izEgQV+3F9z6IA7oCBjLeJlVW4DY8EvIhDHnvITmFMlKVAF1QCpZ8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEyUDNy7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C0606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276C0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEyUDNy7
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679334baa1fso1912776d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059940; cv=none;
        d=google.com; s=arc-20260327;
        b=q9kXSsCKgq19veu8nQnUyA/6TKmoNVZL32qcdE1kbQTZwKO8nYlKIYLgKA1+l43ozi
         FbiH7FwXtXpFfD0tkJ94d4Yq5pAjVMlCb7mTV6wCSy/q6w56nlnayX1QcZhP8X/he38O
         UTzEU30JIVCju6gmByC/IIfUINW+ue08gK/SHziAfibfm2turij1al19qhzxuMxWEqEV
         EuEYAIayoqZ75KQl7DeuPnb+McxCcUONMmsfZC5fCua1UwQbHe6eBmH8zeADIGCkECDC
         6oKvioTSplPXE7GreI5YWjbtkzdQPVefYBiEMip6j13y9krCaCWfR6kKtwbSetVG/yhZ
         DIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        fh=8QSH6JyUiwIzHX9AEhFlETQL71FOKEJH1/+IapCIFy8=;
        b=DKZG1uc/gXB3TzzSza2h+G+to2p7bEl4XB+I+dNSBuRav05aCcxvIYqXomxhWJwtLM
         Luo4uXici2boAjjX1C4UZqSOOyhihdMtq6/WMjcNuxfAnsfQvTTDqr70oPriG4lZKEP7
         v1cb1InxXc4OPteQERrlnCeQYqxPeExqPV3oYn1NXZ1cLx4C/nnvxnr5JTRUcXJs/wOj
         trpQWhzc4rWLHI//8jBr9/G9DPBUjYki3/WgAFkzOwUQCKL56pnVSFDTJY4KYUZLS+TN
         OvQ2n0qu93NtV7mpsW9G90UAmuclQP3FpWJJnKa3z6nogD9jyxNRK9S8I2TffPoQLEPd
         vSHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059940; x=1794664740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        b=EEyUDNy7aTmKMbp07qiBDqoiEA0tfEvhxsvjvhJxPef/sSPkm6POk75XkrdCRdYrpM
         tojYcXpOv7axIcxgqaHJuvhLmYkffGeggO4Go0AcUoUYgM/xZ8a+v7/l4G9W6ZijU8mf
         Ew1yzpCgBieEoqnP2VqqaqvO64qkm3QLT/ltZNYatirrZW1+57A1t2gNo/WJZ7kmCO4K
         KuiZpBCZMcuSjsn8q3TVoA+eXXjfx0JYU/dLdAYQYAssdmDBxEFzuOBpSmoJt5jrChNY
         d+p28ksu6U1shxwFf4BaqGkkiPAIRuuEZCpq4hZE5hUsl9PvFK5lB4j/EzRCZMZYDt5e
         VFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059940; x=1794664740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        b=U6wfrZ7S1wo65vlnqoSMXu6KHoWMOrJuhTCk+7Xe3dkPzY8lV2DIGlRa5py/Ojwg+W
         L3utnRSuFYbePKDePMMnkxqnpGI6oqAtkpBIsA+ubSZPhPSiop3l4qJaRx4od9RlXSJN
         o5IeOQ8iV3Tdh6ibAcb0PIOHtzxEW9LEOdfNpCn1DJSky1f7lpe4xHOo8ROvZTM7PEFN
         pCJkspvcHYXuw/RMqZ3Ju4vDWpHjCisBhnTK/crr4wVNXUyRg0lQkZ2x23xAtH1WFmCQ
         /4zVy+wRLkNBwxANlUy94diPy7rZGSORxH1X+ppAn8Tm9uzOjtd0tsTIj0hbjnSluY42
         LfDw==
X-Forwarded-Encrypted: i=1; AL+hErGosUuJrXYScmWrOBQ9oLX54Eg+85B7hzNpkh8pnOA1Mqq/R4d9w1EWbPn7iLLFBxeSSgtLScrKryRYK2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8sG268fIOwDyh0cVPP5yTLKdjDYiqnMWJinwoF61mpeUzlmPg
	cWi7lnZeVuFv7BPE3HzenFmtvI7VtB222lOwLbL6O5gICBvRWTsL6WCWEitSbyYi6u+UKMMPK7h
	4s2tnkfQCPYRKWlnzPITpQPcID1K/r5k=
X-Gm-Gg: AYBFou1YfceQW4biAjEOGpnLhWvLvDyhgnIG7PRaZivZU1hdD6D90N+FvXYaL6OK7xd
	+o9fzP4FE8GATPqtJNsyHpecXsf9UvSdF7IYI4v31lyTzIff2fLg7qVZfe9cikBsypmbNVSohwA
	8zfRFmGtXTTAshMLLi4edfbVjBLXyyU3qIztP+kbsfl6fTNEwv6tc2bJRlnO08YUpyD1g1oZSju
	ZSCZVsy4QSSianI9jwl0Ya+yaStot8QGZGSoM9BAuwQVBHnhRuxpKTOYENrmTiXxEvJs/OY3lLa
	guGQaCIIn8mIhmpJASh3B3KAKsm+1ZeDdRgP9wXFRU4yB+mTAQP52UnKJtg7NuDm+LdcTHCKTKt
	EGQD6CCKDe9nb1SjuD0mu/RgHaTnjzym49k6JNtuLiDyK5C2KgiqkUBcpq/yuMkmAuymVsuoglx
	qAdyMCFpZVADSES0HWO5fdFRBjmghw5UedYQVy13iu5n0nBiA+EBdAXWI5Q755WBvLj/LV9dwK/
	8A1fyZVHoFU9ib+l7twKfa7DaQAWIsS1M5+eMsecHlRU+hR3UXhPvleuxoZ1w==
X-Received: by 2002:a05:690e:14c6:b0:67c:2755:7133 with SMTP id
 956f58d0204a3-67c275584b0mr1164502d50.129.1794059940031; Sat, 07 Nov 2026
 05:59:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com> <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 15:58:23 +0200
X-Gm-Features: AclHuK86k0sr_RRex5QWUFnx4k6XGaW6tT01IfPzghodPfwjLTwWTNGGOkqKBzk
Message-ID: <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:27=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Reduce boilerplate code in this driver and convert it over to use the
> macro subsys_platform_driver_probe().

Wasn't there already a set of patches from somebody for the same reason?

...

> +subsys_platform_driver_probe(ingenic_pinctrl_driver,
> +                            ingenic_pinctrl_probe);

Anyway, this should be a single line, it reads better that way.

--=20
With Best Regards,
Andy Shevchenko
