Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCF04A2071;
	Mon,  5 Oct 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210043; cv=none; b=lm/DduiUEimCJpfKwKwUBkv8q3vbTQ2e7/CwZFU68tMnv9Nbvart/ulXm3eGSKXiOY6zEZTMcxNjqDDK5734PuniUGnMwSwqIqG7/SCSLVtkZy4gVqfTK9Why2wIUJjPf+ZJnsIXZrvb3RW6gr6TufI2a3zYX95MR2g3jh5Ol7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210043; c=relaxed/simple;
	bh=LX+6wX/WJYUmJXDBkcSpvYvv0Ujuik6p6KAyHsCLKLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZcjrlkMqrhNa1Om2ulF+lErwq2bky8xKDfgo4KCBNnrExKa+ArKkl8/9NOJXlfToHyR9frLffObo/oqQqtkT9M7Ols5mBjMeL9/dSQlfG8R8KA4wnvokqgTtdP9oPycU1CwqWWmLXil8yd8Y9Ku01iBHQiQftJ1cKPYnlEgBP/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIE+ukZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIE+ukZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA29A1F000FF;
	Mon,  5 Oct 2026 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210034;
	bh=z1Nu66GConJ+45co7houVF/7DC6jvFoGevA6AjAifeI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=mIE+ukZ2mp7dHfw91A5Si+UtogRwAoPefQbQhwI+wzlP/ljKhxcI1148g9IzogEv4
	 P9J23OFCPEMFDrE0mXDMwCwMhCLBY1NwPTgDKLbpiPW5Vw0byXiYltjfqkGdEXODlP
	 P3ImzipaVNumKdbyNSFdC7/U92m6H9CIqajvXkFbgeSfrdIVZWqPW9ziAKK7SdwuTy
	 rraLXya+xSPT1d1CPv7ohwqhtAaaiXr4gclBzuTRm+WCWK3BfYkLzbW6sJ5hBI5WKo
	 w1q/pDN0Pz8mz+abc4aT28NbtsHmnozA43IxA+tlDlL2+q7HkipL1QdDozY35b40+0
	 QoNKjlFKYM1hg==
Message-ID: <89e030b9-726d-4fe2-a814-491854ff3113@kernel.org>
Date: Mon, 5 Oct 2026 09:20:22 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: socfpga: enable SD UHS and eMMC DDR modes
 on Agilex5/Agilex3 SoCDK
Content-Language: en-US
To: tze.yee.ng@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1790151203.git.tze.yee.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1790151203.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/26 03:22, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> This series enables higher-speed SD/MMC modes on the Agilex5 and Agilex3
> SoC development kits.
> 
> Patch 1 adds the shared DDR50 read-path tuning defaults to the Agilex5
> sdmmc node (also inherited by Agilex3). Patches 2-3 enable SD DDR50 and
> 1.8V eMMC DDR on the Agilex5 SoCDK. Patches 4-6 bring up the micro-SD
> slot (regulators + SDR104/DDR50) on the Agilex5 SoCDK modular, Agilex5
> SoCDK 013B and Agilex3 SoCDK.
> 
> Depends on the SD6HC DDR read-path tuning series [1], which adds the
> sdhci-cadence driver and the dt-bindings for the cdns,ddr50-* properties
> used here; please apply it first.
> 
> [1] https://lore.kernel.org/all/cover.1790074790.git.tze.yee.ng@altera.com/
> 
> Tze Yee Ng (6):
>    arm64: dts: socfpga: agilex5: add DDR50 read-path tuning to sdmmc
>    arm64: dts: socfpga: agilex5: enable SD UHS DDR50 on SoCDK
>    arm64: dts: socfpga: agilex5: enable eMMC 1.8V DDR on SoCDK eMMC
>    arm64: dts: socfpga: agilex5: enable SD card on SoCDK modular
>    arm64: dts: socfpga: agilex5: enable SD card on SoCDK 013B
>    arm64: dts: socfpga: agilex3: enable SD card on SoCDK
> 

I can't take any of these until the SDMMC bindings are accepted.

Dinh
