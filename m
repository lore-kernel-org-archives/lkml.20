Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F04D2EDA;
	Fri,  4 Sep 2026 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543407; cv=none; b=bxeu9hp1+018/LuatEWpsqC6jEAf+CnsvQLouFf+k7LXuu2Z3KyOr9N3S9N9J1zNAr4civ8hUwq0+x3TyWLcAbes7C4eO4c51wHhU73FWdEwAB0HJUeFOHOZFzhzNPEI+KjPmYGuinBWioMCgYNXiY3Q7efRLpACkIi5hq0oTU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543407; c=relaxed/simple;
	bh=LtPqv1/yvY6KKIOUaDEWiR5sC9h1b5X+oyNs/rOvIwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPf3krM7X/IyBsql9Hykr1kz7O5kQtqve1qu5FHI8Ocf82Ob/SrruUGOjxOPnwoVW9ktddxZlcd5fgOmXH+SgRbcaR3uHFJHw+5c6IdsUMEAjX4vCzAY/vxY/KMIM8eoBwZTcVaIqJ045whd3JbLnhJIGxDGDSxRVhQBCSYzBz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=SoziP6Hb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="SoziP6Hb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 819D340E02C2;
	Fri,  4 Sep 2026 17:36:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hQ3Yhrf6A5cH; Fri,  4 Sep 2026 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788543392; bh=4w+spAm0uWWwcup+mfvYNUXNY0jRbWl51yfDyG8aFs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoziP6HbLj77a89rc3xWyhElxy2OnAwmmK+WrgAWWIowVnwNSlV+oP46ADmBwVsnd
	 yCEKWpz3K2lWB1VolczTE64gpfHrdUl+el0VDrMnsndNuYGmChPaqu5L7dPxINIzzL
	 iuZWueIvng7XPakfJPeYd2tpu341BU0eVn5SZ68LFkA77z2dtsGXio5ZYkw2nev0ru
	 O88KY8ucs9tL1wuesqPVECx/dX6fjGRoToFiD4G2c+KIREQpyGnPLbM45xOSveEiWB
	 +hqfmycEwh+nAegtmwmlXbH0fl+TGhVOFpCJEBL7Hp97ebjtjWm2jkymey1VarA2ow
	 i6smdbjmsWdEUQiFTqdG79gR7dIlPU3Mdq7MT+ezbk2uvqIn/sTIEFzXqATPY9DPYa
	 A8BI9unS0kprXvhhQvDdqQtmNjAVvcJHZu7kysAaHn9voLOft+hpxCZpSa4/xbGHxO
	 ap7SZ+gPS6kEVc3rHPlDaLlIf0NQMfKT8BJc/gVy7CmNZmIVTuHbGfGvoSYPSaWW6H
	 8nK5X0IEYhHpMIw7Vy6ac0333i/LIuDFycDtPorkXY+qT9Bp7AWrgT845p8BAwGSEe
	 MSD4u2dXsebxSD2hcn79dCdxNSKCLKIl7j3asJDV7TP6vbLFgNg34+dhJuHygbiROH
	 s0rJNoKjpmdhxq2T36DCqYGk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4DD0440E024B;
	Fri,  4 Sep 2026 17:36:18 +0000 (UTC)
Date: Fri, 4 Sep 2026 10:36:15 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Ben Horgan <ben.horgan@arm.com>, x86@kernel.org, james.morse@arm.com,
	fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
Message-ID: <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>

On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
> Lemme have a look.

Sashiko has comments:

https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com

Please address them: if valid, fix them, if not, explain why they don't need
to be fixed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
