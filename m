Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169332;
	b=LzC8GjJjB9dytpkr9CKe1U/pHy2ZGepRzK2QZIcV6GgoUcmXq5L4F3SOS42j3IagO7M6
	 tMxOmJfGPQFujefF/+NKqTw2t0pLQ2ZVS2hBIW7YGTwmQs24WYhSDcQqr+IFT5q5PL9+t
	 XbINkkQDLB+2X7vVG9oPGbJ0fTLzoFFthjUfmbwIlW8RXzhgNBYNUObEh1R5+/qucWgWk
	 9pNcmxrerRMCrMjexwdqWetO/NHW9jzZguxU78hdaLHNbPj7berElrqXWk0g9YInGY3uG
	 OSQOBOyczZfbpiD5+G3WB+O2xiigKYXzreXIXLf7xM3Fz9iv2QTo5zTgKbRSEg1EMLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169332;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=L3w4au/37QkmmcftRY36B6aQT1BjPfswYVXDde6xbtg=;
	b=ay+RfyTqM/l3UphBbsfO7dPoVtXgJXQtcDOYkJ37JD4IyYdGA4gvF+YJPQTudi76CTnf
	 3OQJzdmrr3TB/8/+P6m9ARDyWoG2ZrNGtAiQFeKqyLabmH7OvgWt8kNYstmwdfXQ+mrPX
	 Iw/AK5MrZq5Ons16gCE4lDBSaLwlacJVJ1GkCa0HR17KNrQOjftcFVwNda1aAKM1fJCzq
	 mcuO/UDXg2aiISty7ObF9niwOtD874klCNYjLANGvZ3BcffEIUY4DoIU1+hPWoD9DxcIr
	 Ycp2IcI94g05I6wM/HZwdMWBk+do9hMXfQPDZAAhxgBZwyl/V0YRhEu9hU4VPeaAWww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvkXwAnO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26DF606D805;
	Sun,  8 Nov 2026 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvkXwAnO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1624E1F008BF;
	Sun,  8 Nov 2026 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169331;
	bh=L3w4au/37QkmmcftRY36B6aQT1BjPfswYVXDde6xbtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NvkXwAnOb+L6SQNuMNZgqDojpLQ7igtOzHn7SMoSi7wyt49KEVie5GWM3ekYQ+fk/
	 0so07lkTV/+0MsFV9vc+C1DJ1hnqvRNSWDuzW+n/q7gbcjwsy2ncNBKrTa9smcOYR1
	 /rNqB4tLP+/c0kBUmSxq92GEfn2ysk1/goMSb2L58HCi+T/99uHBSPiWufO9/08zTH
	 In2Hy6Kd5ZUV6iFORBGki+2PgpizMXIWjVq+s3NI2hmY1X7rb0hgyyj8x2SwBYGIba
	 WJgCVjWFLqRQmmdR2v2hgGnlnqbzEpBag1T6grrhfVU27+miCqARCWLo3ismTd+NHf
	 tXf7pB5M8Ir7w==
From: Bjorn Andersson <andersson@kernel.org>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Sun,  8 Nov 2026 14:19:26 -0600
Message-ID: <179416929524.628393.316030413397057050.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030074404.33517-1-blfizzyy@gmail.com>
References: <20261030074404.33517-1-blfizzyy@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 30 Oct 2026 13:14:02 +0530, Ajit Singh wrote:
> Add initial devicetree support for the Vicharak Axon Pro SBC, based on
> the Qualcomm QCS9075 platform.
> 
> The board description includes the debug UART, UFS, USB 2.0 host with
> an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.
> 
> Changes in v2:
> - Use the "lemans" subject prefix and name the SoC as QCS9075.
> - Drop the PMIC gpio-line-names, which did not match this board.
> - Drop Ethernet and audio to keep this to initial support. They will be
>   sent separately.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20261029133654.6585-1-blfizzyy@gmail.com/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Vicharak Axon Pro
      commit: a917cf9dc0e9d9f8aa40f4aef5ce5fc008acbf11

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
