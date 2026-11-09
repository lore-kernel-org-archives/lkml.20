Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234009;
	b=ILwNl6zdLQyuc5DEcOvSuaUtsDkDncEpLUIFmXRXbkt6vuxPHq+l/0IjvxI7pAj9SGsC
	 f9hzwQawgsYt7/uGF6e8vEeVLYkNgtYP7+8EyvOkUMn/I134xcAJUOxuIkFBIzdZanR84
	 NIBVKwXtZ1opE8S6PfmVo7OiKJiP0dAH7UGYfbrYo4D8+VPHUHjh0v2Hq3FVFmJ8L400Q
	 iDCRrChUar4wLxwmlHoOACGnYPiK0Z/LVucm1TGrcOxQV0DrkFaJO7nuoG49odxG5xj+O
	 r17VtHMgCp3uMu7Sgjza0pz79mjtKA53x+h4X2hC/vQD2QVbLSK5GYoFxpQO0DVcVow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234009;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uCZadi/7zh+d55dU/M0XXTvjpxQCZyRDpCnv3IOUTLE=;
	b=NZFAHLJdmo3hC1tDh6XGuEjB5/FxpyuT9Sk+erF2UZyy6CSxrqu/elAjUXlQeEAyn+i+
	 Xnpiltuo2WZ0UNPWLbOlmU5N163FZoPCHG6EaMR6c/hFDtNhKXxk1A4pv1i9QbxJYYLOh
	 CHG3GJ/LjOlJh6IIpXY187h0fDQa0pldHHMvHAhHRNaSB8kdWjFtLU1Xq3rDMjz9sxmE+
	 5NE+ijdOYjHpRORIarq2pzb1sZVaflItK0PIBf6grkbWP0Brktzsu8C+4CzyUl9Uxo2rn
	 Cw4LeZG+/3Lt6V0b+FnompEDtg16mUL+u7IgMiJpciCHgcgrnmqJxcVkSSgVEbqeSwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oQT4a/pF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62507606A330;
	Mon,  9 Nov 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oQT4a/pF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14891F008A1;
	Mon,  9 Nov 2026 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234009;
	bh=uCZadi/7zh+d55dU/M0XXTvjpxQCZyRDpCnv3IOUTLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oQT4a/pFmE1fZfrDAC/afR7BlKulNRYEV1UB3/oC4Yt6vL8Hj5xLu5Ra78BoH+1oK
	 hbjS91FIUKNmE7EHIfxKUFFCL6hImOLz9TPwsVdSI1Z3geBeS6+tXtrmg85RlHca73
	 93s2XJQpO4SzIV3MYnX2lqvLtwBMi7ED2a9dAG+HmmZB/IHqgAFy2uINbdBXNb1qhV
	 qvTrS1/sggIzGBNwrOHU7C0I9/zacP9LDfEHazpQGT6zU48bjsLSYMRraqUtvSvYln
	 uBEYB78OHjsgVaN3l7bFwPRXOv4X7ZtSd11SDRkZsNzsuAu9E/ab2Y2TqYAi73bOqn
	 870i7SFQR8kbA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8CFF02E9F432;
	Mon, 09 Nov 2026 14:20:05 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Andrey Zakharov <dedemorow@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107152338.77837-1-dedemorow@gmail.com>
References: <20261107152338.77837-1-dedemorow@gmail.com>
Subject: Re: [PATCH] ASoC: wm_adsp_fw_find_test: Replace strlcat() with
 seq_buf
Message-Id: <179422601563.3711751.3927735677686737169.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:06:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dlBW65uUxkKBuw43/ZA3+wfejNh948XcxAfPm2h+v/Y=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+Xps6p+mNWNhB4VMzj+kIlgXc+Hbdg5Hf9mJq1L8Q1
 T/Ovz4Wd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi2z4yMvw6xBb98XrUZrND
 T1p1z9kuyQ4wYu1tf+od3/Pw0s0L/MYMv1kOxnVbVaW/6ZBgXdzhXzpz+i591z29cVb862e/lP8
 eywAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 07 Nov 2026 18:23:38 +0300, Andrey Zakharov wrote:
> ASoC: wm_adsp_fw_find_test: Replace strlcat() with seq_buf

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: wm_adsp_fw_find_test: Replace strlcat() with seq_buf
      https://git.kernel.org/broonie/sound/c/edd3a027969c

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

