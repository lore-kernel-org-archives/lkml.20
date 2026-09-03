Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C112328267;
	Thu,  3 Sep 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474267; cv=none; b=LGmVwqLvoaKIKXO74mgBVxewltfgAAvG0VS4g5K712BUlp4yKEBEVd9nhg8wdRQE4jNzQOZo9O/NI404ToQPiufwVAX6jnyvpMlQpM4oLOow9jXZWxotDpWzoCSctD8MDI1ytuckjUWEdWs8jSy1fIzdbwt0fR2V0AQkGwNT208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474267; c=relaxed/simple;
	bh=bh32NNFh4V0KPZun6DdScXGwhV3jhVB4Jo9xPuKAsnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WTP5nY8sdu5Ctew6StHBZeM4hf6B7Yb1QWnhVLZD86+3fB2h9Gi3s+yDGawpdHPbeS9AN94MNdCU39qMAGHwX3u3dY1Yr0S6gQNOkyp94LEo8r2ywq4nErlkRmG8y9b7rSRXfhCxNhcYKi45YVd0Lm1XSfnDBk1gkbPJTpSqyQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9oP+00N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9oP+00N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DCE1F000E9;
	Thu,  3 Sep 2026 22:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788474266;
	bh=CXkj+ciVSQnKuFHLfxJ+AH1g0GENl6snN/jCCKdwu6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j9oP+00NbsRyaBLU1yGkfowCMtwsKQH32GGXLg9UvSOwBSa/W3KbjVvnPD5jvRBhl
	 u7QzwfanLiwNHlMg92677npgqj3Am83Gun17iOYSN/Lgq2GIDYKeiwcevDKFT8CvVY
	 Nto0yzWKJpKd8ftatKMiiE4h5npLSQmtRzn2/AqCUklkG5ePnsFOVDCZCwaqNuqGdL
	 EEH+tgomugg/1nHb06W69jO6glUAYUMNLyilqdyoObV3X/4Jwcm3i90THOikjIsqIc
	 /LFKynThZzdi+jRbLJjO+rM6LD6ghGH2ObyV124fnGPaPWFeu36stgmXqs2v8iQM4y
	 PVHBgrBGFqxsw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 Neo Chang <YLCHANG2@nuvoton.com>
Cc: perex@perex.cz, krzysztof.kozlowski@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, lkp@intel.com, 
 neo.chang70@gmail.com, kchsu0@nuvoton.com
In-Reply-To: <20260903033845.76540-1-YLCHANG2@nuvoton.com>
References: <20260903033845.76540-1-YLCHANG2@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: nau8360: Fix static declarations and
 endianness
Message-Id: <178846838050.628640.8837907394544028178.b4-ty@b4>
Date: Thu, 03 Sep 2026 21:46:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bh32NNFh4V0KPZun6DdScXGwhV3jhVB4Jo9xPuKAsnQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmfOVvBi9WjqcvUkLpXpOufeInV+6QCe0lh5cj
 bliiZ+loL+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapnzlQAKCRAk1otyXVSH
 0MPLB/941VX7Zr2UAC8yR5jKAoNlVKaCGhznjjgkXEQCoQdwdkYtCo/iZogRH4BC+ekXSUQk4Yb
 IupyX5N+Yv9ay2YKqUcH3cHAYLWTAb9E6bdl0ID1tNVG1ZfVdhC6N04m115yJhcLpdJ7vrnsOuB
 HOXAhbQLqaOFy8Xj13iY+SHVQSU/oOIMcYMtkqSXtyn4PYe9XthPUCvWh1/0gGc6INS/GHW9mg9
 XjbOo22SbSEL/R888oItetrwCpO84JNiqp3vmoNAdOJcTNBUnufoK2NW9deCRsyru+LosaCVo+V
 TpP+V9q8eqx056psutLha2cjVdQ13/c5f17sP7e8jj8wuQxH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 03 Sep 2026 11:38:44 +0800, Neo Chang wrote:
> ASoC: codecs: nau8360: Fix static declarations and endianness

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: codecs: nau8360: Fix static declarations and endianness
      https://git.kernel.org/broonie/sound/c/3b05666859ba
[2/2] ASoC: codecs: nau8360: Fix kernel-doc issues
      https://git.kernel.org/broonie/sound/c/aa19a6de4a08

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

