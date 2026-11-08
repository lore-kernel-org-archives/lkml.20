Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165996;
	b=VJIe6IE8Jogmi85vZ46dOBFIHXMjDFzm7n38EkzksUkM8g+snJAyvVyBP0Q8hw+t4hIa
	 ksUcjkgeRMyDK95vz4da0etcr7Bh//OTpXNm829e5cozXIAfPhb0/oxEOuVxq2t+G3WI7
	 IHiGfr0/jgrho8vGLS67+VlYaFNzO1joM6hZ23Ew/B3d8Fvv8i9UDKhrX47UlNfwGxt8I
	 +5cIAqwUtRlYZBVNH3E+6H62ohoBkHxmxYYHlv4wIs1uRbClb9761zzTXX6A2thkyuWO0
	 jq2H0XE/bjyvBefJxcgcskLrEDhXpH+DETMtrzhi9PS5F6SuqOys3bCmxLPlhyN2+zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165996;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Cu6NYTdTGHtcGgJtGpge03oQx7Nvg9C+ExbKWCGng/E=;
	b=470mmCOyXNaa6te/vk+VuxF/l7guBrMETuFqJk+FR0TyCXi8tJtdGOrExWagiFA2ix22
	 i+hZZRhq8C7Iit4xpye1OJiLHlY6Q8K74r/4HE7XSjCE3YBfjBu2DWGQRNax+PhxLLk68
	 PeCVF0W6aHBlXWf4B5E4zqhGyz4RIVZEPMWlh9AVP0PUMxI+3YXdAya2kw9rPmmXyDn70
	 bakH/s/QqF1QvRuQvgBgezn/T8297FPd6xrnP+A7WZVh37MZAaxbRq29PCZYXISB9O6cY
	 BdI7n1KxYXYaM2oxjYt0lPfEue/+HXU1aZerE7frAViMMg57wNDai22uLUq9EJm3nCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agOdep3Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CD606A31C;
	Sun,  8 Nov 2026 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agOdep3Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A341F0089F;
	Sun,  8 Nov 2026 19:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794165996;
	bh=Cu6NYTdTGHtcGgJtGpge03oQx7Nvg9C+ExbKWCGng/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agOdep3Q4PHF7MxCvd59ypZPVJKkvSqohtqQqShZ9V/aefeaRmEemWiPHe2iwHI84
	 s0k7da+CK5AW2+DQ6lTWwG2SMsH7DoAQtntSF+ow0dCjF7Ww4thZtNVT/Rsv4kK52P
	 WTCt3E4c6cbEu+v9cb6gGRYTD4fD5D39MFoq8JEiEsXmAUi1KQYZdLFsEYaprI2RZC
	 d4ENul5w2KhryIoUlBfKz4H951GTcU2MgE2xKQuwgUSJhiLAKBXBFVnrkLMbqCCJFA
	 O70nvWTygatEEqcD7Sd5A5BKrIpeJmFY2V4QWwbhZt25zXDUxSIJqBMqOT0AT23J9z
	 2Qa6fz+5dKj5Q==
Date: Sun, 8 Nov 2026 13:26:30 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <avDMt-Kr89RGnmGq@zenbook>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
 <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>

On Thu, Oct 15, 2026 at 02:45:28PM +0530, Mohit Dsor wrote:
[..]
> +&i2c4 {
> +	status = "okay";
> +
> +	hdmi_bridge: hdmi-bridge@41 {
> +		compatible = "lontium,lt9611uxd";

This dependency still isn't met, dropping these patches. Resubmit once
there are no dependencies.

Thanks,
Bjorn
