Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1632E13B;
	Fri, 18 Sep 2026 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723880; cv=none; b=OJtnWH/ZAQiyuwZ8qQQnIOGeCjZll4Dmn3BTZeRW2ZLj50x5RJ9XhwS+v1XTQ/PJffDQP7/dO8COhWJZoBk44EguGW831y9MGvHlaGNvQqcfsoDnWhrTJO5pkocVEuK3FAOgSVpkrMQ8PiCLlnRPH1ST9UJw2YDxKbDpXUCjJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723880; c=relaxed/simple;
	bh=+x1vsXeiK2OueYvPkRtic76PEOrb1bBDEoW8fqqpLHo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MXyOED1Pjd4xTEvV8jSfvzY23W6XxN+/dWp+FdK1RDUDBsXV6l7E8zYac5KO34F3J9/9y5cpq/Rx6B29wzdOsjmZIG+3xXM/SYWNVsDAOAed1AgF2/7aZYyRfGYjjkuLaWqsx4RM9wLVCEZ8ruqUmElLBqLR5Muh7/POuAYmaic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJ2+7PXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJ2+7PXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4271F000FF;
	Fri, 18 Sep 2026 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723878;
	bh=q/6D673KNUj0CgskaDcgX/3a6KKrhwBSVGi57Q+uxGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DJ2+7PXX04ev9Sc9en7UiJZBPJa6suA/p1drNursm2NVCOb5kKfnO4OOc9htWsoJn
	 YkXBQwlg+ue7XIxDoSae/trYEdIrNoSNyA7xfrh1rIRo8hV3zc5aAVYWtE9a2Qauhb
	 VZcTEaaddc98Luc6MMEbcxQr++/5OLMR9E+JgsViJtrZH4uKguoG5m9/5zTqhojiTc
	 zNAVbdrb782eVuV8uWgLCCQqQzTLXaK602IuBaafa0Nsfz4lVDMcbleOvhFBi5EOle
	 J7FbOpfuOfu5lLWQC8qvwrbLKgj39Uz89qTiFb7TwigDcclHw6i7GW1X4JlYAynQhq
	 zShKexqvO4C+w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shuming Fan <shumingf@realtek.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917135950.405423-1-arnd@kernel.org>
References: <20260917135950.405423-1-arnd@kernel.org>
Subject: Re: [PATCH] [v2] ASoC: rt766: fix HID dependency for
 SND_SOC_SDCA_HID
Message-Id: <178967312351.285745.16568648284564941465.b4-ty@b4>
Date: Thu, 17 Sep 2026 20:25:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+x1vsXeiK2OueYvPkRtic76PEOrb1bBDEoW8fqqpLHo=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGqtBOKhaQYvZp632ujQocl8o8spiAZthffsUZiR85d77htwd
 okBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqrQTiAAoJECTWi3JdVIfQEGEH/ian
 eDY2tzfJZH5KdZzVkLv/gLC0PfHh0nXciGVLNZLau/fRq2pL73AYzZ9Sb5Gm8tb83ckeBqN5H7D
 0AZICoHb+eRlfnK9un8TDL/bdTatMgDMLFyaZ82eJNMrsYzgcmD5hXhMmYbf6b4mbOy+RTFhNpj
 jnlMBRaQn08tyfwsRWtycSdz3XcTr9Rjm41Bl1jbJbzXYKgSV6gtXq90YKTnsXCxvjZNQg/4MUl
 yXEWyeg9Upi8SMHjLqiVMDQj3BlnZcpVHd2HT8xokbn+D0IvcrYB+3dtv7+YbIAwSdiPnn/6jCJ
 9Vbe5VNNbVq5PDm1AmYbv4lN8wCpwlsyodRZDtQ=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 17 Sep 2026 15:58:51 +0200, Arnd Bergmann wrote:
> ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
      https://git.kernel.org/broonie/sound/c/8d78e4f906cf

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

