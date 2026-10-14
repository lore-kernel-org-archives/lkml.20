Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA04D52CCED
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989713; cv=none; b=L7je+8xErBMEIwFx8GUtP6O4gaDLalR+LoVw2W6w0qj8zh0FjRMjpaJn0P2ZX5UlXjQvtkoV4U8qulOx1cLeITJQbnzGcusYgJ7hPwNXhCU85GmAvbsR6ijsGSGX65qClNpsJx8v0nxOcfcT1aJLqlB8LkxrYYk5+B1qeeGZV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989713; c=relaxed/simple;
	bh=QakIRovc0TVKNQht6OlwetbBWzG2d5kDs2PKBQl9iiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drtw8a6YuzFjfyK4rV1GcbgIZ00pDCXxFuCBq3TapMrX2/zCzr+kFVClCFo9cfFCUz9BhoQWQhSTQldNT1v43btUJqF0dAvJ2UZwQzj67rZDtzBqmsO3veY4rvjKwgov+WmlVDtsZ7QvkK6ELBghD7USDlbMkTHMFzcnYHCKwo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=LrcgccZx; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="LrcgccZx"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-534e6545939so3938101cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791989705; x=1792594505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9QCcIHMwt8UPRdNjGegrJCBOmv89ai6OoP2efzt4zBg=;
        b=LrcgccZxx7Jgo7dxHC5DuhhrIsOKmo7SwS+IJNdqVv9Iy44+RmxIxC/EozGO2vYn4R
         9Tub8V/n4o+i1pvwVqbTm0GAp4VDbte/G8d/j1cyz97gkWrX44OmO3i216W1GDVrBreT
         8eK3F4iDYQIqO6Wyn0EfcFZQOnJcyCKVBfsjWBOq+XbNLjNHcChSnnEShmV+JM3gUJHw
         qV2Fo1+87Rm5Xa83p6xzlknu0okEXglg9Mclb7+x+rL/oM8nDCcYrsakrKt54QObMYr5
         HajQlG36eUanTwfhKH9d4Rw4kl67bD5LqEYE+sA+8ZOa0ES8KgrdbYUzyCjVHCf9qGCx
         2XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989705; x=1792594505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QCcIHMwt8UPRdNjGegrJCBOmv89ai6OoP2efzt4zBg=;
        b=0DkMfbSlaV5CcMpKE6VWTe8ApBavhCUwYFPkvM5yROrnA6hsUMUs2PavF51WW73igt
         LJkIXI8nHlAlssRNaIB3dxk77xAzpKnkhYDYct/8dJl5Fcj7jVVJHY3SANW+d4X4QJ+A
         0mdNdWAmK3IIniyvvjUhX9obITfa05VtM54yJXcHJ7EXBW5iNKSEWV9qTXPHexD3CSxS
         IBrVJs/HhfZArr5YhNS5ov5T7c5LN8DgeDzd/lpIosT9m09LoHKr0X6FRSw3eqenuqQk
         2cX4ImlDFgtZOHEDe40NTy1a74JnuxG1A3/oaJEhTWR8lkCPW8BiWUf237dvSdt88kdg
         OQ8g==
X-Forwarded-Encrypted: i=1; AKwUvBws1rFiVVrrBsC4VmLQa2mFQXjzjXxAMbH2jqdzvqGhIzBfj70Qs1LUcViO6OtvVUWI4zwyyRdgAFEWINo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkyLrc1o4FhcRQC2bH5hj4R/78sBYbaHEl+Fo7ZhzVzhe7msKS
	M+KtSWMJ7MUf539vdadYCUn6XGwqdvk5u6CGYo33W+eVSXZz0b5H+X3+1BzYhYVpQeUihuTzG/3
	ZNkoHg74=
