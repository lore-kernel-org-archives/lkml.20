Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31B47143E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787305; cv=none; b=KjOKncPEHMOUVq/FoiW46Dd8HOXtEGopZH00B408ZLkQ4zm7pEpoy86RFkcxVpL8lxFXMzKHtQgGBLuXvG4gB8gn++h/3Rn1E/V62tWqyeLm/ZzEinngUEK/sv9+HJYv9qKDEas2AiwHX9ImX3HbkC5VCdObrgjT0Y1NujVe8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787305; c=relaxed/simple;
	bh=T1GH6hItrh3S2bTGYxMz3vhBOz0FujXzWdtsg4c5ifg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lNPkNlpW1jDnnsjq/3s0S0bUYQOer0+KD1aFTXpmOL42C9xAbQOxF49lmlpFr4bmGMkzmryBJtKDtM8q29DxjsprNUMCzTRHAoB5sjOg3gdfwYZE5bHxByMbGBi/7GkuQ01cjvHRvJMMnYWkGZ8uUPgX9euo+ENKmuig8eo+z2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtK5B++0; arc=none smtp.client-ip=74.125.231.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtK5B++0"
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-7f9cc0e524aso978588a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788787298; x=1789392098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSUCkb2IsxXPufzfD2+/6w1ZlHPJoyK0t/kGTCdaAqA=;
        b=RtK5B++0oE1HuOhYXf4gzgj8BsCro4V6Xj/h3QKp4ZORZsksRt+6lqMFIHqpSjtvo/
         YD8OHYwhUppB/qp+gAbFcdaqJNDSXdUDfsHgQj1zz5fOndzoHPKdUCefaS3n8SHVB9aH
         /Ea3c+pyCXFhKaqui4sLTNZdAC1x7r9h5VOb+ctqGY82CLpbewpcX4IGb1Nm8ArKN9tT
         pRYTR0wfc5qoerDQu7kGnazuugDc6GfLi3k2LRxloQdsZwzh0USFdoCT3iEU5meUDQkl
         uPSvaw9PyBe01tFy4P974Tg5SdCl/BqVwS9oORg0NKhTxffL5ypzRnnDT0aueZz1lyku
         Dswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787298; x=1789392098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSUCkb2IsxXPufzfD2+/6w1ZlHPJoyK0t/kGTCdaAqA=;
        b=jLmdJ2FFrA9Bcrw8jzEHydc23U1N+Bs5XVxhdWb7SON92xdx7vy68W4qX97nHLPriL
         4/3J9cLuAbjxd1+tj23vOkhw4ATW/k6nZgT80oGi41UiT9QKC4CaI+HnwGtb0qzUotxO
         RK0EOJP2iZcQGonr913SWzG9fIrcPmeSuiNZuoVHGC35xcJvIsyFowYuGvpVhXFp/ove
         7k3HfqeMckIQDRo4P/gMuOKGI3yr1tKo6jzKgcaQnkePfk353+tyEf5MDod/BkJpF9Ha
         hJjbUw6rg7kvAMNsNLZdyPQJ2xDEWaN3VhGp0wFxdzaI5xT2Bb80ofmaVHeB0U1DKFfP
         410Q==
X-Forwarded-Encrypted: i=1; AKwUvBxxvpNlF/xWDNJA8KqHA8Je+UgZBrzjUhdnR3/oWVDdl8EoqQF+rYaJkjFOrNyjJ6FHQQVj0Woyb5dc+tU=@vger.kernel.org
X-Gm-Message-State: AFuF++nDh46ZoMFczKIMbBuwHTOWMzoQcdAzm8jfQV+nKF5OSbF2u5z2
	FrDhRiJO5u/UXqCcRSjFdV7DJhKJY4GhdgBMlHHtoDFfoUfb0lpvTvKa6A6c48QJsnA=
