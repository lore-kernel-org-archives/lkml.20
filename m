Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699460;
	b=sgwoo1WVKiYRyuRahxmytj0hCPo5jURtiNvfrf4ihxahRo4MTz0QLAHDsBcvZI95SVT8
	 bgos+yJ/5JDuCmBJXTgne4bdciH5FkKC0OQpf9kHlRVeZH838H/H7GstNFhsl36epwH9m
	 mStfQdpuwTyWANV3IkDPiJVXcEKpRz534I0xVt5t8Z4gibp83qgy/tQ+JBOP9WySCOny9
	 g1Xl77QcCtrKWhEVO5UIS/w3PhOVLxjVE3oH4IpOY6STMpBC/o7xYLV4BYlqdzbX5NDKh
	 hygxslPXvShDzxbNkqrfhm9OX2iM5YeF42ETZoe0YMWNmCtAxhxH59N+5gJmHFIWnfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699460;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DCi8V2XvUFOyb68nKeOHWydr9sYNDskVDmcOf8KHlEQ=;
	b=xg/m80ZmirZd1nX2N0C3pi0tQG+uCWZOsRIm5iB3OwUJ425cE6+J+5NRv7mmccUM5zcG
	 yzy1FfFhY7V2zyQP9QOaHg1u4dp89gqgWKBvXxW9gSJcb/ldBMgsktb4gMGR7IwO84jua
	 wFr4NTctJAjFHhkd9IkL9Z5LrQn1HuIQwNkO9RAzWyjlXwDipDIzDw59lYXRnGMJosWLl
	 Ur/rLE41V/ne2EVpLNX+PqqgBhQ6lU8m8cz5BfyyUZqDz/PWshsPHLbqSAoFxFrHIgzaI
	 6eqWgBFPGOeb3wdGlW1jIY5xlwDyyjZHdsrpxWENH4av4g6Eu30B3L+t0l/d/uktEpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=karaolidis.com;
	spf=pass smtp.mailfrom=karaolidis.com;
	dkim=pass header.d=karaolidis.com header.i=@karaolidis.com header.a=rsa-sha256 header.s=protonmail3 header.b=eURVgQMl;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65653606A327;
	Tue,  3 Nov 2026 09:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65653606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=karaolidis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=karaolidis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=karaolidis.com header.i=@karaolidis.com header.a=rsa-sha256 header.s=protonmail3 header.b=eURVgQMl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karaolidis.com;
	s=protonmail3; t=1793699456; x=1793958656;
	bh=DCi8V2XvUFOyb68nKeOHWydr9sYNDskVDmcOf8KHlEQ=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eURVgQMlzGm+pkfVW/ALkVz3Uu89Qu/pfKxL3uKVC5/UY2eNfrxtTkSZV+YkCMRQ1
	 CSAObtSQmGhz+Bx6awstIqhlD37FphL52S7+e/yqQzFtVM/8cwg3h5wT/FVbw8qd7E
	 M9LDakSpwX9u87yKB7AIZV6EihImEw+xhAsYTfyUFbKDe8Yx9Y/mjfYq/deyrFpNzT
	 7kmOBnaF2+UAymv0Rz1BWfg9dgz1Y+2bHulyPlYS8lsHmq2ps6HOOy6WMIlfxBeFRT
	 jmiUevGwRgXLCOVucbl06EEq3foxirijMPjUTFAypTABFdzmYLRo1o0gj0Z3iDWEdC
	 7zOPCmg1uywVA==
X-Pm-Submission-Id: 4jJkND1KS7z2ScjH
From: Nikolaos Karaolidis <nick@karaolidis.com>
Date: Tue, 03 Nov 2026 09:50:07 +0000
Subject: [PATCH RFC 1/6] mm/memory_hotplug: add and export
 mhp_memmap_on_memory_nr_pages()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-virtio-mem-memmap-v1-1-308ae1da6240@karaolidis.com>
