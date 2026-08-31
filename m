Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED849B1EF;
	Tue,  1 Sep 2026 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286813; cv=none; b=apFtl/MXbWpT47c0rwXLwir9vamueDac8oUpwjp0liTJcFORmjGUR1icVWrZg31YjfzrAwtaxuzMp4tSNRdB6ldwIwyCooKSN9ceOLzzinsY/5uSoOl6bOShz8DNIPloG4+snZPWsygCEqhVFne5Lh3DVsnqpNDYtBjZi50o8Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286813; c=relaxed/simple;
	bh=nK6KOhe5vnxyWuppPoiY8PgXoR/dG8HvCsleUp652/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ky/BSERv3wdl1yVMV4eHiCQu3vp/Oh7LWA/kWjGpas3QvrEDc5MYckxWKq5lkvN6wSayJ7YjCfcvJLIqUx+HuZ/kb/iX+tUKXErpHSHe2VkDgXeY6UuVJpot/GyJ2vmliUu2CE5W7QSoDOt6NnYiAQn6MM/lxHUk1eyZl6lNV60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0kZKo44; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0kZKo44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED591F000E9;
	Tue,  1 Sep 2026 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286812;
	bh=LtX7KnnVs9LVBq9yb/c4TC+txGpPRdYZ4CX3PUwsgmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j0kZKo445icEly1JveqfpNvFV8P7Bn4wGpW3it7cjdTsujwC8wMFjDYhQN2gc34BI
	 e7tcHmcU8BNtkfb0//GG4u7l6oWvdP64/Cv992qGy5U5YBCzfj5j6BjCja5FGeGcu6
	 3gVT09KpEJtW6NRKYIhhbnK6KJNh1Xy1ACLf4Fg44vwW+YufNLYrrQ44GPHcFmTKyb
	 sZjY7J/38xkpeOOzpY2FNHKruGOwgMKallICE4e3t1rf1IBEbvLEEAC5ZabmAotc8Z
	 6/nFVeDcSSzpB4Pni+9G7ocw7pE8IE8AJCIUsMaCYEU7EacXNaRD8ZWZqSgX3U0l3Q
	 3AmoWf4FGbDbA==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818104526.37904-1-phucduc.bui@gmail.com>
References: <20260818104526.37904-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt7986: Drop redundant probe error
 messages
Message-Id: <178819855760.141190.17148674455255470925.b4-ty@b4>
Date: Mon, 31 Aug 2026 18:49:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nK6KOhe5vnxyWuppPoiY8PgXoR/dG8HvCsleUp652/U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxdYOkDxwXiajN7CRGmgpsBTTI/iDdWlnxDHN
 BnKbToxTt6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXWAAKCRAk1otyXVSH
 0AeWB/9pnqbxX8ONvGcVOlGrctcP7VrncGXYs6sKm0DCcrVGnr+RMfFwQ2XYEXzk5m1ecE2u980
 00pFI6GT1t03qIC9PGpCKCpRsHzb+9YwPPVm/doeyn+KAZThAOza/1HEk9YM82n4ErEi7VzWd3V
 YHX0izX7PhH3YfxnGreSC9ST72z+vt7lJ6h3B7k6j65loPepOu+CqfoNWWOeDyqKejAIf5J+acQ
 5jOXP+Q4/g1qRoRjRYB6XQmOkhBqR52LiL2bgBfEUHfJBT7VS44XcBQivn3LLBEBo5oD5FUczwd
 t2K3VEudWw0/DxzhTyzpiL2dSzFxH6zNaXnTQF4utjjDPVgn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 18 Aug 2026 17:45:26 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt7986: Drop redundant probe error messages

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: mediatek: mt7986: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/bf71d5c64cd0

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

