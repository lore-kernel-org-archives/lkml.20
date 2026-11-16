Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861964;
	b=bVWVbE/rHf31y1yhjQrvPu0vVQEc2RHuVjN2V/fMtCzxtFoxCDSG72bqrpWKMpwlM7Ba
	 kvuw7aA1bHX655ZzBGHg0bNcHlSPGnf4bLMqd4Shd9/EXhMmX+pW0JoQpy/7NCpcI1IKK
	 KONJJLsqZPp8RJuabDCPILXG6tP7neay+rNBNHx2POtLNfSrFMe8y9NTPPZb/Z25Zu8Pl
	 yv4mLhtA5n/gNICSz7WGF6w0Qgg67vblfP8h6mndjyM3G7Tazn9LVFPyuyzEo5jdW1/fY
	 pAhfb2iQ4cCSVCw3w49FeSNNyn9pSgM+T5MasXVwYk2O/x91XGl4v03vSBL/3cWaFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861964;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=D5CFvabxdXvdj5Pb/bRsHk1N4pYfVVKu4F2ipeUpnTg=;
	b=JKV6X62wy+47rTNh6Rqw28OKShZiRXvrerjLhDKs8aBwIKOIlrvLbccwNXUiG0vjF+D2
	 26y5saOtEJ+OwrCSjGjMtiXZrKts8Mgm0gX4KKILxqhrLCo3W4Q4feoAipdgcMHi2SsMb
	 sAptE7MzH5aQcZrudkDIWgCuJad8lZhYoPJhWM2XpXO1c9+/yZQ5rgWD+gTtFhWtGFeRm
	 0j64iwu4H4gp22f2chrRA3sRjuLEDzyxYDXn+zQXZhE/JRWEqi5mSYn5JOWdi/j/m7BKB
	 TjnY1x6ziFlWRv3MOYo5uoIDbHSektAngHweT/lJALpN5vqGT8B3dSiTKl/xQt0A/dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqdZvTIY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B2606A885;
	Mon, 16 Nov 2026 20:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqdZvTIY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A470C1F000C4;
	Mon, 16 Nov 2026 20:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794861963;
	bh=D5CFvabxdXvdj5Pb/bRsHk1N4pYfVVKu4F2ipeUpnTg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MqdZvTIYBBpBeGl+hOdQkeMLcdT8bfT5lCZq09++OlHgahaypUkHtf3sY+C7nyOCF
	 Qs68axYmbIGSrfZzPWEqZ7LgXaozVIg9IWjU5HPIADW4gN0j8aF535rtxWNnIyKfJv
	 l1isNRFSYNMj1D+7TNpJ0/t8h/ZC87rq5DsQDI0R4AiuXVpaacORbco0s6jb0KtRew
	 I38Nqd8i4CLQDKO0F2qpp+2ND0AwFQ6diWvD0VT5Af/lad/g3XFTeVC2yhoouwsTiv
	 g2hfOdCqXJSSg9qZDR8+PN2f1Q3ExnEo/DZ6HvK2agEffP87+3XwULGQ52h9oER0YY
	 Zo7e/OMzV8e5Q==
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <8C4BD8E710508D85+20261113060659.1497641-1-tuhaowen@uniontech.com>
References: <8C4BD8E710508D85+20261113060659.1497641-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: ak4375: Power off the codec if runtime resume
 fails
Message-Id: <179483989530.186909.10662004453625714115.b4-ty@b4>
Date: Mon, 16 Nov 2026 14:38:15 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=w+U1nhwNZGwvqGjBQCg37I8bG7XEd77gVyz7lF3N3HI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+Z3e8CapNib/I/L+AZ+vXXSrT9I4+UXhhfmLX/o7pD
 U+fsa5V7yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEZMwZ/jvm2RlfzX1zen7M
 5AnhzdUL+XanurlaliR3fhdhPHai5QbDf6f4ldJHTFNjLZPK0ztORSUtXeP6sHTVvW3OJx6wKnk
 rMgAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 14:06:59 +0800, Haowen Tu wrote:
> ASoC: ak4375: Power off the codec if runtime resume fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: ak4375: Power off the codec if runtime resume fails
      https://git.kernel.org/broonie/sound/c/3b6b481ab868

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

