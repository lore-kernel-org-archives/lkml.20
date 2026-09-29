Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105863EEAD7;
	Tue, 29 Sep 2026 03:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651790; cv=none; b=gPZBOHt2xMPhqep3Xua9a5fnbtqQS7SDYH1Dmdk3RnhcdgFO1lnzS/PbVoIIquChv+KGxkQ1lwB1Kk6cRB7IwqteyUzX/ziIzpwIPSJkuTPokwlzucENZSeOtCJzGi20ZSZpPR2a+KOWkEcDZkcOFZGdLkJjcXB2hifHMgZJXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651790; c=relaxed/simple;
	bh=VG7ZSYfwj4f3avD2hojHkvp6hgUfYEPJxfXl+qpeCzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvOo4hI8YzwckvM+TQMzt8KGaTQ5Rf3Zx2kZPr7AT25HxV9/VuDLKw4hvf8lvBUseGdozBw9C4Hz+DTjLijFrobgnYIVL4nOX4dFantu3qtMFryIkPKI6fnet6aEieYG/1Ll6pJuNrCpf2zDGOg7/MIYPjHNc/PrIMf8FT3oscw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA/BfhPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA/BfhPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA48C1F0089E;
	Tue, 29 Sep 2026 03:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651778;
	bh=a1PuxGYyS5aHjQiZwSY2J0YqzhmKjO5y0LAntG0yZKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lA/BfhPCRE1mXbiQAGPylPS1obmTbx13eg2qzJB+lu1XhL7PqzczLFabddb3EU+rP
	 tvYDX0D+OkDAmweZD/L/Wo3opGVA1sPxsmKJluhX1HztBMzOYqMhe1zEJ26f4hlwrI
	 6LHG7j7stCkMjsplC0y3FwZD91OAyU8mtVaMZZ9ZSbKw7M/JvKuZFWvTxow90pDYUP
	 6y7ntIioxQE/jCm411Ra4gP8w3Uqi7yJ6F6APEtbyOyITpraDRjb0FOJl+FprxZSen
	 J1edBlrPE9KBT9ioj3mSiSCecb3E8z/TdX6dK+2uk0unnbTTn0PDLl6ow/0LaJWwiX
	 1xBlqMNK1jgxw==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/8] arm64: dts: qcom: shikra: Enable audio on EVK boards
Date: Mon, 28 Sep 2026 22:15:10 -0500
Message-ID: <179065171001.2673486.2346423682930035847.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Sep 2026 10:07:29 +0530, Mohammad Rafi Shaik wrote:
> This series enables the Shikra audio path on EVK targets by adding the QAIF
> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
> board-level sound card wiring for CQM, CQS and IQS variants.
> 
> Shikra EVK variants use different audio components and processing
> architectures:
> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>   PM4125 + Rouleur codec components.
> - CQS uses modem-DSP based audio processing.
> - IQS uses a third-party MAX98091 codec with modem-DSP support.
> 
> [...]

Applied, thanks!

[1/8] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
      commit: d5a42f092babbd4af6c9b976581bb2993c9f0be1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
