Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793461522;
	b=URqOKOlFbM8+0OSKgMllfbXF02Ue444P2rDfyoCmN+9bQzZel+Qbsu1sVYaT6wd3RrS/
	 YmsdAzKqjXnFIyrUsQrLezl3voTDZXR0DFPxKjqKVEN2mvGvdIx9qbAQ7qSQyaXt4KxFD
	 GHV5oWek6237jT2VPMX0NUCNRXb/C1cI/tqT+gogLLr2AWolglCkkfRVPpTvYyJAHMeGT
	 dPhEfoSTsGwAO5U2mLU2pENuBcRR2Go7vNP4pF2puhYumdTIIMo87ZA0cI+uJZPo6CM6v
	 6WpfHfbE/DxffAnpAocjoWDQht4tdNYd8L+gm3gCZnA9oOX1RZiiYzV3SnYE6qEQTUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461522;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=qD482B1x9OW46mcV0NOxxvY9DRkgOEV3+OdPHjQp9+k=;
	b=3EXFhPslNjlDcqKEJnFc3AQVN9V5dHuwF9hy5A6Sic2k/mUkY0TiPjChUd02PCBJCWth
	 WUek6LiG4d7UCbNjTw7FcXL85LteXuBPhr2IJdmML3Yua2C/bz2xTYHj6Y9Udc/ef2Bpm
	 6GOeMXDpMwHKJCasbJvKNwVQXsUy8bOsueMp0aNvCN1QajymHLLpURle3EzhdHGgWy4da
	 IcU4qwPwZ9aYrTzZ7P6MhOEbYScaAmKR7GDfPWpxAwgzAOJ5RYKjJbMBtQ1fqtRJkMSVT
	 aLbs+WNdDO10oD12uyF44toJmjC7+Ko/lGREODBLux77G2B0ioDopbYD9picM+aufxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=Ug5cyWeu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.170
Received: from mail-200170.simplelogin.co (mail-200170.simplelogin.co [176.119.200.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391D1606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8alias.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=Ug5cyWeu
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793461520;
	cv=none; b=eFkS6DbNCPFgOQcostiQqaaSZ9miRT7y/6p6wrncB0VuBsrF35mnc+hMip0WqouQf48225UwqfU7Z/+21eidXaMHXYiltnrnP7pLr9viibBuePSDV+i73/EOL2AqCrMpNnsoRvjrSbavg146hSkOK6xbk1EXe0pNGizxXUZwlfKRrG2OEv6dwSx+PfbZibeNwI51GRHfxVCr3+4HOrI3nu27h1vyYnB/FJVHIS9lBHUuw9ZF/23lfRkyyIr6hxQhw9kTq9mHx+LLZdIyRcwLH1hx5wMeFGkQYzVQJSnqfKEtUD5wzVStKPt2Vf9SF5nm3qVJ25FxmVBsQ5pEb+7tGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793461520; c=relaxed/simple;
	bh=qD482B1x9OW46mcV0NOxxvY9DRkgOEV3+OdPHjQp9+k=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=QxV5uJA8me6tykrR98rAjCVVWziHTOVYsKMS3TbxVEQM96dBQDvIYD3b3hHrmo3V8z6XfLpDnj+TlidP45YZd1vhRPcJjVKbGsNaeH6nYymJKrK7F/lGVedEBCRu5vNu6n++u/431A300baUvyeO/70cVuN/bl7fOmfUme6+YPUK7ut++1JEtWfq6QJU5at6BXBljfdvWjFgan2Gzs/9PGm2RDQkBu2hcZWBfpgDrU1T6XVw62B7SWwFcqq4c6kaFlgoCzkxDyPMH+zP9t94to+wTB7AGqhABv0UDmzJG3+qXwxyV0kRG/OPSEZeZRQS5jJ7ZnoCpusUxldrhr2pxg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793461520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qD482B1x9OW46mcV0NOxxvY9DRkgOEV3+OdPHjQp9+k=;
	b=Ug5cyWeuvQja9CuOfmDSDpQ9mah1mUTVa20lyQp9tMVe4ZUNNk2TRY4teIjwRT3Yeo6Z0q
	QzNk9HBmR7kyJwBmxwCUy/IXEEqENk0tzZzeE9CuhtThkvu4pjApiu/rvgixF0y2MvyEkW
	5Ro8wrsu+Uq8CNQTR8WKsyjVPn5w6uo=
Date: Sat, 31 Oct 2026 15:45:13 +0000
Subject: [PATCH 6.12.y 1/2] x86/ioremap: Sign-extend PAGE_MASK when aligning
 the physical address
In-Reply-To: <179346145167.7.7861216093151225931.1735978772@8alias.com>
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
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?q?Radek_Marci=C5=88a?= <github.unusual340@8alias.com>
To: stable@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,Ingo Molnar <mingo@redhat.com>,Borislav
 Petkov <bp@alien8.de>,Dave Hansen
 <dave.hansen@linux.intel.com>,x86@kernel.org,Andrew Morton
 <akpm@linux-foundation.org>,David Hildenbrand
 <david@kernel.org>,linux-mm@kvack.org,Arnd Bergmann <arnd@arndb.de>,Michael
 Kelley <mhkelley58@gmail.com>,linux-kernel@vger.kernel.org
Message-ID: <179346151984.7.6028133845439165356.1735980824@8alias.com>
References: <179346145167.7.7861216093151225931.1735978772@8alias.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1735980824
X-SimpleLogin-Want-Signing: yes

From: Radek Marci=C5=88a <github.unusual340@8alias.com>

[ Stable-only fix: mainline is not affected since v6.13, see below. ]

On x86-32 with PAE, resource_size_t is 64-bit but PAGE_MASK is an
unsigned long, so in __ioremap_caller()

=09phys_addr &=3D PAGE_MASK;

clears bits 32-63 and ioremap() of anything above 4 GiB maps the alias
at the low 32 bits instead. The RAM check runs earlier on the original
address, so the alias is mapped even when it is system RAM, and the
caller's MMIO writes land there.

Commit ffa71f33a820 ("x86, ioremap: Fix incorrect physical address
handling in PAE mode") fixed this by masking with PHYSICAL_PAGE_MASK,
which casts PAGE_MASK to signed long. Commit 4dbd6a3e90e0 ("x86/ioremap:
Fix page aligned size calculation in __ioremap_caller()") reintroduced
the plain PAGE_MASK to compute the size before the high bits are masked
off. Cast it the same way here.

Mainline lost the bug when commit efe8419ae78d ("vdso: Introduce
vdso/page.h") and commit d4a65302dd84 ("vdso: Change PAGE_MASK to
signed on all 32-bit architectures") made PAGE_MASK signed on 32-bit.
Those rework PAGE_MASK for every architecture, so they are not
backported.

Fixes: 4dbd6a3e90e0 ("x86/ioremap: Fix page aligned size calculation in __i=
oremap_caller()")
Assisted-by: LLM
Signed-off-by: Radek Marci=C5=88a <github.unusual340@8alias.com>
---
 arch/x86/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 8d29163568a7..14529884671e 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -223,7 +223,7 @@ __ioremap_caller(resource_size_t phys_addr, unsigned lo=
ng size,
 =09 * Mappings have to be page-aligned
 =09 */
 =09offset =3D phys_addr & ~PAGE_MASK;
-=09phys_addr &=3D PAGE_MASK;
+=09phys_addr &=3D (signed long)PAGE_MASK;
 =09size =3D PAGE_ALIGN(last_addr+1) - phys_addr;
=20
 =09/*
--=20
2.56.0



