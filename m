Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421998;
	b=GBV74SQLmop17/LZCjEHkROOHQHCZnN26dPCnSU1NIBp9hh3EY9n3+LKdocKRNOo7Uk6
	 ki5cPi74usRmllpC2YON6NjvkADJEyyYGk4B8jlUVFd8OEf8k1na5yw8E35MU2V54SwAF
	 fKXgnS1/uE7REkMR+J1ZZm1gwRjQhO8zaL0VJ4nkacC3h2B0oN936N2KdHc+YTZ7/eC85
	 EZDa0dn9mmHOliReEgiVyPe/v6TaX6ucnwNa66tFa7b2NVnPek5xTEkm/BZyVtKraxkmd
	 ltzHGjbQWE2LgcUpMJKEATeY4JCtjMuj1E325UzFBY6lxkO6O/O4BSDvYSlQcEkR5hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
	b=licufxal/d/l3d0Xf8iGblbP8XWM0drLqPo0S2wul7HA4HxlxMXzJFvDTwwHFcQgPWdO
	 qlituVYdzfiY4XwPpOb/47qk/+Uw4o4CE5MvP859rC7mLuCA72DED4YKzHw7V2A5bAkRU
	 Yr0DXNvpGBHs+/mpQb2kS+AgjuSE6ywpuxyBOqC3RCE11pLSX0RyhqUin5i2Hgz+L28YB
	 Axy0tyatcm+JMF8WvTlRLKhU9JH6GGGFXPbqsDh6tiNqUhZjjLQmyyUn3dc5nEZznwGYv
	 LiX9jO5vmycvFad0NDFHwydfodwewqhSEUeS7mRjEqA23DI112wt4sWiKgoQ+dUvqNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=es5j+XNP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095D6078872
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D095D6078872
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=es5j+XNP
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f036b17easo129836eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421997; cv=none;
        d=google.com; s=arc-20260327;
        b=JlK2CVML6NBS47b0YltmVCARX55OS7lqs6sBC0oEPzK5+DVx6ZlCUu68fjOR+579/Q
         Y/moPbAC71ke4rtyuYvpB4jahUmba9i2gW+YOglT6mqSZFT+8FkfusVjeEOl0m3sDIdm
         64G8OHWj5lNB3qjIBy8e14GZvcrFsVJlo/EM0kJjIw8OZaM6yGoXHLpOgl0URRc2RPi5
         5dMDYSwnwb7vB7YASOGja/t6AUFYx3Mah5YgOwYx2wAyso6phOJJE/y/2h3+SJW4QZBT
         Jhl7ae5VOtz5eW3Y/NvsKaAuT3EKR74Sev5wD7lOgBtcvF+q8phj5lgaxBqc8A0YPRtb
         MQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        fh=3h9q2GbQDP1xdaFaoMocTTsB9xAgW0IL5FfxwNFdwoI=;
        b=OFuVIpbUT37Q8shBELivxgB111nZFo8tilIhLqw5xrFNFfvmK1U5cg3c8BmNgDsTnk
         yJFnYtD0utNDtA86I7vObQR/3iSakd9Z7H/U3Lru6717AwcBEUMJVIvTqfRnzhGwdpm6
         Pzf4jkblfJCliNt1Y4Hz3m1AsajOqLmzTVrLMazSpf3Y/D1WG++++yyuzKy/tI6vo4QV
         royqwze9Een7VtgupF/cRGkI2+hnm3NAllPePAAZe3n8uDElghLjDb1gMeGROZmxUGbJ
         jBMdorrwA+/mGe7Cg6wmQIrcCkdobs2jLa6gM2ruUGo65e1fxopypYUB1XxhSaPnYZnO
         cOXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421997; x=1793026797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        b=es5j+XNPy0vQhY7phMc+bpgICxNIdwzctank8y5azkZD2709Tgu61B+cbluxhH1nPL
         u15/SiYCetQvBwOfZMXGxEgY392oZZvz2jP3rB3yIIFNlwxJSa31cDdkoypPNUJTHCS3
         vqg9TeHZzh5+ecPXweLZy//cbNvvzfMyeRooDGQHFYRKthadi8Vkn30HOKRkWWsNuIqH
         7HXjGYQZ+eMhDD0E+9GN9kfYRo8Mje+We+BtZIPeOOKJ4iBZOTK1Rc/FVS2sZr1SkUm+
         DsjGy6gI+pek3TF2r2cCKTXrJgfYKEtHu25lrALbipY7tHHrLLQsD0DtNbaVvfM56w7v
         tqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421997; x=1793026797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOK3YCI+wL2FPbOEUCxouW4aFltJ6e++LOuPX8f1U38=;
        b=UyDoWZxRdvq6ohtTWq63PvB051OjRsObVffSSohBT+rGQT4HlZsFc5IeD377KUx3E0
         +qX5KxacmLjPbWLtnaZsRXeppnIerj6KRnc9J75TClMJa0K5plHD15HQuVppd5n+6tgO
         3s79Kedo22I+p/s9qNPDMCUrthXcRfScLmaoSybKTHTNbWfQwGBYSboVEjiyWGNFLnR+
         gNdqJpcIb4gqXyYck3cOtSo3y4h4qGmN+xClZ+d6R4gZ8+WV96SU/EgLvbzX6FddPhNN
         hGObVyB3428EHZriGFJ1bJTQfHxdjk+9QHQTV1uI9jjzvraSgu6Kh6NOlqjcnvvGKs9l
         2dgA==
