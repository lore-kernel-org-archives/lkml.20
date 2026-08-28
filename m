Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6A37A83A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942215; cv=none; b=oPLQaENVVa4Phco7mQ3CtZO6fjlPIY1zMs69SpfhTIDWIjkNYx4URqn4U1E+c7BwiZltyvAafA5Z4ZQFI232NDDehMqQUcdmMqFlQPv+lB8jgJxjVdS5SjlkraStX6+OtX5TJ/Xjf0qQYYYrexQddVUpXAbDUNkQ024VNcFhekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942215; c=relaxed/simple;
	bh=4ZsGhHfHxPHNWAof/vdVV/px1QZlM3eSk7QJeULeoF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=myHLe0waf9mfMmy7qkq7wBluEZ/coXzKiXY5Wqv0zLn/09bqz6VBX94Q2pN+SqEQd/vQSEA7lrV9e/wYhXUfSeXvRwodr+pzy3sB6D/nnPZSMp/I1T5L6418bTylGhifop3GXcg+lZj2ozYNvCuvrJWuzUddSXli2wTyFjUhXWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTHoINSK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTHoINSK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485b358552so1233622b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942213; x=1788547013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tj/6UYQts00alOowhGV+RewyQyJrbaYQ35fI8AlyfYY=;
        b=VTHoINSKD8Qtr3SDZN7MpPjsL5nvA6upECcjGA4VyomTyOGbzZHYsNwFe5SL4RMdJU
         lxnAg1xjFh1pALKwWPE07AWQ+oaRvknzwA8HSD0ctmdQ1MQJk3hzJAAL4ThYZAtrP+fP
         vFkc8tkAsPYb8WivlYpFJkr9NrmBJG/tb68auxOQiOwKHFi/dp1rAaFcZ2Xdjy2iPfVT
         nxV7II387oNwyDcfv9io7fCgooCFFnk+LGIuZI0cY9qfztHB/REiMg0cn29772b7OHP0
         yrJspzMfC9aD+Wim7saO9fxy6iFnUldwMtMtwp6pYJfJlVyexny7s4HG/IsF5uUIYQUO
         pWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942213; x=1788547013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tj/6UYQts00alOowhGV+RewyQyJrbaYQ35fI8AlyfYY=;
        b=AX6LaK5FLHo+KdekTuMtK6OZwE3YaQPtAU6iitITzWwMvHfUBAMfYN2bNf7IRv9Ggq
         ZHHU1jmW/IFBKbA/+xmZkK1zVSu4esJsxGl1nU09zQy/RV7M12gZ1/UjJh9JRFADrxCi
         PO8uM0I5KrPW5a3pRYUW8FocwDWlzZkVVEfR/P2CgfFYjn7JDuUWlPPLmKOwg0s93yZO
         KzZfZ8Cb/H9ZfcOMJcPFJ5uyTNQzIb9NVff6aCZNrGftqAgME3VYhxdruozfDw9Lwtzk
         tl+O3Ri926wSTUWgoV7tN9iZXiXUFeGrA8iHQjKJD5uSVNWJoCg367RjrTpQGr9LsBAB
         DQ4g==
X-Forwarded-Encrypted: i=1; AHgh+RpvEeCdAq6RPqFoUpDeqbMEMkm1vPl7A11X6ZDE81R9t6mKbY0fKB88pEmNhqrp/NJt+7PXwPduxOI8+4I=@vger.kernel.org
X-Gm-Message-State: AFuF++kF7JdbhN7b498jGIaqNUgvESC+/Esq6OmgULi9AVy4lH+qSDB+
	/oHtOBizqMnS3vAejvLraJMErTiWnFIeiap3uhaCuqmBgckoESqjq2Rh
X-Gm-Gg: AR+sD13msdSrCpYa3N0KTBfkskM7/3aj9XM5CwTGtTYSiu/n8NKxPgM+xKHL+VKDYSe
	VvmtI8wQWyGuX4uF9xeofGJhpZPDnfA6a9OM1KHpd6HMlDa/t4hbTMSa7DSVVXsN8mpBK8DOfmE
	FcTYx1A688RxPkJCFc2O0m4vdmaee0a17FmIo9RPoZNYKRz+2tfQDsFljY0hR4lPR0xuzTc+j3u
	lnupSliLTlVINClbFnbynjw/N8g24iNsHLY7kTfOkPYIrzwdBkig/iMScu+u7hIbUHHW37Hnown
	upjECE5dwGTgj+iqpHDn3EDESVKBu2/PsdsIjYEwfJmCQqdeYtK7ouQuulaOhsVhBFzB/qf76aK
	a9NE2KYnnROTQpVn2uz5VkaT7S9byFwRasnxJKOjdOyB8NF5jwqusx8H0XwtzntnZqA6tk0OgcV
	mm66LWfF9L7CraV6Su6E/gRa5D5vd//zK6qK4FU5j9yNvdC+Of/lRrG5oxqOCfCqwgeOza8zpK+
	lniU+zEWfK2u5wi3g==
X-Received: by 2002:a05:6a00:2ea3:b0:855:1590:ba2b with SMTP id d2e1a72fcca58-856285920b6mr16244293b3a.5.1787942213289;
        Fri, 28 Aug 2026 11:36:53 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:36:52 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 0/9] mm/huge_memory: refactor __split_huge_pmd_locked()
Date: Sat, 29 Aug 2026 02:33:10 +0800
Message-Id: <cover.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__split_huge_pmd_locked() currently decides from the VMA --
vma_is_anonymous(), then vma_is_special_huge() -- before inspecting the PMD
entry, so split and zap can classify the same PMD differently. The entry
itself should decide. The function also mixes the present and non-present
cases, resulting in duplicated code.

This series uses the PMD entry and its folio to decide how to handle each
PMD, as zap_huge_pmd() does. It separates the present and non-present paths
and moves their common work into helper functions. After this change,
__split_huge_pmd_locked() only selects the appropriate helper.

Yin Tirui (9):
  mm/huge_memory: read the huge PMD entry once when splitting it
  mm/huge_memory: add and use huge_zero_pmd_can_split()
  mm/huge_memory: add and use unmap_huge_pmd_entry()
  mm/huge_memory: use normal_or_softleaf_folio_pmd() in the PMD split
    path
  mm/huge_memory: dispatch on the folio when splitting a huge PMD
  mm/huge_memory: add and use split_huge_pmd_anon_rmap()
  mm/huge_memory: add struct split_pmd_state
  mm/huge_memory: split present and non-present huge PMDs separately
  mm/huge_memory: unify the migration and device private PTE loops

 mm/huge_memory.c | 525 +++++++++++++++++++++++++++--------------------
 1 file changed, 302 insertions(+), 223 deletions(-)

-- 
2.34.1

