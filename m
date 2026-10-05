Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D83202C29;
	Mon,  5 Oct 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208712; cv=none; b=Vb6eY7dV3ZHE4Me+9P/694Vi2w6G2UFgHIbpgDfjq5gfT8WEfGp664jSGEUt3iQQKybro4/Oxshf2MaiKP4LX/vhjrpKg819SLelI7BdSqy78sbMWbc2AKvaqguVP/rKl5XwoBkCAiH1adfeQOz9wF87W34EU9OrA/BHZQdj6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208712; c=relaxed/simple;
	bh=Mmx5yBTxMfzqckU6blWvNUte/S0b/AiBMRSEz/dcfsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ue6Ief7IfK/bntx8sPmNtH0BZPk+hb1nLQTcVk82Q/AwyhFTsn39Ah0P+aY0cmOUNFhDYrLbtvUCJCRFp+FJ4y3aVi78T3VqaDmtEKVE1B6P964evCSIs7cZdpSFjCzau0s2wWCtWuXsvLSh/ZM2y7gxynGKmA6txN9sD7HXbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWXT4zNq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWXT4zNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470B41F000FF;
	Mon,  5 Oct 2026 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791208710;
	bh=7qDDzokCihd3MTnzDmQWLnU+JR5Hxfrh2K/vuo2BLX8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=gWXT4zNqA32JXNEPxSsog2PmWo60CWjMdxbxiSSSTUOFAe+5m+PKA+X9+LpLBXFUJ
	 kV66qDMowDhINTXqEB7LLLWybPXmNpOhNSoGaJbObd/Z4R3F6FWw0q/txlpOx8eH+f
	 WYZcNv31iRKQB7ZzqxkKetNRslo4rOTVKh/9FqeM4jn3TR9iLIKI8T7ua4Dmwda01W
	 58NdWgPMfnWIYONkFE6Jz4CoY/qxbbKei1Ub1HWkSB5RUZmVJZM7yRZ04cnappc84U
	 YRQrAtViWiSua/ZZqsKsH+/QyI0cX8XCyP2G70AQPCNVL3uoo2c2c5MJXmvByfft0L
	 0gITsVUnW99Hg==
Message-ID: <afb5e34a-0616-42f6-9d18-23ff3ebcbde4@kernel.org>
Date: Mon, 5 Oct 2026 08:58:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: socfpga: agilex5: add DDR50 read-path
 tuning to sdmmc
To: tze.yee.ng@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1790151203.git.tze.yee.ng@altera.com>
 <096868737ae11bd457ec791099dcfbec775d23ad.1790151203.git.tze.yee.ng@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <096868737ae11bd457ec791099dcfbec775d23ad.1790151203.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/26 03:22, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add the Cadence SD6HC DDR50 read-path tuning properties to the shared
> Agilex5 sdmmc node so that boards enabling SD UHS DDR50 pick up sane
> defaults for the loopback DQS selection and the read DQS delay:
> 
>    - cdns,ddr50-use-lpbk-dqs = <0>
>    - cdns,ddr50-read-dqs-delay = <96>
> 
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 5f22e6d7ab85..dc25b7382a29 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -322,6 +322,8 @@ sdmmc: mmc@10808000 {
>   			resets = <&rst SDMMC_RESET>, <&rst COMBOPHY_RESET>,
>   				 <&rst SDMMC_OCP_RESET>;
>   			reset-names = "sdhc-reset", "combophy", "sdmmc-ocp";
> +			cdns,ddr50-use-lpbk-dqs = <0>;
> +			cdns,ddr50-read-dqs-delay = <96>;
>   
These bindings haven't been accepted yet right?

Dinh
