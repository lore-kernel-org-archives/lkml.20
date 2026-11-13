Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577560;
	b=F1jQZ9IIQFpJIB/lNtolaXVzB9aMK7UVoWr1Df/wn6RBERnFP8ypMHv5tnyZR+cJS2pR
	 1Sp26L2HPpndC3+BmMiUlRLTBG4EsxUWcOpz61Ni5dGcSYjigkxBSHfiej+kEoXFjbO82
	 4hkDfNKMVxSV6vbixj0lyDa3FbHppoWyarZiaTMYRrd6b/ZlKVwkhPWdHuKilH17ZbJDc
	 15lpbbhbpfy6qC820wEq4kq1RkVrtAhiVH+eQ4AyJ51huBqBOVjHSTzMWG0GiGJNf6592
	 MiKoTLYO933okfl4vB7pBMIfN+LZk82gaiW+8b/eEQWG371Q2RZT4QbYbIky+Qj27Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577560;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=8pf0Ttgbp60MhDc0Dc4NvrD/zrCECRvJDQmpqioCFR4=;
	b=eZYpaw69wmpjVsC6+n062cRrxl/ofQLP/JfCRFQTBxRSg8oLEOrnOAof3rBUSgvBgPA2
	 0OjWT0JiX5/eiak2EYpTKf9u8XQTYyPT/GKjejAtDTnWz2e650eeg60QJ5XMOVc+boxwZ
	 JVmOWBuAW3m0225RoPagYR2w01T0Yjtm/Y8nJ0RYe1e0uoNenq/Ygv2ADP6X0bTGbA51b
	 /8dzkBky/lACSBhT+8otisg5DeGSyqZpXT/EF4sTqv0/VHpHetm4o/tDKW0axTBRj6jA8
	 AOiWAywOQOcfwXiBS0zEdjZyLi/pi5Q+YPxgWdcoQth8bt/PnbhKDFWSCj/ShP2g9aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L37eIFWr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E43F606A333;
	Fri, 13 Nov 2026 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L37eIFWr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDEF1F000C4;
	Fri, 13 Nov 2026 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577560;
	bh=8pf0Ttgbp60MhDc0Dc4NvrD/zrCECRvJDQmpqioCFR4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L37eIFWrEuAwCGHXNqGu1DwtIyFJ76qaVbulVzzkZlAYXjC+nzf5ddb5+8JBIRgqf
	 IyeM6/23Lj37dFeh/oFjVO/h3ixHojSBJADX3/1N9NMHww36MdYWx1Fi7Xom3FPHn1
	 A3XYUifder5tk3rQHHqwqETqu+QBmOdFeLJUgKLGOI8OSCWjOI9NXnm0P3lO5RAgwa
	 Z1yFp06vz2r7SO766bUq+r9hSg2khnMWvNZ1b6fvTOjG0ztFfRRJY7bS+Pa963uLoG
	 AVpd+ReizibHUlnfMR3e0Yk+s2CdmcwbL2d3RUmjruXZOdpm45nXSrY2d8JC4cC2V5
	 tQ5NettKUcyBQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112192345.3962577-1-robh@kernel.org>
References: <20261112192345.3962577-1-robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: phy: qcom: Relax required supplies
Message-Id: <179457755589.652128.7788585780819198887.b4-ty@kernel.org>
Date: Fri, 13 Nov 2026 19:15:55 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 12 Nov 2026 13:23:44 -0600, Rob Herring (Arm) wrote:
> For the QUSB2 PHY binding, keep the three regulator supplies required
> except for legacy IPQ6018 nodes that do not describe the board rails.
> 
> This relaxes the requirements for the IPQ5210 as well as if it is
> compatible with IPQ6018, then it shouldn't have more required
> properties either.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom: Relax required supplies
      commit: e77b61b463909da3e21a337295954f48f4ca80ec

Best regards,
-- 
~Vinod


