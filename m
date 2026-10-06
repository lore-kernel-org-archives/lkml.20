Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E554A2A46
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791315074; cv=none; b=WI/99h0/uay6cDTHhNSaSfJgkGYr53X4uoEQapSBw/UpZvH9Pg+DVg8hX8oaRom6SQdZJu1CkvpD1RZ4qNEmzlFMdqI3K8N6OivSpl6OAV2InC+fi+tEzTzcf/YFLhCNRbAs2hNZL5uZo0xPy2EVfwXrr08aJLkQqZIQGgV8TSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791315074; c=relaxed/simple;
	bh=ObcFZUo9XljskIGbuLmwpSTyteIwyyt3iWGxb6XgNn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqE/FoUBuPLAzGp5G4Dl24gUKWlsT4qMJxGBI4SToDEf47RsZrSOvyWneSwfpsVU6Rj4wTpVrTxRVMRWyOg6NRvJhZUTRHI39nKeViTGoZSgVyMqPKxt3Qeui5UnCsHrvjRPguu4F5sjeJqNyOfq6kRWsJXA0WDrbNzSbusWC54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXC2E8ow; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXC2E8ow"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35154cb9de2so966923eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791315072; x=1791919872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObcFZUo9XljskIGbuLmwpSTyteIwyyt3iWGxb6XgNn0=;
        b=WXC2E8owFukNNC5JXO52ZlUeWBcP2xuvuoC7xXh/Ku5AN39VuJGB/64KkkcEKxO4tu
         q5Iu9V8s9e/ydPAkouDPSrwEazX10rIf/5oh2h3J1x0ZowUhpJBsNjifFOfAEfkX+41O
         422t5Z8cT7vUhyhyvxHerVVieooqmVh7MghYlmARqBGAEOY5jjw6uELOS+ufNHfWrdo+
         tlykLeuiYPxi9DjnfYUhypEtdyg0jFhhewcXHsuUqLkfOzdQZNcbEUIbgie17WSbRPzP
         7ZQWgiXpT4j8sm3nnAqX6qavdGabwn7sUJZE6ONEWafKF2vLTvTgEGc1IVzXWv4MlnM7
         EQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791315072; x=1791919872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObcFZUo9XljskIGbuLmwpSTyteIwyyt3iWGxb6XgNn0=;
        b=EJPsUGAWwBy6np6hiSNfo1Rcc2lgWjBunp3TnBbXnlppEWumzhm4SrtLeo4oWN07KW
         g2QmzVO4u61AvTb43JLg+v+cd5n8ILe/pg60lp5uYmaSL9HXaBPAL1vitx1kt/yzfg3D
         x4iLOnSy1fT0nEC8aakcPFWnz54Nlya93iqtTSK+bAqYpDwXjDUeOHYVWZU4iiiYElsC
         sGFpxNjf3dMV7222ToUve0GgnzeCNQnGRUDKP44ER5yiRRB4a0zb7zjeAf5wbSmxPAo6
         Rm9+vnYE0M3dUSuqYDkWnBDx922colJZLfrw2D+CSDU7oUXdmwTLqyAUkHKrnOWPRRyx
         oRbw==
X-Forwarded-Encrypted: i=1; AKwUvByiLx8/CtF95VmIeAk8LV60vICdAN7lGis8k65HvAO8XNdAboutJYk0muOBlHywvxoWeppceVoWlU+pJz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIn2Cr9REhMDtaP+3Rm4x8w4KXqtBw7I2RlDGuaQrDXqF9WRIF
	qLGC/FyLNgMQ5/uIza3WqDcilT/BeNanTygGMrkMetgD3rh/cSKHHsKd
