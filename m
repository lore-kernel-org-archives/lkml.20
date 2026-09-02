Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC0D361954;
	Wed,  2 Sep 2026 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366098; cv=none; b=nu4e+HYl4T1CLJCD+A+fCj3hjGcrODm/m93yJ7ilaThSNCc4HzjNSb0eJ+v7G4yEoDFuagn3LEoBQxGW1w120b0cOouXQWVXpw2Bo+j0Wc09gipoJ7eE+fLEtgLHjmYb/nKz9aAfo/8r4PPm3sDfAMfFn+IiGyEs8AL8ERjMYYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366098; c=relaxed/simple;
	bh=Ed0CFCNzDXDzRmmEtD75gEaz/lxPcWfXzrw3M9tkxVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zy0cj9AeAR8OHc9TqCNUTxQEvK06/l4gUiA91g/H+YEggR9ir3o6WFypj2exDzhpioWXSRFU9irYxZ6LYak3YjRLAyDdmhkYJBp8JAqqjMSV+VOrpdxlCT/owxEvB2Dq/20vkJo1vQfwXwpolOct78ygGo0OcGIJU5IgOP3gvUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PXwlhsE6; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PXwlhsE6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6BE5B40E0301;
	Wed,  2 Sep 2026 16:21:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ut8g9CZcaq-P; Wed,  2 Sep 2026 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788366081; bh=wBubYF5UfCp//9GBfpKwPeGGZ2tvJSyge3a/ISnIc4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXwlhsE6Jbxk68QeVg7Q/Woc8uTJEmhQbpQiSoUFc4cQQltIdkjB0p0bTZ4rl9s96
	 GKaNKnxtwmKNHrlT8PwV32wFF1vl+ZKKI74Xmtrp8oTiSD9q1m7rCPylcg11FskLy/
	 vsFt58ThxKubJ6Bon6tfGK8JRjPs1C06MORXvZ9Nurn/BzHRnttNmsJw6WybMoSX9x
	 XFjRZ6TEG9+WdCPMM75oUw/SuhM82YLlkTza1N0FAlsf786GHpcej3p4fSBOX2B7t/
	 FyZQcidSUI6fFKKTdFWDpi5cGYg2fR2JU8/pseIhvij2QkN89bG/5h/h9tWHhbeLXG
	 8xsDq0jZWPEC3pjNCe7fUykIUl+jgQp1i5bpEAMufGnZrGWLoTkEIpSTvHH+tQuLhr
	 jClI3VdyE/aU7abWi4CgQNAA6xK49UbiRaESixbvRY1KWslCx0w7b47lIn3g4p+LMx
	 woq8/efH+gf2xZBtJ0kl0Wkxy9SkCDnvGu8DVref5v4cw8TUToUAuWhUZkciL73Frx
	 bUyg+Zn0qryOQydKya9oqwS8L4oCE1RIrXDksGQ8gUFCbetrbgTg0ENQlm/3/h4yBm
	 2qEY5k+k/KV29XqIjDT9wYM74GNrhpq5XB5yid6tVRIpOBuqpAb3+wcUaSV3UvHv7Y
	 wnw2NgFVtdi/tw2nUjEru+hc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4D17040E024B;
	Wed,  2 Sep 2026 16:21:14 +0000 (UTC)
Date: Wed, 2 Sep 2026 09:21:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] EDAC/versalnet: Fix error handling, teardown, and
 robustness
Message-ID: <20260902162111.GEaphM9-ifGFATXexm@fat_crate.local>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>

On Fri, Jul 24, 2026 at 10:49:36PM +0530, Shubhrajyoti Datta wrote:
>     This series addresses several correctness and robustness issues in
>     the VersalNet EDAC driver

Ok, for the next revision:

https://sashiko.dev/#/patchset/20260724171945.2812749-1-shubhrajyoti.datta%40amd.com

Please address all those issues reported by Sashiko. If valid, fix them, if
not, explain why they don't need to be fixed.

Put those fixes *first* in the set so that they can get backported to stable
kernels.

Code cleanup, improvements and new features go after them.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
