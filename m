Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1AD36E48C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488144; cv=none; b=JuhfA6kZYU7e5Z8cyEsHXJSED6+1uscnT8YU330YHBzvZXhLnbiX3HFzCGun50f/hTUceq1z5hVaX8WfXREzjFRyVqBAxEvoeNESMuvRfgNT2tSF/N4vrhITViWhamRBWXumn0bDhNSOxq0jMSFizJyq0OSg4sKq9STl41LwmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488144; c=relaxed/simple;
	bh=fVvNhp/bhy8s5DEGKp2uImUHHOGSx/B3GI6jpnh2WvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n34Iq+p1e8JBfBGGF1dokHPWRt+GL/2iqITnLHErzxFkEwLkBiTE6ZDQx1Zg/xjzpLiJdaiGd7Yi+LURfAqCLeRsbh+7HEgsoyaiLVbU92ZsM0oSAQmM/lFLpaTEnqe/EcskFb2Rp77Y8foUuZwv2yAISGOeAhf7+oTjvssOJSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAOMJsFj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAOMJsFj"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2055573c8cso461477766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488142; x=1792092942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVvNhp/bhy8s5DEGKp2uImUHHOGSx/B3GI6jpnh2WvE=;
        b=eAOMJsFjbCS+N/L5McZ3g6Ix1JCKP9Sz4N39RNd4/geHzzn5ovlYY/U1TU9+v/DbO+
         giXDEcNSDDXnEcepTX2hes8XJyjfpLR2JIGcv+IIOWBwNM2cNy/Cx2+tqMaKzHx0IcIU
         Ga8/Z10seqGr723vaJ9n6fvWHLBssfnmbu7v6zER829fuw0QcjHDCnxWMyvnpPI3CwSg
         pRILhUQxhe4fL5yC9uwoCBtZpoYMljsXdZjgf0qpcRJhVwMIzZG7sawaXs2t0U0ypjz5
         A8NjMkH97LyQNoYLbmdJM40WnUQuG6VM51xL1nzjmKOl14ecBm4p4TNKMoHAvKAlOd8z
         neVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488142; x=1792092942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVvNhp/bhy8s5DEGKp2uImUHHOGSx/B3GI6jpnh2WvE=;
        b=i2YvYrZLD6ugeR9qq++MJqDxziEWLJvRYtSjQ6H6PWhf6g2aNQY6KByEz6K5Ecfg9n
         VJlYdGa93u4dM+itUKwAn2oaABTxoepNGM1vFKiAuvz+qQ6TBGYKqqkAPIyD5KodUct9
         mYxiri5XbIcS7IPMgITYPeERoPp5JkBPKK48SU4XWdgHFrBibCWVd84jPLrMkEJ6pojO
         2U8bDHdv4Rp4SXZ1RyIQ0gYWtJoej9hjzABaZFuz7JznqOA8ANofBYMSJeGgB0VF0wYM
         8Enjq9E5j54KJJbx8UO5pH7qDWgP6vmV+bXoPSSur9zZVOxYVtPT/JffFRPotOQPzm2m
         MxkA==
X-Forwarded-Encrypted: i=1; AKwUvBz2XOSrT8dN1sxqmF9HWyXbVSfgKRMEACDeAT9gQo7sBMJ7KAm/d/80ie0JoKz67GNQ5U5jCcLVOq4fRjE=@vger.kernel.org
X-Gm-Message-State: AFuF++mU52GlZEhS11jegX1R41h59Pobgnex4gyH27FVQp+tueS3VS1D
	Np7SvHUaTpt2cDJNe6cjLUtcr2RaYetHUo14xGKqhP3glP0IP55ttfyS