X-Gm-Gg: AYBFou3osDPiwm3GbT9XUHG1awb9ybIuDLBBGamNrKIdGMu4h06I7HYAu59Usf4+RuW
	+LUtuTg2m1MW2VK3pdHR2ZK1oTJ6iXksieUV0/nbHm2Z8wiFylcvBs1jSH6fTHQj8hU8rUBd4G2
	FZLfCJsW2cCC7FlmJGB6d+oxVAgKBhK3MHe/e6toT1ZJFKwHx4Lp0DY5PRg9x7mWoQbOfQHdkK/
	HFj2Gw+HBtPX9/UBiYnAB2bHiLUi5J1ngFLcS3aUbSt747KJYTDBGM2IU8ur+ZXoxjUHyayTRQs
	OqGX06lAIKz7rNwIkaozd2mTl2Xi3wbc7ChFTz7aIoVS9qoCB3sqQJBq2IwnslIOqR1qfpVDYNM
	PIjyHi/bJy9OxN+Y2/AGj6eT07wQwOLHBaaa7PgU2yArtTUPiX9zfcsOD+UgiKpapKskxT+arBW
	tYIh+s1LRubLD2HI3dSaJze04hikN+L+1YLRhXtHdz9SuxW3Shc7fereChlnjxtA09Wc8P0oUeT
	GPBhm/erY+0OcaCap4VJ5+Xw2d8dFCq2ZTOWvrxzdWRU3+oO2vGP1wepKLPRQhFxDRRCCS6lijd
	vYFSvmg=
X-Received: by 2002:a05:7301:fc0b:b0:351:5665:e451 with SMTP id 5a478bee46e88-3515665e804mr975434eec.38.1791315072116;
        Tue, 06 Oct 2026 12:31:12 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af170c5sm717764eec.11.2026.10.06.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 12:31:11 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH 3/3] serial: 8250_dw: Add Allwinner A733 UART
Date: Tue,  6 Oct 2026 16:30:46 -0300
Message-ID: <20261006193046.540252-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <603b4f40-2a60-4bc5-8b98-ada7a52fead9@arm.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com> <603b4f40-2a60-4bc5-8b98-ada7a52fead9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

On 10/6/26 14:16, Andre Przywara wrote:
> So isn't that a bug somewhere else then? Why would it gate the clock to
> set the rate?

I think the bug is in dw8250_set_termios(). The gate comes from
4e26b134bd17 (2014, replacing the Baytrail hook) and runs on every
termios change that reaches the driver, with nothing draining the port
first. On LPSS the UART's clock ends in a gate on bit 31, the divider
update bit, so I'd guess the disable/enable pair is how a new rate gets
latched there. On the A733 the DT hands over only the bus gate, so that
is what gets pulsed.

> And what is your use case here, exactly? Do you reconfigure the baud
> rate while characters are incoming?

No baud change. I toggled only CLOCAL with TCSANOW, 300 times while the
console printed 3000 lines. With the gate alone every run lost 12 to 18
lines (3 runs). With round_rate and set_rate but no gate, all 3 were
clean. A CSTOPB toggle splits the same way over 6 runs each.

> So can you just expose CLK_APB1 as the baud rate clock in the DT?

On the A733 the UARTs aren't on APB1. They sit on APB_UART (0x538),
shared by the seven UARTs. I tried it as baudclk with the bus gate as
apb_pclk and the console was garbage. The driver asks for 16 x baud and
the CCU rounds down, so 115200 gets RC16M/9 = 1777778 and divisor 1
gives 111111 baud. 24M/13 is just above the target, so it isn't picked.
ccu-sun6i-rtc lists RC16M at 30% accuracy anyway.

It's also shared: 01569a29af76 removed the clock notifier in 7.2, so a
port that re-rates APB_UART would leave the other six with stale
divisors.

For v2 I'd drop SKIP_SET_RATE for the A733 and only gate and set the
rate when clk_round_rate() differs from clk_get_rate(). By my reading
the branch is never taken here, and that kernel was clean in all 13
runs. H6, H616 and A523 pass only a bus gate too, so they likely see the
same thing, but I can't test them.

Would you rather drop the gate altogether? I kept it because I can't
test LPSS.

Thanks,
Vinicius
