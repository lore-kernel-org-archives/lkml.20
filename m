Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E86F389E1A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718408; cv=none; b=YJf51ntiulGbzSpslnaQHtRW4lsyAFHoPxpMAChCAvj53cnyFUVaHs+ow7tNEoCgEMhll5xZHtnLgjRS+2GXDWD3u6Ftq0nPH/nk5GHDRq9uYmQ6UyNUxUXQdK8RD4sDnNsYepyG6NHQq+RLY1FwEVUSap8UXjlyCGDK9pd13+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718408; c=relaxed/simple;
	bh=jkWKcMGX9RoIQ4Xk96n1ewh+X7AwVxVhAZWhTZhY0EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQKGVBTAnUhALkwKJOF9F5FXMhl20Vc3T6EFSDicYeOAFP7EzSYU7cBo8MnnP9uVvlA+/uqX4GBED8RaVY8Jxudktg5kjZf+CGMiFohxEI6dBBnDCXN/5H3kWBsqjcW/dXlvloxDbadE//k2pEs0M7mgIg081MURvBsHMIDnd18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=gy5DtX9r; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="gy5DtX9r"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jkWKcMGX9RoIQ4Xk96n1ewh+X7AwVxVhAZWhTZhY0EM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788718404; v=1; x=1789323204;
 b=gy5DtX9r9WjcSqZ7cu9ShONBqoTKMIteehWTxeoEPXpOaLJiweVdfCVBCES6iV8eoRjnirOo
 Tw3sr6yCBCaWzhycEWT2aV4iUoQILQO+jvnrVvwYclWZ4n4b96qNFUgba8D6Iswdnzw7YByi/0p
 NKZo4zCyMXsLB4E2bgQK1pk/5FRJDN54VZbujjTCstOxC0X7nibMjkiU2Ql/5fVFQ4esnsAWdAM
 lKlsUaafalxW6tdqcoxfetTk9/F/EhxCw8ziwEQSOTQcyUejyVfDXGzomfHERidUKX4h9sccqe0
 HXd0Ok2zCXew2S05SOHySAZPyZCUDKb1OEfJt/iKKyjRg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e62d033d317547c0;
	Sun, 06 Sep 2026 18:13:13 +0000
X-Mizu-Trace-ID: e62d033d317547c0
X-Migadu-Flow: FLOW_OUT
Message-ID: <91e06588-94ab-49c4-a131-347caecba3b0@postmarketos.org>
Date: Sun, 6 Sep 2026 11:13:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg: Enable NFC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org>
 <0e5368aa-0b75-40a6-a023-af2eb4589249@oss.qualcomm.com>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <0e5368aa-0b75-40a6-a023-af2eb4589249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-03 1:10 a.m., Konrad Dybcio wrote:
> On 9/3/26 4:03 AM, Paul Sajna wrote:
>> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
>>
>> Downstream dtsi for reference:
>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---
> 
> [...]
> 
>> +	nfc_default: nfc-default-state {
>> +		pins = "gpio12", "gpio62", "gpio63";
>> +		function = "gpio";
>> +		drive-strength = <6>;
>> +		bias-pull-up;
> 
> active-high pins and pull-ups don't really go well together, please
> verify that
> 
> Konrad

Downstream decompile sez

nfc {

				nfc_int_active {
					phandle = <0x46a>;

					config {
						pins = "gpio63";
						drive-strength = <0x02>;
						bias-pull-up;
					};

					mux {
						pins = "gpio63";
						function = "gpio";
					};
				};

				nfc_enable_suspend {
					phandle = <0x46d>;

					config {
						pins = "gpio12", "gpio62", "gpio116";
						bias-disable;
						drive-strength = <0x02>;
					};

					mux {
						pins = "gpio12", "gpio62", "gpio116";
						function = "gpio";
					};
				};

				nfc_enable_active {
					phandle = <0x46c>;

					config {
						pins = "gpio12", "gpio62", "gpio116";
						drive-strength = <0x02>;
						bias-pull-up;
					};

					mux {
						pins = "gpio12", "gpio62", "gpio116";
						function = "gpio";
					};
				};

				nfc_int_suspend {
					phandle = <0x46b>;

					config {
						pins = "gpio63";
						drive-strength = <0x02>;
						bias-pull-up;
					};

					mux {
						pins = "gpio63";
						function = "gpio";
					};
				};
			};



-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
