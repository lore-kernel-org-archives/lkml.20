Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A02F3BB690;
	Mon,  7 Sep 2026 18:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807383; cv=none; b=FXNfBJcnmVV7waJ1i6pxICdjE3GRJdo9c8mcHialHBzCqgITlM09dlwK8HTL29GPFOuJ5WKsoLLyeIKZAHoi5Wtjrjk0Y1w0RNykN2pNmhUvKHUbiEwUgfuxGSCHXuWqF9iDw7WCxhWfVowcAGUYvsMt0BOim+MdDWheAgD5TSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807383; c=relaxed/simple;
	bh=YJfdtgGZEfw1Pm4Ff2jwDokAw2FuELUMKlB+6P5buDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RVmDiiRMONgiNqHy/RvIx7l5NeKxE+uuEpqgpvdYKvBqZQeqIS6F646PrH73TPyCZBO1DlugvFiP/pcsJxDmk+GeYTIxA7ycIMaA7IfdmYQayb9WZVE/YFhXT/bsY3K+tHS/cXQ2M7c/5cUngde6TmxB+1v5JwYTWPsVDJ6UL1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnigJ7tC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnigJ7tC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BE91F00A3A;
	Mon,  7 Sep 2026 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788807382;
	bh=a4/mLS+Hzx8w3Wy0ZXPzxistXfzJfxPMc5Ox0XORh2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FnigJ7tCG1456RaqHjOQrzbxW2L2ZLga3QVsZaRJAgvi7nHPw1lc8Zn3drc1117Bx
	 O0E/eouJYGLAexVB29nkO8e9CA+QCVSUn0EdcSLUiEb9GoqCCjIyEN+Hsa6Dl+GoUZ
	 79/v8iALJubbskWdM5O3O/1SkSWhqpQ/9EHBpI8aoB84ft0blvf8fYsfrxEMRZDGHg
	 61D3pAfodVwF+u8OC5Am+AreaPQT9XvBktg4WbkQURl5VzB5X1uhJOH87dYXBChR82
	 eQwNyoH1nvf/g/AZdqeOuIfeQJc0XDGNwDELblgxEuhyLqUpKPhIAb3hs49Tj7iAVl
	 btCyHZxVNvahg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com, 
 =?utf-8?q?=C8=98tefan_Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Cc: kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260902175517.209406-1-stefanghetu9@gmail.com>
References: <20260902175517.209406-1-stefanghetu9@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: check imx_sc_pm_cpu_start() return
 value
Message-Id: <178880426027.118202.15614393467053440038.b4-ty@b4>
Date: Mon, 07 Sep 2026 19:04:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YJfdtgGZEfw1Pm4Ff2jwDokAw2FuELUMKlB+6P5buDE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnwjRpg88crHkZamgHNrGkD2CROt2rszExG5md
 QMCgmZvwYeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap8I0QAKCRAk1otyXVSH
 0GtbB/91D+X48CgT07f7bDdZY8HdDIIR4c35qITmqkfCTwrcPQwVkdUtDkq+D/JIQPSrB1BvWh7
 9+ozmcn2wx3q6vtfpcvlPN62Uy1D/Ix8RwTMakjMmtM7I3MEsibScYWfJ37+lx+mQu/OhFwvO4J
 8mL/sg8y0tLg6dpUD8rJ5oCSk5/MF/JtTamDvqJ20+QzOhtgidhUGwPEPIUR+YZT9y3cAZo1oyf
 hRLn18k++1rAyl5VKAzRBJtwhQOKm55EsLywId4FFDrBJYZLFp/AlCTeXpwnLx31FugekdCyaHw
 +9oakr2IfHJU9GCGTUw6zeYdvwGWaJTdTownop3iPjMV4BWc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 02 Sep 2026 20:55:17 +0300, Ștefan Ghețu wrote:
> ASoC: SOF: imx8: check imx_sc_pm_cpu_start() return value

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: imx8: check imx_sc_pm_cpu_start() return value
      https://git.kernel.org/broonie/sound/c/88be49b2f848

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

