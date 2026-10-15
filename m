Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CA372661
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093659; cv=none; b=ux7ttXAfBmdP8lbtRd9cBP+qju/Vs0cxpZcPE8HgWSJLRHqfzWFEz/Pzrz4bR24QAJjHZ9cEvJhOfrxLDiNg3xPFW7pxEqOYjqGmZKrmCX9EktDWhjBDxZWCR5OULIzOPmJQvG5mkcWt9FDW3OKTnsLF2LZG5cANBus4MOocIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093659; c=relaxed/simple;
	bh=rEzZFF3roU9aTVZ9/CO59TibiUooKjnCPKswifSLXUo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XXyLK0htswj4yGoPRi4vEfkwtgBTYc2zx9fr3ZGvetXmnpTQn/SmeGB+WK/sonklsuE/V/XC3Z8Jc+kkUjj5F37lehfPivJ1AadXJtEmpB1qBsNPha5IV4H28UCALOK8nlcxveAkDGmqpzwISK8ZZMi/5p92uNfiK1fq7HygueQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=j/xQ8388; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="j/xQ8388"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 87A6A81043;
	Thu, 15 Oct 2026 21:47:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Diwc9Re1lGn; Thu, 15 Oct 2026 21:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792093653; bh=rEzZFF3roU9aTVZ9/CO59TibiUooKjnCPKswifSLXUo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j/xQ8388pn3sZMK4saWSF55ZYjCUe16chydMwkSrSE2RGaeI3LK0MkCqwFisOYAJG
	 BAfGhY0c+b29/Zj/Tz6AoErq2ZHYH1Zsb68FWk+w/Zl83M5fAzxMpsd1YdF0SQvQJM
	 eE8LZO+IN80wShucwt+NZFAlJLDshvwqBIP/BeO7gWl8wkwsz8pYzVwuFVJDOsc2Yk
	 ZZxeMpsA8j40Xznf4KRnh+TASBiLBN/wqc1yy2CdO3aABm1D2sbcNsauBIS9ij0Yri
	 xf7jfjJf5q0q2Ou42AjodD6ewb+SGdOBePRZcUum2UNf85EXOO5HcTS3nG0QTWchSg
	 8Cac7cSXGKugw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 19:47:33 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Stanley Chang <stanley_chang@realtek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend for
 resets and RTL9607C support
In-Reply-To: <1106b5dd-5453-46e4-90a4-7c7673cd4dd3@kernel.org>
References: <20261012173739.36377-1-adilov@disroot.org>
 <20261012173739.36377-4-adilov@disroot.org>
 <1106b5dd-5453-46e4-90a4-7c7673cd4dd3@kernel.org>
Message-ID: <d71a544ad34c34ac4db7dc8fd8004245@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-10-13 06:05, Krzysztof Kozlowski wrote:
> On 12/10/2026 19:37, Rustam Adilov wrote:
>> Add the "realtek,rtl9607-usb2phy" compatible for USB2 PHY on the RTL9607C
>> SoC series.
>> 
>> Add a resets property to properties to describe the usb2phy reset line.
>> 
>> In RTL9607C, USB2 PHY reset line is from "IP Enable controller" which is
>> multipurpose and handle activating various SoC peripherals.
>> 
>> It is unclear whether RTD SoCs have something similar to that so set
>> the resets to false for these devices.
>> 
>> RTL9607C requires the "resets" to be specified so add the corresponding
>> if check for the "realtek,rtl9607-usb2phy" compatible.
>> 
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> There is never "yaml" in any prefix. Don't come up with own style.
> 
> 
> Best regards,
> Krzysztof

Oi, i am very sorry about that. I am using the scripts/get_maintainers.pl
command from [1] and it only covers the last commit which was not the one
touching the realtek,usb2phy.yaml so it didn't get any of the device tree
people. I don't exactly know if i can get it to output full maintainer list
in the context of patch series in one swoop without running it across every 
single commit and then manually combining all. I think that is what i did in
v7 and prior versions and forgot to do it here.

As for the yaml prefix, will remove it.

[1] https://kernelnewbies.org/FirstKernelPatch#SubmitPatch

Best,
Rustam
