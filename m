Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7163E0230;
	Wed, 16 Sep 2026 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586947; cv=none; b=ribK3YuKCTNsUdoj7IWi5NS1R4gqS2K/fNjlYGV0ufHX3nDW9BMjm8lgJ0dlXqRyMV5JXoeCnx8BlCJKFKimCMNx7Yk5/K+gKMr37fgZO4alwf/2Otk9jiFrIk/eRveq9CBF8Uv39eB1vCg6VtzcOanbLXGw7AD6Y3xwX+1P04U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586947; c=relaxed/simple;
	bh=Rvm4kuWIee8TUQ7WHYtEtph8kaRUeq8EL/vvvMFGHfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5WAZLivxv1LJqrIUkKMrXaZA+xLwuOTwn5O0/jxyDFwwVyCH1KFY7dxE/86qawLr7MwakJRqdLoP7yqbtCsr7TeEAaJCvoJNVZEgiC523c7PvV1Fc8Ywjl00zYUL4flkzC7ItZr+6XxQtxu+Rsd871coMvnfpiEK9dtZwu1lNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Gi4iIi8L; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Gi4iIi8L"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AB50840E01F9;
	Wed, 16 Sep 2026 19:28:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RhgzBEKDWtdK; Wed, 16 Sep 2026 19:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789586901; bh=hwBW84kZxbRA0T04p7smk+ELZIG0QNBg1OjrErXZzDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gi4iIi8LCC++zRIknxnovnaz9qj6l/6qi5UGO9CihBiIE1GjIMmLoJ5B4aGKSs+aK
	 HYuHUqR+UBhPOpjnm9itiUnnhU/oiUr1IVBTqjtNtFLoyHoNyYKuZyF+G4eTeQoDvm
	 zDkH7iNQMPa0PUWM5iPle3Ok0kSSWOs63+wE3OA/RQibnurn6ZEEF9MLzIY1ohN9gM
	 w9PQ7SfMytBiTnEKGIZTFarI4LRKbppvuxd2+HruFFej10faNCccZHS/GUehgS/FZf
	 6r0tSXbu5H84qjDU4O18iWccOPV6ILrbp6xroiQEn3m5oeFo//4tNbQCzjjejj3R6K
	 GbNkRHspOBVTcbafPNYUCIP8/WiMt4Z31vnMaYw0Htz0rSqpFXj4ZNbbyducQ7XUE2
	 8T3OBmZkwWvbLi0/dlKbhRfhKlnqgPZM7MsHqRTMMERvTGRUiOriiyPWEfr4A5UTvg
	 9+P+CUAY6/uf987wXtzIhz4VmEpAA0FxNr9puvJi2X6IaUbZ4HL2a/nWvg0ztryFOS
	 08RxsWXCYnX86ALv3OE6SfCVzAOrzLaTUsNleA+7rn/JfKcYPq1Rf0vF+23e9VhaEV
	 OwQaLxurcJP/gibhzRPDtRuZGycbwwkPOXxFfBuEbZzhyF1lX75yoHYVKgejyXqv1d
	 FpvFhBtnjHSmV43SjVXHhMnw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5877040E015D;
	Wed, 16 Sep 2026 19:28:17 +0000 (UTC)
Date: Wed, 16 Sep 2026 12:28:14 -0700
From: Borislav Petkov <bp@alien8.de>
To: Tony Luck <tony.luck@intel.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Orphan drivers/edac/x38_edac.c
Message-ID: <20260916192814.GDaqrtzr-YHpILZImx@fat_crate.local>
References: <20260915015519.83833-1-mhun512@gmail.com>
 <20260915015519.83833-4-mhun512@gmail.com>
 <20260916011805.GGaqnuTQRwdIWxkPZd@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916011805.GGaqnuTQRwdIWxkPZd@fat_crate.local>

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Wed, 16 Sep 2026 12:25:37 -0700

This driver has been receiving odd fixes and API adjustments without
anyone actually using it, TTBOMK. So orphan it.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f57a3234fb8..9497c4e5b1f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9546,6 +9546,11 @@ L:	linux-edac@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/edac/ti_edac.c
 
+EDAC-X38
+L:	linux-edac@vger.kernel.org
+S:	Orphan
+F:	drivers/edac/x38_edac.c
+
 EDIROL UA-101/UA-1000 DRIVER
 M:	Clemens Ladisch <clemens@ladisch.de>
 L:	linux-sound@vger.kernel.org
-- 
2.53.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
