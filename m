Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C710397329;
	Tue,  1 Sep 2026 21:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296990; cv=none; b=rtm7oRhOh1Jij4fAJhv8a2uyR9T9j0baNsbffd8F2gvBdeFFXfh8pTlcdjJCQ/jz2tesClafsSQDhXmVcySh/kLv+qrG10cVXplntU5nJ2v5i+E46c2BJXXTj0xeaL1NIoo1IcXBkCvEjZXNgFZb4CUWhLgQyvSTQpd59k2j+/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296990; c=relaxed/simple;
	bh=PTR91Ih/niKvpONFLMEPngh0NrraQnjqtpFYY4cytTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O9mu1KkIQd6GDnr5xh72B3uJI8H033bvs2JNz9aeR97lhgixdkf9ITeY+2ncmh0invLaCxoiOiecDsHCzGMpb4anAHTZAST+SU9bNXoFJxOzrpTHwz9hxXiD8HoG7gcSfxbc13fKM8jw6KURR4XQQtXP/T1YMWrLFf3z5kInxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdVOD6Ja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdVOD6Ja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EDC1F000E9;
	Tue,  1 Sep 2026 21:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296989;
	bh=2ndy676qy4a6IWtxrzqVOLsxTLdVw69WCp12msQ2/xk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XdVOD6JaTxvA9TPIN1aVoAFEfKmx683RGjIo1SF/xsFFMoOt1JpxyeJlX8xWy8jvW
	 zaUn3U9C8x3qAw5H3lTa/tE4++fHSgTEPJ+umiaT/b9gADHWEqxEjPmi4Slfazfhjk
	 31hvDvsc8MsoDQmJ3VJzIjMF9Usob/waGT67P2lfNo8GiM0fAs3B7wJdG8laxFK1mJ
	 /gqlJTWcWujmQQNfsfxNm6evmR/2QvDoIMvDz3oTC6Di3XruvKdLWzrsrJHSgJU5LF
	 5m6xu+mG3IZ+u2PXRh+2W+CjFkaOsQyArmfNPXxfjC/TSi4JUM4/Vrc4ncEfFXvvus
	 zXLnKFK9eTDAA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260901122644.634494-1-rf@opensource.cirrus.com>
References: <20260901122644.634494-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v3] ASoC: cs35l56: Fix probe deadlock waiting for
 SoundWire enumeration
Message-Id: <178827610074.33904.3532053544533708741.b4-ty@b4>
Date: Tue, 01 Sep 2026 16:21:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PTR91Ih/niKvpONFLMEPngh0NrraQnjqtpFYY4cytTk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlz8aOk0FvbCC55XbaN97dYu6hUINpmhto4OX7
 QyHL6Kt4M2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapc/GgAKCRAk1otyXVSH
 0DxCB/47C5QR8al/OJcOLTVCyF9Il2Ec70m4qj7lq+S2YOsKN5qOcDedT9ZQzPbvRByFncWZssR
 q/LK6Ilgp2TfWgMaCsYJPHUthalG7Rzx9e7lrevaO6rYINdrf/aRmJGhUCtYyI9TlMTNzETcrXo
 vD+KXgV2HbhNl8H1IvLxT7oKF3x9RvwMRtcqRkjTuPX+biqxKRffIr/a+IrCYCZjUmZWD4Aey6n
 3xflNF5wEaWTLV9WjLyYORsudQUg2C3MqHLJ8Iu2/eNBd6y+LB7Nje2KW2Hi2eztFDa7YDo5316
 olMpc+8IK695JRFWsy7x0lFI6fgv9RtXLG1N4ZBLaW9jIDEU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 13:26:44 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration
      https://git.kernel.org/broonie/sound/c/1d80a4792f1d

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

