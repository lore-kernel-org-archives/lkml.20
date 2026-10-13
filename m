Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9813D2FEC;
	Tue, 13 Oct 2026 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884104; cv=none; b=YN6dySbfGlvw5WN14BNEibe8mHenRZqS8oAcHh6t0gCjIZkS6aVYCisPpoz9G9dyIBMJsojRVVx4vZqVPxJeboqO2tXMuqmfS04RwVYVbTVD0w8g0MLcNZUQpSc8mayRepUQz93OQ7+D392Yyv1TOURbNNY/T8R/8VSZOsBZgAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884104; c=relaxed/simple;
	bh=eqboiIwySR6nXK3IkNKRRrtO/a7f9AJpwx3sykaagkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PK07ln8Hf4ONNi5anr9+8+7FWHwvDg8CXqlrngJrCPlrG513J0Yy4UDlPs584jNR4ScU25mkUUMmjCIVB+9jIRVbBIfUMz0yuziKkDhyRoEk7fx0tQyowLwEFfUd+8pkJp8Tpdvy0/rxcgIUx5uSNCkK0gJWUZJFL6ZPj0qLK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjC8b3R9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjC8b3R9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C676F1F000FF;
	Tue, 13 Oct 2026 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884103;
	bh=9SVkE2UzrjhKkGCiJnznxr4YkKgzwqP4eke4OwaJ56M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EjC8b3R9wIfai9RU4KJvJ5t9QIKZIpL2JRcsxwREXloGO7l/T8Ccb56x9rxc3kIDq
	 5hKU0DKdC+EDjo9Qbf6mELo69UTnzewDvcnvni5SpVfSCxMpbeVm8mwRT8T0JcL/KN
	 Hpf3dwFNefQnhvuIc2ZfcKpRPRqm026WGJFwjZE5YCMLuoPVROg/orBoq8b63hAsRS
	 MaQukNqt39uuIvIDfvCYgKFbGY6e9hsuljBqKbQ8OEhAQgBmpeyF1xIAvScRC+b7BI
	 jOY/euV/n93KLgQ9jGLBNEocQXx/JJpvXw623IGA4CaDUAZ/irR1c2zNYZ9i8TMVi5
	 hoS+mESOqryVw==
Message-ID: <92c7d0d7-cbfa-4fe9-9a20-82767dec618d@kernel.org>
Date: Tue, 13 Oct 2026 11:34:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for Talos Lyra EVK board
To: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
 Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
 Monish Chunara <quic_mchunara@quicinc.com>,
 Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
 Sayali Lokhande <sayalil@qti.qualcomm.com>,
 Akash Kumar <akakum@qti.qualcomm.com>,
 Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
 Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
 Vishnu Saini <vishsain@qti.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <f283d47a-8f37-40e1-a7ea-2fd70d2feb5a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <f283d47a-8f37-40e1-a7ea-2fd70d2feb5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/10/2026 10:55, Nirmesh Kumar Singh wrote:
> 
> On 10/12/2026 11:46 AM, Ruchira Revdekar wrote:
>> This series continues work originally posted by Avaneesh Kumar Dwivedi [1].
>> V2 incorporates review feedback, validation results, and subsequent
>> updates.
>>
>> This series adds initial device tree support for the Talos Lyra EVK,
>> a QCS615-based System on Module (SoM) paired with a common carrier board.
>>
>> The Talos Lyra SoM is a compact compute module integrating the QCS615 SoC,
>> PMICs, memory, and essential connectivity. It is designed to be paired with
>> multiple carrier boards to support different use cases.
>>
>> Talos Lyra is a distinct SoM revision of the existing Talos EVK SoM. The
>> key differences are:
>>    - Adds Apache (Lite-on-Module) WLAN on SoC Card.
>>    - Removes SPI-attached CAN transceiver module.
>>    - SDC2 on the existing Talos SoM supported SDIO-based WLAN; it is now
>>      used for the SD card connector only.
>>
>> Changes in v1:
>>    - dt-bindings for the Talos Lyra EVK board.
>>    - Talos Lyra SoM DTSI with PMIC, regulators, storage (UFS/SD),
>>      QUPv3 instances, ADSP/CDSP remoteprocs, and GPU definitions.
>>    - Talos Lyra EVK board DTS enabling DisplayPort, GPIO expanders,
>>      SPI-attached TPM (ST33), and USB on the carrier board.
>>
>> Changes in v2:
>>    - Drop qcom,talos-lyra-evk-som compatible from the binding; group
>>      qcom,talos-lyra-evk under the existing talos-evk block instead
>>    - Remove unused regulators vreg_s3a (smps3), vreg_s5a (smps5) and
>>      vreg_s6a (smps6) from the SoM device tree
>>    - Update board compatible string to remove qcom,talos-lyra-evk-som
>>    - Add "talos:" subsystem prefix to patches 2 and 3 subjects
>>    - Set initial-mode to HPM for all LDOs (ldo3, ldo11, ldo13, ldo15, ldo16)
>>    - Add EL2 overlay for talos-lyra-evk as a separate patch (patch 4)
>>
>> Note: The WLAN node is not included in this series and will be posted
>> as a follow-up.
>>
>> [1] Link: https://lore.kernel.org/r/20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com
>>
>> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
>> ---
>> Avaneesh Kumar Dwivedi (3):
>>        dt-bindings: arm: qcom: Add Talos Lyra EVK board
>>        arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform
>>        arm64: dts: qcom: talos: Add Talos Lyra EVK board
>>
>> Ruchira Revdekar (1):
>>        arm64: dts: qcom: talos: Add EL2 overlay for talos-lyra-evk
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
>>   arch/arm64/boot/dts/qcom/Makefile                |   5 +
>>   arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 251 +++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 137 +++++++++++++
>>   4 files changed, 394 insertions(+)
>> ---
>>
> Tested this series on Talos Lyra EVK platform. The board boots successfully
> with this series and no issues were observed during validation.
> 
> Tested-by: Nirmesh Kumar Singh<nirmesh.singh@oss.qualcomm.com>

Really, you cannot add the tag only to the applicable places? Replying
three times is too many, right?


Best regards,
Krzysztof
