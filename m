Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169375;
	b=s3I58i3ZFNs6sIrpudEiKOiBy5NH7/3jnh7vhxocDOJNC34x3Wkqzhj7wi1vKE5znEpB
	 Oi4nyOdoUda4iLa/NoEuv0BDw+2B+4G+UDxgFO1BX8PibxWX332sJ0sBYnzJpjHd0HflZ
	 MtefcY7BXe7+n6FPY7XWgaVDPwIYe+E55i5i39PkOplzCRfQ/N6aafMXAits7hYtLjnGr
	 7Tv6crARSoch8eBRIlhQVoJFywDiAB3NkwTEoniBkZWA+Eju3Dip5yvBBhVfRh9R4UH9D
	 XZBCuZZN5H4QQdgkiAAguT/WP6vgzu5NhrRrfcs+gYyx6eY/knO/seTzw4MvPqV0BAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169375;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3WTLkjmkqK0giO2WWgQJb4HKr6ag/Th+VJz9Z7LhzkE=;
	b=46rzp2utSwQMYL+JeoAVke+o/Uvq1+4w0Ovn6bkb7FjKuv7bnOsjwiV0/tkqhwy7KXHJ
	 lt0unHtbxBuXnO2LEyvMpjVEwZiqm3xSftA7Kf3r36iF3yyXgaQV0Fm/V5UceZusS0QZA
	 wxgf4DVNuo+y/xYDFUlYPzS5e1iQjX/ijoDlxRJcUf6r2VWp6xqqBGgXZIJPI6vK6LIKy
	 ueCgtiBV/VrZ1jyYBYDnfi7WeBgD4elb55xff+4hTEfDTRZRKr8+tkHh+7iIxJA2Z0z9T
	 MkJif4UH50mt5HgUUbgNJ3oASISbdyJN3kFLYw/j0qvMlScwQqpWobzqf5ftrWxrEyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1uFGa+u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C30606BA64;
	Sun,  8 Nov 2026 20:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1uFGa+u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A993F1F008BE;
	Sun,  8 Nov 2026 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169375;
	bh=3WTLkjmkqK0giO2WWgQJb4HKr6ag/Th+VJz9Z7LhzkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y1uFGa+uB1K692o6xRi9dxiAJhV5TDEsLvOXOqvjoU6tlHWZe9YSnQ6kul+FIDh9u
	 YFnISYlyR7Mthg0YUhbjp+KKIgIZMsU0xO3FyKrz8s074qoxIpkkQfWghdP923nJgV
	 VZehZVFQsnWvsIgLEddQJOHhhLr3Z85++3OsjPRD75s7sf6hEZaU7FPTGvGKcnXa7O
	 9K3+lZa6hBogb43nHvNjtDWZ7lLFrnf1X8fStApXMkovVxLTjwXHgXAiXzacmVoSiS
	 Ho3Sv6LjsFl/XI76WDB6mXxE1ciCTAIWIk2+WCKRf5Y0FJ6KkkH4aM9BfQHcgLmirb
	 Sjj8z2ylxk0yg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v6] ARM: dts: qcom: Add initial device tree for Kuno SoC
Date: Sun,  8 Nov 2026 14:19:50 -0600
Message-ID: <179416929279.628393.568857102058027472.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
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


On Tue, 29 Sep 2026 12:16:46 +0530, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: Add initial device tree for Kuno SoC
      commit: 7f6a63bc5fc9bed3fac66ac57000882926d25f84

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
