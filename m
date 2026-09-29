Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6ED3F20E8;
	Tue, 29 Sep 2026 03:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651751; cv=none; b=Q62BJDqK9sFdSYx2gHAg7aoXXDEk+KgPxR813pfma73drnvHgufvobdKKLIVp2ywdObPQTB8QBpuvC7/cP3TJlO+wkt4nU2PsZcKAcdBtnfTNyD7lWQdrLvEPwueqih9IiAt9zpgYn5DmXKPsoqKIk5+mj3vIWTNIa21Ya7ZUP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651751; c=relaxed/simple;
	bh=72/F2aNhuSnc3MEbfVSyM1BAb/Te5/TQjhwJ3SAy6lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GpErRRDE7aaGOgT/6MV96UbLtynTjUtJvAZx+S4rN4JLi3QbVGhBXf59N3ta878kBOv/dcDzTYZykvNxW8ntqvZbMaOOjf13GD6qDvRzhboWUErKR6UtMNJ0kGnankJsCwg/DwdRNx/I5Mptt+ebE9OK5DBZP2u7LfR6nQbEZdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJ3s4y4D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJ3s4y4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811DC1F000FF;
	Tue, 29 Sep 2026 03:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651748;
	bh=AI6UoST/jDauPauCWqJFOm84ifgr+WJw7qrObpigugU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eJ3s4y4DIZuySQhubqf0ybFkP43sBEi6mZpWSl11tJsxWhTcbKN391HD25JT2gXmg
	 /+APYMvsQ5vMyJuo5sX/XGHIhzvLPk6TnZlfz5opjHwQJZtJRZNP9+/aAcPhFjkGi8
	 +WNyHp3L9w73942RNGb+xonPXz47goRIN6XflaZ/oy3UORiXmJ8zY1fiN0EsncuoUs
	 wXw3bzBJ1DvMzmlMv9dQvq7EIA3NEhafhw3qL9zs51aN87riQG5ZZMlyM2xkBwoMKv
	 O9qQMRekvkQPgzpNvesZ2ktTpxShYasPJOMXGOps4HtzhlkJnLGlqkjdNpfL3gaV76
	 WJG0qIszmu/gQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
Cc: hangtian.zhu@oss.qualcomm.com,
	miaoqing.pan@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add PCIe wake GPIO
Date: Mon, 28 Sep 2026 22:14:46 -0500
Message-ID: <179065171033.2673486.15991071931097951658.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
References: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 06:50:20 +0530, Hongcheng Zhang wrote:
> The QCS6490-based RB3 Gen 2 Industrial Kit cannot wake from suspend via
> PCIe Wake-on-WLAN.
> 
> Add the wake-gpios property to the PCIe port so the WLAN wake signal is
> propagated as a system wakeup source.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add PCIe wake GPIO
      commit: 9910a98c1341dfec409b4a1f7ce57ced7c143b5e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
