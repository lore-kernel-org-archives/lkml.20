Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853267;
	b=NggekV3aubnR6w+NnfFmVM2nXmaVJAnaBqo/DXsIf+BXLz1aPUZ12gZhE2njfsKY4w6m
	 rf8uy5QPyxgdk6L0KRk0IKDgM9kda59CG0pJKEybH1WM0Omo0NKi+nC8dtv7doMH1ok50
	 N4RZPNOeAKxVud2FFbJ1aA+BcurB0Kmte0wfkANwS1M1KNOIiWqrF7c95ToJG1IYvxcFy
	 pUq8i718F67y26rdj2R7X8Tu6byyXdTlDvIo7mCisIo61bmCwSW/ue4D22BsXMPeHkKvr
	 OnNx9UCLIuwrIrJtuXNApz3lG0bEUv43xzh/JieOGrvJCc45IN+o74aCDGd3dPOYrdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=;
	b=m5Rbx2CclsID7XriZJ86/RAS7l6K2QCrVgQ+pbR2EVXJbT9mkkNKx2b+ykb1vnSD8BWH
	 /N5snHBUigO1c3+Cftt/iJrXaDRT4CNYdMggwZRTxZK8F0I8qR/k/yOe1Kq4elHeEohXK
	 4oscSeHftgu4RNvZanpiXItqjb8I4nHWE3CKKAPRRSPxhR4f5f+m0vdtN52iyHRVNoVtY
	 BTd907P0LKp/1S4mNM/LLVQ22gYZE2wnRzPM1A9He6EMLcVvJgMEIk100Zslqof+UlgAH
	 CK11Pp+7lmjtW7Ipw25w/dU1CbI+B/NpYWpc5XUamfYiawxaJF7VRzpYbNAA/XSRBzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpYS8cRh;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24807606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24807606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpYS8cRh
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso113721a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853266; x=1795458066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=;
        b=FpYS8cRhj7TWzlPh8uvoPmp/VYcqp3L3+7gXWqu4nK8ecUw+jAbbkUcIxCoxvnhtOR
         nFycSVy+PoLeKYwcTOs8YcFAQx4n0Q+DMG1Qz3Sy44k9Q++UB/w7TDPG0K5qa+rL0rpH
         5J+13Shh7XikpW6RqRba6h1WOkx3/h9vimFVQEZ6UESXiqcWVdUuPYQLcDOWkMhcv8K9
         9bB0ij7ugic/imlAVr2WmJrz7XZCBrxGST2E57stn2hqP6sQFmvl6PpkmqmANhlZElEJ
         bvpXQuNDLxISRc1tHd7ekko+8JpzgeiLdzW5w19L9myCGGRNZFC51Ta59aLFIpOLDV8E
         1kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853266; x=1795458066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=;
        b=TvxC/sOjH/TSXXvxHu2cluAtfvoOWd51IJw0qSIziSmSZIRPi7bg/eaMl88E6xN3M2
         SXEnzC8HNEOxBD4MIdneuCaBFTmCRu2Ro1iu3EEtl3RgZAMKiktNhGrCxpwbd2rxX7rM
         u2bSMeZzhDf7U0rDtcCchVl5LQuZuxrcfZxA7MXY4BPbyloQi8QP7srDeI+Umi2qcryR
         A+tkjBmTUFYFjrr4dPk/8TVjLVfgcBxnQj32IPd8StUkdfVFDxYmXtu29gu2gdh/G1bJ
         rNhWAIEqjiT//TPd9OPa0k4FvYelG8uUt1o6bIz7ZmEgwET0m2fRT8eASinkMQdjwR8b
         +tOg==
X-Forwarded-Encrypted: i=1; AL+hErF+Df3L1XMXKnsxKhmwOLDSv+Hp+60cmzxyDd2Pf+kdt5/ig7pEjcQkLdv95oBVfptdmq6zupDl2f9PTGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j19DUkAR4c+U8WqRM6kM3dwsPGCF8GSo2BynYff4DSZnR4tc6
	zn+ltx/WRg9AOnFERSpqjKP6glMaXu4M67zuj/FHX3tx6qKvtn5IBq34
X-Gm-Gg: AZFdTZca9giIu/ACBl+N2QacX0jEZktO6FzRR46O/zIa0+QEeTYAoDKHKIdeqyMj0xm
	lAQWrx0TrOklLVpW23gnPfC14RDre4EBWgVg9n8gB6iwk0kg241weAAWMhrm2nF8Fmo1fycMSSM
	YOuTrGaVjmlC/51uZ6Mn2FH9ZEe0yo+/bn92LSlnClwC3gGFR57fGlYY43DkaLd3SUOqnInpIxp
	FVCpnNEdXfGmmIwvK+wE3rbD3BTGzioOvQ++fJIhYoh2aiZCYc8voUs1bRg8RSdBsclAzE4ucnt
	oPcU+siAQ/masiYxTNej6V59nmbDWtnwWcToDOpWOJ8TDRcwiVOdfR0WyjIzpREk65aOSamtsHY
	kCu+XBqy2pCX7ui1ayWW4ExyrknWDHHITQfembovFmUnCa0KuisfSC8dCTUNh73AISvyKyHiQoW
	3AQ6dz+6J/PUoUgf9Rcn614O6WZzYMbZ/bw6qBljh+AUVi/3wdjviVbl13mmG7iJCWYmRpMBiDN
	mj6+vuMd5lVkzG7zS1COqH04ThfeTs6hGDNilWsyoOnkqlCM1NprR2O3T7BpYhzrRgBBS3Boixx
	vx9v4j+A5AtHAVV9v2NI1sAsKzpfR9Kszr6NeNC2CZMmiLAXEdMfJozfuUIZb0SZONo9MIL/9hA
	Jsh4n+VtJi+MNNb7iZuGYkkvG0SmZpBrB00li
X-Received: by 2002:a17:90b:17cc:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b3abd01770mr154654a91.28.1794853266130;
        Mon, 16 Nov 2026 10:21:06 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm376117a91.13.2026.11.16.10.21.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:04 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v2 3/3] ptp: ocp: support the WiWi revision 02 Time Card
Date: Mon, 16 Nov 2026 10:21:01 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179484681859.3136.5472457983791141613@kernel.org>
References: <20261112163333.12523-4-ahmadexp@gmail.com> <179484681859.3136.5472457983791141613@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for catching the second path to the flash. Blocking devlink alone
was not enough. In the proposed v3, ptp_ocp does not register the WiWi SPI
controller or enable its interrupt. That means no spi-nor or raw MTD for
this card through ptp_ocp, including no MTD reads. Devlink continues to
reject the operation. The existing boards retain their flash devices.

The static board match is 2163:1008, subsystem 10ee:0007. The class and
programming interface are not part of that match. Probe resolves WiWi
against the static table, so a dynamic ID cannot select a different
resource layout. PCI revision 02 identifies the register interface; we
still validate BAR and MSI-X geometry before touching the FPGA. The WiWi
XIIC child now has typed platform data and its own matching size. No cast
of another controller's data or stack copy is involved.

I cannot infer GNSS2 wiring from the PCI revision. The proposed driver
therefore exposes neither a second UART nor a GNSS2 SMA output on this
board. It no longer prints GNSS2 as a fallback MAC PPS2 source. The
independent external SMA PPS2 input is still selectable. This is a
supported-feature policy, not a statement about untested builds.

I also clarified that devlink reports the build ID as fw and does not
distinguish an active image from a fallback boot. Unknown revisions are
logged with two hex digits. The revised objects compile and the
board/flash policy checks pass; this revision has not been run on the
card.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com
