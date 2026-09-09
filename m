Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4398C4AB1CC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994217; cv=none; b=mTbhkhXjOn2wov1lVS6/7t5tEAyYMD0mvvd3mqJ4Nifbn6Oc3zEwcuW0hFGnYoSbjF/FKKHDHm+5FPm0UARTADHZNSzq5jpf9uaiiS8USyDyrQ7Nf6smCvc1jS9AyeH4hrMhmyEHYh7Fj6uz3TM3UEvKSis8vUcigpDF/Gu2Iy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994217; c=relaxed/simple;
	bh=UP3QHC6RGFG+fVhkB/5cTUsoeWzERQyR8G80FcVE2gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oW4edKMVvhGdUNHcdfibQJK/rgpee0YxnwbVnI2s7f7t1LH3LLJZZV7CqWXDkE1iOwyYV4QmXvqxEJ2qF1ilZH1dK8Ew2Udo0iFEU9UA12Ps1W7WSUJjDj8DRiVm+5gGkJO1YywD5HSZ/lcHJ5xRsdAN11okX4yN/Wa4Z1Vo/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsbI9d24; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsbI9d24"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so1117921e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788994207; x=1789599007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mohJO1C3Ec3h1EifombDVZn/MyOz6OHkpyWV2XyP7xs=;
        b=lsbI9d24Sg2BVEDLrMfSi05P7AXTR1v+4nWzFLfy1DbitWqRK090o2ckxdHwPgwVAo
         1Q06XcRH3hzsrMLTBzn4Ny3FBYtyRYk2pzwxKbc+P/FeMHtf1gyc1/JZOZhZdakJ1dgq
         M78nJahdzQVvdntNAzRyIKDIFye5TazshJE7F2LGR1i2RgD7e6oYFHWBNaY2fA39MnMI
         bJat3FIC7+GqxfAAjUyw8la4JXxW8Bvurk3P7iSyUOll8470mYBBQtVmQsaOPlxnoj0/
         jU6BSqX5eimtnpk9THIsk+ju16gjdTcNOvFaKx0nLe+5b1mqfxuMpiHIO6Xsx8rhNWjS
         eoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994207; x=1789599007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mohJO1C3Ec3h1EifombDVZn/MyOz6OHkpyWV2XyP7xs=;
        b=NiiEx4fagDEiC02z9jDDyvgyEsdJke3SMbH0lHa16V/W21grlUCHPeeDYItSMlsWVF
         N/gVoxC3fRF2hzLpf0iLyFUawq0y9tCbmxVXbxvrpRWSo4+rlDqLqHtb5wCIcwQcHpv8
         3bnzcBVQWv2ypYxfNCC8Vdcna6T+LebsliU5/YU9KRFJYZQa6qWOHn+CBZomOmMGgcHn
         7+WGWLTAhY4Y/5v+BYI22RahKWQRljURp63rpJHbw9DaLTmqgsbo2kjJ/ZIGJMJQ7zdg
         oqP9P7vOdoH2OuImF7ZfsrPvcDi6PsqH4Rls5vmvKQpINidFuaUeEtDHsbFZIS28c3dp
         TzUA==
X-Forwarded-Encrypted: i=1; AKwUvBwegZs5upkHzO8FmxqmbtSxJHeMWYIRFBxVFIQuineZY3QRjRbES8NRnzX+qo3SHIKuvW0W5hIeiVCeasM=@vger.kernel.org
X-Gm-Message-State: AFuF++m79o7OBYvpE8FvQqRDjrNxDzmzbIwloW4NYls2aQtZ0ZnD3F/E
	TAreh8DAcCPQh4YCaeL85ZZOt6VrxjXMFViBHvSVAWAI6DORwoPrfiWS
X-Gm-Gg: AYBFou3wjSz0pfR04WZxR2T0MO8b6EwuSWF4zixmXJzSwO4TgfGwxFsw69CR78l3fNJ
	TIFpriSgEXCcLvBwlRhPALXEzwCCF7qAj7aX5nFcF9uMwTZevK0h+cgW0OZIIxI1r4+AurB67BP
	hYxIhBsRShgkrLUlpIS5bFBVPj40vjd95xVlH3sqRS2UNEn2bLN45jeuPD64PVf0qlrCa6OhRLe
	iXE418Iy0k+xbPyacCeXD1hg92Bxvh8HnsNitovC76PKNRyKkuxqWj7rdeIueLI/op0kmRB2iZ1
	sZ62uGw+qVvE+Uj/NSNJfOmumnzmXYN6dwMFQTsAdhecNBvmr8VDjpy+1cusyD5E7BVlUCY2u3S
	TS6G3Ovdbnb80Gb7nEsRE6PSb9kOObdKR8Tx1Y2Uxnvu+KLGVNIPyHs90UXDzEnoIJKvYSHz0eK
	VTSuGyAhHKqHxscyAab82Hyti7dREHhzmSoWExmCKq7WwXdurRfEjrKruh61PmcnDI22KzeTOjX
	fY2PgT4WLBv1A==
X-Received: by 2002:a05:6512:6183:b0:5aa:62df:cd0f with SMTP id 2adb3069b0e04-5b89a2eb2a1mr255403e87.2.1788994207240;
        Wed, 09 Sep 2026 15:50:07 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74c409155sm3717504e87.73.2026.09.09.15.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:50:05 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	jensenhuang@friendlyarm.com,
	diederik@cknow-tech.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY from the MDIO bus
Date: Thu, 10 Sep 2026 01:50:02 +0300
Message-ID: <20260909225002.976-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed Sep 9, 2026 at 10:33 PM CST, 安容 via B4 Relay wrote:
> Describe the reset on the MDIO bus instead. __mdiobus_register() asserts
> and releases the bus level reset-gpios before any device on the bus is
> registered, so the PHY responds whatever state the bootloader left it
> in.

Confirmed. And thanks for catching the deprecated properties I had
suggested - I had not read snps,dwmac.yaml, and dt-validate does not warn
on deprecated ones, so none of the checks I ran would have told me either.

I ran it both ways on a NanoPi R28S - same pin, same RTL8211F on mdio1 -
with two images that differ only in those nine lines of device tree. Both
are 6.18.44 with mainline U-Boot 2026.07 (generic-rk3528).

Reset in the PHY node, the way mainline describes it today:

  [    0.217516] mdio_bus stmmac-0: MDIO device at address 1 is missing.
  [   24.566496] rk_gmac-dwmac ffbe0000.ethernet eth0: cannot attach PHY

and the port stays down. Reset on the MDIO bus, as this patch does it:

  [   14.608938] rk_gmac-dwmac ffbe0000.ethernet eth0: PHY [stmmac-0:01] driver [RTL8211F Gigabit Ethernet] (irq=POLL)
  [   17.770103] rk_gmac-dwmac ffbe0000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx

So U-Boot 2026.07 does leave the pin asserted, the same as the 2025.10 I
first saw this on - the commit message holds for the current release too,
not just the one I happened to report it from.

The one thing I cannot confirm is the board in the subject: this is an
R28S, not a Zero2, which I do not have.

Tested-by: Andrey Korshunov <razor1702@gmail.com>

Andrey
