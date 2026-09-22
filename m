Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414F41A575
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065461; cv=none; b=m3vlXh5EZtIi+OMkOiRBqC7nCDPPnc1TpJTmzV0I0kvlJkkTBKfYcWy74mhYVGZY8WVn48VzZyfyyjHmaGoWEWC3yealblx75Eabp9BLYHvz0xv1lOfo42ktCbX/v75LBU+x8esABpgN9jpoTpUOAdzNukAXloK/if6IL2u8IpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065461; c=relaxed/simple;
	bh=dIzwvHbubNIxzeAGu/6wR8vR/VcsOB80Qhi7H+evobY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJln4D1Tr2SJm4dpqozwlhIEiAErHSfCEcu6KV71c70OZsQjhmW0fQh6/fZHLUTKmhgk/i8JsAsgDJRYhy+DImlgQ4t7mnBAY9KVPtRJLzsl5bopZBxtlgauoyxG9+dT/LKrUq8LDDl8OrVc/K/9IuCSVAb1LSaDD5iR6IxQQxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPS+1GyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPS+1GyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AA61F00893
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065459;
	bh=QktO34jPXBfKdoHn+g231ToSz9I4E6jz14gUwoW6nA8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bPS+1GyVPa7XdVUiPA9k9+7yAa7xzmGu/WihUxoOrYyIg4jmIIk8rG9ar2msGlT1b
	 XZse7Bb7wM/ST11PV5YpFYVzgjTFPRwsktBUE+thaF7vFFsLQdMDBLuHp2d5etL9jq
	 QFJvMYdYRlBGke4Qxnri07n4W3y266itxD5UuU8m4jU1VykJQ/m69If93sTwODaNk9
	 wYteKpT/AOs1Q8Es9F60ZJBIoBkxk2vr3fiX+zRhMCp8q4SLyFAdlVRn9DBhyFuPBn
	 XLPX3JO+csjYHVzmWDy0oWaMzs34nx07GVPSex6iWFnobOJ8dcCzX3hPWAkt29aDzk
	 ViUxiHxWoBVFw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d6489419so101611e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByz6Fh9HMIzjDGGd0CSKfxBI1SukLksLccxxoFZirIMWDTY/UG8ZaWVr91kfB/vQHLnfBquLT0a+ga7rkk=@vger.kernel.org
X-Gm-Message-State: AFuF++lk+m4Hte0udS7AUCqAUrRjOFq4BbW/gP1jbsxmCv3gZj7EK9Mf
	p/Yw2SBAxHCqdheT3gxcxYp4TUNRNe+2rVDg81M/Go+wwU1BltTRqhr/v+8YKVYIzj0orZl9MKP
	wu6lDSgVEyLRzRZ87Og1B5g39xI3VZP5eQ5LYXHY5tg==
X-Received: by 2002:a05:6512:6281:b0:5b8:babd:dc2c with SMTP id
 2adb3069b0e04-5b8c1849028mr3748521e87.37.1790065458151; Tue, 22 Sep 2026
 01:24:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:24:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:24:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <16f1b504-c414-4072-98d3-49f60d552028@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com> <16f1b504-c414-4072-98d3-49f60d552028@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:24:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
X-Gm-Features: AcwNN1Uq-ON_akzO8Lb9slxy7TzsEXI6PEo-ClWH4f2m7UXrx1dbaD36Ih7SNas
Message-ID: <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller nodes
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 07:34:25 +0200, Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> said:
>
>
> On 9/21/2026 8:16 PM, Bartosz Golaszewski wrote:
> [...]
>
>> +#include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>
>>   / {
>> @@ -909,6 +910,28 @@ soc: soc@0 {
>>   		dma-ranges = <0 0 0 0 0x10 0>;
>>   		ranges = <0 0 0 0 0x10 0>;
>>
>> +		gpi_dma2: dma-controller@800000 {
>> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
>> +			reg = <0x0 0x00800000 0x0 0x60000>;
>> +			#dma-cells = <3>;
>> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
>> +			dma-channels = <12>;
>> +			dma-channel-mask = <0xfff>;
>> +			iommus = <&apps_smmu_0 0x15b6 0x0>;
>> +			status = "disabled";
>
> we should be keeping GPI node default enabled similar to common QUPv3
> wrapper node.
> status = "ok" for all the nodes.
>

The pattern across Qualcomm platforms seems to disable the GPI DMA nodes at
SoC-level and only enable them at board-level.

Bart
