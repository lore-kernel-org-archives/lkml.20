Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80C345C710
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151061; cv=none; b=ON8B/PKam96mIuNnnF3rLb6jDdGeJFA2/PJaFxfawdowKfLpsqGMHIsbbZYsjvbSuPzGQjxMNjv2Owt7mDYRkBCKaljX/jcsknw8F46VTxpmilum7XT3cbln4SLMTifc/UHdaYPE3sLEsuX0iJDn9jYQt4foszKK+Q6ifm2/V/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151061; c=relaxed/simple;
	bh=VCfYyHRzUVPdSNy14QWXl3XOLLrNLd3DKJe/BuOlyhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ejcnznLMLHTaehgLMZiI7DW/O3uZooaUJ5AY6KgSKSftioNG9eVZYWkkgClV1+TQwAwoFhkPDJegcPjNHRb8BJs6MsD2lxWuDClK/KBeuroSxjT4GbR2kKWYRNP3LzdnnlXYYf+5UDGLgnau//y5FsVlMxPlqQqRiHIiRio/PyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsflTs+K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsflTs+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21AF1F00893;
	Wed, 23 Sep 2026 08:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151059;
	bh=UTDO/Z8SrmO27oPWzuICXmvSiHSBtHObITrdKf8sp+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HsflTs+KOR+yHylwTNYMh0GxLNYVvAYcGdu3YSMx8luOSSJ4WSiF6t9djXqrgFVmt
	 ABNdH4YbsVnhR5VXah3FKJ4U2kZkcYb2/uHlUfh3WSe2DcV3fPpKS8xC2aAAhBT010
	 91/TbAt1xy/uEjVqkK1F0zSwPmyDoubv8p/9u9aM8dz1+I+MD/jw1s1XeQzX2NZmF3
	 1HTR1xieWIVefXDSBiMwBwYkOqZ96OtpT0+tbB5Di6jIj+MOlb2W9Yg28Bo2nXlHVJ
	 BAsvMEIeuHH4PsVJUlnzEH50Ir75FTpG5iFU9AAETKGvk+17m7b+sXUdsWk5sX6zyc
	 duo/ADxwOp/9Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260909143957.9284-1-jszhang@kernel.org>
References: <20260909143957.9284-1-jszhang@kernel.org>
Subject: Re: [PATCH 0/2] regulator: mp886x: fix two issues reported by
 sashiko
Message-Id: <179008499844.322763.9887026761908885770.b4-ty@b4>
Date: Tue, 22 Sep 2026 15:49:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VCfYyHRzUVPdSNy14QWXl3XOLLrNLd3DKJe/BuOlyhE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqs4mNW1xfJzLeMddsgK1VhXqZYPs+e2pF/lpQh
 vhZJo1NYyCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarOJjQAKCRAk1otyXVSH
 0G8aB/96RhNBJi4tGu7Z2MqCNX95nAfERuiZJQT5xDQjYNfPTNlYmPojRu7AF/2+Qt5XcjzHQWW
 x5sCbnPxzM9diyyLyIv9dwpwXW+fwdjcSFFdQPy67Y3XgiFg2SxW0wjidoCjLJN4JwEfOlJt+Zl
 yCa/8nzKAYXVDBVITJf3ATnH966yApXTDSlxpkEWUq5ojFh9AGZr/rfcrDjCDsTCUk52dlsBZ1S
 +njSfEA2zeHcsk9uD8FJPuUkeL7WHcU33CTOFsn6udZyJ76GH0QWJmsc5C3v12Fue3bUErMnimu
 GNrv+VqdX2TltSZ5SOLk0pgREd6XtZ9dh2r7aZRHQ33pzRsT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 09 Sep 2026 22:39:55 +0800, Jisheng Zhang wrote:
> regulator: mp886x: fix two issues reported by sashiko
> 
> Fix two issues reported by sashiko.
> https://sashiko.dev/#/patchset/20260901043123.5401-1-jszhang@kernel.org?part=1
> 
> Jisheng Zhang (2):
>   regulator: mp886x: check get_voltage_sel() return value
>   regulator: mp886x: fix pontential division by zero
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: mp886x: check get_voltage_sel() return value
      https://git.kernel.org/broonie/regulator/c/87121c42fadc
[2/2] regulator: mp886x: fix pontential division by zero
      https://git.kernel.org/broonie/regulator/c/d16ef5debccc

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

