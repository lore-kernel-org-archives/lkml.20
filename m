Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717D416CF4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854170; cv=pass; b=LLsohfxjbazcCHPTNryTyBgu7w2spAGaLLI7UQPh9fb9WhymhOqF86WU/gOvEgXanH9CYP4869rjN4AiswRXSjgUDt8L4U4KA+7nFBvoFIjP1J6CJhBDU6GrdAY9+4roshl4Z1Um6jRfcy3sGCguW0RTr86ccZhqRXrTmlEgd5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854170; c=relaxed/simple;
	bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIi39r7Lx2NxMsuX5nRse5a8L6rEgBHm9c3v9v54wwLnUN9V+l+92S8ocjvswEITPsLcZvLAGbjBltKHrzsMVeU9kXtDqbrbI6gV+SeQB9dl06/VpmoUano8f8nCsAxdTM98vXbyfN59pKkDSYIjVCQ9lz3vZnZCilrOUkCwrT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiZevoJA; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiZevoJA"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c711b7f2aso402808d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787854167; cv=none;
        d=google.com; s=arc-20260327;
        b=ES1tEuo1PNqjizdMwgRJouvqWJ008PAbECxVoDP/QprJ6d3ZoW6R0Ab9HP/E4mmrXc
         P+7A8SPstPn5UqlyNQAffqjNrdhdZSY1n9HR5jnzOdavHE7Z00YD9GYeobZ6HQSjgzA8
         uw+EwWesvbrwh+S0LbV235nWbcpEHnGoesrTRHre28VdaMd/Fbtz/a0bB4CWwVevhyRc
         auymm8ChIE0r8019vpsfl3e2lrAj3EDEv+Zw1MhGraVfmo3MrDQ1lDobm7JebPEvor62
         3ZaXNfdJU2YPiBhmdOr3kYcsSiUXam6sHVTh2Rj5vspBxZ/36wu7cmluClDEZefsynHu
         Xv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        fh=G1wPYzgT8rAJGCm1uPOaseI6PrWmXQT2TwPffiHER9I=;
        b=hk/30ixl3tjtVnm+eCZqwiLLn7WapfUSyCLHRIDo+d1qHD82yxQx1YkJRHaeWU7ylX
         cVu/Gm3N6IG1q4uNbUSAYkj0xz23S7mg9U9SZUpk0Grwby7HCtHq6+8S3YLOLPGRR/c0
         Wei16mxanXJK4xEBQtDnBUYYSeF86xNdvMKA0ODIQ8zOF6LqOMnasgWi2lrDt++9FI1B
         OSnluOB5CBu5C1s2psw60PcPVzSb7xI06r6dPvxeKqg6zSL4ovbCTS/T/CTJkmoTF6Nn
         S42NKJBEftmwSCpY6NPtBInOubEc9mDuaWtsSAR9sRg7d7iMvyH3wd5Lao63kaUuzgI+
         11AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854167; x=1788458967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        b=GiZevoJAMWstBxyG3vW89tA5yzV7K52s+cOLWm2BTHyolHfkXCYHPMBpACCDgZV+5Y
         WHN543CexEyfQug1l7LFgM/HOQK+cahJHJ6kC58Cd6IQffeKiXTNhWtgMNyPgJ6b9U1n
         UEcdLuzjyixYSb3JRMgiNuZRwca3n0GxEg/ESaqaKWq1t6k6k3pmdgZFHXjr4LcN9Aru
         n9ayG7NvDh8vzJVVH+zTETz4CsLd8X04hwHo9Bf0sGQR6N4R178rjmYkBJwrF9VR7Psf
         w9U9b2sRKU2nO/FAANAF+iiwiMh2RViyeQutoZZIPsa/ogc/KZFQKA1hlMkqjE5R8BBq
         BGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854167; x=1788458967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        b=KMd605/zr0hSH85aj8xVn/N8IySFfFU5b8wHiWWLgC/9TvAO6v5Rpyh3WLPmCK5APT
         CRR8EkxR6ROfZdeN8GosrMNVMdV5XZ4He8YAqlcvkc3Du/cskbodWgVSBTxxUcaQpnuP
         C2DB69bS4FNwKaxI/J5/pCoQKZHpjrSixstCcZX3mGZV1L3kq6Ej4U2idzVRin4CSZ27
         7LeXz9XN5o6ziH6LALUfojj8l+0fvtui/wOjmwPtzjo5wc6LqTKEPZdknLoLbPRL8Ln+
         cSJ+Je17k1tgSUePiSjUMcSek1P1m3FyrqbFKHw4pD+g9CPuX52bUOxzIbmiW7Ufqozo
         +3OQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6tJNbhl1FcQM1qP7tkFV9Gtn9x4PFjaRUo53Lt7n3Y+EpsUiLt5pEfO9Dp9vHMXCJ9ZF6XOH/GNAWoWM=@vger.kernel.org
