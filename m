Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99084CC639;
	Wed, 16 Sep 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553756; cv=none; b=IAWWcVOia4ZfPvt2ltRek3dhlTjJagbGQGBZ6cys8o7AkvGNTSdQryicWeiKojbtvCC+N6iI0bT3IjG7qJ6jNCxxg/bHGg3n4tyPCiRwvX5Pi74xZRe+VP7l7iQoMlwIU55r9qk09+8uzIvq1lbgfJ8N90OhsJwmgWygSKCcTL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553756; c=relaxed/simple;
	bh=olwXmWWD5/VDL3lReM5qkzSEwfWmFBUeBxlSOngJXvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GxSZkHXA8m6om/QWthdL+IkS3lNKamliA4NHSjakoaYR2mVGE+UeLW5DK7yilDuKaj9vqJe+hknBdkWg6yPUAtwQngcipgcEsf1VlljT8x4W3MX0C1l868RwU7x+TRydvR84qP0E2dhOqGtDn162AsPnVZ+Yzj/ff0UH70d24kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwqjpl9V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwqjpl9V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C331F00893;
	Wed, 16 Sep 2026 10:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789553748;
	bh=cy58rR2/f5xL8mz4JuS9VuaCXCM3ja3S0G5hRRfMBa0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jwqjpl9Vi6ffH9z2im8kJkhz+wEWTX5QXVsHRa8CNIcIJlZjbqGq+fGnOgPwX4bDX
	 h0MtNdowA+fROsgH0byO2zaA4RWTFdz19qib85WMbXwnSRDEMdpy3IMlIR7Cbjg5hS
	 +0YUa+/gFdQSrEixvl/8R23KLJLSTq2hNlmOTkqO/clYkocwB22G5C7JcdzPFO8W42
	 QH9SeIRkWQwyMrmNp/ZWyyQNAqOENnL4VQyrXVHsOuKkY0bYk0Y9bF99+VdUuZglJz
	 Q7R+P51fo//cI+pTTxyz+TVZw025YYhfZYC+/gjIQ4KFrc3FGPEPAph6qJ/UDp7L1I
	 jVmUqTS9Nn3eQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, HyeongJun An <sammiee5311@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, mripard@kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915092515.2638542-1-sammiee5311@gmail.com>
References: <20260915092515.2638542-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: Report a change when the channel
 status moves
Message-Id: <178949262598.151760.262557792934660743.b4-ty@b4>
Date: Tue, 15 Sep 2026 18:17:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=olwXmWWD5/VDL3lReM5qkzSEwfWmFBUeBxlSOngJXvU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqmxNWAcvIIj2yq7VlGqdfoY2acx3DZp/z/c5f
 5aZI3jD1cqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqpsTQAKCRAk1otyXVSH
 0HVAB/9nmPbYWbk9gmeMu0tFLovYwLdce3eQWiL7QnXmiDHOej1QTBDUUaGKGiUhJ/e7nmk78wg
 mX1jNUrzDXiKzW8/kTMEnAWwNj4wAA7yj/JdxOxR4Nd6VJyxMYag3S2IiFSa46HPTE1Myx1H7an
 XHOoRhq95SFFtMEm/VdCOBVqp1mqOrs1pqD1vtmZE4HAMaNl/GcbW14Y1jmPmFkydOyBQqzb7ol
 eQLd8M7lVNiGZxzAgiTJgcsB4QIDGYr8Cdl1dyql/MS/Mii9jDHoefqcYDN3QxNYNLRWS30njsF
 jN3aJexoESTc5t+alnvf7LOsCsYHiBz4H3LIuy8iRpGzbttQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 18:25:15 +0900, HyeongJun An wrote:
> ASoC: hdmi-codec: Report a change when the channel status moves

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: hdmi-codec: Report a change when the channel status moves
      https://git.kernel.org/broonie/sound/c/7abfc3b5d513

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

