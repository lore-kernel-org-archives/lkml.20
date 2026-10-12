Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876834189C2;
	Mon, 12 Oct 2026 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808748; cv=none; b=ntfFNNHtwMcHDRD0pZqwVm1TzA+9gyykfcn5bxihnepij3I4qG33YGwhRWXA4OHROGRRBjwoyk6iqZ2qAS6YnYR4XVThV4DjONE0z6gp4EUWHRvNkKVr/adpzI8oEZQJZGMAiJAzsnoWa/a/jPqi5hlm+hHCnUTMD1ONHJ8prF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808748; c=relaxed/simple;
	bh=qH25dhlFnhESOMf/gGP38Lvywpk/NXvwpfT/nXStXbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgnKhdv8+e5fswSoOlciI3FVMgqGbGfd8n/Tcc0eNyKwPyp67XG1FWT+i6cJSlQPVhkdZRxJUKeP1HRtYnYQCDkXe+te3Y5fRoaiSdziiXJK4exne351G+ygIFM1WauZpMCW08I9+ShLrVWpkMvt4fWCXv/9OEudh/kKloEkQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjCjUVBC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjCjUVBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9981F0089B;
	Mon, 12 Oct 2026 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791808747;
	bh=oHdXYgNhpwHFocH4Q7mwDZMLdDet4JkEUoQhncK+l0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KjCjUVBCT/bxUV6yw1oDs4zzHxf5/vXn4YSME1Wst03hzSVbWR+DTQ6awZTS509Dq
	 ZWga82q18xJ1JdigiVCdA2BMugp2Wj/tK8FXTTO/5Hx/ivVmcOf/r4AbqwUQParJAK
	 hpzwub6clJ3zRw9oIXcqwXMxCD8GG7Ewv+97PfY2Ts5aPIVkOaajofG5cL/+v4TGpM
	 qqcwxmchIqtu+5PUBQ51Mf01eL2kmsbdMm7QLXXgz3JZr0GPXpmN+Nk9h0myVdz9Ki
	 zPIMQtUyp87S5NbFxDDw038C3oboImMhMmxj1/hiOAMxIG9YDbwRE2050kpnlV2i+3
	 u423amj89VzwQ==
Date: Mon, 12 Oct 2026 18:08:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Stanislaw Pal <kuncy7@gmail.com>
Subject: Re: [PATCH v4 03/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Remove unused of_device.h header file
Message-ID: <aszUn1GclB98SCLQ@debian>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
 <20260908-ipq5018-usb3-v4-3-b789702f0695@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-ipq5018-usb3-v4-3-b789702f0695@outlook.com>

On Tue, Sep 08, 2026 at 01:40:56PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Drop the unused of_device.h header file as the of_device_get_match_data
> declaration was moved to of.h in below commit:
> commit 82174a0a9c5c ("of: Move of_device_get_match_data() declaration")
> 
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
