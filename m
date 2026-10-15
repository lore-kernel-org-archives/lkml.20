Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F1D3E8330
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036139; cv=none; b=R2W4D3Hcj02AqtWTvrLW+/m+XqufcVQKvn2d5FFs1p+SxOba8/SnBFE7/0dpPf9OkyhpYWSQiwpYKrKdnX8UP8UrvEmS1WlRC/vQqXGOxQAtJzE3AYSKcIRMxbzJwN1/ZUhloRLUzENe4qLyAUYr+XhEJ5s1Byj1KaTOlWr9yRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036139; c=relaxed/simple;
	bh=7oAeflAEM2wYNjUqz5kXaSNnS7cSDDdHte5PxIuG5Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QDcR9J1HLALOSKgOnAK1nnCT6wV6DWlmF0eYU+KRrp2Jk8gJQGrpQBcCe+s5wRKFRPqD11AMczQ1lbV+IzzG7LR0hscqBlEdhc5j2FffRW91PgdDT8AoBbHpwhg7E0M+hu0W+RE9Bm3zyl/8tZFZhSFXJNDaVVIE3BpcVVtD+gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhMV+qaT; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhMV+qaT"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5181483eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036136; x=1792640936; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bHwaGza7cuC1DwPWlcczvb1/bCiut7wJK6RNVUwiwMw=;
        b=XhMV+qaTUJk+jIPrHfKQWPKbFPLY84ty1rowE/d+/s85moooIi8auH5Cro8USbnnCD
         YmXtBNE6V6dIjsvK5Ro8J4F/lBeIdLBRtSowQQdCimsgn3USorDZnukENBge6J22h3JP
         unlFCny8Uzbk6ooL2HXgiZVzxmavu/Gid2UTEvqgmcdFB6xlDXsABhVfahyIKhAqiDoX
         bI0DMwgQ6zRgKidD71S36xKn9Q7SDQ+MVjQl/LOfM/T8scYchJ4TLLivUe+FI9xpKs0+
         HDHFvHlOnfsd6PLXjvzYBQzCwwkshrD2GogvLWma9OLr+XuWT4dlRHz83MIW+zcKTpn1
         xvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036136; x=1792640936;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bHwaGza7cuC1DwPWlcczvb1/bCiut7wJK6RNVUwiwMw=;
        b=OgXAz5Vt6sOItFZTU5OLp6FKtHjspqNTy5mzU7kSrKfMSauZWxnUpdvGVPeyfU2USV
         oab24ydyWCQBvLYVTXNF7WYQFcEj2FfdxEFwd6BPxnuQD5VAFixOOO5pM/llxWfBGmFb
         rlciFXTfs10uokh99ylh5EcXqZ6SyWMUtXLpShxlxbuwHAO9NhinjnbSIWhAgpLZjbfg
         5x6/xXQBBcQHG/9FPY52eXHQSTvVLrtjy+rvXMlcIN0OAok7SqjHiNzxZLKLNjgCMcgx
         27oUKSMqaU/5VqRZgadMyQaB6ROq20r7wH27SEZHGh1+ddImvQFGbuv24mse7riuVGCd
         +Wog==
X-Forwarded-Encrypted: i=1; AKwUvBxn0h8I07mleNfIMXhOWZr0cLBcULS7/a/+9eCjiYpPyFTYSVXS4OTpdoXxM9tt/oSjwk9H57Vj/B3kKy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyu6hG8mgMBuO4MsiXVcJa0llfGQ2Gj+sxltjjxESneuU+JqZZ
	w3TCOc2NWyxyFPSVSGPYZ9uZ4RhprjlvR4UR9Tci3sirRsPN8PKtvPZb
X-Gm-Gg: AYBFou1vag5pFx2jYnx5x0Qz8kIvzKwSfFyfQP3NVLWuKwevZcS90EU9CsMfbn2HmWv
	fF8+6XDcDd6inmYr5LYBbUFdZQvBRmDUewopacubrDqXG4q8ORePaT6P2V9Co+0jee0iWoAynoV
	H2+mT4i4MWDbzuEhASG4tSZ4V31sdk7MJhRm8+o2yx63SIu5zZQfInxzEUCc+XAnaw95EoRNWBj
	nKlr0XvFfZbwiRvuCTikkC/cNwaU5lSK8Fqi0k50T+J4bAHpuuj89gpfeCATwX8ONLbAs97ki6n
	j2ti3psCgbWW706l2wtBYNZrUl4nOIVjmlxDt+Ee3gid3zwFNbXtmd2xUigZXzLsU0PmR64khhc
	u8hE2vmnnVO9ApbsCw4AmlWIukDedXvWEaACCncZvvGUCiSNdXAWV8HFs8EAczvVUcP/IN0YQRa
	kW+BJ7GLhAatT9N/dd5SaF5XY0+PH9xq/Se0GV4LykNtSsg0Tx/PEMTXdTKTQRV+OejvM=
X-Received: by 2002:a05:7301:408b:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-3537df95584mr31174866eec.16.1792036135797;
        Wed, 14 Oct 2026 20:48:55 -0700 (PDT)
Received: from [127.0.1.1] ([115.88.114.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm64703088eec.3.2026.10.14.20.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:48:54 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 15 Oct 2026 12:48:27 +0900
Subject: [PATCH] drm/imagination: Update sgt_offset kerneldoc in
 pvr_mmu_op_context
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pvr-mmu-sgt-offset-doc-v1-1-aab9ba54b5a4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAApN0GoC/x3MPQqAMAxA4atIZgOpaBWvIg7+pJpBK40WQby7x
 fEb3ntAOQgrtNkDgaOo+D3B5BlM67AvjDInQ0GFNWQqPGLAbbtQlxO9c8onzn5C09A42JKYags
 pPgI7uf9x17/vB/JuInZoAAAA
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.13.0

Update the @sgt_offset struct member description missed by
commit 789f290b2e81 ("drm/imagination: Size page table preallocation by
device address").

Suggested-by: Alessio Belle <alessio.belle@imgtec.com>
Link: https://lore.kernel.org/r/64b915fe3c794567a04c955fa89184204e3b9552.camel@imgtec.com/
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 3cac482e1034..6b43ea4c7f63 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -1412,7 +1412,7 @@ struct pvr_mmu_op_context {
 		 */
 		struct sg_table *sgt;
 
-		/** @sgt_offset: Start address of the device-virtual mapping. */
+		/** @sgt_offset: Offset into @sgt of the start of the mapping. */
 		u64 sgt_offset;
 
 		/**

---
base-commit: 489a8539ca6f347102c1334c2f08198abacc86c8
change-id: 20261015-pvr-mmu-sgt-offset-doc-180ba640e076

Best regards,
-- 
Gyeyoung Baek <gye976@gmail.com>

