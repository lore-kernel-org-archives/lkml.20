Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC854A5EBA;
	Mon,  5 Oct 2026 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214369; cv=none; b=M6lnLcL5KGGoV8a7dzoFs6SOCotFSm3zXx7Xt89UoRxK280ETvfiaqHVS8Ka63ZPndVSB1tJFA0uo67QRDSIavXkb8SYX9BhhHrLTsRIJwiYC4Mumr7L5dTsxdO65viKE0ewD99+lbND/9d4okHCQnWQIpdljI675wII0kuNuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214369; c=relaxed/simple;
	bh=UsnN6PH7fTub/zsxY5VlX9B8a0kmr86Cvx8kE1sC/b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dODgtGt56xV74t4LmptJaxtLmNjgLNYXHFdcyfW2/JmPMVLHi0SNLC8v9SlkXM0Whb/hS4w+pN175chgm6yb5aAr8Spyv/IUO/n3NA/4Pdxw7Z9zsMTb1GHK2f9feXgc8jxPrsG160tkuXYaXx5neis5RGcYFwNKWVtdS9J1yuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHC2U6kV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHC2U6kV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510441F000FF;
	Mon,  5 Oct 2026 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214367;
	bh=LbIjpXl+324bLgMATiQrFMKy5rUeG4uifuAYYnf6dJM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=LHC2U6kV00SJbkKGH1ryQ+/yiEw3j6KQT8bMZo3cSHwpNjpDR1yIUo+FyqJk64QU7
	 DFsk1E1O+ZNbOJ/jE+cje9N+672KuKIQQQafb4P4eExo6HoChdwJ3+v5aq1lLYqIpI
	 9VtEMtlLl/zyOo+vmFyn9gH3oGeBeKS8oc3JODeRRgyaOY4UkqgnMD92EfZo8JbG2n
	 RhVOCsttzSTFBL+Z5Dezc2+9XeanOK1GuIL5tMSp6mIiEwOcQPAFrj7YbTgft4aK3a
	 PTconCjISkApgxlpWvuxZxr6BuoLGUmOatT8hfT4zy8GEWcswb/V32Be04BEu8/ZhQ
	 vFvBKo/4oKY6w==
Message-ID: <accebbb0-d7bc-4446-829e-2f2d65357f17@kernel.org>
Date: Mon, 5 Oct 2026 10:32:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm64: dts: altera: Consolidate SoCFPGA device
 trees
Content-Language: en-US
To: evon.chiam@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1789123511.git.evon.chiam@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1789123511.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/26 08:58, evon.chiam@altera.com wrote:
> From: "Chiam, Evon" <evon.chiam@altera.com>
> 
> The arch/arm64/boot/dts/intel/ directory holds two unrelated families:
> the Altera SoCFPGA platforms (Stratix 10, Agilex, Agilex5, Agilex72,
> Agilex7M, N5X) and Intel Keembay. Stratix 10 already lives in
> arch/arm64/boot/dts/altera/, so the SoCFPGA device trees are split
> across two directories today.
> 
> Patch 1 moves the remaining SoCFPGA DTS/DTSI files to dts/altera/ so
> that all of them live in one place; only Keembay is left in dts/intel/.
> Patch 2 then drops the now stale arch/arm64/boot/dts/intel/ path from
> the ARM/SOCFPGA ARCHITECTURE MAINTAINERS entry.
> 
> ---
> Changes in v4:
> - Split the MAINTAINERS change out of the move patch into its own patch
> 
> Changes in v3:
> - Drop stale SoCFPGA MAINTAINERS F: entry for arch/arm64/boot/dts/intel/
> 
> Changes in v2:
> - Reworded commit subject to drop redundant "device trees" and phrase
>    the move as "to dts/altera"
> 
> v3 patch link:
> https://lore.kernel.org/all/47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com/
> 
> v2 patch link:
> https://lore.kernel.org/all/4b78273b85041f74b12245d0bf222f018afd2bd6.1788933630.git.evon.chiam@altera.com/
> 
> v1 patch link:
> https://lore.kernel.org/all/802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com/
> 
> ---
> 
> Chiam, Evon (2):
>    arm64: dts: altera: Move all SoCFPGA files to dts/altera
>    MAINTAINERS: Drop arm64 dts/intel path from ARM/SOCFPGA ARCHITECTURE
> 
>
Applied!

Thanks,
Dinh
