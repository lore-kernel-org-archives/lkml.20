Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7433EB7E9;
	Fri, 25 Sep 2026 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356239; cv=none; b=gjn56EtlMz8XTCe1fgb+8kas5+9evNvgBRW1hKBqvBkaNUI9qgNkOk014KoomZW5IoAnwiRVJz/t8IZhD9OAgRT+kxHEhHyS4rukUDemUlW2Fw9UYCjAaOMf0MvpKxQTDEb6vETW4YEChnRuCWAip90bn/S6DLWdmll0bQxpRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356239; c=relaxed/simple;
	bh=Ygqvb0nlPaV2Tf1xs/WFIsuhcdBhupvBv4nz9MxBXLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ft4LoZNPGEcAWbgwrKbh7bmyr8KXs+LygLbwGa9+9vxMwVfkszvEYaIHw/YJSfeoCWABV08YsF871nlJNXofS+fNaYBlrHFXIvY+DyYESMRYtmhaq8A3CiIOhP41TCi37ZG2wHMuVE6aO70YYrJHbAm84w3un79l70k0L4/qsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgjFgC2H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgjFgC2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC601F00898;
	Fri, 25 Sep 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356229;
	bh=a947lQXWFeadyoA8ZzQD//GcVJNTHZjVpoL9FHAmVxs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JgjFgC2HUqN2PMD4+bvirjfcFsiUzN39k6I60NkYatuLekMqxaF9EsIiz+C8VBkt+
	 gxiXaP5cKcNuCn4JhNZ9htRAUNaO2PvWAaZE0vQDTFm4v6k67usU/mDV917Kn7zz01
	 S7i+tUVdMOwsQPWRItY3E/YA5sFE5jvlmHD8WKAny+qYbsP6d5MS4dq94gsMcEuPw7
	 E6M/M/0oos84V3FRZorLESVuMISKyAlADDWe89u1x5sz7L5vcjAwQodnBmTJT1C9rV
	 YQyDH4s1FfmjxziNdhmGFnRbms1aZC3HVrZ9RCoeFTKR/Ho+M0LhtTvQr62s1oi2Gg
	 oR0lQASVozmKw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, phucduc.bui@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917121136.32527-1-phucduc.bui@gmail.com>
References: <20260917121136.32527-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: fix pm_runtime usage counter leak
 on error
Message-Id: <179029056919.149798.2550909245601802568.b4-ty@b4>
Date: Thu, 24 Sep 2026 23:56:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ygqvb0nlPaV2Tf1xs/WFIsuhcdBhupvBv4nz9MxBXLM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtqsBpL0yr2I9clwK5nMo5F794PRyhj5Ua/Pbt
 1Q7dQ9nrNCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCararAQAKCRAk1otyXVSH
 0CWmB/9jIMqCR7aRiebLCWUIMbe5eD8fiaUTAANBQCOUYWiCn+butoMhZ0tyJiLpJu+m135EaPl
 axwFLp/zKBFgI0Sp2aP/PIVF0rxjvjfCJVhh19i4hh1CxKML1dUYUlal2SmyY9JA6AthEzLki1e
 HjwlFKE1MKJZnCPjNTJ+08dIpvTAxxvII5biSU5UAiEo4/6lM2UT6W3DRqapieQnnteZnS0b2fs
 0Tf4iJYIt3OH3WIjwXQ20hzrMlDCyf0t9O8X46svIISDe25yzlju/gYNZTmDqnBtAjx3Jrhwzwx
 c8Bu2WcEb+2AnptGzWj5oOmPFFHBtm8WzmIDP94gvuZN8EkG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 17 Sep 2026 19:11:36 +0700, phucduc.bui@gmail.com wrote:
> ASoC: fsl_asrc_m2m: fix pm_runtime usage counter leak on error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: fsl_asrc_m2m: fix pm_runtime usage counter leak on error
      https://git.kernel.org/broonie/sound/c/5626653a4bdf

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

