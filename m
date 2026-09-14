Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC96433A9E9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361828; cv=none; b=UtMakAgz2TwyyGxvECdTxL6e0YLV26SSSktiryGaPu4hslTBuZSxkBueYdCVsWj/7bakolFG1wruKfxexKg335oOhwfDSQPvTouCNlHIVT/CZa7ex2Q2/fmgEI2eTrbPrrbrNw+nXSBkhka4SlV5tIli2Wxdv7YQdeT2/uQ0eQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361828; c=relaxed/simple;
	bh=kV3QrABOxLls50nm89nUXni1/asL5Em7YmCotDP1dRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0C0Tqo75s0QEsTGc12xJMgty/8QYExLAfqizyCgDEFz+f53oAxu2BWgZCnZWk/eDpev4pwL15eGGV3ed9LcRw865rG5GNJYcm6cMx2/IcPT1FipYdvGzCa2mDo+oLJByE+tjKn8bC/WFZ//8C3dmPoei1RGyPrq/SHpLtqVbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBA74u/W; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBA74u/W"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2833549a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789361826; x=1789966626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtcnUDAtlxwsk8tm+WoFz/dsUhvDBL4dml2X633QlxA=;
        b=FBA74u/WFqCHRneHU6ewYkClvDzobsJfnauwVH3Ehn6gtQEU/OZXmGU+pJWxiUxoL7
         lsod/xVLi6g14MeiIIJMSzAdiMP6rxNuItzcIKO74TbflvIVKNFufmp3CDA7Ly/ezEf1
         7CPvf7bL2yhTCrRcL1rG3O5f5d3peKx4TmNkiQ+VIqpyPNYpoFUZcgcNlVJSqckRtnef
         f2K3z5qNkpvTcuddW/xgD4Ikyen98WfPDIKgnCMKybLY47WE02gw7Aiz+LceXMqnogEA
         vbHe71BXJuOhqGmVwFhizJKWulej1cXnknT+YJt9lPhH2L7JV9HBo9oHN4QZFs5nakCF
         jtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789361826; x=1789966626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtcnUDAtlxwsk8tm+WoFz/dsUhvDBL4dml2X633QlxA=;
        b=Hwx42WxDwr84+oDj4iVV+As5Wy3Yyi5Oo2xSYnWXZq1Xm3qwwKIosrqEWKxd9s3aKe
         skLN0o0olmpBABcaSpkDU5m8K1gi+utO8wogJ4Zr+fM9KqaX5rDBKSxX7mJ1/sxKIaGV
         bc6jw/rebCvhlwEud1UOsMvLh9FCI4DvzckXJuCdoMZCPSSS7sjkqR3Wg/tgJJ+1umJ1
         W1dUmo27CkDiTey7qMjYtPUm4rbmXV4I4KqkhZuXH0xXkV8ZbnwX4nCe/sbjC3qm4aEu
         /5MGhVTKxHq0x7uujoiNyH3PHVfp8ExPPfPDO40TbgrACQgBn1SS2DWUaY7KhGA38wLp
         Wz0A==
X-Forwarded-Encrypted: i=1; AKwUvBywCgKgNTNzjgyFH4+Xj3OoPMWj2FiMZbe6j7SdutDkQX72Bl/AMi224Lg0ZNru8zDHDQysimiwwGMbxus=@vger.kernel.org
X-Gm-Message-State: AFuF++l1IUsUHIUjVs+JQGDPr+C5idaPDttKGS9kBl2Bg3jfQdKCT0S3
	yyveZmzxH/4+LhfZF7EdFS0L0kO78k0nO0I/6mkYrAdGOPZbYzvuYmY=
X-Gm-Gg: AYBFou0icuG6mdjkO9tzBKOrGUESA1DAac/loOv0+Ks6yxUBVApgX7/2zkF7mgjRYQB
	WX2bf2Vr7L7s5yfDA0lZSUdfXrKwpNItzTBSDV9JhI/KWKHg/wN72Lcvl6JHbpugQX/bUiJV8/X
	+Nqu8+B12ALg6xxVkSC134NYDWNnXZ9Kn1ve+4D3q4GPfU5cpLsGT5vyOmTkbmzYMBfIZUpJN+m
	5RHTNn4b8FHvdeZYlMYpYgynCwWoNZ7Bbq94U7oKh5uXTabnI/Gubaj2WlZLkm3Osd9K/dG+UNd
	GQVshqy8V3o5qsfQoS/wp+gkA26dPThnXy5Y/KieJSOQvO3QFbNPnm0eMxX9ReC63g30CqfC3Kk
	crthzYsJpIwnltZVa5NXfG8ga2uGabTDjLMBjR+KjaUq6GQao4vyKxsj/agsANIsBvgzW9iIUod
	rootkHSbqhzRaol77eln6eMmuaYmHp85TFGR8MvfRtvvgWNiIALwEbOwPneQdqIOPi87SMu5W0r
	y0KkvehIOCn
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr2278378a91.17.1789361826240;
        Sun, 13 Sep 2026 21:57:06 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm18824792a91.8.2026.09.13.21.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:57:05 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sidong.yang@furiosa.ai,
	royalnet026@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ogabbay@kernel.org,
	tomeu@tomeuvizoso.net,
	triet.hoang.dev@gmail.com
Subject: [PATCH v6 0/2] accel/rocket: Fix allocation handling and scheduler array leak
Date: Mon, 14 Sep 2026 11:56:03 +0700
Message-ID: <20260914045605.381933-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series addresses allocation and memory management issues in 
the accel/rocket driver:

1. Patch 1 ensures proper allocation checks before using pointers 
   in rocket_job_open()
2. Patch 2 fixes an unreachable memory leak of the scheduler array when 
   running on single-core setups (e.g., num_cores == 1), where 
   drm_sched_entity_init() drops the array pointer.

Link to v5: https://lore.kernel.org/all/20260818041505.1579320-1-triet.hoang.dev@gmail.com/

Changes in v6:
- Rebase on top of drm-misc-next (base commit 5052ea2e6bfc43c64b851c596d3675d17e05e631)
- Addressed review feedback from previous iterations.
- Added Fixes and Tested-by tags where applicable.

Triet Hoang (2):
  drm/rocket: Check allocations before use
  drm/rocket: Keep scheduler allocation in rocket_file_priv

 drivers/accel/rocket/rocket_drv.h |  1 +
 drivers/accel/rocket/rocket_job.c | 13 +++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.53.0

