Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80424352C3C;
	Fri, 18 Sep 2026 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696204; cv=none; b=DUP2y7760yabUnYgVhaTkl+cPQz0AlKiWOlfvTBPcwxeoTJfaeSENIiehFH/a0o+5aPB7306+uZljkaqlYzmOGsYADgkiTxp9o4BVmJFIq3SEUr8LkAn+og13eQhxs/x1v5I9IyKBK3gY3oo0skM63Gradr5aH8bqcqW1OKlke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696204; c=relaxed/simple;
	bh=LzvhB3ydHY1AUfLMdroo+EU16mkQbK+NCa/mZtkrFxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WPVr+eRq01+Ge/RLVbEpcBRVPQ0LmuuEUkUAkv7pFrmRmdm8PauQdu2aSXt2HRX2K+jyInQnzpNKCY5xkDpVmd58iFk/sSl+8AFIjQ3aLVq/CDaXFuwJ2oQbHwRyO+9lwGXg4Cg61ER0qVzA8MJx4h67xuUnG0HceOVskoZYnBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izJnIcdh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izJnIcdh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F7E1F0089A;
	Fri, 18 Sep 2026 01:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789696197;
	bh=WYsoRwkOHudnoSsPvnRevt6pm+mefdTqSapS5MxZxOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=izJnIcdher7YSqUwsqtdZRlnS1yFmN9xsLqKWxHRQWWJg/H8AIOmar9IHA2Oguj7g
	 9WPPJYx+RSEejjF54PW+qLgdtf4B++4MIt/h5LbBZ2j8+QE2WERaT9Om+iuMEQLguP
	 Hv8RyQ8EY6tvUINexsLE7ISpxurJ3621sCOq29e9mduoGxHn6IqaRQ27qXHOkEgGUm
	 d2mQkst00S03eNOGHpylZL12YwW3tjVNPpmRcLM3braRAzIyJ4qpJUOVCGDDgHM2NN
	 6KyIuwz3Z6pczAZInqpRNgFripiSBe/BQ1YXIiJK3R0t1XkWhxcD+9LreKEv1HPPp+
	 w7YVzUVgm0dSQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: ipq5018: Add MDIO pinctrl and enable MDIO/PHY on RDP432-c2
Date: Thu, 17 Sep 2026 20:49:47 -0500
Message-ID: <178969618809.1582337.7503084745566690118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Sep 2026 03:22:47 -0700, Luo Jie wrote:
> This is v2 of the series enabling the two MDIO buses on the IPQ5018
> platform. v1 (this series' patch 1) added TLMM pinctrl for the
> external MDIO bus (mdio1) and is still under review upstream; it is
> carried into this v2 with a clarified commit message noting that the
> MDIO pin configuration is identical across all IPQ5018 RDP boards.
> 
> v2 adds a second patch that actually makes use of the MDIO buses on
> the RDP432-c2 board: it enables mdio0, used by the SoC-integrated
> EPHY, and mdio1, used by an external QCA8081 PHY, and describes the
> QCA8081 PHY node on mdio1.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
      commit: 2cfae284310731888f4899a01d147baf08a58ffd
[2/3] arm64: dts: qcom: ipq5018: Enable mdio0 for SoC-integrated EPHY
      commit: af0ce879f4149002117a4a2fe0bfda217ed1a6a6
[3/3] arm64: dts: qcom: ipq5018: Enable mdio1 and add QCA8081 PHY on rdp432-c2
      commit: 5f3324c8ffa5d5fd35f1075b4d02d845f1b4afa9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
