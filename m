Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCDD523795;
	Tue,  8 Sep 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864801; cv=none; b=gKwBtUHHvq4iu3rptoq1dqD23BkquTtd4sgVxB2TjvgIYWzZnt9eMWko8bHopfuPbs+YCIl5T/+9cxHmDIRNaImt8fWrUa4hWSFLLEOMRypm3inkKrZ0Xz4UsO3YyAJrN7VQuxxZrwmz7z8tktHHr/RaSMy5hZ2Jgi8X7Hm10KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864801; c=relaxed/simple;
	bh=R3+DlZZtyuyPAIBkfGaUMdxrDBwJ5w3DApS3mELsftk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PWWEsEZS9R+Ljbna06hGusYqNe2lebqm6r+6zOnADEMQWJRf/7havnM0pffXsQgzw+WUqdFzidMQuOFhFlsSU2zjAttFe4wnSn2mI1JLn33X9/yk4ljCYXvh+DKviTeUbqZjaGuR+a2Exxi3dGChSH0SLychjsqI+02qRqRjDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocb1jJq3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocb1jJq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114131F00A3D;
	Tue,  8 Sep 2026 10:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788864795;
	bh=bTeLT1EsXt2NzU1v+D6XYN4ihXsyhoKO62ouW9ulToM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ocb1jJq3NjWkz62yqWTkubXgjy3VFsl9dIm7qTkH/klzU3Q2oCjBOwlkT57GWyUz1
	 GUosMdmVRq9u7GDnielLq7MP6BeuShLZ4Ye6BavY1x/u/iE7Tvxv9CauBrOVVd8AVd
	 H2AxodUp0glIWtpN5dPy53jvJGQQa4Fieeqh1Oom0cSoVOK9Clmkp/N5Ea6bCxoPTC
	 V7Fu+uPJhcuE7Do1r/95PjlDAjJAKkSweqfFicvillxIAQ9HaNqEEbt4VT9n9OXC3+
	 ycsSLBHA3UWV9NsQZAkkYxgfU2CLAVsCKfM9jSvPYcONI5crO96k3h5GwiWKanB+ZW
	 IWVALkFoEphlA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Simon Trimmer <simont@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] cirrus: fix typos in comments
Message-Id: <178881759171.118202.5052325120039864081.b4-ty@b4>
Date: Mon, 07 Sep 2026 22:46:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416; i=broonie@kernel.org;
 h=from:subject:message-id; bh=R3+DlZZtyuyPAIBkfGaUMdxrDBwJ5w3DApS3mELsftk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqn+kWT/dtS7uxcNbHmhErMUdsKujsMq4eWVbBX
 ZkJ6cwszeiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap/pFgAKCRAk1otyXVSH
 0IFNB/0Xhm9tEaqFHOEN7J9vHj6iEuzonthYsGye8PlvrHn5U79bxI/Pfjw/lcYEMq1RdblArUU
 j593uMk+zLUlFJysOxq1E8NWnk/POy6AMJFIAQOWlmkuO1APxQ6uc3h7DBJ5T8oshPJBE2GytDO
 xF4G78toKzK/ybS4XVqE1D/uQvRiEMDlz/DWBqA/nuKvI7eFci0vbaiYZDNzgEJvSlDCa7WFDMG
 NBni2FF7e+zpukN4kXrLov2xdMb9BewtOQtKF6OH3dRX7TQ2RdZZxUChZme9VxNhe5+x0NINouX
 sLKg/dt5Yh/s/JT+5QyYPxEOVRUgnFdVls0DbPJWKGb+Z2Mv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 07 Sep 2026 10:23:28 +0530, Hemanth Selam wrote:
> cirrus: fix typos in comments
> 
> This is v2 of the spelling fixes for this tree.
> 
> Changes since v1:
> The mfd patch now carries the driver name and a capitalised
> description in its subject, to match the subsystem convention.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: codecs: fix typos in comments
      https://git.kernel.org/broonie/sound/c/201af7ba51a1
[2/3] firmware: cirrus: fix typo "upto" in comment
      https://git.kernel.org/broonie/sound/c/20a812a1f664

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

