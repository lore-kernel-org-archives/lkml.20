Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686645;
	b=XylDFK93B+cWjvHIdUokS9N3tK4gOJ96DUlaWTugwOApL6X065rYJbni9DGgadcWFBji
	 gHMe9c3WJAF9yPilSnnCJvuRUXQExR+C+PcD+Y8TWldepumOxkoPwu+q1tQWBA6byBbNv
	 HscFSDOmpA7DW6VztYyoTufHHz6uJB1vTNPi/z8pO0LUy5+5pysi3dYkwSrfyiu+H3RaP
	 yyxp88AapDkDkRSSC8pdk665YsVt7bq3QqsLG4i2DIgVkJOFTlbp2bdf/oiIDoLpeK99/
	 ycnqovnK4YPAxSsDg/E0OTpe3RJzSFzsxhciVrD22/5J92GcCpqu82mOasNVnXHwYEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686645;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TVuWgoTT0NSjTET4nXrhDaEgg40Gfb3itKSJW0X7/Jo=;
	b=UVRvSmX9rN5uVwAhG9XWx+mn+h1ITPamK+XCmATQEysCflP/+yFIVeECbZKUUkM6meI3
	 0Yr0thFhoM4CGAjy285tLl0vc9jgKnUzNbmiAz04BtJ6r7Zcc7olmvG+bSCau4dnUqeEb
	 M76vwFSD5edhUzwN6iCcrFoDv6WrTIX8uaI6oL96crWSLu4pKe+VF9b7G+h/hcO39APYt
	 SmXF1hoM+Opvx78cERTisy1Zqz9zeLBB4BGQY3AATFtm0XrbApvEcZPq8hzsVgJNPGXHi
	 o9Hfcr0bZILcuGN7ufhj0c13oi5if9BzoXHYIm221kuHMFDct4VuWPfrMz26T2aO+9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vpz2pNxY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ECABFTvp;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47473606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47473606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vpz2pNxY;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ECABFTvp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVuWgoTT0NSjTET4nXrhDaEgg40Gfb3itKSJW0X7/Jo=;
	b=Vpz2pNxYWELn+/j32NfSsjYeG/AtFHjj7GTCfAPyjF9u2ORAH2fzhzekQk3PJE8rVR8ymt
	kg2bBI00A3hUs6cQxtozsvqrAYvRGEE01cFHuW+AMk9RFMOvbAtxSFgLpivWzIhcpb7th6
	Ov8UcEVMdHX7hQdqvOYYIHORFxrOJIk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-d-VqtRqQNKm1LlJmyDxTWA-1; Tue, 03 Nov 2026 01:17:23 -0500
X-MC-Unique: d-VqtRqQNKm1LlJmyDxTWA-1
X-Mimecast-MFC-AGG-ID: d-VqtRqQNKm1LlJmyDxTWA_1793686642
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5be4b14ffd6so128873e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686641; x=1794291441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TVuWgoTT0NSjTET4nXrhDaEgg40Gfb3itKSJW0X7/Jo=;
        b=ECABFTvp8uki5gp7ds0g6p27wgX2/PIECFh/jRzfxhGg0hsu757FKIdO2rEGeopQwI
         RoC96dVlu0Ng+xr/vdmMHynx4us2agjxjmIUbx0tuurko30HUlIBzbe3aRIvgYXIRjXk
         J0rkPswZ8nlIDBwzkWFO8epICLXmHXI8HzMyTSZ1NEg/YTyv1dwJjpEInwKaPTfwEu5T
         Fj8BJnfgU1I9Sfdu5+1IVtU3CGWz0yUwaA9PPwF9IP1tnykEla4tOugY8Y0d7BnQg0j/
         wIZoQiid/4M1ZBfcxfmKiD1PWEGeSCc/bzU+F3U8tK1jUaDnehQ0RF1LSPg0rTAZoLPI
         +ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686641; x=1794291441;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVuWgoTT0NSjTET4nXrhDaEgg40Gfb3itKSJW0X7/Jo=;
        b=jLJxf7K0Su3r4letxm7W8ve2K9k1ESxUYorG4jj497F+SDM+JT7q+6IrotplDErIJp
         91ZFBK11prXSaMHDJIgWivnhVm3oVtD6SQaRh3QtdCz6JwHq3+3eGZtqULYzJUAoCayF
         XOBkPpsi4aILvESmFXKMtBp5ZDKxYcGINP6bWkQfAj3wQzsSBpOeN4Rokgmw9YA59mNL
         qNVh7efRkOglr1gy3sQF3dTD+S12k55R2UFO+GBBgoKApoSVP/M6kScn9mID4qOfWfvv
         c9yUImPDfNpInFvhJUYT9nYuhiSXFf8n73n7sfvkJxOQGzweqfsv+RxEODf/e9/TMHyC
         Khmw==
