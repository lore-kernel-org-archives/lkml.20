Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78937F8CC;
	Fri, 25 Sep 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354659; cv=none; b=tKm2U89l+DI6XwStYeNQKxltnf+mCwiT1NU25Xux7SEskqaP8zFqVs1w4QJ2w9weS5KPCalITmcf1Y1Zw7Kr38Cznaf3LfOaxwL5NCP9GvZ9ayO547E54aKJn5lsCur0g78m8pvmxK7z6QBso46oQTSYyH+ah3oEXidoM5ZLo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354659; c=relaxed/simple;
	bh=kdxK6fT62obRWCZAgifwZqHvMZ+CdQYxS9b1MVFSEDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwGFHLeJWy5aEGlXfEs+ySC4lMlVaF/svxEmbmqVLrw+fwvJ+ZPPERfNaxtLDDgnZk/TeF5iJQ25d8QgBYBIXagn+mWPtOVaQ0Pq1kPkh99KWvOh0rvpqm5zJFYmSLRJa07MdPmPIbxd3xVAksOsqt3wdwpSUtV4FP3CJrfSyjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErlmFel4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErlmFel4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C711F0089B;
	Fri, 25 Sep 2026 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354641;
	bh=l64qG0IpvrF8rYW57l1p+zKarbzphNIaPq9R9z/QCdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ErlmFel43A5paYsdK6jHa4hXhN81J1Inry+gw/LMIPkkppIs3H44Hh8M9m2ZBbAsO
	 dTRDeAwizo2VQJNr5qEEe6ndJbh00lIDM4GOf1Cv/HhM2wXewvyR6iPvgk6VWkQDi7
	 aSdcrKSejKaeZ/158ExNqbxtzwBFrJiKlWwqEqw1WV6fwkgPH/eCWhjdBsxK8Avhwz
	 dFypgdaZrwgQ2Eu7RqbRTdYkTpfWsWXj07jsk8ev/LTGbLaBrUoj+qzgm7+CI6N+hY
	 YafKhbLmRVR38/pH5GnXcMqwCO+bvxPn79l6rWf34CFAuJHf1ZaB9UBDV2isknSpQY
	 6F7ZeaJ3s9Xcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/4] arm64: dts: qcom: hawi: Sort IPCC client IDs
Date: Fri, 25 Sep 2026 11:43:30 -0500
Message-ID: <179035461218.1296652.8764249187439190973.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Sep 2026 15:43:05 +0530, Mukesh Ojha wrote:
> The IPCC client ID macros within each group in hawi-ipcc.h are not
> ordered by their numeric values, making it harder to cross-check
> against hardware documentation and spot missing IDs at a glance.
> 
> Sort the defines in the IPCC_MPROC, IPCC_COMPUTE_L0, IPCC_COMPUTE_L1,
> and IPCC_FENCE groups by ascending value.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: hawi: Sort IPCC client IDs
      commit: e8493dd1265294c999cb5badbc26c6b42ea5c499
[2/4] arm64: dts: qcom: hawi: Fix PCIe IOMMU maps
      commit: 5105107939b082a98446018e5679d16724fcc75f
[3/4] arm64: dts: qcom: hawi: Enable SoCCP by default
      commit: 2b5d5dea36d4d45246cef89611c8e7a6002aa6a3
[4/4] arm64: dts: qcom: hawi: Trivial fix
      commit: 7ce6844c0d6ade683fc741c9409a406eb754ed11

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
