Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FE6368291;
	Tue,  1 Sep 2026 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286765; cv=none; b=JN8BHb7u6UrxH6c6rJ5Cmyw2Z/M4EqlBNHuWHL0VFgMkv9Jrv9ulmTkMX3caAHhmCFX4jySImy4U4PvLMSkMwHPD6h3f7Sgpqh/rEeVDJOURIy2HlhFCmBlIJVBGxQPW3VEt8mrtvzv/kh+vt684IHN9zZ5ZEo5/IbFP6cYR6ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286765; c=relaxed/simple;
	bh=VQgw1rx0hcwrfdAEfrbVFZrdZNf4cuXYAx92WXfocDY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mTn6gppxdO8wD/cyt8NR6zoeYI6vzEnY71pn8vqhsOe0x+0NGkQfQLTBISrT0crUW/MOuT/CXoh0McYBgPOA2TYn4xa7OlGyrbTHG6ThYTXucQ/ThxRymdXwKgBAigSstNMlFRM/4j7XxQTpiie7U3fSkDiUgv9PgZrgwpk3LYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFsZynVy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFsZynVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10401F000E9;
	Tue,  1 Sep 2026 18:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286764;
	bh=d8miSB3uwQ1DRPq4e7ZIjP13HRCxcYUFn2e0go7cZhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mFsZynVyZ01oxCDQ6tryS2Dh8lHe3yYedql3WYcX5yFvmKap4YgkBUfTwo/lh7sOQ
	 3si8slvMBgE4Rd/6Wp07IXqvEBh94jYxQqnIQS6hgN+j95tdMDKN5ZJlqAQyUq3nH5
	 JsJf6K4N1tUyEMtolakHT15CY23Dig8eODK6Y0tmuNgRYzzNxeVveq2N5HEDhKSPc8
	 5W3Lk/XNJcIYtraR1lLTtk8S0ZbjL7naPQY8nDPKyIMZgt1/CVtSjzQzpIfPUaQ9W2
	 0R8nXGksj40r/+T9zF/v6NE/sXm8MkIjnjGGGEhDuZg4FmLfscRj3fI8rJS63c5No6
	 Z8Eo2BFc7HqUg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com, 
 wangdich9700@163.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 wangdicheng@kylinos.cn
In-Reply-To: <20260824063507.483784-1-wangdich9700@163.com>
References: <20260824063507.483784-1-wangdich9700@163.com>
Subject: Re: [PATCH 1/2] ASoC: amd: renoir: fix disable_pdm_interrupts() to
 clear mask bits
Message-Id: <178826972913.33904.1178096917008024922.b4-ty@b4>
Date: Tue, 01 Sep 2026 14:35:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VQgw1rx0hcwrfdAEfrbVFZrdZNf4cuXYAx92WXfocDY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxcon5FIHVUq7fbrbjus48OkvveDEYYFOtDoH
 13jWvjT47OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXKAAKCRAk1otyXVSH
 0PpSB/4v9x6YDQwHuGi8Mdz5hEkhMZvaIwzcmmWZodiyZkB0fLVCrBJqD31bW2cuCqLNpDuovFz
 D0/vfxllpyIs5xcUyC/TAJcpdFhc8zc1kBtq/44EP7wqWmHxKel0gqWTfKZZBvexf8ACOglTsQK
 i68jdLa5ELv8AVu+aDayQydO2i8aJ9mVgWLDBujUdLRsuYaGYT3/AaoBEu+RDeVKFVtImWIcLQH
 yEmdcz9mAUj2hNuLFYR/kG2ELH+pe4D30oIWiJgq40/3VCmFTSeFuJjS602lAOqHmEjLKdYc7o9
 wkoa3jfzwlKR5352wxdpLQ2zdgtLZTO2KAXWp8nKT5FRS7qp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 24 Aug 2026 14:35:06 +0800, wangdich9700@163.com wrote:
> ASoC: amd: renoir: fix disable_pdm_interrupts() to clear mask bits

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: amd: renoir: fix disable_pdm_interrupts() to clear mask bits
      https://git.kernel.org/broonie/sound/c/0c06c4ce0206
[2/2] ASoC: amd: yc: fix memory leak in acp6x_pdm_dma_close()
      https://git.kernel.org/broonie/sound/c/1b67e0d3b969

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

