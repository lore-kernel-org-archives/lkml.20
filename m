Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817482;
	b=QPS5v18wcTyhty2qU0Zd0tC6lh01ikIq3sJimwQVwv2EUpNNyStM3oZsWWiB2DCZ4VGp
	 DyluEOwcFTcXwZFU/D+qGYR4ov0cAuF6t7xjLkm/82dtWDMFy6Fnh++galJa0YRXDdMnS
	 RfyMFjMa1SZu3vcPwNqXXsjQoodjf4N0R9AMillzu2PQwm+FrKHpgZ9Op6W0feEirQo+Z
	 +e3O2Ujyyw92b9wqYV4c8+CbLWQQL5GME1BcoKVuVXHEkospk0/x+qmQbCw8Vnb47hnLK
	 +LrmgWVJCz9pfpQZVZRQjIZiZry4tfPKxRYrFiFxCd/FGoSSgE6eESU9055RLbVWSMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=G7AXQfq4m6o2RX2w0JId8q5zNKOwsNSA7U5XE8gBSZw=;
	b=e4ADxaFTfzqPpTA11S8Uc4yc/8FTU0eE4b11ijAxMnkIzgDlLXNBF5t/v9o9Bdn1+bpx
	 x5MNeaGYg/r6CJrWel9J2yJb+E5L6tRppQdWIMHxuNnL6Eed/D8W9T7tXXXKZCUVAijht
	 6r3r1V3zdg+g5BIYZwncWRQHS41Zkmrb69LzKhxsW0FLGLg33wwMpBSg3k2LSvr+MqUoW
	 imeOviDWKQTklVWA4VAP4U9v3XgxCAN3tUSfs5Pa+pkKPaK41+98MCa2ygzJoMfT0BEzQ
	 tUZVuwEsjtOH0oYmgy5JWJ0tQgNU7iW9iWrHAgdfxo1BkTKyRpIE+7j9N5Nvh5dExyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvFRaP9+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADEE606D814
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ADEE606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvFRaP9+
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e95bd1c14cso8808195ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817482; cv=none;
        d=google.com; s=arc-20260327;
        b=ibrPVo3sEPMkomnPg7plIzW9ATDVoa/XfUD6LDlud6IAVbxyCCINxV953zOKd2oREi
         FUizHjGHhZ2twm7qsRkubu2dhJ5P+MAukC4aaRGs0utgZcKDvwQ5hirP3WGmNMJzOhkb
         f34namxEzdo/cTbmvGfc76eHqkaYXoJF95KqSkKooG/hMgRvIIARobheYEjelTFqlH99
         d4MPmPpmxjFKzhnKfxwBymPF8s4Oesmk7R7VA9CJTHRq6VVni8/JqjShetnrn6OfHrFD
         4GvAFTZwygRqkLVfQlAc+NdANVCV9zLDLyPgoQEBwlfyqFZSdEVGQqMk0MoGMQXaab46
         OrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=G7AXQfq4m6o2RX2w0JId8q5zNKOwsNSA7U5XE8gBSZw=;
        fh=x9v88OG+aDUzXHklvYSjCeHeXXZRgSv8N/Hr53OkHE4=;
        b=SAOylzlJSu+SCVK5qaAm0VHw0IEQbeei+scofeEy7g86Wds9eyztF27aitL4PGprGT
         elKlRc3ehl5eggmKmI9e6r4YLL5wemsjSKuBg1chsxgAX6S1zTyBzgj37p7fdqVep7fd
         GtNu6c7/FDHdVAGZdEuRRMbY2tuGHjUk5d7hwzCTJNUJd7P1b6k3+hf9SW6X8ywTOsO0
         iDY0q7I9kCrfcPTEeBtDKDbrYmEfFLpGPOyPx+QNbeIyeOHfYFN388h5lUPQxASkKX/Y
         8tGvuFBh4zovOzU3PpeNHykirc1osZYo9DuzxryExYUNAlNm6jprOPIfF4jVRoBsl1WP
         iBXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817482; x=1794422282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G7AXQfq4m6o2RX2w0JId8q5zNKOwsNSA7U5XE8gBSZw=;
        b=uvFRaP9+ak4s9jmLQyKmGwVuB6VMiDPpz0liKMCpKib0m2tppK9iwNvwriEZK+b3DG
         52dXjKF15xkCXyjl/VzzH8LWTNBGv9mfGhq2tTLpRn6sidY+2zSzG6Eo7WCevgj2VVCu
         HTurEVA4XkHUj17Hir3VRT1MB0VwedDd2PImrn5PUl8K0F0PdbujKNQ1bD8qexT94SfE
         dYOWv1V1EpgfOOagXScE7clv5S5bguftYMcM+HaQl+XbV0ZVvo0ENRQE/bYUUnDXzdBH
         i4QrBbICyjOS4CW9VuSF4Y0EBylpIuDEcEbZVnLd+llBSAKVKaeGd4gYkEmDEQztBKkt
         ySRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817482; x=1794422282;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G7AXQfq4m6o2RX2w0JId8q5zNKOwsNSA7U5XE8gBSZw=;
        b=AgKK0myN+lRczBfBzvYQZhmyJn3afxVb7Shj4Rx1u2UbqVmZ5FrMV+mOZAom5WQO5M
         1lX66Ts8t39t2U1W6e0rA3KU4MBpnTKyvdD65tsUOgoeL956R41ukcc1j4sS/UYkQyTe
         JpE8bk5ZTLSfYwHR3TLfu8LRXDnWgX+jmuUbgr4i1fT0s7b60lN/L3/0QVcP/o4jjeLq
         xpUzDnKsnF2pDB2lxyVdBl+8lJfnfK3sumkHqwvfkhRbonXP/DsETdi4qeqYeLrNRC26
         EM6wHsPzyLbBc8SGXY1TkLnOUk13Zp1TFZyJJPaZmbEWP06FXW7+/GUL9AkMkeAO9pjI
         p1aA==
