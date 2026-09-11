Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B753ACF1C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104192; cv=none; b=dKmoBOUFN+CYYzxC0sIWtKQD2GVyOh1wE0kgw+6s0Xunao3kCgXd1/nNvIKFCsufhbw8RJfcSPvYMNU4pIJ94dI+Ew5tAV1fl6uRyjWg3Y1AGtyGbbItlVPjiqcvW9O/MChRTOHcU6QSQgX+X/rKxQhJ1I+WuqS9NbKoRYfftVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104192; c=relaxed/simple;
	bh=zAWSaCYwoIKM/EgQJN5a+QoVQyMp1s2a8jVAFQbzvRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIKY/k0cACJ99SpLC8m4MVlpZIoFZg+3uCUUvpiMfXOB+tIJEUZPFy0bZVfDBVcOtmSc1328Ng6TxRXbddVq88x+Cqc/kzk01ISot0H58l2PZ8Li3+iBNzLlRXEGB49oWwIuziBS3HsvUmyFTBUM5ZW30yoYWltZbe7o5dRWBME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4RXfBs0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4RXfBs0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A8B1F00893;
	Fri, 11 Sep 2026 05:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104188;
	bh=+mZRoA9PODrPhpIJV/r8XJ2VpWLCKH5KZbcXxYdds34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P4RXfBs0nPp3VWp10lsNlf2bnkwuFmzTreTSpWlbyZPkzqZ8fM+k7sRwdeD2L6pig
	 GuaHY/gzhEwxZz7MYL+Z+q0XqhlqrLRHzljXZ7m+VtdTlNCON6VEHPcQJeCfmNMSxI
	 6QPNykGgyEvwD9NfBO2BVyiKEMRgJG3podow0KFbj1QXvXjSSao/vbpgEBWyx3hZq8
	 T8MppCQOFy2T3Um5yvLPEYoRY0YABML6mTn1uGukKb+pWxKejY+tpvzCR1L3CwtpHY
	 d/1W1KKGxmT7AnM+i+YCuB4Nwip5pNftCkvFAbJN61ucbfGzFX1EfTGDQY4/Eykuvq
	 f6DhMbMaM85KA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vincent Jardin <vjardin@free.fr>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: Re: [PATCH v2] bus: fsl-mc: register the object drivers after misc_class exists
Date: Fri, 11 Sep 2026 07:22:50 +0200
Message-ID: <178910416254.316287.15938875439475759696.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909-for-upstream-fsl-mc-initcall-order-v2-1-b7a04634fcf1@free.fr>
References: <20260909-for-upstream-fsl-mc-initcall-order-v2-1-b7a04634fcf1@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=797; i=chleroy@kernel.org; h=from:subject:message-id; bh=K0L3yJTFVuuzwDSP40fpMdTeNGFWENUWsbw5HIR+7tQ=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQtnmDQXeqnfltynoyFjlbODMfQg2WuBbks9bn3pt9O4 nt8VO9kRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZiICjsjw4oQcQ4rmUt9K80s y+5de716Rtn5FzFnmLtsPorNYpjb28HIcCDA+2uV7LPe9zqiXdtstztZ5jyfcfWgR5BMuqTDQqf VjAA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Wed, 09 Sep 2026 19:04:40 +0200, Vincent Jardin wrote:
> Unbinding and re-binding the root DPRC fails with:
> 
>   sysfs: cannot create duplicate filename '/dev/char/10:256'
>     misc_register / fsl_mc_uapi_create_device_file /
>     dprc_setup / dprc_probe
> 
> It happens when the fsl-mc bus probe is not deferred, without SMMU:
> - the dprc driver is registered at postcore_initcall,
> - the DT node is populated at arch_initcall_sync,
> - the root DPRC probes right there, before misc_init() has
>   registered misc_class at subsys_initcall.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: register the object drivers after misc_class exists
      commit: 7e9023a18eec88b716d8d46a29c4207186fbd828

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
