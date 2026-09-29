Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3151E42D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694389; cv=none; b=o/grY9mAZuGdKOptawROt+HgTPV5hqtYOjY4vbJ0EzPkVIAy8OvCzHEu4q/F5PwqGid4sGEePPVlbIozow5QGFrIH/E4MPYrzQ+YYFJ/28VvrgA0AJLgq8gz0MUlI1Iq1kGxGG97jkwKITO8o6w8RTkoMfv+Bfm3EZ9FTmRGjno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694389; c=relaxed/simple;
	bh=8vcedn3CUP1Ygu4h0fKEORUNhcyZl/aYo2TO5TrUblA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NN1WzK2v+cjZThSr+TVkSpZ0uifFdnryC5oLNRi3hTkx3Ao6D9ZWh5JBKooptGWClEC/ygVyGca9M9MXkPkVV0seD0ezxqKgklN4ivGTptaC12XHE0IDId5+5c1j1+n7Z+UYEOFoLJsepOZzYmPv/wff5bQnnMycqy6/GJK61uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ff7feR11; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ff7feR11"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so585169f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790694375; x=1791299175; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLptK7nHgocKDIIOZU1ThQFrj1CHU/IAWIcXLfeThzY=;
        b=ff7feR11aSekwydcvym14NWKr0RFC1kE1CKVvHVryeaGzD633tzAO8T0mElTFaxhtu
         Y56NLQzAGWRs0e3RhvpKEHAVelxx4nI2yaHdQdGuyFR72aEsEJ04oWPSvAW6kaQKTmpY
         5lMMk0LAhXvZ2kGvZQI/NJHLl5BhgC6ZV+IgSfViffE3t9MysfoDPjrLtvrBZdqrS+ZJ
         Ep0JvqhugV2Df+lNjIUP1mCyzZ/vWiT7ZqEouQH7ynYvgIrqRZPfhBDQYR+HH+RWsRxi
         IzToElRdW4JpCUpCXHzMdL87b4/dZKs+npxUQs2uhqR4Cs03x3hm+ZjOhpGDkjAs5U48
         lvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694375; x=1791299175;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLptK7nHgocKDIIOZU1ThQFrj1CHU/IAWIcXLfeThzY=;
        b=Qco9wIpiQfMDwvsMXDRM/k8z5tOTK5zO0Rblyb5gaGKc2GyTMc2hCZv5sCjI7O28tf
         2tpSJyH+y/jHyxLH57+++zhqvoxtz+qOhYQA5z9Wpll2pjP0PKsp8BnXYzhWjdhfAXnQ
         C/luxPh/3tWwlU8yJ44AdFUMj97epLloKHy8YZGMwJ7iShtTER4ezmeh1Y0vD4SYHLj0
         7bNQc8+3FIik/BhJw2JNICRLWMt4THrJEY3aWXHwaDC0AgnfVX4zR8Ifee2syiTTVVO4
         mwp8819pjcbU5oiYyPdGK885xNNKdOZkf0o4G69j5UDtWeEAPEQwNu9O1hYr7MTRQhB2
         wJ5A==
X-Forwarded-Encrypted: i=1; AKwUvByd1R5k6p4hZSdyaRlql01AGQ8xS/0IPMl3eM8CtOFec4zy+UyRFVdc9MXBAD6xeH8vQVkM0CWpm8KwgFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9E7czfIWLxNhcyNA4iDptaQueRwexc1l4YGZR4t7z1b0CpK+9
	63seCbXZMHBaEUqxTri37l5DPhMi2UXER4jGcCjDL+DB/IdqhUccTZ0nTwOhlpzlq90=
