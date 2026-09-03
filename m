Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA03955D3;
	Thu,  3 Sep 2026 18:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461320; cv=none; b=KBJ+sM4VxMxr4p1LpzNcUUV/H/IWvbNIemPmaoP+3no/pKnYoICE/zCXakytQbyDNVqc0Gx2Nqwyt8EQ1bcgezGMu6e+WH7iTZYo1ImAGlICoP2LFEq2lGtVjwJ6Petszsdsaa3iDAk87zlGD4+pvC1pY4HLWuLX5+IdIKBK1M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461320; c=relaxed/simple;
	bh=j85kQ6FVIHTIfJc0oSl3uHsbBkubGX5qXUjPZeXYrtI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B33+yZk0o7ySpKePqd9gbOfnkp8x4ScJKE0uLcNW40MKxLj1hXPrReTiygXzHpA9YOTtEwD8SjjnCYpy6tUc5xNCF0++VAzJZoZHG4lJLteNBRUBRsQWer3cftCMrXbYOat2ohvSWV/nDLQ6ubQ6BilY+o5IE3yKDz1fj/nfAW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jk9T/1RJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jk9T/1RJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAE21F000E9;
	Thu,  3 Sep 2026 18:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788461317;
	bh=Mrz01Ds6iqlIbpFcD9cIZ+V+IGnwO5cyaNgYNt1PqeE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jk9T/1RJrryoNfpehSVZ7rsbhSFYIJC4ArlJg8oFhqDfwgfIEFbipWlr+87uLlrzJ
	 8ggM2KSyTeJvcAIQDeW1CkkM1Y37/q6uxEEk6OCYadrKdPAUau8sua7FanxtMO9Iad
	 7ImP7ck0xbBGxxUndp5SIy6xJH3+TP+Qvb9htiR6v6W/8nCjTQHT9uCh/lJ0qASx+G
	 yfHYC2IKNiaBqfopn/1P4sJ4QiyK7vq7YGx9Uj/W+EcsqLCp+XI+DCfNXv3i2VUgYv
	 fNNnB1p3eATattm8h0BsTCV+B9hFRGNDdrg+QhFKDa1LWaFjTVm8ngvwhcFri4C1DD
	 sfBo+KcehRCjA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com, 
 =?utf-8?q?=C8=98tefan_Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Cc: kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 Vijendar.Mukunda@amd.com, perex@perex.cz, tiwai@suse.com, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260902155332.171140-1-stefanghetu9@gmail.com>
References: <20260902155332.171140-1-stefanghetu9@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: remove unused regmap field from
 imx8m_chip_data
Message-Id: <178843981362.7659.12965570425177027425.b4-ty@b4>
Date: Thu, 03 Sep 2026 13:50:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=j85kQ6FVIHTIfJc0oSl3uHsbBkubGX5qXUjPZeXYrtI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmcEAXeQPhddER+t+E9l1uum+ZHV3ZsjLJO274
 pm7C2DxX8CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapnBAAAKCRAk1otyXVSH
 0Nh9B/9IY20sCWl6xvL7Bajn7w2XfCV/MgGW+jDT6LcO+BmXyuiqp4DU5sxhcSTYCnSFRbdpJ6q
 FoNA7xHjW6silebAEYEWQ3mOBgPx3iKeY61qIhvCHMiQ72I/SUOV57EsVpd5gMl9jvEbAmBKKqZ
 /Msd96KSehIIPZI3vRsDiwj6hgUzVuPPUTzvgGxO4PXNQDubU6bEwmCWPAdDOe0ACVA6xg18CyC
 aRsNJZPxEyN4Os3hsiB0uaZIbZhYPM8NL5coyUXvNjQBiELTgMhWbKofhGUWar2CUwU5rgRXHML
 spjsNdW2ii4+J3BBAZdfVmyKvtEwBwr6c8aZ73dN4eODrpPC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 02 Sep 2026 18:53:31 +0300, Ștefan Ghețu wrote:
> ASoC: SOF: imx8: remove unused regmap field from imx8m_chip_data

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: imx8: remove unused regmap field from imx8m_chip_data
      https://git.kernel.org/broonie/sound/c/a95505795efe

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

