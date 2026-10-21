Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562762;
	b=LYZhU5Iq0OIfJWXW4KLygrmWHqUgtR2zxx9tCf14NTT7ghnSmDPwTguezkvq/4kQbZTd
	 xUNQciEdPUPeTSEcZiAhwmeL8MAYH5jiQvrrABw460RpmrGVzMe2O3rqBzWVptnlKR6gl
	 RWf41A9Qvnabxc204JATrM6iKza4QA47O+xQcTV8+qs2nFgqWn7VcVdjC+0aJcuna5kj7
	 ueosulZLIHxBXFvBhd1vmijHGNhLOhorRM7MWCviAvVY6NI0jb9xEJUG5wJZybJnsHJoh
	 O8NO0qXTzCAU98zs44fPFvUxJJGFFRdoFLroWpJQuO4gBW6FA3sxV5XMGchBjnK9jRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562762;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
	b=FXQIN8vO/O6EkCbXzzrN1TLBSSIl2IZlrQBBfiMUqeoPu6/bedx1uXKliHH65G15mNfD
	 ptDpIa0/6D2C5GVHz9kf0tHkctRpySASH6MGtPPeI/pPVpqrxTIqSL9l9vypQkoAZY77m
	 Ud+MICVvZMCgr4ljgdFAKvlWd2j2MuMWKKiALl75HlszM3rIWb1pFN58CbwPA89ElfYgO
	 wkkrUERQDwCPh9Wb6ihIjpSUvJvn6cnqLIl1KCNWfhZ2RdkRyayUkxm6t4BURq37iZC+p
	 OdnULG+0FZb+JGLjXMmVGLJiw8nP6+TkR8TRjvCPyjibyaj4RecW7cBUpbX0Pf6jYYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cu5UxCGA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L9z1ZgNI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D24660A2631
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D24660A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cu5UxCGA;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L9z1ZgNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
	b=cu5UxCGACGg9MKTvK86OkGYVINzLDW4YTdmOUjyeQiSC39UtFP43LG9gE/JXtL0so8wdGv
	324vNEwtCRqqiFy7+FiPXMNCtxv2sZ0qs/VmpbeckQEfWBFnaVV+HPFzxnb3v9IzYuin6Q
	TCnozGvlavjJlndKwS1E5h8Xi7T1wow=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-7LkEX4wYNcqYCxiTDXZOiA-1; Wed, 21 Oct 2026 06:05:59 +0000
X-MC-Unique: 7LkEX4wYNcqYCxiTDXZOiA-1
X-Mimecast-MFC-AGG-ID: 7LkEX4wYNcqYCxiTDXZOiA_1792562759
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b01a74792so227142f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792562759; x=1793167559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
        b=L9z1ZgNIBOoai1g8EonhlKrsarMtdOKa+J7SVg4jvEjhenBcbtvOzXFGmoAK3kk65B
         S6OUd0xxpBaNWdOz2Q6CDaIskmbRJkxy/dZIqcH3GbhewDZL7JxJ5zR4hLGjN9sFDuwZ
         QLGfAz2j67lQGYaQtnjlK1iOw66KpG1M6ElZfgV2wUlV7y+ZhNtSUmXCVXym5iRwDTfR
         OF/R+CV/6fVGIe7xuVayn6MyRiBA3B4ssjLh4EJ9b2Or8uelrBpdULM5RVUW0oPvVzwm
         LZdipdXQ4FkBGKOUwGnaG0lyEn0Ubg3BNrajJGcvDyFnkxT596vICc7mRgLXFzNE2wd9
         ibcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562759; x=1793167559;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
        b=Sn7mkOxQY8iguKpEDGGPrVEx+RnCrDNUdPHtJr21seI9/UAyOM81uhmUzBm8YjMobW
         feIL/c3MnPfJJht8/bTRt7+c0YV+N8GarXbxCw8HFiwnyfY6WkR2Lqqqq1H4D9G2WFYr
         DdyXR8J+26fH+7s8Q7L7a7ihg4HISBATpsXZVGM/RkMG3kxLRZSqwIbMJIiFi+SVRr3U
         m+sTEs1CC8TfavKH2e0TquDkJH3YbObSIifOpaVOlWn/r1qemd+Qhs8vTzURtQvggTlk
         UAGEKYvR9HSNwq7qtKLqeSafTGae130+ZCix1IJJ90rcdCcKrS+ZchMI9+L43O2bed+y
         Z+VA==
X-Forwarded-Encrypted: i=1; AKwUvBzSzCXfuOC8cxb31OuJ3d1YGlMjcGinzksIf9jYBoGb7rd+3yZd+gknKKV0+SHdozRu+ez47/rbqyq/Hy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4vBT0n8au4TcSr6qnkbeYxNCwh8OaK8RUvk0YEseKbyyktSIs
	xlw2/Td5+Y3/xX6xALXfMkIeTvcEKnHZMd2MuIewPxHJl/vtaKeVe4Vgp58V/6FfrzcNZcY268C
	D/PCttMk/C3WkD03eZs5tdlL9g1RVx8EHB06D8amDasnd3rtch8s/wByrxzbIgqo0
X-Gm-Gg: AYBFou2gXxbGdnh6waqUHdKimbpS0O4/SDzOmNGxG2qBLYOtQL1ql4rIR8Ik0FB3Jex
	12UnOSnME3poiY2fLjw/wypqyb2rQ9Z1KBu9EYSPeAMD8MKQvMw8cS+g3XNnbJ7YdUXx+4ByvCI
	SQKYU5rwfujskQYV5jlHCfcBLKe60uahHE23gBmF2L82MyGhlU5GZuYLRW6ngGHH6QxQMg7C803
	YZAo4O+E58qKNn9aS98i75E+eaIpY5ZC963MJoZDcFNlNo9R6C1bCP68dOkNea32H36ZeY24wd/
	XEPRZVolR3B77zAu4N+v0/1rTUj/9i0ddZO1HeqoRT/LZkSLeiG71QdIZMz0X+O8rZwcOcddKrn
	F/dsdOMNYHxLpEhTOL6ZLsF4cXJMOGe867x3W
X-Received: by 2002:a5d:5d03:0:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-48e26493dfamr1855063f8f.12.1792562758611;
        Tue, 20 Oct 2026 23:05:58 -0700 (PDT)
X-Received: by 2002:a5d:5d03:0:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-48e26493dfamr1855003f8f.12.1792562758183;
        Tue, 20 Oct 2026 23:05:58 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:05:56 -0700 (PDT)
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
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v16 11/12] Documentation/mm/hmm: document migration through hmm_range_fault()
Date: Wed, 21 Oct 2026 09:05:05 +0300
Message-ID: <20261021060506.2377545-12-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
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

