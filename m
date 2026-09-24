Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489C42641B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232864; cv=none; b=G0Fnibc9fp9i4s+9C9MXvRwrgnp8XscTH9+8k3zArM6tWf7eUsH5wGqbEbqNK7bhOLcbxuzUMQhHeszXA6Z8wyyXwdJ3Rsy1vQ3MCYJVdBVGWJSTL+swdFsNs4uog1Qki7LzFgkLP5jmIE6yzwgxXSccVUuH+qRCK97KuYSUYzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232864; c=relaxed/simple;
	bh=G51B54owKuBfMBL6BmQ3fz1GoUN0Axehqo+N3yadsZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGfCBlg3kuj7nZZBL9a2D4pfRcc1Infa2lu08vRGRwBcIzZyT5I9t9F4LYRQCWVJ17Qj6OjzGWSfeX3/cWB8CNRCrHmue5FZjvgz8CYI/VTiU1/vDto1gq7YKc9RavpNvWM+31gaRaVPx9WBNbm3DaIRqxPzpdlMWkPd/ubqFJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=csuWkobV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5iCKh4w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="csuWkobV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5iCKh4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790232855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
	b=csuWkobV7AR0/0ikrVcxv1tIMzYCRSkqqESrCJEmsRoxJ1vunVQys8AsTV58pjQO3TcisE
	7PWhTT4tJmsYsueovM36/Riy7vijN8F+NH+BTtF3QOYLOdvNN4kdR8uk1kZCm4mut/7u3v
	juCzlBSW55JL61VAvjFDnrgeSufmd1s=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-xFT3pKH2NSuhBCouvYicQw-1; Thu, 24 Sep 2026 02:54:13 -0400
X-MC-Unique: xFT3pKH2NSuhBCouvYicQw-1
X-Mimecast-MFC-AGG-ID: xFT3pKH2NSuhBCouvYicQw_1790232852
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a27d89a894so7818171fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790232852; x=1790837652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
        b=e5iCKh4wlZKJ1iGEkx5EMiOuFQpDHTje7tQgznZXHhGUxAstjMu0d9RuzprjwQ2zmv
         EN/+t29cWHVjHG2KjUwrTurbPubqzgV62xM94XALyxdm3yfcFWRbZom3pEKZB6Kp5bSv
         bHPw294TFHnWqelSaI9B+d7lVee5VBrkzSA8cPfURws3h45byftaqVvqQzyEj/ZbdtML
         FmRnyFto8Im7poQ1pYBFxcI9TjaI8WZ2bYdARDI2NBc0R6j5i5HAYv2MapRpdAeRUmks
         orpqiJhsXrRsGMjW4+xNmjpZ6KUzrxcJHubCMyWRwZI4zDW4mawt6wFUrMMmixBcElvP
         gVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232852; x=1790837652;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
        b=KGsDGR4JjXUZQcG0DwNv1ubqXBldAlesX/w8WhwUafluLsvtqL+KAlQQ9AjiweOXHi
         PTv1I+Tekf4u8EclZqsNnf7bjG+RV/TBnLHNwbQulm+03WmAia4loxh9qL05RzGwjbTF
         Icx4iBzToHbLM6tsQ8CUXxx7TeyZfbmgzJXEdw0KB8/vuce9UQbNFiZIsM/hGMG9sesH
         ZZpEwuy2NYP5RBCubb9vMB6QeJ/TdPOaHoJhvK3EFjH3bVQ7RsHxeOUfWG7/BmgpPK2V
         sz4kcWwrv8fqUafxO72r36xo989GNniM9H1Apr07qjmiSCgoaf3rbYjrF/BDc2IKtenr
         ze1w==
X-Forwarded-Encrypted: i=1; AKwUvBwF0uLPbBEwtILxU6gdLpIg4aHvME44CT8o7erl+l075aCrZmkCo1mWtCuHomuvSrWCtYfml2767yP9fbg=@vger.kernel.org
X-Gm-Message-State: AFuF++kwex1UBY1eQd78mK1Rj9mEk4/DNjC85GqjL9rEu72a1E0UHzij
	tFu55/AfNRvR2tTc7sAPDhhwU35U0nj1gm9wTYiCfMuaa/Df9+mCy1gm4jojHs/rm/IXth0EC1e
	7qOPLy2BwmEWiPo8tD+ZikkUsQ58xB4hRqePPRRoekXeNzNMg/Rb9NSCfY4LQ4Wii