X-Gm-Message-State: AFuF++lDKJnxWvC5sPoRCnMqHQs05k9AQomL1UO7WJlAKY9c00QAEhuW
	IXZ2xT57mNdq9vEbXw8B4M5c890+P316ykrrLIjN4qGIanihCBBh2GtAHfaqnMVQv6gAszmgaXD
	6wRMjAx5DmBmyRII/Cs1kruV/TXSCkWc=
X-Gm-Gg: AR+sD11PJwtRJIPb/Xtf9IbPrrmygCxtQihq3rlIIFgGNSeyp2u5evG3IIi/Zie5FO/
	Ddm6672+s46bdtJMleBq0GZpI/iAx5F4j4Es3AT5NMAJf/zywW30KMbrLB1vnBCBt9wDDAUpMXC
	8zdAP0Z41abbp7wAcGX6pjS7vBUk//dw9JzuPBTWm9wvCrcjDmL9ijtvhcqmIq/BNehXjPhCJLA
	puCV142lV/k0mVAU7bN4NAtmGHD5UxvP7JXHjUuiwrwV1X9WA2I32k6iMhEqnNOlOE1B274+qjt
	6sMzKTIm6yZuCjtOpjYTHT5qFQgUXVmk8Iqbak464xl0X6kkRnoXoMDeXqZ57cL8GnprEROM3bY
	zpe6wiMPa4E1QiXQukytUSqTV+A==
X-Received: by 2002:a05:690e:2052:b0:66d:1877:121b with SMTP id
 956f58d0204a3-66e4c6d6f17mr41588d50.32.1787854167499; Thu, 27 Aug 2026
 11:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827171937.28878-1-gvalkov@gmail.com> <20260827171937.28878-3-gvalkov@gmail.com>
 <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it> <CADOrJmae24XCgxFwtHssdoWc4rv1Q743hfgjG=kUrVPgf6urmw@mail.gmail.com>
 <A7FBAD8C-3AAD-4268-9BBC-3BDE071481E1@dolcini.it>
In-Reply-To: <A7FBAD8C-3AAD-4268-9BBC-3BDE071481E1@dolcini.it>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 21:09:13 +0300
X-Gm-Features: AcwNN1WeeO0QLErFPaTPUKzS5E98_pxOjOnXU5-Tw2FaecGW6bryCcX8wHHKvEI
Message-ID: <CADOrJmZ8u8Gj0dA=CqzUwxM32uN5ZOJ_GdaXJNi1ttYpp4FvrA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
To: Francesco Dolcini <francesco@dolcini.it>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 21:05, Francesco Dolcini <francesco@dolcini.it> wrote:
>
>
>
> On 27 August 2026 20:02:27 CEST, George Valkov <gvalkov@gmail.com> wrote:
> >On Thu, 27 Aug 2026 at 20:40, Francesco Dolcini <francesco@dolcini.it> wrote:
> >>
> >>
> >>
> >> On 27 August 2026 19:19:37 CEST, Georgi Valkov <gvalkov@gmail.com> wrote:
> >> >WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >> >from the mwifiex ROM, which conflicts with the platform regulatory
> >> >configuration on units sold outside the US market. For example:
> >> >- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >> >- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >> >- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >> >
> >> >When the system boots, it detects a conflict between the user selected
> >> >region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >> >preventing phy0 from starting on any DFS channel. phy2 works.
> >> >
> >> >Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
> >> >WRT3200ACM device-tree, which signals mwifiex that its regulatory
> >> >hint from ROM conflicts with the platform and should be ignored, so the
> >> >platform regulatory domain can be used. This does not allow the user to
> >> >change the regulatory config of any radio. It only allows phy0 to start
> >> >and operate according to its certified configuration. All radios in
> >> >WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
> >> >they are certified.
> >> >
> >> >On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
> >> >partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU
> >> >
> >> >The Linux kernel sources do not have support for WRT32x. An equivalent
> >> >patch for these routers has to be sent to OpenWrt.
> >> >
> >> >[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >> >[2] https://github.com/openwrt/openwrt/issues/9956
> >> >
> >> >Cc: stable@vger.kernel.org
> >>
> >> This whole series is not material for stable. Please drop thia tag from all the patches.
> >
> >Dropped CC: stable from all patches, and sent v9:
> >https://lore.kernel.org/linux-wireless/20260827175850.89395-1-gvalkov@gmail.com/T/#t
>
> Please, you are not supposed to send a new patch series revision every time you get a single comment and you did send the previous version just 2 hours ago.
>
> It does not work like that, you just create additional overhead.
>
> I assume this is all documented, please look into the Documentation directory.

ok, I will make sure to wait for a few days in the future. I apologise!

Georgi Valkov
