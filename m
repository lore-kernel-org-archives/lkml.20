Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854426;
	b=fQESLP4aUqeyrU9UA8DElujX/8SJjOKXP2Xl/wtKL7E/pfAgcpKCJU4Nev27KiqlZTOD
	 3OpUGMj57H74M+pui4WpwjzTwkDUmBQ1S+hW6oOUsVL3bb129rG72xWU3O0KKPhJCAHnF
	 tQT/JIL2zeqXjE3ob2SZyQN+86PGRILk7q7uIPKmGg3onSnble0FRLJyn8kG73441g2Bz
	 JybC3CwyX8SicONRm0RVTT5zGTMMM4xP2boICGsdj2Kwaq5zaOxIYYx+ZaHIk1C81LtPq
	 lZDuH82eElPHgIUPlpagYFvq+QyLN5c/ILAe+sGq72HGusQL7xRtOY7+VCNT3Did/4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854426;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 Content-Transfer-Encoding;
	bh=ZDNxzWK7YpZlxTsXfg5V1qkMa52zlYAF5ggUQoqT++c=;
	b=5M3xkPVBb9vYQpM51gQNkin10UBQZpgBgjaIaWmSIQFcRO2uYusTGeHOrUoSgsJFLnzm
	 rcjbi9SEX1SVSKAmBY4d3OBwcaU4Z08leSAksF+N9Ly+WXVeSOLL9ymQaA/bu9WdeSLhc
	 u6hz0vBL/dtyS96jZska9g0BKuHnnbz0WD7MibYQmwHXjmGEnXMCWtpylcp/eGAa2o0w4
	 1ns4y860ZBfuA3HxNQSYAjlMjGt5D0era2eBy883Wsps60TFddzlvNwpaBJHLy52qMDiG
	 J6vs0PoYrmf3f3NnTclYS/Ob0BlJIstViaMaSXinZiUOyS8mu7g4MDdd5hEHLkY6oFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=fail reason="signature verification failed" header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ZAa4Q1Y8;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B02606A32D;
	Thu,  5 Nov 2026 04:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B02606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ZAa4Q1Y8
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 292CF40E0184;
	Thu,  5 Nov 2026 04:53:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3_rAxhbUVBXB; Thu,  5 Nov 2026 04:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793854419; bh=nrGcHTqOtpGTvsPDx/bmdCPRbhy65nSxqLA3PtWK+ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAa4Q1Y8uQOXS99gQyK/P+nRvFObN5CmOSyDOcaLr6q1SB8IU/8HE3M6sZ4VuZJ4B
	 73VVrzRHKqbpbY/X431R7SgZQedtdjQZwk/3UftOatv7Uofdon0kp8b+Rhh/U1yGVB
	 EEvngoxgPANcXZByYcr53QyfmdgVxO9RNVaWYB6Q4EotX1ROx5/CoQSjixD12k9WYn
	 mCWXFSGsv/cUAWZ9MeprBYbaAwEI5TEDJFw9POJxJGEKJzwwf996qYNsc0hTwnMvE4
	 ru72pCqArlOUIBNN5kzpH/0sNMYnqzf9JTX/C6e6GkVWACV9HwvFVj6gp+6bPjOnYW
	 mJlsoc6ajm9xpZinAyjjNE5Hi/ym02fvHms3yU1WDzJhJmh7gxYjQpwbVr1qqocNiD
	 SKARca8kHjOBQkVdoyrMW0mEx6sOPk09mvZkVd7oiVTP1RNQQN/XLV8ezEZCZDqECq
	 m4XujHyiwZ71dCL75nSJenlHOlMZIGj7zVWyprgk/ZzP4XzfovI0RunDXuvbGOEJKe
	 1g80Wn7noaqHuR/UeifpTFad0i1om4GoxFdsKlxWhPHrzR967Q9oebORecZvBu7VCa
	 JbzJet6ww2paUI8ZSqg1IznlG1sk1Lw2eR7zoaoJNoaZrJj1kOsgFWjLqd3FHoWj2f
	 6pD0KqNRAexvx6Gz9rCr2VLA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 52B6C40E0140;
	Thu,  5 Nov 2026 04:53:24 +0000 (UTC)
Date: Wed, 4 Nov 2026 20:53:21 -0800
From: Borislav Petkov <bp@alien8.de>
To: Santino Wang =?utf-8?B?KOeOi+S/iuWCkSk=?= <Santino.Wang@mediatek.com>
Cc: "jonathan.cameron@oss.qualcomm.com" <jonathan.cameron@oss.qualcomm.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	Sidney Chang =?utf-8?B?KOW8teWxpeW5syk=?= <Sidney.Chang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fred-WY Chen =?utf-8?B?KOmZs+WogeWuhyk=?= <Fred-WY.Chen@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Light Chen =?utf-8?B?KOmZs+aYseWFiSk=?= <Light.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	Arnab Layek <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
 <20261102123642.000044cf@oss.qualcomm.com>
 <20261102124434.00007741@oss.qualcomm.com>
 <78ce4a6ef441cb9836466e9ae5e72ffe21a88242.camel@mediatek.com>
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
In-Reply-To: <78ce4a6ef441cb9836466e9ae5e72ffe21a88242.camel@mediatek.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2026 at 04:19:27AM +0000, Santino Wang (=E7=8E=8B=E4=BF=8A=
=E5=82=91) wrote:
> Which existing interfaces would you recommend for obtaining retirement
> status from each memory owner? With that information available, can ite=
ms
> 5=E2=80=937 be maintained in userspace, or would they require support f=
rom an MTK
> driver?

mm/memory-failure.c

Look how the others use it.

What you write above sounds like you need an EDAC driver which collects a=
nd
reports errors. Look at examples in drivers/edac/ and there's some
documentation in Documentation/edac/. Perhaps ask AI too.

If the stuff you need is not there, you can extend the existing interface=
s by
justifying the extensions properly.

But what you have - a completely separate RAS implementation, homegrown
somewhere else in the kernel doesn't fly. I'm actually wondering how you =
even
managed to do this driver without *finding* all the RAS/EDAC glue we have=
 in
the kernel. Googling for it would've told you that there's something...

HTH.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
