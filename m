Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297839;
	b=R6rmgCk+BYRv/Ty/mAM51IwNkALJ5KoScDaTnx8aDGAmLg9dH/2PtOO9EfwzmxA1oCAf
	 3+UT7UQNS23pyuS59N8P2APmi6pgrpjTjjlAhmAwruQfv28uVxhermp3MIkWfqqPa1+It
	 KCee2oUWou54PrAOx4fbbQ8NzR+JOO0nKVv9BdLOSmsQbcQxhLUBG07b24tsiJRzmKZd2
	 DvmEHzHQd4YqTLXWtAeCRH7hsTtAhADxFoWS/ASQ7nRZ3mDXVrVh+t7KUqXcAEvE/+9KX
	 OXG/0cDsagzTIE1PvW1dktrfJDkACo9qxSyyZ2TshOIbsWfGJbxjzHlyprlxQaU6pgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297839;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 Content-Transfer-Encoding;
	bh=cWkaqcIhFYIpLCbLanrnM8cudPC/KHyxk8f7sc7s2LM=;
	b=rj5LUdNU1aXd0TozzzMNo2inJvLyZKB7l0RuDfmstHUGWr4nkTHC382vmDErwGJY8cHf
	 QVF6DPdzbgA3wzTqHttiX7vPioi7FP8sJWVFg4imR7XVEFtax2O9QzTwLIiyokJP16RKt
	 oenPVmRrHpuvKrhJ7+kZ8FaairfLZhNRe34dkbNVlZemnBGv8m5FJWtxbDQXjwZge8+PK
	 +U+kMZsgJzHdirJ96EC4BsCv8nWmU8duJgYQrN9Z8Sxrv8Vuew1MCvyPVMlKJqISffo+v
	 CkeLFED/+30KzdPOCK9sZXjcKxTLaVqP045gjGxfazC5Z0AJXcFRvVrtXgFc+Lm1RsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=fail reason="signature verification failed" header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=euvrYU9r;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB9B606A334;
	Tue, 10 Nov 2026 08:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB9B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=euvrYU9r
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AE0E440E02A0;
	Tue, 10 Nov 2026 08:03:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UpLAbp1a6Z3E; Tue, 10 Nov 2026 08:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794297833; bh=ftLCm16ZGQDt5+x3FR5+nfOxh9iMk8bB3TsMH6M/D6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euvrYU9rM/tSGqaeaB23COh67FuHJ9wopiBh3ajKkrET8rfCvS0pSXJND501gwc5S
	 n5ehURhkzS1mPZunoB6+Q2J3UlyHS9+GUi21VYtf3U3I+5cakvV1aJbeNmvBumhpib
	 Y4liMH3c9lOmfJqufIjGiY9UA8nZ6MVrXg08tS6ioH9CRRq8/6+dbgrdnktJ1iHY6o
	 3BpQPlAwlg1GVV5IvHD7NWv1q+skZwdFoH8/teJblGBsF53YmdxWJ+FDol/QN0H6QC
	 HUmvBKmIOSYVifvUKBSgqFVYIV+Fj76LYSkgRuct1DY3lJEvrZf7OAAc5JzfTA5gCH
	 fD+W3ORZ0NWdOIsCwVUItqs3YW5vcAOY3SFudL35PKwsQJNiXVN+egJulo7x97MiL6
	 qLIh8eAhFQyjfCLpO3iBDrxQWGA/hlfUsxNeNDFSNTvENma2r48IeyViQmTohYB+f6
	 3ZeV6kyIF8BueUHGuumfgbOqPUp6mNmjixkWlGQjyDbBcySrADfCBn2MtvdOsUFTZc
	 UTKMY1sfkx7zrombtsIbmtvX8e0QUeUZQPA0UmAw5zR3hfI+TZJUZUiJrWdUNJeYC8
	 ZZbOqXjAxIH3arLDfIDNaun5gTSwir9tCPouNHh5wCYxgrM7ZtuMjTG3E7cQyUGfCL
	 G/UM5lHtQrjQqBoTRJ/T6DjY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2522B40E0299;
	Tue, 10 Nov 2026 08:03:41 +0000 (UTC)
Date: Tue, 10 Nov 2026 00:03:38 -0800
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: Qunqin Zhao <zhaoqunqin@163.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, chenhuacai@kernel.org,
	linux-kernel@vger.kernel.org, Wang Jinwei <wangjinwei@loongson.cn>,
	Yulong Wang <wangyulong@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v6 2/4] EDAC/loongson: Encode node and MC info into mc_idx
Message-ID: <20261110080338.GJavLP2h448voZSQRE@fat_crate.local>
References: <20261105025532.2055-1-zhaoqunqin@163.com>
 <20261105025532.2055-3-zhaoqunqin@163.com>
 <20261110064106.GAavK8ghva7DgZ35DK@fat_crate.local>
 <809041a2-ebdd-409d-a1f4-3ac7884513d2@loongson.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <809041a2-ebdd-409d-a1f4-3ac7884513d2@loongson.cn>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 03:47:20PM +0800, Qunqin Zhao wrote:
> "all your nodes belong to memory controller 0"
> I don't quite follow this sentence. There are four memory controllers o=
n LS3C6000/S.
>=20
> On firmware without mc-idx there can still be more than one=C2=A0=C2=A0=
memory controller

So edac_device_alloc_index() is used to give out indices for other EDAC
devices with edac_device_alloc_ctl_info() but I guess you could use that =
in
your driver until you don't need to add other devices besides MCs and the=
n
it'll become a mess...

Lemme ask the simplest question first: is there any case where ACPI won't
provide that _DSD property or you're in control of the firmware - not lik=
e on
x86 - and this case we're trying to fix is never going to happen anyway..=
.?

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
