Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D160B39C017
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978470; cv=none; b=nZEZM/LNcZUTgjYEqE7bCs02aGCc0MRyhWoDIMPsQ5nMweGyMvpmVpPncsm0ajrLijKEjW+qfC88I7oaCFpZlAS3e3/NhAXrVfp+RbwFNmcH/HeIoYKsvbc2hgzWNqC9ujqZjz3xn6zcHcBnHEgd/zjWE8IiGO6N/TvH+Eur/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978470; c=relaxed/simple;
	bh=jpVDW6nqXT3bwXZCXv2EI+3UUbOFqSMc60wFkeXbAgk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=lc6H17zyAHxB/RAfdVJWx9YSkIwAR5bDDMsWn1976KpHWyw37ak/I0asbP+F/LhKTUp30WRmBNH/pfQVjT+5GZR2Fz31myB+8kpsnk1ZaYyBs5MbH9Odes053/E0WhxkBEcEH/8ekywnzd+rqc9rw1V8RnT7ec60FDOFUhl4zsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeX0in1d; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeX0in1d"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso60929865e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788978465; x=1789583265; darn=vger.kernel.org;
        h=to:from:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzzpRVmc6Qf1040g7Lq6SnAgBrX6WGAOi89cdyMonLo=;
        b=qeX0in1dIzu48J9x5R8KqoTgevc4Ha9nGP+vm5qnQuFRJAQAKFfvLkerixsPp9wrN7
         NQceb6BXTODR7Uphy1FCizGjrECYncTVVgc1vN2ooJ+LPAdnQz5D9+KSM5WHRWJz4xx2
         1Whs9gaD89BhX3DwW6WYIlZbM1W04FhS3wmCLrNH0F+NU9p4Pq2N6FC7TQUCDXcQi3sl
         JcahU8yX7q51iL1NCo1/NHpl4qaLgqd2YrcNgpkFlSD+lj4cnz8brt1/YPyI/4X67Vnn
         ItI8xIPR7iVaPcyP29zq//wxxgPmLmPevJP8BQed3TRGKlFXEzO5NsmlFmeBjMbtyrNw
         PI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978465; x=1789583265;
        h=to:from:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzzpRVmc6Qf1040g7Lq6SnAgBrX6WGAOi89cdyMonLo=;
        b=LPb6eb0SxsfTy57NNEJQBAvGHseP/xWMdz0r9SCs6IlMzaHICLeQ9LDJ9BSsBKlovB
         xb7uDfS/R4zgCfxne4R3e6neTmImNvzFgoSYMqFO72Z4ThfI2gs5vsut5NbgQUBryY1+
         bxbGn8wUL5ihmYMwX51lLeXj9EvXYSbmPMMeV6YXYJEkx4mdUBsZgMIYwxrb/f4qmoCs
         Vh0M6Fb+C2cdOShjaWgcFhTQXn8cdVvHFfa8wq5KiR2YRqZRWVuq8bHdjngTD0c6CWkO
         gBOy3sm84ntFGEVIxBPyLZ/ipX/5bEUjxb8lrLYxrZGCAOijD25XkWR8dpg2KI0orjci
         /R2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQ3H1AwvRfV6GKan/5DCrYKW1MWZCwsAL0g3glO3g0EOBjtHDT/VUXbW2dxAMBLCb1MIPcjxuWeTh6ofA=@vger.kernel.org
X-Gm-Message-State: AFuF++nw4DLDhHObfNOlcN35K0JZVFB5yDeuKvo/iPczUpqiZBJhr6RL
	S97YlXW46VAO3dW7dtGv+DH1abYFH0ZL++30nTnQukJF5OTCWUDWdCwLjRPpIUU3AGY=
X-Gm-Gg: AYBFou0o325Ab///LdYxLOQxayGt36tGUr+WoglzmSKbVcLObEc9XEP4KdxDQBTpwIw
	iG0b2mKH+6ms46ImFwEaNTt6p0eTcmsxBp2f9hY8SVfLCyT+vbS5BEAPPatoa5U2N9vd+9sOCWK
	HzN8dSANUWZVEoR3rdfMnjzDwfmYIEVDFbFK43mRvsM6GQU94mencCDl+2GpNfD3+f5I2Db+dUq
	rRUei3FaMVJd4nL0Km9zeT5Bhlj7JleO2PRAowKVz1QseXPkMlQ3InlDmAt2zyTglf2S59pZ20m
	kS3/yGIKhqmdOm1OMy+L5Qx/b6CcMWtrvUyZ0mjWFAeqS9W4Cyi8TyVuPn2a5ZXSGPgjIfwRB7n
	WHGhJw3WyaLRLsA3raIZiChZ5jnIkVTkkBlKpVurN8cJF0ZgL95pMlPf0/+Heo8PS7vK2Xrd7f7
	/gY6TYwH6ZTS3Pp7vm5q29uDH8olT6gFkR7rMwnBfbLTzifntCiEqtNWS4HXSLki9AaYFIhKnWU
	oKZUCNw3niCLnYxLgsZhI/y8sxj+0UOF7sZqxO9ExfR0XWtAheF7rDv1BS+
X-Received: by 2002:a05:600c:64c6:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49cfa20ccaemr335752275e9.25.1788978465474;
        Wed, 09 Sep 2026 11:27:45 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c07c17sm11855715e9.14.2026.09.09.11.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 19:27:44 +0100
Message-Id: <DLAZXSNZK6QC.1VFAX37XCXBOV@linaro.org>
Cc: <linux-clk@vger.kernel.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-samsung-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [question] [Exynos850] ACPM firmware doesn't implement
 ->recalc_rate for acpm clocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>
X-Mailer: aerc 0.21.0

Hi all,

I'm working on Exynos850 platform support and currently trying to deal with
ACPM firmware clocks. ACPM is firmware running on separate co-processor
(like SCPI/SCMI thingy for instance).

Unlike gs101, the ACPM firmware clocks protocol on Exynos850 does not
implement get_rate() ACPM IPC call. Set_rate works fine, but get_rate
returns 0. Downstream reads MMIO registers directly to obtain the rate for
these clocks.

The file is drivers/clk/samsung/clk-acpm.c
static const struct clk_ops acpm_clk_ops =3D {
	.recalc_rate =3D acpm_clk_recalc_rate, <-- not impl by firmware
	.determine_rate =3D acpm_clk_determine_rate,
	.set_rate =3D acpm_clk_set_rate,
};

Currently I made ACPM clocks childs of corresponding parent clocks, for
instance, for CPU clocks:
	clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
		 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
	clock-names =3D "cpucl0", "cpucl1";
and just return parent_rate from ->recalc_rate().

The problem is that stale (cached) value is returned all the time despite
CLK_GET_RATE_NOCACHE. I tried different approaches but don't see smth
upstreameable because clock rates are changed behind Linux and I need
to trigger something like clk_get_rate(parent_clock) to let the new rate
propagate down the tree.

Which pattern is preferred for upstream acceptance here?

1. Return parent_rate as is and live with stale parent rate.
2. Cache the set value in ->set_rate() and return it in ->recalc_rate().
3. Utilise clock rate change notifiers somehow and upon POST_RATE_CHANGE
   do smth like clk_set_rate(parent, new_rate) but that probably breaks
   locking and mixes clk-provider with clk-consumer.
4. Maybe use/play with CLK_SET_RATE_PARENT?

Or something else?
Best regards,
Alexey
