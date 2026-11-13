Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794565280;
	b=CqM4/OucZC0O6PRAY2jO3gvTkotiXcSNq5RVWji4+CcbDlFtUCaspzikfp8haK/eq6yh
	 PiAipb3s6vx2jYiqM5a3UVpqRxz6IY36jIPZoskprVT2s1cRCHGh7Jra42AN31AbXQPvM
	 OTNHN7P+rm6UsUAV1HKhEVLWWMMmH/WD9DkkhNZdHuzz6d6STyVWlsN8IAubWvOpIl0D8
	 oBILgc9AzSxwebU8fsYTbqAOXrG4NmcCgSYR+bxKX9MaIIf08GLqdce6VSDwaI8kXArSA
	 BuEgvJ73bRGiPK0KzwsKdcG3rYtb9VmDtJh1q5WMf5xyfHI0on3utYHfKy7CYNr7sOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
	b=gXke6DAmoGAdAyprzr9LA/s9LpPE9eNzLjE1UQ25W2Ira0ASy31pfDMaOND4Hpq7fjM2
	 5rdbH4LdEyc83fB/8rwgvAYKjJEmnWH0X2wuDJzaicrdDG0ZNur0LoBUmQtV2VaV2HOpo
	 uggozcuOdjuAA8N+q7c0C98do5NnVW0qSnzG5YNOnlzXxHYUl+UVl0AS6ssv89T66ZIi+
	 mj+2wzbKTBaQMm0VMNLHyNNaM9SstCNdFPCeoUgTGE8BAJ5QHknvDboee8/sOnSC6+bG1
	 S0VFpQ50oX3HA6rqUCkF1aNs+ZBl1JSphh1v/OVg4paPhPM37sAUiUSiU48n1TlY9MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKCGmPkz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F15F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F15F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKCGmPkz
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso9971541fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794565278; cv=none;
        d=google.com; s=arc-20260327;
        b=eINo+yxefAvzfC/78lDBD8XZ67qtqrtngT+D7yseBje6bEzMZc2qasEC2ZlT4bKRR7
         /lR2YMw/p38G3U0UxDvPBmCPHXLoWcxWAFJc7H6IIcs4g7Z0pVXdo7U4lqNGtodIjLe1
         5FH8GgMp3OvqG4pYYynEP2KKAiM/ZBTA69LvPgOsZz2SLI+oulORV4OJ+2wwGZUpO3Se
         hQ+mKpTrk3au6ya46iSPXCliK/Ga9lH+mjV24xgKtN1LsoKsyJWCOYp1AYhyiDpAE9CJ
         wAXvVSxWP55Z2dyrDXxA7VL6+gymVJEetlWKD0Wf8oPYLq5/5ogWOhMUwrFh9yTPT6iT
         RiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        fh=1cb0tP1ioA/Zv3LCayCi8wYqPIY0faIk7byOp+9+GQ0=;
        b=FFrX3qx01ihRMla9V1LJO/sTflmQCI0v775biSmmMPPudiGBtmgpESK/aB9Oe13W2r
         aGZmY2LfTRCABvc4q3a6IYHFThUI58gQwPFxDkYbf+eujoJTUOIF+YThBuOwLlzKnHvl
         GTeERyvB3aDbYAXPHeUmwZ3M8tOkwnp3rcRDiidyRIKb8Aa0jX+txBLqJgiLnLwz9a2D
         sTBMclfkdG4hHoXF8p9dkECcIu7yQ3SBdaSrAEJyqNlxSTto9L6PLytZM+/DhzK3I5YY
         gjpfoPoWggeHo8l7E77hlCujqJICnQxb7NtI6dr3pyakYthLP2ChP3zhyk3/VwuvVr5O
         VvGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794565278; x=1795170078; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        b=nKCGmPkzXvpE5XLYZbeDQsqnaIXMtEzwB+g01DeN7DZ2eZ6h2fTNIQlbV1skYKGQzj
         81bgrIZsWN6wXSAgisNVJit4fwNCel8QF4ft0i0MO+WKirBD6WxLEqO78MOwkP2PRnZq
         y8u4Vtao7xsYREOSBdvhftnkHM88u04mODuI+zR3dXc2Ql0zuxio4KJ435roZ8KgecpL
         v6VdsY9I3o1qsczES1TVsacvTIPRO9m1SwPQi3z+iWEVoQ5Y68g0+mQ+atLU8S9uOf5e
         1Qf3qYmkw4i/SopbeyMn5FrHyL2j+ajbFofs9phTgLCV2PGO8C50ouUosc15hODp9N/Y
         qaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565278; x=1795170078;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        b=F5bs6z7Kl23vc7bmO0hyjEhL0Fhaz4KW5t5OdCFSlPfjSMVcWwSpmQ6G+SN5bKduyV
         sniVOmqizUVqNmIm6pxkO4+23vxJmD8L7XTlYDPxL4vs/6lWrl+BYF07KGrD2oxOWRqJ
         T4NDjk8jUyd83TWZaOY5MAKNcL2ihMadwBzBo86Xtq68wnnxhieAcdn76mn2kXGNCUyI
         pKGw8/H82GZV20m4QNAfg+gAIfLhQ3LDJGz+yUQMf48+eNPTQBnbLLwyqdRXqjR+/0/E
         jGdYZYa5HnPw9T3/dv3mR2Shlg+6bZf5amXOd5JWrlLzlMW/mApypswcJ12z05XyPP9c
         DvRA==
