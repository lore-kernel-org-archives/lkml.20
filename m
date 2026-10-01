Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE251EDE1;
	Thu,  1 Oct 2026 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865574; cv=none; b=SGbNkFa1UkcToOFXWgXADgHxqClLKlTUmBq6DkNe8W/doC1rxM68RESnoezyxYBi80Xy+IfEpntQQqgosBp4DNV5/M6UJrVcBJQQaVKXZpw/Ec5B1Yg7xKZsNWQLEEcuEHxoX9pQZ5bIpg2FqV3BmCKzoy7iiWA+6gwErFOGMi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865574; c=relaxed/simple;
	bh=m1Qos/ytuLx9+BJzhPoLYNPuMhLDnsGYZtwSiEP5euU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rFVeYa4ltLooK8R5TnNrtFkI5H9Ry/TTYc0riDu8upXtAFTS7oUBAUKtl5hPSwV9qI7AYDPVe0q+TCFLvxQoodZW1rGDWqdoRLOPsTOCe5Rzmv/fZegAX0yljCD1Wyf23bDHnnPAARtWWQ1lT5uV6CmNCydS67SpLBVMUGSthKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP0n4E64; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP0n4E64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EAF1F008A0;
	Thu,  1 Oct 2026 14:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865566;
	bh=MKou5o8pC/qp1xQeHPTcTJqEOQ/OQsdfgpBsfIAgOWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VP0n4E64jNUVF/hiRMp59GDxeJmpNiECtbDGf0187jXQ7lExY+5AEUgmLPICMeUFU
	 vWD3qZco2tl1Rntf6nu8GU5IR+iT4qf5diKd8ANIu6rnKDR0CAMIPABMqDd4nsE+DC
	 G4vjUJuOkmkdGYUCjgTcCeqByb3TNoq5GB0xTYJws6To1Zh1KyuOAgkgcda/jMIEyE
	 MdG1jxQLyJwgpY2rB6bIg1/+uW3JuyK78Pfe0mHyjy2T6Zr/Ax73mIv1SWykOatVtR
	 HXTjcDVU7wxR0X8Lf2Q03zYSVy7w365gMMsMB5NZ8tAJ5TNXzydiAvFeYaF+E73dng
	 /8oGkR86xzc/w==
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
Subject: Re: (subset) [PATCH v4 0/3] Add subsystem LPM stats support for Shikra
Date: Thu,  1 Oct 2026 09:39:09 -0500
Message-ID: <179086553005.3495936.5886424226090578323.b4-ty@b4>
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

[3/3] arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific
      commit: b3e06ee996cd12e96a77000c181f01fc37cca9c8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