X-Gm-Gg: AYBFou3A0tdvX4rhps7kZQD11hBjwuWZgHPMhR7K0SCSi63OedqZKrxGF5MRBNYuczr
	od5RTvult1nMPSP68aV689c5zER3xgvLWZL/VLdAqFI7TjxUwpKpMxVXdaV5dVqxfhGTqTo24pd
	1r02klysp7QEVpe39Foa+co7jNk64g+L4ooRrZXbvLsOVN6pDLXbn8V6YYAoARUxaGkDyGPDwNo
	aTk/jGr6AkxlIFY5xVxHpYhFYTPA40rWmIq9nFzcyQdeLKo25Hi2xdE90ZONaYLmK09npLSpGxD
	KRXQS/1NlQVfO6xA83ZHCnEkoisyC3PbRTA3qD2gUED/9JCAIA/kWqTG2GjVT3Xp5zIbo6WgL4X
	HtHRyqahZVh1njU25zjtgFm3snekC4ko1PZ4ieL/UukwlxnNjfQVZsd3pKPn0XnS4ZQgb9e2fyy
	NpCb0KXck8VPp/Msu3LlzEOYVBpTzbS6Qalimwsd+z2t9SDKXdoxQwTnl+jl4AcGhQI8CsTnUio
	UrQ2TOYCeIF/DmqPNvvMf0hlVSjODca+NvFdT8HhYCCJpylIeMMT1CLAH9ER5J889W/Ab4dBSwb
	E8ziGZIeFBvWDWYzNrNflAWAFv95wJL4cw==
X-Received: by 2002:a17:907:1c84:b0:c2d:ca8d:435a with SMTP id a640c23a62f3a-c317c081874mr606329666b.38.1791488141493;
        Thu, 08 Oct 2026 12:35:41 -0700 (PDT)
Received: from localhost.localdomain (94-255-221-162.cust.bredband2.com. [94.255.221.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a4d99db6sm8410766b.54.2026.10.08.12.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:35:41 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org,
	George Moussalem <george.moussalem@outlook.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] net: phy: qcom: at803x: Apply IPQ5018 analog settings at probe
Date: Thu,  8 Oct 2026 21:35:27 +0200
Message-ID: <20261008193528.14906-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20261008095547.6715b24e@kernel.org>
References: <20261002210408.730-1-yongzhao.derek@gmail.com> <179106246893.434549.12601361985639254046@kernel.org> <20261008095547.6715b24e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 03 Oct 2026 21:21:08 +0000 netdev-bot+sashiko@kernel.org wrote:
> Is the GE PHY ready for these debug and MMD register accesses this soon
> after the reset?

[ ... ]

> The patch notes already ask whether a minimum delay or a readiness check
> is needed after ARES is deasserted. Would it make sense to add one after
> reset_control_reset() and before ipq5018_analog_init()?

I have found no basis for a delay after ARES, and the measurements on
the tested board show no sign that one is needed.

I have no data sheet figure for the time after GCC_GEPHY_MISC_ARES is
deasserted, and the GCC entry sets no udelay. The vendor SDK waits
200 ms after each assert and deassert, but it applies the same wait to
every Ethernet block reset (GE PHY, UNIPHY, both GMACs) in one loop.

On a Redmi AX5400, I logged six warm boots at register level. Every
access after the reset returned without error, and none read as
0xffff. In the three boots with the probe-time writes, the EEE, MSE
and DAC writes read back as written, the MDAC/EDAC values were still
in place before attach, and the PHY-to-PHY link came up at 1 Gb/s at
about 5 s. In the three boots without them, both PHYs downshifted at
about 15-17 s and the link stayed down. One write is an exception: the
LDO_EFUSE field at debug register 0x1 read back 0x8031 instead of
0x8052. The vendor SDK uses register 0x180 for that setting, and which
address is correct is still open.

The remaining gap is ANA_DAC_FILTER. Its read right after the reset
returned 0x0000 in all six boots. I have no later read without an
earlier write to compare it with, so a transient value remains
possible. The existing config_init() path makes the same read with no
settle guarantee either; how long after the reset it runs depends only
on when the MAC attaches the PHY.

George, or anyone with IPQ5018 boards: do you have empirical data
showing that the GE PHY needs time after ARES before these accesses?
If so, I will add a wait based on it.

Thanks,
Yongzhao Chen
