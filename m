Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480AE50B426;
	Thu, 15 Oct 2026 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060269; cv=none; b=SDwn51OhglkelFPa5vpDRI5ksj4kSDS4bBiVGExV50lv36maWpC4p5wuLcmL3atqrMMrgSSffyPo8VPjqwsY8qVj0DXu72/9m35qPld8UKjLpS5H2Ll7M1HPtCwGs0qWmCaQ0JeOSsOBSRBG3ZvAU1TIXoGW/FXFCyHzVzDQ/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060269; c=relaxed/simple;
	bh=OeNecRvAZ2xIg1KwKkSy3lnhgYoQ9dQyV2iwg36Y1C8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jwwJoLVNF7lckVbJNBTFfqeaz0oLebO3y/R6SYYGqy0tqKWE+kAiISIEOC+wmdhGDNudAtZo6wSfTdjsDDBv+SL3wTLNLqyz6XPhCJZxnz4FgSTU8WbC9GowRKpWH2CF4HK9N9cGoloa4lDsXAfBbKdr6LNhO0j4uK2dck+e8Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXqyQrV6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXqyQrV6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EADF1F000C5;
	Thu, 15 Oct 2026 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060267;
	bh=eoYh+wmGkfMuCrYWAfzCPGRay9LfK9IhzqEdYF+ddbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZXqyQrV6Y7qejDD9SlNYEzQBYR5GGe5ROFqdWd53NW2wZQ9yh1ft+y6dpqkI+3uRs
	 qTfJqdBvZTQ5qHICsZjul3pBTF59hlac8Fr8dEDPC2TcmnDVRYEH+RsCUjMYC78C2r
	 YRKjwN2oi8BguEWhyuFdGws2IlgyhBO2/+ohgq0c1oAfkQ1dfYmbU8SF6DigX38KeO
	 ZQxeIadKVXb2qSVKBj65xTLXyGDjY6pLBmx1AgN6ylVv0kfh1V53IxbcEoDlmSrrZ2
	 QPDpjOrijyCUv6X79cx7cO6dqXjMPZdtxmJcOg8fE3kDW7iIF/nMbUSVppXrcssx+J
	 0+UE/oMtoJ8DQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Priyanka Mani <priyankamani2100@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
In-Reply-To: <403cc04bb103dff096edf72b99ae6868ee91f359.1791782072.git.priyankamani2100@gmail.com>
References: <403cc04bb103dff096edf72b99ae6868ee91f359.1791782072.git.priyankamani2100@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8365: Fix out-of-bounds read in
 get_iir_coef()
Message-Id: <179192115331.1606900.11418539527267482059.b4-ty@b4>
Date: Tue, 13 Oct 2026 20:52:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OeNecRvAZ2xIg1KwKkSy3lnhgYoQ9dQyV2iwg36Y1C8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurE6P8+r9axAV+TZqMgNber7dtH0Jq1NyvtYzer+5z
 W+2KOt4RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbC8peRYf8Zj9463o86y/9b
 3S5ZUKJxYc+ZhLMNGks3/YyaJH/e5AkjQ1Odr1Prn7xu2zzfKedVVtivXsYr+C86dd3uQ7v0OE/
 1cgEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 12 Oct 2026 05:31:19 +0000, Priyanka Mani wrote:
> ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()
      https://git.kernel.org/broonie/sound/c/e913917febd3

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