X-Forwarded-Encrypted: i=1; AKwUvBz4kRDqBMqVPnWIuBiNBx1OdHKv8mJacmV27AyfFAmP87SPvhmUUyOQYZLJj4rpn3bJGgrTplfK9UWYDwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCOvZ8u34ED5fJkcC8ESaCJM74wDIKgMyOzZ2/2zxa2FYvKmdC
	bhcGDsY2P8NJ2QiPhM1vnDm0dGXm2C5crlmZN4wjJKQ8LlXjaGTrJ8bV3PRVUiNOy3ZZeLT2et9
	ewGwxhqKfjiF+LvYi/o17YqwAuHR7Oqo=
X-Gm-Gg: AYBFou3DOTxSFhTFsnCgwH2uXtk2U/R4WHiEwKw0E/XyqlhrMgsddGaOmXMT9QJ6UAR
	UmnIkD+Pfv4wFYOEneHzNDRUAYgfjW6V0hGUU0FnbJFjdE84uVoQYH0xHtsMgos3j53JMldaxcQ
	04d4JUqy/WMmzYdbu5UIWY/m/2Ubh+cD4WugfeO3olViExDe7/mifYbVyxMWO3Iwo51nr/B9UqQ
	gHVc2vad+8EKtXm1wmz5hPSr/o7/g05B3Q2DPbdEb5Kar7yYrua0ymjvePdZOvpZCVLAc6GRIAY
	L5QTZkf+fkpggUCa76GeHIn9ZWp7T155iZgRYKMuO35Olii0Tg9yRfKf3bpZemMQP6MErygS6Ad
	c7SLfcwp1iH71Zv9rwqUTano=
X-Received: by 2002:a05:693c:860a:10b0:351:727d:b9c2 with SMTP id
 5a478bee46e88-361a18634bcmr13588245eec.17.1792421996823; Mon, 19 Oct 2026
 07:59:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org>
In-Reply-To: <179198322819.839288.5272985130898382430@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:59:42 +0300
X-Gm-Features: AclHuK_ZuMv647lBIwF248HcvuKvZ7xEYTSnrsbVhEmmD8JSr7pPARagQdu9MDM
Message-ID: <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Wrong subject line.
>

What do you mean by "Wrong subject line"? Specify.

> > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lightin=
g
> > Management Unit.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat=
2870.yaml
>
> [...]
>
> --
> Lee Jones
