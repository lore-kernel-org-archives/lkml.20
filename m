Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83115EEA8;
	Wed, 16 Sep 2026 22:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597934; cv=none; b=ayByBUxzjM5XwTJUJo+UgVPEg6Xpm3wlHAgYLKn3zOPvY/DojyboDEnQp18KERIP8QOhdmFYIvCsfF+vqnLZFwWxlpa+oOYz1K2sWyGRJwEQB59WEfBofrg93POAzWgr4aQgs98hupGcAIEQg7OovQoHiMtLp6qNDkK2nD9PVyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597934; c=relaxed/simple;
	bh=bjJU9Z44PVUCvG8pMcP/6V4IFB0tGC6BdvqUumYtqw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lXRIbAb0NCYzlJJ5U/UtdljZ5LaiPNYrQreMjlSqfC9S1FRqWWs1EWhf0/dzXfds6esGiEiC/Bkpo2IIvVh/ETR2fu5zgd6MKX8l7A142NlkI2Jo80CqCLu7zDSJY3pSvevB5UGBBoSk/dfYls1mg+DQa0qoWlkd8t44GzG2ujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WovI67HE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WovI67HE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E28D1F00898;
	Wed, 16 Sep 2026 22:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789597926;
	bh=HNIzeR8GVk5pXPZw5/ct6bVdaLu6p1p4DPsLEAsyheU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WovI67HEHgRdOuHiDSrtjfnN51hG+7vdxYMhYqvup1FCDjCDmiJIPcMx9FXO5KIyr
	 My8M6sGBpZvi5iXFa7SKB5v6G0pF4+S92fHBrLbwz8MsDeubCDZT/r4PEzDjkMYkeS
	 z8d+9OrkZZzZ+Du6kCCh+uQhHCkIy0814zUfgxP8R7Ov4eHa2WCm/HQ//1vwu6MMv1
	 UupHLt7GMBBs701ESbxJQxIFQlf79iwPjE9x0RXN1PPUwrxwj1fyQoVwxDamlWD8mM
	 dP/nFucWgUKNNmP1kGsszAFFg1TKy8sP22vcqnxbeJHkzqmYw6n4qEQOITieZRfF0s
	 5BnHu295UM9ew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 0/5] Add QMP PCIe Multi-PHY support
Date: Wed, 16 Sep 2026 17:31:54 -0500
Message-ID: <178959783406.1336377.10908661913613570380.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Aug 2026 19:59:19 -0700, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks can be configured through a link-mode
> register into different link topologies, such as a single wide link, or
> multiple independent narrower links (e.g. x8 or x4+x4 mode on the Glymur
> PCIe3 PHY).
> 
> Earlier revisions tried to extend the existing single-instance
> phy-qcom-qmp-pcie.c driver to cover this hardware. That added a large
> amount of conditional, multi-PHY logic to a driver whose data model
> assumes one PHY per node.
> 
> [...]

Applied, thanks!

[5/5] arm64: defconfig: Enable QMP PCIe Multi-PHY driver
      commit: 6708289cc13812cebedcc396a42f62d3f92b2dbd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
