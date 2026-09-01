Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EBF472530;
	Tue,  1 Sep 2026 22:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303378; cv=none; b=NExMkJvG8TIwZH1cR4Fb3AiOBALg90bgFWZSYqzOqI1XkJEWo00A3PGUjaFYduBx3MjYxsgAFZJodwmUzRbQWqDbOZX6iDCR671qNdRsxWRYZqiAWZtY3mfJROSc8ySZ96laytn17NmbWc7CrHisLRjvSPz5np4Sk35k1W55tRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303378; c=relaxed/simple;
	bh=p4P5EfyqDSxKT1R3RvCR1v7QzK72vCfvWW1yd2z1Q0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fqyCbBRaHbFx+AeqdJExx1yCXjcnOzaA6e+OsFiXV6BsfQxrreOwfk2hB6RkVjhUInsIK0/SfJDYXlCJanHb/HFaKOkOOFNsmWIHd4j28EFTi/pNV+ptdY/astYJcusrKHbOy8sKDnmiv3ThgFF7kXQK07fdOWrm3apjvALpP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYHBvlju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYHBvlju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0F91F000E9;
	Tue,  1 Sep 2026 22:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788303377;
	bh=YP38ItUT3tirl1BApu5b04+2q0EFiOw65sKOcBV3jBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EYHBvlju6mSDC2wogxJxVAd9vtQhBYihZ8jF809Etu8vtfzEx8aSbuF1a5PNk8bfv
	 p8f2U4w5jRaEuY3NnNpnnEe+atld/LeJOy1h79AegppT2BjQX2Es237i4kKiVgKvem
	 DWPbT7Qysha/4unG71n6ZYMAg/P27ioiYzCrypVmpPwgcE0Z82quT0SMcIv1ktDRFr
	 sU6ECAIn6xHkufMnlGyqcoLZCGsSkPWE560dwhrie/n+tTch+7bfH9qD9wvNr2aOQH
	 qVE6JHquhjje5/YIo+UR6gHZmoJZZSMWvl3SR7Qs5BbCvMWiTCYa71wp5dQtcs8mWp
	 hCmG4xAlW1joQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901152905.797279-1-robh@kernel.org>
References: <20260901152905.797279-1-robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: sta3xx: Fix "st,drop-compensation-ns" size
Message-Id: <178829015897.33904.7905290587874869400.b4-ty@b4>
Date: Tue, 01 Sep 2026 20:15:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=p4P5EfyqDSxKT1R3RvCR1v7QzK72vCfvWW1yd2z1Q0U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql1gN/YrY84y4RTwIULFCziLMptmfAP0ihaiKb
 ndG6J5fBjyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdYDQAKCRAk1otyXVSH
 0BZtB/sFqnSwjBlBoNrKbYGxBy+7ylTBLfa3HSDsLAfTEr6sIGaTh9TGx5uL2UlIN+Xgz9w0b3Q
 02Muxd4/W4nowpOc0BK0hjOTCcmwAW4Tm9elDoHHdqJBfrxSPdVYeLledX+RqEQxwvRC8yWPH+X
 /PrEKbkLNn5NlDPYoQkjHwDFrCjrPj9NqDsQSojwou2sk7ygCKftYIUYOtK64cGTOs7c0C4p4oU
 S7+YqSi2rAxjcNv4D7koydkLwawir4+e+mimdGtmCBckNKiiSAbmUYLyOorfKdntEaJbawVEEkC
 dsYtcIkqrorXBef/6hjzui4mm7p6rgppaSihRZEfh7W4a4hZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 10:29:04 -0500, Rob Herring (Arm) wrote:
> ASoC: sta3xx: Fix "st,drop-compensation-ns" size

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: sta3xx: Fix "st,drop-compensation-ns" size
      https://git.kernel.org/broonie/sound/c/dcd84a546beb

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

