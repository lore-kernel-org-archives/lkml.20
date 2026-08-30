Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3062649B206;
	Tue,  1 Sep 2026 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286824; cv=none; b=nu6/BwYm+bE3+enn5IBQxtR43FbSCvtSAsyt8PwYmCqcZqw02jRr6owoHIWZft6UnTeP/X6+JzcnKwqQrE0ZV9Mhwl0OY7CG9IPMCd3s5khzrot3VDBs5d/BLSReR91lCL0ugFko23hfHe7zs4WC71SHPq0BkDdyaNLkb/8pEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286824; c=relaxed/simple;
	bh=1XVf+KD4fdDnv8zdLPNUnNbdVOkJCyHPqO72iXznzqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YN7tl1BEKE+zgVURLBuTb32benWFxmxhGIBrG9vwbh3f6kP/ypr52wyjWoUjA+Xg7vBirMbsNi4fyVK+HDmZeCS2eCLx7RiPEusWOzpwjrhUHLfrmy27ZkoB2mWJcCr1nEixUuIYIgf+pfQ2jvmah474qF+htXp5hqSmaGAvGEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpTqJ4GY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpTqJ4GY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AAA1F000E9;
	Tue,  1 Sep 2026 18:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286822;
	bh=BUKiKs0kChUCTOHYgzamNh5mNEW73GRcHBeBzMGIesY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cpTqJ4GYDmFxSaFyjvKPTcRzxoFAS5d3mCysgFmhjT1XzEizGUAO4+FgHteSV96uF
	 syV4qUDEKjRso/XNl1LvpjsaEqdgeKrzSt+NNhj0N/NwK8gMcJLhdYgOnUdcvLxvwM
	 BgQkvwEYObrwyEoFfP3ptA3IB3u6pJ9KR8fkYQbE/wDVNbGyc6qoaRXVJCwSDEJpEN
	 v+GRAhiLDR052PizDZIMF+/0b3fMIAkrP/v7wXgv8LZvmWO+3qq7S8AXGOoeRIATax
	 hMvUrtMF93XUdFAm2wPMhMmsoib81SBhGukWmtOHsG5/jvDPc/2n4Wz/9D3LJvEnhq
	 Wez3x6DJDeitQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Frank.Li@nxp.com, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260820021454.2229094-1-chancel.liu@oss.nxp.com>
References: <20260820021454.2229094-1-chancel.liu@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: Add DAPM output widgets for MQS_L/MQS_R
 pins
Message-Id: <178812881948.13461.18281205860019181872.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:26:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1XVf+KD4fdDnv8zdLPNUnNbdVOkJCyHPqO72iXznzqI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxdiNOt9CuCwHjrDsFwMB0MoiPiegCVvK4wwO
 YBS3xKPMKmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXYgAKCRAk1otyXVSH
 0K+qB/9aZ9Cwp0KGr5/WSsc2aONUsvWe7bw2BGN4uHfQwKFgwDw0wZ8G1wZk8LfdPJaOtcu136A
 33B7zgiHJW9+98Zx7ErhdJNzGFsKd69ONo0m1MWfiVP4uly4OfHTsEy1RME0ukVtxhb73E0LjpG
 sOSgCdD3DIQrk3PxkxJiYtopszT4cbX2rRireay7acnU4ENwbqQia0D++sdYkwjhaNs86AUd7lC
 rIrNLMFrwcvOK8AbWxnzLPhjK9gbvE66wdwY8CYZTrUk6nCUnazFKLuP4CGKny2C9TNuN0DYccW
 E03zG0f8Px6zubUrfwnGTZfmBG2OaajrbHkf0PpbOIZ3jkb5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 20 Aug 2026 11:14:53 +0900, Chancel Liu wrote:
> ASoC: fsl_mqs: Add DAPM output widgets for MQS_L/MQS_R pins

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: fsl_mqs: Add DAPM output widgets for MQS_L/MQS_R pins
      https://git.kernel.org/broonie/sound/c/040a7beba8bf

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

