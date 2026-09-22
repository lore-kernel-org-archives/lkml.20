Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D6F4562BD;
	Tue, 22 Sep 2026 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070377; cv=none; b=uTWlXjCq68YoBwrSsISmFDOWWvUvVSAtvkXCAIlQ84pG88j0io/PgzqSNkJ0fr/qY3hLZGOwUGX1aALg3zzAW2lIjidMr151u5jowyWcJhvAh4TD6jgUdP3N8oMtVRY+AEEFuFiCGk32W+TEek2an79vKsYzl+j9McUbCoHpDmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070377; c=relaxed/simple;
	bh=OqvRZJj5kPRj+It6ugJYRn8yhiSUN2qgS6LI0PNP9Tk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OIPi3woPVdwW+vYW620cJX2MVQSE2nhB/DY3oo7y3/QGcf+0+L21y3Ga4IT1VrUcs8La+zdaI3urJocxAPWer5GXKViVsHCeKCPre2QGPkYE4VXTPtsXS/iU2JRJvRfT/SddEzMtVuRS/YTKEGbuR81T9Efwj2opmktIIdr3NyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxnZJB4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxnZJB4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35AE1F000FF;
	Tue, 22 Sep 2026 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070375;
	bh=CNV5Sz8dms0b/G6Vk56f+ekd3U0e51F6ajd/M8urfbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lxnZJB4swe49GY6QiSkcTOQ8EqHSHkTLjbKj5dg+Kcy1nLYqVN7Svgw/mhgK7IApM
	 ohaq+xuocpdYTJNOaHZW7SWgWZ825iAupwcOHIOxtWousQt2R/JqrADca3/AmSvhlJ
	 6ULQ0cxFN4poQOrNvXPsrTiVY6/n6mNBZrS84kwMiJMj23HeqU1Jj62m2P1C2aOFQf
	 ScSFwoa3gHjfT/Rd/OtgNNDnBNo7jmll4/p+GedUOLaO6qcBYKoFiBYgCOqR9Ph3PU
	 sqjttGpRZ03U8HPSNFW4QAYB5kUf5f4TomxE8HMvEYIvmyD90vRvqMO9KeXoj9oOOk
	 KGAdBc9auRGdg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Eric Anderson <ejona86@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
References: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
Subject: Re: (subset) [PATCH] mfd: rk8xx: Register poweroff handler in
 atomic phase
Message-Id: <179007037467.2777136.12266666852504858186.b4-ty@b4>
Date: Tue, 22 Sep 2026 10:46:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 08 Sep 2026 12:20:39 -0700, Eric Anderson wrote:
> This fixes a regression from v6.1 to v6.6 where Google Veyron devices
> (rk3288) would not power off after being shut down.
> 
> Prior to commit 4fec8a5a85c4 ("mfd: rk808: Convert to device managed
> resources"), pm_power_off was called by legacy_pm_power_off() which
> itself was registered using SYS_OFF_MODE_POWER_OFF. But in that commit
> the registration of rk808_power_off() moved to
> SYS_OFF_MODE_POWER_OFF_PREPARE. At the very least, the code should be
> consistent between SYS_OFF_MODE_POWER_OFF and SYS_OFF_MODE_RESTART; both
> should be *_PREPARE or both not.
> 
> [...]

Applied, thanks!

[1/1] mfd: rk8xx: Register poweroff handler in atomic phase
      commit: a9c8cbec9f5d209efb3d8811f7d46d7af39504d1

--
Lee Jones [李琼斯]

