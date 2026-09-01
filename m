Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB72481FAB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282545; cv=none; b=HPefVFfHuNl0niHQg6UD+/uG9HepPQqSXw1e6q15dMlTYHH2q+S0W2yt5s5r7nJHLOxRn1hLSNz5voAogUpzNqEpXR7pKk3tednvdx3ytcj9BiKERSyfR8sztd5uK0XPJFQIfDP05cb81yJgXQ0yRq5CIHKAErA/xxGuQfrTOYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282545; c=relaxed/simple;
	bh=Q0EerqSgGvmAb1C2z/3u7uYu/BE74lyAF6uYjKyCP+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWJqMFJT60+3wHsPfiunZSM7XcJi9kaJ2jVRp6pZ+28/hoOnhYlkIB136ZS/FJ3UjQNhyG4DDlQnIluQd2xyA56YusMSS0+Mu9eYjWXhdwKhVpEz3siMTT9g3dJPJZctRlRYIBKDyI6UHMudnoy7pm/KeHbgWbeRYwJGitQmGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=nrEyMyb6; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="nrEyMyb6"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-85aeb506b78so3217337b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1788282541; x=1788887341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1WtM+yGxMA6nGtYPUfHvkwWZoT/FUK2b2ZzSHby/Yo=;
        b=nrEyMyb6yloX77BHAqQ9NIsW3Qi7cS5aNddBQPZqrXW9TCaqr9qxVP83JdONRObk9X
         Y83RoBAaegJJ3Hn3QaJEROuo5kqMdlKp99jD3IQH5Va+HCuUWwBKz4pGl0OEQhunOEqi
         Hgq5i5+7IqfWpdg8ISKaJEXM7y/jwyr7jWURem+6uAyWdJxWFTCWZriZJKPkBajPucqC
         yOuUK15dgoN+vZiMuKq7e8UDnADTcrqjPpHzjR6pZ93GBma1qGGSa0Idd5fNYPzCG0W1
         Q+1tGC9juE4Gt5A+uE+NmhxJ4GZ8/u1NTrzQ/Dwect0EiIKPEQ6T847gboHvLBHcezf9
         IkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282541; x=1788887341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1WtM+yGxMA6nGtYPUfHvkwWZoT/FUK2b2ZzSHby/Yo=;
        b=Ns+UFYycDRHChwVHfBU/6Mbhe+smhIb/KvqNtBAYD48GXwCL6E9pjYsGvKgEm3iASd
         59yUkAsu+stGUKRPgnnuA+2h52quIoKpQZsIVhGr/SUp82rVDX/1AugdGjBqo3L4G+7K
         BDnfgzxFmIjTnejBE/b3qluNa/6Pq6C1y6WBP4d5CmOkK2OfZv+fJUq9opqM6CDOMCkh
         cNQJ+qsJUwcJDJwYFMdSIigN3idvAvorXe2r3AvIBBs5K7Y0k54xrFM2/sEyliWdPI+z
         ucsYh6uFyUUZjU7fVIO/s2SmI36oefGJwD7gcWTCfnAQln3W1orVeHBITs+AShePBVin
         qG0w==
X-Forwarded-Encrypted: i=1; AKwUvBwafAjWMMtyBSZ6oGSrPPf31voLa469n086433lpfJbwLQowXt+rnBVkWIWZ0DPbtrpY5ohj/89TO3krT8=@vger.kernel.org
X-Gm-Message-State: AFuF++m9M9cmZMIdSJ9ERq6W2RdUHT8MOmtK6kN0onPp5hnS+jdvNFko
	81c9Q/q6tqQ9nQaQimtHLSyPsftuGZL9OK3XKtt2VIg8KqhEpZXJ5perY5Nv5ObhhYt0
X-Gm-Gg: AYBFou0o/mTBUS6FzJHtKxQq/fYfCjL350xgbIY/DbXjQlu4Vku5ElaejSEpGCaJiB6
	qf+kOVVvFoDPUQzkL+gpWAc5T0lXPXua1hrkb5hI2OAX9FzpdXel7g4LvQ6qigxFugzdm3zOtX/
	VrlQEnwEO/sH9cgRxOpVUVdazYmVKEhDxbPQ1PsDx5/vTOPZwZi4klcWWkU4xPlvVRfGAtMGt3i
	ji7DXAp0T56usEPlv77xodvxTLkqfFZ6T4FE8bG4Ln0LQAGAcDJTPqVQ2PMRGjU0Rk4fYmjSk5d
	Rcl2iwiz1xa4ARuL6/eGeLl0lhUDYS3HkV5BgFRaSkDNHNA1vxkkpcWe7CMPknTdB6XG+I5a7NV
	28KSukDaifP1Cpsemj4XFydh07W7lnd5Oe6ROzKgnfZyies0L2DX86tA68Z0tB31dfHFJjE9gHV
	OduLDO+ejz0Z7wLEZbgYqIEXs2HZeZ0sqrJP23y+Ftg6pcYLWT9prOwVrQYJFC9cnq2KDCNibdz
	gcxmERbLTIZX4iBIwq5gHuh/rMdpgZYGs40pcsMLwo06ExFz35AqhKDzfREPmpIRHEjI0jYewP+
	Fg==
X-Received: by 2002:a05:690c:c3f1:b0:81e:98d3:cac7 with SMTP id 00721157ae682-8686f52fe19mr38821267b3.12.1788282539975;
        Tue, 01 Sep 2026 10:08:59 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146edsm79761867b3.32.2026.09.01.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:08:59 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: alex@shazbot.org,
	ankita@nvidia.com,
	chriscli@google.com,
	david.laight.linux@gmail.com,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	jmoroni@google.com,
	kevin.tian@intel.com,
	kpberry@google.com,
	leon@kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	nicolinc@nvidia.com,
	praan@google.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org,
	viursachi@google.com,
	xuehaohu@google.com
Subject: [PATCH v8 0/2] dma-buf: Fix silent overflow and alignment
Date: Tue,  1 Sep 2026 17:08:47 +0000
Message-ID: <20260901170849.4052816-1-dhu@x6u.co>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

This series address two related issues in scatter-gather mapping,
specifically for the MMIO based dma-buf mapping. The fixes ensure
sgt mapping is correct, and proper for large MMIO regions.

Patch 1 fixes a silent integer overflow for mapping length exceeding 4G
(Previously submitted as [PATCH v7] dma-buf: Fix silent overflow for
phys vec to sgt)
https://lore.kernel.org/all/20260609164047.486227-1-xuehaohu@google.com/

Patch 2 Splits sgl by largest page aligned chunk
(Previously submitted as [PATCH v3] dma-buf: Split sgl by largest page-aligned chunk)
https://lore.kernel.org/all/20260722233806.3922093-1-dhu@x6u.co/

Changes in v8:
 - Combined the two patches into one unified series to avoid merge
   conflicts.
 - Collected Reviewed-by tag from Leon Romanovsky for Patch 2.

David Hu (2):
  dma-buf: Fix silent overflow for phys vec to sgt
  dma-buf: Split sgl by largest page-aligned chunk

 drivers/dma-buf/dma-buf-mapping.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

-- 
2.55.0.897.gb25b4bd76c-goog

