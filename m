Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557830;
	b=o+Su9CxUzLwakC8LIk+EZ3GrXG5w3CgrFKOP+ydNbeHAMNcN834QOh2o0Pbqyw+Jv3sp
	 fdEqmwITA5mTnl4q7yIh71cuX3ey79V3By+V/1WXaUvEj6Mnqzraq4IxCb2syoO1h1BRk
	 5ErNbCMpCfMTkl6cbWJiP5zy/Porf+g6VNuFdn2PVWDnoPVAj6mnlPhZNTHSJ4kfaJjVA
	 Aiyy1AL2/RpTpN/3/5XU5jsK7EV60lHuPL0FvQN+QW7FCUWBc7ubBiq5QdP3fWk0qYZMI
	 /qt9gjo0FV1/78eP7q5ry+ru4MO+Em8nuP1I2tK5csT7wW08ZzTxeunPigZYraS9izA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Aa20yMC+qrPNN01+rXYcJyf/XAQhNrt1bJTIMLzFkc0=;
	b=1MktW9bCzzTFOWwNM2IO1Q9s8zORoGx7Hwx3eEGor8aQlTo/vnRFKV/ykeYIQxF+irMT
	 Dh1a4LTD77hyLOXP9fDIowCy1zcltRQsq18Mm/FfP3oUbGW/L+GrtNEh1dfRWjjwiQk9d
	 vLyDs6kImWZPlAB/0EQt10gmDmvVA4HHQaEkhE18cat7wNrlC+uYJFRDGA1BB0Y+qqvPD
	 cnu3JRDU2EmIe/L4D1KDEwupQqgJCxbb5UZZpNf05cR3RWytY89wiTbPFb+xC31AyQWf+
	 i/QIaVmIjRH+o6oIqodjyH9hUzxuEdq2lX2VlIIEMUIt6ZxST3aRj+ROQkGlOkNh5Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZviSqqXp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F415D606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F415D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZviSqqXp
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-705cb6ceebaso1052060eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557829; cv=none;
        d=google.com; s=arc-20260327;
        b=poLvGPm8vNYN23xdDQyaiLA+vx6Sl7q6MQEJNCMc6VWp8h0dLM7+2v8ApU1M6DyrYh
         IoaYqdGRHJZT+Y4HfZ6LDt+iBJ7FZdA5/vcBc4swigJlMgUiQSFhBE2u2ou/F0jZR7r+
         rsb3Zg5RHE7KphEn38d7pETxLSzCYMfOHhNMu5u0EFYRFrKV91dALkSeCg2Bd1XmbzsE
         Z5VLjxWgfrghmEnRnaDmBDd1Z1HR+i1XaBLXtrzPANY1FN0ch5BzKvw9LBrKgvw1Jk1s
         IUoOVc9HJssEpcaZ3xi0OKAi6mYJmY3kPj8UOHYNIdEWjOMv3YZvuVRo147QOdDGxfBe
         lRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Aa20yMC+qrPNN01+rXYcJyf/XAQhNrt1bJTIMLzFkc0=;
        fh=acLtcTqnNCofJf+3j6v0fR/Zbq5XXrWUo+vZsdUSrfc=;
        b=CS7ysFL6XpbID8bf6CfMTE2V0/w0wezAA79+TUqAPz3kSBCtR+iJpis/9NZZ1vElP5
         jlI67SRRSSTt8dTz4PEcO2k0m4Y8YH+vMljlVy4evi2Yu23ysftoJeSxBT14/kXH6d+e
         DkH4cvsOu/GAAGxUY2v6+NyLnHbTGfHnLVfUXAiqUqH3tlyFQy784VV3NhaUBhNlLakD
         HFwTuTePDPRi6XGoInLl6QTYUzPXBTSD78H6MbIjvChaMovLH4FgDnc3QoTYNhm05sVj
         eN0dGvZAKvvDmgPfGJ+CQvJgi80VYmRI+AgnBEsVweUI29s65TFdQ91JAwV4K+bsohdw
         bZOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557829; x=1795162629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa20yMC+qrPNN01+rXYcJyf/XAQhNrt1bJTIMLzFkc0=;
        b=ZviSqqXprtJkTwGcqDLbuEP9A7MkKflFXZVq5ryC7K+MsY2qTlYfz2wczPzfmIevmg
         Q6XxmuV9tFi30cN5q4ysSrTz4kc+oX100N0fqiyn4aoJ4rHGuI3j0+bNiv8nbC1hwNKe
         IyB6Qm3XuXNwSqlXxf3oeReTKv9fLg+Ng0PfAqdLRdVuC2bjwTyW1JxvPSKrCaIwRMg0
         xME+mjA7TdJPThdD+UAF4ikrVSr8+90GPNHYlKKN12k8ohALdVT67yXYrh/8W6Nx6E/h
         mOMB7eNLk2cpjbOhenSAnYDGvny+rNyOmRy3HMeCCKUMPk4Fo9+0rM0OdnFtCXVVOKqA
         5yVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557829; x=1795162629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Aa20yMC+qrPNN01+rXYcJyf/XAQhNrt1bJTIMLzFkc0=;
        b=LNwWUuJziPGLq9Z4YgfRfCrc3cMf9no1VIl++J5fp8COfk8ALFy9E9hJgzYs8VN4ui
         57+Ocf3+w4YIqGfk/EpGnKYpSa07pKuX+JQTG0GetcfT0KCpdJ7OHMA++J55NX3ybsk8
         uERlZrF4sAx5n275zq5Pga9dmibardUck1rJJDbbUVKvn3RXKd2M/A/ZwX/Gz1lmjOd1
         rpQyDQ+3nRm9+uNKke5oZScehk95r1ezPRG7PZIuxzfJSCSsvJ3ATTeh6ks/TyMMLdgT
         6amyyf4c1vhDb82XNhrGrnAI6hGRJ4dR2TgB6k23boLAv7agmRftsxmqsuag8gUqJS7O
         Tr8Q==
