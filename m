Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0424C493643;
	Thu, 10 Sep 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055389; cv=none; b=ryohVVi3tamVhVXnIvy6+hyilmZG9mhFAUF24mpvYslwLgoFWUVbVn0f59zM2ODSH7bRIpnaGfdUXwN/GUNitBYwBFkEMU9wZzbkptvQ3XEsijBZ8wpbqrSwcT0zKLe8HjW/+/MVuKoPi1an1+CodjsKhrtzLqebIszeELiEg9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055389; c=relaxed/simple;
	bh=2ZJV61MxW/b2N/TjbnZdElhVi0YSZoEmiBUFbVPZXxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeEAMZ7pcc4Q+/c+rBiRIF1ZX4ajCs0zP/uBr2PmSMwrKmjWxtB1TL1hLf3FfDGQ25MCpoUmE0cA0OZk7tx+UOXEy1GHtWtPYRGF2CF3NPa7Evv30+kkqYslYhOQDtM5hoAeRl8t5oEoKHUbPzrQrKFpA8p1+vnCRD7mAiVNXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IOGXo8L7 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IOGXo8L7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 640D240E01ED;
	Thu, 10 Sep 2026 15:49:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7x49I5VG2Gp8; Thu, 10 Sep 2026 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789055374; bh=z3puwqS6uxK51Mf2WCvIxCQ6DNrEgvEdkCAPBqD/T+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOGXo8L797wNHAT1V1b9y2sk89MYp//ukmHj0UT68MZ0jSVW9chWVJbs7VL3vjFmC
	 4p57K5ykHcgPPTyXcuEJcOHppFEzwAEtK8Nu1zo7DKJpsKegq/NYGnlUCNCZQp60hU
	 1hpGLBRKZ5OrY5zIHATpi3M6SZvzAOjtftZ4zDJ0OijWGVfjwFZ87raMP9KGuIfnnu
	 D6z2CuT+8hjaI5oVSUnLuHQKOGCH82y2fCVyPTl+swBa2fbChb9I+WOLKZK9XRP+Vs
	 svPidZcj2EPqTEU1SkvxzNbchkO+p9aznpM63Dbah/wfpHgBje/nIyb8qHrIOgzgdW
	 9JUeui5JwO2JKSe0XQWfQiYxaOJr02Ek/ONra9W/mhblXB+v2H/LqS19UhKCZtqF+a
	 zW0S65RnLLGabytFs21i3hF4hergX3KUP5Hq82s6dB+WfXNuCwTKUi86xcttbYz4RT
	 AgbajfowEHujopqIdMldvgMgy6FYP+POfofJD2eiecXTj7nXQC3FhIAhHbTxkkqvwc
	 InM//SqiLHU8tLr6B7m1L7/3zixtauTUnf7QcU3HfTV/FCzshANbakcHpHpGX0I60j
	 DYZDs5/tLbX6ykI1BPVyCFqEa/1DOPn/fJSs6hukv6YgcZ5Hj6Xu/51ulwWR8NvKty
	 IMqTt29sXsI+1FRSMtcKQlSM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A2ADA40E00B9;
	Thu, 10 Sep 2026 15:49:29 +0000 (UTC)
Date: Thu, 10 Sep 2026 08:49:26 -0700
From: Borislav Petkov <bp@alien8.de>
To: Qiuxu Zhuo <qzhuo@nvidia.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] MAINTAINERS: Update my email address
Message-ID: <20260910154926.GDaqLRhmFs76RBX4jm@fat_crate.local>
References: <20260909151531.69074-1-qzhuo@nvidia.com>
 <20260909175003.GBaqGcS96zIUbWmIJ0@fat_crate.local>
 <CY8PR12MB7290F0B20CB72D255AD77C35D1BF2@CY8PR12MB7290.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY8PR12MB7290F0B20CB72D255AD77C35D1BF2@CY8PR12MB7290.namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 04:47:05AM +0000, Qiuxu Zhuo wrote:
> It looks like our mail server rewrote the From as =E2=80=9CLeo Zhuo=E2=80=
=9D (internally set
> for preferred name) when running git send-email.

You can always use another mail - not corp mail - and do

From: Qiuxu Zhuo (nVidia) <qzhuo@....>

for proper attribution and less hassle with corporate mail insanity. More=
 and
more people are starting to do that and I'm not even surprised...
=20
> Do I need to resend the patch to ensure that shows with =E2=80=9CFrom: =
Qiuxu Zhuo=E2=80=9D?

Nah, I'll fix it up.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
