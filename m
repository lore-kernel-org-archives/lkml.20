Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31387328B56;
	Sun, 20 Sep 2026 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921096; cv=none; b=a2HstRTyAJA93BNKFm/4LH5bHMOszibYiJj0WD18Q9JWzjaGwK2HttfjiiGnWQ59ICn42kAPCJQA/Ydf+vsfCxFVVchuSz2WL6pd7j1TDyv+ff4I982YUi5YNMWzehFcxl1FfyQQ9tnD+2tg3e5KV/pyVYl7YDy2gIvY07zUX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921096; c=relaxed/simple;
	bh=8vnXDoBmo2asmLqYer5EfXfvvzv4sB0c0gKmmi1T0ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwTCEae/n4qIicI0EH1+jaD0WuB4/7zxTdf9009WCj6okvBwQECG5gUrycK19nnEVWbIvJKeGbHwZULKDAySnRPwYPPbBKku5Qsb1boPaX0wlo81Rk1pLoEA9dZ5rquPAZhrBRl2VXKkKNbl1hPomgMnPO8sgHeXJ+yGoLc1MUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gg6B5UQ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gg6B5UQ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A7F1F000FF;
	Sun, 20 Sep 2026 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789921094;
	bh=uzX9CGfVnXwQZE4WMzJRpdIk/q5j1vCGtRgQcIM8P9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gg6B5UQ0VbktP9JbrIgcXNehPH/3B+wfWy0jXnetxhnohkqlq5yRrLKpJgGiRE8E8
	 gLMcrXkZw+ZTdoTZ6XGVa4VjhLcDO7I+CPPfx/gQ02olVV6ubxW5UIBPeC2tzDvRmy
	 4ntxTXkVKmm/CKO9dNb1aOlf72Je9xCynHWhTZAEjdcuxd+mVL5ak4ZGBp8KvKLnUP
	 uYYTx8qSZokAebGjQZ2NsJqoPmsKbZtbREHO4SDbWE14AlQcNtHGQ5oCUdzjuZ5rvA
	 +GHyX7U810UMzk0oqyRavkRgb8MfGIYSLbHgH8+zDwlSDC4eOA9eY1eE5fNvp/16tg
	 Vfn6LsGjPGT5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Ociepka <greg@ferrisoft.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Mark USB controllers dma-coherent
Date: Sun, 20 Sep 2026 11:18:05 -0500
Message-ID: <178992108598.214160.4042658803494476498.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812154014.123315-1-greg@ferrisoft.com>
References: <20260812154014.123315-1-greg@ferrisoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Aug 2026 17:40:14 +0200, Greg Ociepka wrote:
> All five USB controller nodes on Glymur (usb_0, usb_1, usb_2, usb_hs,
> usb_mp) are missing the dma-coherent property, which Hamoa carries on
> all of its USB controllers. Krishna Kurapati confirmed the Glymur USB
> controllers are dma-coherent [1].
> 
> Without the property the kernel treats USB DMA buffers as non-coherent
> and performs cache maintenance on every transfer, which coherent
> hardware makes redundant.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Mark USB controllers dma-coherent
      commit: e62df36f34949aebe016c5c81e34baa7a9eca427

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
