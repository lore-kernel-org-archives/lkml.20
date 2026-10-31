Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=79.135.107.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793461532;
	b=dugfUwD8qxCsUFMzJzYbRt7q6BZcf9vX6il+siNr3n+WKBBmLkpOrbAVeYYlMqB3KaI1
	 IBBFG4aS4CCcqEiB4AKWSkqgGRISrtMbyWC8OgycWff3D+hfp7IF7rVHSNdJWCZaFzf7d
	 dB1HTsbbH07Q4pr7O3QRrpvUTOiOLjYTM1UNFd+9MyC/2sKgWszXqcdW4gDA8yH0SdXhL
	 CuAye3kVQb/UuRMvbx8w2nlDL5lnkVBSa3EXEFzLQ9BgobfMbAqJ7Qzptd8p24f2NKygh
	 vVozxaVn/AJ3LB8rGhVnm0K6LOJjBKVURLqFYnJg5CbtI2cWsv4bk2EkEJ58yQfTx2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461532;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=KzUzEHBbmgc5bGwSKasygIMu+7J+1rdvRalQ/DDgKSA=;
	b=DfWx+mZ/Ume+6pfC6VLkf6fm7FLBb8rqDkHuLdm4GGFAKytyDTG6sKiKt3o/62ryDlIb
	 ZVs6Lj1k1f3o4i8uhSiy21X3OMLT4B1bCCFPWm7DzWLWaZZZf8wxZpfkadeHWARWTbM9y
	 bwn4ZkUlr1R9/nKy6btcsCJJJdx1kO8hFtejx/a5oveTN5nfoTgzU35uFxsHQw7IGfYzy
	 +MNV43T7lpZokgzIjUtq0O3QD9cB7fEOD4lddxrshjMXCHDjhYorqEtMHX0gVqxJcmT3F
	 E9lyRO0rSmIRS3NVwxWJGr+YKDd0xPYKL4DeW7i0BKZBwVkKXSllYHPK0HLzp8/jrcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=Uu3KFHHX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=79.135.107.171
Received: from mail-107171.simplelogin.co (mail-107171.simplelogin.co [79.135.107.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C1606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8alias.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=Uu3KFHHX
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793461530;
	cv=none; b=Uu6UPx67nmHQjF86wBhXtfp6S+hA8FTOtZQPLOPwGjM0NEEsNZNTbyZ+UYj5hy/EK5ZwIxnCf4E7hlLctnsZDq76OpqDqf7gtenDfW8iU7lAuUOV3FlMJbX7I1URjr7ia4VsfULG8IEHkRSusjTTYRUgjuRFmBnoSbBC2HD8a1b+rKSt9clh3gBozsg79BkDnfAMIAh53JpHBXh8WYi/e7ypmL6J9PV2ukenZ39tff1bViWupC2OgF4x6rz0RcvZJfpOsCbw/ONNlnOzvv2we7o3MOwxGcnjmTx3rnJGMi7eDWcC9DnjfgLdHBGn3Pz4gnMq7R9o4Q+qX0Y0N8MVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793461530; c=relaxed/simple;
	bh=KzUzEHBbmgc5bGwSKasygIMu+7J+1rdvRalQ/DDgKSA=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=2KY8BK4t0yfEQL1OyFB2x2uoodbRJIvnUiAYqZzH3s9npGOJAXHqEGTHs8Vwnxp0qtJHmvpi7hYlnZnWUC73WkiOcD7E46BmPv/kfDMFo1zM6eyYOBYLkyDD5H2b+4N14hl/znVU4KxKWst9FHjrgKOOnvkkAAWl2Bn9B1x0LyWmrbkyCBY1k6dDYOXlD1WaZJQXoGaw2FDzgFYydWLC3Mq0XIwaGjbmOMa+Nqn3qI2zFMN7r9AvwJln2HjftTvee6xQzIia7uXs5sR3p0xzzEm0Gaek/M88TH+zsRGEXpkycowV61Q9UBvojHrt+uBJSZtKXjgFUwDxbl0JoayCcQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793461530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KzUzEHBbmgc5bGwSKasygIMu+7J+1rdvRalQ/DDgKSA=;
	b=Uu3KFHHX88CcCh5JfEviiqH0gnfXqkGciAG7Z/cRJX72aW0pV5QhdC2h1Lf6uOFPkwn7Lg
	Axk0u/Dyqd+UcyeDZ/GJQAM8A0W5sf0jiOPFyd+RRFPoTRF/j5OcW4auCXlCjXKA2VUlWE
	MG5BAGmFhROWyvP9eggB2X0mEa1uGGo=
Date: Sat, 31 Oct 2026 15:45:21 +0000
Subject: [PATCH 6.12.y 2/2] mm/early_ioremap: Sign-extend PAGE_MASK when
 aligning the physical address
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
Message-ID: <179346152914.8.7838190602983146541.1735981230@8alias.com>
References: <179346145167.7.7861216093151225931.1735978772@8alias.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1735981278
X-SimpleLogin-Want-Signing: yes

From: Radek Marci=C5=88a <github.unusual340@8alias.com>

[ Stable-only fix: mainline is not affected since v6.13, see below. ]

On 32-bit kernels with a 64-bit phys_addr_t and an unsigned long
PAGE_MASK, which in this tree is x86-32 with PAE, __early_ioremap()

=09phys_addr &=3D PAGE_MASK;

clears bits 32-63, so early_ioremap() and early_memremap() of anything
above 4 GiB map the alias at the low 32 bits instead. Cast PAGE_MASK
to signed long so it sign-extends.

Mainline lost the bug when commit efe8419ae78d ("vdso: Introduce
vdso/page.h") and commit d4a65302dd84 ("vdso: Change PAGE_MASK to
signed on all 32-bit architectures") made PAGE_MASK signed on 32-bit.
Those rework PAGE_MASK for every architecture, so they are not
backported.

Fixes: 9e5c33d7aeee ("mm: create generic early_ioremap() support")
Assisted-by: LLM
Signed-off-by: Radek Marci=C5=88a <github.unusual340@8alias.com>
---
 mm/early_ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/early_ioremap.c b/mm/early_ioremap.c
index ce06b2884789..ba0acdb72396 100644
--- a/mm/early_ioremap.c
+++ b/mm/early_ioremap.c
@@ -129,7 +129,7 @@ __early_ioremap(resource_size_t phys_addr, unsigned lon=
g size, pgprot_t prot)
 =09 * Mappings have to be page-aligned
 =09 */
 =09offset =3D offset_in_page(phys_addr);
-=09phys_addr &=3D PAGE_MASK;
+=09phys_addr &=3D (signed long)PAGE_MASK;
 =09size =3D PAGE_ALIGN(last_addr + 1) - phys_addr;
=20
 =09/*
--=20
2.56.0



