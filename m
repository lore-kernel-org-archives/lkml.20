Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990325;
	b=elq2y8xk1UQDukmab+C0W+KuFvH2s+s1tGG7VABegkxzbySFx1mte83l94mBT1GOGV8D
	 ZPevYXSAPVeIssNJyCuYoEOlcsd13Ai95RiV2JfkK/5JHSgO4bxlKVfxw8lgOpb66l7/6
	 aYsN5X6VxALB0xxxvdDBINvSWcSdn8XEGKgNi8YcLlbQM9ikdXkEHBx7ZEzhozZoWolKW
	 /BqTB787WfoLsWW3GAi7oeFBYPaoClpkj/m9ZDds6hLbKyG6GFjGRnMjbUaTtNkQdcsYV
	 NrzTLGCwo2//8SINxZy4QvHvyaa2MhfzCTyujPMsZcugguGBfhfrnRSuG6RirSUJZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990325;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=siSMWyKHYtT430AcTInkTgvpD6BqnxvGGKiwRvbegts=;
	b=BSnY/mFw5pq8I8hlcInJ/3HdwSzYaZn2lCIe17xbqWIveTBB1VBdGFLHwP2t51jmUAG2
	 G12SRXfHHyceKi3IDIP+79PEn79abB0c0SNggbySnbJ3K/Mx0CiyDRzBxC0k6Ch+B1KUW
	 1NLTvTSNzpJrjPNbYPdJzm6Cm2w2LgxVC+QndxJ6JWUsXX/FFW7prex2+fRXRumKbVrp6
	 /NFeFTYE3f62wtn3R32Xi59KGOWCKUDyTTOKp086rwUujpiMzWAIJAmgi/JI+LKFU9dof
	 cILLigNYXWH57ZdygnxdZL8SYZs4DqXxo5wBmyDgTVBHlTQZ6Tr0r1Ydf4m+e4Kht+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Skv3xcFQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B5606A32E;
	Fri,  6 Nov 2026 18:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Skv3xcFQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC041F0089F;
	Fri,  6 Nov 2026 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990324;
	bh=siSMWyKHYtT430AcTInkTgvpD6BqnxvGGKiwRvbegts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Skv3xcFQMsomd32AWfrZDOwtwAUNlKsLQdXa78uo+AzHpdwYqoqqegKDaydbuCCDI
	 euectr0mwJBFjHRDOsF8QtG1VlDL/29PbbU/eKEwN6aBWKE3ZN69CbwJsU6Dq9NfQ6
	 rNuqKsm5vabNh86Zzfxewnvk4z0kb7CHaIHkmcj0Mh8yBIAjXp7+QQSIKYhp01Equ5
	 MlqnXS5DgC01frooG2jw8H2hsoc8mOiq+Y7s9I2MBaE5TTp3l1EN/FtQwakCJnsT+v
	 BjZPdYp7pg3fEYck5oBPa8EYb8iiVPRrQfpo6QGKEpnMRettlt7dcT4GTnuJENHInC
	 pZHPNiR7CnB6w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id B954428D0FC5;
	Fri, 06 Nov 2026 18:38:42 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com, 
 Poojitha.N@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261106130801.506026-1-Vijendar.Mukunda@amd.com>
References: <20261106130801.506026-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/2] ASoC: amd: acp: supplement patches for ACP7.B/7.F
 SoundWire machine driver series
Message-Id: <179397480411.3073895.2848070891789031303.b4-ty@b4>
Date: Fri, 06 Nov 2026 14:20:04 +0000
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fgeNflnNSnXr65iR6WIzFIwWrawCrsV5fmeh7u+k+Ww=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeyW16VtUst/JTtajhpsD4Tauma3m+5vvGw9F2N1bwi
 93NM4ZVHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIwT5Ghtvtb+pfHkr/0rR8
 5hepDZssPSrTbc4piV44ZHjq+5Um23MM/wsCjt4w5t8TnpFR1LljgVHH3JebcxPm7gkVzXdbxLF
 tKi8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Nov 2026 18:37:27 +0530, Vijendar Mukunda wrote:
> ASoC: amd: acp: supplement patches for ACP7.B/7.F SoundWire machine driver series
> 
> These two patches address nit-picks raised in review of the ACP7.B/7.F
> SoundWire machine driver series posted at:
> 
>   https://lore.kernel.org/all/20261030094714.1123396-1-Vijendar.Mukunda@amd.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: amd: acp: fix adr_device naming in ACP7.x ACPI match table
      https://git.kernel.org/broonie/sound/c/2e2f6b2a7cd4
[2/2] ASoC: amd: acp: document PDM controller topology for ACP7.B/7.F
      https://git.kernel.org/broonie/sound/c/a9a7c22d3e67

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

