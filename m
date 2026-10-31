Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423516;
	b=5tuQrWbb17v/XfFyJ2TwOlDvyXB66DqwSVtMm4LB5zrNm+QjdCAYGzYnsPt+2UQysWZJ
	 SOhMQ7dDorcvbY1Wkf23ER2eIAIWfyvUhkg0XWlooo3ZGefLQveZe9JjDvA9SGSnRngqq
	 sIuekKW5CdcJ07eXSrO8haZ9/tcvEaeGeFs10SSXmQ4REJHnQBhLDw6OabRepKozSrnyi
	 amzuydiqQbxyVdWfep7Pn46R8r+gIIiH2ORihOL+oudyC2B85SeOklaXAb/QnCIWfmIcT
	 3QdDd7YAvnO6o6kA2Mz1ijMQ3jYn86UIa45usHlb3tTl8kVimfCsg5eEneTjdXXmhNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/Im04bCfxuC5NnQopVhNmYOL00IemUlIAdwN2EaZ0DE=;
	b=VJGEZ84/eRMKuwxX1CBqgp5FkxvMiJ4iSyq8tMFZJF9rJI39R5Iaz6dryubyGoNcWzhv
	 GnMsmKHXDxSvV55+XQDGrk4NjVP4Sy2kI0JZ7QLuZxlKwZ4M6LuKhETh3r1bTvRAxeXC+
	 JR4rlDse11o7T1qGbfBGJSUm1EqMI2PNVVyvVpZLJo2UnDXmWAa6a4AnqzAxzcn6WcsDV
	 0kedYJHw9HZeSFcxqr9btlHFlO1tGPMO3pivdOg6Egxg6K81OG7+2DqbIbOGp5VtwEre8
	 NfiKkSf0J136zzdQqp0uoGVQYClLW/N15TFqhpY8Cuok8FE66xcapdZqfbCSeTCIMzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xc1F0kzz;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6C1606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F6C1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xc1F0kzz
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb0c699769so4178075ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423515; x=1794028315; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:subject
         :message-id:date:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/Im04bCfxuC5NnQopVhNmYOL00IemUlIAdwN2EaZ0DE=;
        b=Xc1F0kzzbcyam88SqVbnxLiaz2SYQmjy+DK8KpiOkGdRpsz2lOm3WlEx0ve42+1I82
         R52D8ghT6gvFLXR8YDJ1Yfd2KuoSKfvelSOt2pw1dT7v+49v0eavGeqJBBhtYNtKbeSK
         4IRos4XvNhC3PYXmGebTeBSQonSJ85+qtb875K9lMH7h55/7J2AJpteFWQ57gibviqEc
         Fx+nNvQKn+FIHJCQz+oM2zARNQdSifB0V6lpQ80K/fyC5mAKXvr2vqP4EOs176VcmGh5
         5ZFxC+h/acCJAcBmgto/3jq3WfNtWa4vTD6OVJe35tnKPIzUxYPpnMZjVBH2mHIa1Qqx
         kD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423515; x=1794028315;
        h=mime-version:content-transfer-encoding:content-type:subject
         :message-id:date:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Im04bCfxuC5NnQopVhNmYOL00IemUlIAdwN2EaZ0DE=;
        b=nKDOdKJ2tt1P7Ttdl8KDNQLO1eGN57xqELtj34lzE4Ay0r3SiiLjUSKZZ4FSpAy+FL
         qP/+yaH1SVSOtWf/SRGqabKW1wEYmDXOrMORiuqt9rtkKYIAQZUoTJBvVWUcD41SL6xN
         ql7dowYQSD19VaUHWz+q+4wRDZMNFLUcia/NEItpzYAdYpaQ+qiJ6Z6oIV4j1QWSLxHz
         8R7X9wR6ZwaSCrSaUQKDfUfz3GMBvmngjGG45a+/AZTD3nq0c+RRS2YJp7tUvLNlMySE
         /o5fojySkXChRKpg8UoHrfM5sGkAxCyWgd7P+mgXg9bP+ES+sbeclFRGR/EZnlgmZOYo
         XMZw==
