Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133525;
	b=1vYD3+C14qbV+YI27oU+mTMBlog2B+sbwJTscrhuFsTvWMbNBkA0Nt395Bac6APQBRPV
	 1sJXUTOISRbOfLYVi3WI6dXHRV9i9UcxHmY2RQ6mHoZMkOPSMGqo03pSFQkMWR6DunDuV
	 FdZsEOZ3uJO3mR0Rvr0hDCFUmVEVAhhcrEhLyvJDyXcp1mW7MQUyGAVMjwlJt/Q0CJ94I
	 AqjqbXGlLirO/ZuegX+OpzHZFSqb/i33cLbGzAIb9DhizvHKxP/obhZ62SLyaAMizLvtf
	 MzvMVZHQL1BZfKfUyJRhS3IKs5OExXxfIXm5RJkfqpbKDl1Z5dA2VFbakzUG03YWwfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133525;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bylo8flS+1WrpbHSY6IQ0kdWCHHEhu5AQHuYzOr6dbU=;
	b=DSFmyhEeIMICjCw4Fd0Ks4TIQWzFtl0Ej6f1MBRwOYC4jEU4F3D4Q+kBtKn/cJ0tuHhT
	 hhSHlOElUq8x4mMw0C7CdjAD5BaDNN80+/ejxW/0PCAERVAn0LTDUCaGFR0kOrhC3NHiP
	 QKclX3HEucrpiHCJUBJIhTSZswEeLFW2eFJRWOe+kErhcjAo6mxc7S+wM7lMCRCewR/Ne
	 A0tYLLoQMnBFUOlDQdMZuggITrezO0RDqG0KlufBf3hcL2uQJ4ZX8TzLgJQ9oBiHq2+uw
	 ZhLE+oPUU0Ixzr4XNrmV1xzxwxFeV5qmL+6QAfM3okUHj1xU96ALirwW4BD1L8jry7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLOMfnW0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A9606A332;
	Sun,  8 Nov 2026 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLOMfnW0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03C71F0089F;
	Sun,  8 Nov 2026 10:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794133524;
	bh=bylo8flS+1WrpbHSY6IQ0kdWCHHEhu5AQHuYzOr6dbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DLOMfnW09en14tWIVBR/tzxZ4isJtBOxAzNTh/vDEjBlzj0wArGkr/GmTPeFLCr2V
	 1kAZk21ca6A7uY/P+Xb/ddFjslsdvv26PtedVF5PuM8xzkM/spL+P2FYrbIxxYWNPR
	 5+oEQt6Ns/jYVnFex8ThqDlgBxjUx6oqBY++8Wxxi+VZB7jcL/TRGEvUgeifNIBkX6
	 glA10y46RzgvH6I6DpYD1MQoASJArlBtfZT7MhuhsWjTeqpD8aFvZNcYNX5obYVBQy
	 mrRUIX4uP4gj4OzAEV7TRT4fDxAkiRL3dMQ9GnnQ9r04DjbJ3AKHcqVZjvLoGSTDz7
	 vOAZJHOCyMfAA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 324132BDF001;
	Sun, 08 Nov 2026 10:25:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kexin Sun <kexinsun@smail.nju.edu.cn>, Frank Li <Frank.Li@nxp.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Tianchu Chen <flynnnchen@tencent.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 bui duc phuc <phucduc.bui@gmail.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
References: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] ASoC/sound: use dmaengine_desc_set_callback()
Message-Id: <179405609792.3424803.2824098810391321403.b4-ty@b4>
Date: Sat, 07 Nov 2026 12:54:57 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gfsu4URJ4HbF/VzoK1NmEFJNQ3R2Mj/pfy798YFc6MA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI++AkX7mLYkPFsxe8VX+ScFq+6v6wwNjy1ds4lnQe8A
 d/3qWgqd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAivJWMDCsU27R3/1k/a8W3
 hVq15xS8mMK8Lzsc0Tx6/NrZf3lTRB4y/BWwTAhRTPD76Fklyf1+6zuXc0sun7Df85TjccGc+6t
 XWbMCAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 02 Nov 2026 13:09:08 -0500, Frank.Li@oss.nxp.com wrote:
> ASoC/sound: use dmaengine_desc_set_callback()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC/sound: use dmaengine_desc_set_callback()
      https://git.kernel.org/broonie/sound/c/bd9d1df5a856

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

