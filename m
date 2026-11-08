Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169310;
	b=mCJfBEkGLpQIwooA2daqcHTkrWHftGeagoIsVPTy73wbSgpYwga0c/1xTqZOSL8v9Wdm
	 CvHW+SN1olmrfngPHcIh38B4daMbpB8C/0nF5wkEnxOt1oeFkZl66kAG7AsvXEDxOyBCi
	 moXiyDpvl1F92KbicqoOwTDhMl/snIRaTK+AGMZAnRuJFUSSx0WY1azp6xO87cu1gAD72
	 iFCVdqoGFses+U4p6YzRKvVhwOwvId38M74SXqLVvc5nH+K8JMyLUROQcQ6qG9jonw/n+
	 oYMcQ16IuUFUWJCrFTq7pCRb4abvKUy4ZomJ0/QHD5y7e87cS3vfBkqJx3DvL5+57Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169310;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iqvym+57jpgX8gbfSEMbuRp3x0B5iZpgj522H80AASo=;
	b=DXxpXlO5wsK9mMhzSJ6S6fsvWNrZwHiUg1I0GZKSXxyqzLmDIVnn4ubfEpum0dwSp97j
	 6W1SpxxQLc/lCmBT4+bryAh1rEX7sU2+DTcE70SHVGY0fAxG8EoI8gDRCcmC78S/93vu0
	 Omc4R4J/pow2fGJ5hwTKEE0dQlF6dXJfqU3/6BDOAWdXSk4avbU4rH7SsZpt2KXg7qt3x
	 h1d3ha3o80N34PWIvRX424AtCVLzXyA8yb9BiCBwdycZccan2rak+Ta+O1oaiVrKHeEMc
	 cmD92PAw294Vwo/DYx5RmxRSzmu4HoEIsgD/4JeL5aIZTQLcShYQa3kdltwPz+s7CJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJIMZ2Lo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC0606A326;
	Sun,  8 Nov 2026 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJIMZ2Lo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52D61F008A1;
	Sun,  8 Nov 2026 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169309;
	bh=iqvym+57jpgX8gbfSEMbuRp3x0B5iZpgj522H80AASo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lJIMZ2LokefPEoYK94EltTwGXOarSs5K0DQUuPTI/apkYCzy/zwMe4YlBdg0zIfq+
	 gqiZjJYCjVsC3YrcPHTVM2X0oezi8Zr1Ic0aDtcXXeu5V5xUa8LMxQGiK9Usihk0uL
	 88QDTHWAGBijjv/ug5jqOh+pZD+qP/SdfImsGVRL5SNaNa2NpRxD0GNKZfVrDTQiT4
	 hXsnoslQeTKLB2VJ1FbOWN3FbH4ebOh3ZAO2OOPz5l2T9m58C2OOZYxINuBRasES3I
	 Cv5lxY9rJModE3WVBw9sGIJtUUT0YNBouj2VR/hyiONrJkSMmPhLUXqRWy5ow+1a6J
	 s5sy+QpHfR2eA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook: Drop the CMA region
Date: Sun,  8 Nov 2026 14:19:09 -0600
Message-ID: <179416929382.628393.14612035309086757082.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
References: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
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


On Wed, 14 Oct 2026 16:55:44 +0300, Abel Vesa wrote:
> The linux,cma reserved-memory region was carried over from the X1E80100
> boards, where it is needed because the PCIe SMMU is reserved (owned by
> the hypervisor) and PCIe devices such as the WCN7850 WLAN end up doing
> DMA to physically contiguous memory.
> 
> On Glymur the PCIe SMMU is owned by Linux and the devices behind it are
> attached to translated IOMMU domains, so there is no need for a large
> contiguous DMA pool. Describing a CMA size in the DT is also more of a
> use-case policy than a hardware description. None of the other Glymur
> boards reserve one, so drop it from the two ASUS Zenbooks as well.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-asus-zenbook: Drop the CMA region
      commit: b7306b1cea3861163dab35fe16b1dca73f745a78

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
