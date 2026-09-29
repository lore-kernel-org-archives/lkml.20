Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B2246D543;
	Tue, 29 Sep 2026 03:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651797; cv=none; b=Ag5A2VwpMXLzfojVzTIXcFimstggvYvIZJP9vRBT7IZyyDDsZoSbGbjJabkybwFptyXX7wvzifwXsAaMexiqaZZyRcn1UEQgAiY0h5fs6NC3ZLVA/RvO17gGaAAfrVrkVDVmsRm4LiMuUFsyti3x2WK+RfyHBAqj4tPupSDJrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651797; c=relaxed/simple;
	bh=WC+X4fX/fdWUtS79z24z8oxc4udPgYi8Z7fCLybndTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CeMrNPHe+6dmdJfCbu8DymKpGLI9mVhFOdKcBM6ggzawVrYZd+ZvuCGktncgSIC7bMsTFrj9YkUZV1VP/2C2L5libZA1Iy5wYK4Jgr65NPr+pY/10z6khvlxnh+W7lKdl1GgKtIXzhR2tKP/fuZwslNQr3stAp7xkkDBvvcTpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8AcY7D4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8AcY7D4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAD31F00893;
	Tue, 29 Sep 2026 03:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651792;
	bh=KBwlDvS3mqCli0y7CzauZThf8Lal4f2uNlMwC9CDO+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W8AcY7D4CX/1YjQWV6ErY9kA22OiKAvJZBfdrwvvMDwQdNUCLEUy6syS7SPkrpgsm
	 hH5wMPzeVqRtyG2cY7X4SAU1e+R9STtoC17Bf1sBQ7l8NDs5VmplwNYwh1yR4vvAZa
	 eade5vnuLVA1HApbeAC/ys/VMc82T++K5KdjYHMyJKImH4YvgxHGJJFkx05H20iOcX
	 YjZL1ePPV+K0g+ik9t/T0+xuW2AbOphF59UHH9uO1P3C1FDajM3iwMOoVz+qEertM2
	 reVrzBwfN4Q1gScwbsLKiQBRtM1IE3OiAcB3bHNUucnxRzvzkZWvMW3MYyP6UA4cho
	 SvhFWtwdFEADg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] Add subsystem LPM stats support for Shikra
Date: Mon, 28 Sep 2026 22:15:19 -0500
Message-ID: <179065170969.2673486.3778989581263965642.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Sep 2026 19:17:52 +0530, Sneh Mankad wrote:
> SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
> present in SMEM for Shikra.
> 
> For earlier targets using RPM processor like msm8974, rpm_master_stat.c
> was used for subsystem LPM stats since those stats were populated in
> RPM MSGRAM.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: soc: qcom: stats: Add compatible for Shikra
      commit: 1dd7f6ae95ab28464bdf3314980e9822fadabda6
[2/3] soc: qcom: stats: Add stats compatible and config for Shikra
      commit: c12e3f05f15f13709a003e06bddb977d8845ad72
[3/3] arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
