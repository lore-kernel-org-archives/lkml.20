Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523523D3D10;
	Thu,  8 Oct 2026 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443688; cv=none; b=U2RVqgVft5aB3/P13Pwi+Lm8/6lVbGmZ4ckL88FGQri+8UUGebAkVRgGtdB2tG2Vv1H4yIikFinSwNm0AbxxByjE/g2aExJOUTsceGXPyGi8wb1mpRLhPuon4H/YosRdUrEu2cWvwOmdRbhqc3GmjAeYwsXI/6T4TOJlFg0YONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443688; c=relaxed/simple;
	bh=AnpswjoChm3jRkIvdECNBMAx03bMKTXENfye+k0Whbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OLxTYrz7PfonOAi9RbrF7okbn5kL7MQNO4PYnjhy3VmxbH89sIrcTt7cWt+4NrT8MBv3IGsBFYo/7misgaCOhg1bDtekQVxAiWr4y1uq8AddO7BboLfd3ILgJQ0STM9bHQDSA7x/QcPAJKZsoSCd0yluRLox5V13ddpwmmEHvyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmtgQo0R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmtgQo0R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64991F00A03;
	Thu,  8 Oct 2026 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443681;
	bh=ZDuSMSwXBjSGqkocezj1cFOcOwDJ/dYTemYHyq9HCR8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dmtgQo0Ra5HAafhCTyphD6AIb/muev+aVpqafoXsCyLjhmCDzl7hnGt2etHDL/7qX
	 auF9RV23L4WaFtbssP1tAY6dTPtiF1haCzqzSH4CwYnX1ouyw3Qqy/06b3TmGJOY45
	 BDc26d5RUonVMm+Od8UIExoa/R+w7uySQMQrEPD6RNcP5XgG5OME1ORcDvUe8AGKHy
	 stH/XqVCyXFl4l9XSBCrf54utpZJ1HTaWkUzjcupBEGhshuwUNLwp1Z5QvM7NSqLxV
	 yZtEo/qbpV30nTJgMyRJoX8vTTW1JAqRT6amD3NBgW3d0R2De85IhLNaNw9umKB5cn
	 UuApr/oplAfzg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261005155235.1386525-1-rf@opensource.cirrus.com>
References: <20261005155235.1386525-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l56/57/62/63: Use the correct SoundWire
 DP for feedback
Message-Id: <179137209268.2423942.18316072226348906322.b4-ty@b4>
Date: Wed, 07 Oct 2026 13:21:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AnpswjoChm3jRkIvdECNBMAx03bMKTXENfye+k0Whbs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0LeOx+cVSR3sHTYps0w7E5P4ARZ3hvfxjFdf
 mMJbc3lB5yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdC3gAKCRAk1otyXVSH
 0DjpB/0U69xDhJjUVbZl8Zub81bKM5WUtQGQqCXFpN4DWVICvZ64z5TuRqEW89xLBoJ0giNVy65
 Y+uqR5RbPN/zqT+dfzXUdW7Uqomxy2F1dZ1MMMohDj6gkN6Z2sgnGI7tur+wco+imXE7RRQpHGT
 kU7QoUHZpfxxibqTVy/Qj9OLkJSp+w5oV+5rfHxuHofR1sXpoCQUvkQVej/E1to7Kgf3JPGZBLt
 VHLq9meNEsE32dzku/ZDQM8RH/9BCm1Rr0DCkMJW2bbYGi77aXPSdLOSGd6T+46wcfSyEKaj3A7
 Ekk4R4jK6FxKzKTGXhytxcS+3Dcn3ja26GGwH/cOla469wiT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 05 Oct 2026 16:52:33 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56/57/62/63: Use the correct SoundWire DP for feedback
> 
> The amp feedback path (AEC) was incorrectly using SoundWire DP3.
> The firmware outputs SDCA OT25 feedback on DP4. DP3 is reserved for
> SDCA companion amp.
> 
> This series adds a DAI for OT25 and switches the sdw machine driver
> to use the new DAI for the feedback path.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: cs35l56: Add DAI for SDCA OT25 stream
      https://git.kernel.org/broonie/sound/c/86c8360c97f6
[2/2] ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 DAI
      https://git.kernel.org/broonie/sound/c/4b7f393a01f8

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