X-Forwarded-Encrypted: i=1; AL+hErHFlpSVzMHPKu4Q5I9Wt5JyXVOtmxdbaSFRWPUg1aCzAALbEi/3c33Ir3Tv1c+ypT+O7PhA2oZp/Ao5vHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VZc7RbUq/ZXVw9oe/Q3KZBMjpvrjQZNFtdx8qbOR+KaaZP9If
	5beAM7WqEGQIVq6mFC9iNnOJD1h3WrQpwcaU+NwsQLOu+jDWZWxh6miNEt6Gdw7mLRfN3xzemBP
	1s09N2dfTuWF2wBF/nPrpOgP3P7TpuLiBVC6aZq1uKA==
X-Gm-Gg: AYBFou0N6LEhz6VVi+e2MiX3n2/9irX5B5hje9WIBKQ0v3mBjeeqmfaMWxCchNrlJfg
	tjaEZmkBbjaInyVygt5VRknoKypfbnyKm2M8B0oT2I9SBxUj8gUtF6asdSe9v1iQhd05a9etJZP
	Sl7JH3ul+/SMvAeyH7ozzgBMpFeobrSAtL7LhMSp1Lf0nXaQRrlytpxCWYhdkwMK6fFHvIV2/Q7
	6527/ikrt9Z8Cs0qchVsfr64nQNb3S2ER+GmTjXhRzYGOR3D25Muu5iFKMK2M51dkzSkyJEHo7F
	1kSjw+zMmP4lFN0oXTnHb7ZGI6gHsyiX7ivkh6j1hHroWMu0sRhyRTWc/W7isJLNfBnWCv7rW2K
	w93P8oe56zQTjkw2Ogu9L4SnA3c3gpXn7UpjHwmq0UlRCJfPdl0E59qiZ9iNTzXoDM/ab
X-Received: by 2002:a05:651c:b26:b0:3ab:3bf3:1606 with SMTP id
 38308e7fff4ca-3ae2b52ecbemr7965161fa.24.1794565278183; Fri, 13 Nov 2026
 02:21:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Ruben Pedrosa <rubenpedrosa993@gmail.com>
Date: Fri, 13 Nov 2026 10:21:06 +0000
X-Gm-Features: AclHuK_25jkOvz0nSARx5Boy1NO9Hrp_-HSBPcW6fvmunFBU0BNcj_ZBBVnqIUg
Message-ID: <CAJx0sk_pH2iHGYjGjSwg_ODJCPjjh=ogEdun-u6kh8V6KxcDKw@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: use smaller DP rings on low-memory syste
To: eduard.hart@etik.com, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested on a second TP-Link RE700X (EU v1.0, IPQ5018 + QCN6122,
256 MiB RAM), OpenWrt main 30a23ae45160 with this patch applied.
Running as a wired AP with clients on both 2.4 GHz and 5 GHz; both
radios stay up, no OOM, and settings persist across reboot.

Tested-by: Ruben Pedrosa <rubenpedrosa993@gmail.com>
