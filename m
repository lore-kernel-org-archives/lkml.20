Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590273;
	b=Wnd+Z3P9qsBylmipbPt4Ofa44qBjIJQHZT3/+hvmsfvMSwd8zYaq8Y8CZc4hfX2t8hll
	 qdn+cUd2MYjTWnoQBrwTU/qNXB/ICQou+pqaV3vGkaMb/GIms6ciQQIIkGk/2DD9ouVrJ
	 AUSMeA63Tq1I40PlyvyLL/5ArhkhNkTHZxehrQlmnCBREwk05OtnOb716SJpzCtBsZztm
	 2pnoQ6KGQzs8krhZHMaIY+tynIrHd4aRAOyim5V1+MUnBzldK6h2IQm4LSzTMTRRqw1/L
	 H8pZ4rCZWMThQjyRgtN1vwKe35d0TPnEclO6AHMocTrdtsqWK7/IqQxi8+T4X/AKbvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590273;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VHJb5ESvBR0ZqeLSv5C3SV8G+5auVLvklZHg1Jf7b/4=;
	b=rGyeYtVe0hBLpDViGk4RWCHxmjsDUFzTiUEbZM2HHJ8vVju9eLdCPQCfdzMwEULZ5ooz
	 ZcmSgo8le/NijBlCOq1W432iMHalWTc18kl+9Rv0OY8g7dgAeDXTa7Zfe8ZK1pX371D7K
	 IirySdgMHDamW9FsFXLIuB7OdZ7S5Ksgc4cFZVOM1kozz7PR8Q26Hiv3KO7xoQooeLZGR
	 x8dAj27uvQ7iwlS+ie/lvU5Ba+KSHX9/FCrIeyg349eYdwTBtcCPvrCIUtfk576+edQMd
	 1V8ITUJFiHXqBlBg8wfZZpJK03uaMHPn1CWD42BMH7Vd33nXUrB952ySLX4asRCmccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyjfL4uG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFF7606A324;
	Mon,  2 Nov 2026 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyjfL4uG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF191F00919;
	Mon,  2 Nov 2026 03:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793590273;
	bh=VHJb5ESvBR0ZqeLSv5C3SV8G+5auVLvklZHg1Jf7b/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hyjfL4uGkWeFjA3l4JYgi2l58AFeYj48ZxE/zYKMZsx814mXnO3EF4l5PPYsiEVef
	 r93vyP/EzobuEtjQ1h0Z9UApTT1H3P//rg4Kqx1hHHhrzclZuEop3t9kC1IbCJ1yAi
	 VcJtHnYnYdFweM5Ah7r6MxDYDQjq4gPOArmMputEQZ8b183JYqPef8BsxUEGbfh7JY
	 IGXNPcPrPS5o/PRkKav4ddYjQurAiwvWX1gxjeyStgapSRV85NAZPF21A7kcc5x7P+
	 ansBaTkV1aA2KA27j/zyypP9X6QMOTElbDrTKzTAsHCdp2x38qTFSM5Z7ZO2SUQ8sx
	 K2IuGnNi+zFHA==
Date: Mon, 2 Nov 2026 03:31:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: sean@starlabs.systems
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	kernel test robot <lkp@intel.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] firmware: coreboot: Fix CFR error-pointer handling
 warning
Message-ID: <augD_nelcantfYCf@google.com>
References: <CABtds-16eUH6ah3Rr9R=N2605TPdFgDekM5oXVeWqGcmYfWqag@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtds-16eUH6ah3Rr9R=N2605TPdFgDekM5oXVeWqGcmYfWqag@mail.gmail.com>

On Wed, Oct 21, 2026 at 07:57:49AM +0000, sean@starlabs.systems wrote:
> From 4e74bf1ccc0f61b4712f688eab66a7750f693243 Mon Sep 17 00:00:00 2001
> From: Sean Rhodes <sean@starlabs.systems>
> Date: Wed, 21 Oct 2026 08:55:54 +0100
> Subject: [PATCH] firmware: coreboot: Fix CFR error-pointer handling warning
> 
> The scoped kfree cleanup already ignores error pointers, so passing the
> pointer through no_free_ptr() before PTR_ERR() is unnecessary. It also
> makes the IS_ERR/PTR_ERR expressions appear inconsistent to Coccinelle.
> 
> Return PTR_ERR() directly. The scoped cleanup still leaves error pointers
> untouched while freeing successful allocations on later returns.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/1] firmware: coreboot: Fix CFR error-pointer handling warning
      commit: 2433db2af8e1482a3a50b8cefaf25cf7e4a9374d

Thanks!