X-Gm-Gg: AYBFou1/EyvDdOuUZc8taIgb6vPXgT6JmczSvX4NGyh4ZOncEMu0KBI7J6zDoSHIpTo
	9+6ODvc5EaC/8bSxjUOaBnxYyGnnAVGB2fquRCDpws9kZc61zxkcdrM7ibAoFR0c5eJ/jUGB4LJ
	xumN1WEn7YgJzenqXJXmwOVVU1dSJkPfIgxY+D1G/Q9o1S0WD9tXpvPb6ZVsKGGNvYYSD5LKuow
	A5pRbR0Dfb/uWzbViv1kCd6qVr468H3cSYIFsT1ObCEofKncBz4czePFWBtjhebB6xqBwg0S9UO
	S4qKl8fz4X6XPmAjWEzLQdHNHtqXe2It5FG7WYcVNzDQdoRW5TlGZ3eVvX3plUnlXx+NXQVr8be
	8OayeWTh0hq/6bNtkLkuA
X-Received: by 2002:a2e:b893:0:b0:3a2:f233:5c6e with SMTP id 38308e7fff4ca-3a63bf652b3mr3928291fa.6.1790232852068;
        Wed, 23 Sep 2026 23:54:12 -0700 (PDT)
X-Received: by 2002:a2e:b893:0:b0:3a2:f233:5c6e with SMTP id 38308e7fff4ca-3a63bf652b3mr3928141fa.6.1790232851558;
        Wed, 23 Sep 2026 23:54:11 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:54:08 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v15 11/11] Documentation/mm/hmm: document migration through hmm_range_fault()
Date: Thu, 24 Sep 2026 09:53:13 +0300
Message-ID: <20260924065313.899730-12-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Describe the two new MIGRATE_VMA_FAULT / MIGRATE_VMA_WRITE flags of
migrate_vma_setup(), and add a section on driving the migration
collection phase directly from hmm_range_fault() via HMM_PFN_REQ_MIGRATE
and migrate_hmm_range_setup().

Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 Documentation/mm/hmm.rst | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index fc1b8dc19825..58424e5f5873 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -348,6 +348,13 @@ between device driver specific code and shared common code:
    Currently only anonymous private VMA ranges can be migrated to or from
    system memory and device private memory.
 
+   By default only pages already present are collected. Two additional flags
+   ask migrate_vma_setup() to fault in missing pages first:
+
+   * ``MIGRATE_VMA_FAULT`` faults in missing pages with read access.
+   * ``MIGRATE_VMA_WRITE`` faults in missing pages with write access
+     (implies faulting).
+
    One of the first steps migrate_vma_setup() does is to invalidate other
    device's MMUs with the ``mmu_notifier_invalidate_range_start()`` and
    ``mmu_notifier_invalidate_range_end()`` calls around the page table
@@ -427,6 +434,38 @@ between device driver specific code and shared common code:
 
    The lock can now be released.
 
+Migration collection through hmm_range_fault()
+==============================================
+
+The collection phase of migration (steps 1 and 2 above) can also be driven by
+hmm_range_fault() directly, sharing its page table walk. This lets a driver
+fault in and collect a range for migration in one walk, which is useful for
+migrate on fault.
+
+To do so, the driver sets ``HMM_PFN_REQ_MIGRATE`` in ``range->default_flags``
+and points ``range->migrate`` at a ``struct migrate_vma`` it has filled in
+(``flags``, ``src``, ``dst``, ``pgmap_owner``). Usually ``HMM_PFN_REQ_FAULT``
+(and ``HMM_PFN_REQ_WRITE``) is set as well, so missing pages are faulted in
+before being collected. The mmap_read_lock() has to be held for the whole
+migration, since the vma must stay stable.
+
+hmm_range_fault() collects the entries the same way migrate_vma_setup() does,
+taking a folio reference, locking it and installing a migration PTE. Collected
+entries are marked with ``HMM_PFN_VALID | HMM_PFN_MIGRATE`` in
+``range->hmm_pfns``. If the page tables change while locks are dropped the
+partially collected entries are rolled back automatically.
+
+After hmm_range_fault() returns, the driver calls::
+
+    void migrate_hmm_range_setup(struct hmm_range *range);
+
+to translate ``range->hmm_pfns`` into ``migrate->src[]`` (``migrate->dst[]`` is
+zeroed) and initialize ``migrate->cpages`` and ``migrate->npages``. From here on
+the ``range->migrate`` struct is ready for the rest of the flow (steps 3
+onwards), i.e. migrate_vma_pages() and migrate_vma_finalize(). This should be
+called even on error, since hmm_range_fault() may have collected part of the
+range before failing.
+
 Exclusive access memory
 =======================
 
-- 
2.55.0

