Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145437;
	b=2LUsjywoRpuKinb6eVab/QH6EnATwfDbwx0vSQ7V5W6+QHW2AcbisFm+zadDI4soTX/w
	 pDL8fJAG1l/xi9wWfxzGlcW5XNsprarOeMwx4ON16/+bXGR6t2lHJn/xtz1ZfShDdf0Sa
	 lpQumc0zKRR7XMuNCG4UfxgGGQUXF1LfPOf7mTFZSWJpka9wNjN8D5HMggXwdoBWu4YUw
	 sVNDYEHslp/sVktZXOdd+wtSeC3o7jkAPfTy2bXn5OywvDNJ39Zc3gsrKKFwF4os3pcg3
	 jvnnoBplt/24fxp69MRFts+gGemDypiGoJ1nTUKkLFDdKYLo+Xa+h5OapuyBCJeI4+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145437;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=c5i4mycx+7obkhIZrfLFdtg/Cb87gHn0oWoJr8T6OWY=;
	b=PLdhA7maoVSmGIT3mGjN36UibFqEuSeVhx2d+B4juHkRVQdts1LoCzwRImtkmi+ZeHe7
	 vTaoFaD61FuBCXBPcGceVACCet84UfzNy8+JuDu52AhygRGrHpiOXqg9BCszq2ovQwOsP
	 bPvLAkLaft2RXP0LXkV3Zcxmqrzo3FbYqZNN42rbafDNoBZWnO5SPdPZMMG/YU2IpPMrf
	 TQLGHsaWWGwXvYK95LZinX1cN65V4p2XxIkp90t8PbGoTEkA2K/c5cyep/HLEdoRvN3RU
	 kNEK2IFRN1472VVI3EnAa22MXyDlg5gOt2AtLVhVDug/uR6FC/e2Ip0wGOUvy/7w5uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBqzK4FO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784D606A326;
	Sun,  8 Nov 2026 13:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBqzK4FO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E331F008A4;
	Sun,  8 Nov 2026 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145437;
	bh=c5i4mycx+7obkhIZrfLFdtg/Cb87gHn0oWoJr8T6OWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RBqzK4FOjDFeJYBMe1icdaQS1J1vrPrOmSpKo7WopxiFB+E9WRR15jXQkjIBb5Tlo
	 NkMSenk2yEyT2Y8yVrkLFoUqVzgSQP+SYWOjNRBj6yGbkEcI+0d2Mk2dfaj6uObxji
	 Hj/gVvS9l0qANXqDZY1ca7GPKJiTXa0LuZcqrwPLKDLl74ompJch7of8+mVr6pmfHw
	 PIQmmZB/rPFcVhVLIZw23EgVyBG8N+tw/nIuow5Kb5M2/FV9G/X96Fyc6uFIWVzHrj
	 lpE4phwjmNNJGVpZq3lLrHZuvwjfwNOB20tQzoDmK73Y+vzo/zwehYYBg07pNOtf5P
	 YcA8Zi/WSPD2w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2CBA92C79285;
	Sun, 08 Nov 2026 13:43:54 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261105-tlv320adcx140-gpi-init-1-yuehongwu@cmss.chinamobile.com>
References: <20261105-tlv320adcx140-gpi-init-1-yuehongwu@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: zero-initialize the GPI
 configuration array
Message-Id: <179407103263.3424803.16151987538723637218.b4-ty@b4>
Date: Sat, 07 Nov 2026 17:03:52 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jecVZUxDE8KAGpF8oiopAg9/FQ+pwm0TBmZmLyX0bEs=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGrwfJrIzK5Bo5zyZNx2F+C9YJDgWTjhTYYdMfC/04DU41STb
 Yh1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmrwfJoACgkQL+9zsLPQOIkE6wEAp+6F
 U4daQWNE24Fe6m0T7c7k2DmqOEEkLyuM8wbwJgUA/AmvyEmS9BfppXo0jsV7daEDlz+xvMOFyBY
 45WFP+aAL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 05 Nov 2026 19:05:00 +0800, Yuehong Wu wrote:
> ASoC: tlv320adcx140: zero-initialize the GPI configuration array

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: tlv320adcx140: zero-initialize the GPI configuration array
      https://git.kernel.org/broonie/sound/c/2225ef4e51c4

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

