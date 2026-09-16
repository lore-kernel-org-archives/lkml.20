Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED438E8DD;
	Wed, 16 Sep 2026 02:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524861; cv=none; b=dZYvEahBO2DnneNSeOc9kBWNGGcQ8BBhoWxMnz4rh4mxuaRgqm2Ml3F6RC6r8k9umsD/oHmzBSa/S9yYoG9DoamqXQwcCMEwS6jPyxMIooxy8AcPFa089TcqrWSBlnu0Yw1Cet+Z+75FbIZ6xoqfbW1VROjUFxhCXL09LLem0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524861; c=relaxed/simple;
	bh=J3oM8iBh4rzT+Q5PLmhDNztUoDRu4Pd0ec33zrEePZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2ThRpreMxv5iDebNRpBK+ZoH2uiVF01kll+xxvbIFReq1ck0pCq28ieQmoDXhicsr4OBFx7wXy4IdNVynqpntw2bzH4Ygg8dOWpaHsj5n/rBfsCEcGyClYSgq0inxNTFnBUWxqI8fykA84Al53y9oIpBQGdg1kobvt0UJJkq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=N5XqIUe3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="N5XqIUe3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 205AE40E015D;
	Wed, 16 Sep 2026 02:14:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vTOgffmigJT1; Wed, 16 Sep 2026 02:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789524840; bh=DEKA7hie7JRWH5YW0v3vw5Zgwcg1ceZbSgQYQEodO7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5XqIUe3ohVw44giwfRcXD0YvocGH67q2VxjYQDpNfpD7QRAb3fVDozsAzxmdcku/
	 VyALEE+Buo2Q6PBZDN7K57gxQhBUToWy3naxjUzz6GbTfzJA87QmApy+2I/RBqvwmO
	 Nb8gCW/oM7QZmwqL7bYtdMWbx+T1BusyjTIB/Wh/lc3CL1zkCI+qCl+j85+BO+Ydkg
	 atFgm990rskdAjav8YYrg2Qr4uB271oxeGtFWEFAC9g97LFe6AXnA2XblB94qLpdg2
	 bO9wgZspwAyfFd6gUMSa90oWP06WUBYcE78IbJxEheOxdlQLf5uMwWGicFb2fG9AKe
	 K7wSOEMbhx3rJgEdto6FSWZVn6lQ/HvMIHMxTJS4i+rn+j/HsfksUyBJhxESfxmg5C
	 ADkEpvr5GTWjkN+m84+s4YhO6NqTKcrCeNRdqiOT6cVbNp1NTV5j34YCIEkSvHkH8H
	 SzgOSADvSCzqUMv5yqsc0nmS9VVI96jzFL3mN9kw2tGW9Wf48HwiGw76MwOayy83me
	 BM17lY8fa7anKVCk6cXq7jSLhfDgNA6/UB7zRPmFFTBgalT9fFtmtd+rvB9EBHLNWT
	 AAoHrVCsjNrZOpIpqcBHS6wKEJAeZOtHlZHD2RVb0oZQVBKKqiuI+S3XXI3XxlqsZ6
	 qQf9u4qxV/Xx59iR/3QpRZkI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B5F5A40E00B9;
	Wed, 16 Sep 2026 02:13:53 +0000 (UTC)
Date: Tue, 15 Sep 2026 19:13:50 -0700
From: Borislav Petkov <bp@alien8.de>
To: Khuong Dinh <khuong@os.amperecomputing.com>
Cc: Bui Duc Phuc <phucduc.bui@gmail.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Orphan drivers/edac/xgene_edac.c
Message-ID: <20260916021350.GJaqn7XukjSqvFQS6e@fat_crate.local>
References: <20260814045347.13841-1-phucduc.bui@gmail.com>
 <20260814181549.GCan9bVSKYJ4Dmj_Sp@fat_crate.local>
 <CAABR9nFdtAaUdqmX7PMu+s6qDdStgjeCMvptRks1zJk+9C7htg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAABR9nFdtAaUdqmX7PMu+s6qDdStgjeCMvptRks1zJk+9C7htg@mail.gmail.com>

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Tue, 15 Sep 2026 19:12:01 -0700

It looks forgotten, no one has the hardware to test, orphan it.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d0c02c08b670..1461ac362c6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2076,8 +2076,7 @@ S:	Supported
 F:	arch/arm64/boot/dts/apm/
 
 APPLIED MICRO (APM) X-GENE SOC EDAC
-M:	Khuong Dinh <khuong@os.amperecomputing.com>
-S:	Supported
+S:	Orphan
 F:	Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml
 F:	drivers/edac/xgene_edac.c
 
-- 
2.53.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
