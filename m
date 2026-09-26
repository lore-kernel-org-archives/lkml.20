Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34174252D5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426514; cv=none; b=bZS01KNHF4NF7U3ir/+knimqRDUpVkpQpUXFmx3MK5EktFmuKSWYiptRBGW2IbJ5A5e0jnshrHl5ikXBEK3lRkuXErwvLa/iAAk1vzVKXGJMbNZQyT0tfeo/qBczCXeSHgNNEC9ywzp4GE3lEvIVWuBiBeZN+swIH026ikfCdW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426514; c=relaxed/simple;
	bh=6dlh6yLyxL+qjxy+1dya2aQDdPRhNTEc0iOCCUQ65wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqJ0DgDD+nchm7YHCBKrvKwAe8hwPHlgEi5czJ6JdwZFEABmXQ9f3zF6OS/RqALNFukHSih+APSTjr2w/rQb1H160VcpDziXk8SpftEpMtyGHzYW00YAOV1Rz//pf2aKZuEARDQUdHKqhjoNbdRSRAupvref+ce0sJR/f02MUzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFpOPUQm; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFpOPUQm"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso1051142a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790426512; x=1791031312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2zTAQUGUmuhZJVF/v4ua+yizjtFuipihK2DMp9YoGo=;
        b=qFpOPUQmYz85NKGQOAkixSlOPWvFHnUHOCDWBPBn8F6Q6lRA/nTHPfEfV0XAfH6upM
         RejlOr8NOBKehlyDxmxj2ijbbZDEMKuf7SMSAHQKA4k/c56jmWxv17A+8vU8pwqFNzMO
         jViCD94MajYAz9u0JXkxxZJPVF6w4X8I0udwjptmrJ4HRtQ4R/RfXrNs99HZlJcHu4x8
         c0vSTljkLrvocO6yj4Hz5H/jEEBCXoQAdFazvHp0k8EaDf/xrif7RX/XNr7abgZ0i5iD
         Gq6K1d4xKufLyBc05kT/aW5J6+4jW9RhUYO071kLPZKBROgjG3WruLRN8fg+zHRMQEQG
         44Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790426512; x=1791031312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2zTAQUGUmuhZJVF/v4ua+yizjtFuipihK2DMp9YoGo=;
        b=0oH66Gxg6BGEh6uRizPI2qTU6MipG/vzTzI7oe+OmD2GmYOH2EO9mlus17a73GRpCz
         m8XuH8h0eZPuvTZIH7kMhigJDIzKd9gCaof8S0gvm0TCk/PRaQnCGEjCsf7cnYWSJw9X
         PyWDZcZUDiTMZdmqFVlSZesl1DBP5dreaP/QgeEeEBZzLLnFuhU1Lwhjln4HpQytXS3l
         nVYhM4p/jgz7IZVKcrd2L+3y2AHxaycIwN5FVqF6sbl+TLW4y71+/LhhIzspAWXmDasd
         QCo096AM3JNb+MmqP8wCeffuCqDxgSC7k+p2rrPS1vr9ZbLxXFyZ7RAh66zZ/dC+JE/8
         CxLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxngnh38falavqi6UC8CUqQ+KkwXmP1HJ3E5+WZxracbKy0PfgX/57I0yP+3fVjL6YMm6szgKjBEB4iidY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDtn0Q1jD1/VOAcx937Lk7CvSLANVZimmZdT/BMWsnEhBE5UHL
	nu3KJ9dEpawBg+zR+nT/0aEbb/HY/818pu20oC/ou+WJEczZxCGHXno=
X-Gm-Gg: AYBFou2Nayuo96qtJMr/+ptVA3QhqCQLxjPSjYepbmXYVWuqA6QlowKVPWEuykqLufa
	70OwOAYTAgFSqznmISMxKHw8+myE367P7L0A6JO+ZSe0yYTHTuWgwnMsqIlqaey3Wn1NyYAJ1ke
	4K39ZoSS6TDU/1FA8PIfgl7D2KXAZTXVP7pmaFnipcSEhT1dXKrTP7HzJI3IPnBlGlF5d4q2lrG
	1D6ro+PWnHn+4PM5G7V86aHnzNAMlscnUTVEhH8idPJzpzFup3/7j1ZwK80kNFiPG2Xm6HtLAtP
	f2QDQYKJX9UMV0zpYAgc3+OfxaFQy9yIoyFMqeK0dANIFDHk97C5skJVKfX3xCw9cuDRWpRvBNY
	k/oFgz6uZVrMxUXwnlUocxEmQeH9mDAmshOFmJrArTgKM54wNod3UTv0yIjVTYTfuhX2gYhClrU
	tr/uc9a7Q1+AgBaKfL2bychn0Mb34/n5Nd1qOkbd0MUtlEK+DKVUdM7a4sVAaBEAOx2wL9FNh1V
	xDQsRCfch38uzoTb7vzrucVgA==
X-Received: by 2002:a17:90b:4a87:b0:3a0:a18e:bca0 with SMTP id 98e67ed59e1d1-3a0bb60e052mr3893421a91.31.1790426512107;
        Sat, 26 Sep 2026 05:41:52 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm5965212a91.16.2026.09.26.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:41:51 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v3 0/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat, 26 Sep 2026 21:41:43 +0900
Message-ID: <20260926124145.2878520-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on a write-protected or
RWP-protected source lands in a destination VMA that was never
registered for either, and nothing clears it afterwards.  Patch 1 clears the bit, then re-arms it if
the destination is RWP-registered, which is what the present-page and
zeropage move paths already do.  Patch 2 adds the tests that catch it.

v1: https://lore.kernel.org/all/20260919004630.1159895-1-donggeunyoo.kernel@gmail.com/
v2: https://lore.kernel.org/all/20260925042907.2330519-1-donggeunyoo.kernel@gmail.com/

Changes in v3:
 - patch 1: describe the userspace-visible effects and the backport
   (Andrew Morton, David Hildenbrand)
 - patch 2: drop the MADV_PAGEOUT retry loop (David Hildenbrand)
 - patch 2: add an RWP case (David Hildenbrand)

Changes in v2:
 - patch 1: clear the bit unconditionally (Kiryl Shutsemau)
 - patch 1: rewrite the changelog for readability (Mike Rapoport)
 - add Assisted-by: LLM (Mike Rapoport)

x86_64 defconfig plus USERFAULTFD, TRANSPARENT_HUGEPAGE,
PAGE_TABLE_CHECK_ENFORCED and a swap device, under QEMU, on
6812ce4e4379:

  uffd-unit-tests                    before   after
  move-swap-wp on anon               not ok   ok
  move-swap-rwp on anon              not ok   ok
  the other 103 unit tests           ok       ok
  uffd-wp-mremap, 38 tests           ok       ok

  11 unit tests skip on both, as CONFIG_GUP_TEST is not set.

  pagemap bit 57 at the destination  before   after
  swapped page, dst not armed        set      clear
  swapped page, dst WP-armed         set      clear
  swapped page, dst RWP-armed        set      set
  resident page, dst WP-armed        clear    clear

  MADV_COLLAPSE over 2 MB at dst     EINVAL   0
  fault on the moved page at dst     WARNING  none

Donggeun Yoo (2):
  userfaultfd: clear the inherited uffd bit in move_swap_pte()
  selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry

 mm/userfaultfd.c                             |  1 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 84 ++++++++++++++++++++
 2 files changed, 85 insertions(+)

-- 
2.53.0

