Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530FD554096;
	Tue,  8 Sep 2026 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879741; cv=none; b=J4f5c3B7k07Y85WXwaL8zXIkRBsrO+X0f1WLSrBKKf/LKd24lv4SNYouuvhwb9m2ruDOpX0DMVTJ/STguWoAhYeMpLHW4krLjcBmffaGxaIxBq/La8H1JZD/yWiPZbuOOh6o5ww2dHFk1KZxMreDp//CF3hJ/19ayKbzWO2EgzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879741; c=relaxed/simple;
	bh=7FRrLvnJiZVAimKF/j88jz54tDKP3hFh2nkzbKFXkQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m7wY0zwEbXifaYQrsOO1DnWFBBz/s56YgMn4Zz7uOQ25VZfGCY6ZFvtm7XKHnDKDeDdFAXilArrh/Rvce8HqRNlbpqQe2YUgKsVyMhhRYa0NrZy0B9RSh40S3My6BpnbDr+ZYe0j+oE2A5Ph6DwWLGDY/QWYZMIRrKvq2GrdjaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTymgIIj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTymgIIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71081F00A3A;
	Tue,  8 Sep 2026 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788879727;
	bh=80f3+AF52zcevnLWJ5bCvG2rYVQ1CNFhIMnR7u01iWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GTymgIIjrd946UwQfxfPtsuPExjXK30L2y7wpYR9zIXlFoO9+Nrv5TMILgVOxT33L
	 2eIUIkM62y00HPZCeMSbGFeOYPoqPaJpOs+k5tJ065xCZ033KqiyY1xvSnbQ3ZuJFq
	 TUFOLoaFfZjVKlY4xnfBdv21CGES65ktYactWsh+2jFzuyN3vvSrCb7vBQnmVfKowy
	 p5PD+uPJ0ADrkAk8iD797rzQIwy6ARwr6WF3W9SKceG/dm0n3bNb5Qyx77CZ1RKRGK
	 VMs3jGEv3e6VoHt9JXcsVGqEoKlbdCb9MAyLBxgLG8ExiChtarhWuNu8g/Hir08zJo
	 1LAdJbc6BTCNQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Pengpeng Hou <hppiscas@163.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Yang <yangxiaohua@everest-semi.com>, Zhu Ning <zhuning0077@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906034217.85696-2-hppiscas@163.com>
References: <20260906034217.85696-2-hppiscas@163.com>
Subject: Re: [PATCH 1/4] ASoC: es8326: report resume restore errors
Message-Id: <178882136788.118202.13350473647316370947.b4-ty@b4>
Date: Mon, 07 Sep 2026 23:49:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7FRrLvnJiZVAimKF/j88jz54tDKP3hFh2nkzbKFXkQI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoCNqHAne4rpLk8Af6HCV1Gwx6c4zN+c7zvSVi
 ZpxU2JaxdqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqAjagAKCRAk1otyXVSH
 0BOqB/9S3OIX1gNY+UWjGEXWh+E2ZLi+8IlAnt+koLteGJuu3epAZKVyIboHumTtdgUVc1uuJIl
 1b8zsWMBfe0iIsdCNcw/y8srWH6vgpliDU1cg5VdNQLn1KNZ5zCfHq0bO7UU0n6X9pnOjiJ1H6M
 2wmE6of8LutxZMzQ6pJSJtWj3sAEE5t4gd11+0rGCUM5oKmMD++Ug+TshTOYOyS17ANchiQW0C4
 z6FjDzeMqZpdUC5pgOnSYXKt4cnl5aeE3z3s7s0tV8PO6ulBD/1Zua2XWPf3504mvMn+yzwrVQ0
 c/fh1ofXIrm3StMwBCIb1yIr5QA79omAnCE1sBHmWEvJpiwu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 06 Sep 2026 11:42:14 +0800, Pengpeng Hou wrote:
> ASoC: es8326: report resume restore errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: es8326: report resume restore errors
      https://git.kernel.org/broonie/sound/c/349e94679968
[2/4] ASoC: es8375: report resume restore errors
      https://git.kernel.org/broonie/sound/c/8f43acfd3add
[3/4] ASoC: es8389: report resume restore errors
      https://git.kernel.org/broonie/sound/c/8f7d23eb8ffb
[4/4] ASoC: fs210x: report register restore errors
      https://git.kernel.org/broonie/sound/c/aa7d985d8552

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

