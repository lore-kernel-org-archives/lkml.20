Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2F3D9670;
	Thu,  8 Oct 2026 07:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443694; cv=none; b=A7uIRkEG/1PWzg4TUfIFDI1thffdn+mTgG5t+wLyoJI+zdzBEfdzZpvqbIziTzHo0AboTSUQaQXPx+yFx7SHc6z1FxkmBYtOrs+Ay9VZ3/6MOgQ9Fom4X5fPulQg097d5djYgnqxcPpZihUW2/qrc0qnJ8hwZ9zWUdFqTZo9fM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443694; c=relaxed/simple;
	bh=Ilzb5jKY1YYoiwzUfaH6DhfvsxJ/bhiaozZ2sC0vYyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pSVWFGbuS+xFGpub8Q7wDpS5X7mE88icQndhrhuGIXiz4DTykqxunojKedMBuVa7uQcyPxnGiryYtrcEhYCbPt4Oq2bFj8TP7V7BKm6a4gpo59iHCe7Bo1xZZXAsutjcsDXbpj9wu34sgOag+/qOjsL5d1GXxoTZVBT7SrPk01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDE0r5U2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDE0r5U2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BDD1F00A1B;
	Thu,  8 Oct 2026 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443692;
	bh=bKoGzYOtvJ3LB0wDJj7nQbArAeRBrTxSMmrqiJyTYVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PDE0r5U2zh04f6OC7uCuHnYfiaehIRP8UIBJ+7OIw+Skrr1rpiefvouaz9k5aA2fT
	 cND+1vVTgPSwyhj6GY2iS0uIORmjr8kNLi7+ISoCxgjVnevdN5QifeNenk8+3CLwJ/
	 W5updgfknoJpd4OcN0YeakL1U6uEuPWKNPIIZfNCSWXxKXYUdF3+Kdq8AQvliNXzpG
	 9oyJlH2yA2fds+MhTx6Cd3gEmd1z9J9lbSHWY1PtWVk5fWW0Sjvsdrqhylcl+noTP0
	 wTKDo71JDMGJcGep2PLhTDQfmWWxP5Nz2HhjgJEcge1vEJAaaqDpY9McZJowoFfc7z
	 /btsTaa44n9ZQ==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com
In-Reply-To: <20261007130857.102432-1-simont@opensource.cirrus.com>
References: <20261007130857.102432-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH 1/1] ASoC: amd: acp: Add more ACP7.0 match entries for
 Cirrus Logic parts
Message-Id: <179138289483.2423942.16809180109044382819.b4-ty@b4>
Date: Wed, 07 Oct 2026 16:21:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ilzb5jKY1YYoiwzUfaH6DhfvsxJ/bhiaozZ2sC0vYyk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0LnLQfgA2Yy9vTZp0CFMWXQNcyOP4I8NOV8N
 9S6FI2crvCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdC5wAKCRAk1otyXVSH
 0ADOCACGK6c7kFPGx7+Ik3auaxRN2tDie7lNmHazqiak3DDys60nTrmT8S5Vb2VYsj8QXJFsrOn
 e1UxXfuTGcnZwbUneoRsWAD6/ooDZEulznDin531nsLIndEJ37PZCM7jvttzWWSyaUf5EfOn/S9
 sDZ7CNRUvHDzuNCfYplPczZZSZ0IFW9bQMZzuScWYUlj2CKHCCiLPROamY8MqmgjVYzOoYIYvq4
 uHlMUzlef/npCGcfwKgzC8+Wt3HQx2BDlA7Irel+/cWHxZy61c2govucTU8FwVubk/Jxj2VkFS5
 CggQn2hzcjbUeuI/hTwxeRONd4UfM7e10QdEmXG9S3OlBW7i
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 13:08:57 +0000, Simon Trimmer wrote:
> ASoC: amd: acp: Add more ACP7.0 match entries for Cirrus Logic parts

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp: Add more ACP7.0 match entries for Cirrus Logic parts
      https://git.kernel.org/broonie/sound/c/9ca0d0d02492

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

