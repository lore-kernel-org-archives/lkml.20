Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365176;
	b=eg7XolFYLtP0bz1RSIRhRYUbaOlvPXjpxOd86FtnV1jCkYQ8BxOD9pz0l03y4fJ6XWZQ
	 uEP/I4MEpr+3jLW2ZiclDqVgvnAK5+ua7ShHVH5v35hn4HrBnqVUHtqwoheOh4R3slNh3
	 XQvA6oHQFk/LW0nb/y1slXSInkco5pdib4xQFXHs/Iw07B3j4/PX7BxuNxvj5I4V2GnpB
	 Y7DSXcplVz2762aSJUiXxlHrNNIoeLdFj1UykrVZbYOdshj1Yb0lX+jUMsGuAU7J1l6V+
	 86g5P/tLXpiz5sW5duqBYPJE+PiZvSJEfpEyv9/AWLyPHdMd8BZ1W6DFSiAM5NzWrRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365176;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aHtsWtah6vBal2nFE0nb7JH5Z6v+Kv/eLAAK7lJjA5E=;
	b=fVrP8AQi0dgRU1ISt5A9GSFPRXyo8E/B9RYaztTmyGtsKewgV+QRQy78XwfAuFRNFu8g
	 g/LkwE7bCuT5zCKoH+mQg76p0qepBRmMELP7LrnvDamUhyFix8+EOZt+389wOVIeNlbgM
	 tMgcVjsU+bcDDRL91zRnHCqLu0+GBzhesXSrbXVk5OJ+ybINpnvgtjOn4b4CXAYKBjnkf
	 KqOsMMe/SW4Vn1LXr86SFSEk3ZdkTLDFJfctlehVsznn0w/lg4MDP8BoH3Hz2dQ29ZtpH
	 lhahTiWtY/O5m5xD7no2TJks239Atjyzq3XjaVePg9gBrf5zSSWRRH649OY3vfCxdDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=oBZnDbfJ;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3E606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A3E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=oBZnDbfJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794365170; x=1794624370;
	bh=aHtsWtah6vBal2nFE0nb7JH5Z6v+Kv/eLAAK7lJjA5E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oBZnDbfJE+5vsPCws+ii6madHrhRZi6XXLYyknlYoK99vCbQoZgs9yvya5GtEgzYH
	 kdLwa3cG8IfVRG4cXXEuVNoV9bM9DHmCP/qHAG/7ift0JmVO2TT7SEkqFb+AEdRj/M
	 +hNjjt2BwhE+JNMYaKINM7tR5cu4wfR5NufNF0ZOzHKD/LZjOo+acB0rSR5z0cijo2
	 NPYn1jGL+rG/oIKRR52wu4psruO5UTSG8qtnvciiGMdFo5tt9VgvRN66GhJanGNUno
	 QYGrcaW5UgOYyfAteqIWLAGXt91XLYHPIYX73b7Jpex0pZCYJNAdMfZEudpI19f8gW
	 ftU1c0EtYnWuA==
Date: Wed, 11 Nov 2026 02:46:05 +0000
To: linux-mips@vger.kernel.org
From: "Michael C. Pratt" <mcpratt@pm.me>
Cc: "Michael C. Pratt" <mcpratt@pm.me>, linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] mips: vdso: fix uninitialized warning for genvdso
Message-ID: <20261111024520.17905-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
X-Pm-Message-ID: 44b5b34ebae7b8e695f22c6f6b8ea6e86db309ed
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

On older versions of GCC such as GCC 10.2.1,
it is possible that a "maybe-uninitialized" warning is triggered
for the pointer variables in the header's inline functions
when all warnings are enabled.

Resolve this warning by initializing all the pointers to NULL.

Signed-off-by: Michael C. Pratt <mcpratt@pm.me>
---
 arch/mips/vdso/genvdso.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/vdso/genvdso.h b/arch/mips/vdso/genvdso.h
index 9bfb874038b0..112f51e2e546 100644
--- a/arch/mips/vdso/genvdso.h
+++ b/arch/mips/vdso/genvdso.h
@@ -7,9 +7,9 @@
 static inline bool FUNC(patch_vdso)(const char *path, void *vdso)
 {
 =09const ELF(Ehdr) *ehdr =3D vdso;
-=09void *shdrs;
-=09ELF(Shdr) *shdr;
-=09char *shstrtab, *name;
+=09void *shdrs =3D NULL;
+=09ELF(Shdr) *shdr =3D NULL;
+=09char *shstrtab =3D NULL, *name =3D NULL;
 =09uint16_t sh_count, sh_entsize, i;
=20
 =09shdrs =3D vdso + FUNC(swap_uint)(ehdr->e_shoff);
@@ -58,10 +58,10 @@ static inline bool FUNC(patch_vdso)(const char *path, v=
oid *vdso)
 static inline bool FUNC(get_symbols)(const char *path, void *vdso)
 {
 =09const ELF(Ehdr) *ehdr =3D vdso;
-=09void *shdrs, *symtab;
-=09ELF(Shdr) *shdr;
-=09const ELF(Sym) *sym;
-=09char *strtab, *name;
+=09void *shdrs =3D NULL, *symtab =3D NULL;
+=09ELF(Shdr) *shdr =3D NULL;
+=09const ELF(Sym) *sym =3D NULL;
+=09char *strtab =3D NULL, *name =3D NULL;
 =09uint16_t sh_count, sh_entsize, st_count, st_entsize, i, j;
 =09uint64_t offset;
 =09uint32_t flags;
--=20
2.30.2


