Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972782;
	b=IgP1sz3+pN0Y0Xfvp9qdGvonRjpJ2x7WK9X8TOwU9ORgHlPJCYEi7vvFGQHZslqeneYc
	 0D6l+YTt0HqD/+tJ9broU/7RKFejFTXtdtgnf/3QfJuZ6WwPp+SN+JXhNa77BUT4/Yatd
	 GHFM1YqqkDAPtdVwVea8YaBDJlvmDZ8MDU7bc3DJ216z7gvhNiIoyLZG++hiEEnLpF93Q
	 du3mvXPqAd2Utm96EnFP4VK8zbphGxW9+iqYnI71smgLNjcG0yQiPXdZ0V7LtwCJwaaxB
	 DOVp6+CR5GAUPhcDGYxLn298G3dl9+NYs/anyM4uqbmWqSUYpKgLU72qfizRPTKyNPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972782;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=f1REOxmGWLN5huWfOo+/qaFkNhxdD6DxuvuFCXYE2Fo=;
	b=BVs7QgrcN3HwKqKxbt9HBEA/WKIyzlDTcJvEz4FMpytZnQaApVTpNlTGV/eTlCj+JGNI
	 8Ie0qtiIbz5F8bI1ibtWhQ4dr86/b5qxZmAOGRiyROVLsGu9wz7UUwBIpNNtjKxQ0UFef
	 ZucihjWxKKG76y0h2W5dCKNZ5igIelAqD89A0opHRU2HxoS0SzrqDPNRPzO278C6Y30AP
	 rcX9S3vrlLYaGQLWwlRebLAqPCmPx4MzI62otpVLJdqVrJ7LC7+QL2qnjYhcYUSoTsjrQ
	 s9WiDuvLXPKKLYnMkiEHsHfM046y4yCjict6o8aJZKlQCgyOnGRbeNtNRa0CHcqJfhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6ev6heD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F9F606D806;
	Fri,  6 Nov 2026 13:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6ev6heD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1F01F008A4;
	Fri,  6 Nov 2026 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972781;
	bh=f1REOxmGWLN5huWfOo+/qaFkNhxdD6DxuvuFCXYE2Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b6ev6heDP1WdPz+VbvdTrsH1RFmIMYR3cXOZwfj4SO8n4/FexNg/CDM+3HEJPzVxg
	 TkdYhkuehwINDUQ9HM9hn+jywYnGUY/Mt26IFY/hU+fNrYcy2pJw6KxXO8WZcZ/9b+
	 6MfMHiTaCkUgjitGRTI0q6B9PjEkAjOIIB4/rD9evpCUpazHesbAQDS3WKYTwanjzj
	 dEhzNTxARn5BHvorvgj1ompbuL3Y/t+HmOqV94VKThiprbEcpXX/N/MspjGk31bq/p
	 misrZ39YmU3CXs4xbiZGT9dmHTUPM4h/hXpsHYex6KzhOtjQZtH72JYAmZ8XjMDG0v
	 XiU1J23DDAyKQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AA41B280807A;
	Fri, 06 Nov 2026 13:46:15 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ravulapati Vishnuvardhan Rao <visr@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-for-next-v1-1-ecb1348f5941@oss.qualcomm.com>
References: <20261103-for-next-v1-1-ecb1348f5941@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: soc-core: Increase the channel map size
Message-Id: <179390357958.3073895.15014668292831794599.b4-ty@b4>
Date: Thu, 05 Nov 2026 18:32:59 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/zaF499mXRjCklRV0SO6Cpn9OQZTn89wUY9h57fwq78=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe3lJXn3DytYBC8xThyW6SK0wX9YoJyHyUO3ZJbomtW
 rwDg59YRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACaizcfwv/Lxp/D5M5ssbhmq
 VLP8bVtw+tLz5EsNC/he5ExQ5qhhE2Vk2OTPqfuOsXVucFBv8tOiGce8u37IsXLff18TahJrOOE
 pFwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 03 Nov 2026 16:22:20 +0530, Ravulapati Vishnuvardhan Rao wrote:
> ASoC: soc-core: Increase the channel map size

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: soc-core: Increase the channel map size
      https://git.kernel.org/broonie/sound/c/8f70d5f91611

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

