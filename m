Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169418;
	b=J+gAJu3EpRmRQ7H+JqBlew4lhjy1k44G164qT0ABe9j7UsAhVkz7KgYzalPefXx9PJxK
	 ir8dvJvn3AllTnklbnyiQCiWXNUv4pHBKp4EP5FlRwU1S07gu5h1CkfnLqDv/wbaPid68
	 G4c4vDpRVXVvh8H9ZS/WDjPaszRXHIFnkRqQfYMCVNlPgSnotSyEpsV7ur9+X6yu7tjd7
	 1W+HU6x5sxEoqxzRXvA+sYf1o/566RDitmsNQXxHywO5OhJwd0U68Hi9AEq9MBDnWGhXE
	 /rzzQq4V3bqq5Rp0FBkvF3276PLLKDv7sOUtm+DrUChOVFS+aJiNdIYMZCaafr9K3lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169418;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=k6zrRiFEmmCW4XWbsBshVLhAVV9AKO992XSAN6bAtj4=;
	b=hvbuFFxbT91oNjAnOhcaYGvza52QvHElctWMUKEFAJYECcM3ujf7wO0KI4L9y4ShNPqM
	 stvlP54+wGZDqAGswWTjU1ee1HrEAA661acg1n5WOmibgcMhEzlI0jCRSNHECU7HLIHM/
	 kuybYDNhs+vHRhYtXqYf4btTU02jHhcDJfZLHExTp5+2ZVGY4oBSsppDBWknizjzct3Jt
	 e/w5cgVEdM2yeTEmUCuj3f77tMBe4kJtLtvd7UsmrS/MVvptIB9eraXcnV6A2xFV2+2lm
	 qkNiBMI4e28SyTShFjTGNCv0CVoHih243ljgr+8cpX4AO+ghYHQJnAEimoLYR8ellNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RykLJeKu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E260729A2;
	Sun,  8 Nov 2026 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RykLJeKu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49781F008A2;
	Sun,  8 Nov 2026 20:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169417;
	bh=k6zrRiFEmmCW4XWbsBshVLhAVV9AKO992XSAN6bAtj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RykLJeKuhm2DjZkSL/zTYPkiftg3HtuHSxVpYnAMjxPYVSVKtI2ARTB0ggID086XV
	 L1vfoAlkC6iKiHUIBzQs0FZplA4sR/qRhiguAyvPgAwLurj6UhTZ7uIVOIbMbWraxT
	 5XqcuPsz2fDzfYbjav1rrYJSIFcmps6bIzUnv33UOHK1G4Gj5WnqIpx2aLSmt5S9ON
	 R6u/u8bsjiG14BW0/AtHS5tuRtY1fuoXeL4TS3+DW0ogqx49QhT36/XkqIRsfxDbfr
	 lseSV5VVU+4sy7i0mDftXh5hHJdbl86A6Tv0VuK7cuJfaEFX3s9hPKH/FH+ESjTxVI
	 oT+lV3sK9L4Og==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA coherent
Date: Sun,  8 Nov 2026 14:20:21 -0600
Message-ID: <179416929459.628393.1369233733965142622.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
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


On Wed, 21 Oct 2026 22:58:37 +0530, Krishna Kurapati wrote:
> Both USB controllers on Talos are DMA coherent. Add property indicating
> the same.

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Mark USB controllers as DMA coherent
      commit: d81defce7d6863c916224a4ae2a6382202f6bdc6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
