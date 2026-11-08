Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177181;
	b=bXxwc8zij5OjHVs1EdOTQ+ZZVJGlXpoIwlIjGCvGufZluZq87gRozX3kuMGVsLcEGDMF
	 jDorY/md1+nXclRGWj1RMmH+kf4aiLIyG2iDx1zlStV903fXnKUzjvMXrJ5G6kMH4FgRf
	 SpQ2MTw5B/rg46DHrLiCWmvQi7zBwYJqiA8mrDlt6xtg+7wtfoe03LCPZYMx2QMOeU8Pu
	 ZT8qwEQ3+T1IDba6PsDM1f9x7o8X7xo6x2h6QXCC3ptbQZK9a51lwC5t869O3DYMXK1Zg
	 eDQHWqBkBJhWZ3RLL4zGVljGvA211v89RWpCLq7X7Hi19IvEHH79LXSQsg3gPWT0+yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177181;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YMj96xyXamRlNHvJIKz7F8bG9fRJ2XR/rAxoOAsux64=;
	b=Sf3xZLRgdmmnsL4mcbEEgsHiqsiurW7Aj5kxi3UZisb61fkz++byln/fqQqVOVhNX6ZR
	 2LmZn4IAioP101cKmGmQ36jNQO8RLsdUyzn7CNqs3rpSFM5wVwhLiz9Q6e568TxQOHeZC
	 C2f5NWySNZ4g+cyRLxzsHcM0nkOhJqnJJ0Xc+EJpeZf46EVv+4zEJlLbEp0yueLWIL1LD
	 tQWLG3yrO2Ww8u2fe8FPGSTWQIuU6opuYCLNWAsuwz+GsoHO0l5vOZXOL0H2AjG/gOJ2S
	 mMkpkExD0M018pIni6ggziVzCWp59z/3IycyMkCDgvWjKjfycEy9SuUT8RwcrSvF/ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="zvFTt/Dg";
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418AB606D801
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 418AB606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=zvFTt/Dg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794177179; x=1794436379;
	bh=YMj96xyXamRlNHvJIKz7F8bG9fRJ2XR/rAxoOAsux64=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zvFTt/DgL0JKAuCW3DjlnYZGnDr7m19yuHr4HAzWvoVK2B+vIMatCtAYzK8kVjB0d
	 ODV1QWk8E/g3UK8EOM4YWCPSEyZ6LbXK3yzm62BgAW+ktxYo0A3avar1Y5Hqe74AnG
	 8e4T329aBtMaactWCsTlavmP9oR6sVnuGwtSVXF8lPwgsPbXAzmtiW81BOdfb7y4ZC
	 5F9u7werg0YutwJMNKcJtz7kHrfDk+aeWdFe/xRXgeZk43SXS46eESfn/NaDKIj5Sw
	 BSEj8bkjRzliJEsJyDYcB+CG8OBmGEAAQA0WFeyQV7iGFV4FIjTJc8EOTuNdF4uJFh
	 VqHz+y64reDrA==
Date: Sun, 08 Nov 2026 22:32:55 +0000
To: "slava@dubeyko.com" <slava@dubeyko.com>, "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, "frank.li@vivo.com" <frank.li@vivo.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] hfsplus: enforce legacy sequence fixup table invariant
Message-ID: <XizPhPDPPpkNfPh9_zn3vMVegijzle2lWWBSUgdPB3tpi8xMB2qBIDun8c_X7eyFVMgq0zBlmGikFuBstwkN-O0l2bfQcmA5gtxudDOHUQg=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 870331d8d3b4d5d6feda88c12d0079b4584fa434
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

Hello,

hfsplus_fixup_legacy_sequences() can grow *len and memmove the tail
upward with no check that the replacement fits the caller's buffer -
safety rests entirely on every table entry satisfying repl_len <=3D
match_len. The table is regenerated from Unicode data, and the sibling
decomposer asserts its invariants at build time, so this one deserves a
guard too. With the current table the invariant holds (no entry grows a
sequence), so this is purely regression protection:

    if (WARN_ON_ONCE(f->repl_len > f->match_len))
            continue;

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), fs/hfsplus/tables.c:3701-3742, callers fs/hfsplus/u=
nicode.c:551,670.
New table/code added in this window.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/fs/hfsplus/tables.c b/fs/hfsplus/tables.c
index 2101201..0b2aabd 100644
--- a/fs/hfsplus/tables.c
+++ b/fs/hfsplus/tables.c
@@ -3709,6 +3709,13 @@ void hfsplus_fixup_legacy_sequences(u16 *buf, int *l=
en)
 =09=09for (j =3D 0; j < ARRAY_SIZE(hfsplus_legacy_seq_fixups); j++) {
 =09=09=09struct hfsplus_legacy_seq_fixup *f =3D
 =09=09=09=09=09=09&hfsplus_legacy_seq_fixups[j];
+
+=09=09=09=09=09=09/* A replacement must never be longer than the sequence =
it
+=09=09=09=09=09=09 * replaces: the caller's buffer is sized to the origina=
l
+=09=09=09=09=09=09 * length and *len may not grow.
+=09=09=09=09=09=09 */
+=09=09=09=09=09=09if (WARN_ON_ONCE(f->repl_len > f->match_len))
+=09=09=09=09=09=09=09continue;
 =09=09=09u16 *src, *dst;
 =09=09=09size_t copy_len;
 =09=09=09int k;

