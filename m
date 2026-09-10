Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512BC425879;
	Thu, 10 Sep 2026 21:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074589; cv=none; b=iBvlcMZhHk3pj1Kt9Z51CgZ2UqxygNVPIYzIctXqLcMre74V7EYJUVhjOsocgEA90ljvDo8Q4tIpwbuudR8SPlPo6Ub8ox4ZkP4+hGYaDXPKQleZn3Xg0R8N9oGURD++vmEJItdFZ1qOqVgaWbLd4u8YJV9DZ4EK+VScFZkfDG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074589; c=relaxed/simple;
	bh=wA3FTcvtpONiNfEOo87O4FkzUie0h7Ec4TPtMvW+n+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NXtljHI5er1tEfXlqrO3/xx/zyWvSMZGVPseknDfk8ZhmLZ66OhEv/l05lxVpll+S6Hbad+/u83xrf2OnbUxBfluMxkgCbYjrxnqtOeD8KC/Y6rAbjDFuo0ew7jDMV43ZYONWLi0qP/1Bf7Q4/UGXJpMc4hUh4VL4xMcLqZ6NyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAA3/mOT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAA3/mOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516EC1F000FF;
	Thu, 10 Sep 2026 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789074585;
	bh=Y4DJeH4vmWaBoK+F2AguCcNnUwUYbRKOT6u3uAsVJ2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bAA3/mOTwI7jnRoqrnMblkVU8DdmS9m4rPTNoSbfMywSid4CFASQkwlUSv/5Yx+9Z
	 paYfVzzvxasN3ZsUs30EH6huR5p8VSpXsiM3hNlJVIx1mnEKwUMnjhOJc87bE9kPHq
	 z8QwWJoQhV3wE+apJAPpw4iC0ryRnfMTriSquWDlsLV7+wi6EwBZlYfHyAChyDHK6y
	 z9/WepnWgAH2V+QgRtcMQaqsI0L8W4ctHF+Wi6wagR1Vb+ZPS/bVjriY87EMxr/83Y
	 toa6zKE99TrvUCGoUBlufKs7BHNMDWytkBJCsglIvNa4vEA0ztour9hW5TAXnMH0dJ
	 QqAblLerzgAfA==
From: Mark Brown <broonie@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
References: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
Subject: Re: [PATCH 0/2] regulator: Add MPS MPQ4210 buck-boost regulator
 support
Message-Id: <178905591485.87467.6928977968973950947.b4-ty@b4>
Date: Thu, 10 Sep 2026 16:58:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wA3FTcvtpONiNfEOo87O4FkzUie0h7Ec4TPtMvW+n+0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoxyVlolVPEy1bWRQhIoWLZVxszaf+tL0D2nY/
 8uBMvFSYSqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqMclQAKCRAk1otyXVSH
 0Ad3B/4zF2mvuetZ/8qFL14+Pj9EpD13yRowWuYQ94Qs/e+qtkYO5MGXefi/nV9VnOLJngUNM11
 jaMf2KVXZED5NlwLVw9ItLDsTyZEayH/0YuUmQ6B79vi+rCGsA5s6KMtwU2K2/oBoxg7s/5VeFP
 f+ftRu1y3yvpEX3Q0h5jcYcLVEo2O2sArX7KhdIbzdG7QP2zZcfNuZnBmRH8EtxzuUTSkyqdFpz
 i/P45ISmDoCJW2U96J2X8WYD66s5Rpd3LqtrShAnCh+pQ/wXmdEUkyxtsoV+sc011tYU+Tis9P5
 MEXspEre7YBit+9uIRVQjGvWcGg5bZ4t4BRWCIDP8rvdg+yF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 10 Sep 2026 08:51:40 +0000, Tapio Reijonen wrote:
> regulator: Add MPS MPQ4210 buck-boost regulator support
> 
> This series adds support for the Monolithic Power Systems MPQ4210, a 40V
> synchronous four-switch buck-boost controller with an I2C interface.
> 
> The output voltage is programmed through an 11-bit feedback reference DAC
> with a 1mV step and is then scaled by an external feedback resistor
> divider, so the divider ratio has to be described in the device tree. The
> same ratio applies to the reference slew rate, so the four rates that the
> Control 1 SR field selects are scaled into a per-device ramp_delay_table
> and the field is exposed through regulator_set_ramp_delay_regmap(). The
> current limit, switching frequency, dither and interrupt registers are
> left at their reset values.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: dt-bindings: Add MPS MPQ4210
      https://git.kernel.org/broonie/regulator/c/e3c05a881fc9
[2/2] regulator: Add MPS MPQ4210 buck-boost regulator driver
      https://git.kernel.org/broonie/regulator/c/61879d561e91

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

