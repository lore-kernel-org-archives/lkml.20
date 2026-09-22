Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124925625F0;
	Tue, 22 Sep 2026 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092425; cv=none; b=RbOvsdZ1PG+OAao1QKa2rGOMfi3bCENr7fBmYqJ8YKDEB0r6n/PXeiimXrfshtEcfoIRYQdrQBs31sAFzjPN5FpK7HU1bt78AASuD1ec+vPTMcFwFEiO7zyac4JrzuGCSqtWG2TGbdVTh9oQ7cRBmE8itqW1h+ul2jkaP+ZiK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092425; c=relaxed/simple;
	bh=3ChWs2pDTHO7QEV7kj6pltlXtP5WYrjjXaAW9FYHphk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OlnbMdieJ+6SC/69OZiao+2+vuA18h19qcEwDRAPN3ZRKxIS5CD/zMPX3xBAvvoItHKNINMGcSTeVIYIl/AKyV6gYd907JiCJOeWvc0/WohyImFR3dxhCRW3DV/GeaSCt5R4V4wqN3uuo0lFJ3nzcgXfy5PSP0tao0/bKpBzMNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUEjF71t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUEjF71t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BE61F000FF;
	Tue, 22 Sep 2026 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790092423;
	bh=e1H6Ovd4dWoYmSpU/twmjVJE7c1SE1Plmm0YxmV2orQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lUEjF71tb31xLRAv0LiSHC+gmn19aiu/DxqgcZPT60srF0Q9NQDWD8FFCbENVZZjb
	 f81/TBdeczpuuQEEy7vmAD9UbgD+AgIaZg12cfrMW0V1MG2l+uFyeBUYKqa/NyRILz
	 K02cq9oMG+5yWC41LJKJWydi2JbswRiQFNz+q3osZVGkB2MmjZF5/Ja9GnzhcphnZm
	 Akqch4ufj/4cTkD89tmVf2Rxns8S4pBUNOb48qUewatXowo+FxFlerxS5kFaYCfDx0
	 7YQcu2Zku+4mB6wQE2qZpoEIfte1tO9/LV3u0n+VFodMf2fGqbKf34rF5hPrHb4FVX
	 b9R9Z7dkHsf+A==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mikail <mikailb1998@gmail.com>
In-Reply-To: <20260922123029.534152-1-zhangheng@kylinos.cn>
References: <20260922123029.534152-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7
 14ASP9
Message-Id: <179008364624.322763.16751157398960636794.b4-ty@b4>
Date: Tue, 22 Sep 2026 15:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3ChWs2pDTHO7QEV7kj6pltlXtP5WYrjjXaAW9FYHphk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqsqSDEVxO8Dev8CRVYNjmG0XPReUBnYyjB64CU
 GTPwQlNgL2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarKkgwAKCRAk1otyXVSH
 0CjKB/9Bgl/AW5bVxTucj22ha13AigyN1NB5JX4W81fgCO8CadSkam68fjfrvLJkaQ7uYwmuDz2
 n3/ozv3N2Baxrvcf/hu0nfU+bhbKutKx+8z0ToEoTMEiRqnVk+sVZdGYTBwsPm9cAyDRx+9v1PF
 EfgHXz/fhf7YJmft8KEpKzimAMZ81426EwYF9wXqdanmNFqevtOxTlxBRPQuEaYIKY4OF6e4Xle
 /QJz4cV7Uc3FTzR7XvmgSw4hzFBpG3Mn9OzETgMqRN9Cw8qOb912so2OkaG1/kg4z+0YvVkvy49
 JipIm43V43uJYPfdlIZwAAGgIGzzQ/QJrmIO8f6KK2SUgtVI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 22 Sep 2026 20:30:29 +0800, Zhang Heng wrote:
> ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7 14ASP9

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7 14ASP9
      https://git.kernel.org/broonie/sound/c/5d35f9be9b54

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

