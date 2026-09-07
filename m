Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803A83783AC;
	Mon,  7 Sep 2026 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804316; cv=none; b=QLskv/EnEwHb/lCaXshpc802vA+PKRuRYTxBNbxYW+psMEs+cWkqE07LAfpOXMNHqGQ2NwXWs53FVKeZXYDOat9YYCP+mUlxVRCEx/0jXqyI/tGE7YiJtdxTBvdUyr/1xWZdZsTJKE8MCOlrF1HPoLqCi5lSkQi3DZmfZSB4N7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804316; c=relaxed/simple;
	bh=NMZfQ5bfQM09rdoZBXeRzwZXUo+EmSk4CAgXJqAHtlY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o0BtmUsTchzg6r9+6/HLZCI8LM1s/wEPwZoFvsmMFWBuKLPkceFFu8N37siEod9m9WDDRjaXqn+avYzZxrf0I954mjGyO8qhXOrZCmhCS1AQHkXqIT+SQlSuKUnFIYjw0m+9IErmy1nI/+fW5aRJ/zOFsHRKL92k+K8BOXRNiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+P4t6ob; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+P4t6ob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC1A1F00A3A;
	Mon,  7 Sep 2026 18:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788804314;
	bh=OUE7j0R6gxhq5aQdtj+7Hn/pY4EoWtTKh2Wgd0Uir4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k+P4t6obRmHxnBXbDp8SM5b5PnFsGmYWkJBzKEeBS0vUXVenye0WuGYNDlHNBllaW
	 N7J6bbT6076XZJGek+JA+LLVeEtWVgBIG5B9uyuZFdDqpqWtXqWYEr+lqnTXGFG4wf
	 OHFZr1IxiGIpzVZxXE9NSbf2KOF/pxgWZlZ+282p0u7Hh10i8kkEgbJH4J4ItH+Sn3
	 Q3qJJlheix9T4KM9Kubvr49aLsE7Fe2Tdu476xaF/im0vW6KK5VALYc09COvDlmYeA
	 3YFMD2nC/muXcRmcrOYUDGVFBy2N07iff+CnH6Vs3BjGPDpE7X0y1zz142vLgFhvok
	 QHob5ujfCI3Og==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 "hpp.iscas" <hppiscas@163.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20260905133133.63661-1-hppiscas@163.com>
References: <20260905133133.63661-1-hppiscas@163.com>
Subject: Re: [PATCH] ASoC: Intel: SST: Publish the PCI module aliases
Message-Id: <178879976813.118202.1166467548793009182.b4-ty@b4>
Date: Mon, 07 Sep 2026 17:49:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NMZfQ5bfQM09rdoZBXeRzwZXUo+EmSk4CAgXJqAHtlY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnvzV+47xynTTcM3tK6VrWglLRi6j5uyy4Z6yR
 tZ7vfI8BYWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap781QAKCRAk1otyXVSH
 0CuYB/4wwD1sAt4gA+NYnxc9CU/Z3iccfAZ+Uvy6s8+XREopB7BmCfDdHJU4FvoKUDHfTNHVnle
 4h/iCF94yeA3d75LCSInuTaoCDj1POqQsjUu/+nNuuD1VXATK0ltXGgk4kftJhcUMAarDRM+5MT
 +FM+TmvZ/qiut9sFgAbYgIRDc7bsBCjgK2YI0EuvwkdwvFFfbp5t3uE/6VdFaZQwgRbZipd+gEj
 Wp8rd5w88PlXnLP/KayClqJSCx3Ozo+IM/abOIuLR/DiRfjjMGEC1yuUjwhB3SKayt3NwWwXVT9
 9keCCaat/1s4pm5n2Uop1vVaI1K+2OnbrTVobur5thid35sN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 05 Sep 2026 21:31:33 +0800, hpp.iscas wrote:
> ASoC: Intel: SST: Publish the PCI module aliases

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: SST: Publish the PCI module aliases
      https://git.kernel.org/broonie/sound/c/d112159df5c6

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

