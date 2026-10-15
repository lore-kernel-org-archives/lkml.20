Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491DB2820AC;
	Fri, 16 Oct 2026 00:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112394; cv=none; b=avosCe4Lfg/2CI2aUvg+wGYcZNQtks4IA+h77dVVIJq29YgPC6Uvf1Mq+8mvuAz8+nM51JmA+FMGhn+qG0Hv6x3Elb7/HiiMugOklHE5+M19UaNKNrJdFEJfhyubkUlnfmPnnl35klEfSjTggI3pW94QYGNnwnbKHRoNm6a8Lwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112394; c=relaxed/simple;
	bh=bhxUi/N1K+Ge8PeG2iUaR0AVJxrLfzTRUO40jEwkrlY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SLq+ghLUppcq9NfJ5scO8QZGGxogmiRPa3n65eHdMkZrVIWVhyTOYJON1cBcCMo1d18y04zoNd1yRSoyqInYGn214bmf2a7BV6BX6TWpf+9U8511HyHTXfxmpwxPpiWx4nzRo1mXoPfVIMhixLT3cnTEvLmqrlmgH1pPoVylxOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhYr/ct6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhYr/ct6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF8D1F000C4;
	Fri, 16 Oct 2026 00:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792112393;
	bh=yN3O+XlLg3ZzWj34WRv2C421I7DjKxGiQUn6VzfUIS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YhYr/ct6a93pyEnMYVZ4Br+r3SygRQfiQzJQWBuvGNziRSrnRZX7wKH/o3LTMqOHu
	 0J062vbB26z6LXu7+Ldgmx032+8nN6At7qtl8mM71y5+kVdCo9+pczsgWKDOzD3oiM
	 QwshBX+7LapQwqNMgV+eDDGpN6CEtqR0ZfpL9Hd96Ws1FgcGXE4UpdlyWGXAdFKTtL
	 T+qrC4W+Vurmqv8ylGQchnQEFSSJdb97bb07OdzMyzRubQMEsS7Q+NFlV7IIcvxzU3
	 6NieCs68UMEU/StTER5sVM3lKxtxHMft3xDVwOPngbXZdUhj7K+V1+GsQ92zkQU0D2
	 jDaLEBTlB/5fw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
References: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] This series resends the self-contained ASoC
 changes from the earlier Hawi/Maili LPASS audio submission.
Message-Id: <179209179387.134795.2990907196751943277.b4-ty@b4>
Date: Thu, 15 Oct 2026 20:16:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bhxUi/N1K+Ge8PeG2iUaR0AVJxrLfzTRUO40jEwkrlY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIulrO++6f5Vtv3ueOf85sep7U9Wvr15/P95g+91N6+/
 vJe23rjro5SFgYxLgZZMUWWuCzul/Ulr9fwHVzYBjOHlQlkCAMXpwBMhKmc4Z9GeLv/k3BB5/nW
 ro4KQhZnLlWemBa15JiNkwm3T1VvfDvDH56/JfL7zS9Wflxn8UYrrddLeKZ+bJH523mn96cJK8Z
 6MgAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 09 Oct 2026 16:47:17 +0530, Prasad Kumpatla wrote:
> This series resends the self-contained ASoC changes from the earlier Hawi/Maili LPASS audio submission.
> 
> Hi,
> 
> The original v1 series included bindings, devicetree and defconfig changes
> which either depend on other LPASS macro/platform updates or need to be
> handled with the corresponding platform enablement. Keep this revision scoped
> to the two ASoC changes which are independent and can be reviewed/applied
> separately.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
      https://git.kernel.org/broonie/sound/c/4b963ac3e207
[2/2] ASoC: qcom: sc8280xp: add Maili sound card configuration
      https://git.kernel.org/broonie/sound/c/d1e5723b5bc2

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

