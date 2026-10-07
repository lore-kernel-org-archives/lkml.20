Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C673D567F;
	Thu,  8 Oct 2026 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443914; cv=none; b=fDjDtjzF1vF3K9pZQmUXjyG28fGlrdVi/YztyEZfjC/tLrhE+enAxx0bpx3Jwnjn1bJumr5nZUQQ5ukEQefHfQmAbHMV51RzUgs9JVeSOfLFlCw/PsUEGJS9qwRUvbjoSIGDPmKFMtxWIZ4CiPOIDssDAa2U8lO0OtjH6l/AS34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443914; c=relaxed/simple;
	bh=TdV+HWlIgLPpyXaQywH7Oz1pJ3kWIQBUtaKLYOr1Kg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TM0pMACpz6/iKOg7TuUS4syAHmjQFiSf6AEWUryZmf84u1Cf0QCzKe4H1i3WQE9hGGc/zJD4bAW4ETGMz7rIXpuC3KVGZdpCZoW63yQZBUThPa6XLyPolPYzYdUpHQfK1iwDgWVeBW9lCsA/cbMiVa/exSqxDXUDBOMoHc8+TqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBKdaQCC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBKdaQCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2561F000FF;
	Thu,  8 Oct 2026 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443912;
	bh=i/+stlfT2Lq4mGo5w75oYKPCnXjZu8T9iSajrBuvcns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CBKdaQCCiq+NykJWI54gfNhND0k374+HwZx5OI4FZ9lQUyiAbwaLJ6N6xE9HmyNTB
	 3O1iPRkSPvxshfZE2VAbWt8gnb1WZRAtb/aharJCALgEvjMlCON3NJ9emmut5Tmh1s
	 MtBoCKtHRHer/N+1nygw9yvI5q2xy5nTdOFdSwpbD5RYbzc7ed+aWQIwMuU9TP0qbK
	 Iq03VBWOu1iJP9/+FwlQaV3d/hTY6ZNwylvB6LJozmKCk0qBBzJK5lxZeav4ajfA2N
	 vqw9s99w4jahrA829IwwP1tBONBPL3mIyOFAx2+9tiACDFWgIpVewn6F/4w+G1+9nR
	 wlU8xe6G5msKQ==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001-cs35l45-ldpm-v1-0-545787a5afe5@opensource.cirrus.com>
References: <20261001-cs35l45-ldpm-v1-0-545787a5afe5@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l45: Adds support for LDPM feature
Message-Id: <179137129144.2423942.14604502978432997591.b4-ty@b4>
Date: Wed, 07 Oct 2026 13:08:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TdV+HWlIgLPpyXaQywH7Oz1pJ3kWIQBUtaKLYOr1Kg4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0PBJOjDawjK4aUtqQKPKHtk4ljWO4TMwHfX4
 PgWso5MH/KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdDwQAKCRAk1otyXVSH
 0CJIB/4orVHGkGhwrQFh353DYNNe8EDA0f/U1RjPKhK1wryRs/gfL/OvDUytRbt1VUR6+W4cgis
 37OzbdRFYNIDb3E/jx4xsSv/Azu8GiJlpxECeb7KzZSeKwLGJB2AzJB3UnYaqiKKH/bR6LUvSS+
 xxzI5TLHyZMmCv9TXctINhSRdxf2ZT5Eou3fk1wYzZWNnLYTlc4TOvt1wTjB/ynQ/tlmlmINc2q
 Hr3w5o7cJHeOhhOhCYwD6snZ7woYUfZVWHih2Q2SCQ1QOam1dZz+edBZtVCWgKniqDpUuj2AqCQ
 l+ZOn8DDqxZCDApaWMhMlNhdH+vjmlsOxCJ2nEfZ673ssIfo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 01 Oct 2026 10:14:26 -0500, Ricardo Rivera-Matos wrote:
> ASoC: cs35l45: Adds support for LDPM feature
> 
> The CS35L45 has an input signal level dependent power
> management (LDPM) feature. The feature is used to reduce
> power consumption when the amplifier is playing sustained
> low amplitude audio. This feature is made up of two
> responding groups each with a distinct threshold level and
> entry time delay.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: dt-bindings: cs35l45: Adds LDPM settings
      https://git.kernel.org/broonie/sound/c/cd4c07a11ef0
[2/2] ASoC: cs35l45: Adds support for LDPM feature
      https://git.kernel.org/broonie/sound/c/0ad64fbbb7ed

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

