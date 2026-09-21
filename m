Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A548167A;
	Mon, 21 Sep 2026 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990503; cv=none; b=Xay55sCtIZWNNcNJuD8GrXrLsJXMEdoH1+nb40R/P9v/IDjCc86BaBToo2Vu8e4/OOcS8cKqdOUMvl98jNlRqmFbVkWD/QBXC1+Ygy31CemEoWWliWSB0p5q9WK9s3thzf9OIssD5drB5jRFUKTUg3kvD5b86ZuZ3Ui3ea2WBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990503; c=relaxed/simple;
	bh=BZ2ixH+WYHEApYF47knngUNYwpB6A/hPIs1R6LT4qTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/PRsjmJYZSex3FfQTLvqwp8C08KTICacyTDVw1Lwrd4Ru0blbYjwoF8Jz14/1XkQAnU5jjvWXLSrvxlkXebKvMvseQh7YOSElcDK6c1NaqoCUVP+3isNU5GDuPTmwkH8cSKEgZtkaAMOzMAqtIu6Rh2HLTtmTO1itHuG0sOkos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3ZJ2Ykc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3ZJ2Ykc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0001F000FF;
	Mon, 21 Sep 2026 11:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789990501;
	bh=v7fcKybxvasIAkUY7DBLkLBvOQnBLyNw2KA+lOFWSlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h3ZJ2YkcwgPu7IyHAfWeTsjDgpL4S/CeT7dmBbQfEC5A2kLwxSXyRh73TLzktmLZ0
	 K3X7cxld5gf7Qt2rwC5nTEAr66dY6ty8ycS28xE7cLKOqHr/Ycwa/gF9yJVyihE6xk
	 dDdhLA49RVXtIMb929B6sqveu7Q2qVN59tQ2FjkpWTI9MnOGrmP/xe1SK9xiQnb5Bx
	 tGvMADlsn21YPJiYFy+4c0b43PtRKw/+xIoo2D/QXwkYk5IpuHVOKairAal/PB0zor
	 wzMqJIgQ3OWKgWSj0ElzKokXTnM5cFgCXoJ1BJzBoLDxWwkepyMsdpKQ9fDT4xBHyZ
	 AARE9lsQ9B1VQ==
Date: Mon, 21 Sep 2026 13:34:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for
 PCIe root ports
Message-ID: <fbtundyvbywomj67ee3jyogqhgrvndrjqctvkb7ttp7iy7pkvq@xocvzaiq7zmg>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
 <f2324e26-88a3-4411-acd5-9645552c4a14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2324e26-88a3-4411-acd5-9645552c4a14@oss.qualcomm.com>

On Mon, Sep 21, 2026 at 04:40:43PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 9/21/2026 2:09 PM, Konrad Dybcio wrote:
> > On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
> >> The Qualcomm PCIe host controller driver added support for parsing the
> >> -power-on-us property[1] from each Root Port node and programming it as
> >> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
> >> this, T_POWER_ON was expected to be programmed correctly in hardware or
> >> by the bootloader, but not all targets support this, which can lead to an
> >> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
> >> behavior.
> > This is a good problem description. Does it have observable effects
> > that could also be mentioned here, beyond perhaps lspci reporting
> > an odd value?
> we haven't seen direct problem till now, but we might seen some issue due to
> incorrect LTR_L1.2_THRESHOLD value.

Can you specify what issue can be seen without this series? I'd assume the
link will fail to enter L1.2 and will result in slightly more power drain as
the link can only enter L1.1.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
