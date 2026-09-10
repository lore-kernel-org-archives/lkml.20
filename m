Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F44A8419;
	Thu, 10 Sep 2026 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055642; cv=none; b=B4e9tyWt9B1HFiDkUS5mjptJzavZXvG4ohIaDT/lFuJ32rE5OLiSd8stPWAjvxrgXbGwNtDqaOri4tl1VUpPMo1qhyMaXWcjfKjw8kf7x5mK5F62pHZF/HxebLwBRuX4ObmbFlpTpaH8ILD87SXmhGnNxSCdMeZ7GaD+Eb3WPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055642; c=relaxed/simple;
	bh=y15tVjuIpOkxFOtnQgQwuuNo79AxvLPn57cz3WK6kVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blWsq7alQrYtR9iuByIqJXGPXkiXMq4q1bCVTzl284eps18g/72Qco1BORO6NWPKkVrK1hQSit79UqcdjfRu1LYt+GxUl2YqeDAGGeOkV6w7Q5fZzNaoYl0a+UYziKHNb9onEhivZO7gHac9t7+DfbkdYtr6anRd9HdUzEz+VVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pv1tSWs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pv1tSWs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8111F000FF;
	Thu, 10 Sep 2026 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789055640;
	bh=Rhw/XB4oZMCuaT9L25oXSIHQQoDpEoegzurtGHYUhlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pv1tSWs7ainajgYjsidtvlIdbZM9m8x7e6csAWxID/NPmmB5o3ArXkWrZvipXRaeC
	 hq0kBETRmNeoP+zyEdGWNjFIAK8A5EyuJZQT7sKkNa3tvOZ6+Rx2s37xxKr3hdmlBs
	 j4YI8+qgXsY7OXesAo55+bE4n43jnmwL1PrbpU5kyAKMf+c7mkJzChPpo5xmMhUcQX
	 XbUUUasK8nQH2dyAE4wfLNfQa5w6ddQm+7vvsWy/9ocUCLFbV/IDZp8y02dirkpxl/
	 1T8zPHdu+MEkXxTPC4m/ayQFm3Cz79GmQmAtngKrMaHbowbDrPoIXxKq4xxM8iDKlh
	 mmGYWiOz/PQZA==
Date: Thu, 10 Sep 2026 17:53:51 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Message-ID: <kwtken2y246g2se2bmn3uvxed2ynzxyseck6y2dlnjjn6icug5@p67crwakk4la>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <20260905-eusb2-interrupt-v7-v7-1-820cf5377a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-1-820cf5377a70@oss.qualcomm.com>

On Sat, Sep 05, 2026 at 08:59:05PM +0530, Krishna Kurapati wrote:
> eUSB2 (Embedded USB2) is a MIPI Alliance standard for chip-to-chip USB2
> signaling. Unlike standard USB2, which uses 3.3V signaling, eUSB2 uses
> low-voltage differential signaling (~0.4V) and requires a repeater to
> interface with external USB2 ports. Because of these differences, eUSB2
> PHY initialization sequences, voltage tuning, and register configuration
> are distinct from USB2.
> 
> Additionally, eUSB2 targets handle wakeup interrupts differently
> depending on device speed when operating in host mode. According to the
> eUSB2 specification, remote wakeup signaling in host mode is detected
> via different data-line assertions based on the connected device speed:
> 
> - Low-speed devices: the host repeater drives eD+ to logic '1' upon
>   detecting a K-state on the USB lines during remote wakeup (eUSB2
>   spec, Section 5.5.14).
> - Full-speed/high-speed devices: the host repeater drives eD- to
>   logic '1' upon detecting a K-state during remote wakeup (eUSB2 spec,
>    Sections 5.5.15 and 5.5.18).
> 
> Since the eUSB2 PHY's DP and DM lines need to be configured differently
> from USB2 PHYs, controllers should be able to query the PHY type and
> configure wakeup interrupts accordingly.
> 
> Add PHY_TYPE_EUSB2 to distinguish eUSB2 PHYs from standard USB2 PHYs.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