X-Gm-Gg: AYBFou23wRItTD5IQ/dBrNu6nNHCD1sTuFzO+u+Gzf6Vz8eOpZwsLP9vvCnncpWfIOa
	3iNjUeM106PfrrMr0MZxEx5RMEoXABqF4OHD1sJHdmPON7DKPefRSorecWNTnPsna5D9ah+D2+k
	SaHnvAS/0Rw6yy0SMX6G1JnXgwNWlifX4TSTk4/3vtT7CseBpFEapWobNdfO6FJLMGPj8xNGqbd
	EAilmc3ibLh8ZrQkDCSgkd86hvroyTM7UBzesI7mMK7uVhRr8y5wTbwezBeWD1TsYON7zAgEISf
	Sy3lxjztFUNMBk/SB4ueIU1f9dN/aHfToa6J70m8P/hXTD8AmeRFAdstPDB+n5GfTIJf0QSAeg5
	Kr93d6VjA2+sj8Ws3tLozdtaJLR67V7HD7hnfxi/AaRBHWelSjiUA4GPcbDfQA2HTj6H3JrnO0x
	DztC1m9OhUcoS73AaTp71YrLKC/zMG32xFhwIznBD3+oSJHIcBeq15e8eWobsVHBDsT1X3fPAl6
	/SLEQzXkNn1Xjs7jWV+rC5bYzUmbRgDrrOTr39r
X-Received: by 2002:a05:6820:2004:b0:6b9:2d62:960c with SMTP id 006d021491bc7-6b92d629902mr6339050eaf.68.1788787298260;
        Mon, 07 Sep 2026 06:21:38 -0700 (PDT)
Received: from HXDQXTDYHN.bytedance.net ([139.177.225.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm28284062eec.26.2026.09.07.06.21.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 06:21:37 -0700 (PDT)
From: Jinmeng Zhou <jinmengzhou22@gmail.com>
X-Google-Original-From: Jinmeng Zhou <zhoujinmeng@bytedance.com>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Wupeng Ma <mawupeng1@huawei.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jinmeng Zhou <zhoujinmeng@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/hugetlb: fix subpool minimum reservation rollback
Date: Mon,  7 Sep 2026 21:20:55 +0800
Message-Id: <20260907132055.26696-1-zhoujinmeng@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a reservation request is partially covered by a subpool minimum and
the remaining global reservation fails, the error path first calls
hugepage_subpool_put_pages() for the subpool-backed portion. It removes the
failed global portion from used_hpages only afterwards.

hugepage_subpool_put_pages() uses used_hpages to decide whether rsv_hpages
should be restored. Since used_hpages still includes the global portion, it
can remain at or above min_hpages and prevent that restoration. It then
reports the subpool reservation as releasable, causing
hugetlb_acct_memory() to incorrectly decrement h->resv_huge_pages.

This was reproduced with four 2 MB huge pages and a hugetlbfs mount with
size=10M,min_size=8M. After a successful three-page reservation, a two-page
reservation which needed one subpool page and one global page failed with
-ENOMEM. HugePages_Rsvd incorrectly dropped from four to three even though
the subpool minimum was still four pages.

Roll back the failed global portion from used_hpages first, so that
hugepage_subpool_put_pages() evaluates the minimum reservation against the
current usage and returns the correct global adjustment.

Fixes: a833a693a490 ("mm: hugetlb: fix incorrect fallback for subpool")
Cc: stable@vger.kernel.org
Signed-off-by: Jinmeng Zhou <zhoujinmeng@bytedance.com>
---
 mm/hugetlb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 785772845795..3e3cda181e72 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6808,15 +6808,6 @@ long hugetlb_reserve_pages(struct inode *inode,
 
 out_put_pages:
 	spool_resv = chg - gbl_reserve;
-	if (spool_resv) {
-		/* put sub pool's reservation back, chg - gbl_reserve */
-		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
-		/*
-		 * subpool's reserved pages can not be put back due to race,
-		 * return to hstate.
-		 */
-		hugetlb_acct_memory(h, -gbl_resv);
-	}
 	/* Restore used_hpages for pages that failed global reservation */
 	if (gbl_reserve && spool) {
 		unsigned long flags;
@@ -6826,6 +6817,15 @@ long hugetlb_reserve_pages(struct inode *inode,
 			spool->used_hpages -= gbl_reserve;
 		unlock_or_release_subpool(spool, flags);
 	}
+	if (spool_resv) {
+		/* put sub pool's reservation back, chg - gbl_reserve */
+		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
+		/*
+		 * subpool's reserved pages can not be put back due to race,
+		 * return to hstate.
+		 */
+		hugetlb_acct_memory(h, -gbl_resv);
+	}
 out_uncharge_cgroup:
 	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
 					    chg * pages_per_huge_page(h), h_cg);
-- 
2.39.5

