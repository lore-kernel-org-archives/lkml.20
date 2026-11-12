Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474262;
	b=lEz/LZDhRerxt3rSURZudVm8XOvfFYHVh4m3blZdy5rpo4uZUZyY1982DAqmo8XFv+/4
	 rg7pPZVV0/sk0sO+AaG0e68OhHpTpjo05MNZZ+CyJfE7rldSHeKP7AO6RNIoUo/nz324/
	 Ou2hf+/bToVwS4+O60W50LuNexntEj4wOaCo9E3BA3cGMQktyVfZa9+eJTWQAo3psz1Hs
	 ZZx39bNQTdLkzlh5+Y9gUeC/z5KVHplnUAw8KsWZYMmjNux4k1wZvAN3nkKdFGZQLTW+x
	 uzJ9PMAvTYEqzHLoNK4XyqWxeAVAgMHDbNoDr8GyWcHPW64f6UGUDW9+9ROt8N9Nbow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474262;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=KvjfimEyLHv2EirF4hxY1Tnpe8ctO+qjqheXOxDIlHc=;
	b=I2hXV1xPoriDCdNB+sz8YINGmJ0g/mkCyhHbXx25v1curcjql1ti1eMCCx02TXPFUqla
	 Gn0YkLzXiOLmDfcfkrYfO+F+kGa+xd0xEC48koxO2otUcDhTVlU/U3eVr76hidnD2cCd7
	 KkHmYmVZUlcKbUVJJmHJNifwBfnXMVRsMWd8LfxOyQ5qRqXe1FZtYb9ZdSLZ5pU5Gh1Hr
	 GvV5NfSvudDINUXTJkUR+qvCQ/VJbCWL4ZVT8/sO7N+7tQkGGCvZOSAi65QTKXxWmUNls
	 dZUUsHA7EYLuEFIjHmNt3zKbWNSK3QoMsqvJiuEhh8i34Q5Olwjf7MnzT+R1BakawxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xh/00Dby";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3535B60A2609;
	Thu, 12 Nov 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xh/00Dby
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EEC1F00A06;
	Thu, 12 Nov 2026 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474261;
	bh=KvjfimEyLHv2EirF4hxY1Tnpe8ctO+qjqheXOxDIlHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xh/00DbyGSPtH3AcAgDIbB6mH8hRoXnAqFcuJ0aNnnBt0TqsFFvW4x3C6dSUJZulv
	 UWqpPILLKTcuaSHZixG4U/3tGxXz3t7ImHDBLzrX2p/PxL8xWFqro/18kaa47AjRjr
	 WH6qd05T/Qc2zKc4keC1gCv1yvgwpLTYFeTCMljPY+2p1LqmXGvcLXqenx1mxcnQxJ
	 wEF992NpJC2yjHQmTRhqTK8eSk+/MWu7Okl6XMXdjlzDpAIG/htb7rRSKoUv0Ziwbp
	 M/3o0GcCeWEqPiz5OhQAkug6vGzwM/VLpW2Bluf9boq2BselPi+615IomkmsQiVkbf
	 UP/Ia+MOml/hg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <pza@pengutronix.de>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/6] Add support for USB phys in IPQ9650
Message-Id: <179447425706.428303.118653133364281959.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:34:17 +0530
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


On Fri, 09 Oct 2026 10:19:54 +0530, Varadarajan Narayanan wrote:
> This series
>  - Adds dt-bindings and driver changes for the high speed and super speed
>    phys in IPQ9650.
>  - IPQ9650 specific init tables to QMP super speed phy driver.
>  - The Femto high speed phy driver is refactored to accomodate differences
>    in the init sequences between SoCs first and then support for IPQ9650 is
>    included.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      commit: 883412a4d4fb3267851de3d5d534980d65251ffd
[2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      commit: f899f404be9a178b3df15edaa2b33a20dd99ae18
[3/6] phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      commit: a8361bb39e2502aa9edaed126f01e02cd57c45ef
[4/6] phy: qcom: snps-femto-v2: Fix order of arguments to qcom_snps_hsphy_write_mask
      commit: 029a4a78d07a4b133777cff2acc404ad858f3aef
[5/6] phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      commit: 8238577c08eadbf38313d0240551c12582884014
[6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
      commit: bd2ef9cf141344e31caa50dd3ef46772df7d9b66

Best regards,
-- 
~Vinod


