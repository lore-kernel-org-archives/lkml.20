Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627484;
	b=zHjJq8SpGLiWOLnNWnIrrdTf3/LLUOBl59gdqc86PCZmxvNFfxTT+6yeUhM/9Wqgzi1C
	 mP7shOIe5w4bXWSJT9N2kbzMyta64wHyNWTNSdR/XKy6MSb79CDCxd2MNwQbIBZ4tHkun
	 IMcGZLm45fAgLm12Bq2bL6lNRoA5yhEykg1t7Wt/kIngmRVRIsIBhiz7AyOS09ELxUBc4
	 s49pl1tILyXYjiyhkh4fW2SDutXQ+I5WGkG9fgngzN4prvcXBoarHPVV0zUiRvEUHPLjO
	 TGgZF3BmAei0jozikQ99Vv6JGC9jJYFT7F8No3JpM/687vnRy1/aPyUgAp8Kb2zRsOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627484;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=w1Mt2wU72gikn/kepZG+kCgQ6+P1qsQDEvCDnPVgSVI=;
	b=aGoo0lfDjaMBho5pWH4EEKPvS0UaHM6KavyQOiNW/x5Tc356QPt1jRKXFYIjtsFmsdId
	 TkXiQwMrl8XnxIGqo2wDQ44t/31DewEEYTklKlL0ZAZG8oFLRjeKhapuvHuo0nxJZfaMg
	 OuftFtseLFL+e+lXmZbVkUoKR8ClCAal3Ckde+3FlUYxJAiRvTb2oQDq59XbkNoKCfyKf
	 iOSt0aeeDrwM9M509Ravuhu2kyzhlAs6xGTAJO1pnvUOmpnS8I9w+2jpBxnCIl2hlp+1h
	 EcAWnJ56FA2ulobC3EPqJRQT/lp1JVc5G8C7+QjOl3DgGo9ME8Q1Lq58yTz1mf+FWfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSBC9ELD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC8606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSBC9ELD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647DC1F00A21;
	Mon,  2 Nov 2026 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627483;
	bh=w1Mt2wU72gikn/kepZG+kCgQ6+P1qsQDEvCDnPVgSVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nSBC9ELD+EEkvpcei12UOsdJfLp8rWuBJTNOQRxGlQU8EvnnJygoKclbhmGi58Gz5
	 D0LW+eKgEHVF99ijUjrAUxe/l3KI8Jsrdd+bs3A09mXDot0KHo+3wOSdkFIPzIZmFl
	 9E5TsgwVfDDKns37BIFooeP+CvI0V342MCDcVVAAyxs0WwCSoXQq66JEpn9Wi4xI7j
	 INqGw2GBdsy8RIxjigPvjNKqc26uovvJ1JSl1bdSmlz8rfXKKn99f/z5B/ddMUK3QW
	 vZPp6oCQppTuZxeGJyY7mWJTiXIqoJfMM5+KshBE+nt+Wz4MrcQMrxXtbw9BvPRAzs
	 37NQtr8Y4fX5A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AFB292344CC4;
	Mon, 02 Nov 2026 13:51:21 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261025032910.2439-1-tangbin@cmss.chinamobile.com>
References: <20261025032910.2439-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add missing return after
 put_device()
Message-Id: <179357902274.1716893.12062427478559880229.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:23:42 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OeZKajdR1XtMGE2YhMLSRHvHXYwpUAqIafD9TPb+X5g=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTI0s1Uo5ffnzWb9Ah9fHXe7G7/wbsiZ5z9fH4gtzs
 llrrmaWd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi6ncZGeYfMHdtmmO9Q4hv
 1rx0ls/c3Bv49BPmr5y7O+Q5r+tStZWMDHsPX1x0yvtDefAu1s133R5sfsT/vuLqPJHi98/rmvp
 6tNkB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 25 Oct 2026 11:29:10 +0800, Tang Bin wrote:
> ASoC: Intel: bytcr_rt5640: Add missing return after put_device()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add missing return after put_device()
      https://git.kernel.org/broonie/sound/c/29a00c449458

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

