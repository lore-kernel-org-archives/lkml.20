Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63F7436361;
	Fri, 25 Sep 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341903; cv=none; b=tOmzvgnxQFWTGFT7uqUDu9wp44tNcLoenWQhu7/HyQ2K3/+6TYwRqkmD0E0JOQFWT31NfNI+m5b1leI2IqJPaw+jxlQ5TPCRkbnMGkrUy4AbNjcIQ4Wuax9pFOmcCcUCBLk2y4TDwYk4JB8qCl+uG5GoXP+n7Jh1JzQI3Zjy+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341903; c=relaxed/simple;
	bh=Jkf+TSU2XpLI4RQYh+Udjtd55NnAoRLgTlj07ovHUoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HoN7NOLQhhnZNqzzldnTBQVmqY/siYhqPGkvpmtRSK3+nz2MnvBP65H9JiPtjQOnhetWVatiGm6lBR7PXNUYdjrO37X1CHVzXVqB3on1Hqq2FI84yZHWeeAwb2XfZgq4fWlGkzET9cAdkmj6ov2qJFLd593YmKTmqxoVrDCWOWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/YyIVpG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/YyIVpG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0462D1F000FF;
	Fri, 25 Sep 2026 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341902;
	bh=JEsJz2W2yJCordrhFoYq7RabW3fzUyCQ1caXjYkcWLw=;
	h=From:To:Cc:Subject:Date;
	b=H/YyIVpGbZ+G9I5RpHXu9fK8y1yyt3wVBZ0XFC+jkbvlVKl2bOgPiuJI4EC+z9JGE
	 qpKFR1nhlmsYXoBTg8ixN3MQ2e1DmiqYmbTI6ruTctoqJVIrgr/8iAH7RJHjVZ6esJ
	 QfuAQ6AxbSDlC1ChYysIN9CIPU8zids/LeGP5y19krphpFJFnAsv3JxMLgMNEGymNf
	 8zqZBm219jf2nceFBIJj1hTYQpI1zkHQn96oWHS42ryQyezcCxPXUsr4p6SQig6Zv6
	 MQWngW9Cyh2ntcbaCXx/9G9ik1GaQow5Caw9jIVuBPDqgrtaHD305CckysOLY02Jc4
	 NICOXJ2tkuupg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp: add EFI dependency for selecting TAS2783
Date: Fri, 25 Sep 2026 15:11:27 +0200
Message-ID: <20260925131137.146638-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The TAS2783 codec requires EFI support, so it cannot be selected
unless that is also enabled:

WARNING: unmet direct dependencies detected for SND_SOC_TAS2783_SDW
  Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SOUNDWIRE [=m] && SND_SOC_SDCA [=m] && EFI [=n]
  Selected by [m]:
  - SND_SOC_AMD_LEGACY_SDW_MACH [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_AMD_ACP_COMMON [=m] && X86 [=y] && PCI [=y] && ACPI [=y] && SOUNDWIRE [=m]

Add this as a dependency for SND_SOC_AMD_LEGACY_SDW_MACH, assuming
that this is only needed on modern x86 machines that require EFI
support already. It would likely be possible to do something more
complex to still allow SND_SOC_AMD_LEGACY_SDW_MACH to be used without
TAS2783 when EFI is disabled, but I cannot see a usecase for that.

Fixes: 28114992dd2f ("ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/amd/acp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index ed0f93a5a7e5..ab49712545b0 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -167,7 +167,7 @@ config SND_SOC_AMD_SOF_SDW_MACH
 
 config SND_SOC_AMD_LEGACY_SDW_MACH
 	tristate "AMD Legacy(No DSP) Soundwire Machine Driver Support"
-	depends on X86 && PCI && ACPI
+	depends on X86 && PCI && ACPI && EFI
 	depends on SOUNDWIRE
 	select SND_SOC_AMD_SDW_MACH_COMMON
 	select SND_SOC_SDW_UTILS
-- 
2.53.0

