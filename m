Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613D41D20C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023444; cv=none; b=BeWSRj9qqZC9u5EetLebIItO2AYEMh2BYN7MtadxkTw8K5/fGTSjMxzAD2YTjtxR7LlWl/rTBLk3ZPet1BhVkIMGKqK53CiOXWXDcVKzaUGn7tVFQN+4dGDh5+pSUT064L2lox1Fi6dU0Le6pP15nqC9I+Q0q5UGiaEqplyFwIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023444; c=relaxed/simple;
	bh=kUSPUwbix68rAzascc7JVGxipvu4edBvCRCwo/tJwIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y8ObYxZn4sgYUMrT8f7qXSoHmlKqZ1sMeWmNJL2THzydHc4w4Ty381TV5VO3LE0DwVz4Qp9hnXqX9h4Xt940n19np/5MU4jVtuSHBdcHocJWHsy3f0X+fDJjYGYTki3ofcZAcyx4JgOLMkh8gAD0eLMod4xaNBeQsXurgyaEe4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4hTKU5/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4hTKU5/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso103688a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023435; x=1791628235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPZq7gjHJpcJmgR7EaOFKtvjMOo9Jsmtk8qeZDcxeRE=;
        b=N4hTKU5/5E6OI45gvGrHucztR9ZOL5bDnHYQcwchRPFTkS3XxjDAsUK0PYZHisCmzz
         9ixQaEbDRullHcW499wD5grR08/yeyt8IsY8thDrDVBCyQQl1mplWDPGlQZEJ8j4XHVD
         w5wayrzbuG+W5k5U3ELymrhob5XUPPjsD9XuyTaloUbjUodpfexY+J808xj7S6dbVgEU
         N/arPyFuQqnJKqw6CDi6saRHyHVC/ugjAm5fYrn/80QPsH4k6+kOZBFeg7HST4IcyNQj
         23EXZirGCWap7QQJKsJ2AYT/riSuIUfUAtu2QQYLK04PDjXT+CeY5JcDz0xX1cilHBZP
         p2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023435; x=1791628235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPZq7gjHJpcJmgR7EaOFKtvjMOo9Jsmtk8qeZDcxeRE=;
        b=06E9olHhKwf4YM1YlTF9nHXAlNoBRKxC/LUddBlzDrOWcslcguiCkf8bzacXiRsfDn
         aFfXZ1VxKf/vHzSTW8zUx30kSTDLgn+I9KUot+8Y+5qtIPgBJBUuwrJ743/uF3q6qEKt
         fcCrQYEujKii8e392OuEql1yj4flA2XfwenoM1mLUBa27aQRJKR4PNC2IR94iQTvDiCA
         Jw2+cEMYq8o3RutIgiJpSl7xOwSGWBjIk0tVlKj8fVvTjCEDajlAexxd1wZce8sz48Ru
         kmpNl15lTRUFqMR68fACt9qSMKWj6W0RFSZXU5W/YRG+DCvR3lfw7ACl8xcQfxZcgeri
         n3dw==
X-Forwarded-Encrypted: i=1; AKwUvBxW2MnVECVB0+SAbPEGtw0gtfRXTdZDUEM9zOe08q52AgLOy0ZbDkP3mbGpcRdg2Rewm8XAINl4+99kGS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdWd+aW4/aOEIa1CL0lgnRWmxSodlr7ZbEy4kgLLq3ZnfF2eOC
	ol2J/uCGhj6ap2mN7fKYx/d3kl3jt8LIoZmfCqvApR0bCiaStCnyEn4=
X-Gm-Gg: AYBFou1DzVhUpoNcI2pwUDgw5rh5Wq/qL4hlhYUeeCqZaGE3u1VI9c9lDKRkrG69NOu
	U2iyQaGvtt7C6cnHUMvjT7kZ79ecQAAtojYZsmbuaUSCK4QH1ooEm+F4gB9AI8HPXP2onvthrzr
	/YPvKJFxM2f/r0s9CHM2/5lZZVNXugHx6rUhXFBRvdiAOD3dLWs9XAugMNnJ0tHsr3Xr1MS9tZy
	qSNFFs93oFah7hMqiKkMC0006PGZjEfQ8ULvCWS7okeu2oz8O8hbYJqvlF84fi1oktWckaVIPKJ
	1bStfA0ef/AMU9YUed8UwwCRu06l+M/8MyNlA198UaaxpMp2KgyKR16qxPBZrpFp0Xdue/JBppA
	vcNLy66/26oYC06cvOcj1+6e+rV3GS06joMMsnUSjxr891KxJvur0+C7wM5pwU2JMAJkRFLqECu
	AHvtUy42VkX4zsDKwVdUNNM+cXoMhUqPpY0zNqARk9V8sNtBhXNMLwfjqz53XrClTxw14gvnQtv
	ybDLsSG3F8zgeE3zKVm+vkdYg==
X-Received: by 2002:a17:90a:c105:b0:3a7:aa1c:476b with SMTP id 98e67ed59e1d1-3a7aa1c5b5cmr149517a91.31.1791023435221;
        Sat, 03 Oct 2026 03:30:35 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm2121961a91.4.2026.10.03.03.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:30:34 -0700 (PDT)
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
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v4 0/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat,  3 Oct 2026 19:30:28 +0900
Message-ID: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
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
registered for either, and nothing clears it afterwards.  Patch 1 clears
the bit, then re-arms it if the destination is RWP-registered, which is
what the present-page and zeropage move paths already do.  Patch 2 adds
the tests that catch it.

v1: https://lore.kernel.org/all/20260919004630.1159895-1-donggeunyoo.kernel@gmail.com/
v2: https://lore.kernel.org/all/20260925042907.2330519-1-donggeunyoo.kernel@gmail.com/
v3: https://lore.kernel.org/all/20260926124145.2878520-1-donggeunyoo.kernel@gmail.com/

Changes in v4:
 - patch 1: add Acked-by from David Hildenbrand and Mike Rapoport; no
   code change
 - patch 2: protect the source right after registering it, open pagemap
   at the top, and use a designated initializer for the move (David
   Hildenbrand)
 - patch 2: fail only the test case, not the whole run, when UFFDIO_MOVE
   fails (David Hildenbrand)

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

With UFFDIO_MOVE forced to fail (len = page_size + 1, local change only),
v3 aborts the run after 15 of 116 tests; v4 reports the two move-swap
cases as failed and runs the rest.

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

