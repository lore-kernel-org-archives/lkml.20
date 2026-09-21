Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A0848F01E;
	Mon, 21 Sep 2026 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991664; cv=none; b=TEPXxLhShzZc/1COGgwA2No58fFSVJWWrSnZGhM2fPwwyQn2rG8EJTx93GZ3CaIEPDOcbcMHVD/W3/oBaPgjZ1Q5KjrEtRDVYP/379TS/3caTLcZb9iKR5Vu/6w9LErCAiIfvBREassVlVEDPckS0cA1banQTzfLIiOrDEzEhTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991664; c=relaxed/simple;
	bh=piPJM6h5cSD5hne9T+lzJIWQh4enQKFjOkStx3vpFik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHtX8ZhT9iGaPxnzigu7nCnQxNPIT7mq7nM2LPlYGoM2k1iWMWUcmllbXAliJ9sNFn+jT7Fg/jYc4Edlwte/uZK1nm9076pQcAcWp9yRcwJgQKa51PZGgSJDbJWVWzp5Ic9/5KALZXZqrfE+Slg/uoSp9MatJ6/SlyPUJWyK3+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wn524jk8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wn524jk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9099A1F000FF;
	Mon, 21 Sep 2026 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789991662;
	bh=qud4Wph3iZCEz1fv5XvgI8tCzN7g1q0uKRPavUoX0U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wn524jk8ONRxvbVMkeUGnIMqkVKXUq0pKyEVh6wkZxpXeLK9RYn5E1EI/ISP+Z5nE
	 UmG3GBm0QBeosQvCRn6tX8fM01OOktT64e/RvkOiCy7pIbGZF98ZT3SxCyV3NYWGas
	 W1qYbbjwNueuajU8FGwnG+HHzgMg4NUsd0oXU60kTgtwYdCTSbMYMJ1D+jpAq6wyyD
	 UQMSC+UNFpjzyYHuoI3/ce2V9n2yRWtzIP4lGFy0l0XmHV+1vuLu93cJPgczLiVjvZ
	 RNLgk/SeZagQVAvEF4uk9UEb/qzg+2WMnZFB7dMlKx4vkJ2fRzheBnSBJh9p3BkqCt
	 un4s4gOr1qMdA==
Date: Mon, 21 Sep 2026 13:54:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for
 PCIe root ports
Message-ID: <rvs2a77sa5zypm4t4hxeerugm7a5o53e5htyy4mdy46letdm3j@65rgv4syurxv>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
 <f2324e26-88a3-4411-acd5-9645552c4a14@oss.qualcomm.com>
 <fbtundyvbywomj67ee3jyogqhgrvndrjqctvkb7ttp7iy7pkvq@xocvzaiq7zmg>
 <15daa9f3-162c-43fd-b22e-0194b82f602c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15daa9f3-162c-43fd-b22e-0194b82f602c@oss.qualcomm.com>

On Mon, Sep 21, 2026 at 01:44:50PM +0200, Konrad Dybcio wrote:
> On 9/21/26 1:34 PM, Manivannan Sadhasivam wrote:
> > On Mon, Sep 21, 2026 at 04:40:43PM +0530, Krishna Chaitanya Chundru wrote:
> >>
> >>
> >> On 9/21/2026 2:09 PM, Konrad Dybcio wrote:
> >>> On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
> >>>> The Qualcomm PCIe host controller driver added support for parsing the
> >>>> -power-on-us property[1] from each Root Port node and programming it as
> >>>> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
> >>>> this, T_POWER_ON was expected to be programmed correctly in hardware or
> >>>> by the bootloader, but not all targets support this, which can lead to an
> >>>> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
> >>>> behavior.
> >>> This is a good problem description. Does it have observable effects
> >>> that could also be mentioned here, beyond perhaps lspci reporting
> >>> an odd value?
> >> we haven't seen direct problem till now, but we might seen some issue due to
> >> incorrect LTR_L1.2_THRESHOLD value.
> > 
> > Can you specify what issue can be seen without this series? I'd assume the
> > link will fail to enter L1.2 and will result in slightly more power drain as
> > the link can only enter L1.1.
> 

[Correcting my own reply]

The power drain issue will only happen if the default value is higher than the
programmed one. If the default is lower, L1.2 would be entered too aggressively
and the link may fail to exit L1.2, resulting in LDn. This would be
catastrophic.

> Would that produce an explicit warning message somewhere?
> 

Nope. PCI core would happily use whatever threshold programmed in the registers.

> i.e. can I reasonably be able to tell I'm missing this change and
> I need it?
> 
> (if not, this is of course not a blocker, but the answer to that
> question is always worth sharing)
> 

We can warn in the pcie-qcom driver though as it parses this property. But we
should only do so for SoCs included in this series, selectively.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
