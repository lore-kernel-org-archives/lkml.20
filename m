Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88A446820;
	Tue,  1 Sep 2026 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250430; cv=none; b=pQpRhxRGw5Q8+ijghnR5gH41oq+DnexR1sfkdOObHcn5U0w4wAKTuCCuwsFqUqN47Gj7SA9UM9YvBRA3tL47gjnnirn3ZZvuNttWsvgFNyULFEAHF7QewpG1gW+eSh8S9gsJ0lyIfqAshuhvWFesEEeRAy/m1n9i17MiYR25Nbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250430; c=relaxed/simple;
	bh=GOFnsqzRBBB5Rqob/+Y1qbLgK9qD/PnAc79I4sP4WCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGl4to/pKcNujtGXP+Bvp9YT/Gaw4ulmq3l1O3UVQvP4TyywMNr1Xm3oiLAXEp+EHdSmT0Z8c7+e5b6vJG2HLxY4ugddY1iETC5wed3QnJnAdnIptxzeDu7PmSwBUWr9I1/P8cd2H9T/a3Lg71rHO0or9VtBGRITNUSkp0e4pr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7odOAg0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7odOAg0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457291F000E9;
	Tue,  1 Sep 2026 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250429;
	bh=ZloGNGO1uFB4xJ8rF7GYh+xY4ZtaQPn0QgKlTqPMp28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G7odOAg0t+AOz7NoyiMX630iWCCeiC2mKi8ECPYqhT7TpjdNUVYEwX8IKO/CJw9Wu
	 pUHjyUgjRyZRiAhPADfmi+e6N0Adw246V39rHw2WmS7xoVRUrmqSIwlBxoBAN2e+8P
	 2Wmgse3C69fIGXv/iPaaGEHwlw6TUGR+TlwLfJupcPGzkPRiC7Du6KnRVixYFj1dCB
	 OlanXOdetIu5MIGZWFElSB6esAdTcR0A1UcsoI3tqV4n6FRHZCgsvm5DJV42ffpm2q
	 6yDqt/YQCHToiLJnCFZmeCVYBLpBbJLxvZcltxHYooi4YENE8Z0YIwh4bSXqdyCUsT
	 xnO8YnaP51Q4w==
Date: Tue, 1 Sep 2026 10:13:35 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, krishna.chundru@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com, 
	rosh@debian.org, jsandom@axon.com, daniel@riscstar.com, 
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI
 function nodes
Message-ID: <5dzuhhqzwf3wkmunuww45ituznql2iu5qh2zrrut5xtuum3xbs@q6fymm4ehjzd>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-7-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901013654.1343537-7-elder@riscstar.com>

On Mon, Aug 31, 2026 at 08:36:53PM -0500, Alex Elder wrote:
> The Qualcomm RB5gen2 devicetree source file defines a node representing
> a TC956x chip which contains a PCIe switch and an embedded endpoint that
> implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Fixes: 33cae252054a6 ("arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
