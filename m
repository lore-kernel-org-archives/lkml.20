Received: from mail-ua2-f33.google.com (mail-ua2-f33.google.com [74.125.226.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3352CCC9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171415; cv=none; b=j4Ho9x5ReUo7/bHnlXadX8ijx3i1omp0yTkG55cYJ0jjbc9hvv3F14HWYXlPcVzgkMgojNL6XJdveWBoc2QV0q2HRVYHf3clKPj/flu7tJ7TZ0QNOXLyV7xP8a2rMihz39Zo+NN7RyoiE5OR5Rxarda7sdZWhxg8zhtrd+M/PX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171415; c=relaxed/simple;
	bh=7Le+bSKS4i++0atX4ob/re5jRUUIa9YEDMNPqlpG9Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mK/1FoShrucYvVbUecaiRGZwQUwKxARfmscncBDgpt7PJGf+yjBi4j2p07vQabLbeW8qblMaMsdW/1iR6AeR+DbCmdRA1Pp+2iivH+jwUrfU1fZVdq/67vyq5Q7aCy0Ho2Gm26B4LktQ7WH+4FOVr8QmnrM+BpYuVdCzibHBpZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwUuVJfc; arc=none smtp.client-ip=74.125.226.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwUuVJfc"
Received: by mail-ua2-f33.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so305694241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790171412; x=1790776212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIg/ABLVf9+aKRgVLx2ojwBZLXuVOVgsPgIbjXHaOXw=;
        b=nwUuVJfcFlhL2tisYdWPm2B2ybSS3KewGxpETOGXr3m6tE2TMvFDIZtvREjIS3NBYT
         E+K7wlUri4ZNaNWc8M5hxcAceFIqAKCvKXbJVq4kIZGh7ZrVpneBo3yEP1LJB7a/YY/F
         wXebYTL1y83zjW+RKrXzs5B8y/y8TDBxOPoGw4ZsyIfYuxRPaK/LL/0cEFQt7Gt09fKQ
         4bHysMqt0Lb779iO980dNWkYkDdL8U6FYF/67hTaX0Hq0Ojq2wiBizR8AUF8r58vr2QP
         yVq/c5N9bFLn3DvsH0nNP44pQWLDTrdtag+bA09L4x7uXbSuGr5is9Oa01hgZsleAhy8
         eliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171412; x=1790776212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIg/ABLVf9+aKRgVLx2ojwBZLXuVOVgsPgIbjXHaOXw=;
        b=RchxN/jS94gZ9KlHLyp+hODpgFq9LlT+3Qm/cJ//9/xl5oZbczA5i2E+smBCyS2Idv
         6/kE3OrbmGSyQ2YGGCz6tD7RDOoe0wbo5GLcxXbqCXuJEGPcqeoAd7wkJdXznOF99VWI
         LvpnE+SB6i5z3jn9Ud279RATDUR+V19cRCc0o+i4nEp2NsJA+t2vzzbHDiOE4UNuzPGq
         efbTcZCI5b5GGx0bA031W/RvFdbN5tsp47ltKXBrTYofWBX8fnjI5inr0qIMpvdPJP0C
         q6CLtmgTWitHmBGrcAZdMvW0oFNczyhAuqG1Y0cvJASLiHGRIP6U7Qu0AssGzq2ALFRj
         0Q9g==
X-Forwarded-Encrypted: i=1; AKwUvBzxclS2uZchpxARucxPDcX/pkyqTvTe4O6YGd4XiEqdy79+NO0BIXuRAsv+dM+hIZrqis8AfglEcIpzKVc=@vger.kernel.org
X-Gm-Message-State: AFuF++mtaAv7O4AiuhZ28punVIqZurUcJpFlmTdWFV8XXXXKMqtOMKP/
	TNWMuu/9TQnAzAEs9oyraZ0cUXBW8161KqlbA3G9LXGY42GIJ5gFhLSD
X-Gm-Gg: AYBFou3yXNK1JVCcJXmDjqVcdJWb/ageHmb7SQkHb5pQpgXzCIpRQo+U+91ryw0/uDO
	VvoQzrsHLtqmv3JjfheLcOt+7sDcW/TSwN7Mhj7L/TgjyGdvPuneqJu16rjoXKIQ2Nzp6mCLEJz
	qNN6AGw0CxAyIQsg1cgYMaYY6QCUVMUfjTJq4N67oAugJKRjK9a1FwkFgd32lawr3fky4K3n7xg
	3miV6uKry2nvT+jKqUMK8dTnu5WBgIEV2AyAUyweM5wE+6sANOvTT4dDhwL6XHwzxwQSOz17Ius
	B00FTZ7DOjuH2JJV5lYHpsiS0yw0iOGExF7w+RKQ9CaB5tbQXxvZTdVuG04ZU7VLUGsNv6YSWMT
	a+ymuMo2sCjUXg357X7PO9t2+S+znwktgSX0jAMxsTEgZhn+II6vPk8EDxc4ll+3eGa4QmVYdTS
	Kp8XmGtugBU3F1MPL/QZkx+mYZqLb5YjyvhJi3qvc0vo1X3sV7I3oyuKWmmWI6CVU=
X-Received: by 2002:a05:6102:291e:b0:7a7:ad9f:53c6 with SMTP id ada2fe7eead31-7ac1bb4a3f7mr2276292137.13.1790171411528;
        Wed, 23 Sep 2026 06:50:11 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9852407d1f2sm113126241.6.2026.09.23.06.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:50:10 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: airlied@redhat.com,
	kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/qxl: remove double page-size scaling in kmap fallback paths
Date: Wed, 23 Sep 2026 10:49:52 -0300
Message-ID: <20260923134952.1750600-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qxl_bo_kmap_atomic_page() takes a page_offset parameter that callers
compute as a byte offset aligned to a page boundary:

    reloc_page = qxl_bo_kmap_atomic_page(qdev, info->dst_bo,
                                         info->dst_offset & PAGE_MASK);

The VRAM/PRIV path adds it directly to the mapping base (both in
bytes), which is correct:

    offset = bo->tbo.resource->start << PAGE_SHIFT;
    return io_mapping_map_atomic_wc(map, offset + page_offset);

But the two system-memory fallback paths multiply it by PAGE_SIZE
again:

    rptr = bo->kptr + (page_offset * PAGE_SIZE);

For page_offset = 0x5000 (page 5), this computes
0x5000 * 0x1000 = 0x5000000, a 80 MiB offset instead of 20 KiB,
producing a massive out-of-bounds access into kernel memory.

Remove the spurious multiplication so the fallback paths use the
same byte-offset semantics as the io_mapping path.

Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index XXXXXXX..YYYYYYY 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -223,7 +223,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 	return io_mapping_map_atomic_wc(map, offset + page_offset);
 fallback:
 	if (bo->kptr) {
-		rptr = bo->kptr + (page_offset * PAGE_SIZE);
+		rptr = bo->kptr + page_offset;
 		return rptr;
 	}

@@ -232,7 +232,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 		return NULL;
 	rptr = bo_map.vaddr; /* TODO: Use mapping abstraction properly */

-	rptr += page_offset * PAGE_SIZE;
+	rptr += page_offset;
 	return rptr;
 }

--
2.43.0
