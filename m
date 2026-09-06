Received: from mta0.migadu.com (out-246.mta0.migadu.com [91.218.175.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8965D36F405
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719176; cv=none; b=q3/l+3X4anZw1m7Sxx+pQWRVcd7R071WKfQTlOd32r5rxyjO6H4rJDdEzWyCu4O5f8IdaqQcyinGnu0TxOQYo+09AblOjY6/5LOYCpWZvbvTdnONit9RgqQgj/hqbcgoUNMQAO5+CyN41WjPquc4NaRTW5kt8wvz7Ov2k3DBtxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719176; c=relaxed/simple;
	bh=XuYHU17ULoOaOYbWvGM1WLt9cJp1C8HzBbYak20mO/k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VM1NBCUDYGdMP7OwefQYer1VCP10voqv5kinXi73oMC42+QfQtxtYRdfjKL1nZDQYPs/Yi/IXmCO3f9g8oUoXL50tpkboJZndPH7aNOtgqNEufI2RdS7S0GTR5r48KMVCPsR6Zpc+lhcHGgpbciiwlAcRY6GBPJ9ta7E5BGj2Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Sl55k/Z9; arc=none smtp.client-ip=91.218.175.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Sl55k/Z9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XuYHU17ULoOaOYbWvGM1WLt9cJp1C8HzBbYak20mO/k=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788719171; v=1; x=1789323971;
 b=Sl55k/Z9dYr6pJqe63vWaBBkKd3D0oVb9V6jI7bfGoRY9kTWVWmr2wzRO3zqiQQ0/Xi5D4Jq
 nYJEeiqpdpEnzraIsq89sclgDm/FADpLSrl61C0YbDQZmwpapO9W6ur8cY3Ggn5luKJygA1d/L6
 aQxXzjBuAY2ULR8gg+bdABZ8J/7mlMePHcKVHsPbPZ/GiYMcK6RR8MQV3elPXks2GuUPnQG4AEa
 1XW+PYEaaPXU2GzD/bvkgNHCwDSKdDKzRpB3akjJvdKZCbumhgfxk/BTT2onoNVc9ggnCdoOeZR
 d8tp7zMA9Haao0ltZF+wLkdq85S1v2bDXpF+a0Jaux0Rg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca19c528633357f5;
	Sun, 06 Sep 2026 18:26:01 +0000
X-Mizu-Trace-ID: ca19c528633357f5
X-Migadu-Flow: FLOW_OUT
Message-ID: <e2323841-5672-4b8d-94fb-602776379918@postmarketos.org>
Date: Sun, 6 Sep 2026 11:25:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg: Enable NFC
From: Paul Sajna <sajattack@postmarketos.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org>
 <0e5368aa-0b75-40a6-a023-af2eb4589249@oss.qualcomm.com>
 <91e06588-94ab-49c4-a131-347caecba3b0@postmarketos.org>
Content-Language: en-US
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <91e06588-94ab-49c4-a131-347caecba3b0@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-09-06 11:13 a.m., Paul Sajna wrote:
> On 2026-09-03 1:10 a.m., Konrad Dybcio wrote:
>> On 9/3/26 4:03 AM, Paul Sajna wrote:
>>> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
>>>
>>> Downstream dtsi for reference:
>>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/ 
>>> lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845- 
>>> judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
>>>
>>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>> ---
>>
>> [...]
>>
>>> +    nfc_default: nfc-default-state {
>>> +        pins = "gpio12", "gpio62", "gpio63";
>>> +        function = "gpio";
>>> +        drive-strength = <6>;
>>> +        bias-pull-up;
>>
>> active-high pins and pull-ups don't really go well together, please
>> verify that
>>
>> Konrad
> 
> Downstream decompile sez
> 
> nfc {
> 
>                  nfc_int_active {
>                      phandle = <0x46a>;
> 
>                      config {
>                          pins = "gpio63";
>                          drive-strength = <0x02>;
>                          bias-pull-up;
>                      };
> 
>                      mux {
>                          pins = "gpio63";
>                          function = "gpio";
>                      };
>                  };
> 
>                  nfc_enable_suspend {
>                      phandle = <0x46d>;
> 
>                      config {
>                          pins = "gpio12", "gpio62", "gpio116";
>                          bias-disable;
>                          drive-strength = <0x02>;
>                      };
> 
>                      mux {
>                          pins = "gpio12", "gpio62", "gpio116";
>                          function = "gpio";
>                      };
>                  };
> 
>                  nfc_enable_active {
>                      phandle = <0x46c>;
> 
>                      config {
>                          pins = "gpio12", "gpio62", "gpio116";
>                          drive-strength = <0x02>;
>                          bias-pull-up;
>                      };
> 
>                      mux {
>                          pins = "gpio12", "gpio62", "gpio116";
>                          function = "gpio";
>                      };
>                  };
> 
>                  nfc_int_suspend {
>                      phandle = <0x46b>;
> 
>                      config {
>                          pins = "gpio63";
>                          drive-strength = <0x02>;
>                          bias-pull-up;
>                      };
> 
>                      mux {
>                          pins = "gpio63";
>                          function = "gpio";
>                      };
>                  };
>              };
> 
> 
> 

Also active high (0x00)

pn547@28 {
	compatible = "nxp,pn547";
	nxp,i2c-pull-up = <0x01>;
	nxp,gpio_irq = <0x34 0x3f 0x00>;
	nxp,gpio_ven = <0x34 0x0c 0x00>;
	nxp,gpio_mode = <0x34 0x3e 0x00>;
	nxp,gpio_scl = <0x34 0x2a 0x00>;
	nxp,gpio_sda = <0x34 0x29 0x00>;
	status = "ok";
	interrupt-parent = <0x34>;
	interrupts = <0x3f 0x00>;
	reg = <0x28>;
	qcom,clk-src = "BBCLK2";
	interrupt-names = "nfc_irq";
};

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
