Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841453;
	b=gtDQdZWmnNjKkdkYvmTFTHCBNfdKV5mNvClNCYXdqoXB8ozROXXsqm1xmdGi+udQYTty
	 EdrYBDb9v0/Tei66caF7xiCyLy3ZjcuiZ6XKu39/lkswj3AHTvgaqoj4EUfr5qcNktmT8
	 CaW4LZnMj9p8JpTtO9vUqpX89vIqNJI0uDT6dm9/TbzmRxsRyTG5DAp8rCWfjLHeRSXd2
	 AWKwzpk6fzoVHPM1FDjd9R+aVTzUX29LnuCBOhpA4xasM6hkqXphW2v4I0J4UF21RAp91
	 05eOTe4uPNlQpCu4fCgGpP29rIFYbew0Qtm2aTkU0Omw1kAJHwc5PYRJQB5qi9jfXZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841453;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Stw5+ypxiuuDcFjRfO42e75cnyWQUntYeYbJhTdoraw=;
	b=lk4my5l8s0KiLhYau+Ygq+L4QK16o75Bwv5p0LEhfIVHZZ4W+tdaVu5Ef1KDnfHGIj+n
	 hCDOkftZieZXtC3e+Si0MGn5R/JnIFwYUD+gUEJBz5llS5EuWvZ1fEYmTk6H8W0bwyzp0
	 XGWgjJ22iMXEXY8I6DjgofC6BVI/3kCVeDdllT+2H+uIVis/YHk7u4PeCpxdoPEQOY0Zy
	 Q7ltD+KduxbeTEK6Uf1pbLSN/JS3m+6g5dqtNXnW730JuSpute6wgVqJNUZQgviSw+yhu
	 9qwIO5XVusChrg8CA9bg1mU85tkc01R3CE3+andiHjmx1OEWRVm+SNyqpabMtiWokPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ODvfllpv;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC878606A31B;
	Sat, 24 Oct 2026 11:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC878606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ODvfllpv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792841426; x=1793446226; i=markus.elfring@web.de;
	bh=Stw5+ypxiuuDcFjRfO42e75cnyWQUntYeYbJhTdoraw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ODvfllpvW0xXoR5C2EMRHOZlr3kwVv1YnlPcQ3iE2rhkfprzRhO+8lSzIrMKJaUb
	 Enc3qQShfgNA7C5ipKWlSulrTEVZrtLyR8LtCAwJm7k4/QkAQ1O/Fh3vv3doxu174
	 K1iBFJGf3DCIlbE1kr7o01YuFI2vJBtxsDYcqOUtuGI5pOZAjvf9ExA96k0C9eFrj
	 0anQqevA4KOmvoOgxZxikaZYVaqmClcDqcPQeYN+uImKmSf5+UL2s/6EgqYNrLsZt
	 J5yZ9OIhn1tydW6i6mUnY9K4sGRaZcGS0Z0pPh8Bov+dmWpX3fXvVsJbRLTrra+Rn
	 ncVEpIymIB6cHVRf9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIya8-1x1PB53b7S-00KRgp; Sat, 24
 Oct 2026 13:30:25 +0200
Message-ID: <33b90e9d-096f-4a85-8d17-2e43b0609140@web.de>
Date: Sat, 24 Oct 2026 13:30:12 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Calligeros <jcalligeros99@gmail.com>, linux-sound@vger.kernel.org,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20261024-tas2770-idle-fix-v1-1-07b02d46ec2e@gmail.com>
Subject: Re: [PATCH] ASoC: tas2770: Only treat negative return codes as errors
 set_tdm_idle
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261024-tas2770-idle-fix-v1-1-07b02d46ec2e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZMtmRPM8eOYd14ieby48mK40EuD8Rjppy4Vq7gK8+welKyac+fP
 IkSmXRCmXFnnCm8doRDzbBN10P9BcjHTLMTTWVM0ODRmheB5s7ufd/wapcTva6PrhovRkh9
 4jxSkNnwTsMCtvNYwEQtr9gRNYt5+61cUAIHq6K21j1R8NAYIOCCF8MLw6F0pzkBoHDYJO4
 kF4kj72oZRrlc+3uXrCWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7LfoKvzZb5M=;V3fz7jbezOlcsmF4JFJrxZb9hVX
 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

> snd_soc_component_update_bits returns 1 on a successful update, and
> we were returning from tas2770_set_dai_tdm_idle early on any nonzero
> return code. Change this so that only negative return codes are
> treated as errors.

https://elixir.bootlin.com/linux/v7.3/source/sound/soc/codecs/tas2770.c#L4=
95-L567

* How do you think about to refine the summary phrase another bit
  like =E2=80=9CFix error detection in tas2770_set_dai_tdm_idle()=E2=80=9D=
?

* See also:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.3#n34


Regards,
Markus
