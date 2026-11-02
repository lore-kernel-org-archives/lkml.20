Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590315;
	b=3joX9VDq13h9ezjdiJtQ7H4s76xjqUwu2Ik4ZkKFKpipBEdU4S5LvwlQA9GvPATK/8MQ
	 bcGUn8dsMlcTK9jiEwVBl5r7VbbgyZ5pMzJHI3w5zNzIyjkSvq21Ia3uirTXanzeuKCaQ
	 WzwG5ymeSegbCF7aVmG0MMb8+HL5hmollv1GopoFBdblskct3q6A2/rqxCOuxjmFbjcCJ
	 YLw9+dJLNAWa3dQVdR6pcsaeIKtnqvVhM+fdnGIaXN+pcEIFRimWEM4Fcoykl6cqVStwS
	 UrmCMtmdX09iteuJ9Nfa7ZsV1qnymsW8YaVJ65WZUeRAunXTUEbzFns3pjEfVHKy4Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590315;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=RhYsjUIWG336Hgn0m3bYtEBzvcC0VLP1VHsbp8WPaoY=;
	b=xn7lM8vo8bDBoIG6EbXb6JSlmUGojldhQI/beKgbcd5CmuCPyT7PnSn+A9EP66PJ1Fla
	 JIYLmj+iO7ebyk5Tje4xvO6Z3QEpjSJ7/Vm10yO+Cabo2pVtimvfBFiR3xXTkV4k+gq/D
	 kUQLlsDFRRwzVp6Tm1RCwMBGf1P8woR9bf/2988nTYCkX7nNo3Pel4EJKFmudsNJIuBZS
	 hlsz1FmMlpml6xcMtCtGZ1ttK4+u5g/k47vWwbsEKxhcXZg3NBC7srPwifZDsPYIIQgD4
	 hx3Q6Jz4ffNEVh80IuTOX/3Kin2uA709wACXy070Fu++xgHb3wUhBibAvE57hVNKigQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRxLj4qk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B95606A324;
	Mon,  2 Nov 2026 03:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRxLj4qk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878211F000C1;
	Mon,  2 Nov 2026 03:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793590314;
	bh=RhYsjUIWG336Hgn0m3bYtEBzvcC0VLP1VHsbp8WPaoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lRxLj4qkzaK86j72OoHiY9pf2kvEqW47kCfBZeVZv90V98gUJOyc0MXmBNt9Hx01s
	 H8oSTVCITCAkx8sM9aBVJrrpWjMLOzwS0E7lZMlBOKwAJsXYfjW4aRB0d4bhQzgljn
	 bMcc/MC8dNFuMZ4WpdbZPSQkO2Qz499gGHuUNfxXBMZwIxWbEdTVxKXMC0BT5QTrLk
	 esZTmJSf1QVRXG1JRvQGcuE27+FdTz8gwt8vbs4OgDFjc+vbKd5TptgZUrYXltFP1e
	 xqUA+6UKPXGnAiVtgdmrTPDnfoMIyjQ5taPalgdpe0+EQ2VgzSWna51R2p6Wu5ACmh
	 5Arp4xBevXjYA==
Date: Mon, 2 Nov 2026 03:31:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: Yidi Lin <yidilin@google.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: coreboot: Don't skip CBMEM entries outside of
 known memory
Message-ID: <augEJ6AAk-f4qhf-@google.com>
References: <20261017090351.1266064-1-michal@nozomi.space>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261017090351.1266064-1-michal@nozomi.space>

On Sat, Oct 17, 2026 at 11:03:51AM +0200, Michał Kopeć wrote:
> coreboot leaves CBMEM out of the /memory node of the device tree that it
> passes to FIT payloads, e.g. LinuxBoot on arm64 Chromebooks, and only
> lists it in the memory reservation block. The kernel has no resource for
> that memory, so region_intersects() reports it as neither System RAM nor
> Reserved memory, and since commit e31ecda9e3af ("firmware: coreboot:
> Skip no-map CBMEM entries") all CBMEM entries are skipped on such boards.
> That loses the coreboot log, the TPM event log and everything else that
> CBMEM devices expose.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/1] firmware: coreboot: Don't skip CBMEM entries outside of known memory
      commit: e094fd05defaf0b05774ea1c65fc2d0ab798c809

Thanks!
