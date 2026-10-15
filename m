Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F92249E14B;
	Thu, 15 Oct 2026 21:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099780; cv=none; b=Lbufl9lCFDmhsD93fAmd8VR9eeSOn8OTSmWGBO3+6KuFtkshHp/UuOuWQZnw5OMbanQ2AkT1lOKRYpdnEopXa4aMIM9nonN/3b9GTksZhyrHaAsotFhHRyLrbHZtFpuNS/5SQxjt2aKbwLSUzqb8jhWKWUHFYzJq8+eFwK9PApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099780; c=relaxed/simple;
	bh=NFDojQXe7wflHCGiMvlwhd0NemQg5tOuVj0VOaZsXpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FI4cXJiyv4cmBYw+Vdiky36NrXsrvFCpe16tcnjrzRYPW80zdtUvUdEA09dtSGJaUlRZ2bCBkl4D6iuCa9jnU1kO2dBh07cnaV0ei8P3re3RSFNHzIgYttPyo+z+SolbvdB8BnJKCxvMlppzNypHqqZDqiCIbjxxDGikIOvUmBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcEV2lsv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcEV2lsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AED1F000C4;
	Thu, 15 Oct 2026 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792099779;
	bh=qKwy26hwUGwgZJw5ueB/ojDsCSqWQeQrEv/bT0nqLuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mcEV2lsvOybpVsu0HLx3azpnlIXe8q5awQji2rIn4BlQw+4l3rQBHSYPQ5dtcfjvz
	 f6EUVSn/5jXybSuFAVEScEMuRLANMOj/qQT/9+0s7+279VltsWA1sMPtnWfX0cpbhr
	 3nxqfuGsfQJ7IdeefPVwI/ETu6TAcrAWoS2RBwSJZDHwkSiGiKY8aW0Rr/P7TQFKth
	 lQk5cxozIWwJ7TDSrDxn2J/GbDET0z67n4n6yi5qsxsUquh6h8WOStoG0Kb53ZwfdH
	 O0qfJFofC2iCG+feJ2lH9biNGwZrrW1coCMZSLPzPzsIS8i9AlirxWi203RY+JUUlG
	 KEvo9nzg8Vs5Q==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015074149.426882-1-zhangheng@kylinos.cn>
References: <20261015074149.426882-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Crosshair A17 HX
 D8WFKG
Message-Id: <179207697004.134795.12996160263797400528.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:09:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NFDojQXe7wflHCGiMvlwhd0NemQg5tOuVj0VOaZsXpE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIuuh7Icm7OUdJqeLfz57MzCk/yuoo3Vy1fxCvpaXkgb
 VJG59N1HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZgIixYjwyPlG6Hp+jIzGeYd
 alZk8C2wb5t0WtbWxC05YFGvh2JYNMP/zC/qXzqfmPZc77vfNuVVxuXgBB3FbYsOXFQ5e+jd1O7
 PLAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 15 Oct 2026 15:41:49 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for MSI Crosshair A17 HX D8WFKG

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for MSI Crosshair A17 HX D8WFKG
      https://git.kernel.org/broonie/sound/c/5195b3434611

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

