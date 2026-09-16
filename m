Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC80391E51;
	Thu, 17 Sep 2026 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674325; cv=none; b=MIb6J/xezj6BBOFTrjrAr/1anAuvpgU9ZZ2w8l8P95+OTShlxm5nIaLlb1G+wz5nGt386MuSzokSFDS+iJ1ZYM3xpvpasvWgmUceaiRsujfSeY1R7evQnWtqX/ND08tGA72GOe75WJm/ujze3gXT3+TEVWYUbFX1A2jd6l71fBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674325; c=relaxed/simple;
	bh=Fbp73swM5gNxt/8Va+AG+Nme+Lg/5/eG08BcxsxNphE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JOwcNvErwEysjtqI3WBY0pkRrqeUcNt1Urk2fQdTGxplJkXfiRrwtKoTAjSGbpiInB+N6sSECVaWbd5qF3b4B1YOkF6j5bu416efNSrAaECVT6/J2w9occkoT64xMid+r/wkZ6++umcYQd6OR/4kVWWn6PsxVzBHd9TR7gsNc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUndbdce; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUndbdce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CEE1F000FF;
	Thu, 17 Sep 2026 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789674323;
	bh=pk68uz0aGRRtMVXzsBQ/X/QK/ATZeEO7EVvSeyanY7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YUndbdce6aHjjEVCObjuBN29COUN4BT/T2nsJqWEXw5GFQ8mSbpb7VME5AzZB42a0
	 W9NzoVB/dEHoz6P7qPLJojxeBHJk+Y1q18C1DJoUh/AASAesxxfi+ubG2Pdsdqu8ly
	 uEeqRPVYqGaDWQZrrG3qVbegX4giN5EG3U7RKmuEcEe1m+Wni3lipCjaZypp1GFrlR
	 BlxUunfrkVjWxnz3se+ZhIIVR5eRL0JeZWw9w5HRUg779NuS2ykAeAsrC/3tmwDhoz
	 V144pbsdyUGolki0K+XbNM5CXIGe+tLI+VUzc/YSDdGS7Q1OXM2a1WHr5SKF2mBHic
	 8BOnO8d38/vmw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, phucduc.bui@gmail.com
Cc: Kees Cook <kees@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 u.kleine-koenig@baylibre.com, Rosen Penev <rosenp@gmail.com>, 
 Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916063601.23625-1-phucduc.bui@gmail.com>
References: <20260916063601.23625-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: pcm6240: Return 0 explicitly on success
Message-Id: <178959297285.414407.7261029939656896327.b4-ty@b4>
Date: Wed, 16 Sep 2026 22:09:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Fbp73swM5gNxt/8Va+AG+Nme+Lg/5/eG08BcxsxNphE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrENOloQotf624P2YQJh6TuWUOUT+5xck9m/ZX
 DqeW2xHva+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxDTgAKCRAk1otyXVSH
 0GEUCACG8j3cZYWxyh/iI9SqyfaRgx5903I+P8fKoP1M+7X7rMWniPIaHOMbCR7UkXvFLGVtCDL
 WaQp+MUjvr4SUCBJlc1mcV780JaOzsqDt9fAFmevMyzczntCvHvlSTwk6nxHBsuUZdzVIEzwKXr
 s1tbwLYWb8hma44H6dTT+Eh/esXauzq05Sw+l22OQHSC/4aI68vBXzlXRHzbtOgCIAId6nQo/Bi
 LXRtgAjDhdf3Nt3NzwA/xCCZkq5OAEIiv4TRkpEMp7O7axnUtR/2K5lSSNnu4X0ayVIXDAC2pHe
 JdXy78/QoyOdhtsUmBr8ixRTTQitJ3oE6rEimSbCIbNYEYZw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 16 Sep 2026 13:36:01 +0700, phucduc.bui@gmail.com wrote:
> ASoC: codecs: pcm6240: Return 0 explicitly on success

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: pcm6240: Return 0 explicitly on success
      https://git.kernel.org/broonie/sound/c/bb345be9d428

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

