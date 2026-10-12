Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB1539A070
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778770; cv=none; b=FnM/qFs4XhF6e8ytK5x6h8qjaySOMXTowyiV9VIA/DxAEhPAvmpHyWgNsFR6AbIQIFUiIp3I6w4GuJVqE8scuVX4oRs450Qk5Py9gN7JvJ0Y99tsfVv6QgZyNXM/KML7JY9VPCJ+MNIrZEOQ19l0saGtAJbqHBpxzCLaT1qEq70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778770; c=relaxed/simple;
	bh=q9wggIScG0yYQHYBn8qso5oELnUyYQWG4oIpv6QMBcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp6QH2OxsBVhmMYdtmb1CZxF83EvGxiBJdXSIGhcBsbN+EwRIiq7kAThxtVTjjk35E+5oEJsQlRUgz6IEn2PyNaggLQhrbh21rhawXCDBL6CkPI4b2G4m6HuvHpDlSt5M2dWhpDveAqofe3BXAPVFZCjjtf3O02pL8wRTdqHIl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jT/CAMLu; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jT/CAMLu"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso2511201eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791778768; x=1792383568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efFkaQFetsAOpWM7VNvA0yYFgrxZuGTjrhnbsOnuNRI=;
        b=jT/CAMLuUu3UuUVx17HX02eMHxxg7gAJdwJ95UHpzktwoGPrVwXfyaFVaq2OPw446V
         KWPtS4WoyX/Nnsoqxy8Dc7BvS4xgYV0ATl6KHJ0lb2zdoQnzKClW1pXg7Z2hpARuNtg1
         USIzHEN9V7u1WxFi5guo5yV1C7uO/Z31AKQIWDeVDP9lWkvF81iww+/gnRZCLqRcA1xV
         zU5rmSJVJbHHg27rO2Mhn28/JiLL6t6uf2Sj8CIYOpQgsTDT7CcBLLs/okVKmKpZfP1a
         jQSC502wZaI+qjccEQvk5i4nm9QuLp2tF0afkuCE5q0UpErTEl7rN7bHycmYDLpcQ/iq
         fInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791778768; x=1792383568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efFkaQFetsAOpWM7VNvA0yYFgrxZuGTjrhnbsOnuNRI=;
        b=xL1JgmG2qX4cGSGWtGHqQZduBXxUCNvwnHi+uTySu0q0L5qjN3LGre72H1Y0bOHku2
         wcIHhXVnivdNO4txJ1OSH4HVu5BAUgqUQ1DgCr414srb5kCjHNiIWW+ACmqwIceEWyxi
         FWDAwrhpvFzFOwtyYgk9wiYdIAn8n/PPxKGDoGjU3LyJ792HvYFKXtipzvDlzWdyyBtE
         xWWhlXXM4sCKWdZUaez70FNoWxUiMzK/Kon+2z4EPSqbWF8ntBeap/c6w3FWOpV4O0BT
         1PiCL0Bq9DQ5K6FxUZrudcdJ9DqUZGaHojKKGi5+bXrOpTr/t0sUYfhfMyqmZXCxO7Zw
         MV2g==
X-Forwarded-Encrypted: i=1; AKwUvBywl7Gx1HuoMy9u5ronoU2JC0BnAeZfCS2tNAfNoG7fVDPKoXsTChIfBl3RSqvpVcMhTVe5YTyQNaK3mvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjiw5va0fkxonjjuGD63qbwbSedDct8geQsq2jhowwGCQF2g9J
	qPpeWHxCDjzIaTYJZ411foIfIKUxbqCM7YkGyauUNaSoQYh+D4XOGnMSAVQyEbQ6SqM=
X-Gm-Gg: AYBFou1fYYJI5rpfAfi/rs9yIYD2W2tj7SCH0SQ5Q6YuCMEFJBk75sA4m6XkqNYdTbw
	6EfS5Xa8/SXpxRN5FPMAWGXoWFd7Vuq35nXEX8iUps3RL1bQ4DA4HVUibRh4JfA3G1hVcPphySO
	wfGNvu+J77lcjNqJwjOmBunsffTulx1HB6G9gP8U/S4ZQKm+aBlOh3+LbKqhV1XVROzjk3XNpI7
	u+5LecReVl5KbKWadWBNM7yTnscAGOvY9CEy0/zbsJfUSIroalouba6AhcropT5GOi+tejA7hXj
	+R6kZuvIrT1fBK17SDPwVxJBanFGc1QRKXh++Nv5KViOEoTjO9+d1sSNlKAANpwh9w2T2GGTqRz
	af8kdaH7XzVmnPYSpwQKsEtNi6K7IBP9I8DYmZ7SK+a9qt9MwbcKXq3npPAPWUI1Nmld3GeqM+F
	rQ5PwqpjfkMZrntR26gplPWbKRiX+tK2/sTdZmlUGYZdtpzo/iNAERp9TydBUx3y76Ya6ikfAJ
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr11356001c88.47.1791778767995;
        Sun, 11 Oct 2026 21:19:27 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm25739266c88.7.2026.10.11.21.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:19:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:49:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: mediatek: Suspend at the opp-suspend
 OPP, and mark one on MT8173
Message-ID: <asxfzG7bNohf-gcB@vireshk-B250M-D3H>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>

On 09-10-26, 14:44, Ryan Brue wrote:
> mediatek-cpufreq has no .suspend callback, so each cluster enters system
> sleep at whatever OPP the governor last chose. On the Amazon Fire HD 10
> (2017), an MT8173 tablet that is not upstream yet, entering
> suspend-to-RAM with both clusters at their highest OPP (2106 and
> 1703 MHz) measured 63.5 and 63.6 mA, against 52.0 and 52.0 mA with this
> series. Those are 15-minute windows of the PMIC's coulomb counter,
> alternating with and without the change; one count is about 2.9 mA.
> Earlier, on the board's previous firmware path, s2idle drew 210-232 mA
> against 158 mA.
> 
> Patch 1 takes the suspend frequency from the OPP table's opp-suspend
> entry, as cpufreq-dt does, rather than always using the lowest OPP. That
> keeps it opt-in per SoC: this driver also runs mt2701, mt7622, mt8183,
> mt8186 and others I cannot test, and no MediaTek table has opp-suspend
> today, so they are unchanged. Patch 2 marks the lowest OPP of both MT8173
> clusters.
> 
> Patch 2 also reaches elm, hana and the EVB, which I cannot test either.
> What they get is a switch to 507 MHz in cpufreq_suspend(), which runs
> before any device is suspended, so the regulators it needs should still
> be up. cpufreq_suspend() also runs from device_shutdown(), so reboot and
> power-off switch first as well; on the tablet, reboot -f still resets in
> 1.4 s.
> 
> Patch 2 does nothing without patch 1 and is harmless on its own, so the
> two can go through the cpufreq and MediaTek trees independently.

Applied. Thanks.

-- 
viresh
