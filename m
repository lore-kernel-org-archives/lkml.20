Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7F377A83;
	Fri, 16 Oct 2026 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160030; cv=none; b=HAZZERRvOqMih7qoFPXIPvS4CEqwHeIxTjJtOLBcJThEs6bIMEEtqkOs2PUMWARKDORXCtEBFpm3f6fMx4tFB8Ilyvkt0aOJwC/ZTfXg74WpZXfFbxKMJh6vA32WUHDKntSAYXgzc1tiFuF4rlIRr5H4pkQDif8CYqsd8sE7+hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160030; c=relaxed/simple;
	bh=l8X1i33tvqiBetW5bs1WIOi3IQmykitKHKMOY1uoNps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2RTnE/LXIhAbl4CkOMxwfx3m+86t3uPFIOw2v2/jedG4UBHwvYZvzuiwAqtGdVeuoSIFRgGO8am5kvdIKAeoKsMhS6wvPTonY6LKS5fONm0o6yqCt2mx+lnxpUZyu9t81V8Xe7FZZMVMWuplWvjNk+2oNp8ehBO7E+dIU20vbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5hvRlRv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5hvRlRv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267531F000C4;
	Fri, 16 Oct 2026 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792160025;
	bh=mLRFvbldO1QukOz8As/snUhafjSfEh0RnlZ9vmXxXmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=G5hvRlRvyRMqwbUy3rkZldkhSGmpOjCTLgBIyin0RvCrWqIwHv1UHjZBjRGieFL3Y
	 h4RKfYDP/CB3cl7M0fHtOQ9Eawf/xP4b8wDpGBBvhVYRLL9q2piJCxUA0Uh6U8jUNR
	 QD8wjVWtxanoHHIBQVg8kRBPRD5eSRTjA6du8lyrFpYJgg60FrblgczO+lXxwLlo3O
	 B4l+VZN/aPCbPATPPzIjY5tI9ub+cahEuziX9yXNWRg9lDoeS1NlO2CNMWsEnyw3mP
	 tR61m4ucpZauuFQfH68fnjGAoP2aNm40FwsHvSkZ+XDpZSv820yqbTvEE1GV8UZYDU
	 ZNR3ko86Q0mgA==
Message-ID: <0b4b0668-b725-4430-b440-b6d3c3c12d0c@kernel.org>
Date: Fri, 16 Oct 2026 09:13:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/3] arm: dts: altera: add Draeger M48 CPU board
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, arnemaximilian.richter@draeger.com,
 martynas.grybauskas@draeger.com
References: <20261016123415.3272046-1-petko.manolov@konsulko.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261016123415.3272046-1-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/16/26 07:34, Petko Manolov wrote:
> Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
> SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
> same carrier and they are cross-monitoring each other.  The SoCFPGA boots
> independently off qspi flash.
> 
> This is the SoCFPGA devicetree part.
> 
> in v12:
> 
>    - add proper compatible string to the mdio node;
> 
> in v11:
> 
>    - replace the ethphy compatible string;
> 
> and in v10:
> 
>    - add device_type back to the memory node;
>    - move the compatible string under the phy node;
> 
> news for v9:
> 
>    - remove the name property from the memory node;
>    - fix a typo in a comment;
>    - attached phy-specific skew properties to dedicated mdio phy sub-node;
>    - add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> now in v8:
> 
>    - modified draeger,m48 to draeger,socfpga-48 because it is more consistent;
>      with its other imx counterparts imx6q-m48 and imx6dl-m48;
>    - dropped gpio3 and gpio4 bindings;
> 
> new in v7:
> 
>    - replaced module with board as this seems to be confusing to some;
>    - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;
> 
> Petko Manolov (3):
>    dt-bindings: vendor-prefixes: add Draeger AG
>    dt-bindings: arm: altera: add Draeger M48 dual-cpu board
>    arm: dts: altera: add Draeger M48 CPU Module
> 
>   .../devicetree/bindings/arm/altera.yaml       |   1 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
>   .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 102 ++++++++++++++++++
>   4 files changed, 106 insertions(+)
>   create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> 


Applied!

Thanks,
Dinh
