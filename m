Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257D44E06F1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352726; cv=none; b=LxOOMrv+PSuAb3xeyMs0sVO09m6XwsCVE8ITDgxe5/c5qW7S15+CggtE08Vnkqk3jvxabmY1oevzBT9FTvJQp7SX9c1E9ejDq7goXZSfo07c7GeWF3IyGsQ4l8ExhZXXGNQ3stQRgmGj9PDbTi8TbQfjtJg3TAQWAav6S4uFV9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352726; c=relaxed/simple;
	bh=Wfze54LtPMmI0xqKGIBHk5HpMn0us4cGASNlC9vZDgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiquVDE3kcQAdDRS31lTYHfP/TLPBn3y7JiO94tLWni9Bo1oS43rlCry/eR5lFeYfJ/2BNdEkF6h57JrNcBdl6KPsLoh+RnTPmwmvOzUQbJ6iqwgnKR90lxc9Xw5LkXaWRkUyukc1e8qSjXr+5RG8vIgApou/+51oypf9Esmuww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNgjUbZI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNgjUbZI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso5309995e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352722; x=1790957522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEfLZw+SZ9l3bCU1EQAdMa/xVIANZgIsiXamG4UPSuY=;
        b=sNgjUbZIhygAZIkzzXLeekEyzPl1Zbb/HGIyvknQLWjo7H/n9l/TphO1K4oMsUNBrO
         oYzvxfN++4dbmQNRTdbkMq63Q1omdMItldekZ+by82xNOU1g81F2xKQNgm+YWYhrz+QE
         xR812hSyZWmXRPSJG77v8F4MFP/n8E6HVeDJcrXE8v7TIjlRG47R24EZ8jyDiYo1Fsz9
         UMsy/25BUx2gs4fIFv4oF8Id/yxOu5x1OCQrDCQBh0iyKlHUawwrrwouFs+MyVnwDDW5
         noTNODFwNmPFNl4fF0CXChlKNhYTuQgBdq2/KyP1pSx6fo/poLsQoQ4NVmALl04Tv1Cr
         QEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352722; x=1790957522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEfLZw+SZ9l3bCU1EQAdMa/xVIANZgIsiXamG4UPSuY=;
        b=lR1htOu3c82Bo18qEczjUgPDjV/daTOeWNCv8hF/VeNmY3qh3EhVYrHqeQAI/Utd8Z
         egoCQlBCs/ghUELQfg3F0dULp182uh7oRF2JniPWYsWUr12YcojI23gDKv86o2/czKG5
         WFqylXjmYBq4QOfGJdoZjcMc1L6DCMyJzdrNqz/Sl85hlYpy8jr1NrvomA7W8rWpt24Q
         Fb53TmnQVn7jvCbaltfGSzl9YUMiDvQkXXPXeeUhOetnMpKWNWxmpTpzhr1WtmMlYPeQ
         PWPgH8egzmzFCSpm7a1qchUFmglYr8hQTqa0M4NZQ8DZYreOJruy/3zIjA7A7giyXwc/
         kXKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRJPITTeAALoqS1GaxU3qGiCdzKwFMJauY8lcaWXFt8oQnXhAXPHA29wLE+7axBJMjKf+ld+gkXzKfOUA=@vger.kernel.org
X-Gm-Message-State: AFuF++nt1E4GpdXh8Uq9S3cxSc4wcHHUi4a3PXvfVa+ASxOcdXPyjhSk
	xRN6iR0QlUcEkMUploXV6s7RY/qqBDM7NTJtxGM0rMWlM8hMPzb5v1xc
X-Gm-Gg: AYBFou0paGqQtuS2wr6zO9G6Y0IS1QO1hbYsTpxr/2Xae/oZCZxr+Ss5Oghdo4uf+vF
	YQ2XMmtX4if5Q0tKbD5n8U8qfUktTERDYOWJJLq8+2RGKTFYlFWxmq6/3AKXlrw0dnG/H26uCP4
	5sCn4imDSX88/AlVNRu7L7pXpVH8v57j30+1JjJyuIhc447zRRuX4835F64QAs7QQUwm37/mtku
	Q5l2mGo+6WV6WhanKU+nDUTlOqmNuU3nABBZ0/dxhmwnRkdG/Dr9CaDnpH7wHGjmoYdZBMLEZzH
	8320mrm+2p+jzjm41H7bgSHIUmp+Dga/f605Jv1UUyyax+iFhD9ZApuF+0AKLtlP03lLRMeTn8Q
	AkeEPWEmBCGzYLp07QpGU1wGVP0rTAp7Fc1sRAyF0T/MWl09rgJgURBFpBLz/G83fXNnGsysE+X
	zRIdeZAFrncmADDGfLZtiQn73TWLFSXqfVxP4cT6W/KIiFtjicx15on8Y4yHQ4vFqrN1HkoB9sd
	OzGulf9X88EaDC78HjseWbKjB4qsbK2fwRCFOnnWhCd
