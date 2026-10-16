Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD28D1F78E6;
	Fri, 16 Oct 2026 19:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792178233; cv=none; b=FV/XL6y6ThqPp4CdGOjB0jntQ3oe7R0EBIXwQ2DoFbxgTU2H6gBL+FJTMTWl/ZTENw5UF4bgvq6Vnfej6AaG4iHyVzEdpqU/UXwz71yKbaLaFOoMSMvmdXHWIXW1RPpLa81c606h4J3QNXUtLOdNUkP/8v/xTGvz55HJ+v+lP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792178233; c=relaxed/simple;
	bh=NZY6hX0AGyNH4QukEZ/+nxYK2j1ck/zb/IjfFy/+xVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ih+9R7HuNm2zO7tRgHt2Yfm0kA3SWAObm4emTuYhNR893D8AJ8Dp9oFahP0QcXhdPZQSed4kYjp0zTKvSLSM0gjXx5IIdg4PQh7HXdgVWt2FyRhB7+ORP7vCIhojrbWB0sFXuF80Il+2PVAMpIdr+kN5R7VUN4iSJqL9kdmfApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=FXwBCRrA; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="FXwBCRrA"
Message-ID: <585f21f5-bba4-41d7-8376-1c867458bb47@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792178225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vnXnJ9fVQAKWzB/TuTEcwm7IZ9GU4pzJHl/mgidS408=;
	b=FXwBCRrAMzhbCsPw3pINfB45iDKL6VliRE9XUmEGkF2HXVNQaIqhE/JuGeXm6wGNwmNbHm
	gcnQp3LoHYNTYZ2TtaDLSoHC/K/vqH6XAAJK/G/6VH1iCu2yk6sslLXMIiviF7j6K1LzZQ
	52FGJHD+WLCJLCNBEEIdj5w1NE7Slq0=
Date: Fri, 16 Oct 2026 21:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Frieder Hannenheim <git@fhannenheim.net>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
 =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-1-e783463bffd3@fhannenheim.net>
 <3912a8d7-6e77-4287-a3e3-84e726f7205c@oss.qualcomm.com>
Content-Language: en-US
From: Frieder Hannenheim <mail@fhannenheim.net>
Autocrypt: addr=mail@fhannenheim.net; keydata=
 xjMEaX+iTBYJKwYBBAHaRw8BAQdAjgnNmu6pLzUJq/DD3ZU3tTbKzC2npfFhEK6NYMLRukrN
 KUZyaWVkZXIgSGFubmVuaGVpbSA8bWFpbEBmaGFubmVuaGVpbS5uZXQ+wpAEExYKADgWIQRD
 lxn4P3kTLC9X/iFsAXPIt5MeUwUCaX+iTAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAK
 CRBsAXPIt5MeUzNaAP9KklaL+chH1bUa7To1Pn346guR/N/PkMkyvWgKRs+yzwEA6N2E6TZ6
 CJF8cW6gVaSFmNgGcGZUAw5A5MrUleV5PwPOOARpf6JMEgorBgEEAZdVAQUBAQdA51B2jbQ4
 iUnmggSYEqwukOYQmjBwsyUpc8Wkk9I8qkYDAQgHwngEGBYKACAWIQRDlxn4P3kTLC9X/iFs
 AXPIt5MeUwUCaX+iTAIbDAAKCRBsAXPIt5MeU3oKAQDyZDbjdjzNsJdliBQBkZXuaJDAB1Mn
 59LycSSRsRVCPQEAmNQIItBArt/kiQFu6vC4mXjtM5LzbPLmj/QA26ee2Qk=
In-Reply-To: <3912a8d7-6e77-4287-a3e3-84e726f7205c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.10.26 10:25, Konrad Dybcio wrote:
> On 10/15/26 2:32 PM, Frieder Hannenheim wrote:
>> This file contains common properties shared by all OnePlus devices using
>> the Qualcomm sm8250 chipset.
>>
>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>> ---
> 
> [...]
> 
>> +/*
>> + * Delete following upstream (sm8250.dtsi) reserved
>> + * memory mappings which are different on this device.
>> + */
>> +/delete-node/ &removed_mem;
>> +/delete-node/ &camera_mem;
>> +/delete-node/ &wlan_mem;
>> +/delete-node/ &ipa_fw_mem;
>> +/delete-node/ &ipa_gsi_mem;
>> +/delete-node/ &gpu_mem;
>> +/delete-node/ &npu_mem;
>> +/delete-node/ &video_mem;
>> +/delete-node/ &cvp_mem;
>> +/delete-node/ &cdsp_mem;
>> +/delete-node/ &slpi_mem;
>> +/delete-node/ &adsp_mem;
>> +/delete-node/ &spss_mem;
>> +/delete-node/ &cdsp_secure_heap;
> 
> Let's sort this list

Will do

> 
>> +
>> +/ {
>> +	chassis-type = "handset";
>> +	qcom,msm-id = <QCOM_ID_SM8250 0x10000>,
> 
> You can drop this first entry, it's for SM8250v1, which is a prototype revision

Will do

> 
>> +		      <QCOM_ID_SM8250 0x20001>;
>> +	qcom,board-id = <QCOM_BOARD_ID_MTP 0x0>,
>> +			<0x0 0x0>;
> 
> Likewise you should be able to drop the second 0/0 entry as it shouldn't be
> meaningful

Will do

> 
> [...]
> 
>> +	gpio_keys: gpio-keys {
>> +		compatible = "gpio-keys";
>> +		label = "Volume keys";
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vol_up_n &vol_down_n>;
> 
> property-n
> property-names, please
> 
> also <&vol_up_n &vol_down_n> -> <&vol_up_n>, <&vol_down_l>;
> 

Will do

>> +
>> +		key-vol-up {
>> +			label = "Volume Up";
>> +			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			debounce-interval = <15>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +
>> +		key-vol-down {
> 
> Let's keep the nodes sorted by their node names

Will do

> [...]
> 
> 
>> +		ramoops: ramoops@b0000000 {
>> +			compatible = "ramoops";
>> +			reg = <0x0 0xb0000000 0x0 0x400000>;
>> +			record-size = <0x40000>;
>> +			console-size = <0x40000>;
>> +			ftrace-size =  <0x40000>;
>> +			pmsg-size = <0x200000>;
>> +			ecc-size = <0x0>;
> 
> The zero is the default, you can drop it

Will do

> 
> [...]
> 
>> +&tlmm {
>> +	gpio-reserved-ranges = <28 4>, <40 4>;
> 
> Do we know what these are connected to? Usually it'd be the fingerprint
> scanner and NFC eSE

Yes that's correct. I will add a comment in the next rev.

> 
> Konrad

