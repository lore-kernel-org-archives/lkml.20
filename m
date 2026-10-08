Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3024D4915BF;
	Thu,  8 Oct 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461890; cv=none; b=E6TSrzJTBnKvmFSAVeicx8PMCKgEiRjqcl+iLljvLW9LzSzO2SCsR/yReR2TxXdv9LL4pCjPnv2ltTiXKkjfAZBqtpxefvfCuU9jz4MbfmCqsmrFw3YBFv5qtYYrQHPAuQiqME1aODmuYGz2uRGcimGkf/hCdvMVh6VuzNCVNgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461890; c=relaxed/simple;
	bh=UHktiDAmOzY9tM7r+T0EiJeBS5SaWf6HfELHYKKyE3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6X3m6IZuRy4K6jg/a+uZShRDD1p0Aj5oBxtjHqxAlkqVLxedTeixApbw0B8ZtfUg476v55+5FnB7yBMQpZlwrP3RcU39rWdNQp6YC9EMqXTZx0+VW7tE89me+kBItRbh72wYYD3QA9YAIyi0EDRBUry2DsIfvVBMFWYJ2PsCr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhEG8Rf7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhEG8Rf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0877B1F000FF;
	Thu,  8 Oct 2026 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791461887;
	bh=mWYDGCkliQZ+PdJvEtbDJwsOKJu+jdZ5vA+076xEorA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GhEG8Rf7tsfP8wSTbPxmc3rSPJobjTftCBxspYkKu60HfOijFU/pAf6gf/C/xD1+5
	 W867JOdl8deRI5HGlzrRz7xvjAKcp+59PKnmGCniUo0uMoo3bwfZtaaHf9Ht7QFmor
	 glkKxZXVKLw6fWISIyfYmU63g9dziyqLNLcF/9SgcJDgctxQVHEm8dUS/Jj7zasuvh
	 yePRQtJI8rna5iiwOejC3g/FQHbcL4prr12TfxWmaogm0h53p0+BeIeBTmQKoiKt7X
	 Iv7UiPLB50WWgkVIkPhghpui5hCPSaCn70Qu1SPOSBZeO8zYKDAcQKS6MzvgPBOBe5
	 brcr/qtZL8SZA==
Message-ID: <b036d03f-7f40-4734-946e-19e054eaf6cb@kernel.org>
Date: Thu, 8 Oct 2026 07:18:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: socfpga: agilex: add SoCDK multi-QSPI
 board
Content-Language: en-US
To: genevieve.chan@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008081014.35006-1-genevieve.chan@altera.com>
 <20261008081014.35006-3-genevieve.chan@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261008081014.35006-3-genevieve.chan@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/8/26 03:10, genevieve.chan@altera.com wrote:
> From: Genevieve Chan <genevieve.chan@altera.com>
> 
> Add a device tree for the Agilex SoCDK fitted with the multi-QSPI
> daughter board. The daughter board replaces the single QSPI flash of
> the default SoCDK with four Micron MT25QU02G flashes on chip selects
> 0-3, which allows the system to use up to 1 GiB of QSPI storage.
> 
> The board is otherwise identical to the SoCDK and builds on
> socfpga_agilex.dtsi.
> 
> Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
> ---
> Changes in v3:
> - Reword subject to avoid repeating "Agilex".
> - Move the DTS to arch/arm64/boot/dts/altera/, following the move of
>    the SoCFPGA device trees in for-next.
Please go back and review my comments on v2[1].

Dinh

[1] 
https://lore.kernel.org/all/8cd59aae-4f68-4cf8-a12c-5c63b11d29c0@kernel.org/
