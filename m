Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1C48EC75
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055324; cv=none; b=KohVoFPkL3nCLhBFvb7DZ0QIitkBPUY9oI+VF7pT4FQECzIG/I/Gyldk8G2oqGxaUB2+7RbQDv0CDIGeYICfjnb7J8sdNUAOOvXZHAX5IYj7ypsdjckc26H0orwmBAUM2+sqMPcE7zm0f29zaU9ujiQqUxkBykwdTqt5y1jturs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055324; c=relaxed/simple;
	bh=G51B54owKuBfMBL6BmQ3fz1GoUN0Axehqo+N3yadsZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIWeIFJNKiWNjqcDANOnSi5VQnbfE+Pkm6UIVKDvNIz6dnMPxhSxo5jXrAKESQFn1aIL9cbOtFKKjlZnlB1yA+bAuV6RVZnFSk7u6NVOd0qhncGh1kYQMM04WR4LT0BixNgIRl9xAks75otbTSBkcfZUG7MHImRG9WKec58D7jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvASsNjw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JC1NNLTP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvASsNjw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JC1NNLTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
	b=UvASsNjwNk+oVdt28xpUo6LmNEH3PULy/Ax6+G6tBe+SnHIzAslC/+xJKtHVre//VJTvjO
	HiEgB7jdPUqotdgZnSpFHZPwwh+LRqN7HommmQDq087NIWzsTbMKSO/5L6l28dMmG6pgtd
	BLqRiAlGJWBtg7be+xSoCS2eJ8tkQgI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-ilZFXAlzP5G7TnX2Buk02g-1; Tue, 22 Sep 2026 01:35:20 -0400
X-MC-Unique: ilZFXAlzP5G7TnX2Buk02g-1
X-Mimecast-MFC-AGG-ID: ilZFXAlzP5G7TnX2Buk02g_1790055319
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5b8c58cd8c0so2124869e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055318; x=1790660118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
        b=JC1NNLTPtStO2FogkAZ/ONMYy2vmTxuTeNtCT4SVAHeYDEzXdskDmrzIiojYbtEryk
         O9RUyzYmfJQjig4iu76Eagq01MvZ25gF8t/X9+g6I+3Ljj1XgtD5IibLYu8PDUSmaWgx
         oUe/wMhuSI7HcBul+60xWj4XmY52pj4ASAgRzGX5jU1GyRH34IoQxJaC5AIgzoEvM/1x
         4+5wcdvoXMGctqSE+iVXVUK4yVWzEd4wL4/bCK0SDjOy+xknZg1B77JmZHS7lp8IWwmd
         cmBwp7Skm+2aE7mFtDcw1dG+MuGox7iJ9fD6lo9zxc2UhaZgJ6sYFyK74nnLMoLBeQ4P
         6IPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055318; x=1790660118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEEzUKmwPcuLDb8KHUBfxekosp3Yw5qO1BP0yTFVDsQ=;
        b=WVnLiT5WsStLfIy5YFMxwOCZEOK/ysS3K0ZJzaLom++buP7xSFBpxpiZxxxGd7OmbT
         2Vrj238wAnuCzW5JvYNNxO/IAdeBr6J4gdrsf0CeHLywBg2RtdTKkMWTVlK9fcuTZ7xo
         RwJyObWZJ8lvd579CLYmlZJgvQIsf9xHTq+ulpYX43qZgRatktQG2JO8E2jhAnMQ/l6E
         0eK4Wpe1udk1tPd6YnoI3LZzbaDnnse7cMGkfIoIz9Cy8cWWdtUm24x//afJwmlRg4Hn
         80z+veFX+Sdjlr2jW8PhMIqzdufu85uqKXhTcOtJwAxkcZVy5YwoiWTSwhv5/4WRHjzt
         WPgg==
X-Forwarded-Encrypted: i=1; AKwUvBzYFurU+JOlRVM2WqXZRawFpEOioFv0l3My7quP9H6WPjw7iXAyfy/wCmC1DLzNfUoHKrZyxbWzwgDh9F0=@vger.kernel.org
X-Gm-Message-State: AFuF++mccidNy9y2QSeqZ/Hu4f+1Qm5PrrKjR/DE/VzYh79vIpplm8XY
	mj5SrTSGxVXJcVqjX8fr+EeKB+tRCcTUp5he42xFkNWqi02MNhrr3/MrCdaK3RkbIuLk55MFOS7
	AzcDp76kNf8K0KoMT5HlNchvlEs13q/DR92pA2YJEsn7SHIrU47f2y5WdSghmI2Of
X-Gm-Gg: AYBFou1JxFrB1DvZ5aLw27sqbZFqoUATewA9wnIVoQ/S991Z371xLTOJUkUr/rHnd/c
	tCp1+Qob/5K2ha8J+RxvZgbh6FAVMUAtRsMbchZZgiDy92JQ4CsdguBylyET/8Q9+XPJuPEDpDH
	otZeiOtEUQ3OmqYv1s4JhGWutBb3ThHM35Kq98cR6n9X8vtkVQiEAw00V1QiFy1KW4xlcq3mSrJ
	O1IWNfr1Ze0fqTilRn5fi++I9ZS3NgJHu7etZn8KbgPacdC7cuux8REHH1wAg6X4wzYJbQBybEp
	dBlYTIPcn0+sMrJFvvzcxb1V6y/Rr92b9SbI6+Var6pAQ7N85+GPw0HGZ9iQVJk6DiAezkv18qi
	KwERaE2Acyu6RdZovKcnK
X-Received: by 2002:ac2:51c3:0:b0:5b5:e86f:3550 with SMTP id 2adb3069b0e04-5b8c1833648mr3732748e87.9.1790055318591;
        Mon, 21 Sep 2026 22:35:18 -0700 (PDT)
X-Received: by 2002:ac2:51c3:0:b0:5b5:e86f:3550 with SMTP id 2adb3069b0e04-5b8c1833648mr3732729e87.9.1790055318145;
        Mon, 21 Sep 2026 22:35:18 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:35:15 -0700 (PDT)
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
Subject: [PATCH v14 12/12] Documentation/mm/hmm: document migration through hmm_range_fault()
Date: Tue, 22 Sep 2026 08:34:21 +0300
Message-ID: <20260922053421.4092027-13-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
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