References: <20261103-virtio-mem-memmap-v1-0-308ae1da6240@karaolidis.com>
In-Reply-To: <20261103-virtio-mem-memmap-v1-0-308ae1da6240@karaolidis.com>
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oscar Salvador <osalvador@suse.de>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, 
 Hui Zhu <teawater@gmail.com>, 
 Georgi Djakov <georgi.djakov@oss.qualcomm.com>, 
 virtualization@lists.linux.dev, linux-mm@kvack.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-cxl@vger.kernel.org, Nikolaos Karaolidis <nick@karaolidis.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723; i=nick@karaolidis.com;
 h=from:subject:message-id; bh=SKZnlo9//zIgPLDsuEamosfk9Ui/ahFJfPVQh8m9rm8=;
 b=owJ4nAFtApL9kA0DAAoB2mjImL9M9YgByyZiAGrprndq8YVUy5FGPQyLlA9QXuue2CziSNCha
 TWPgRM0WQDh6okCMwQAAQoAHRYhBLMZG7EWqsMYjymWX9poyJi/TPWIBQJq6a53AAoJENpoyJi/
 TPWIpQwQALR5vun7/ritq55SSJRaIThf2srfn090RZm6Q7eMDFjCnQiCf1geKEFFL7tqOfMkG41
 AloHVrKNfejnNJGxeXsl/h8wbmwbRferU4vgAE8PMISemGHn4i/MgzoNDQ9m7dcddpSyibZpEFr
 AiVtUT0DoTEh6dB8TiIVQ/7PHW7lnx98o9MspM5bkVu7EoSsG3FhYeL4U+4W8vfYwAX2l7hKLbe
 wEzH5vHoZBHjAqcMHZbfHIcxyUxzKzB4CHelt1WQiCNaOjhmIhkMOXLCQWbBeztQCCg8yZawVKn
 OXXbpiolCwEetxIGvAxaNxJlePvWmUXeBbLX/fxp6wSrkXf7HsmvjmrKasNMslvl3f9zCecTv2P
 6y9ke2btUaFyCVGxuWRjgw1105CjYBpmoDWh0zoeNID5Ocp7K/9bUw6FlLr2JiKkfc6jqV4R4nH
 suqZSRpihb/zFS8smkhVc4qvSs2rq9qwIQ0NCVsVfnY7nlSJ1sTZHWoe+cgtgNt0urmly2iU6cb
 pWlpIklPqRpQI72QGcVL7RqCBtkQLuhaj2IayxI9nyJx9GFsp/2m1c0HUw8Y7PaDBvyxTuAWbAW
 4QLxhHR9CzFYkyf/rQtrWqxBAJhl48FlUPyoZXdvlvMDhgkkVbA2PiwZ9CPxQjY0ly4kAtZu0GY
 qO8jcp1KGsV8B0LtySeco/A==
X-Developer-Key: i=nick@karaolidis.com; a=openpgp;
 fpr=B3191BB116AAC3188F29965FDA68C898BF4CF588

virtio-mem wants to add memory with MHP_MEMMAP_ON_MEMORY. It has to
know at probe time how many pages at the start of each memory block
will host the memmap. Those pages never reach the buddy, so they must
not be fake-offlined, and in Sub Block Mode they must stay plugged while
the memory block is added.

memory_block_memmap_on_memory_pages() returns a non-zero value even if
the core would ignore MHP_MEMMAP_ON_MEMORY, and recomputing the value in
the driver would duplicate the padding of
"memory_hotplug.memmap_on_memory=force". Add a helper that returns the
number of memmap pages, or 0 if the flag would be ignored. Both inputs
are fixed after boot.

Assisted-by: LLM
Signed-off-by: Nikolaos Karaolidis <nick@karaolidis.com>
---
 include/linux/memory_hotplug.h |  6 ++++++
 mm/memory_hotplug.c            | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index b39605d30896..1b261d85e69d 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -74,6 +74,7 @@ struct mhp_params {
 bool mhp_range_allowed(u64 start, u64 size, bool need_mapping);
 struct range mhp_get_pluggable_range(bool need_mapping);
 bool mhp_supports_memmap_on_memory(void);
+unsigned long mhp_memmap_on_memory_nr_pages(void);
 
 /*
  * Zone resizing functions
@@ -220,6 +221,11 @@ static inline bool mhp_supports_memmap_on_memory(void)
 	return false;
 }
 
+static inline unsigned long mhp_memmap_on_memory_nr_pages(void)
+{
+	return 0;
+}
+
 static inline void pgdat_kswapd_lock(pg_data_t *pgdat) {}
 static inline void pgdat_kswapd_unlock(pg_data_t *pgdat) {}
 static inline void pgdat_kswapd_lock_init(pg_data_t *pgdat) {}
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 226ab9cb078a..800011ca194e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1409,6 +1409,21 @@ bool mhp_supports_memmap_on_memory(void)
 }
 EXPORT_SYMBOL_GPL(mhp_supports_memmap_on_memory);
 
+/**
+ * mhp_memmap_on_memory_nr_pages - self-hosted memmap pages per memory block
+ *
+ * Return: the number of pages at the start of each memory block that host its
+ * memmap when adding memory with MHP_MEMMAP_ON_MEMORY, including padding for
+ * "memory_hotplug.memmap_on_memory=force"; or 0 if the flag would be ignored.
+ */
+unsigned long mhp_memmap_on_memory_nr_pages(void)
+{
+	if (!mhp_supports_memmap_on_memory())
+		return 0;
+	return memory_block_memmap_on_memory_pages();
+}
+EXPORT_SYMBOL_GPL(mhp_memmap_on_memory_nr_pages);
+
 static void altmap_free(struct vmem_altmap *altmap)
 {
 	WARN_ONCE(altmap->alloc, "Altmap not fully unmapped");

-- 
2.55.0

