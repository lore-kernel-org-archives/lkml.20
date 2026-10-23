Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721021;
	b=NsKRAm1pp5BVIa4HVA11mVkQKZbs4ro5qOGs+/3BoUku9UIsZjrk4elqv00jvu/t16eu
	 BQ9USX49lVBZSmXfx8x4+vk0OiumbmKZ/OowksVvYpx1cycQ6imM7A5ny5HmnRewh7b26
	 huXFtbt3sI/Jnh5j8HMgWn916IHHlChnhh3zjVhhpJ4ug9qg+XDt6OyNIu1CIx6bZpJk3
	 RxluGfeI1PKBiSc/rNVKtnGnRlgMvuKNQkn1Fm9szUuZVG+3TFZazysBQTUjSTdbsSQI8
	 dFacsYD1NzhWpUU8G9GIkVA7Wxo/Rb5YW/k+J+wMU0OPxpT3KGqwnKhmNFCQm1LozwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721021;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=FGftDvuYzWl4uIjT43BqY7IOLMOu3QmAP9RtQtt3iTo=;
	b=D0SOM9JEFKQBePMfatTuM89IvOJa7mgIDO5QpocRrKFZmeJ4IbdW8QQPTFhtZf2DZ4eV
	 6JhqcrcFNBH6PEz8QQgrjIDHkInjyCrvBo2LzNCPT8D++4iGqNmR+Ag7fS4OQpPCIJt7P
	 VVAvmIEmsqvtBE0qV18M+vOJXgtYTld1nMj/RU/dV0tJujqQPdlfCdw6BmBJHhpB4nCrg
	 ZmInStRRmn64ozQnxaMykwb6Q6ajIzjJLhY3UNHpR2sDaYwtmHPPNguD7iKZqJQ7VRNQJ
	 KyvAsjX2ADbO71Lg8p5MQyyH0J9lp6XdY6tRXL7qNGsPxQF2a7lxR6fA/Kxmg7b4yLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=r-sc.ca;
	spf=pass smtp.mailfrom=r-sc.ca;
	dkim=pass header.d=r-sc.ca header.i=@r-sc.ca header.a=rsa-sha256 header.s=spacemail header.b=GgMYVep5;
	arc=none smtp.remote-ip=198.54.127.91
Received: from out-zbxj-a91.jellyfish.systems (out-zbxj-a91.jellyfish.systems [198.54.127.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CD4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5CD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=r-sc.ca header.i=@r-sc.ca header.a=rsa-sha256 header.s=spacemail header.b=GgMYVep5
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j9mWv5zRkz8sWN;
	Fri, 23 Oct 2026 02:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792721004;
	bh=FGftDvuYzWl4uIjT43BqY7IOLMOu3QmAP9RtQtt3iTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GgMYVep5f2AQRKEPh3d1Tk2x0XM5ngKrM+W6JJ6/5BVuKKZxHedoaje9GIkVwCKW/
	 63quCcXp4SqWh0V2R9Ey+HFfOtTJa26lP5I+41s/dIC4Mfh+9mwSkQnGJXua+C9ZLB
	 VFTnxAVobOxxNEHJGMimBS2UX9Ikdd9LDUCIjP0dxGBCEjIKbLrkptOTl/CDvBnOif
	 pIvZlM6CG6pm8q+6Ez6a2Ykq9/mAJ0MijqFWdi1Xu9aYl/7xPmPXpPhQHMvmrN5oqM
	 gkO6Nxo24eUGEFk3sS2k+Nh+4+rgGQK+HBw+RpWNVhZR1g7nHbqNK/US37hEa1WNcj
	 z4XcJNt1GS/rA==
From: Ross Cawston <ross@r-sc.ca>
To: kory.maincent@bootlin.com
Cc: netdev@vger.kernel.org,
	kyle.swenson@est.tech,
	github@szelinsky.de,
	o.rempel@pengutronix.de,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: Re: [PATCH net v2] net: pse-pd: don't enable a PI again while disabling it
Date: Thu, 22 Oct 2026 19:03:14 -0700
Message-ID: <20261023020315.1159-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <3a9f47f0-884a-49c0-a0a3-d68ea8bdf015@bootlin.com>
References: <20261019220835.613-1-ross@r-sc.ca> <179266373570.3135.5306089916848589884@kernel.org> <3a9f47f0-884a-49c0-a0a3-d68ea8bdf015@bootlin.com>
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
X-Envelope-From: ross@r-sc.ca

On Thu, 22 Oct 2026 14:21:12 +0200, Kory Maincent wrote:
> On 10/22/26 12:08, netdev-bot+sashiko@kernel.org wrote:
>> - [High] The fix is incomplete: the PI being disabled is still enabled
>>   again, and the power budget still leaks, on the priority-eviction path.
>>
>> Pre-existing issues:
>> - [Medium] The priority cut-off in pse_pw_d_retry_power_delivery()
>>   (drivers/net/pse-pd/pse_core.c) never takes effect.
>
> Can you take a look at the above issues?
> The other ones are currently in discussion with Kyle due to similar
> report he faced on his series.

Yes, both are right.

The eviction path: v2 leaves it as it was, and its changelog undersold
what is wrong there. Besides powering the PI just turned off again, the
retry in pse_disable_pi_pol() can enable the PI that is making room,
from inside its own allocation, which then requests its budget a second
time; or it turns the other PI off again and recurses. That was already
so before v2, when _pse_pi_disable() retried the domain itself.

I have two patches for it on top of v2, build-tested only so far:

- "net: pse-pd: don't allocate the budget of a powered PI again": power
  delivery skips a PI that holds budget and is enabled, and a PI that
  holds budget while it is off has it freed and allocated again.
- "net: pse-pd: make room for a PI without recursing": it selects the
  PIs of lower priority to turn off before turning any off, turns them
  off without a retry, and requests the budget once. If that fails, they
  get their budget back and are enabled again. Only the PIs that stay
  off are notified as over budget, and the domain is retried once
  afterwards.

The prio_max cut-off: the second patch replaces it. The retry goes from
the highest priority (lowest value) to the lowest, the power-up order
that ethtool-netlink.rst documents, so a PI of lower priority no longer
takes the budget that one of higher priority waits for. It drops the
cut-off: with the PIs to turn off selected first, a PI of higher
priority only fails with -ERANGE when turning off all the PIs of lower
priority that hold budget wouldn't make room either. The budget left
over is then of no use to it, and once there is room, it can still turn
off a PI of lower priority that took some. If you'd rather keep the
cut-off as well, with prio_max declared outside the loop, I'll add it.

I'll send v3 as a series of the v2 fix and these two, once I've tested
it on the RTL8239 switch with a budget tight enough for the priorities
to matter. A test on a TPS23881 would be welcome too.

I'll leave the other three to the discussion with Kyle, Cc'd. One note
on the PSE_BUDGET_EVAL_STRAT_DYNAMIC test in pse_set_config_isr(): once
it no longer drops a classification reported with a detection, that
classification can reach the recursion above, so its fix should go in
after the eviction fix, or together with it.

Carlo's net v2 series changes the same functions; whichever goes in
first, the other rebases on it.

pw-bot: cr

Ross
