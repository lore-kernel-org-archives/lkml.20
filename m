Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631564A262C;
	Mon,  5 Oct 2026 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209801; cv=none; b=Pm67clZzpmwnhZ3iNlcjCq54tlVN8NdfPA+GLQdfk5/CuQYP+qMhmG4kZ1jNLChF9QS7qLV4YhFJf5gcrSW8oW/3ZDk0g6ybk+JTtXEPA7Bcqgc1HKtGuG1bICeXn0ppkzwJcnLfM4+Dxu4VWgULIp7yOp1yaqGNfjH6l+ChcBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209801; c=relaxed/simple;
	bh=mmZJBIOiV3CvuAeLKUlhlhNsdM7X2nfokKCh4GBrX+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jA3jDNVSCrOau0FMwvEDCjPBkWkrNrIVOfMPGEHzX1mNUvH8tmxeML7CapR2svqARXLnMGHtVzznOLU7ie1sFE6zHt2vgBFYe4ChBwwLLmEzkgzewiye8OmUailpwJiXqRYFIfENn3Jr3BmQ5910sp6rihCCIHiR4q9J4ukdIVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJyTg2Q+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJyTg2Q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38C81F00893;
	Mon,  5 Oct 2026 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209793;
	bh=cROCURoBv5SbYuqxgcPCgTOoLgTNRLJjDemztndXY7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fJyTg2Q+T0HF0Csq2hLcAtfkuPOTOJHMlqxIiucN/IjaIfDoAi4I7yNQXvkQqajyd
	 QVuPYo6VadmCxN8e7K4WQx831t1CLwALCz8PLpxtgRJT7/ROUr7g5MB6tp/8Y/DhGe
	 y/kI6b/WCVuspAoVcTfnb8SmG7yCZtlk0oHAxexDH3Gou1UuAdl6roJmIe9izjYEVl
	 CkWd5E77QQDIn4WkW9IQsr9ms5eyZMFIcy8AymTGjXRnfplZfGLbfFzZ9ZTjLTyybS
	 sDuHHefJmFHBnUQT+lBy00aqcPt+VR6ofNSFSpysVK5pqPB9IU9ysl23qq4x8/A2yE
	 B1YD7Pd2ZEWDg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Hongyan Xu <getshell@seu.edu.cn>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, phucduc.bui@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 jianhao.xu@seu.edu.cn
In-Reply-To: <20260928134054.312-1-getshell@seu.edu.cn>
References: <20260928134054.312-1-getshell@seu.edu.cn>
Subject: Re: [PATCH] ASoC: mt6359-accdet: manage private workqueues with
 devres
Message-Id: <179114814010.150114.17408458260708250810.b4-ty@b4>
Date: Sun, 04 Oct 2026 23:09:00 +0200
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
 h=from:subject:message-id; bh=mmZJBIOiV3CvuAeLKUlhlhNsdM7X2nfokKCh4GBrX+4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw7E5cahys8/sTVDYxMlkjrMiNIUTKX/Cihcjj
 DRxtvKkO+6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasOxOQAKCRAk1otyXVSH
 0HM/B/9O3H4UAH0s5YXz3pah5oztj5gHhvHzdKl8MlEoUhsyRcGoayB9y8EYkAokXBHlf71dmxf
 3KbQpPwXAraoO5TfKXdZ7gkFOb63xYEu0AqjjFOF46XL9ekQYuP7ssrXwbD5JW+H110ZNyvEp3F
 QZRPOnlbX0K8U0q20gGNqqR3DXDnFJRV15suGEsWs2YIh1c2KZsmc4V4dSa/6c2JHR+WNLoZCJ2
 fuMYhB7Meo7fJsLn/zD8kDdijVx25s7bn087KJQ4Pix0gNqVj397dZfmKqFPplaYsk469haTAEC
 bQbt6Gskhhe/AuoiHtdn4OJ85eDji1z+G7VZQeuedBZxJK92
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 28 Sep 2026 21:40:54 +0800, Hongyan Xu wrote:
> ASoC: mt6359-accdet: manage private workqueues with devres

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: mt6359-accdet: manage private workqueues with devres
      https://git.kernel.org/broonie/sound/c/9a773d9d21fa

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

