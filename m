Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5A48820D;
	Wed, 26 Aug 2026 21:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780700; cv=none; b=qYLYdY15bw9w4TDSpQLg/33SGRP4gsvHtEitrgcE83FEjUjAL4jEvqN+Zwe2qpn4yO+S/GRZGdqy1fCR+ijCa0v6Y6M/yViLEDaZzmIvXuHcixhRwh2ZBs4iyu1CGmeqIIU6pRM5ZkfiPTnwO0qlxDXji3Ckb6owBUI6n5S86Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780700; c=relaxed/simple;
	bh=afJ4/Z8pMALxEC1OH4/6gJjxyKeHCIuspoLLRdhnh6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EOoQShIWkj17Zs0/ULsH3NDeti4lmMXmlpGYygafYxiXBEPlotc7zDhJTSRjBngUfQrrr4Z1LcuXA4WGfOoiQ4BxdrsOVkyTKh2Y8/1btzQ1nlnhZGH5HZcz4oUl4sKv3h1pWoIiXiAvPLm4tHHk3Sq+Nrmhx4Dgmhc2xBSajOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYQmihYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYQmihYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BC01F000E9;
	Wed, 26 Aug 2026 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787780699;
	bh=mox2A2+G3ierWSL5WOIsEOc3ij3GJJ+HJ///At8iuHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UYQmihYU3c7weCQUHQJHbg24vzhQ9HILHbTRQpQIX1XFHXLp5wsQJBgTMdbR4EB28
	 2xI1lBerc+PxyoAP30xIbxE7eFSL8VQTjibCHAUD21sYVpRLCzNpExyFS/ybTcc0nM
	 QoXd5uFR1SrOLT4nf1L/oN9sXXTaFtf/cgzRSi5bfHjtHPBFFsCuUBF9oDPHHaqOoA
	 53dNF/P+8FfOeI4RG2Yp+PeG60PBZXvqQqz+uecqDgUS1B2F3AyMXGHG2e1mltD+Tu
	 5l/m2ECUTYocBZ2jcCE35yP82fdI6tjr6RPuFcAVyjA90KtjKrN0eYazdmRTquymlY
	 XgLvNl+e0mnbQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Sehat Mahde <hskmahde@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260825224640.13662-1-hskmahde@gmail.com>
References: <20260825224640.13662-1-hskmahde@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp-config: force SoundWire probe on HP
 OmniBook X Flip 16
Message-Id: <178775542282.88371.4820386326566315467.b4-ty@b4>
Date: Wed, 26 Aug 2026 15:43:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=afJ4/Z8pMALxEC1OH4/6gJjxyKeHCIuspoLLRdhnh6Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqj15XDZsmG+zA0okO9TjCDdtIx7kveiiG447eV
 2QxmfP1vq+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCao9eVwAKCRAk1otyXVSH
 0BwkB/4oh2VtJREuM/MWeng91onbXzLU6RYYNPV41TE59DBvabI3mE6BBhwxTi2XkaMCSy7q5ob
 36bArwtLRJZU2AI7uFqcSEqEkFBmeIG64z8kPiJ244paP4cIm3DP6qzDiCjvvJFXRrsLLoHkGHG
 8ihcOEhed/JhB0ahCoJUKQclD0i7uOgR3/VzpPa1BXq3zZjapYZ0Z9S7MDLgPcKStMR0FMH1lTn
 Y2aM+SB7eycayGjgNKA+KOoUfoyrhBrg0DKgzybG4uLNVm5axewYiyT/4JwpptPBdvp2iAjTIe8
 boKjkiK8mKUTTiu4wz62zHAORFaDPA+QttnviDio7mkdKDM/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 25 Aug 2026 17:46:40 -0500, Sehat Mahde wrote:
> ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 16

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 16
      https://git.kernel.org/broonie/sound/c/4d6642d64cd0

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

