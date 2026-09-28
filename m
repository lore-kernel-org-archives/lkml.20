Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138613B42C2;
	Mon, 28 Sep 2026 18:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621412; cv=none; b=FXimVkQz6eqUfUxEPaq9HXMEsFtdbymooRlbhmlPN7horePkPxnvSvSA9m7XMab9RewjQmL6GpahymKc+jCZO9AbQj2ZOCQrd5LAs1AEqVarY9CO7awKWhck8vnsrtLj1G2/pPv3/Xsy8IV8JCUR3vmxKhUfuPIY0v3PVSKwwko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621412; c=relaxed/simple;
	bh=FMFzkLVVgLCGH9db97VvcU4k/c6OvxIkLGBWv6AjdCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qeoLDzXJ7dXrX3qPy9W57/agsD6IiirsrTV+2C1gXN3JyllfCfdtaK1Phfzb8ElzhZnIg8s63Zt4j+QJ7ObMxmnoXBd4WmTY80bQ5l4V2WIrcVC42DjXuyy4rGxw29K0fXCNmmIIyiLrZeRCtqFQyxsowxrKsZsv4+8+SA7heIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRxZqYSl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRxZqYSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88F31F000FF;
	Mon, 28 Sep 2026 18:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790621406;
	bh=3+n2mVuIEgM3EWGwHHeRn7sW7tEvgtJNZAIqUF77U+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YRxZqYSlkGRe915ivSV2w/znFodswXP/tHDm/sUj29phlN7F57eY00LmiDdAQmttv
	 My1NqTdcHdTyBCgiqBmisJ5rR5Mkf4M1o9oZ6sWRa/Id9mP2eqRxGeaSDa+B4yPzDA
	 wweYnXz6II7iVTXFPPupSFZxedTWDPhUI7udlZU51MbrLwp9f8fV6O+OQXLo4GDRgc
	 qNZ2kFJKFQWefSVcicRegC7fP8UcnKCMc4nsM1zaOk9R6s2b1cwEjoM47OhSjnFTgw
	 tyz51f1l/n2iHt6A8NtAKlAnWOeJ+Sgx5d5I4GLcCy/3MU6+elDnVT4yuPkT1JJlGC
	 7BIgy+qdt7YTQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Yibo Tan <lhfff@tju.edu.cn>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922185057.954150-1-lhfff@tju.edu.cn>
References: <20260922185057.954150-1-lhfff@tju.edu.cn>
Subject: Re: [PATCH v2 0/2] ASoC: amd: Fix borrowed ACPI codec device
 references
Message-Id: <179059816494.139547.7622754165790573872.b4-ty@b4>
Date: Mon, 28 Sep 2026 13:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FMFzkLVVgLCGH9db97VvcU4k/c6OvxIkLGBWv6AjdCc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqurbaLz8WYhOWhcBHb4tZ2sXxzlfZwDYyNOfQ7
 iPKO7DEIjSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarq22gAKCRAk1otyXVSH
 0PGNB/43jx4QRi1jVZrI9ilFNPOM+ast4D/HYmLH3KV/YscBcuC8kBldwpkBwxOltinKr/jfr+p
 SGMchvQd3CpkFG0vvaQnHnsm0kIkdcdhQvaR/kcO+57GRRDWOOg7aWy+5YMNStLoBkQgjMPvRb3
 GQfxOfrSoldyxBYyr6UQEOR2L8YxrMN+isaPO+FeJxUUZPcXMU8+gVdu5SUrorVx7qFWrsu/QI0
 MKJOJSoHF0z8x3de7KrED+Uqzqkvz2Mfp2ftVc8NOvCWQcYMTtT+qxsPRVIE8mrHGrJDIZY/yFl
 NeoesiSPgsdQV46z4DuEpl6MNoF7ZcNTFhuBmUZ6CBFpu9vU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 23 Sep 2026 02:50:55 +0800, Yibo Tan wrote:
> ASoC: amd: Fix borrowed ACPI codec device references
> 
> Two AMD machine drivers treat a borrowed ACPI physical device pointer as an
> owned reference. The ES8336 driver drops it on a GPIO lookup failure; the
> ACP3x driver drops it on an allocation failure and also stores it beyond
> probe. Both paths produced a KASAN use-after-free during device unregister
> in focused tests calling the production callbacks. The corresponding fixed
> tests reached the same failure paths without a kernel diagnostic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: amd: acp-es8336: Use an owned codec device reference
      https://git.kernel.org/broonie/sound/c/c257e3bcb36f
[2/2] ASoC: amd: acp3x-es83xx: Keep an owned codec device reference
      https://git.kernel.org/broonie/sound/c/095025078dc3

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

