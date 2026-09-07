Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79CC48033F;
	Mon,  7 Sep 2026 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779089; cv=none; b=YSAWh8zMeVcb8To0j9oxcIN2FXI++Lplj9GGyLD4ZD5RFlc78nU8y7bT/12hF78kG2AOyuJZMZ7cofA96hLR7tQxychE8xN2lGC1i0qogLILuT2F2vFq6+GkZL6MvADOUsDyd++kx30Lg7UZmJSWFJFuodCGBC+dBxdy5W7UWSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779089; c=relaxed/simple;
	bh=enqaTgTDjJHo/KmjxgqCtc1D8Z7dhCe1bQBJE/5wU6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSUMEmzziDBGgtTMm08YasvkyxwuFt7W5zxtW379y+rm0B17LGurwAXxwWkl9hlYAQn47wf6GD0B3u7d5g0wKjOTH5IeJCvGOfLN+vi3jGWuW1AMScsTNKN9zTgEdGJjBpSWXGrKzinPAMvxR2wnUJo7yBN4foqR225NHiTe6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6xbBSRQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6xbBSRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0401F00ACF;
	Mon,  7 Sep 2026 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788779088;
	bh=UhDd3EHod0lYY5MEXGTvrMluTalNr+mv5duatZgY/ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K6xbBSRQ3nCBs1A6qV78I1kbUlt139kLQPmE01Gc0apHamGHx/lMbh4OYEOFYUs+L
	 RRRqpGb9b4YopuGIXGLYkIz7Yk4RQexl1lqFxSPbwtJNbnWgKrdmlWudy8RSuIaBYa
	 uVPHko+tEbpElwnAwz23bNbmjVBHPOLPljIsXAI27FcJmhgkFNdmxjoRdALk4B2pWs
	 kR+r97c7ZDXJuXTTY03jqmYPQ55sMamMBaKmEt9HAsjWL9LbXHzs0jQDzqUEVKvaAX
	 +rWyccjjooOr0RDVk+FQ1orp2ncEdU8muUejDfy6I5YslUdTbbefr/8WevrKSvAaS9
	 oVpd6FEuQQghQ==
Date: Mon, 7 Sep 2026 13:04:38 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/12] dt-bindings: usb: qcom,snps-dwc3: Add clocks
 for USB3 on Qualcomm IPQ5018
Message-ID: <xhlq5d56pz5c6aq7bngxva4mrkf55zv7wt6d7xe2ql5gurqev7@7mbf6oc7eocu>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-9-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825-ipq5018-usb3-v3-9-39be0955a6aa@outlook.com>

On Tue, Aug 25, 2026 at 04:37:26PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add aux and lfps clocks in Qualcomm IPQ5018. These clocks are required
> only for USB Super-Speed support.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
