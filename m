Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DD3549365;
	Tue,  8 Sep 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882468; cv=none; b=b4bclbtkIrIF31lZ5XHhjGIyKa/ftJcg0zOcZzIK0QsoASaR94xFxTE/67Y2gsnZ7Wm2xrfOfKtowFlHK/ETetLdcqxE+fUs2s7S4Naq/OZsc2tHMc4NdMZik7yNfYntydr+/uYXmTY4sY8FBJeRse63UE0Pg+1bfkiFW7WjhKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882468; c=relaxed/simple;
	bh=OB3etGIfHrnTF1SXbwvWhD/knAFjJU88ijlkJ6I7Y/g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h7W7tKaTokMag2qB2vZRWsIjfXl9u9zVKH+U28INHZFanexv3v5WP95Nq4W9BhtRv41jtBGwEl469+Ir3iCQQA4FlcejaVJFbdvx9grWIkb8wwN3V+Uuisnw1w9bSvRXtyvozG6xI3Q5ZM+3kkTySPff2UA2B2MQ0UJsHNp4+x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrIplNTH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrIplNTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFE41F00A3A;
	Tue,  8 Sep 2026 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882467;
	bh=71D0BzUWV8FiZVnyuHX33Dm1eIXGQ8xEH2NQd6s3xNo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NrIplNTHCqzlNjylAqEn9kRl1aiEeA/EMqbkUOTj/dcQ2agWJZdZ/SR2lNXhwhb9a
	 zD0EPKmfkEpztXPPcBiGjYkR7RTnMg3OHgGgQqT1A5n0KONrmwk4PZlojeBFL5iZWX
	 Pa5J22PBh8yrIOkZ2IqHWk7Xq2iOGsStw/wE/mXa/1wEg/be+XnQRvNGYqob3hUM/I
	 NVZRkBVjG/hCdJX14HvXWqwHvBeLh05wD0iwKpqJU42ZBSEmdEl8HaOYbfTCtacwhC
	 89NuiBy+hlHCU8fAgIY9CNb05V7xtrFRzwdhDKZXghvoheSSyI1d6KO+6w0sWdbC/J
	 Z7bwBcj7G31uA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Yorick Rommers <yorick-rommers@hotmail.com>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260907121228.13754-1-yorick-rommers@hotmail.com>
References: <20260907121228.13754-1-yorick-rommers@hotmail.com>
Subject: Re: [PATCH] ASoC: amd: acp-da7219-max98357a: don't bind on
 Raven/Picasso boards
Message-Id: <178887958494.78527.8049005928999856435.b4-ty@b4>
Date: Tue, 08 Sep 2026 15:59:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OB3etGIfHrnTF1SXbwvWhD/knAFjJU88ijlkJ6I7Y/g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoC4fWq2D0rsOWFrp7IzUqPcdLussFO/pAPgKt
 vW7/MfI9QOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqAuHwAKCRAk1otyXVSH
 0G4oCACAJ9FgSKsemZvPbTHxaLL8UKZc873D19B/ZijOg+s6dIs+EHEDyUgZz3mNmUYxGc+4hJr
 ay5+lvwpu0M1ZHVjTPjH2XnkjLLrg0ypjkXIKZgWSh9b2ybYQe9q8cer64/hHXw+/Ueq3htKx64
 bSA3GpvQKvgtJGkt+0KHUDNL34oQ9H/dTA2CEbIlEZeWQhniky+GugP0bELtYvJTcjcGob8EwMf
 i/aTUKFLfbQeBtvwOOmh0JPS3JFiAgOiVd8kiPmCsY0gufHMelBMYeqmpnj/rdP2Nx1zzMgLsnF
 Eh5Z6ZwuaPeL3ILyFHCnSbhKBLLfPitqmQOJZGba8iJXH8VW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 07 Sep 2026 14:12:28 +0200, Yorick Rommers wrote:
> ASoC: amd: acp-da7219-max98357a: don't bind on Raven/Picasso boards

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp-da7219-max98357a: don't bind on Raven/Picasso boards
      https://git.kernel.org/broonie/sound/c/7e125889f170

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

