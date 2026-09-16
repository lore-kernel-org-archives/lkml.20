Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B3E4D9560;
	Thu, 17 Sep 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644750; cv=none; b=IorZCq+5xO2zOJzygcQ/MfsmWQIhin1+dbsJws3dJO2pSDMDHfWcN+M7E1JgwCOHw8VJvW5z7j99lucvbmErDEFGdKF/c8aWIgsidSa+3V2OwRJRvtv6gVQt4Y6OJHTn2VL+7wpadXFU5pGB5TcBlqstfAtkWZj/rMnF5iXuzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644750; c=relaxed/simple;
	bh=bVU8bp4iIHucX65r0y3mUOPDOCm09oiCFmlXLL3OfCg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HzNsLyFK3Mbu3C8RKHyOxdV6X21Vsw2V8gAxUKpqR3SN21z8ZmtpQwXBVYDK5HFP3CKFx9etCR3ZPFRdVF29R1SllRV82KLh3XuXqutZ1ZAk5CnyNRowZMdK4f6p58x/4CAtRVdtYWvbk4FX8kKRFDk+fZl27EOdTG1RdgREJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuS3+7HL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuS3+7HL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53611F000FF;
	Thu, 17 Sep 2026 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644749;
	bh=fQ8wMCWCIy/WlWl+fLkiP1H94HLWJReXNyPVq5dItoo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NuS3+7HLpz4N6/Ztuf9i7Ky3ytq7Z9wu/t5P2lm0SxvFQGYJ0HNo4fjp2sFmpfk16
	 CyTOHO0ZblgZeALqV6wSUp+fi1tTii4hKeHTFseS5rw99dQpHnCtTJy93MHTPl7X+Y
	 oNM0aE0bxIEPomy8SPK37VmJjlr/s7xL9x9xQgT4RmBKGd/meDul3nbMuYDOPD51Y1
	 Wr2/5ayOqwndR22xiniCSs92lxzpEzGr7oQQVSv+H6SrS/GdJLtgnhyXqhINwk4xaj
	 MPQlgyYLCepW8mq7dycPAwvjbUW/T4u5G0TAh5PyLBPdJbvBpk8P/+8EC68plFxa6i
	 1YJmU1sjKgfZQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 Neo Chang <YLCHANG2@nuvoton.com>
Cc: error27@gmail.com, lkp@intel.com, perex@perex.cz, 
 krzysztof.kozlowski@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, neo.chang70@gmail.com, kchsu0@nuvoton.com
In-Reply-To: <20260915014940.317403-1-YLCHANG2@nuvoton.com>
References: <20260915014940.317403-1-YLCHANG2@nuvoton.com>
Subject: Re: [PATCH] ASoC: codecs: nau8360: Fix misleading return in
 nau8360_message_to_dsp()
Message-Id: <178958230980.100121.14321855165528287319.b4-ty@b4>
Date: Wed, 16 Sep 2026 19:11:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bVU8bp4iIHucX65r0y3mUOPDOCm09oiCFmlXLL3OfCg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq8/JEsVMvTGGLTsQ5wpJxRFi7tRSlF/4yvbkG
 cZR7bfgMGmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvPyQAKCRAk1otyXVSH
 0OHAB/98XV4Ty0RKilnS2YbNh25IeCzJ+hTrZ6pRdhMUzH7MDZCw2sK65DVR8XulEVng9y632qQ
 lsbww3Vr2RsA9SnuI4SCsJl4X87FDhT8MGhuevuXbQqpYZ4fLo7bAndh+t2chVWu+B9WM5U7mAK
 4p4IK53Q/6ESsmRngWw3F/g72Ldy8wuJTY/xNim3DW9jm5NbJ2XW3WIwNmF3zl4aa4ctJfpjNKW
 nYkJNErAd0qVwEX+/6ls3aPdcHdXr55K0LRzkYZx4m6fCRHjlDEaplB65HPjlvElKCfqVKtbB3z
 wHW60QRXE7BqczEhExcxsG9UG8ElRQRCeLxdwzziqLIz2x4W
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 09:49:40 +0800, Neo Chang wrote:
> ASoC: codecs: nau8360: Fix misleading return in nau8360_message_to_dsp()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: nau8360: Fix misleading return in nau8360_message_to_dsp()
      https://git.kernel.org/broonie/sound/c/ed7d8ed9a915

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

