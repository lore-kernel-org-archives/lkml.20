Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268364F93A6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417316; cv=none; b=UY9Ot0FPDt3Z2xsbQKi6A3lXsSLA9xWJZZVTrsB7xc8QzJOiRzYf0N9OiGUVxjujNeixd4jPK4sSa0y0Ka5WEZ4mJXq3iru9PZAoRlM3VS0l5cUdp6gHNdHh/jip27hEaeGP+ytaFZQfHYtywMw1wCznAvuwm78L1zlRY95ncTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417316; c=relaxed/simple;
	bh=qrBvbqPT1PvYj/unzA4BJv9CA15VUhJrFfLuKfno1hg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Z4BF4Tyf6J3mGvYceqijnS1uq79ehg3ME+azd/Z5FYGIAjhe94NstaTrslPEhlAujpvxTkYXXgxUMBmw3NqUvCiD7DjwI9KGriWJsQ82n4a7FSM7Ymh75wI4Z35wjHsY1DRN1DzSZ7NdN9WzQAvN5htTS17c3X9cbt+1i0fJeWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=E7WK3j2q; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="E7WK3j2q"
DKIM-Signature: a=rsa-sha256; b=E7WK3j2qEsD42xwu7LwH/xAzzGg1Gsiw6o2Trs/kVDwgUE4Ql9VQ6YYlWXDfLeKTo00v0HHNNFCAiWkU4XdHxuigUU4OHGXuzkKJXx9+Mhi/lIP+j11ROHTJ1Q3CCUMToOU3VKfv7dxORIVmvTvV0fOVWfjnqWi4L/Gyw24zr8uagEpUVthUmLZZ75NJsVbB8fRL8pMn+aV1EaGDxklHShAPniSRD4dIVwbWN+kgHWRR7Imh/VV66NM7bn2Ag8IcPuB6SwZVXExTO4OSJB42G2tM5pbPy59TZcgTsoZVehoV+iKa0JnmS7/Fqvj9mFdORpKuRneiQVlhNJmAQxmWxg==; s=purelymail3; d=purelymail.com; v=1; bh=qrBvbqPT1PvYj/unzA4BJv9CA15VUhJrFfLuKfno1hg=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1708545566;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 19 Oct 2026 13:41:08 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 15:41:05 +0200
Message-Id: <DM8UW484M1QM.1HU5NBOJ8TDDF@mentallysanemainliners.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Xiaomi 17
 Ultra phones
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>, "Igor Belwon"
 <igor.belwon@mentallysanemainliners.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20261018-nezha-v3-0-7e8c63903290@mentallysanemainliners.org>
 <20261018-nezha-v3-2-7e8c63903290@mentallysanemainliners.org>
 <srwzxkzxbbgtlnhp6nndneoh6wgmfuheryxkaezi3jyps6f23c@jj7bgtezypqm>
In-Reply-To: <srwzxkzxbbgtlnhp6nndneoh6wgmfuheryxkaezi3jyps6f23c@jj7bgtezypqm>

Hi Abel!

Thanks for your review.

On Mon Oct 19, 2026 at 12:57 PM CEST, Abel Vesa wrote:
> On 26-10-18 11:17:57, Igor Belwon wrote:
>> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
>> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
>> Qualcomm Kaanapali SoC.
>>=20
>> This device's configuration is based on the 'MTP' from Qualcomm,
>> as is also referenced in the downstream sources. Apart from the
>> usual differences (i.e. codecs, panel), it also uses the newer
>> WCN7860 (peach) connectivity chip, which is why WiFi/BT are not
>> brought up.
>>=20
>> The difference between the EEA and the Chinese model is the battery
>> capacity, notably, the EEA model has a smaller 6000 mAh battery when
>> compared to the CN 6800 mAh SiC battery.
>>=20
>> Currently implemented features are:
>>  - Booting
>>  - Power and volume keys
>>  - Storage (UFS)
>>  - USB-C Peripheral and Host modes
>>  - GPU
>>  - Fuel gauge
>>  - ADSP, CDSP, SoCCP remote processors
>>=20
>> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

[snip]

>> +		sleep_clk: sleep-clk {
>> +			compatible =3D "fixed-clock";
>> +			clock-frequency =3D <32000>;
>
> Is this not 32764 ?
>

Downstream specifies 32000:
- https://github.com/MiCode/kernel_devicetree/blob/popsicle-w-oss/qcom/cano=
e.dtsi#L1439

>> +			#clock-cells =3D <0>;
>> +		};

Ack for the rest.

Warm regards,
Igor

