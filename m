Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169485;
	b=kPaAYVV8PBh0Myu6jP60WU/aGMkVM+/cU92fRJL4WxRmNg1io7/u+abYs3o4LAXIbGQA
	 uTNrD21W14WvW4uh87fv5m/x26KG3tYWSHDnXBbY/q4ggJpdtKqXhYEC8iG7QVXnRu4wp
	 D7tEoFZ3FcadF1b5D7/8Ho96uwaFwjnpAYk6zmBZ9miuTkXhBJ4NYe+/gHrtkZ2WoH0Ds
	 UJqtPpImAR1j/8gRCTN/AF5ulajgj5x6N6ly10TsWFmMeFTVqGVhqyprgFLhc9mTGQhb9
	 4dshMBpORo+YmsPymBT9bMB357pTyw8w09YP3QtZ072EXbuGmTQaQf2ADxX7qDovhMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169485;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fe0HUxH8whcIIIhEpcHMkLPN0zHNZ9HhlgjK+xZ8x8U=;
	b=2tUZ8T0DJtEiEDN1PZ0WSYhVoDlHWQU5ccggnr8/pdKgbPwQQSp7MQjb0O0TYH69BIru
	 pcyq6HCItue5/51lRpwHfRQt2Owp2GADOKQJxoYPURaQLwLnPTzH3xuoy+OLyWI7ww378
	 y04q2udLJf3loaZDk0S0QBUvlhQSbIkS0V2hSeUxU6AUF/KwvrJXaby6kRZiZsLR23ZE0
	 8jS+/mlEB3wYSgtyRCjRsIk94FcORUb79/kt8Kh5HZWyIw+ibr0zxDtfWYrucbIe8mVrD
	 alcCJRGAYe+PnJDlZdiRJ9lzpRsYU2/6A6pwhcv+bZzQCECt9615sx9s2uYZ7ePmx5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtUoteun;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD720607ED5F;
	Sun,  8 Nov 2026 20:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtUoteun
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4211F008A3;
	Sun,  8 Nov 2026 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169484;
	bh=fe0HUxH8whcIIIhEpcHMkLPN0zHNZ9HhlgjK+xZ8x8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JtUoteunW2dv5hKKht+swyT6/KXsx9SFJiccgQbczAgfop0/cFxl7rN2hU1yzigpW
	 hEA8y+1ik1rUs2kEu5+i1pZ3cIUaCF1EfoE2tsKv8QL3+APceJFpMxi3f4lnOIrpgz
	 5DcGtCWhL1ZeMhkcsZ9ceO8oYZ8y6Vh9le5S8FzQGHubEjJta2X39M7gIMYW9+jezc
	 GiSSp0oVTGkmfayd0FWpoGSx2pAGC4AAEVCLQRZsO/gx5ETf1L6O2ucOkUmaRoM86S
	 mzPOUSKQtsgHBqmLlr98hnReyJP1NC7wl6CNeFLoZBp6ENeAlUSQMg567d+5JbI3ip
	 Q0D4SaicxM0QA==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: nord: Add adreno SMMU nodes
Date: Sun,  8 Nov 2026 14:21:13 -0600
Message-ID: <179416929356.628393.12258823662750870745.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
References: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
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


On Sat, 10 Oct 2026 15:28:22 +0800, Shawn Guo wrote:
> Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> 
> Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Applied, thanks!

[1/1] arm64: dts: qcom: nord: Add adreno SMMU nodes
      commit: 037c673c0cfc1873574a5cd7cc7f8bcd2ac15046

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
