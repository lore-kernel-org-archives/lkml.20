Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236026;
	b=fkscNMZFn8UA8HFSO4T52kRuMNdx6ljt+LWBIWDEPGVWz/qNCfvC1Q9G89Uyj0gXf1Ox
	 WxEtKSA6fZxY/Y3QnNpxe9lgP4m3GTHN26wtM9sD+a7LMoqsdpN29Ki5jVU774hIRH3PD
	 mn9SnGLEbxQW3C99R28HpdFGYPFIM9S0aWrtFKCqv8tR5XLHceKjPWkYDZIGFRqFsM601
	 4b3ofa//wmhITIH6m6cgXPvz/4wS1sUS9QYcWkdk8gII9W/9dEFtnuAyXvD1UUJl2FxLO
	 Za+asid+Lz7JqaSyaB7KD/XqgYTZY6lNuWwsgw8H8MJvT0csw0qjB5p2BqeRLTctyZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236026;
	h=DMARC-Filter:Content-Type:DKIM-Signature:Date:Message-Id:Subject:Cc:
	 From:To:Mime-Version:Content-Transfer-Encoding:References:
	 In-Reply-To;
	bh=ceacrMlp6mw/lN+zsSUJu5X8+9PuN/FPhfrLE5/MHh4=;
	b=hVJYuGvJQIYOsQNuJgCSXIKaDbHM2P70eCT1B1Lv275dWbWAiXdYJPDOEVzSbqBfUQ6r
	 r4Qn3CSPkp0cCNwF0JyTUubFivbJZEwKcsCGJBaPWMuq4zkxMqrBq9ypaK6sZdqTw8IOH
	 NSvzgET5JoUIqV8FhiZUDoShGwUbUKl/mSfULAkIbmFwkdWDpxogI7Xpa+I7cJv5UL2o4
	 EIVcZtWpCOd4WL3kfiTs47Bc8SgcS+FifmQPtMzX4chPmKM3oaF/TZQbwQ00UqD0QSs2a
	 i+bhB0jJCln6fPN3pm0N+HO3IbbCytzC4sVZuDAttlh4ZmJ0iuSX5AaaJpBd4b4yGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=unVqbcq6;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA013606A334;
	Mon,  9 Nov 2026 14:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA013606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=unVqbcq6
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1794236023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ceacrMlp6mw/lN+zsSUJu5X8+9PuN/FPhfrLE5/MHh4=;
	b=unVqbcq6rZN9RtkaS3VzwjS/EfmvS/Pod7VHNz/aTJfuSvsjGWhbCoApLoyXRxBWaCuODf
	qkaBA52g/qCRWWrpLX1+hGV9VHWWn+VOEyj1UNbVy6/PhYKz10ZmtvQDkl16TeHWWSVQHh
	iHHg1RxYAfvsJvvmzNIJ7zy6pdadcbU=
Date: Mon, 09 Nov 2026 15:53:42 +0100
Message-Id: <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new
 device
Cc: "Robert Oscilowski" <drgitx@gmail.com>,
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Frieder Hannenheim" <mail@fhannenheim.net>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Frieder Hannenheim"
 <git@fhannenheim.net>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
 <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
In-Reply-To: <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>

On Mon Nov 9, 2026 at 12:08 PM CET, Konrad Dybcio wrote:
> On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
>> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
>>=20
>> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/line=
age-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
>>=20
>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>> ---
>
> [...]
>
>> +&i2c2 {
>> +	status =3D "okay";
>> +
>> +	pm8008: pmic@8 {
>> +		compatible =3D "qcom,pm8008";
>
> No PM8008 on the other phone?

There's 4 phones in total: 8 (instantnoodle), 8 Pro (instantnoodlep), 8T (k=
ebab)
and 9R (lemonades). The OnePlus 8 doesn't have a PM8008. Should I define
this in -common? It would need to be disabled when a dts for the OnePlus 8 =
is
submitted.

>
>> +		reg =3D <0x8>;
>> +
>> +		interrupt-parent =3D <&tlmm>;
>> +		interrupts =3D <112 IRQ_TYPE_EDGE_RISING>;
>
> interrupts-extended =3D <&tlmm 112 IRQ..>

May I ask why? According to the docs interrupts-extended is only useful wit=
h
multiple interrupt parents which is not the case here. Or just for brevity?

>
> [...]
>
>> +&vreg_f {
>> +	status =3D "disabled";
>> +};
>
> I think it may be cleaner to move the definition to the other
> phone's DT (are there just 2, or more?)
>
> Konrad

The f block is used on the 8 and 8 Pro I believe. So I think it's best to k=
eep
it this way.

Frieder