X-Gm-Gg: AYBFou0zLnSdztHt1Xz6qs5vFeASjaqcnOCuAPVxNLsHHkWhd9M4cbF7X4OauSHYVYF
	c32ICsHiTTqtlveLQOm68S4u3GxCyPmXiiJOr0ltSWXmJ9uFj6kvKK3rbZNGY6mknExxmmQnSRR
	HCGRMkcCnUJ67QGSuqT+C8shLdEEaC/IWRmK+VB1y/qs0fYQUUTk/Yhbw7hXTSPg5TWdpwixLe3
	l0EfsFj9Gi/aJF6x8MacQ3pKCCgJDvwuQE1yqrWigKO/ige16ExfU9lHJFU2oc4TBbdDWfy3ozc
	cx/DbOh30fVkOirmmBkhAs58FMVIOR/rqxpAMKD26uOvv7Wlq+JEy9Dc6C9Nc3+s+CReUUEZGQE
	1q5g0mOX1pnsepnCepIqnx4p4TSe+QGtOPIkJTNf57dbLUebRVQHoYE7BQnjvUeAtvldZfqdKpl
	oXoQ6MO0bcoqSW7S/jQy3MspD5+98GAN1MZJ/lLSq/ZBF4jjkGRawaitQEw65ufQ/gnMe3jyXaA
	rN9SnkA4VqxJ7IdnKP/4nsC/APzJw==
X-Received: by 2002:adf:e19c:0:b0:487:799:c04a with SMTP id ffacd0b85a97d-48872a5c8dcmr29383832f8f.3.1790694375596;
        Tue, 29 Sep 2026 08:06:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f8edebsm4909091f8f.2.2026.09.29.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:06:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
 <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
 <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
 <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
 <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
Date: Tue, 29 Sep 2026 17:06:14 +0200
Message-ID: <1jecec3xnd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 25 sept. 2026 at 21:45, Andrew Lunn <andrew@lunn.ch> wrote:

>> > You need to differentiate between small fine tuning delays, and the
>> > 2ns delay required by the RGMII standard. If the MAC is just doing
>> > fine tuning, you need to still pass PHY_INTERFACE_MODE_RGMII_ID so the
>> > PHY adds the 2ns delay. If the MAC is adding a big delay, you need to
>> > pass PHY_INTERFACE_MODE_RGMII to the PHY.
>> 
>> The PHY is one concern but the series here does not really address this
>> topic. DTS and board specific concerns will come later.
>
> They are all interconnected. When phy-mode says 'rgmii-id', it is the
> MAC/PHY pair which needs to decide who adds the delay. If the phy-mode
> is 'na', how does the MAC know it needs to use RGMII, not MII, as you
> said.
>
> We need to keep the big picture in mind, otherwise you could go down a
> dead end, and a dead end which makes backwards compatibility really
> messy.

I agree with you with on all this. I understand this particular MAC/PHY
combo is sparking this discussion, Let's sort this out properly, no
rush.

I'm merely pointing out that the problem is not introduced by the code
submited here. Other MAC can set delays, Other MACs would need to handle
mis-behaving PHY too.

>
>> It is really just the MAC. So, how does the MAC is supposed to
>> make the decision to amend the PHY mode ? is there a threshold you'd
>> like to recommend for this differentiation ? 
>
> This is the first time we have had this condition. So it has not
> really been thought about too much. Maybe 1ns. That is the middle of
> the 2ns required by RGMII.
>
>> I'll try to reach out, just in case. I have the schematics but without
>> the PHY doc, it does not help much.
>
> From that i assume you missed the other emails. Somebody from ARM give
> a link to the data sheet. It documents the strapping. Search for the
> patch adding the PHY driver, it is in that thread.
>

Thanks for the heads up. So if I'm reading the doc correctly the PHY
adds 2ns
 * on RX if there a 4.7k pull-up on RXD0
 * on TX if there a 4.7k pull-up on RXD1

The schematics for the board are available here [1]

* 4.7k pull-up on RXD0: so we should have 2ns Rx from the PHY
* 4.7k pull-down on RXD1: no idea what this does. Presumably no delay ?

I've cross-checked the HW, the resistors are actually fitted as the
schematic says they are.

With the HW setup, the MAC setup that works for me remains

	tx-internal-delay-ps = <1620>;
	rx-internal-delay-ps = <1800>;

I know it is not aligned with what it expected but still.

I've tried with
 * rx-internal-delay-ps = <0>. No Rx.
 * tx-internal-delay-ps at 1800ps, it still works with some TCP retries here and
   there on iperf3. 1980ps stalls after just a few packets.

[1]: https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_schematic.pdf

> 	Andrew

-- 
Jerome
