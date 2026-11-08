Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169415;
	b=h/4e5TgkxQB7LxZPp0ZpkK1uqjxxZZJb7BsLGixz7EA1ubY+/5i2UTYeX7A6wctHNx/2
	 eAxKrT+NcG55EzUfdiZz3uXLKBIChKHCsV/owZLVbtEHRxUgQXHCI3fXMqbMnZAewgewi
	 qN/5rjf3/biKU04ajjm/VW5Chg8/aSZ6ws5r273HRCTBwznwq7/EYGXmhbXq/4J96zBuP
	 GbzteuiJNC6W1AjnMFHt9h2IOLaTjASRkzSQBNWjqviY+x1Xdg77WS1c+BwMErXTvmly8
	 yu27vLkm8B+Dj/8guEEvI4cnAsCfJYzbzbx5+c9z9su7/4hl8dqKiRAw/urcTrF+qkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169415;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=D8VpFc1ORRRii9rRbkxAX3teGO1GmEaItFgaX6o+6Fw=;
	b=FhMPTXI9BAleA6mZAsDVhBbPmaGFz7e6jvW7V36y20ijE37TFCafOMseB53Y3yweJwbC
	 IaCgnlZGmD+8BCvyJthro7VisTlg2uBWkNhnWSWW/0EgvhFqzkPEDJUP6o5urd9l2eGuI
	 hUZuOlM32DZxCYXaTDjRv9kbqjEhBJm4/gulNQIKVyIgY8rMObgkIWTJvdznti5QfsXo9
	 jmYJO8ZUTMa/f2SryihmaVq2v2LbrlyBlWQQQaP5SLHM/d2zmJndx3wkhgDI5isNZSFMy
	 04Z19ioq76rrrkvYuRRf2JIhZlwIbWcUANowa4JBbWpl9DyiLGpiEV+dov/ah5eA/+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsEqHeII;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1B60A2612;
	Sun,  8 Nov 2026 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsEqHeII
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2C61F008A3;
	Sun,  8 Nov 2026 20:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169415;
	bh=D8VpFc1ORRRii9rRbkxAX3teGO1GmEaItFgaX6o+6Fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gsEqHeII4HUIw6PtrUNKP5o8QwWj4dpYIvPafLEbUyl0y+lYdoTx+9jpN1ixQA9sF
	 EojUAcDWQ9nQZ6qaR+j2PD2qDlwxHurqnCV1GyTMTysE/iQX2i34Pb6F07xDlCrmXI
	 nvGkORS0Nco2H9JoiZjA4wMsxvkpnY7LFb80pnY2mtlwLazRMjx6L85KN5sCQ83K1P
	 qAxWUqBiKkF51Chzav/4i6tHmwNaLf00nIol0vThM6Dns1V0KIkYRWY8NZuZGmsN04
	 2TbALMxh4P90JSPPZnyMLiCyqwiaMiBORR2uNOPNgzTecI98wdOkMF3Qtf+gdTKGgB
	 eGuuu+rLWmBIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] Straighten out CPU votes
Date: Sun,  8 Nov 2026 14:20:19 -0600
Message-ID: <179416929442.628393.2557463177209584784.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
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


On Tue, 20 Oct 2026 14:42:04 +0200, Konrad Dybcio wrote:
> Make the votes only count when the CPUs are online and use the existing
> dt-bindings #defines where they weren't being used.

Applied, thanks!

[1/7] arm64: dts: qcom: kodiak: Use ICC tag defines
      commit: 2c12b8eceb58c398437b1a8ef2569fe96daa630c
[2/7] arm64: dts: qcom: sc7180: Use ICC tag defines
      commit: 15a08dbfc9d819626a87d611fb3e43a3b1439b04
[3/7] arm64: dts: qcom: sc8180x: Use ICC tag defines
      commit: 257e705c03f52f91d0618a895a4c16d6b263321d
[4/7] arm64: dts: qcom: sdm670: Use ICC tag defines
      commit: 956e71f2f9d4209b0d5ff631e2399243c6c9c38e
[5/7] arm64: dts: qcom: sdm845: Use ICC tag defines
      commit: d099a43070c8fc2686ade2be485795bd290a3375
[6/7] arm64: dts: qcom: sm8150: Set active-only tags for CPU interconnects
      commit: bee518321b2988bb0b7904cc1ccf9052cdae3c92
[7/7] arm64: dts: qcom: sm8250: Set active-only tags for CPU interconnects
      commit: dd68b2a63e893c3b2a0e882487a6a3bb38a6f9a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
