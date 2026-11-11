Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387767;
	b=Nh3qDqEcX9WW69yymK5VFglqnTkBF0XoskrrGcPlXG/ATnKcuahhX6KT/cN7fZcYKwyw
	 rOq9NF+bJzoCkrxYPD7nnLomYnbYpK2Bn6A1fDsXwG0TBqBoL69pZi/rdA1vhDE/xTHlF
	 G+V8MoBF17Tx+5QJrgdOvX834/VoQSczQ1sZdjQ1E0Qooq0ntSrTVE210d7/tRBtAvFvl
	 HhxgTyQ0gkaUvNH3TF50mwe/0Bn5z3iWE1dmMFy7rbn8hskFVLvDlaK/bWfKZMyY0rZtl
	 SEQJkfAmU+aeHZLAU0gGfWxQnaW4fQIIpRc1hsX9lNo9X2snLwE+H4UudHOmyUe2sxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=d7Shyvap/rQCzCh3qir4WYUsyWobu7JIz4i2TY10uus=;
	b=ryayGDySXRFSqYPKMv0P4BLlECaDNQ+kW0eria3Y7/25tCOLYDA2mFnbtV8j51c7rgeG
	 JVN3wvqojWkvB6lQXzTn4HWDW2z9If3SmGNH5agmFwC7aCfUWak/Itx2PG3NuXFIvwwSL
	 gtQ6V0DTm0LDGQkeN6+jIpFqe2z1ZKsgE1WAimfUYsw6r8ZV22aA75YVB/Hn23Q2Ng27l
	 /418R9euVcK56bxBT2EdzhZtfNaGVa1HI7+iksrqTdh/Q66AtvfrJARq89tSBA312VYqy
	 14ZvkYCV4gU3/2mtnIYu/L9RuB9k9I+PeqrqSN+hgsZqKnvWNTiame8x/cIlqd7wYdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BAB1yuPo;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84939606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84939606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BAB1yuPo
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so23758025e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794387766; x=1794992566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7Shyvap/rQCzCh3qir4WYUsyWobu7JIz4i2TY10uus=;
        b=BAB1yuPomcOcH/xlFci04eJpVZ08wJ+M7UpaAoNjJauX2grPI2D+JSod70QmB2esBp
         UfmXmLLiH/q+A9bl88dBBhBCPmKvd+fwoFBKOLQT6E5MeKMOBAHCG/88a+1775Ie1gyH
         JuahcF9olWf3BE7KEaESLSbx3t1s0uPzj5MaZoX16/BS7WBWEEzxd0v8HhBkzOZItA8i
         MBOApAJHl23FgMZtOhInAUltgdjBwu7vl4mPSWMzdBR+v+fYZvdavltPLDLH0FL/nIoe
         IoZQfClZqzg5qFsWxhs1qNls44DMuMpKCHoO046prSNxkcfaNGi7m9kVRg6lqbivfj+k
         Bbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387766; x=1794992566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7Shyvap/rQCzCh3qir4WYUsyWobu7JIz4i2TY10uus=;
        b=Jzr48QFtWfyQpbNEcaHCut7F/6zmHl8i0KN9BVkMFjc/+ZCvBwPtzLd8XmqZdaQC/D
         isYpqWvsNBFE9efZI+tSwlOffhHp9f9idaTlkJQUl+yoOLv/0IbOILS/2e1bGuFMF/Bb
         OVOxP9tX/BfKJjOhq434Vb6zsB8dCGypvQnSZDpwZUc6qQ/OL9qDF+HruK/iselHg8Kw
         MUmAYQ2fQnCSLVXoia1/6BKXXPMHo53x24GGdvc1vLYkNf16NudE3ypZGyyhdQzEsdFy
         Tkvmz1+q/+il/GsS1xIIK5wOc1MOXT36cvDO0LCDlMCqMASfTCRa+rB2GzHo9nXv/cG+
         /dDw==
X-Gm-Message-State: APuU4Z9Y3s00TpTPk+O5e8hlzsYnnl+d1Kgl0aEDypF5uOaeEmIi0nw3
	bXnyTtM7hITiP/YLg94qxvsdZVrnp5DkPWnSdDVk3RyRbiEa4SsgU5oMPOrxbfrcHW2pPDk/S8a
	uYRayooE=
