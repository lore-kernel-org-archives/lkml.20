Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220600;
	b=QfMLRzz7PQUdUd3DYBIqqXXy5FBP3mKSWUNDWa1m4YVH3ol4fffbKCjv2+gHuDPAuzQX
	 VAm2cMlvQop2LDxpqytC7dW9doAtKpyECXwmdnqepJKfIZnq/Ckv7Hv5PSBw1u982aZr4
	 RNtNbXwVv7thiM4gQ6c7jRNCI/sXRG6rWElRS6uWJHOQzkmeTIoWN+q/A326L+WhYpzI+
	 h1FDBxmK2615NVmdPrTAjIoH2YZqq+79NJEdqb9UWjqOU6aR8hpHwg/0ZQy0+TTqAR0tj
	 MisMgHyAxVuemrngoT3c4quh49bEFwkZHPlcrNA+gSqj+ptt3qnIXoM0Ix8vgLCNxSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220600;
	h=DMARC-Filter:Mime-Version:DKIM-Signature:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To;
	bh=ovprduxLgum2CY0XHb/PVUWcwSUV6g1yux7UTHcX5AM=;
	b=KFmNbkQu/NFe38rmv3rbyJMq/0mtAjkTB6wHbPYAxRrqjK9T1/YACzyYAgFaiq+b8gaq
	 +DvE1T1PGeh9ukB3J8umGyxrpCwYryVqxrg/ZUH8RmoRXpkvwgZ7LgbzlxbdbPcw6myWA
	 q7kgjhetoirfsxaEpzvNoHfT12XPTPyjGdIz7SACGZjLAFC6jvlnqum9pv4mCn8A6Jrov
	 BTOibZ/rNvIYBGm8SJ8IufOy9wB/SqiJtNe0Xp96oVULR1AAtP4ta9CDcpHxbdO9CdmdW
	 LTCCS1BwF9AU0iuSAiAJWelk98wJdDsl3TMKPeXcsVboR1KmyrzJK2T1rsXuoN640Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=0zVLGqBh;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE0606A31C;
	Mon,  9 Nov 2026 10:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=0zVLGqBh
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
	s=mail; t=1794220596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ovprduxLgum2CY0XHb/PVUWcwSUV6g1yux7UTHcX5AM=;
	b=0zVLGqBhpJnPasZaYQ6zfHjg9JqU0jEm2CuMDhqHhWPVnr9eDZ6MTrN2FmnmxJOeaTORCf
	q69MMMPQPO6LOSt0x8akGl0X35JnKTc31p8Paca+xcBYVJw5Fp5KEvY5pNA6+imgb46ZNg
	EBaUU2E3O0vmY8n3HSdmzDixOQldvZE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 11:36:35 +0100
Message-Id: <DMQM4AN8JPSW.388R1H1XOM5JF@fhannenheim.net>
Subject: Re: [PATCH RESEND v4 2/3] arm64: dts: qcom: Add
 sm8250-oneplus-common.dtsi
Cc: "Robert Oscilowski" <drgitx@gmail.com>,
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Frieder Hannenheim" <mail@fhannenheim.net>
To: "David Heidelberg" <david@ixit.cz>, "Frieder Hannenheim"
 <git@fhannenheim.net>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-2-c6bbe6ded92e@fhannenheim.net>
 <48420a1e-3611-4543-9d3a-7add3049b7ac@ixit.cz>
In-Reply-To: <48420a1e-3611-4543-9d3a-7add3049b7ac@ixit.cz>

On Sun Nov 8, 2026 at 10:05 PM CET, David Heidelberg wrote:
> On 05/11/2026 20:20, Frieder Hannenheim wrote:
>> This file contains common properties shared by all OnePlus devices using
>> the Qualcomm sm8250 chipset.
>>=20
>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>> ---
>>   .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 607 +++++++++++++=
++++++++
>>   1 file changed, 607 insertions(+)
>>=20
>
> [...]
>
>> +
>> +	gpio_keys: gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		label =3D "Volume keys";
>> +
>> +		pinctrl-0 =3D <&vol_down_l &vol_up_n>;
>> +		pinctrl-names =3D "default";
>> +
>> +		key-vol-down {
>> +			label =3D "Volume Down";
>> +			linux,code =3D <KEY_VOLUMEDOWN>;
>
> Hello Frieder,
>
> patch looks good, but I noticed - which one? this key-vol-down or later a=
t bottom,
>

Hmm well the pon_resin doesn't seem to emit input events. I don't know if i=
t's
used for anything else but the volume down button still works if I drop it.

>> +			gpios =3D <&pm8150_gpios 7 GPIO_ACTIVE_LOW>;
>> +			debounce-interval =3D <15>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +
>> +		key-vol-up {
>> +			label =3D "Volume Up";
>> +			gpios =3D <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
>> +			linux,code =3D <KEY_VOLUMEUP>;
>> +			debounce-interval =3D <15>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +	};
>> +
>
> [...]
>
>> +&pon_pwrkey {
>> +	status =3D "okay";
>> +};
>> +
>> +&pon_resin {
>> +	linux,code =3D <KEY_VOLUMEDOWN>;
>
> or this one?
>
> David
>
> [...]

Thanks for mentioning this. I had already tried disabling the gpio key and =
just
using the resin. I will drop the resin in the next version.

Frieder
