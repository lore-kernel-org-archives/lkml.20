Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863F4DAFB7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008753; cv=none; b=jpMzU3s5dEZ6qibXwCHcpObSv2gqqLnCT9FWdwCCwyxBbEHSaM3K+WhEu+gpOZzHZEVrElc5QV669a0CZhzOvNNQH+xGeYGOEigQ2DiwuC/fSQxAO4HOPW0SxEIPPT/iU2zq7cU89oBhR/pnJfuytYPQkKPCt6hXRGwRxzNloUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008753; c=relaxed/simple;
	bh=24LLjrfzuiFDMiY2Di7cUy9EJjgSsWn/cM0wQ6Zr3d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tihaw7/Gp5f2Q7/rAUHmTfGpyVJRqjA5Lg4X9MEyY7DYMlRPkAhWp/G2NsK5n+n55zMF2eeOo0N6Xj3jZmHPM/3QHI/DHjrZ/qC+wWnWK00oJkQYu13ycpFPvU8/zztAd4IzXcW3SvRYpjLAkR0e9sct6qUcfKhehRKWQowic5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oyV3inQE; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oyV3inQE"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86efece610cso2304811b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790008751; x=1790613551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RTiKA6dzD/roszw2geZzPgwk2NApUJFQrzcJ6rWXdb4=;
        b=oyV3inQEeeHTqxshpe/ogEl7ju8v7wlSGKV8bYi7/jPp2xNvY75N0XtQlSAVvHe1bO
         oLv5Ucqi+We9rxUgZhTCL3E6KE7U0L84Jsgjv25Kmnx1/s038WxTnkvd7OxPHUtHlvJ3
         Ou8Krd/nIkpIghqkR3+p/jTEh83Rnr82O/X2PnLiklAJvV6ZK8uVUb8J3a/fw/mI10DY
         O13ioxKjOe2IplsuOhQgZqAa3QAHn33bpRo/mXb7pBwFlunGtFclgTTVkYTRXqhSVwoA
         qpWRGF2SKWT4TlYcy5ne9wj9wZ83LVkKiNE67tmMl8rYikXP34nn/DREtX4G8y3Y1jxb
         hytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008751; x=1790613551;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTiKA6dzD/roszw2geZzPgwk2NApUJFQrzcJ6rWXdb4=;
        b=NXwAUDWGoQ/Xal3TpWiyZFTUgLpe+MDl+qPzG7KPJwwGinp5xmNIj0IH6ELpJW7gec
         zhGaJZHrm1m1NOez8ezuS95tuf4fb/5uVkTlPj36e0HFejifIAIG4Dt+v0VBiWU7QSKq
         G8GDEMkWECMw6ijZ2pvpDTPj4PtuJj5WCY/mkvOYUMEL2xGkPvfM6vsHnUgTy0GeNpDC
         IJsJbenWws00g40kPfB9rhv48KkUQ7AUY6luwh/0GBqSFD68TKXtuj/VWM8GNqhWbgkD
         2/EHyaYvYbngCVIIPnf7Uvb+tmdQeS4pnJ5ggn4ED5JVqtPWZM1bhnPOGngr5sq3LucP
         bUtQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9LsLLLazcRqzE5cTAXA2ryqFElcl4g6eLXB3qKp1nwMmttxQLJRk0feWLRXYv4g/IZcfnoLCWgrOAJM8=@vger.kernel.org
X-Gm-Message-State: AFuF++lAIEhs1/sMpoLXMW/n4NN1I4y0YMfBkPfnRlGpQU2jC0w94nZR
	Aj+yltYOe1bafoOJcYFkT7XthM3wzCG+SB77ZUWRf7uwjmKWGYeTXALWefzMcsJoaeQ=
X-Gm-Gg: AYBFou2VuJ8XRYv9Y/F0OXGDTjuaB/DzcLS2PUD3FO660YjyxqleRqXr65TjZzQmSNm
	EDaRyo33LwQDWw7PPCqEp/KzR5MSLKeECj4OZQY2xl1vli+qrZzpF/zrQvs3WRAUPG98IQpaQ2I
	DQ3bEHHRUe9ggnBzSAGEi1DYaxo/XdJSD63cyLQQ/FGdK9IEpO29Wh9xC6oxPYSQD7Q+1BoJrH3
	BvLvEcwn3H0Bb8vUoVZqJ6g421HkhGF10kqTRSm6xxyRK7lNfLJ4aVh4ZoGUskKiTGklRDG7N/f
	QA/8M2bFzyASwvJPbsy5NNHHwphl4qnrGea11Zjc5S/5+uvVmwpeExD89w0YfW+9AAjLGUB8ofK
	IBCn4fRkxzhfTeg1aGIBO90D+Mxd9MwWhHW21aZGTyOG0xyIh+H3dRITJ1oqEcfvc5x1NsIaBd8
	XwxLZbN0T2Z47L+URcX4t3UgBlaBUvcq/3lz2tweiP5cWLSgXbR8EKfCaG3pKp0eh8qQOM
X-Received: by 2002:a05:6a00:f04:b0:878:37e1:aa78 with SMTP id d2e1a72fcca58-87837e1abb4mr7930031b3a.58.1790008751345;
        Mon, 21 Sep 2026 09:39:11 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-877a95f916dsm3568909b3a.31.2026.09.21.09.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:39:10 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Andrew Davis <afd@ti.com>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage
Date: Mon, 21 Sep 2026 09:38:51 -0700
Message-ID: <179000865432.4136193.2675209362900857145.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917-fix_tps65219-v6-1-0544b735edb8@bootlin.com>
References: <20260917-fix_tps65219-v6-1-0544b735edb8@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Sep 2026 11:01:34 +0200, Kory Maincent (TI.com) wrote:
> The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
> which prevented the CPU from reaching the 1GHz operating point. This
> limitation was put in place because voltage changes were not working
> correctly, causing the board to stall when attempting higher frequencies.
> 
> With the recent TPS65219 PMIC driver fixes that properly implement the
> LOCK register handling, voltage transitions now work reliably. Increase
> the maximum voltage to 1.3515V to allow the full 1GHz OPP to be used.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage
      commit: c3037b5c7c38bdf78c214e7dbe513a553ce8f47b

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>
