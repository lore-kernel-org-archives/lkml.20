Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263635;
	b=XSij4b/drH1LD+R43AmAEU++1DGtJ7uMdloLLy0/THobC1/x/idR0ke/L9oYcOOR1ECZ
	 xJGQGn69OanIrDox1um4BznFjnThla0a/M5CO9dyOXzNH5MYjLya494BldGA6IqSbNY7B
	 xYNHbiOubignw1xTp41jYKxaEMgtpZ/bPCsPFdAiG8Mcf0xLTgt5mJwNqg8CfT5W3LLwe
	 vk7yX7n2wzVZfTp5T5nPOn0twI7VzglkZYCh+gA1W9mGiLf0KeMpMQzvLqfMPauWMvJVn
	 OtWTRsMUBHMe1/ioBF3Z+FHVNbkA0aGEaSfEriymssaVVquKfEKzIdATXVo+/PXtOgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263635;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=juGSgCG90hPdE9/iBCfeU0O/czp1PvRM5jFo+xGilAI=;
	b=XSKsp0GhgFRKbiLoVrXsYpk/yW8OGBhczMflNkh3Chz0KEsOqZY8d7Lu1zVxmTp23/8H
	 2jt9YPJkOwWRasKJ6O91atIYkr02EbEilVBn5hru0q0PFt/5C5kRqrftL7Q1/qSsfDvfy
	 QUpUWtg5uWCQclR9dR7DRUxXkSTzkp3T116iWirraQPC0d7h5yq8zqTC/VOBGJ29HAlWQ
	 smwTKO3kSP/0B4nm+hmb4hHJDW8BpMSZIGIc6PCswcCNE3kTbuuQlvDljo+yNS39/+NXI
	 UuxY96GIDufbSmjk+QpdnN2t6ZHUGbmMsiNY2I5OPlGw61zxJf+MNTSpZ1iAP2Fc6gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=kIq8CGMJ;
	arc=none smtp.remote-ip=91.218.175.34
Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86941606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86941606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=kIq8CGMJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Pk+laV3dhTJwk3ZH99anCvnpBHgw0DllGaWgkIfgUSI=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794263632; v=1; x=1794868432;
 b=kIq8CGMJ8Ryzbro5ihd1ky31LpWN/HDF9mkeE+J42nWU1mRr7yZ1wCtY0MNfVeNVDagJQX27
 pTwAgmGpmClcYXXAIJfd0dT1YNIyRlxbIKG+PA/R2Bcfx7TZWF22Hb4TFl1KHx4xcWWJcFEmoqW
 KnCC9NzmlUaV6GEGRQ48GBv3YKycARKTQMTTUT8W0OWfUkvVpEDhYF9rqbyMO+BdV+nISXWS1ZO
 ejjMcp+Q6eyFdQrsVDzXfawNHRoTKfn4TsVAuyzx9MoIFpJuCZGcD3eSWuSebtp+5gIyUdJbxCE
 o5lOe5UqxcqB3n1CmuHYeW5j+Mw94Dk3gF6QC21/dig1A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a5961c1509ba55d7;
	Mon, 09 Nov 2026 22:33:52 +0000
X-Mizu-Trace-ID: a5961c1509ba55d7
X-Migadu-Flow: FLOW_OUT
Message-ID: <1aca2519-878c-4aa2-b869-7416e7c3e981@packett.cool>
Date: Mon, 9 Nov 2026 19:33:46 -0300
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
Subject: Re: [PATCH 4/6] arm64: dts: qcom: Add sm6115-motorola-common
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Michael McAllister <me@michaelmcallister.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-kernel@vger.kernel.org
References: <20261109221453.658316-1-val@packett.cool>
 <20261109221453.658316-5-val@packett.cool>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261109221453.658316-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/26 7:14 PM, Val Packett wrote:
> Add the shared dtsi for sm6115/sm4250-based Motorola smartphones,
> with support for:
>
> * Simple framebuffer from bootloader
> * Power, volume, and assistant buttons (PMI632)
> * Charging LED, haptics/vibrator (PMI632)
> * USB Type-C with dual-role USB 2.0 (PMI632)
> * eMMC onboard storage and microSD card slot
> * Wi-Fi, Bluetooth (WCN3990)
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>
> yes on both phones I've tested, only msm-id is required, not board-id.
>
> ---
>   .../boot/dts/qcom/sm6115-motorola-common.dtsi | 541 ++++++++++++++++++
>   1 file changed, 541 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi b/arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
> new file mode 100644
> index 000000000000..6a5110319bc3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
> @@ -0,0 +1,541 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2026, Val Packett <val@packett.cool>
> + */
> +
> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "pm6125.dtsi"
> +#include "pmi632.dtsi"
> +
> +/ {
> +	chassis-type = "handset";
> +
> +	/* required for bootloader to select correct board */
> +	qcom,msm-id = <QCOM_ID_SM6115 0x10000>;
> +
> +	aliases {
> +		bluetooth0 = &bluetooth;
> +		hsuart0 = &uart3;
> +		mmc0 = &sdhc_1;
> +		mmc1 = &sdhc_2;
> +		serial0 = &uart4;
> +		wifi0 = &wifi;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@5c000000 {
> +			compatible = "simple-framebuffer";
> +			memory-region = <&cont_splash_memory>;
> +			width = <720>;
> +			height = <1600>;
> +			stride = <(720 * 4)>;
> +			format = "a8r8g8b8";
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>;
> +			vddio-supply = <&vreg_l9a>;
s/vreg_l9a/pm6125_l9a/ of course, last-second copy-paste fail, sorry
> [..]
