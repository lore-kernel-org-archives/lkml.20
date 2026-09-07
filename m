Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D44248D7;
	Mon,  7 Sep 2026 23:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788822883; cv=none; b=SwohhuET8+iIGS2hUuFSFXgufTkJJM0WDu8gwL2oU65b5H17P+5aRkfd3ccF76wOINPrLPKRI113PznA3D6NFTlUmJw1CMlCKU8OpuV/SZ62D2RCyJ/eRl5obcTHVS6eqV1D4eh26wnY8PzznjXWZzVXL2wv72kJaiTRssoBfJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788822883; c=relaxed/simple;
	bh=oQCnQEN2DfwlFjb0Pze/cADr3Ar+3Xem6XUDSpXlb5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UONZiFVWrb3NFiSbdbYscfxzOAiVstgLIsruWLsYd3urfCQTeCMERvPt3xYptkAwI9uaxRfHdeCRAr8zQyvkdlZuVJh0ObPHsAC+q7rC4JzQt5qPlpnk9UkP3Fr/B83wOppIBUaEytcbxlkf3jXgdSDM0ZG+0XXZT6aA+A+nGzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUDD6UY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUDD6UY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F601F00A3A;
	Mon,  7 Sep 2026 23:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788822882;
	bh=QIqKqWiMn7M+90S1KP8NGtWC+CfwTYwmJbjpL66AuKE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RUDD6UY1FnGc7jMdPEOpQZ5CPgJSNClEa9YwWsU/x+yKakpj3mzk7he/HPSzSPXWr
	 L7XC1vQrfcFbX0H/GHTWE6VwqZhXDTg2ffMsh+FeCImojGDT1YHJvZnIK1aeAZEPk3
	 FimnmXUIUPXtUTMfh2pRTpxVjl9MZmehZpG9IdlcqXvLksG2zs9ozP/Bu5Wnz81fSm
	 mDxFHcGHmjniu2KzVwFjaBik73AYmMmlKlxHEl0onSd32UFvHRfkq1GVYvjnoucTpF
	 mGoOalol1ZTLFX3CKuLMcKYSXwsptbilNt0uWIXxozKhJQsw0PNOUjrDgzxsx/j9Ja
	 dOoAVOFSnx7ZA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Aaron Welwood <abwelwood@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260907031738.17257-1-abwelwood@gmail.com>
References: <20260907031738.17257-1-abwelwood@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro AN17-41
 internal mic
Message-Id: <178881485689.118202.6975212680087714192.b4-ty@b4>
Date: Mon, 07 Sep 2026 22:00:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oQCnQEN2DfwlFjb0Pze/cADr3Ar+3Xem6XUDSpXlb5Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqn0Vegs4PfOv+yugdaBfJZzk6+S5RwTdWcJgYe
 FbtjLWmp/SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap9FXgAKCRAk1otyXVSH
 0KgYB/40A/VZL6b0uNHjYZwwbSsJ+MPH4Y3QfztLZvhtjwKCNKcKl7h7PwukOeXbton2DdEmNDi
 8FdTifqCBQDJ9ovthsgU9hi6BgQDrVSus3J8RWfwYLX7Voze/r+jJ/2a+s/LxxyBTq7XwEdMgXM
 0lsDaA0NxCa3bFHIf3YrtKzrSSzNBZcHWPCT9+1JE+K6Jg25IBuOsj3bmfZJ//wlN9ej/BMCxcX
 Jdo0yemntNE1xzgtSXJo4T+/i2DbAPKHmh3/EgHYk2Pf5LexdHMy58TAP6vpkOE1C/NjUfimpTX
 vbrbMYU700U3QZ/sPODIrPfC/IeAkkwiUufdAEYIKL0E7DnF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 06 Sep 2026 21:17:38 -0600, Aaron Welwood wrote:
> ASoC: amd: yc: add quirk for Acer Nitro AN17-41 internal mic

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: yc: add quirk for Acer Nitro AN17-41 internal mic
      https://git.kernel.org/broonie/sound/c/22728415a9cc

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

