Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896432;
	b=xqyggOQH/IQkbFJwZr0dpriLfCzspcM6AvZ54DtYwEz2bWTeB73g233nJ8iQfAVafDzA
	 qHUSq47B4IPjvIXiRm7GFl5ksw6sM50JKnvilCCDrinaxNS1NKjQuJ1xSMpxyoKmX8MXB
	 s4F37cQsLqpShOz2kwucUN/xf3K5UCJvhMjM2NxM9ac7eONK0qGfsmoqYRkWvRMlPSuVd
	 Vq9Dhn/4yUyMDJBSvVzkXKQOT3bGycdUbsHGmkk67GXVUcB+bIFy202akIOSBQJaLX/sJ
	 4akZFxKazdL4f2g3N7yphwqwzPTgHLOTf63GUvxkc+mi9DSwETXIaNHX/BxMQTJLEZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=1DDRt7N0cPxO/KFQj7wkx+g70GiGI/WkpRraj+SxGOY=;
	b=piiK4/fN1T5G6hWNOrVFsgp4PG2ONa3MGnpELHXw2RlPNdxF79nKn6VdqimHpb5D/3R8
	 JA8ePK04IPtYeiq9Mh7G1UySqw5ZfC6/phHU07vhq/o8nXY/SxWe0YkkE9J4opzkLhlwy
	 6W5S1b6B++mec8JIkW02V+KgP8xkDQYfi5Seuudhz1Z16/A+BEK56kFUa2wwKYRg1Foau
	 Xz+2muqz8oJ1mxATT63eMJHQE92E2IAUzR+JK62/kul/8ihBClOrIy5NZaRw9M3HpQqjm
	 Yqs1AKiOdwU5l8S3L2tfxcpH3mGXrMX9ctJ2ZwBkUfpP7SDz7YQqjKKosg4GVL2WCgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLGIP8KR;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29045606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29045606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLGIP8KR
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ea19bc317dso29302545ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896431; x=1795501231; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1DDRt7N0cPxO/KFQj7wkx+g70GiGI/WkpRraj+SxGOY=;
        b=ZLGIP8KRJ4eGdA8Ew7Vv03D4DI+I3fT8GcFNmCX458UqxKmJ5evA+ZkwGVE0UFJ0jp
         9hzDy3ejiTDR6GSQSvaL8v0X4SHR/nG3HsP7KsQb2+j4EBeAKU3Sjqkkw2Jo+pGlj0iw
         70eBMu01hlA1hkSZ08uB1/u4qKfrMV1ZccYeALIvIePB2rg+1BPwJCEts37nQVslE8Sz
         5Gk6VIJwZu3yWD/FLmvNU3bonF2IGfXLjfGyjVpzOzkK5hKobySELUACBT9gl/FtLrv6
         JDe+XcO+kjmDQgpVRYcChFK9f53Y2dAY3W286HcYrDHPGbgbMkro9kPQK1N68s1qor0r
         yMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896431; x=1795501231;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1DDRt7N0cPxO/KFQj7wkx+g70GiGI/WkpRraj+SxGOY=;
        b=1UTQ+8dkK45R3BXbhMHheQBjBrQrse2zc2gkNiYd92sTkzddpHKrZMmgsDnX0fOQR7
         FA/OjKmDEDy8z1LvDG7KMzb2YTr4aSs4kcmAFPeojUVVX8guapfxIgSvdDtR6iLk2sIG
         ezbqdzANikF4xCx/C23AxyJVW/rC4+Fy+3ofkey9Tj4mg2rnOdn2DHPD8Zse2k58RBPy
         6J3qxDyQMTmdTVNCQN9sYgQzG0q6ZepxwyzOFBHRTSfNuBjuCPrnTIQcGOED/SK0fLAL
         DzrNGQWlJ5DO6YPQD5213Im/DirVJoK9gb1fFVDjLvatOCXGv83X8SXp+5cP+pfaUL2Z
         /mNw==
X-Forwarded-Encrypted: i=1; AL+hErEBIzSbQf/+VERQtAiqShEmWA2NLcgQbAYeAicwduPYcNfx4SZkSBkuVFooLL0D89/6WHQeAj77NE72tl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OZejsRSHzO31gxQfoZZkNQViusCMMBmPOBEoR1Eny0/2BTc4M
	kVUQSeaTEkligKnLBEv0mL3n38lqHo6b1+V11hSDZT3P4ph/13Vs9w06
