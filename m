Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53D49480F;
	Mon, 31 Aug 2026 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198857; cv=none; b=otS1d4TWtX+jJqPzMn0wkx+Elt26Gzog3dpRpFS6sIH1qeMDxCIyd6UIUYmSaMvhI83jv/zO1u2vsUj9d4gme43SIhsjAuCCoCI7ZSYJ67uRtxxZMQqe3YE6vSjyis3aTIUsLcQ8yXOQp9JhFrvBcPGOeVgiix5YFwQRIUa5d28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198857; c=relaxed/simple;
	bh=gwOK+8dKssunGgfHFAM7d9jiehkwj/decjx924Q6TH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mu2vB7Yldm0QZcHLzU8mCLKwXeF2TNSDJHh8ZrF5fssaSAeYx0psTQWlS4LnSUxfmVRoXUVEEV7neHKCylIV2i0aXz4i/eIwxUThqHEx8xyQIkB92NxmX/1fAaWtnbyXF4GVimlSo5vqR57QZrLgfgJ/0B6ZrPgAa9Vra1AG7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7wbLIZU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7wbLIZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031F41F00ACF;
	Mon, 31 Aug 2026 17:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198856;
	bh=tXP5WR9pASo29OWPTldlfmFxsIdIV/SIBFFkPV1DZhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d7wbLIZUagKZB7ipLqcrSm2+11SyJoxuBL0kdGoXhx7Do5as+Z8XRlLQ6hEvydT8N
	 4YQA8a8XkbVbr7NWBLh3vZmRGG0W3c9dATVLUrB+5GRJizvtZSM8YW1Kgq6OLvYlLP
	 409kUQ5gfzzL7U0xCA0i1ZG+MLu/iHjBETlFjyRqRaiIS9J1nlbztSGvP2//wJ4AWd
	 mw3gbMyT+KspZOxGQ3Td45zGIc4bxeBZSuMJqWkb/Xe7Qr0+tkyVD12PuJLzU0dDnq
	 T9/qM/5XTqGf1V4unYZD1Tsvzi+j6SA3LnsTDQga/ohkKOtX8PiVs6e3EiRGZJWWSS
	 OOXnTpG6Bkbmw==
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
Date: Mon, 31 Aug 2026 12:53:46 -0500
Message-ID: <178819882985.1411250.10417297203313304130.b4-ty@kernel.org>
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

[1/5] arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a controller nodes
      commit: 7a147b572a22efb1404249f74d982ea386f59774
[2/5] arm64: dts: qcom: glymur-crd: Add PHY supplies for pcie3_phy
      commit: 5d9046549e433257f7fcc5d59a9a449c8c11dd84
[3/5] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy with dedicated pcie3b_phy
      commit: f4526f9ee3146224d94907b38c712177d9c74df7
[4/5] arm64: dts: qcom: mahua-crd: Add PHY supplies for pcie3b_phy
      commit: fd452641dfebc13da4a44ef5a0417e4480b0e0a3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
