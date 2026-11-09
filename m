Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242914;
	b=3TK4Z0YkkGMSnISWP+b1UfD/RbuffAZaoIQBT5dFKWGvoFRhDeygX1XWVBNVwys8FtWh
	 DvTBcdbhalEP3TFDcb3d1b+twxBwHNHwDCzGElggmWUcqkhCWKBcLAUetyfc7ZVnyTzqt
	 4yiUP/I75N2Fahgc6Y6MHJ/FNnH4ODCPV78yCEF8BZ9s+m1fOjGpzlYDlWjAgBAc6aCfq
	 0QJ+8P2/wy/em979cWaMvEw7ifqaaQPAZowjZ3y1yu5jYzo7WDMQs14eejMT0ZFVlleOt
	 9d7CC09TDC7rhJjxam2/3vLaubmBMvwIbuAa5wKSS/PbhuTG5NOyt3mgKKShjPFx8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242914;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GdDGOAbB/KQU4vtxa83AQst4hcGs21jmt+hYBHudx+4=;
	b=RTc94lfjdB1iCVdbF615ZVuH/bWsMAr4/aYJMTip0xARDvRhHC8aWUJwC0cA6NnYE8n6
	 LubKU16sR5FWKZ416fnuP0EBAyiQasztRh5NBl/hVtPewFJ6N8QqwXKU9EW9MicM29Ea+
	 ohhE0NKRFypAkpynJjCyifpv6lLZjpcylGwZ5hm3Y2d+XJAY3qJvuxgKM3HmHWT4AFVyc
	 UqDbT/TLfMLMgYrUB6Z+naU5go8Gh1zl7lGHyb6YUr4LPosn0VnMqvQsmAxysXUES8uQE
	 lxuY9SOCAC1FpS/UDrOZlFyunXs0o8psRkIWwdgkE7gtHuef52RZuE86jQXh6bXyf4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTYgV68L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE60606EE95;
	Mon,  9 Nov 2026 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTYgV68L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1091F008A6;
	Mon,  9 Nov 2026 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242913;
	bh=GdDGOAbB/KQU4vtxa83AQst4hcGs21jmt+hYBHudx+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OTYgV68LQfLSbQrpPuh1WJFfOaf/IkL6cIfXaPKC277+lYfAq5q4qnewysjVcP7r1
	 l/eJIiGSvXjecpKQEJBhVmTRiFxHr1OSNJJqWeXobLoV/Hr5dszmwwcL789dno8Ozd
	 Y0RiEQyWoNyrWyaqGBBuXTxnGUl6+wpUyQshldWRaCzRRtCtFpOPscZcMhZGugQ9VX
	 i5vUYdovs4GsWEHi1IA3thUY0m9o0iQpPOR2zlgAvfkgicUvNwC3XpnnaJgfaKiO32
	 RuRVNG4Z3DJgdMogZ6CKT3l35xrejvKzJBwvHmvfUpSicJ+mroU7gLMfxPAk6j3F4K
	 k8xFbkQ8LPU3A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id DD2B42EE9BB1;
	Mon, 09 Nov 2026 16:48:25 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105063153.353012-1-zhangheng@kylinos.cn>
References: <20261105063153.353012-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH 1/2] ASoC: amd: yc: Fall back to DMI quirk table when
 _WOV returns 0
Message-Id: <179422737491.3711751.17494017501899617981.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:29:34 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z2zvrB5Q294z/4N+C9OWqKKhjp4aivE6Z3pnWZa+AIA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+/ow0SRC9N3+xvHpBQKvQ9uWMB05d3/DNIfSR2e0pa
 1x89r2b0VHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJCDxg+O+pXff6c+Cpmd/2
 fVm4Z5vph+06T28c0mN/opW66OS+jnIBRoZZtVHbhTgWzJ0jGbvWPWHdv4/irNsz2Z4nWHy6EMd
 Y95YBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 05 Nov 2026 14:31:52 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Fall back to DMI quirk table when _WOV returns 0

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: amd: yc: Fall back to DMI quirk table when _WOV returns 0
      https://git.kernel.org/broonie/sound/c/cadc502ad7ec
[2/2] ASoC: amd: yc: Add DMI quirk for ASUS TUF Gaming A16 FA607NUQ
      https://git.kernel.org/broonie/sound/c/dfab155ecc7b

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