X-Gm-Gg: AZFdTZeD70stMpVmHXBZxKSLhy79nMBWs3bk8LuMbGOtg7a9Wdjk1ezz/WXNoUTDUGn
	TT7buFFI+9xULE5SoEzgDOwJkLqjju1YwOSY7WZ8uEfy2HgN/5coWARkKX388hk/gKhRZaJmqZ4
	7Jif0cM5gSsqzOh3yyDFp9UtU7bKlZOYWc1gaWD/hN6D69djka0Z/C32bPi4GbWW4eGx1Rebfd1
	Z5PGTJ4L9NbtdX9LHvSqI4kiEDHW9uZjZqUeekCtELCMhGyit7kuYPLOtxrzNvVm3cbnnRZ7RuR
	sGfhbuaE0MjOtLtdesLP5FAA4bbgbKdOgMY+oYkUOZm1oXFOV46CxQMgMTMBv1U5CSs8QndSm1o
	0GxiEBp2zut/hs+o4Zk7El1SZjFBC190EOtlbrfjrn9sBH2C168HabhOgnn4lwnNc6mWmyHJuLF
	PXS4CxpXsdN3QWZb4AOC7vodUbRP+ld19BSjzXbfexSYzXjuU7FkPn/QUaq7iH+Z9UvbGdSVHB1
	3eVAtwVxZ7Lq4+IvSM49xz/ewTNa84/iddvTBzjnTI3l0rnLyQPfF5KcstNnCXA+N55Qb1hj5up
	k7e8euT8ncBO9p4dBECNl977QKy3o+1fWbpNUlE6heHKgsdBGoiXryRNGaAekx5U0L3F+ilrg9v
	MW3ldxgGOWb/Bo98X3OmcbG/FUVTIqj4auvbRt60BGsg1pnQCVyWD8lPVBwiELk8=
X-Received: by 2002:a17:903:22c3:b0:2e9:6788:9369 with SMTP id d9443c01a7336-2ee0dad1a75mr127580975ad.34.1794896431357;
        Mon, 16 Nov 2026 22:20:31 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a5f754sm8776345ad.52.2026.11.16.22.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:20:30 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 17 Nov 2026 17:06:54 +1100
Subject: [PATCH] mm/damon/paddr: skip hugetlb folios as a whole in pageout
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-fix-damon-hugetlb-pageout-20261117-v1-1-054ef8760a92@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NwQ6CMBBEf4Xs2Y0URaO/Qjxs27WtkZa0RUwI/
 26RhOObzLyZIXF0nOBezRD545ILvoA4VKAsecPodGFo6uYihLji031RUx882tFwfkscyHAYM+4
 VOnN90jfdUiuhiIbIZfU/6R4bp1G+WOXVvDYkJUYZySu7Rps/T2F3HvsePU+wLD8rFfSysgAAA
 A==
X-Change-ID: 20261117-fix-damon-hugetlb-pageout-20261117-a4e03d9d5a5b
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

damon_pa_pageout() uses damon_get_folio(), which rejects hugetlb folios
because they are not on the LRU.  The loop then advances by PAGE_SIZE and
looks up every base page of a hugetlb folio that cannot be reclaimed.

Use damon_get_monitor_folio() and skip a hugetlb folio as a whole by
advancing to its end.  Do this before the filters, the accounting and the
last_applied check, so that adjacent regions within the same hugetlb
folio are not walked by base page either.  Test the LRU flag first to keep
the hugetlb check off the path of ordinary LRU folios.

In a pageout microbenchmark in an x86-64 KVM guest, traversal time
dropped by about 99.7% for regions covering whole 2 MiB hugetlb folios.
As a side note, there is a small overhead of about 1 ns per region when
each region is a single 4 KiB page.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
Tested in x86-64 KVM guests.  KUnit passes.  The damos_quota.py selftest
can also fail without this patch; I will send a separate fix for it.
---
 mm/damon/paddr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 5b773012a876..aca48bf752c8 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -268,7 +268,9 @@ static unsigned long damon_pa_pageout(struct damon_region *r,
 
 	addr = damon_pa_phys_addr(r->ar.start, addr_unit);
 	while (addr < damon_pa_phys_addr(r->ar.end, addr_unit)) {
-		folio = damon_get_folio(PHYS_PFN(addr));
+		folio = damon_get_monitor_folio(PHYS_PFN(addr));
+		if (folio && !folio_test_lru(folio) && folio_test_hugetlb(folio))
+			goto put_folio;
 		if (damon_pa_invalid_damos_folio(folio, s)) {
 			addr += PAGE_SIZE;
 			continue;

---
base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
change-id: 20261117-fix-damon-hugetlb-pageout-20261117-a4e03d9d5a5b

Best regards,
--  
Aveline Noir <jm5905938@gmail.com>

