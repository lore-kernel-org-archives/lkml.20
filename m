Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BE054CF6D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955079; cv=none; b=dFLzl31PtJ8CiLsICheOqr6SvJnrhCa1E37e9PGxn74gDCfah9nSL+nQvWVBsWTd47H+GoVI29UdzhqNMvBeU1pAW/1UOhoiNP78IMG0fsDuRRi79UwpYxj6/rQtnN0pNV/Lijk41FExycHAyMHrNeDB03WrQ/NY84X6Wp/y84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955079; c=relaxed/simple;
	bh=mxBeoS2na9eZ95CxFJ4Aoka7L/8GC6g1J7DH8U7ZYoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4sY5vuZw9mnBWh07+DmP1z7EcizT0gBCbOisF2SVcRl4NY+1en0ueVhc+fghDBGjFHP/K/PacPdvJlqPT1xR1EY+QIATJ96KQRjDRheo0iQefE3bRlFIeIcQLlu3JvOlLMoNacj8tsORqI4wzZZD372/Ymn83yYMgcc0PhP5bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2Fpaf6u; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2Fpaf6u"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso91998a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788955072; x=1789559872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=skQiOQP7wKiwMIoirY/KNv9X3P0+d+Yd863CB9w3fDY=;
        b=f2Fpaf6uA2C+4+EWEWvI9uVFhH/n5CsGbX7QKA2sNE1kfofTdnwWGFSCJ7cEJNUEsQ
         OSeB7imy5NTlHxxaHNqOM3JMZG3O0+d5B/rNyJqMVf8jtCzz6pCMvO947aUnPZxOcwN0
         eIrxjg0R4U/5U/tNJXkQvY1GzMeYkny/sShTHhxqmtt5Qn4PU9U9BTZ/7unlD+dajcWx
         UzyKgN+3Q0rjva8H36Ka1YxAP5FWuMJQOdwiSQEf11k+Y8SPapH8W6u0EJbxWCG464tu
         V8CMeIiF6H7d8pjro3gdjNVw7fMed+Fj6guZaiKkBumvlU4VmlDwf4IJyYZZjNGW7R11
         pBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955072; x=1789559872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skQiOQP7wKiwMIoirY/KNv9X3P0+d+Yd863CB9w3fDY=;
        b=efVUwU4fo0p4s8mggaTuIa77UfOVyLCKhcWGGlrwxVOoYSOHMcESYfudq4ElyraDtA
         mzp2g88VaPbj9jwc2c1IYq1wv6D9yY4CPDh8MuHKCz9EHGINMH1tMDSOPmX+F3z4dkMb
         UvJUOobFMgR2VkukTQ11oYebYpJ7FgFeEdnZ3Il6sE6tkovBBr6DF/R/sCE02mqDCUoR
         tT/VvIfWTm1JWiyBAm4D9Fpva5I+nVktZ/teufNxi/yVsiOIQuTYsQZ9vmA/v2IA66RD
         3LIwDh5f6q3sjH0lR1EwjrP65VTlphPt/nLsU/02pe3phP+hXSfXIukhGqvgmeJoynyG
         Ur0A==
X-Forwarded-Encrypted: i=1; AKwUvBw8cbySfeufP7DoaP6XGg+AvOWixX3EohoSZWglG304f7tRYtIHhPYODljo/uXLyiKmZSWLNjUyURHnGg4=@vger.kernel.org
X-Gm-Message-State: AFuF++nDz2cxcxQX2/+G/PwfBK71AC53oNaQjUBMSlTQyqsb3xbnRrsl
	O1EwYgK75Wh660F3HGEV83kMCCKXWtj5BJa+L7UmVM32GWaPVeFCM2OG
X-Gm-Gg: AYBFou3p76yNMcylKqshNmBmYGsfR2oyIU12tHd46GGdrKq/OHKodINAp//R6TVnJZS
	5buddlAGN1Hjh98z0b4pMxxDjcCyKYqouCLf4NUvYmDmwPzsGBCxl1mrBGzX1IMFO1f7s4MNp5j
	uVvGlBMkcAEXNf/KHnPBjkaJyDg8Rj9k7USb+KNiRTBHz2UxQ4ZxvMVVvN0UqV3kRU5THps2mqA
	jAPVZ5OOmMTass1EDF9mKt8iXXpk7WblyxfZ1PIvLpsJuyH1uEGE4XITTpR94UEIcOvT2d58Ty/
	i+5oz+e0mrmxq1JsdvFdZUaw5w6aPQguybstE/MlFil4UQ4Re6EQfxRGka2pgEgExbbep8MHr0e
	PieTBnfTm7lx5Ku7ZAgRQT2FWzxSxAl1iAXW9UtAU4r6zLZz3meT/YbM8yhn/hTDVtMyiGeGJAW
	pEk8UtyNBV5EwngM++9iWHSQEjS0+BxmzL6Ga8kz/CrJcjyIsatAbwWj5/lx7QQQQm7lsMiyvD/
	bg7DxCFGaxw0ovitDELkyIG6JFNxVf3XqB5N2zAbPu2GgLoYyXswnarHi0AAfrR
X-Received: by 2002:a17:90b:1d8c:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39d70baf4acmr444308a91.18.1788955072012;
        Wed, 09 Sep 2026 04:57:52 -0700 (PDT)
Received: from fedora ([177.21.143.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm39619067c88.0.2026.09.09.04.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:57:51 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	willy@infradead.org,
	lance.yang@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: [PATCH] mm: bypass datarace check
Date: Wed,  9 Sep 2026 08:57:23 -0300
Message-ID: <20260909115723.528501-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despiste kcsan point to a possible race condition problem, this is a
safe race condition due the access memory ordering, since
spin_lock(&mm->page_table_lock) have ACQUIRE semantics and ensure the
ordering mapping.

Create a new function called vma_is_faulted(), that return a
data_race(vma->anon_vma) to bypass kcsan

Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 mm/memory.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 6b8280cfc1db..d85d67927400 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3800,6 +3800,25 @@ static inline vm_fault_t vmf_can_call_fault(const struct vm_fault *vmf)
 	return VM_FAULT_RETRY;
 }
 
+/**
+ * vma_is_faulted - check if a vma has been faulted
+ * @vma: the vma to check
+ *
+ * This is a lockless access that may race with __anon_vma_prepare().
+ * The race is safe because:
+ * - The fault handler ensures that the mapping of memory is ordered.
+ * - If we read NULL, the caller will re-check
+ * - The page_table_lock provides ACQUIRE semantics for memory ordering
+ *
+ * Return: true if vma->anon_vma is non-NULL, false otherwise
+ */
+static inline bool vma_is_faulted(const struct vm_area_struct *vma)
+{
+	/* Lockless check - safe because we re-validate under page_table_lock */
+	return data_race(vma->anon_vma);
+}
+
+
 /**
  * __vmf_anon_prepare - Prepare to handle an anonymous fault.
  * @vmf: The vm_fault descriptor passed from the fault handler.
@@ -3819,8 +3838,7 @@ vm_fault_t __vmf_anon_prepare(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	vm_fault_t ret = 0;
-
-	if (likely(vma->anon_vma))
+	if (likely(vma_is_faulted(vma)))
 		return 0;
 	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
 		if (!mmap_read_trylock(vma->vm_mm))
-- 
2.52.0

