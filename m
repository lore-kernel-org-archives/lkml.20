Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237066;
	b=wPeTizGf+4fUfnGWXWw0Ty4749i0qUtscw2MC1AVACNIGxEP6UM5hqwTSs/3j0E/7CFe
	 kQL17xsk3EhrOlBOcC4Dj1SmjWHf8gMij7wgIdpNzH+w5NETmdsDNGc3lBG41K3yWxAd9
	 xdhs8hpmQk+YrikjE2JhE9GGFvZ+1tYq5buRXTiyzSRtLYiGrmOE4n5ULbn5beLx7p6x0
	 B6ZjACorN+SICIb9M+rNcSKGrn/69zzoxpLdB2d6l8am3H59ktbdIo29AmPYNPPu0keeL
	 +8fpwThigHiq1DnSOpe9B3n31lYO5pKTHjMolD6M0cHn3TQAkTtoAwy91ReDdNcRXgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237066;
	h=DMARC-Filter:Mime-Version:DKIM-Signature:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To;
	bh=QHukVVsY3ERLHBle49P9WtdD5SFIl/bJchezwi+gYzo=;
	b=G4lViPa7hmHf61/YCPx9Mj5M0fLN+x1SnwNNTaGwSk2lEToEMJuej9PurWxfZIj1zd60
	 a4zjlQYlJhPmTn9fpTjnvme3LHtNSjc8Y6ByOVRxpSZ7mVeIjbpwRsZS/vQHfsfcnjkgl
	 oIPISvItIi7x/Busc3V9ZlpcCpzjgNXzv9lcUX6AxU4kpOAXNTAazI62keVPEThcZGcXA
	 ZXddhhIFBo7xhRfMeN4GQp1nWlAoBA+D5iWmwtGn+AekFdayOYJF+DmgjBr9xAM/6g/Yb
	 wRhVqpV6w/+lzJ+9pPKxagbvTSPkZZ0eNceH7mLifmJbea8iwW0sfym49EHF2F0HXvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=OlDt1ENQ;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F491606A31C;
	Mon,  9 Nov 2026 15:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F491606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=OlDt1ENQ
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1794237062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QHukVVsY3ERLHBle49P9WtdD5SFIl/bJchezwi+gYzo=;
	b=OlDt1ENQ6EB/Mw9GiuOsr+SA6don/9Gr7JNbvbsscAmF33T5Nxet1Fw2oSCAHdefvEIPt9
	P4orL58CdpqMGns+qNK1iFfjneU9pbXbpMB36E8MraEVY8UEp9GYDXDWRGbkhCEQQLK3fi
	ZODL0ahCbzTkS2M6SSnzWRLCXPfgYCU=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 16:11:01 +0100
Message-Id: <DMQRYF7OUIZ4.164WNARKSDMJC@fhannenheim.net>
Cc: "Robert Oscilowski" <drgitx@gmail.com>,
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Frieder Hannenheim" <mail@fhannenheim.net>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Frieder Hannenheim"
 <mail@fhannenheim.net>, "Frieder Hannenheim" <git@fhannenheim.net>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new
 device
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
 <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
 <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
 <cc6e877d-0d54-422e-b9e8-1cf8b8dbceb4@oss.qualcomm.com>
In-Reply-To: <cc6e877d-0d54-422e-b9e8-1cf8b8dbceb4@oss.qualcomm.com>

On Mon Nov 9, 2026 at 3:57 PM CET, Konrad Dybcio wrote:
> On 11/9/26 3:53 PM, Frieder Hannenheim wrote:
>> On Mon Nov 9, 2026 at 12:08 PM CET, Konrad Dybcio wrote:
>>> On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
>>>> Add initial device-tree for the OnePlus 8T. Downstream reference is [1=
].
>>>>
>>>> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/li=
neage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
>>>>
>>>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>>>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>>> ---
>>>
>>> [...]
>>>
>>>> +&i2c2 {
>>>> +	status =3D "okay";
>>>> +
>>>> +	pm8008: pmic@8 {
>>>> +		compatible =3D "qcom,pm8008";
>>>
>>> No PM8008 on the other phone?
>>=20
>> There's 4 phones in total: 8 (instantnoodle), 8 Pro (instantnoodlep), 8T=
 (kebab)
>> and 9R (lemonades). The OnePlus 8 doesn't have a PM8008. Should I define
>> this in -common? It would need to be disabled when a dts for the OnePlus=
 8 is
>> submitted.
>
> Okay, I thought there were only two. Do the remaining two feature
> this PMIC? Generally we try to do a lowest common denominator in
> -common, whatever that ends up being
>

I all except the 8 have it according to the downstream dts.

>
>>>> +		reg =3D <0x8>;
>>>> +
>>>> +		interrupt-parent =3D <&tlmm>;
>>>> +		interrupts =3D <112 IRQ_TYPE_EDGE_RISING>;
>>>
>>> interrupts-extended =3D <&tlmm 112 IRQ..>
>>=20
>> May I ask why? According to the docs interrupts-extended is only useful =
with
>> multiple interrupt parents which is not the case here. Or just for brevi=
ty?
>
> Yep just to be concise
>
>>>
>>> [...]
>>>
>>>> +&vreg_f {
>>>> +	status =3D "disabled";
>>>> +};
>>>
>>> I think it may be cleaner to move the definition to the other
>>> phone's DT (are there just 2, or more?)
>>>
>>> Konrad
>>=20
>> The f block is used on the 8 and 8 Pro I believe. So I think it's best t=
o keep
>> it this way.
>
> Thinking about it again, I'm a little surprised there would be variance
> between them. Can you do
>
> `cat /sys/kernel/debug/qcom_socinfo/pmic_model_array`
>
> ?
>
> Konrad

fried@oneplus-kebab ~> sudo cat /sys/kernel/debug/qcom_socinfo/pmic_model_a=
rray
PM8150 3.0
PM8150B 2.0
unknown (39)
PMK8002 2.0
unknown (42)

It's not used on kebab and errors out when enabled so it's disabled.

Frieder
