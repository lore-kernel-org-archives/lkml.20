Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783142;
	b=dXkwL4a6L2r4U1blBgMs51mhYoji3PucxJyg+gVWwEYpsKvj46UePDsNZ6HnPsSBrvBd
	 QOKJBYxuphwRVd1UUdReSVVHa2lVZ/bV8T/jZatOOSXjDiUcVhx279O3hEm1d1M2H2w20
	 unYOUqHDbKgpHaGsDriup66YYS9AlsRmqNJAI6Oxtz/jCL3Bdd/9uBSl7tzxwGaKBTg+6
	 m/pl0Qi6v9Dczu+VqhElUB4BJmvIA48XimjQB9I9aEJpjE6SJ9+uh6+96lqdGB1MCQnZj
	 ahw6adfYJckIqrvPKRu/Nt7SFbd3T7UdEgsv7qkHZNPsGMM21IbUBAiehf4SBVOwjug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783142;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QXo6rTrM1au9q5KLVv52jI2Mrttkr1Jcc6AQvREIgP0=;
	b=NbuxDiCEjdh8c93ZG8Adr9wW+KFyaxR4PtpsWYyxIocl4tDvnepnHz4N2n0sCEUHUl8B
	 VsBXDph3fF6VOFuzZ4PBrQanZh7q6WZ+FwGYSqo3qFpIKpssQuKzzmWIdUoNUUCqoWRtM
	 9yOl0Wcl2VfcapktSkwfTJB2lZkdDWu5UTBe8nKPSb5pOwTIAwSgrmlJseXqXj0D+lPXA
	 PnXiP4g+XKA28/6RKpT8ap3MwnPdGifgiJypcWfCe5BBIzLhhq3Cof+JUbUten1SAi0Pg
	 ksYDY+Ang4+GElC2m5dKT7+XneG9eFg7QM1zu5V00V7rDubnDGaB5khuE/6rmexGmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Q9s4KaR9;
	arc=none smtp.remote-ip=91.218.175.122
Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AE606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D2AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=Q9s4KaR9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3N4pCaJ+co792MUr95p2MPmPG0+0WYBnyKQV28tJvMU=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793783134; v=1; x=1794387934;
 b=Q9s4KaR9a4C1wOZ3Eu6EJwytbpQjUU2+eaJaNhTqIYsC0ZKKZNR12kLc/gIflUsDb+Is8iwn
 lp9jkFroFo5T3Vs3enc5MEjLfSQ/RTvcGOvXMo3OgSOdicmwMJncH8q+p1rZSKTEgxoq4kIVHyK
 XtJ9Zb8WIBMRd61ORMAVCTCNbS9Zra/tQocRJPs8OReJnibWygbXDiik+8JwOwSV1Y8GdmSEMhp
 e9lL7LkdjS2z89aq/fHYrKLvfA9iLLNHYeGJl4gS5wG6MHB4imhfgYnjdMl9HLNiXBlvCiBKV1C
 yD70qlRttoRV4l8MC0qIgZT9btsD2IIOzfBqIFr2JWjPQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 08ec60f0a43faeb3;
	Wed, 04 Nov 2026 09:05:25 +0000
X-Mizu-Trace-ID: 08ec60f0a43faeb3
X-Migadu-Flow: FLOW_OUT
Message-ID: <c9cb67ec-376d-475d-8d31-a3e0bbe20cb7@packett.cool>
Date: Wed, 4 Nov 2026 06:05:14 -0300
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc8180x: Add Microsoft Surface Pro
 X
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-3-val@packett.cool>
 <ea308aa2-8a2d-468a-ae5d-ec9a8ccdb2d2@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <ea308aa2-8a2d-468a-ae5d-ec9a8ccdb2d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/26 5:36 AM, Konrad Dybcio wrote:
> On 11/4/26 8:04 AM, Val Packett wrote:
>> From: Maximilian Luz <luzmaximilian@gmail.com>
>>
>> Introduce a device tree for the Surface Pro X tablet in all 3 variants
>> (SQ1 with cellular, SQ1 Wi-Fi only, SQ2 with cellular).
>>
>> Currently working:
>>
>> * Display, backlight (eDP panel)
>> * USB 2.0
>> * Wi-Fi and Bluetooth (WCN3998)
>> * NVMe on PCIe2
>> * Embedded controller (Surface SAM over UART)
>> * All remoteprocs (ADSP, CDSP, MPSS, SLPI)
>> * Volume and power buttons
> [...]
>
> This needs some sorting etc., but let's tackle the bigger prob first
>
>
>> +&mdss_edp {
>> +	pinctrl-0 = <&edp_hpd_active>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +
>> +	aux-bus {
>> +		panel {
>> +			compatible = "edp-panel";
>> +			enable-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
>> +			no-hpd;
> Is there really no HPD? The pinctrl above suggests otherwise

Looks like that's been pretty much copy-pasted from lenovo-flex-5g where 
it's also set with no explanation, with the same pinctrl also existing.

I'm suspecting that might've been an attempt at working around the 
inconsistent display initialization, pre clk_rcg2_shared_ops etc.?

I'll try removing it. (Also will convert gpio130 to a power supply like 
flex-5g has it)

> [...]
>
>> +&pcie2 {
>> +	// XXX: pcie1 and pcie2 are multi'd together, for now use just one
>> +	num-lanes = <2>;
> We should be using the new phy-qcom-qmp-pcie-multiphy.c driver I think,
> I'll try chasing down the right magic values
Thanks!!
>> +
>> +	pinctrl-0 = <&pcie1_default_state>;
>> +	pinctrl-names = "default";
>> +
>> +	// HACK: Remove "global" interrupt
> Why?

Related to not having the proper multiphy driver support,

"it seems like that interrupt is expected to signal when the device is 
ready for use after initial setup. Unfortunately that doesn't seem to 
work for the NVME, potentially due to the composite PHYs. Likely it's 
just waiting forever and the IRQ doesn't get triggered. As it's 
optional, we can just drop it for now."


~val

