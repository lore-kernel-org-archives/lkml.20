Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704C63FF1B7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517611; cv=none; b=N8pw52yrFLgAKoSJJd2Ls3WVob4lvhCOJHMV+HO6ltWC3nD48c0htwwgv6OnbpZFBmmAfggcHid7qu7lfeOJ4Cl5gSjiLCa4OINzhccXpllzpxwPFFyA8Nx3XdGakxORg2ROQdZBs/tn+w8dq/01Mw3Y99ZWoiJd2S9VL3xeHSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517611; c=relaxed/simple;
	bh=zXU+tYHOl/YHGHGbII3AHvP4lVS+bS8CAqVO6nFSJhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aV34tbgayMbElYpoPY7ctS7h4Fp4NI0rTcBfWGHVaRUe4bM/kSKIfoZ/kDuKPIhJlN5FfzC2QXuZdqSB0rlL2LzfkLCUWeeP+N+RC1XqPiWyIZEYHWTwHJ37gWbneyUZLbXLmeYZCAAFdr499Hi6UuZ8qn1b+zjwu49h7iIC9gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apYkh3iN; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apYkh3iN"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d797cfdd5fso491292eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790517608; x=1791122408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zXU+tYHOl/YHGHGbII3AHvP4lVS+bS8CAqVO6nFSJhA=;
        b=apYkh3iN+/RIGSioMpWjLsBsH+OZ5/iuJ2zz0uOGhjw/6ZYa1VExZTIkJ1WXFGTaWm
         xT8PdBQt6UuYT/XI6OUKY1fsxaX1E2RyKzCwDRCKRPuaJ4iete97p4UEbROKDjwa976X
         Pk8bagEd3Md6KYr0gDgIGHehGTzdoPL4vCpkTCup0YcZrXb/yPkz2zoJgKq9TVu53x6T
         cXdbPRRxCXDsh9F8P0NBSCmN1GtIGhp4JPOr0+Jw6TlsHT+2hgDZj7tLYwHJI88/v25x
         P2sfCR33IOiqSc5wI7o32TDyoywIqq6juM8EdgeY3jiyv3oUdV5RpinOjWquCUQgHcya
         Hdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517608; x=1791122408;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXU+tYHOl/YHGHGbII3AHvP4lVS+bS8CAqVO6nFSJhA=;
        b=SaDxRcBKJubQ2q3GyfZH6se5afIf3YE/+qznaCGKsk51JKJI53QgaoO3BLee0jJPLU
         +KpKV4kS7yGgRx0q6f3iHXKoFhxRpkrCkg7t61fqQhZPg10Zjn1i5dMlgsvubRaFl3Al
         1kRGrPqaX9R+5dqfl6nbt9qjJrxPQbBi1w6dHSCgoofdNo2UqupIeK3r5pl1r/ZgwZLp
         4CpYw8xe6hUGRJzKksqh7PvsPlCKlscs+G6QXlAW8eA/FSA60Cb2032LFb2Cl8C5CY+8
         MoIg2nfKdTEnqIP1y6prdbh97JjUX7ux/SIodbnCNkaptf8UB4XrD67xDEkxIT7Uigl1
         97bg==
X-Forwarded-Encrypted: i=1; AKwUvBwNRCpy9C8yYW7BScLODEvp0ksoKYHKTC9Gtfxkta9Bvv2M4nFx3imj6+/B6qUP/XBHFlooL7jvjKqRUvA=@vger.kernel.org
X-Gm-Message-State: AFuF++lQAEAr1pw5bCTYJoL84a0eLSYb/UQH4jQhg4YhAko5W0q8WZJU
	VORHpYE7Pxd0EwHji+0PqATGOkvssOoTJULnKizImm0zyZcIra8fkPsD
X-Gm-Gg: AYBFou3wIf7fOwgTBCGQoRlzW1iMcKa45NbitglYS9w1xroxROxj7e3gM6ZYSTP8rYm
	kgnfJpsRPk7vWBBJarkCDZLpbiNbOU+T+3BMe0rgorsujM4a/3LFlHzJvRdP23PGBiu3EdwsC8C
	MglYbDCE5Q9rViCDdMcm4ymMAMImB0uMuZqQQZzcZJ9TaQad0GGyHfRj2CnTrdZknpCO2IRr3h+
	ZBuicMSPiseLFfEIHheFiYC1X1DYFoQfbvasnZWvQxp8mijWRIKDGFiMfK0Si6WiXGPCcsI3ZSo
	/3b88UXx8f8FHDmWaJQodtfsiUgX5Y93agDDhHcv04Sl5KeUjtO9JUnmlYmUWwdjNU0HHZvhLeY
	c6KmNQ8Wwhg6MnGAWDk4RUmCLrEXPJ6i9RlrB4JRpwmcFhgyH+LhxUJfFY1b+5b/YjIP+Lwiyvr
	Av960cNEKw20ArDTS5jSfcQcIMyylSIFRolwJvo34JeLXWNxyJ6oGnKukBX28GGH+jjttJu17K4
	gRec7FmsSF5CzdSVZSKHj60v6RqOg2/ruzXcM90
X-Received: by 2002:a05:6820:1f05:b0:6bd:850:7634 with SMTP id 006d021491bc7-6d43f89b4e9mr11060817eaf.26.1790517608344;
        Sun, 27 Sep 2026 07:00:08 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d882dc49dbsm2210058eaf.9.2026.09.27.07.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:00:06 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: Danish Khateeb <danishkhateeb03@gmail.com>,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: Fix section mismatch with CONFIG_MODULES=n
Date: Sun, 27 Sep 2026 09:00:05 -0500
Message-ID: <20260927140005.28291-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <argClwhgQyMkeq29@monoceros>
References: <20260926163506.487201-1-danishkhateeb03@gmail.com> <argClwhgQyMkeq29@monoceros>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Uwe,

On Sat, Sep 26, 2026 at 07:40:03PM +0200, Uwe Kleine-König wrote:
> Isn't that a false positive because with CONFIG_MODULES=n .exit is
> discarded and so the section mismatch doesn't matter?

Yes, it's harmless at runtime, but modpost still warns on every
CONFIG_MODULES=n build with SERIAL_8250_PNP (e.g. kunit.py --alltests),
and the build fails with CONFIG_SECTION_MISMATCH_WARN_ONLY=n.

> I thought __init_or_module was the right annotation ...

It is, modpost just doesn't know that. Without it the two helpers stay in
memory after boot, 16 bytes each on x86_64. The alternative is teaching
modpost to skip exit -> init references in vmlinux when CONFIG_MODULES=n.

Thanks
Danish
