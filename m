Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226564;
	b=yXvsK3BY0sIc7AT4/AwlIEgq2ybjXvq1M+2eQAGp9HOIFDDaWaU2rsV1/s4scuI8RJ2C
	 syLf/Iu2bZUBTP0mzxcvd5MCjN+mgbELbH78mwbHokmT2b2N9PbbZJ1FIAhQuPEKiJ8zR
	 K8fSCkLEhUaxVEmoGMXdcpby9F++BX0BGiIWCYT95fEh+nSnFO7qnCNPoL5k/aWWV80n+
	 JQ0qvRGnzXw+UZsGFlR2Gs+6y9zo9QLiSpuLAd3rQP7oOCAgcM2PeWhsFW8d11nPYa5fp
	 TKs/gEnNkzXIB9eTnyZMSGLPtAaKaYPeCNI0V/ANBmUOrqK+Ppn1bVFpZG6ALMf/IKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226564;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NCB7IsxiX+6uB/uvW52GMoglQWKcGzBf9Uf7Hf3mvHc=;
	b=hIJhSiyyGzm61sIyfD8fymMeRQ0Q+VPDMAgnW5+Rnl1beZBMz8PZrKhPfG2QqKWLUxT8
	 uVLe3zqJJbH3quSKuL6sB3sCpzwHhAQ4PAMCOKZ/EvDvXL7bwqixrprMnUuI3w5R/Sg09
	 QPdDe4C+QST4MRiS/aXYr1hb6ddww/JGFwcw9t8HJK6+PA5OEGoM50SYXW4PhUAClRjot
	 fAa4Kx5auzYTyy6ikwujNw5rfeHqHDyw7JgiaKv6eOprlq8AdbzPe+V/VeR1aMYSmQB4K
	 bmUz20bukH+GXrRQWls+10e29mGrD084wmzhbvEJOFtHWFugAzbVyFeoENMVNXz3LHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bedv/meE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063BB606A333;
	Mon,  9 Nov 2026 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bedv/meE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750451F0089F;
	Mon,  9 Nov 2026 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226563;
	bh=NCB7IsxiX+6uB/uvW52GMoglQWKcGzBf9Uf7Hf3mvHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bedv/meEAzo0vcNb4wHP+5dcdv+HeCwx7BnlGgcKywMxXGBBpZQeJLVDfMpRJMUmK
	 UzEHk73QQO8ILDcKChLddOk+fRVUybFMLjF0Jr4SekpEFDj42/TQn5hqIN1rSBDjln
	 owZfgoGRZZ0HulawKjBVVYW1e1ATM+6QvDf9/JbK7pZtIUEei11FUnCKOIP4rxPGIO
	 m8NrUX5iHgcfd9+t6ouIsyvwgSXeKTd12EiTzoJ2uk+mXc6HkBerAkO039HbySE7gr
	 oYV8tzPhwuNrMhNVPkmQJIQeA2nWGspyMJHR+fKZXwzuVT5LoCORvEfacolKvab9J3
	 1CkusD6qhzk4A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 54B362DB91E2;
	Mon, 09 Nov 2026 12:16:01 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Viacheslav-Illia Detsyk <detsykvyacheslav@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105151839.13524-1-detsykvyacheslav@gmail.com>
References: <20261105151839.13524-1-detsykvyacheslav@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Acer Nitro AN16-41
Message-Id: <179422141209.3711751.4109815932235536585.b4-ty@b4>
Date: Mon, 09 Nov 2026 10:50:12 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9WzjpCXVSZXeGIDb4BAkQsbu8m8xUpCGaRGbNqN7j6Y=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+7mzkPzqtnO/xzvMztXQ0ec2unfm/rmNqdKuQ8D1d5
 aarKv2WHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI7wmMDBdnG17+tmGh47QW
 55ubYvvNI/22bfWdM/XJvus7984qXbuKkaHZ92nn5Ndnv009754vsFQgoJlNze5xd7k3X8vby9p
 F7AwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 05 Nov 2026 15:18:37 +0000, Viacheslav-Illia Detsyk wrote:
> ASoC: amd: yc: Add DMI quirk for Acer Nitro AN16-41

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for Acer Nitro AN16-41
      https://git.kernel.org/broonie/sound/c/05998d64426a

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