X-Forwarded-Encrypted: i=1; AKwUvByrD2HvSOhjx6V6SxpqK8Mmem2wYTvhGLTrjGqjZsGq0hvGP00ocb6Zyst0fMSGyyhtBOUfRPRaLfm00XY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFxhTti4ZO6k7/v5CwVTKcSUyh1GweZ3l/4Z0GoqLvqrD6OhPl
	6j1EoYCJ5WO/GgAw7WFwG2thl5ptgeF4AY1bHt+Vc3vQ6dV+8FT/r1Gy
X-Gm-Gg: AYBFou0rO9T+KGoRQAlRYoTgbaw6O+dOTBAnEWkrToJzs6Y1o1zMpq+M9nH+8/9uJa8
	BiWVo2NJFjJuPtyYS5+qdT67h3FZ7Z9I2YIIC3uDbnq6Kkdb0vz4ETLsgGXbEKRkl4qik5s1dD8
	J95z3hew0EINVMKzFSnPd459vGcMCOlm4HBY7Lm2+ipWXdFj9sLdeTUVP2b9rmW2+8EckKdaxNh
	OPKcmmSZPJN8Hz07LZtWK1jjOkP8Le6ujC5TCKg24/StzY4OWduenzQlTdHW8qeLT2FHEwdWtOc
	r+Iyzu6ifo5ahgtjpz4ZzVS3TjxOAJQfFBmsuSMxuhcABDlFCm6qxtX4OGORuwJaz3if3ImM1cK
	cUz1Rp73NrXDQ2rqYVL91TP8Qpts6NtgMDRCK5uZsjonSDMBI0LkotZetWoH/ZSjBBSPRdNXJk0
	1tOX+DTSf2i3X+WYcJBDhgFugrst2yi8xiRewlKPVJ94noUJ7j4QUo+avdfakuqTBURAyQUckms
	u9YhTWL3heQgnZ306RsKwhg3aXy+rLF1B2A3BCNasNEPWWNyVNKECTipC+EV8Kn5NAZ5emPiGbP
	1hnRkFpkLAO1mNoZAcZZWpxtdfnQQq721EFjR4HFb+RHU9udhUzSiOfpvdJEvux+zQ03Sv6r2o2
	+qWWSiuRE7+MXwEybAt10CG3yhIxd4cgm
X-Received: by 2002:a17:903:1ae8:b0:2e9:7e90:8a3 with SMTP id d9443c01a7336-2eb364de7c6mr42312675ad.39.1793423515453;
        Fri, 30 Oct 2026 22:11:55 -0700 (PDT)
Received: from [10.208.43.86] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052bcbsm12905375ad.10.2026.10.30.22.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:11:55 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: jgg@nvidia.com, leonro@nvidia.com, akpm@linux-foundation.org
Cc: airlied@gmail.com, apopple@nvidia.com, balbirs@nvidia.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org,
 mpenttil@redhat.com, Patchwork <patchwork@emeril.freedesktop.org>,
 SeongJae Park <sj@kernel.org>, thomas.hellstrom@linux.intel.com,
 Vlastimil Babka <vbabka@suse.cz>, ziy@nvidia.com
Date: Sat, 31 Oct 2026 15:07:58 +1100
Message-ID: <179342234355.4.16705453209886955762@gmail.com>
Subject: [PATCH] mm/hmm: account for subpage offsets in device-private PMDs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

When a query starts inside a device-private PMD owned by
range->dev_private_owner, hmm_vma_handle_absent_pmd() still fills the PFN
array from the folio's first page. The returned PFNs therefore refer to
earlier pages rather than the requested subrange.

Add the query's PMD-relative page offset to the initial PFN, as the
present PMD path already does.

Fixes: 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
Signed-off-by: Aveline Noir <jm5905938@gmail.com>

---
Found during a synthetic test_hmm check of device-private THP handling.
Tested PMD-aligned and non-aligned subranges, PMD boundaries, split
PTEs and fake-device data accesses with test_hmm in QEMU TCG; all
executed tests passed with the fix. No real GPU testing was performed.
---
 mm/hmm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 2f1e98c6b644..e89f140d3e5c 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -355,7 +355,8 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 	    range->dev_private_owner) {
 		unsigned long cpu_flags = HMM_PFN_VALID |
 			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
-		unsigned long pfn = softleaf_to_pfn(entry);
+		unsigned long pfn = softleaf_to_pfn(entry) +
+			((start & ~PMD_MASK) >> PAGE_SHIFT);
 		unsigned long i;
 
 		if (softleaf_is_device_private_write(entry))

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0

