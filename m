Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7240327FB1C;
	Thu, 15 Oct 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069308; cv=none; b=F1F3JTFhuU7szZ3vNcczrnmNtF7W0qVVsr2i69XY4iELxclJw+Kw3dr3y+fN046rrM/Z0HfVpQxywkQOLzpCXRLCauY4UffEgi3C8oi6OSwsOtScaTdTg+ga6RdpU60vR6To4TS2O/O619r3kdXKR0tj0/Gd3McviczdU8yfH44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069308; c=relaxed/simple;
	bh=cOi8INQxMJO5xrkMJPUAlKbnYKd1UBxaoDwQK5r/QIo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K6Nb0FZsfVxAdsNjrsmIcVjcNKXBXhOaMS8l6Iu4aNdQDW4l3TB6HCT5X5UmqqjksksTGJkTmoBjtqWNmt1Dpu/ZP41H2oIm05IrJzZS3x4kZ937fAJoLgqlYSHsNSDqov8aKikZmayoydFxQzby5lsz8loiqplr+VoQzzqnVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=JSZS2s7w; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="JSZS2s7w"
Message-ID: <a5fc6d63-75c0-44b8-aacb-245c9b7530d9@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792069298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXy1fifPCEzynS0G8IsZGcyXX7Dl+X3W6XOr87H3oGY=;
	b=JSZS2s7wc68IlYkrlezCuhWTPfHQEKXDQYjCqT+xpvj2M4Szv+9SLAOryIdxIMKqKjZiEi
	aAC+pg/oTt5tHutvgTxIpOqP3I6bNOrQl15tZPCqGnCnHRzl0MbSwqe1coQpkTy/dDWnTj
	Q2+o1cljaQQboIt9AOHhG1lBV4qBWpI=
Date: Thu, 15 Oct 2026 15:01:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Frieder Hannenheim <git@fhannenheim.net>
Subject: Re: [PATCH 0/2] Add OnePlus 8T
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
 =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
 <1daa1740-2c91-4ea3-84a5-7f256ac0f07e@oss.qualcomm.com>
Content-Language: de-DE, en-US
In-Reply-To: <1daa1740-2c91-4ea3-84a5-7f256ac0f07e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad,

sorry I forgot to reply earlier. Thanks for the hint. I added the 
dt-binding and fixed the lints in v2.

Frieder

On 15.10.26 11:16, Konrad Dybcio wrote:
> On 10/15/26 10:57 AM, Frieder Hannenheim wrote:
>> Adds a basic device tree for the OnePlus 8T (kebab). Common
>> values for OnePlus devices using the sm8250 SOC are defined in
>> sm8250-oneplus-common.
>>
>> This basic device tree brings up a framebuffer, UFS, battery monitoring,
>> volume keys and UART. Further functionality will be brought up in
>> subsequent patch sets.
>>
>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>> ---
>> Frieder Hannenheim (2):
>>        arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
>>        arm64: dts: qcom: oneplus-kebab: new device
>>
>>   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>   .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 618 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  | 124 +++++
> 
> Hello, thanks for your patches. For DT additions, you also need to
> add dt-bindings for your board and validate the resulting DTBs,
> e.g. via:
> 
> make [...] CHECK_DTBS=1 qcom/sm8250-foo-bar.dtb
> 
> Konrad