X-Gm-Gg: AYBFou3J9wOMNC0eYtbj62R9L8LmDgblMaduMphalBwKUF4naj1vymGVkJpKkzCYyRK
	f2LzRAw4jy/6ObvV8gcD49s0N87BYpNOvCSvs7BZuxMrAwKQSboiYDOc1dEyIqG7C79bKWB6XbD
	9k1GdmbQYdSEPcyyhnitytVlnhFvzchoky+IO+K1+rrFf5WvGh29bHaO5hgQICK4TmXNsHy0lJb
	f5bycZRoK8mGMo44vyzQ+oO5VlfIHO7DsAzn1NPkEykBV9xT1U/TFoc7DF8Elvm7dqyWsTCtVg1
	oPYSvZdyH8XlqXOYRoPbqZHg5pihghzj2gOVCVf1hupdsBiCcEmpyU+EifHdymraEGW5hQb5RRS
	wlTybE7EoU59wKaMa3o0g2b9G1KRQtjC3j3mxV/KZDZHNO/zDJuVocsaOc0sBL579DnK9HBMhyQ
	dcN6GHttLUHP4peGkhj0ckfxfhWCu9lO6rf3++L2MQ/DdXV9WK0akycK0P/OltX9Alx5+Va6w=
X-Received: by 2002:ac8:5cd4:0:b0:535:70ff:58b with SMTP id d75a77b69052e-5359fb26794mr248817971cf.38.1791989705320;
        Wed, 14 Oct 2026 07:55:05 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b755c35sm126150641cf.15.2026.10.14.07.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:55:04 -0700 (PDT)
Message-ID: <b8a8ca4f-c575-448a-baea-4b9f82f15e39@riscstar.com>
Date: Wed, 14 Oct 2026 09:55:03 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: tglx@kernel.org, radu@rendec.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <20261013-coexist-sixtyfold-cc6614086d3a@spud>
 <20261014-eminent-normal-lynx-3ebba3@quoll>
 <c5af1a40-e498-4855-8797-2663db83b9e6@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <c5af1a40-e498-4855-8797-2663db83b9e6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 5:22 AM, Krzysztof Kozlowski wrote:
>> I still do not understand why do we need to describe the inner wirings
>> of the tc9564 device. So far I found no posting of DTS showing proper
>> usage of it on the host. Without proper usage, what is the point exactly
>> to describe the inner specifics of tc9564?
> And as shown here:
> https://lore.kernel.org/all/20261012152408.3729237-5-elder@riscstar.com/
> 
> there is no single user of any of this (this=reset, clock, irqchip
> probably and more) in upstreamed patches.
> 
> I am getting tired to keep discussing it, so next time instead of words,
> please post CODE which is the argument - who uses any of these devices
> you keep adding.

I'll take a break from my in-order responses to messages, and will
respond to this first.


Our ultimate goal is to support the two DWMAC interfaces attached
to PCIe functions within the TC9564.  This is a complex SoC which
interfaces with the host via an upstream PCIe switch port, and
incorporates an embedded PCIe endpoint with two functions.

Based on your request, I will plan to send *all* of the code that's
required for DWMAC support for review later today and tomorrow.  I
have been pacing myself (in part not to inundate the lists with
patches).


A block diagram representing the TC9564 SoC is included in this
devicetree binding:

  
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?h=char-misc-next&id=ed0a1c1eaa376e11cf8c97d898f2811b8ded322f

That explains (and attempts to show) that devices (including clock
and reset functionality) use PCI endpoint BARs for access to their 
registers.  Other IP blocks shown are an address translation unit,
a block of SRAM, two XGMAC interfaces, and an MSI generator for
each of the two embedded PCI functions.


To show the final DTS file, I have squashed the working code I have
and refer you here, starting at line 994:

  
https://github.com/riscstar/linux/blob/18d7146c807a6264388c919391b77a795612e342/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts#L994


Note that this exposes many internal details of the SoC, which
Krzysztof objected to here:
  
https://lore.kernel.org/lkml/fbeac5ba-a28d-4d34-8d23-4946aef515ea@kernel.org/

I responded, explaining some history on this code and asking
for clarification on criteria for when it's acceptable to
describe chip internals in devicetree, but received no answer.


The PCI endpoint bus enables a PCI endpoint to be treated as
a *bus* that provides access to multiple peripherals, rather
than as a simple single-peripheral device.  This goes well
beyond the capability of the PCI enumeration process to
discover the nature of the hardware, leveraging devicetree as
a hardware description language to describe the organization
within a complex chip.

I understand the desire to consider the PCI endpoint (function)
as the boundary for devicetree descriptions.  But I also see
great benefit from viewing the SoC as a subsystem in itself,
whose IP blocks and connections between them are described
using devicetree.

					-Alex