X-Forwarded-Encrypted: i=1; AL+hErEhMT4bmPOS2WVvanBzWBWcYSuPVZqlqaku4Sszpev+NVNfkvib8SN8HEPy3iQthpMma6+JKsYUfUImmKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XOASL+UFPNYhXdu/RhBB+CpZG/qo/3t/RrR84McCO1SnN6xvf
	UGj9Z0V5fenGCoprmO0NwiIK0zmTzypQcgUWLVAOI4vvIizMTXazZjHDLg9Pr1rdsKwh1/0Seuj
	PrenOj3AlJxPVTyXGgZ9Ro4yBClfthDg=
X-Gm-Gg: AYBFou3DuF+o4d6uTIB8MZ9jg83zV4U76R2wsbp2dtCbVHBpmtRL206SEdIlbBStmHO
	rMMlSqDxVVhtwsq5CXi40G+1JV/7B0aNzAJCDlT2On7smIEGSSaun+YiiIHG65cnhDyCjCwJtKb
	Xh2m32R88nqdS5PSxcrlM5h7gbUF06ROaob9Hwyei9TVnxco6YY3UgTp0SRZ9UTQus2Gk0C/NYB
	gSpbfXtpH0SsaYJ4e3OLlxUXDOb6i3nwtpJvBzOVup4uz9BE0eEV/fwJM2kRaHxOAAoDW8dzcY/
	adfNsbojJjgyT5IW0PoYrkdEB1mRikQUhx5A+KlKtoE5xQ+KSSLxhihluFR4Yko50PWDMUMlvdz
	oB1k43Y66qnZrS4uZm0KBbldED1k+N2erzilwlaGRCEcvL2ZxFt/hJmKJrAuSoEZ/PxghfQXQO0
	XUZYbbyJrtUsEL0iFwFDYWipN/W4Lwf81nD3T9LDbVDs8hpKqbB1xc
X-Received: by 2002:a05:6820:a088:b0:716:cd2c:e47b with SMTP id
 006d021491bc7-71ab5158f87mr921510eaf.87.1794557828952; Fri, 13 Nov 2026
 00:17:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-6-hjf3108@gmail.com>
 <83327241-2EE9-4F4E-8770-4C422D0430B7@linux.dev>
In-Reply-To: <83327241-2EE9-4F4E-8770-4C422D0430B7@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 13 Nov 2026 16:16:33 +0800
X-Gm-Features: AclHuK_1culTos-u-oxy_J93zKZtmhjiPq-ZDs1VYWKqmzaPC9GedZ23IH9qJrs
Message-ID: <CABOQOSUj9R1qHJh5M=TBi8Mn2YP68cuYns93R8jS0qK8FXZC0Q@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 5/5] wifi: rtw88: 8812a, 8821a: respect peer
 A-MPDU size limits
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 16:10, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the patch. One small question below.
>
> On November 12, 2026 6:32:44 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > index c8008cf43d..c8f5cdf31c 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>
> [ ... ]
>
> > +static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
> > +{
> > +     factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
> > +
> > +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
> > +                 ((8192 << factor) - 1) | BIT(31));
> > +}
>
> What does BIT(31) do here? I see the vendor driver sets it too, so I
> think it is right, but a define in reg.h or a short comment would make
> it easier to follow. The same goes for rtw8821a_set_ampdu_factor().
I reviewed it again and saw it, so I added it to be at parity with the
vendor code.

> Best regards,
> Luka Gejak
