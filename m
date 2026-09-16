Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C54D9F88;
	Thu, 17 Sep 2026 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644755; cv=none; b=pVPmcS4b8RNeEnbwXZy1JfxpQdAiHJYPklqWxwEAl8jsLw05ScrdDGJUnvgRlx48eC1LJZBAipiNp6GypOvdT1TK5NIb1fhg1IN+01DPyfKiCaqCH5mVs8VSIqOsSlUuLZ4nGO///rL3A2olgH4aILmnZu/71Y+kjFhpQd62P7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644755; c=relaxed/simple;
	bh=WOThHWUMf6yap0/UQanUca4eFbQ6S55BqPy9cD0JtPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bLqWz1xQXNP+VTC+bwiyW6DhiQpf1uRKoEz8OrdYQyQPP1h0VnvUWLDyEPxk6KHjXhh9DBoXUqd6DxrjasLMakripklTkEgz34RoiE98zga9rzhuFqhT1zruBwpaWow6nEgDDSfTc2JtuGj3kEFTHXjoXsOspJpUyGF0oplY214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+085Gae; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+085Gae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925561F000FF;
	Thu, 17 Sep 2026 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644753;
	bh=Lvd+5MlXZA2aI1FCI4/ytRRmptuWqZmgHAdnvYqpv+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T+085GaeYevtQd8Uc7gVOOrC3GTjx9CoZYHOiKW5bjHpEMA64fRfzAwNW8RuHuN6N
	 umeiAIpGM+vMM10N09blXUpD7sZ2fexYWipeCzsqENI6KMdXto2TMXDqmWssnBkQkP
	 Z5KTlp36bOyEm9UDNG1fbnHFYCrygnYmIktOGKET7XCtpqBNzDaFtWnPGKFeoOwhgX
	 yK+Uu1fA61f5RY61ufAW55GI9h3blkTBXzUP5vPVYHs6oSiZWoqCYe3i5mGgyJg/UK
	 +F+nGs5Pa6wCBCwmjIxRBWjkGUF4KoRnzFwOYQW6dXv5McuE126e1/2i5fpS4RdRev
	 38Lm9W8il3D9w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, HyeongJun An <sammiee5311@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, mripard@kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915092515.2638542-1-sammiee5311@gmail.com>
References: <20260915092515.2638542-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: Report a change when the channel
 status moves
Message-Id: <178958553576.100121.15556907354609737785.b4-ty@b4>
Date: Wed, 16 Sep 2026 20:05:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WOThHWUMf6yap0/UQanUca4eFbQ6S55BqPy9cD0JtPc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq8/O8tUQpaN90Lm1wTTEVBnviVGumL5QUpmiq
 qisDE+AAzuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvPzgAKCRAk1otyXVSH
 0KCkB/9wzTU28s2c7HVzO8sEfsfiWmhy0YCqwu2o/gUjZPLib4MZQE/dWvw1ygs6+evLoN2njsN
 KowO4TrmN4S0XwpiBUz7fMcgzCiSZH+gLvgx9DdL/96bnt5lV/tkWmGaAYcXECiNRi881y3m8pj
 MnnQuVJ/pTNGx1SHlPEgQq87SwxjE5b95wmx/fyEkP0e3uxfM1LPvGvyRb6/bhk6OOi10nIT6Zy
 3pMXp5TvqobzQY54L7c4z3uZWiC1iXDWYDyMMYmucUpgqGukjrh4EktiW/nQ+K0K798/7EFR207
 t7iYZdxKCHBL1ei6odsyHZ3GtIzxgOhHcDMta3k6BhPs2gTN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 18:25:15 +0900, HyeongJun An wrote:
> ASoC: hdmi-codec: Report a change when the channel status moves

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: hdmi-codec: Report a change when the channel status moves
      https://git.kernel.org/broonie/sound/c/c17ae8c26eac

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

