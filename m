Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BF93D647F;
	Thu,  8 Oct 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443690; cv=none; b=DleU5TF08rOT7D39IbjjvirToXta4gDQuwEQxNuxIZn1lU3IIJSB0NPOMlyKgeZhiQrWyz7wrpNenk8ZF8Ij/sqkwgDhHw5n1Sfr/BbBnIYIC9/8PnOVH0KrMRm8qdfKZnaN1g8SN0n8l6E9UN0/5Z9icJN/Gs6+uwOKzwWOsT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443690; c=relaxed/simple;
	bh=18yjA52+kLZzq46QkGkmtVbD5n+DM3zewAx+8fIum/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qOBEQaC0vex7ydOsuAvcwrLINYflhKis41kVf501+aDGUapgOJuYNsW1nzf5RXQ8O4mqG3b1icjUAIYUJxJAzt1VisnxU692SijfGSbBh8LqijIGjXQZ3CgW1YtMMgVHsf6SSXyrckkxSmWQaGunSNKrPFQAGkF7sFpMpQ5BjyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVMJHmmd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVMJHmmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15161F00A1B;
	Thu,  8 Oct 2026 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443687;
	bh=JZ4Qgfwb1ch2bz6wgHDURBYS/UW/mt0PnCBhye5GoXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MVMJHmmdjIvpw/gLgJio7V9hQwlHhPuxkGskNgyyiWOmOlRAuQb/eLwo16GTdE1ER
	 szMwUSfzuMXxNWk1yQk82fX3BU0alD50tPH4bQsEJLBNjzg71uKjlm4Fzka6hHWH6d
	 iNn7YUH/ZnsyFLRiUDKuf9bZ/jxdkRsqiseaMM+VLXx/1cUJmU26DVIFeM7zw3Yw56
	 scgK5FcuMDZumb4hpunHk4T+fXfGba2j4PpyLcwrN+lle2L9MYXA+WTXptMM5sdqEx
	 Kdv6wRMrv7OUS6zybBhkFTjS9CUPXJMiqmqUcM25wVpZl4IJZFLCu8j8Sj4+WVwb/2
	 8/VHbeQGFpAbw==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com
In-Reply-To: <20261007130835.102325-1-simont@opensource.cirrus.com>
References: <20261007130835.102325-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH 1/1] ASoC: amd: acp: Add DMI override for ASUS
 EXPERTBOOK AM7406CKA
Message-Id: <179138251767.2423942.17738990522388977311.b4-ty@b4>
Date: Wed, 07 Oct 2026 16:15:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=18yjA52+kLZzq46QkGkmtVbD5n+DM3zewAx+8fIum/4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0LiTXaV8cLaN4OzuS32nT76gO19AvwAsxRsB
 TC1l4VzpfCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdC4gAKCRAk1otyXVSH
 0JUbB/4yy6tmk5dnrXXlxH6IrWhH1oKgHg5OhUE5HI9o63648MsEqJdh1dcVNM18Ag8OM/CcEGc
 EnW5Xe6bYmF7IPTje3x+01YpfuoD+R3rjZtpCooUiLhLCfgdFRGGen9a2PWi3NAzfkqm9oQrZ63
 1KnT3S1BDAAeFzugdiZxCAsuLswDVEUlulTnnq13ASMjruaYyMNsMiAT4AL7rS0XMo9dgOIREaC
 nuZbMwCY7WuWAQO6igJuXpmaAqnBEQm3b1pluPR7LN2i3U9+T9m+PepRIFKtC49UvURf0H0CMoZ
 7KdszLatJDE/fl693PTno2G2uObFMPuM0rXyZiEm0QgoOD78
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 13:08:35 +0000, Simon Trimmer wrote:
> ASoC: amd: acp: Add DMI override for ASUS EXPERTBOOK AM7406CKA

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp: Add DMI override for ASUS EXPERTBOOK AM7406CKA
      https://git.kernel.org/broonie/sound/c/7587fc10cba6

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