X-Forwarded-Encrypted: i=1; AKwUvByLS2BFYHPuPiUIieFISK99Y3t7plPiavyRoSQ4gSe3/fYX9vslPszUUfdFHy4xcn8Jfv4O9+0GutStbQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q4J7RaEcsbcUEh1U44TyBo4mN+D3M9Og4p5rSKAaWTOpJtl+e
	ZhGlPjZ6emsKHxOSUDq7Z7870e+OETYUFxXhYcqPa1T71QoYpBCuPsnjVQRDvgv39pjQE5RhPvE
	JmjTZn9Wg2ZgxQRai7DBfajoRQOTl3zc=
X-Gm-Gg: AYBFou0Ulce0u7r9x8uK+tBja1zpq2K/SMNECnRWq+q/988XrdnrjnLqaiNz6U7c+xq
	KpgTgonWupcz+CWD6QSXAXk6l+JrHxNEOPBlQ6HIjkq56InDUOrP+JR3NUvTl8BmhIM6Ob3RrMa
	S80p6wgDOhVdmZVXVGD82ZoDv1mFLLJQb07mkMHhRDetLlMvkpusbVzQZS3oVHsYBeoXWhXnGsD
	8SU1gBMP2W5LAXrDnEFG/zGui14Ij2cP5fMVSg0mI7Vu4STOFYnFBHlzMK3Y0mygiY7I+hgdtPw
	MqfGFKOYI161LU1ybot8ftjrHRGiddMDYvCXKzOT8MzVX2gAXcXWhiYgFgKhPFan64EAAT7rl6d
	8ocgcn3vIgfwFBCYBYfVaqIyoyH7zhkZlEMPt/OOjUF/7WVFSie5PY1xW14EYtJh4g1Qf
X-Received: by 2002:a17:903:1b0e:b0:2e9:3dd0:c8d with SMTP id
 d9443c01a7336-2eb36493f7dmr174390165ad.14.1793817481800; Wed, 04 Nov 2026
 10:38:01 -0800 (PST)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 18:37:59 +0000
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 18:37:59 +0000
From: 2-D Godoy <2dgodoy01227@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 18:37:59 +0000
X-Gm-Features: AclHuK-1NEd_EjkQGbZlEjcVOS2Qz56KPrchd5JTUmxZzHfe3po4ocdXh7U1CDw
Message-ID: <CAL1HEBAeDp94ZNTzbviUSZna0jv4YDkYfxyAhw8TdYQx=tztcQ@mail.gmail.com>
Subject: [PATCH 2/3] tools/mm: use memmove() to drop the timestamp from a record
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

remove_pattern() moves what follows the match over the match itself.  The
source and the destination are inside the same buffer and overlap, which
is undefined behaviour for memcpy().  AddressSanitizer flags it on every
record that carries a timestamp:

  ERROR: AddressSanitizer: memcpy-param-overlap: memory ranges
  [0x60f000000262,0x60f0000002be) and [0x60f000000265,0x60f0000002c1)
  overlap
      #0 __interceptor_memcpy
      #1 remove_pattern tools/mm/page_owner_sort.c:252

Use memmove(), which is defined for overlapping ranges.

Signed-off-by: Henrique Godoy <henrique.godoy@cloudwalk.io>
---
 tools/mm/page_owner_sort.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 58d4a54..e56375f 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -249,7 +249,8 @@ static int remove_pattern(regex_t *pattern, char
*buf, int len)
 	if (err != 0 || pmatch[1].rm_so == -1)
 		return len;

-	memcpy(buf + pmatch[1].rm_so,
+	/* source and destination overlap, so memmove() is required */
+	memmove(buf + pmatch[1].rm_so,
 		buf + pmatch[1].rm_eo, len - pmatch[1].rm_eo);

 	return len - (pmatch[1].rm_eo - pmatch[1].rm_so);
-- 
2.39.5
