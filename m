Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682030EF77
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788310648; cv=none; b=FQqtMlDb9bIwFR9NajKBDwk+lTkKO4IHe+cTM4z78NIVZ7sUMmOHH0b4kkk4XxcRBrgNI+AH1hl6nwtKowC3myKxIVWSnuZGIqjupgN6pDbdIV6zxeFdQudymtDUHBVRiFGxpGS2uyNY+ZAiS+NoQXs0RzJPeelj16AjTdY1FdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788310648; c=relaxed/simple;
	bh=dTqz1L4ZlEhKlo7cc53P+w9IO9JCijxCIAqnvXhylS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BShzjVQ9TgZLV9LIPweMP2IiJCq0vwT+xj5rYZN9wWf1+4MJqiIvxgZyYiF0U2+KSnBs8C/sGPAcJZMoEQU4yQWv1GzepyGhe4pOSAtmrS/qttQHQTja3AoU1lQ5477iAj+g4IHRCUfKEqvdbds6wxJl9/fWzNk9j9wflXTH+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cNFUcko+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cNFUcko+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0D53540E02C2;
	Wed,  2 Sep 2026 00:57:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vgTjn6a_m1My; Wed,  2 Sep 2026 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788310634; bh=tuSZ42fdcQSAOtyGa60c6RR0sC46bFilb52zi0Z56Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNFUcko+l3lZ/GKrCdsJwwhRRILrp5tWRdSvll7QFJTrGgxkk+Rnc0bup6kz7+l31
	 uimQ9vTjMWvjGRb2cvUVEjubRuC8kBp4Zc5q/CsBAMchnzWiR1iT9qzUBAJIAGLGRB
	 FDDu9AXGyG+v3YSeJPrSyeiepiV/UXJEvhi4tdDS4I+LmIX9Qsf0leFPXlqSYHeeUx
	 njc3Wp+LLiHh0l9/I0MpnKdH3d3726Kp58BeKmpZA1wDspa/X/TQPholtzsg6ddlED
	 vlCkOhiZNH2xkJ29zXXq8fRqyqlRNiTlHuKBjiIv8xTxuPc37gIeuLWsLW2ub8DxT3
	 Zd6Dvl+g2LIF/poP5Qc25Squtu75BEEv2xor3Ef7Yp9GmJgPTrC+Cl70/IL83QoGj6
	 9JqE0Y+IH+dVYUAzkktGg37daZ23Z1ukuv1s8xqRZ2zX2HyMx1hCpPUhRnTdhZ6IUo
	 Rpu/SjVxE4u3PDE+j1CSA3I+VaDr+SBjXeWKneTCwHBT6y0Mtmv92lCiGlRbFLGKoR
	 If57s5n4r9q3Puv+0wHyDI8R+SDeu0ARPJ0jgCu+UYdxEhJ7PZZyCGH2b/2pvTPMAG
	 MxX7YQuMpPmDwGwG/vfczUSM6MuWgRcTQII5pe3wsV2/GmrMZejSecMWKvwNfSQ2Og
	 m+ujYeiLDtNHR4Qa5KursyWw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 41E5A40E00B8;
	Wed,  2 Sep 2026 00:57:07 +0000 (UTC)
Date: Tue, 1 Sep 2026 17:57:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/coco: Replace cc_attr_flags with a bool
Message-ID: <20260902005703.GDapd0X8PevmcPPxBm@fat_crate.local>
References: <20260902000634.118808-2-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902000634.118808-2-blum@kernel.org>

On Wed, Sep 02, 2026 at 02:06:33AM +0200, Thorsten Blum wrote:
> The cc_attr_flags structure contains only the host_sev_snp bit. Replace
> the structure with a bool.

Nope, do some git archeology before you send patches.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
