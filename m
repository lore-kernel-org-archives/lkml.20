Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EBF3F3262;
	Fri, 11 Sep 2026 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093565; cv=none; b=E9fYjPg+9fpHVSjrRR+lEd7Ro8kFxfeB9Me8eobBZYRH426T6IeTmGvP/fORuKqjRvuA2CZKbks2/aMluvAo2BQ/XA27hh+at/WcIUqQn6cic3wh6Rtxz/y3sPozzuvuIxmx5ID11++EN01axdUKO4yurDe3L8L+UOmygSRRvy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093565; c=relaxed/simple;
	bh=bjJU9Z44PVUCvG8pMcP/6V4IFB0tGC6BdvqUumYtqw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gkfDaR07+e+ro+B3/1ZxpY+w7X3Nir9FYQ8ZYUtl4EF8svlkKJWoYtONT84zM7KsZtLqPptcxlmhPHS+O205pCmEgSsQ0PK80WtjI1P2BHzspcG1N+TIaf2llvxSyfwjpG6l7FhGVHhQ3t0ruwFu8m+ncAofd7gGnzTixsYomTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wu/e5k/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wu/e5k/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D871F00899;
	Fri, 11 Sep 2026 02:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093563;
	bh=HNIzeR8GVk5pXPZw5/ct6bVdaLu6p1p4DPsLEAsyheU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wu/e5k/64fF1wZG5fIrW5AEmr9H5w7LRKqAjgheO99Wpkybo2tAMwgKAZ6Yfe9DCu
	 beiABgarQubnwXoB3uNzqs3HrzGHTMoI8FOAYr5kVgg3BCRAEsj7vA2evGzoxBDDZ2
	 1ZvWr06lfjGFxqJsASC181s0SoZOwoVHarfAvI4D6ea2VKGXjDuHa98G+XNB5YJxDj
	 hmxxF6cLUG+g8JYdUpU+tUdSKlw5TiR/BG5tEjLLebA2OqKaJivoacpOuuh6Z+HgEF
	 C0PiLw+4nvDzq1k0GdahMLyy+CA4iF2sMzn1C2jnoI9eUNRCTjPpD/pwjsMI+ZlIry
	 UL8feDZJuX0jw==
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
Date: Thu, 10 Sep 2026 21:25:40 -0500
Message-ID: <178909353853.920241.13935433536779204149.b4-ty@kernel.org>
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
