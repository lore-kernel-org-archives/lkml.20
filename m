Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623321;
	b=GfJafON3pvFh2wXfpWT6Zo4jIWa2jfv2mHgmrNEPBpkJ/2VW7zTH3E8r6UFV7SPp7OpF
	 wxhqnq7DBk8cD3uCioXUKRf/oV47jJ4NUae2zK6DkbBFcYHBzJafTqv6qJ/mtfwRTkxS6
	 M+6Dv0Nq764LrvBEJJVyKVtbhc1ISVc+HWZ2u1pTFcGz0LFxcwjJw+RYrqL8QREViIl5m
	 F7HC4UmQq/iAWhMxb6DAGc9kFZ9dyXq59m9Vn8eVSAbCdlTi6ljqmZWxwaZV5HogqskMh
	 wUfmMaZx8KM1Ugftpgdw7OsgYGLzque0LvzNzcEbIVgD5ajXo+/rj3JoIrQuA/jydkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623321;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7lQkyy1/pRpP8p41cOakIFXXXUGW7SHK28G13dhCbDw=;
	b=Pibs0NM3Uz5J4OG1+wTOrWZzn67Bw+RLbkY3c/aPHIPpQsfkIqcXQ7NGroVTrZIdSOLk
	 gZWzQTBMj4m9CiHcy1rlGQMZ5gYPRMSikGAjS8HiQ5BlnxAAqsaXPTiMpzOqPnvmiT9Us
	 R2RQHUwP9sX2TfboEG1eQJPW0BxhHFTE69v3EZISj6dG5VhfEiq/DcpGK1MNCmykO3Hg5
	 ZgvI6n0Jww4OeVzXH+9vBKezT039RpUOSneZH4LW3w9w5ux8Dp4wU4j+JD82+qv7tBc4y
	 CCH/MZ10PgDnrmFZjlMaIQlRhgvUXo6yba1EyoCWWDN8i7UH8+8c9bEOvFN86Z0mf9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKlxbWRA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B526F60A262C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKlxbWRA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DA91F00A16;
	Mon,  2 Nov 2026 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623320;
	bh=7lQkyy1/pRpP8p41cOakIFXXXUGW7SHK28G13dhCbDw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NKlxbWRAvMWWuMMLRUXDe05FesWXwP7uZOuihZF/jH2gN8o7Ee5mrwmiXCPH5CWJn
	 X58nl1Z9iUeONpUQapp8Hf0yshWRDKrwLLX6+NzQ2sXuLcdORryyCtt3MiooeX+t/r
	 AZbs4pIPqam/E/iL38TQuBFf6crTT71Hf7uWYAzadOyaLlTVo/OGGglC0G+RDsqokp
	 4cGDf931c6NfNrsTrO7GcWOtZF+wSHU/nk+jjAXIfiCDDJ8lHg+sFWotznPRnQavNd
	 VZD62otqCLE0RUJmKJYPg/f9WmQMCULxw4nBZptc40ZDqg6swduvGlBkYevDiobQ7W
	 A/CxXJoZzMGnw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 547DB231043F;
	Mon, 02 Nov 2026 12:41:58 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261026-regmap-drop-region-min-max-v1-0-2c28637ede23@kernel.org>
References: <20261026-regmap-drop-region-min-max-v1-0-2c28637ede23@kernel.org>
Subject: Re: [PATCH 0/2] regcache: Validate bounds of regcache drop
 requests
Message-Id: <179357833930.1716893.4233321219639536848.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:12:19 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WFsrvkMOj0qf12WPSjft39A1kxLuySxY5HsqmudtU/Y=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetIoxmf+JT7adaOeyZn/Tlf+qojb/2R4ZbBSsY73//
 nbWjHDvjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExEjInhn2bF1phlvWVmfw6f
 05w+dfWJyOdPbf7e/707KuH078Mt068wMkw2+hna/pXrY9sVZXG3jJ/mtalO05eKr+sNvccVu/t
 BBT8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 23:32:06 +0000, Mark Brown wrote:
> regcache: Validate bounds of regcache drop requests
> 
> It is not valid for a caller to try to drop a range of registers from
> the cache where the minimum register is greater than the maximum register,
> and doing so is likely to trigger bugs in the caches.  Reject such
> invalid inputs and add a KUnit test for it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/2] regcache: Validate bounds of regcache drop requests
      https://git.kernel.org/broonie/regmap/c/0334cc4c6e26
[2/2] regcache: Add test for bounds checking of regcache drop requests
      https://git.kernel.org/broonie/regmap/c/3547211537fd

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

