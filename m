Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E441DEE5;
	Mon, 14 Sep 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377832; cv=none; b=MlvCGxXA+EojMy/zkQWezCsV84nMDLVU70DO4NYLO4Sr8x8TDlnlZi8L6wIa0vo+UST8cbYeXo+ZEseDT8PD9wnv+P6uyVhF3Slgcu7UYW1ZnYCn5IfTvYBRzhTh3fvJQScWIuz60913VFn+j6S2FqcP2oFlE0Y4aCqJ+GukvmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377832; c=relaxed/simple;
	bh=GiEgc+HONCIOXNi/2k+PHumsrQ/y82kzXcHyvmihvDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DQnvU1s/MtizpvVP6Z5v0hEbvKP9LBPwTJ1RROV5yJlzqp07cJ9A16e5CGrq3RK1FwMYc5FoP/Dck1F6sXdnKQxBDQyJQBGCw/S15kniekVBm6xZUPNCt/JPviz0u5g494tUagzq9hBlgv7SX3x8vNoByGglqT4ypKKGojG/up4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRDUXwvJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRDUXwvJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD711F00898;
	Mon, 14 Sep 2026 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377825;
	bh=f/IIVhIpDUMez81w+c/uq+PdXNlb7xJjoOy0dmVdS8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NRDUXwvJHEwA9ElVkndpfSDt1WgWGEy869lxK50oGZ9TX/GJ3UNLttjZlaFug4xD4
	 GmqzeZyEyetgkGyu3lgT7kypzgJuHdMg3zZDvwx9eReQP2NvadiaE2D/GGx9WwlV8W
	 dd0CS3X7CwtRXbTlgkpB/OaAwriW6eeq9O0AjOAnWFFLh7J2/ln5AMp1vitR3QCqDl
	 rKqY+WfdYdLNDgBi/UPYSfKv1V0xPbhBLFYYsm5Op5gmwR1Rdo5LqTSf7+/gYmCMU2
	 1tVU4y2vvuqaj3c0zrPmR+5ub6XgeN1LiqCLBi4HT3nk+S+k88RDT4/qNPC22LJZOG
	 cCREPgV20KohQ==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, 
 tgaraev653@gmail.com, ckeepax@opensource.cirrus.com, 
 balamurugan.c@intel.com, marco.crivellari@suse.com, 
 Ai Chao <aichao@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911081932.2605407-1-aichao@kylinos.cn>
References: <20260911081932.2605407-1-aichao@kylinos.cn>
Subject: Re: [PATCH] ASoC: Intel: sof_es8336: Add a quirk for Huawei
 Matebook B3-420
Message-Id: <178934278902.1239410.8386174882176684705.b4-ty@b4>
Date: Mon, 14 Sep 2026 00:39:49 +0100
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
 h=from:subject:message-id; bh=GiEgc+HONCIOXNi/2k+PHumsrQ/y82kzXcHyvmihvDo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqp70bNU9mxGN4nWvYx6VnKYrDMWh0CrCdLQFka
 24ug9NoPz+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqe9GwAKCRAk1otyXVSH
 0Go0B/9grWcmSQh5Xi5RkR8jz51T8NqTKbHWnlb60RjPZGgT3HgzL+o7A5c9syiIzfu9DI/rsAJ
 WNGf+ognumWYpuAhNdbCQnD6nKCPLUG6QrlpJhqvH82y1PERzBldyVvSlDgDA+Bz/8vwqklhehG
 /YhEeMeujYrxN47Az19SDhL8HLoQYMsiAtXtn0w7WuGCrIbW908HZ7UHIZ/J7XLzq+bXHLkn48Q
 LbaEgeWm0z4qs1EHya2ChPAq1HG7xMhfg/k59M5bcG6WKtp7ITK2rDzvI+/OYLwN07b1dn9bnao
 qGhcMexK9EDgz78dgkAp5Nok4m0Lm6+tD3Odzgj7bvXqdimo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 11 Sep 2026 16:19:32 +0800, Ai Chao wrote:
> ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook B3-420

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook B3-420
      https://git.kernel.org/broonie/sound/c/576725ded009

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

