Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627481;
	b=ll/IdEs11sCnOY8wv4EnQoesCgQ8OVreLHDmz7O8As10TosimLPhWWslxfzFDa8lE5HT
	 ZgbiyVRgkQ36815uU1+0AbkDH75bfkT7E9mM2E8P+fxIon1WRW0rJqZA8j8VK7hwYgWN2
	 S/NmXjkNAqgSvbeIk7s73YGSu8hisdc6PMjx0BqZznVoOVRSJYcZr6J1IBqcGpJ724A1f
	 6hvYGZeIWYG5vKBvImsvqLMwsPTpX0QqPZGJau08s8Hq2ygrtpjGOzhgLhpkGLANmvtZA
	 2Vy4PvjvfwMD6rtNAaBbIJnBZB1HTt3tUzEwhYTNdOl9cK38x+2EoNEHhGuMQ2uRVaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627481;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=x91rCfFpcsWpvBNJ6qbdo7UznQPcNEOocHPDg2XtfDA=;
	b=kEyOOUYPLzVuHAaXmBTDnysRNdwEc6GmcwXLz9sH+i+fnC8bNtQOuPXe117hhKpFvu0x
	 JwWEtKZMdPt5PKcBWThHQPLzlybB9D7Lmo1uMbrPWTVi2/+NweBCAf9a4tq41pmcKQXnJ
	 oN0X5brXiv+IiLO+EK06pmFM3p51vtuuIOFDSDRZnfBZgrZaPqz3uPC11/u+FFXUGaTrB
	 8zFjrap4x5OZzvo7hp99Gz1/yFP8vKqOMvTOoLl6QjeDUdjwGaXxApwCDQOVqEgZh+eo9
	 itVRFqWb8Tny1FpQK+1zOLITqHEFVw43/U9O3loPjL+mjK6Z4lQwZY9jFnm0+kTV2MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFnhDtMF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9831A606A337;
	Mon,  2 Nov 2026 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFnhDtMF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4F01F00A1A;
	Mon,  2 Nov 2026 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627481;
	bh=x91rCfFpcsWpvBNJ6qbdo7UznQPcNEOocHPDg2XtfDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gFnhDtMF99KSrTyU4koiSq3cWaCFpI5ekg2KVfNqO98t6l1/AZBQatgOCOrOG/pQ2
	 Go2hSCq/OqLeu5njFOukmm21G+SatvzHRWD0uQCHcsBmvqLMWVULT1XwfzgfAEEUD8
	 Hoa4n+DhdoU1hnS2SNsB678QD18YYLggJIVg3waXn2fc7NWz6uuKY2u+7ln5p8nlbI
	 whM8qP2OyLRY8Kj1XaGA3ZmBD2YbJKxF3M38nGSkcKXUP+4+mXNqP7oYyJzQyHQA20
	 RA8swOL9uf+fOek0b4Tvimi//sqV8BWdOWwF+n29TlMfbgDHokmQrKUPDMxgmL1/AK
	 GUxQCpD3mZgJg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8F2EE2344CA2;
	Mon, 02 Nov 2026 13:51:19 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Binbin Zhou <zhoubb.aaron@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yingkun Meng <mengyingkun@loongson.cn>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028104138.26973-1-phucduc.bui@gmail.com>
References: <20261028104138.26973-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: loongson: Fix configuration and clock
 error handling
Message-Id: <179357871536.1716893.9013994208028036682.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:18:35 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579; i=broonie@kernel.org;
 h=from:subject:message-id; bh=L5n+89opCxcmjEiHHhgS1e3jLMkVY1WMETd9ehZ9zMM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTA3PPhh3/fnEKxm11y10VN42qVtfN/luG+q3L2HNB
 6nFSeG7O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRLkWG/9VSzwTF6ip6atil
 gpofHEmwF7gtP93gSuTE1T82KghmWTIyTMntEK+aEPfgXovhDqMOOZd3rGrT66I813deWrFh3T1
 9ZgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 28 Oct 2026 17:41:35 +0700, phucduc.bui@gmail.com wrote:
> ASoC: loongson: Fix configuration and clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes I2S configuration updates and improves clock error
> handling in the Loongson ASoC driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
      https://git.kernel.org/broonie/sound/c/f65a035f1612
[2/3] ASoC: loongson: Use FIELD_PREP() for register fields
      https://git.kernel.org/broonie/sound/c/29ff7ad4e571
[3/3] ASoC: loongson: Handle clock enable errors in set_fmt
      https://git.kernel.org/broonie/sound/c/ed183ea8b480

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

