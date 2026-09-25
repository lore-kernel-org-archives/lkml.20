Received: from mail-ej2-f37.google.com (mail-ej2-f37.google.com [74.125.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B14F648D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370130; cv=none; b=nKOzaBbKaTHzibA0vseCmZ2hLHrDBqZsRh7e13mW8eZwLxL5kJSTVQ7H3ICBNBXWS3ttBQwDHoCPlSvA2bb0O2xEXPSI6na4skMCLQJvocBBljEOMU4G1bWzzQd84N2nkgJ1L61+95ymDp4oWCgjqdZW9yXi27+YIkTR7hKD/DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370130; c=relaxed/simple;
	bh=Qbyuka3GiyzI8GcOPcPBKISMBjQR5N/Oom1sUT6XUUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5clM5UGHinoJ2eBq/mRlwu2E1Y0u5gunTMQ6EsNCU4VExNZ3mnVy58daWxvOCniQR9H6P1EOM6KV5QF9kb2PyILNYeVQtTy8pcG/rsi+TQhz7pTTH35W1MgOkw+yfOxRQqdslZ/UStWoB+N/jwvOKhdkZQlSYgNJr4a+4TA3qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYkBDx6R; arc=none smtp.client-ip=74.125.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYkBDx6R"
Received: by mail-ej2-f37.google.com with SMTP id a640c23a62f3a-c294af0caa8so195990866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370127; x=1790974927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qbyuka3GiyzI8GcOPcPBKISMBjQR5N/Oom1sUT6XUUw=;
        b=oYkBDx6RSrPyUWLQ8cGXg+XE7agKlIF+K8YIUSDhpCpY/TGFUOmzk5tRm3FUK6e3O6
         cHrFC9YcXB//NLzk+JHQdnu4B/eDv/ahK2j8Jvu2Wab5y5PouDk34CXg13Y1iutu+vnD
         hlGVV+eCfxHxMxRsFjyS2FNGs30GqK+T6i3C0CCXMmF8NtywFK39DVRixtRbKpJnIexY
         fzDpsvaX7UEXNi6NRMbYnWIcHMRHNWdZbMMhn+qtnmLG/7+Oa1mBwYRt++NYi6MzwGIw
         uIiXzaLRihY6jJxkmWwjc6eQXsni5fUB2iY3//m5giItzsMbcg/N9xHZUjeqSDZVgb2I
         47GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370127; x=1790974927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qbyuka3GiyzI8GcOPcPBKISMBjQR5N/Oom1sUT6XUUw=;
        b=OmCiWHQHwTbjcRwgvu2l5e9yUSU/r+VrRVP9mXxQIDOH7qnBHqgusaf325vCHtaIXq
         3ql36nlMInB6H3X/WVgaaJhNUKoEO7MYA7Q3xdGYjTsxZxpC93h8+3YSSMP4HfZFqCHz
         3TSaYLur3R81n8racJk9qjoGFqISjC6Q8+Yvd3cir2rNDiftKINXErKFjXgssN2M1cVJ
         AiNrsYPj45/MTFTeobCWBi9NdZjyK9bqHSsBUt1EGkd+JMEzmdCYFYEzPxs688zqNDf8
         8ewdIMpmizm5ZFI0qwXc8mSLzP80J4+unnmUR4BnSidLTgGJOdHWGTLIWsyWTkPEQHov
         qB1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwttUKVFV6vZdEOfJNMlfeHRxuqu2AwLUFuIwfltgSYLWwHaygwk++VZk/GtotZ5D0UCr06OPnnbIBdTH8=@vger.kernel.org
X-Gm-Message-State: AFuF++nG4eCWtnZfwtijicZK8YE8Mp/HqgnfmzY8bGx0birF1vPJIsjf
	jpI0Q3I+k5ZHqVFOgp3JfvmPpQPrl4aenSNeoDLY7REVod+jWHHR3Mi9
X-Gm-Gg: AYBFou3KmYusfhAAAn+0X2TQkuP4k3wtJkQkcTxMLz6jd406x/I3OEeMiUirZAk3yf0
	PHqNnAdv5dPw8bx9WXNzoH5/ou0R5hQijR1phLog+R474fUApZMRviVqxvqkvPc8hYhv3W052Vc
	ExGcxDc7bNNRIzPybPEhnQ2yITPka6X0TK+z0LrrIlXRBgEGxz47getH4uaHtvMR9xZThuNjdok
	1joYOekGjBmMLt684qbB/zwfWJELc9rLu/7SA8CQpfV1VKtJaiXblaZrrVHxPjRVpaUgSsfFYN+
	JQGQeLOludVdb3sS52oKj1RKRGOmnpAZrEJwfSnyUsxkr0nrT5nUn4aX3bn7kCTKjQvRlLSR4hE
	ECT8lWWXfBt0weOPVTesEy+wex4cKBt3v0nXlOwv4dcZ2fa3YdGPT2Q8T81iiVk7UhDc54QNVLx
	0TD24819kXJlMtZ8yYfcGuwTpsSkPNHAGXtlY3KXfIa/S2OsP6ZHUD9Nl2xVeywz9ExyE0WSIvS
	dbRTf79Cr086sAe13y0BniOD80gHmal5ZNgIDb0MJscZDSP54qXFBuY
X-Received: by 2002:a17:907:7b9e:b0:c29:4970:abec with SMTP id a640c23a62f3a-c2ac24cb86cmr657977766b.19.1790370126717;
        Fri, 25 Sep 2026 14:02:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:aa1:1647:5faf:ac50:9dfb:d1bf:ddf6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5df167esm1421523a12.25.2026.09.25.14.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:02:06 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [RFC PATCH net-next v3 4/5] net: dsa: qca8k: flag QCA8337 internal CPU PHYs for SmartSpeed
Date: Fri, 25 Sep 2026 23:01:53 +0200
Message-ID: <20260925210153.8717-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <d2797713-9b92-43c8-a26e-bf3bc9817ad8@lunn.ch>
References: <20260923215858.1653-1-yongzhao.derek@gmail.com> <20260923215858.1653-5-yongzhao.derek@gmail.com> <09d669ff-7aad-4414-880a-21c2e7bf2cd7@lunn.ch> <20260924234814.1734-1-yongzhao.derek@gmail.com> <d2797713-9b92-43c8-a26e-bf3bc9817ad8@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

> But this is testing the wrong thing. This is testing downshift
> works. What you are actually interested in is downshift happening when
> it should not....
>
> So take a closer look at the user ports. phylib should report when a
> downshift occurs:

Thanks, that is a better test. I ran it on RA74 with the OpenWrt 6.18.52
backport that includes the read_status change, so phy_check_downshift()
sees the speed from 0x11. The user ports keep SmartSpeed at its hardware
default (enabled). The CPU PHY keeps the existing workaround, so
SmartSpeed stays disabled there.

Across 8 boots (1 after flashing, 4 warm reboots, 3 power cycles) and 10
"ethtool -r" on each of wan, lan1, lan2 and lan3, there was no
"Downshift occurred" message. CTRL1000 stayed at 0x0600 on all four user
PHYs, and each port came up at the speed its link partner supports. The
only unexpected event was one link drop on lan3 about 7 seconds after
its last renegotiation; it came back at 1 Gb/s after 3 seconds.

I also tried to recreate what the CPU link sees at boot, where the
IPQ5018 PHY does not advertise 1000BASE-T at first and adds it a few
seconds later. On lan1 I switched the PC NIC 30 times between
advertising only up to 100 Mb/s, with autonegotiation still enabled,
and full autonegotiation, then restarted it another 10 times. lan1
returned to 1 Gb/s every time. In 741 once-per-second samples CTRL1000
stayed at 0x0600 and 0x11 bit 5 was never set, and there was no
downshift warning.

So on this board I have not seen downshift misbehave on the user ports,
including when the link partner changes its advertisement in a similar
way. This is one board and a limited number of attempts, and the link
partner was a PC NIC rather than the IPQ5018 PHY. It also does not show
that downshift works on a bad cable, and the CPU link failure itself was
not exercised because SmartSpeed stays disabled on that PHY.

Disabling downshift for all qca83xx PHYs would also remove it from the
user ports, where I have not seen it misbehave. The CPU link has no
cable, only a fixed on-board connection, so disabling it there should
cost little. Given this, would you accept keeping the workaround limited
to the CPU link, or would you still prefer disabling it in the PHY
driver without a flag?

Thanks,
Yongzhao Chen
