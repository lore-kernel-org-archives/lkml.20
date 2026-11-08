Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169441;
	b=l6s5Is3NS86w7Cq61hfS9KlvvYfv5YA1n+7/kd98uVSheEiGDxPahT44VmuaN83D39yd
	 Q51sTB57gBqwYBoRmOutf6Dumm6ylRt0mUXZxpEqkc8pFDnu7oTqa6HPsC+KzCzCL0Kq1
	 I2KQVjTAq+BIEqgGxgSZEaemjauz0S+hTBVM+dcHN6Ofjk8X/wx1MUSMyvNfgXujBs4/U
	 2zIwMl2pWjaL+vHE3peYXtw4bLnTaQYJx47bfRRN/L17/1gZght5IXEx0P2Tz+V5tWjmV
	 fUs/fuXcdyjzFIUvdnwkG3oy48lTmL8zr20o6fwmuOSRK3C3Tay7fOGhXWX4FO9moDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169441;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KstahBYKDuEZUSXEABsCmaVJSY5dVl9UpUgKjQbpmA8=;
	b=l28gqqtrzYlfPIix5v7mbf7PfzryigRVIWPcDCOAOsSqA2HmpiNLTmchpZ0tngkSo6DT
	 gODfeKpSNVTlhYaYfQ+SKXFF7n8dr2KDy5ICpLIe6EfF2qx1IlSDBm5MjKiP9X1j19GlL
	 wT85juKdJJLicTVJPR/G/z4xQIAVu8ivnnBMQvTv2h6q0eiHu1aqI8CFAkPiWIbUiXnJ7
	 OGcleELmpD+pVpPYvJVjv5mY5BwQGEVZ1UbIP9GIVlI9+fRrcsR8uVJsLzF5FgTFsWJpR
	 NVI2zv1nCLrfGwZzi7D5TlmfGajfacuTo4U/uDF3PlHnT7rPuQ615K0ugOaNv3nDtKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnBOTdZ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A260762D5;
	Sun,  8 Nov 2026 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnBOTdZ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCFC1F008A7;
	Sun,  8 Nov 2026 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169440;
	bh=KstahBYKDuEZUSXEABsCmaVJSY5dVl9UpUgKjQbpmA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nnBOTdZ1ZNChdRqvruRoQh10ZBTxue6WhQ/PBEpskKolUL5nAwc12Q0i8iAL+1/0d
	 AqMqnaAoJki4rW7tX/zkdX1NEkWe4dcMwdbpvwEueLiFAnRwAWyMNFofg1xCVwSqp1
	 eynGKpVnsv/GunRrjfLiUJI6cnwI8JBk7MDo7sm8ldS0lnhpryZztNH7/rvfSZP06h
	 aFwKTUVxGA5eKUyQN9Nsu1aA6vtfeU7CEbcZ0eG0fJnBjaMV9hxHJkxtEl1g9nBNp1
	 +OzwZuyEEeXzkHnNRFgz7X0b/+Mp9U19YfmPyR6524lljlBTyYaF9jgLsX2wexOIKA
	 TBjWRenpXG1XA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@oss.qualcomm.com,
	mani@kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: glymur: Move the PCIe graph nodes to the board DTs
Date: Sun,  8 Nov 2026 14:20:39 -0600
Message-ID: <179416929489.628393.15063239710569397276.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
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


On Tue, 27 Oct 2026 13:24:09 +0100, Manivannan Sadhasivam wrote:
> glymur.dtsi describes an empty port/endpoint pair under each of the four
> PCIe Root Ports. Only the Zenbook A16 connects one of them, to the M.2
> Key E wifi connector on pcie4. The remaining three are dead nodes that
> no board ever wires up.
> 
> These dead nodes add more churn compared to the duplicate nodes added in
> the board DTs (when other glymur boards gain connector support), especially
> when they get added to other transport nodes such as UART, I2C etc...
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: glymur: Move the PCIe graph nodes to the board DTs
      commit: 2bd1d30b8df560a9aa69ee961b2ff1dafa67788d
[2/2] arm64: dts: qcom: glymur-crd: Move the PCIe slot supplies to the Port nodes
      commit: 4c250a69d5a2a06de88b89eb1c3c365f60233c73

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
