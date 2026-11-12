Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481054;
	b=uy4IvI5jszMkYVwK4/D++GnAd2MwF2kiLrYc8ZThzwYcP7p3jWxaP3Aji1mOfGgCrfPl
	 jkiz6pw7U5arut0WRAvFMCTB4k72AiL+Y6i4YD0FNE+Rj3CblimUAFJxghx5DnBN3NRLM
	 Da2EYTAldS3km9oT8Y3ephVYfHayb7zPcRqDwnA+HbNKo1prtdXtKOR+GAPTasxDrDAGQ
	 25b+wQAC8SuWGJLzyRnQ58S/SV0UyhWM5YTmC5tlxnqYDNCsqL7HW45IxJraNhM/nQYeL
	 b4BnMopda8bLuLDaVhETzq2daLGOCCXQPS7DYq8WVsadcoRQ4dd3Ul+0vaehQPFp1Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481054;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EpsbxHvOdknqVMxZxp6Rs23AKxnAfeyCb2MfnBs6W20=;
	b=dNawhJOGzfujgKgKjg9Tttwaj8B+yxB9WyGRI9lLYYa1jsfrD3bnwqh5dwqmfacAV4DE
	 XzUgluqLlYhtL+vv/UIAKjEimHiXX8lyFrHxnD03jR9Qinq3E/uCBSQ+07ifArYGRU+sp
	 rXSijvuYIUvd28ge6JKoY6jNfLMndxU/7+SC/PKSyhWFJSsSdCn+pynHxokYhw7pcI7QX
	 jIwLOdyKGXQyQUlP9MGz+M0577QH5cw228m7aQGdKbrIHPDbng+v5KV9jSMoxWgTr9Rd9
	 zioPEwIvik9REEgQwS6Nwp/iKgtpOiPz6LmaSaA62n2805hUUxVevxNlkREaJFF+7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NU1i7krp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D8606A31C;
	Thu, 12 Nov 2026 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NU1i7krp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B931F00A05;
	Thu, 12 Nov 2026 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481054;
	bh=EpsbxHvOdknqVMxZxp6Rs23AKxnAfeyCb2MfnBs6W20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NU1i7krpUkLv837uNLTHluVU8yoXpG/UernHHa4P+vFyU8O3pwTEzveHzOyJHMucn
	 uosuZYshFFEe1dhI+e94V+nd5oW2H86/tnPMxD305PwrcN+yKUFLMtpAFnO1fl9D35
	 GvhdBl5oGMBqxyQw1gvQAAYXM/6rGslkflmf1qJdtHECju9Vb9CimFcQXlR7XrLfq8
	 MVhgOX2aOB22gggHA66PLtXpV2QDead70gXi0T9SiEdK2lXux63ELyz94/GuP1MAHA
	 yxSb9EIwr8TteYaS2mDpx1F4p/bCgKCwf9OCGcp68N3raA0L4Z7QW6i5UsEteDZxhw
	 oxbXnpUv8mgqg==
Date: Thu, 12 Nov 2026 16:27:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
Message-ID: <avWbmsjkYo2LMJKs@parshuram>
References: <20261021022446.3619435-1-robh@kernel.org>
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
In-Reply-To: <20261021022446.3619435-1-robh@kernel.org>

On 20-10-26, 21:24, Rob Herring (Arm) wrote:
> For the QUSB2 PHY binding, keep the three regulator supplies required
> except for legacy IPQ6018 nodes that do not describe the board rails.
> 
> This relaxes the requirements for the IPQ5210 as well as if it is
> compatible with IPQ6018, then it shouldn't have more required
> properties either.

Hey Rob,

This fails for phy/next I see vdd-supply has been moved around..

-- 
~Vinod
