Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222E3B841F;
	Wed, 16 Sep 2026 01:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522765; cv=none; b=D0dW94m0H3qQqSrwL1DX8/HKAZLCncrn2PmbUj7LvtQ86CL9VB6VIeZg8nL4PAvTQJIEuqPB0VoWxOQWAjw3DqWgug6OAHpKN06HcjvXEigIVp6Z1Opd6GF9a/wS5QmsR3O+NnQMI0pnLzF+7h5nbRsX7Jy4cm2w986C7F9baus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522765; c=relaxed/simple;
	bh=/C170y5rW0RrZmD7rP12k8+Uz3daPnt4kT2oGNVAx48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOmvejZBmOeFb7Hv3pnPzE72KyJxlkV9dLZKNvq0NdFomWtRr2ApdPrZQ08hD7uWWVzsP0hz3lMrbwPwTSwli2kI5zvKwcmAtCrcK6jpaTHc0B88L3kzjscG0gq/P1WrezTmOhvWm8g1kzKOHfSJsxeJXjHfNrJAzm9U1tw2WQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PKED8iCv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PKED8iCv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8FF1F40E015D;
	Wed, 16 Sep 2026 01:39:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JzzIELwBECFg; Wed, 16 Sep 2026 01:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789522735; bh=p2oAlHCd/geuDdW1a+/n5HlGdYgs966WFk5qNTGC344=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKED8iCveVhId3TjoHtAsoH5W/WlK91NL8fWLOt6NSw0RYDQ2YryNVecG/X4SMNwK
	 GRc2EpmkaoFNpbEF48K0ARgI/F9nVOoQ9EQ8/sfVZ/1F7R+9l1b/THuol6JWuViJMQ
	 u5BDNZHJV14iJD2Vm7Q77V5brWx9E/YYCGAcw6V58bIWTV3CWByAZ1UZ2IqepjWyDs
	 dL2zQMtbacnfXGaU5262waR0AdwTMR5Stza0i2ja9pH1pV2QzZcgfSzykbUFtsl29P
	 9ZEJocH1bu70wu/HCWt+zJAO9u+zzlk8mDNQLLgWy38H8ieu3GueYbFQiUzM4sUVif
	 QXA0HpI9lgsEpHfIaXNWpI1heHoHZ/PlKBNy1jAHHmk3XFhKh+S1Zqj9vAzBbikBfb
	 ut4ga4hgF0D+3njJmTri4phfwtLEvsZIt9gR1kYrzFIJkgPz72pNaf3bGbxoqFLOXS
	 6q30u2DiYau6oAX+PMHp5DTS9cYaQCauX7A/jm01JrIV1dtd1XNtlqJ0lX3qfaclJQ
	 4H3xP9aflIXNoqldtT2YKfK4S3QUFNIX60DLPFzhdhW/kAGSCY44obVrJW43C4BPlB
	 3c/iFO1TSSpsT2w1ByYBUliDE/eS+QPIE7pVr0fx+NAV3nDnn313sOKGatY8biW5HX
	 iKkeoxm3dyZE9SnIbhG9YpMY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 24DAF40E015B;
	Wed, 16 Sep 2026 01:38:50 +0000 (UTC)
Date: Tue, 15 Sep 2026 18:38:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Arvind R." <arvino55@gmail.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/i82975x: Balance PCI ownership on probe and module
 exit
Message-ID: <20260916013846.GIaqnzJg9VuUaiH2JG@fat_crate.local>
References: <20260915013537.71211-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915013537.71211-1-mhun512@gmail.com>

On Mon, Sep 14, 2026 at 09:35:37PM -0400, Myeonghun Pak wrote:
> i82975x_init_one() leaves its PCI enable reference behind on failure
> and removal. Also, the fallback probe is never removed at module exit:
> i82975x_registered is initialized to one and never changed.
> 
> Balance PCI enablement and track successful fallback initialization so
> module exit removes controllers that are not bound to the PCI driver.
> Only remember a normally probed device after successful initialization,
> and release the saved device reference on both normal and fallback exit.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
> 
> Fixes: 420390f06a5a ("drivers/edac: new i82975x driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/edac/i82975x_edac.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Arvind R., lemme know if you'd like to have an entry in CREDITS.

And if so, you can suggest one.

Thx.

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Tue, 15 Sep 2026 18:27:46 -0700
Subject: [PATCH] MAINTAINERS: Orphan drivers/edac/i82975x_edac.c

The driver has only been "carried forward" without any recent
maintainership interest or testing. Orphan it.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..d0c02c08b670 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9472,9 +9472,8 @@ S:	Maintained
 F:	drivers/edac/i7core_edac.c
 
 EDAC-I82975X
-M:	"Arvind R." <arvino55@gmail.com>
 L:	linux-edac@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/edac/i82975x_edac.c
 
 EDAC-IE31200
-- 
2.53.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
