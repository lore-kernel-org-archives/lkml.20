Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608875;
	b=CBKZ6q6Q5BeIrqVrlFi0xjt1zKqSYJD9vFc21n+Np7XQlX6SokaQFHgKVSn7q69L7IiV
	 5D0pdgo4K7nWSOas82z/e1sqSGJScFDhUX4kxZJqBGZGI67TB/3K41itKo+3++feBCZmu
	 DdExX9GIRHB6JE9qNAyp4ZhYmj21TcWyXNo3rxIkivPENNhjendfJLpAeUWTE3p9POCqQ
	 yoQuFf/Y17401YFYtOR4fkHi91IkyVagwZhB+JU+gVmeNL6NPTpV4xglYrosWRmT+dSRI
	 lIt4C2mRlPGXdF60jqNqG+Tb/Yuqqbwg3MdBMLE5rLobXMT7es0xljZVTQbROwRoF1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608875;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7OjxRgbnQSIEtop10bcnBwZ8U0MQsr9RQ1EXvCffwVg=;
	b=oCOknFg1h1Gdj2PBjaNQ18Gwtcjb2ZSCv1OQ2RcoysoCHyUBhcBQCy1Fn4EIiu4IsKpv
	 ymxzuSOvLXaAXoh9jEHojdV6gifDdF85yarm5nfGCivlGrVqbAYl4ANu/BR0rN/xlZ49j
	 wNROOIjHgOz/G2FJE8/l7ESGm+X1Oo2+VHhzQ88fWboqw2XpLtTsGtA+PjwHL1ntTrXaA
	 5vx/5+XeOrhuqCMLDRMYK8FUM+Yh7QPWJLGUYHn5lMWb/7oqIhFPLGD6CUYJLI9kZEOPH
	 jTL99/LqXY8N9KmQ9xCpsmvIpEQOypsG2K+VX8a0liNRR3gMSRJfZ+Rzo/mu6hq+x3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N/XscbZC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427F606A898
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N/XscbZC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1144F1F000C8;
	Fri, 13 Nov 2026 22:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794608875;
	bh=7OjxRgbnQSIEtop10bcnBwZ8U0MQsr9RQ1EXvCffwVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=N/XscbZC2ZzEigXF9HKYQnrS1QB0S8gBbouSQ2TBAIet+HbmhgZJ1N/rumO/4OHyi
	 TdY5eq6PPTgFmkkqA5My7HBN8cep6gcXqV2Xf4lf7m4HA3YWkgG2asv2jo1vZlB2KE
	 K5DqsfgoPmfR/6lldyS6xYt6dvKJ+Ulb5iU3lmazq2bScW4pSMWFdUkDydRwBOajWQ
	 VKxkC/5YwzslNdwzVNCxwklqa8k2n5KpMhuHAlXTP2FpZ0+rAZxWT3B0iKvMLgmAW7
	 NgfNvA6h6abHxWxvX0CzSyVRFSIArZ3Iu7S1IrjP5IfYwhuS5H2YztAagPnLUUhEi5
	 E7KEfzAKskSEw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 3586F32636EB;
	Fri, 13 Nov 2026 22:27:47 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20261112071708.154511-1-zhujun2@cmss.chinamobile.com>
References: <20261112071708.154511-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] regulator: tps65023: Check the I2C voltage control
 setup error
Message-Id: <179460673513.448985.1264835687259304340.b4-ty@b4>
Date: Fri, 13 Nov 2026 21:52:15 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SLKEx3CpM5eBerkr9D7zjof8wml7DlE7vcUaQNMg/so=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+9z2KuZw8/eAP3uUSyXyKz+Nu+RziP9GQcGbthTN1B
 y8mLFGI6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEZncxMpwx/9yWIZT5zFv6
 lsNDRivxu2vbWOoa9qQ4/PCf1Tc1r4vhNxtD+cUtJf3hEv2T6xvjFhq+i+7kuuq/pdzTP+yUovM
 UDgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 15:17:08 +0800, Zhu Jun wrote:
> regulator: tps65023: Check the I2C voltage control setup error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/1] regulator: tps65023: Check the I2C voltage control setup error
      https://git.kernel.org/broonie/regulator/c/c6e419a07fd4

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

