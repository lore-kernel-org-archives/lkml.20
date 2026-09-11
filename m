Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B347B31C56D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095807; cv=none; b=dOP8azip03CdyYpRcnXdERU2pM4EfdFS0AEG3SBlXRW7owOxVBtyIdwGRBrxBez7q4oygfHj3BOwGekeM6vxF+e6pfdPFGY3/wBJqBHOWFKmej4mrK9VpOGwvKp8ECK9wplKSz17A8wmrYL74FLcUJM6oH/J+yrS5sNvSqQBKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095807; c=relaxed/simple;
	bh=5LJbkVDbykiOq2iHjP9zfnCOcIqRPM7XgCaJJiNu6No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKHedsgmeng8wH6GfbeDMbuslpEBd8M5ViONlQfq9RtQK1ODXlA0GURUPMh4CfHPJx8HUDwEfozEgmI966ICitW/36cXeT7yX5llEtiwvrXs5yXOWPhL5fkVvkYBJbpA2fFiTilr4w8Rei2t7ukJlRH5hE0xjaNBIqM4BeVae98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Wv6DvfI8; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Wv6DvfI8"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5209540E00E8;
	Fri, 11 Sep 2026 03:03:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WsdxOwS_7oW5; Fri, 11 Sep 2026 03:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789095791; bh=djwpENlbBGeOAXbtKv8SDOZlrtvWRpXXPKkr0xJOSxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wv6DvfI82vKKBUrRO+Ib7sAATfniQVuGRAd+DVydX0hcCIaiqACh6dYkhHTw5HFVT
	 HtALgEDhMN3MJQ3pkMIEf8s7O8L/GIiFAf7hD7xzSg6/XNwWBzBvMAS+LqvtWQF9sk
	 bzslfldXrt5OfvbosddQXuduEbe8mM+6ig1zKZK0usoR7vtX1KhuHvn10XbXvLB2ho
	 Z0OORv37/yjdoSvKMOeIj6sibhJ1jzlEdGqBcW30AHPpKdaWwzfTdrbdHqCeWAG3NQ
	 wGEcznrPGX0AXuyw32FgznjVmgJs3o7AtHU+4PyFpHcE22oWX6Dapmn7ot1fuJuA3p
	 oHnzlvYtuPG8LgsiBrPw7BxuheH3nLKJTfnHXKCZ0nplhgsUrgaHz4PpkkjROFOFU0
	 H3BUE3zyVItGMFlEd1glohMwRjs52lGWynBBN94tUH6/g+FSj3MbtGh6R5EYHxs9BW
	 JpFWZGzILVpDi3YCYkiqcAliwaa4sFQcauXbf8wJgtD+aTllN2QJ7dq2NVutTHTQ53
	 RQaloufBv9TmUmfLCvremyNz18pVTvBU48WL7rryHMyKSIhsUr1Z9VRVyMpCRY01DN
	 4rM0PEjAfxICDmLffrGFz/uQy0tHKp6n+JBIDjCsKX8khccXs/aURz2k/nRVHtJ8S4
	 eRmtBqYClwW8TP8KzkO9JzKY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A2B1640E00B8;
	Fri, 11 Sep 2026 03:03:06 +0000 (UTC)
Date: Thu, 10 Sep 2026 20:03:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Serge Hallyn (AMD)" <sergeh@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/amd_node: Fix PCI device reference counting in
 amd_smn_init()
Message-ID: <20260911030303.GCaqNvZ3QRcCLSmzja@fat_crate.local>
References: <20260903154325.74343-1-yazen.ghannam@amd.com>
 <apnMZINAYLpwkcS2@shallyn-amd>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <apnMZINAYLpwkcS2@shallyn-amd>

On Thu, Sep 03, 2026 at 02:37:08PM -0500, Serge Hallyn (AMD) wrote:
> On Thu, Sep 03, 2026 at 10:43:25AM -0500, Yazen Ghannam wrote:
> > The local "root" pointer is a temporary variable used during the device
> > search. Therefore, refcount related to the search iterators should be
> > cleaned up after the search is complete.

Ontop of this:

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Thu, 10 Sep 2026 18:43:33 -0700
Subject: [PATCH] x86/topo: Initialize AMD nodes per package

Sashiko reports that

  If amd_num_nodes() evaluates to 0, kzalloc_objs(*amd_roots, 0) returns the
  truthy ZERO_SIZE_PTR (typically (void *)16).

  Because ZERO_SIZE_PTR is not NULL, the subsequent check for !amd_roots will
  fail to catch it, resulting in a divide-by-zero kernel panic on the very
  next line during the __init boot phase.

Make sure topology_amd_nodes_per_pkg() doesn't return 0 - the AMD nodes per
package count can be trivially 1 if detection fails just like the rest
of the max* and num* packages topology attributes.

Closes: https://sashiko.dev/#/patchset/20260903154325.74343-1-yazen.ghannam%40amd.com
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/topology_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/topology_common.c b/arch/x86/kernel/cpu/topology_common.c
index 6845e3c63fbb..7a7442981594 100644
--- a/arch/x86/kernel/cpu/topology_common.c
+++ b/arch/x86/kernel/cpu/topology_common.c
@@ -14,7 +14,7 @@
 struct x86_topology_system x86_topo_system __ro_after_init;
 EXPORT_SYMBOL_GPL(x86_topo_system);
 
-unsigned int __amd_nodes_per_pkg __ro_after_init;
+unsigned int __amd_nodes_per_pkg __ro_after_init = 1;
 EXPORT_SYMBOL_GPL(__amd_nodes_per_pkg);
 
 /* CPUs which are the primary SMT threads */
-- 
2.53.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