X-Received: by 2002:a05:600c:8518:b0:49f:d325:9912 with SMTP id 5b1f17b1804b1-49ff06bcd79mr47529705e9.10.1790352721951;
        Fri, 25 Sep 2026 09:12:01 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:12:01 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Alex Williamson <alex@shazbot.org>,
	Yishai Hadas <yishaih@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] iommufd/iova_bitmap: Clip recorded ranges to the bitmap
Date: Fri, 25 Sep 2026 18:11:37 +0200
Message-ID: <20260925161142.189813-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161142.189813-1-parri.andrea@gmail.com>
References: <20260925161142.189813-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IOMMU_HWPT_GET_DIRTY_BITMAP can set bits in the caller's memory past the
end of the bitmap.  When the queried range ends inside a dirty huge
IOPTE, the generic page-table dirty code records the whole entry, and
iova_bitmap_set() then sets every bit up to the end of the pinned page.

iova_bitmap_mapped_range() checks a range only against the pages
currently pinned, and iova_bitmap_mapped_length() caps only the pinning
window, so neither limits the write.  A range that starts inside the
bitmap but ends past it passes iova_bitmap_advance_to() on its start,
and the write loop runs to the end of the last pinned page.

Clip the range to [bitmap->iova, bitmap->iova + bitmap->length - 1]
before computing cur_bit and last_bit.  A range that starts before the
bitmap now has its in-range part recorded; the unsigned underflow in
iova_bitmap_advance_to() previously rejected it whole.

The clip runs before any pinning or indexing, so for a validated query
range cur_bit and last_bit can no longer address outside the bitmap.  It
only narrows the requested range; the bitmap bounds are fixed at
allocation.

Fixes: 58ccf0190d19 ("vfio: Add an IOVA bitmap support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/iommu/iommufd/iova_bitmap.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/iommu/iommufd/iova_bitmap.c b/drivers/iommu/iommufd/iova_bitmap.c
index dac3e657d498d..44826ae330c4b 100644
--- a/drivers/iommu/iommufd/iova_bitmap.c
+++ b/drivers/iommu/iommufd/iova_bitmap.c
@@ -388,6 +388,30 @@ int iova_bitmap_for_each(struct iova_bitmap *bitmap, void *opaque,
 }
 EXPORT_SYMBOL_NS_GPL(iova_bitmap_for_each, "IOMMUFD");
 
+/*
+ * Trim [@iova..@iova+@length-1] to the IOVA range covered by @bitmap.
+ * Dirty trackers may report more than was asked for, for instance a whole
+ * huge IOPTE of which only a part was queried.
+ */
+static bool iova_bitmap_clip(struct iova_bitmap *bitmap, unsigned long *iova,
+			     size_t *length)
+{
+	unsigned long first = max(*iova, bitmap->iova);
+	unsigned long last = bitmap->iova + bitmap->length - 1;
+	unsigned long end;
+
+	if (!*length)
+		return false;
+	if (!check_add_overflow(*iova, *length - 1, &end))
+		last = min(last, end);
+	if (first > last)
+		return false;
+
+	*iova = first;
+	*length = last - first + 1;
+	return true;
+}
+
 /**
  * iova_bitmap_set() - Records an IOVA range in bitmap
  * @bitmap: IOVA bitmap
@@ -404,6 +428,9 @@ void iova_bitmap_set(struct iova_bitmap *bitmap,
 	struct iova_bitmap_map *mapped = &bitmap->mapped;
 	unsigned long cur_bit, last_bit, last_page_idx;
 
+	if (!iova_bitmap_clip(bitmap, &iova, &length))
+		return;
+
 update_indexes:
 	if (unlikely(!iova_bitmap_mapped_range(mapped, iova, length))) {
 		/*
-- 
2.53.0

