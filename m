Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751F568522;
	Wed,  9 Sep 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960447; cv=none; b=Pk0YddNDx2ZOniJk2qp+8o+tLotV/oQnTITxRBAmVXPEDTprWLsVOAKe6U1qcW0BHQIVrG3wyyx4dRWRGcie2ninbtGf/yY+HhxRj60FhCZzarxyc0E5ljCJU3W1vgpJr0dFypxrRjt3Wrkc1x9T6bo5PO9+te1Eghzkh0HCIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960447; c=relaxed/simple;
	bh=TsAH9oA42ecBpzZcrWkTYHQQH3mwujdHg14Bt9V4CmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gYdg/SIJXGNtoAUsILCIiXUHjmF9U/svb52MgLLD7yqDKQlBo2EpCt4LUAqMsmd3QHYDm0aS/P4xsXHitOZot0Pk+bJkw3SdIPUoosaYwdHXwLTDHYQ6Or5qsbizTLache49BK6zHcFt96kV3rK1vJT4cFN7p9+tQd9qgQWfF0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odtP87gi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odtP87gi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3421F00A3D;
	Wed,  9 Sep 2026 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788960443;
	bh=zKwnEtlN8x7n7uFaWYNZwTSLSQtClfJiYFD/JlAvwxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=odtP87giekPGDf0CVgdJwMcyQxipTvAv280++RMG3yjSJLelx4XInidP9S5rOrDY9
	 r4ttMRy9SyyQfsclVH8+SnSKSBDT7pgzRXPfwFiSmW4r5ndp910HR5KpSxH/MhOHyz
	 uD0h3Mh167ayySTAUKLXObb2wXdVQMlcLCOVVMDbyF+nFDQF98dU1enIKn4TzUNL7t
	 B1+d0AhbqLRRNSfRpHqmPy01lG3oRBGlYCFCB77VkA00cPSe+W/H3iqy3zkC2bJbsK
	 /h8HytEdlUU6jbsfQqk3rZdjjV6qERrvTfQOQsEnXUMN9WRvtFaiV5o3T3sD4tCsCc
	 wSLEK8vzg4eFw==
Message-ID: <c78630cb-999e-4825-833f-3e184ed98573@kernel.org>
Date: Wed, 9 Sep 2026 08:27:22 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 0/3] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260909111513.2259643-1-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Petko,

On 9/9/26 06:15, Petko Manolov wrote:
> Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
> SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
> carrier and they are cross-monitoring each other.
> 
> This is the SoCFPGA devicetree part.
> 
> Changes in v3:
> 
>    - add Draeger AG in devicetree/bindings/vendor-prefixes.yaml
>    - separate binding changes from the actual devicetree patch
>    - remove "earlyprintk" from the boot arguments
> 
> Petko Manolov (3):
>    Add Draeger AG as a vendor
>    Add Draeger's M48 board to the SoCFPGA family.
>    Add socfpga devicetree for Draeger's M48 board.
> 
>   .../devicetree/bindings/arm/altera.yaml       |   1 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
>   .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 129 ++++++++++++++++++
>   4 files changed, 133 insertions(+)
>   create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> 

Please look up what a commit header and message should look like for 
these patches. For example:

patch 1/3 should look something like this:

dt-bindings: vendor-prefixes: add Draeger AG

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>

You should look what the formatting of the commit header and message 
look like for the subsystem you're submitting patches to.

All of your patches are missing the appropriate formatting.

Dinh
