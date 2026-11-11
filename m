Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384537;
	b=aIe8VJhgz0y6eKTvS91/HZdDkl9yg8o2V2F/ga47Knxoni9+STRjYi3jhubSN2QEb0oQ
	 EsGZ6vKvK2eHmEMRoIEgskfoJp9xMJ/oszFjknKPmEmKb2eJcDpI3/8OrUafnD3HK4Ahf
	 y4fAOfQy3Ehy2QYCjsGVu5pFrSO3GIfKWktVBdN6gQUtcxUusAKjEZ2YG4Fdwc8eWPnJ0
	 kPaaK2dfjyo2O6vpgRGwFjQnP9Fex2aiH+4Z1zTcIO4poS8DQ4uwoiuPZXOLd61g3HduF
	 2HUZADBxIQdlT1vrSYXkEnktsXK5lJ+5mfUeEOLNzWOhZzLY+kUqUJm8m/16UiuM6lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384537;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wpZdVY25wsrCZApW0yf6gO7yY7xmXeCz6y7CmXn12PQ=;
	b=qaLEhXpu+ax6VokAB36dEcIdmLsnWOuaXfMwk7vWdLU5gx+f0/Z3HVK50pqUX8v9T4Xn
	 8yX/H0vAbJU7x3i/qNq7uZ69aKSKtaMX50MWOatU7rvKwBNuGUP2nyiYKxXefhHMgEDB2
	 l4TmCEBpZj39AV0mXxIXZutJ/+j3OAK6WYHcu5zTnPG483/GNSJexEmllf0ycvyGs6PMg
	 GYxppJO7GmSzo0OrGHVIKaVvZVvVGqFFEcMdVpK/pIP0N3M4597Q0ycUpihCEXyu42cA6
	 eBz0Sl79RPWWcZ3vC93wFqujBU5UNZlNLJSzy+0L8xj74+Mo2GSwy+PNqOuWUAAMyXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Do5x542I;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522ED606A31C;
	Wed, 11 Nov 2026 08:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 522ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Do5x542I
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AB9AF40E0222;
	Wed, 11 Nov 2026 08:08:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8RP1td2kJ9xt; Wed, 11 Nov 2026 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794384524; bh=wpZdVY25wsrCZApW0yf6gO7yY7xmXeCz6y7CmXn12PQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Do5x542IDH/ocjyv0KOMrkXRIc03t7HeHaE/462hqK6dLj2rRT29Wydkx2cFyV+96
	 NZnEDO+Fh8TBp8jZ5mLX/yScZycqLlsTfhPcJddbP6Xmxir/KgE9Mkrvp0fPdTEE6n
	 4y+3RskristbQuf3/ejXvvITMIJ9q9UfNIWJkOFzEg95ZcQWYYmSsW4JzlbBSuSDHu
	 noitXRpx9zPdK8eQb1gnv06HU9+s8iSOh6+KNWb4hyX2wJ0QW6F7IYPmhaVTSB01JW
	 LqBkoHNlM2Byt/lYt39IEnRZSFcaoGySFRGDhn1tyTxmtEYHfsMU3p1dRIBxBCT+KN
	 fu36pI/lRf0KoDqnIf2uAtVvdgA5Dv1zHgDne1NysxgW9EdyWaFRaVQ4NdLO7ctR/H
	 WnvHDooYWVtGwNR9srRr9B0ehHXggeAbFrmFbG1ugN/a9/zPHyxsaoU225i/OsNJIR
	 xM35D8ORus4gMu8MlfdaCO6PCHenQeJlyIoDFZ59vY9us3vpba+hd4gIZ+weYO2tEE
	 uLhPZf0GABmVzg+agKxhS3rQUYeOG3NrRR1O4IcI9qmCGD6RBTsBHz5BY2SlIJBGWL
	 wtBZVbsED54Q4ezfjowiP8/Ba6A2wvJIg9m5gkBNEzdHlS7RMYkBvZTPxFBcfJKHLd
	 UooVArDcSIU8zhFmTkwlHrC0=
Received: from ehlo.thunderbird.net (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 09E4D40E019C;
	Wed, 11 Nov 2026 08:08:32 +0000 (UTC)
Date: Wed, 11 Nov 2026 08:08:26 +0000
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
CC: Qunqin Zhao <zhaoqunqin@163.com>, tony.luck@intel.com,
 linux-edac@vger.kernel.org, chenhuacai@kernel.org,
 linux-kernel@vger.kernel.org, Wang Jinwei <wangjinwei@loongson.cn>,
 Yulong Wang <wangyulong@loongson.cn>, Dongyan Qian <qiandongyan@loongson.cn>,
 Chao Li <lichao@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v6 2/4] EDAC/loongson: Encode node and MC info into mc_idx
User-Agent: K-9 Mail for Android
In-Reply-To: <f34b681b-1499-43c8-b8a7-1437409bd709@loongson.cn>
References: <20261105025532.2055-1-zhaoqunqin@163.com> <20261105025532.2055-3-zhaoqunqin@163.com> <20261110064106.GAavK8ghva7DgZ35DK@fat_crate.local> <809041a2-ebdd-409d-a1f4-3ac7884513d2@loongson.cn> <20261110080338.GJavLP2h448voZSQRE@fat_crate.local> <61dc34e7-e872-42cb-a0b1-be100a78053a@loongson.cn> <20261110183101.GEavNi5Qrv3eLe80VL@fat_crate.local> <f34b681b-1499-43c8-b8a7-1437409bd709@loongson.cn>
Message-ID: <88040256-91E2-4EAD-9571-4B460E69A93F@alien8.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 11, 2026 6:37:39 AM UTC, Qunqin Zhao <zhaoqunqin@loongson=2Ecn>=
 wrote:
>If we encode the presence of the _DSD property into mc_idx,=C2=A0
>
>the sysfs representation will become confusing=2E For example:
>
>loongson@loongson:~$ ls /sys/devices/system/edac/mc/
>mc65536=C2=A0 power=C2=A0 subsystem=C2=A0 uevent
>^^^^^^

Does it really matter which wrong numbers you have there? They are wrong n=
o matter which ones you choose=2E=20

--=20
Small device=2E Typos and formatting crap