X-Gm-Gg: AYBFou2Xn99xhcLC2OeBB9qhezmMHI9BIbAgQs8iCum6KqSOOZAo560duFCdYJ/O5kl
	bISdC0dJIaTJ5wTV5GOEVmrko5P4wyy3guKT5H9MuSG44iWRTqUXOvwW0x/RTNiptSEXW3Aiw77
	6lyg2ihkyIPKjOMfyB66QMzwvPYwhqFGZhndibZDEcVJko56XlyspuUEfzvoo/d9uAgxqGbi/Hy
	lr0ZL/Ybc9dcVGg2kl8f1+GfkKPorUpw5dTulnxQWHJgDygQWlXT5Lu7+f/un2LYHg2NAARPQLD
	E/ooXfkQXHsGvbM1DoFLwYZWLr4c/0FZZMjd0CNPm6UwoE2mSM35c6Zw7lwPbATnQKy4OUxWrER
	W8a8p/rrjWrQcbfA/qBvuDW0ddLCU/EFoqS4pAg2j3+QUu+w+2pYjaLxc8u6/Rapl+mAu1EMEMV
	DWjIWDpbj9HDT65kI6dzmCNtGt2At0bhsM9sEX8Ra+olfBgTn7FJaTmhuAFUnEKR22nVSK2iwxb
	vzKl72LEpczz2DeYbi2Q3BHquwgpAMiVFq/VAJQtmhm0cALoL3IYuY7d8ZcBX/ZTa1gjf+qzalj
	XwQNSLWuTgVwQfXNZLkMltJ3sHnz2RLcJnHnnubsjud9BbGqLS/XuRvvYIIKkDgGC6GkWzIr1sM
	BIwNUJtkrdVrsJw==
X-Received: by 2002:a05:600c:a311:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4ba2bfcca58mr14641885e9.10.1794387765759;
        Wed, 11 Nov 2026 01:02:45 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0204e22csm116559455e9.12.2026.11.11.01.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:02:44 -0800 (PST)
Date: Wed, 11 Nov 2026 10:02:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] parport_pc: Drop unused assignment of pnp_device_id
 driver data
Message-ID: <avQvD48EaZEBdc1p@monoceros>
References: <549d7f4d912e7c38bb93f0c40844fae291dac532.1781101238.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="igquuszfni6gofrv"
Content-Disposition: inline
In-Reply-To: <549d7f4d912e7c38bb93f0c40844fae291dac532.1781101238.git.u.kleine-koenig@baylibre.com>


--igquuszfni6gofrv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] parport_pc: Drop unused assignment of pnp_device_id
 driver data
MIME-Version: 1.0

Hello,

On Wed, Jun 10, 2026 at 04:25:10PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The driver explicitly sets the .driver_data member of struct
> pnp_device_id to zero without relying on that value. Drop this unused
> assignment.
>=20
> This patch doesn't modify the compiled array, tested on x86 and arm64.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> I'm currently working on a changing various *_device_id definitions.
> This patch is irrelevant for this quest and a pure style update for
> consistency reasons without further dependencies on it.
>=20
> So if you don't like this patch, I won't insist.

However if you just ignore it, I will remind about it anyhow. Is this
still on your radar?

Best regards
Uwe

--igquuszfni6gofrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0LzEACgkQj4D7WH0S
/k7N5wf/T8AIhDEoxgIxQf6FqRvh/wmWRf5MJR3Ryi6qTpZu2lPO1yNJi5cjs8bl
0u83eodO4bpg23uT6xgPbJQdFz5QvGbr9EGVeoZm137CSJMzpT3Fy8kE8Hu4E3I7
pjN5w/pYRwM7W1vyNCSQ6uJ4ZFXzfGy4EGYlV4/8ie7VzXJhtPMcrV0N1YkQwHPP
UZP2SsvOoz18BvhAqqekahlviprqrjUQxV2xBrU7vJmX2fY8jIDcrUKTw6+awBEs
bzikzyWNerBJhpifV9+4DnjYta5pWC9ntO0p8yRtq9VL6nWDf9RUQ8rk4kB0IIQf
rn67WzjkU4sQtd8kqO+E6SpJtFrYPA==
=+bA3
-----END PGP SIGNATURE-----

--igquuszfni6gofrv--
