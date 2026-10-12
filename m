Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA547427E;
	Tue, 13 Oct 2026 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887116; cv=none; b=qfpq58+zeEsVZRej7yvIYUXYROsOD4hwIyJOAhbSxyE2YgW6O2itGOziYlJew2Cd49+EasGT4cQVcK6eIQwebaQpi3j9T26X6HCMkR713IJh63UgJ0m1g6iuyIsFa3yQtS8QWdWbx9kin2Nms7JzarEXEfy3njmW5SEnwunb+ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887116; c=relaxed/simple;
	bh=do7q7gaF+PzhwT0qpXMo7D5hsu2JeGfBmp5wshDvgeE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I7Pdx75WwdeyDxoEbQvOP2797d0VfnJzA1vvb6mh5spzgaT6T73Gysu60nMm+JqfnZiP6HQSHhyB3PDjsl+SyJTGprgdNzGI8MF+5chRYC8mhoK7cFs5f0GxZ+83En+WHjQ9pYh7YOKDHTxBm2acpUndUz28MbBDGyf+M+mt1UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mbx3+rjb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mbx3+rjb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746221F000FF;
	Tue, 13 Oct 2026 10:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791887114;
	bh=2OsNkVFYFzdWk4JWw+PnEVTDdq44uGilr0wc6hssWOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Mbx3+rjbfAzkJ9MK1wG2t86RVOkOGtWnc5Lgn3WbqjIPBtD3O9Otquiog4j7WNPF6
	 e/A5BtXHgWP5tjsgmDDcx12qovf1YdY9WXMAorimLJF0iY63EVhQtcsqEEL70w2+0Q
	 d2E5e6zAT0TWChFEOBDu0TN4cbFxauqKduGwyMI/qjpDn9+EZ9fUal4QxmiXML7+1h
	 x2gnFiVWD5RrsaJ8VzRHlLVBIv9o5IbB/VQGPPciOqK+PzwgR8ZoawO5QMWjgx4mwd
	 P/oMlhKrsmmmoUvTt93oXHQu7XK8kdxo7KdIGVQHFZYq40wI4AaZBVsZ4gMjn7xxIq
	 Iq4vwjFCquHnA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, Bard Liao <bardliao@realtek.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261009112204.33199-1-phucduc.bui@gmail.com>
References: <20261009112204.33199-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: rt5645: Simplify optional GPIO error
 handling
Message-Id: <179184381702.390394.15381894720118351303.b4-ty@b4>
Date: Mon, 12 Oct 2026 23:23:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=broonie@kernel.org;
 h=from:subject:message-id; bh=do7q7gaF+PzhwT0qpXMo7D5hsu2JeGfBmp5wshDvgeE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOsbO3bdTIDEh/0ePcvrNEoLHBUMtvmRNjxYxyXjEpV
 +/De4o7SlkYxLgYZMUUWeKyuF/Wl7xew3dwYRvMHFYmkCEMXJwCMJESDkaGA4IJ1g0/fGrcf3+z
 fmnJomaYNy31imdLTIKA5Ll/vh3fGf4K6GtG+20wM5ViOelczrqiO337MW/HTg22RQd7eJY8X8E
 HAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 09 Oct 2026 18:22:03 +0700, phucduc.bui@gmail.com wrote:
> ASoC: codecs: rt5645: Simplify optional GPIO error handling

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: codecs: rt5645: Simplify optional GPIO error handling
      https://git.kernel.org/broonie/misc/c/50fb7f7fc7e4
[2/2] ASoC: codecs: rt5659: propagate GPIO errors
      https://git.kernel.org/broonie/misc/c/c1e321bd5ce6

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

