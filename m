Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777237;
	b=IBFkJ20uEq1EJ2M5dcFu0v2uJQ4FYOZL/L8G2nn7oT+XIWFh35QBCuBvFNk4kDmYRU0j
	 QaGmYHhsKDey2s8vqaQl4NydXj3B4peOBanUJIZ14WsserXPCQ83ybH9gAg6WH1DWVRna
	 CvAzC8fSxbMoguw8xytsZlwnzb5dEN0y6jfWzGVEVFEiknorZtZaPIN/4dmxytxZmUXYV
	 lkxol+d2JPn3ecXnWjhR0tJiuepONeaH7bbxHpNC6PYvEDUy3qai+gTd3Tqz9/ZiTqsgG
	 SEY7SjWekwyt/PBsAyxFa8+cirrrygCNjMU6+UbYCQDKEIta3A59GypSVhNZGTI4W9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777237;
	h=Received:DKIM-Signature:From:To:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VmzXM/KFNthq78R0ultAIAxP1k9vNeitUrUDMUOy270=;
	b=KAfj4Ymxaz9/HcVy1szinoN5w/vvUXnIILwWvh3rkUPtdomFDPxGPwHGZ54xBGPTH9md
	 geO6Q3ToC1wXITwzJ1VCKE/JR+xmNfFhuTlxIEKQEjlz7AalQU4HjEqCZAwVj2uATxUeJ
	 yeuwK81Y3YOq9rDhp1zqyAg0jXnTowOlz6JMQs19MY9MiH1ivBLGOhYJxe2tiB2F6atA2
	 ShEcgmrhMqvjVZJskPm2yUDwbGp5QS7ibtjsIHhTY+Cl/uHJQJuWGprp+8MnyGqD3xUVo
	 7NpwxUuMeFyyz7ee4Z1iKn2HMvRXIo03CMdf31D8oP7RFAGSIKcdkWciqKE67ApRVTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEGtSGYC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E63606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEGtSGYC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B2F1F01825;
	Fri, 23 Oct 2026 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792777237;
	bh=VmzXM/KFNthq78R0ultAIAxP1k9vNeitUrUDMUOy270=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=cEGtSGYCBciUxIoPXRI/nwipI8shstL0TOIBWofbElgatmfqOiKRoV42cOUaYVgcN
	 E94gW+ywtssN0/tvd8YgagF1IQFkGVwxN2E5hUHauM34CZH0EDdDpOk3uX3HnJN5vM
	 82hj9xC8Xb17QptJsQ0NUM6n0ucmbducL7Eo0GgP5ZLTlrpGhHAQbcoFyDgpDvib2B
	 4U889iQzXpgC4AsQWTa6sUju8yeeQxX7muuaCCbhh7E6dVA39y9gZptHIIkWR+/aWd
	 3IK9wRUZcIIYA7Mr1t09nzQ/p1UOQ5mx8VEnaMInehwh/8dTfeXafl85ef+4ryYfPE
	 fuZeOy63Cc07Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-kernel@vger.kernel.org, 
 Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20261016100522.2582557-1-yaojiale02@163.com>
References: <20261016100522.2582557-1-yaojiale02@163.com>
Subject: Re: (subset) [PATCH 0/2] regulator: freeze delayed hardware access
 during suspend
Message-Id: <179277721871.3909521.2315744742538518572.b4-ty@b4>
Date: Fri, 23 Oct 2026 18:40:18 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=broonie@kernel.org;
 h=from:subject:message-id; bh=da1YnawriQgPkAKOTA1R2sZRGhqXn1nmTWQof/b5QUM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJuz2F5V78ldNspVvGk/7dt/T3Z9QuWLdZ5IWX9yZS5I
 jxnonxgRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZi8puRoUfg6OxzX7J8g6Js
 5jNpxkbtiPCNEVQSmifZoH7QoEFhDiNDu9y59Ksv3gfM75Ev/CibGH6qM73n8MMmq46OD+vbT8x
 lBwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 16 Oct 2026 18:05:20 +0800, Jiale Yao wrote:
> regulator: freeze delayed hardware access during suspend
> 
> Deferred regulator disable and IRQ recovery callbacks can perform hardware
> access after a caller-provided delay. Their current workqueues remain active
> while devices are being suspended, allowing the callbacks to reach a
> regulator after its backing bus has been suspended.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[2/2] regulator: irq: freeze deferred hardware access during suspend
      https://git.kernel.org/broonie/regulator/c/8a6d73e316f9

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

