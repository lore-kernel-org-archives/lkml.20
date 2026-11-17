Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877523;
	b=m5/dC4yMmW5o1mUUfndH5OkLlGAqfEUYEXfr6oJx6OJCRx0h1Yi0496TDobi8yytdsKA
	 0yTiaCDppkESmq1p22kuCiQA8wSY/8JIYQ1cM/8G+8DnvC5GTZ7thVj0TczxiUxZYAi2D
	 Y2l/0dCjJ7rLIXewugZzPp/Kd/X22e8u2+tpIPxVuLmujMnZLJt9aOzo/MeVD9NnoppDG
	 /IeucO0ltfuVqV5pNhj6Axku5JOz+L11Nh/PlAILVhJfG/g8GkbGGewO7ySsjz2YH8bCt
	 NYuvANK0bOTuW4ckh+lkL29Emp1H67sJ1ovkrIzMuVDGuNMbh1PlMFpzt76mAz336Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877523;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RVmkNy3HhLs7e+G2SnLiYxMF1/jiuEjYVlpspUb0hKo=;
	b=3zyQiVT+8xbtMHJ7PAW0FmRdvpm3AZUHf4T2kHGi2hNX/0fPkGdwWpAv39er0433/qun
	 lTVQAAoNjCxDJFANXgAEQiz8Aw+T9WMU9HxordXz6JKA4dLsf3sD8uaVuzQA8/qrLkkzE
	 OWLyXk9T1fuGb/ZOHYDZUV1xbYKCV96aBL/sCtixGGAxmCSzhdEXg99ol8IvX51YB4cB5
	 fOsoAalJ6HFp8ibN2oCyOReAML9Ady+nzsNTa1iAATqyjFhpnfQr9rNm/HeSyrDQgf6dF
	 l/Mx8t3DWB4UuYLpgjP32XbF1aulR5+kksP/sIh5oznO2CUs3hBt4g2Q4hyWiqR92Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHpWSs5D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80B60A3801;
	Tue, 17 Nov 2026 01:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHpWSs5D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2F61F000C6;
	Tue, 17 Nov 2026 01:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877523;
	bh=RVmkNy3HhLs7e+G2SnLiYxMF1/jiuEjYVlpspUb0hKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KHpWSs5DoVE5XTiJPjS4m7c0EurxTZFIwNR0A61WLV1La604KT31s5E53rWc+h8nr
	 TRxrvl+UlR/lGr8KjxRGn+LoD7BqAR2dEFFpFXcYCaj4vnQ/lm9UFPnigefVZHS8ZE
	 q76h9A6D6vrLg59Q6WR5TixIgmndJmvrLTOWmAWwzTuJnj1FZQAKrgPiW8D/NhTU3f
	 9NgsjFyIV9jIFr27fAoax02vK7klxMUN2aqUNz6c+I1PhAmGnO8rMLzaXlBe2ue6gV
	 X6YmURMRtmeZKJd5oPUOY/F7GEtIfqQaRMYIAYKL8sOiwKN594aMhWSnqa+4A5Q7JK
	 J6bA7ez8udGwA==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrei-Alexandru Bleortu <me@andrei-z.com>
Cc: ath11k@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
Date: Mon, 16 Nov 2026 19:04:51 -0600
Message-ID: <179487749327.432567.4937281230879206027.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792761470.git.me@andrei-z.com>
References: <cover.1792761470.git.me@andrei-z.com>
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


On Fri, 23 Oct 2026 16:36:56 +0300, Andrei-Alexandru Bleortu wrote:
> Add the Ubiquiti UniFi U6 Enterprise, an IPQ5018 access point with two
> QCN9074 radios on PCIe (5 GHz and 6 GHz). The first patch documents the
> QCN9074's PCI ID in the ath11k PCI binding, so the radios' nodes can
> carry the calibration variants their board data is looked up by.
> 
> The Ethernet port (GMAC1 with a QCA8081 PHY) and the IPQ5018's own
> 2.4 GHz radio are left out until the GMAC and the WCSS remoteproc have
> bindings.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: ipq5018: enable the PRNG by default
      commit: d8e9ecf65afef7cd2bd40e8619b5f32fe6563fc1
[4/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
      commit: 97430c2c59285d3c965fbffec6df8d091c47ca5b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
