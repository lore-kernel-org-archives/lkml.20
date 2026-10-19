Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D5496D40
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400934; cv=none; b=RjQHiyhdfFXbBrprEvda/42xrRhBXqZB50UIJrK90pvLnpV4An6vE/LWlZh6KpXwNDQy49edVOd51H+FfM2yq3FtqJuEG5VAwngSOsDVjkcq54DCp4x8Me2dt0ObGsvL2R2GKvsWmQcq+Py20myxRhLHkUYbQNywOOXtUgtN99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400934; c=relaxed/simple;
	bh=ys0mhc2cYUBCVEuX3DcU8wtfn6/zRBuYJ3BAcD3p1UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPp8R74xWfmMYm6gmdjU1QHB199+LsZnhkq3mE0wSxlb7SOiGB0T/dEDxvbgerzfyGJspQ005norTiH+n40obd1FltZG/q1SoC8WZz4CulfBPI8wUmGeXDwhjWNrjD8YevHhcsbFjsSoJE4DlbMKLVdWtRwp4lCk5/42/cAGSAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ef4glrDi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ef4glrDi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e95bd1c14cso15242925ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792400932; x=1793005732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvZO54TWJTuQkZMeWHo+KL3t3yCuPUOF5hA+fz0b8nk=;
        b=Ef4glrDiOK5Qfgbki/rZETJpp4S9PeHnGKdQ/YFXVIMBBWRA6g0OFoY/cTXFbSr2IQ
         4VjFH5fcwIp+BbO4ZxjySxoZaQtrJsq4pNdMK5ymFElHLjwSXmmJYhkQgawujGgTfNgl
         vylvGnll1MHtvC4+k+fB9R2COw/ehoYghMml9JumwEvZr2AApBFVWw6/uruOaQZBc230
         owvvq0VJ7QOmbiTKTu3tHVLTHcmqo6PpJx5dzpPBQtbFr7Pz/qlOW5AFCiq1o9i2O8RQ
         iwvcMFcjI6WGlSYRCq+e9LwcwqL3VDQ5Hbn/NQgQzzJl8jwaM6ddtHGs/9fs6lRwDqvD
         FT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400932; x=1793005732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvZO54TWJTuQkZMeWHo+KL3t3yCuPUOF5hA+fz0b8nk=;
        b=Ebe0vEkDRmhZshbDEnxw3cDaxRVwkggWQ6PY3wWNKX4iczpBblFkqw0+LfIf8pgqrr
         EwoqYuk9bZ4VmnSsnwdVVTVPignC2YeOa07fe+u99orUUtNcdoXmeNIbrpjweEg0BYZ8
         uTXFocKQWSydxraOfhZW7ogFTlToaJFSDc3TkNjEAajo/ExLeMXyPMPyXEdhEKuM1+lX
         hh0EaQD58SPj7IOA0yvs07JVbtm4Sym3vhwHibCddUSIkKIK9+3jPSjAx1XOD8w7/xUE
         KYD1F/DrAlfv3FykEn+XYPJ6nYL66qCrpRoLHlfkEO7g+HMo3qG80/pPiUHgZ6Ow8SFv
         HH5w==
X-Forwarded-Encrypted: i=1; AKwUvBzMMY2ETzmVD4xeAKa/jmNI8AdREd2o0Flypf5OoY1qoLyKWbRzycK+lxB1H/NBgF9dJX+ilrCDVfZGGsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhTn1CK0hvXQcmGkR1+qjOFpUmeUCM+J59WMh5GuvYt8VONQ/F
	kM1w4Uasnd78kWVO0OkpI/UisTtjyRqRPVe8qU7IHx1BrjpOLQNV3cLR6Bh2R9wBRnc=
X-Gm-Gg: AYBFou3hnNNiJonw5iQOvoc2LF22WbDoJ5hDGZ3Vhba++qOYrwlgeXICuE9etMWAxx3
	5ioXgbm3DIUxy4dEbTLtKUk+iKDSNVkK4TsW3fHAautd1wVrf1GpZOgDOT5r8OCkLfpvbTiD66A
	jGrdh4nNJybeJJDaZYpmWFBKrBn1qtMB8HNwEuypQtxyhrjhQ/U/Vf346CujADOIzs3GtBqNiva
	nVLdXj6fBlHUaUSAJ94x6oy2R53gV9tzMaNlYevlWYLF3Ga45xvEE9+P6OJzNFZZ/PTh4AFOE3T
	WrC70Qc5hMeHm5qTA+lzUJX8728jsXPJvKqAYyjOJ+no1rPMYqdcCMdS9SRLSsFoOgkLGa5CM/V
	5Gg8QGOAQT3vbkxRv65U0GSsf4fK4B5YqJl0/BQ9qIpSb0eljxSnJkwvj6hwiOikmBun+W/OkvO
	Qv0klnwoqYVIq+nH/ofd2HAYq6Kl5IV9+/dBWF+Pfa/M3VB9CtxffCgE3kGYZEFaji1RLYVljwF
	wg/sK7t7wnRz94rgrrL
X-Received: by 2002:a17:902:e5cc:b0:2e9:4e83:1961 with SMTP id d9443c01a7336-2e9a6a0283dmr60030985ad.22.1792400932347;
        Mon, 19 Oct 2026 02:08:52 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e305f1dsm36707595ad.0.2026.10.19.02.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:08:51 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 2/4] powerpc/mm: map shared vmemmap tail pages as read-only
Date: Mon, 19 Oct 2026 17:08:28 +0800
Message-ID: <20261019090830.1917657-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019090830.1917657-1-songmuchun@bytedance.com>
References: <20261019090830.1917657-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PowerPC radix uses an architecture-specific vmemmap population path for
shared tail mappings, so it does not inherit the read-only protection added
to the common path.

Protect these mappings as well so illegal writes fault instead of
corrupting metadata shared by multiple tail pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 44868b62b14e..ebac5f9058f6 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1059,6 +1059,9 @@ static pte_t * __meminit radix__vmemmap_pte_populate(pmd_t *pmdp, unsigned long
 
 		VM_BUG_ON(!PAGE_ALIGNED(addr));
 		entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
+		/* Map the shared tail page as read-only to catch illegal writes. */
+		if (reuse)
+			entry = pte_wrprotect(entry);
 		set_pte_at(&init_mm, addr, pte, entry);
 		asm volatile("ptesync": : :"memory");
 	}
-- 
2.54.0

