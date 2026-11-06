Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990369;
	b=aHDFpaKH2wpc83IAqBo1DupCfr7OvINEosnv+CkORS91a8F0GtU2gqZcZIxhUdbQ2eqX
	 CIz0vQ6xWT7azfy1RzWYw5S8sUghD+Kn0K6pDp/77CJJoZytLa/9FeG50cE8xs/MyQ8sE
	 PcSVzpwWJW56Il2KpvIiBqlj/XYjqnj0YI+lzHaQ7dbK5EXgxGI/QHKgU1qJH6UI5Mipq
	 PDqcUa/l+7jifjVnNwiJSbq1/rDNRFqZwOBO6/mXdZFLXru9TmOhh9OhhElICO1FAMNmV
	 lVvqrVfvC7eVxdbRWmue9xj4j8ETaQ6HKLsW9Qj5Sm+Avi+JTyejBF8WDwOSAtTQNcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990369;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=V9RMiOVHYBLnJLXrYobu+beQvJXlo5jk+ABCPnbiz8k=;
	b=fyfJ9J6A3PR3zdG3s2BVSns53s98L2hpM/u16yN4LLSQNyoKwkclPJ2/5KbkV6cWBLNa
	 kMv+m4sVcP1EolNxxMLsDNSaylajl8bGR3mrceTMoF9chPx4ZCHDuq+aeDhmU/7Zl8jva
	 TcCMGQYTIp3JVoBcnf1+u34R4kLojjyUk/gtxHCmKr5y/LtxVQyjnaETp+lPcqLx6duWf
	 1JzX4vKxbzCOSBZkICs90wPA4KTEc7uklI77jRP8YkXXnEZzFafbS4NYKNChZ5qqevBFU
	 ABsYEtmfhY5GtnXGtUMDQpirltfWGhVqbT1cAjL6FMf1/qlymGLW9oQ0OpzCHPIfKhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PsgPsVze;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E3606A332;
	Fri,  6 Nov 2026 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PsgPsVze
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5916A1F008AB;
	Fri,  6 Nov 2026 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990368;
	bh=V9RMiOVHYBLnJLXrYobu+beQvJXlo5jk+ABCPnbiz8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PsgPsVze2s1O1w2qzV/hdaAJsUTtt5mHsoCYMFFoHwJ5Xj9LNv83Fahop7zkWU528
	 8bZKL2n4MCPb1gZYU7Fhl2+vF2tOf9AjXlEgnH9Mrw/yJ3lhxO+r7QGpqCgRUWUY0c
	 osskyGGWARdtJ722NkSIbygZCaXx8Pu05mJ7KwDf7w1dXL0AuUQ5YXFVOgBSP7eVGd
	 c7htU566zd1rjakJ5FISZIOORFw9mWbTuJ3XThD9ifKRpqC1ri4RnC17LX1kLtMvJy
	 HFy6G2wLDPoEL7Fok6aVCfIE7aQH/y237tPWVSc4ubL7ijeVf7UZrBEpapoGYxE/QD
	 wpglVxO4SYiSw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9667428D103E;
	Fri, 06 Nov 2026 18:39:26 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: brgl@kernel.org, Yige Jiang <yigejiang86@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <rc-review-20261105-v2-28-d7877b3f9c24@gmail.com>
References: <rc-review-20261105-v2-28-d7877b3f9c24@gmail.com>
Subject: Re: [PATCH v2] ASoC: cpcap: use the platform OF node setter
Message-Id: <179397554483.3231166.14360331949546357631.b4-ty@b4>
Date: Fri, 06 Nov 2026 14:32:24 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BlD/AgZRu0uyfbB2kcwGXjLu9rHwXmLYy++h7ZkUylg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeyd2LKnd00FPOY/JRXhEqvbsxd570769WZdO/i+8rT
 l892XlRRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZy9igjw4XPVxL0jlyWTQvn
 nr4v1vp6C79cy5Itieuszj5/Pisq5iMjw/dpPWH8PI87TB8wnDDmPMpffHv6km2V131WiMxqW//
 iBAsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 05 Nov 2026 20:32:28 +0800, Yige Jiang wrote:
> ASoC: cpcap: use the platform OF node setter

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: cpcap: use the platform OF node setter
      https://git.kernel.org/broonie/sound/c/df67373b0eec

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

