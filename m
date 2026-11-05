Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875978;
	b=SM1+1a2YbXU2a2v4y2DRQDf+8ejv1gAfR1w7vUPIn7nuXG27zp7eJM3UWUT5T7uZ9mQ2
	 2mhVBSptml/wy3b/ArxR5WOEqGoxhJP8BeLGwtWQzbcY4sApy7H+pfiam7xRXBqzfpJpB
	 U+UP43Tx/LOBJnVglq48MfE831cU9+YHzKOuQToiGnoIxm/5Chf2mNsiQdBjv5vwrWa1d
	 dfjrIR6yoFEMwLLjx/HixpSRtqj0Gniz3DD05X/khofVYi+9Mjsb7GYZbIe7CdxGOs3H0
	 8tYySS8/GcE3m6QjCFn7nNmW3l6Xwuh1dIAw951oHC2UPrL2IQv5yfSvVfWevpjmM9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875978;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MVGHtppdOzeiFqvBG8XC7ezTYQsd1Yj1+NM/JZTts/s=;
	b=ee2YZWfs+6fqoFoxAfuzo3SeeWBrwCW5ldoongJCPRROcH02YFjhcV1VmR1pSGmF3xj9
	 bJslO1LOJyLfJfDITT3ZIaBLpLYK8dI+g9Fu01Lzgh5jJMPvq+wOXthGqcfo0vt3/LW8y
	 RsUOa3qXtT043Ts8u/cotJUBeuklRTCpfhiRqHEW1sjNyd1xmqesno1mGLT35FPiPWrjT
	 5PIvQ0fP2TwyDQCIKcqeif/1bxpT33hNyZ0vQnGRSpuu3NHlppvLXXe2IjAIFXgPhjMeH
	 5SXPJUCYspQj/Ru8JT8C7KBajQRbYEEzpXj36UqG0rDZBIxQX+xOmItneeNfF3cCVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZfmv7UN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C18606A31B;
	Thu,  5 Nov 2026 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZfmv7UN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE9B1F000C1;
	Thu,  5 Nov 2026 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793875977;
	bh=MVGHtppdOzeiFqvBG8XC7ezTYQsd1Yj1+NM/JZTts/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fZfmv7UN9nVN1irn6sYnMZZoJdcJRB3yqkIcbIj8H2KduvvTtNJmFBzC9JfQzJ33e
	 bzP1MKcJ1EXBuTMYQr1klfukLJ1s2JcuR2NqcCqPjocQiw0/TEpo9Smpf10bnu2Gil
	 qpmHeC+ZmWgjw+0TzLObHEuaySswnfMiefsCMfZQO6564QAgwmxtw/yqIIbb8vuiVv
	 bPhV9Q2NDqQ+z3xlmo6c52L60UwKZ5Y2qSDQOiFg0O7b1AXDCIIk0KRf/mFwhSc9gV
	 PvPa/mCfA/zOg/ZkgItoehS1j11oOexHeEq2tOxeWL3mT2Ft7Xh3FB6/Iu4GrC0RIN
	 9WjSC09qPR2GQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id CEF80272D188;
	Thu, 05 Nov 2026 10:52:53 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Wei Lixiang <weilixiang@kylinos.cn>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zhang Heng <zhangheng@kylinos.cn>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104015058.6-1-weilixiang@kylinos.cn>
References: <20261104015058.6-1-weilixiang@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: drop duplicated DMI quirk entries
Message-Id: <179383850554.2186205.17938518499173488591.b4-ty@b4>
Date: Thu, 05 Nov 2026 00:28:25 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SvkqLeLYXW7tGIc3WV5jB9yIsVi2uolcWzRihokRmMo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLexP8vbvwh8eS4cMbTnu6KaYxBqa/SH1s4Lrj84YnT+
 2c+lS9ndJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiC2oY/hdm/4xI1xNS6AgI
 CbD7cWehxCMNmbmSfH1fXbfq1W56Hc7wP97SVnv/7SBOob8ne8wY4q7sfrHUMU4lZXHpsuYV2RF
 veQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 09:50:58 +0800, Wei Lixiang wrote:
> ASoC: amd: yc: drop duplicated DMI quirk entries

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: drop duplicated DMI quirk entries
      https://git.kernel.org/broonie/sound/c/cf09d02dc0c4

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

