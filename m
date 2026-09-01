Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1126337C911;
	Tue,  1 Sep 2026 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296952; cv=none; b=XRpPMBATBBoJ5lJue+IUBP8W1FjDZ2mK/+3QrFp6qr9Dy6VtoqQbol7vKFcZAOUh+uWUUMm0VHruADVuW7ypoFURPvOUXrdBCQSn1prKDDWN4I3swMaOoZHPldJ4NPzEfqLnc6nXB7T8Gw5QbA+zURu+SlWVX4Sqi00bmp8c2xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296952; c=relaxed/simple;
	bh=+OA5vMSMjCEp6/4769qoMYB8eVlYEFpTbyDvApnFha4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nj45ZFirPa+i0DEHq3x8yRNyu6uihleh/vdqjEgINsqS3Q2xbTujoUgOQHz5tVBC4JL+PwW1f7K4snCfR4HXlQPn/gXv2+FR03dD7K4QX6OYHXAd48rfuSlXB15/8pyHsQypybZ5ZB8SfmN3KptYP9dzm3oF5K8XesjAv7HqK0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYAxlJUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYAxlJUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E551F000E9;
	Tue,  1 Sep 2026 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296951;
	bh=EarfI07b4faCMfStMSWv9oifHhmJFDes/d+au4AWdbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lYAxlJUCWZaykVoJN4hEU0N3I1KxHi0USZ/m43FOeKdK4GGIDQFPmAQieeXJ6pbE/
	 XuSNeywBwqSfTtXIyyQoSCYknyPkKwVteTk7ntV704oQvQXqRTsFrjks084U1LmAEt
	 201QtIgrnvbcWEFThyxg6AhXy7ifrWBS5+FnW1ez2f9yMVlPd5+fzaBbGCqTfdhnSA
	 yWcEe42Rnm36mQ8CMQtb5rieZcBgfv+JeMcgkDakLMQaTZ/3uGA6yhKU8sBJnyegsB
	 EAjIve+88fqD9Y4pxJfzxOWoPiZaRYAsZg6Dl02gsL83PuqGGRNEnEetT6l2AK/Ok6
	 sY/PT3A/YLo/A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, eraleexxx@gmail.com, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zhang Heng <zhangheng@kylinos.cn>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Tommaso Soncin <soncintommaso@gmail.com>, 
 Gustavo Salvini <guspatagonico@gmail.com>, 
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20260901102338.26403-1-syed.sabakareem@amd.com>
References: <20260901102338.26403-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entry for HP 255R G10 laptop
Message-Id: <178828236358.33904.2458159027970109435.b4-ty@b4>
Date: Tue, 01 Sep 2026 18:06:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+OA5vMSMjCEp6/4769qoMYB8eVlYEFpTbyDvApnFha4=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqlz7xgFRoa0UJ9CO0snX4HCv2QxEE7moASbCJ3
 Wm4fqcLgiKJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapc+8QAKCRAk1otyXVSH
 0PJRB/j4ud182qV5LoZYGEDWZ33ioEjymNrgY9z4teQiuSkkmA3E5d6vwFMuRH1NtUuIuKdTi4X
 v64Ngi5GPipb7xVX6EbBGUUAPX4piSSTOvl4cU9H5CMs6sLADb3LHcVZRP8uCM9i5w0n2i251/H
 jSVT/yo3S6yKXbRU9Gw8zdd90MEG2L3l0lOiGgZ8ktwRwErgvOBrfsn54X8uUZq2uqYIFtjrda/
 fg8anNnZKx4noiUrkoQFLdL0PKeVCLM83fip60AElET71LxLJ+0BndCV5JDjkZ/AaB9o0jjaOWx
 U02by+p3qWBCKuZ5zE7r0bOyuvyXuGuGz8qXmSQ6P59NA2w=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 15:53:26 +0530, Syed Saba Kareem wrote:
> ASoC: amd: yc: Add DMI entry for HP 255R G10 laptop

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: yc: Add DMI entry for HP 255R G10 laptop
      https://git.kernel.org/broonie/sound/c/00aef6b609bf

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