X-Forwarded-Encrypted: i=1; AKwUvByBCs3DkIDGqcOqGoA9VJCYzI2JxxPfGV8FSn229cba/1KDNI+dT6BOdBB45PhODt2Fx3BUpwCzSkvsbBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zCxUIllYETy5aLYAIbvIMW3K1l0U9kfoCYR2VTPb0gIpNGT0L
	7F7RP/KX35/xK+96joltKFXx/1qn3vI1pGp7FDnVVAAmOg0/WQpB8rFzh1LGt9HnS5a9SoBzqbj
	EHbekNh45r95sD6oha8iDgJT0EobgdSfYiGT9iaH2uRzh0dY6SmA8tvLTWFA5sXFn
X-Gm-Gg: AYBFou159j1hG6dieADVpxHo55VxjOmN041UfT5a+2KF+5Zfo1lSa02xB3gNdUSpR24
	Do295QFTCAwuFAzHpjB5Qhn3sLaPBsnsBv2tBdRjwZsmKyM86msLW4f7/gY1RUdGITSF++AKM4H
	bfvueXOd1GwQF9eIe5OChjaXldwvUT3CUlWYiJtAZy4/u996Ca13yq/glnvxpYEICWAxgnpNQjr
	zNuUJl3F+XSXiMvtX5mFFXCy3FixvUpSotrX/6dE4qBqf/u8DtmsMoUta9550MCwHd04T9QUPul
	OKy2/yjpaL6Qm83MT40vOnqEP7poBdNhxNERocrDQLfSKicw36e/CgnBVfT8ryWaRO93NekHD9c
	Gsd3e6VwCercRK22b79rnLdlALpDhSW62gVh1eVW4pJNLMgQqe+wcEx0X3zJJ7Xf1vVtOcg==
X-Received: by 2002:a05:6512:a83:b0:5ba:3e27:6a32 with SMTP id 2adb3069b0e04-5bfd12073cfmr4453051e87.29.1793686641412;
        Mon, 02 Nov 2026 22:17:21 -0800 (PST)
X-Received: by 2002:a05:6512:a83:b0:5ba:3e27:6a32 with SMTP id 2adb3069b0e04-5bfd12073cfmr4453033e87.29.1793686640906;
        Mon, 02 Nov 2026 22:17:20 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:17:19 -0800 (PST)
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
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v17 11/12] Documentation/mm/hmm: document migration through hmm_range_fault()
Date: Tue,  3 Nov 2026 08:16:28 +0200
Message-ID: <20261103061629.972669-12-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
References: <20261103061629.972669-1-mpenttil@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
 Documentation/mm/hmm.rst | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index fc1b8dc19825..914ef6bfe848 100644
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
@@ -427,6 +434,44 @@ between device driver specific code and shared common code:
 
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
+Migration requests come only from ``range->default_flags``:
+``range->pfn_flags_mask`` must be 0 and ``range->dev_private_owner`` must
+equal ``migrate->pgmap_owner``. ``range->hmm_pfns`` is cleared at the start of
+hmm_range_fault(), so per-pfn input, including ``HMM_PFN_INOUT_FLAGS`` such as
+``HMM_PFN_DMA_MAPPED``, is not preserved across a migrating call.
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

