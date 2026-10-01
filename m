Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C489455615
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840644; cv=none; b=e4NVYf1U9G+MMBPpbeBv4HPnRoc+isGfupFZlGYns+hsfib+ON8Xk8FJz079Hz2nvhEcCr/ET6Hxb8g1txyKeLTJQ9+b/T3mORaErF3LlBNJa9yVZL2/GXXCMF5LCs7rwThsndpSc7KEImDeRuchw4/YpuBCNUC1WBFHI6cYxsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840644; c=relaxed/simple;
	bh=2SCttNKC7O3FocUJg55oliDoHnVOooTYv/JgB5ERAK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qmraDLIf0nvuk0lb055k7JaA7ddt6xULLH2MYut0F9Izv939OwqiW73NpVZoSM4BquXIeUH/jOA+P0cW8HomwSeKnH0Sf+HA6uwDjsCRTLVXiMPQpEkt5CG05lxRjFelq+RVqMtDcRkUepaY4KX4Xxi7MaX1RSV+WrI2IJhZULQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piWRvOCT; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piWRvOCT"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-347866278b6so2132547eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790840642; x=1791445442; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TosNnawzDPsGc04sRZxwMHLtTq8rVKPb8WELyOmoWoo=;
        b=piWRvOCTZZ491WIHNpH8O47ceKcSSgSfywiq7uVO/f4pN/16Xgp0uisx8q9PDSjMxB
         zbBIhIP7ARs4028g19YDlmdexrIcC2qz7t+Nv5WiMDhVBfYl+SMnjo4cEcSODzIiKeoM
         UXHvRMDB1nPRIYbaMAQEMfatNrVwS97HZ1LHyBqBED2t1R2Jkdt09RRq5FjK5fp9iRtE
         r8kIlmVhMOOgBbQxMQVnOmSiC7YZwiLeS+1dps5z9h/M+lZ2U8OW6fCSD4IpamOq2CWx
         LmXdWut8kcvZ8NCL4qqrAdiWygBtb42j8G+wSAzHBXTho3a8FpWdU8XKmG2Xy7nxtHdG
         xMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840642; x=1791445442;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TosNnawzDPsGc04sRZxwMHLtTq8rVKPb8WELyOmoWoo=;
        b=T5+JoM1duTByiyhtLcAwHk31JRZgWVbWgshKO4k+LDhXPojNIAx4lu1VTxsuClUYOE
         hQVj+cGwLKwbjX+BSPbkdXP3/NjUHtweec/tAYhqZrSCco4pfBC5p5G0eduitBsWnqkp
         uRkGi7UQDGXq8kh0+saPxjm8+jYP/d7c12ZNlwh5v89EyAHT+aEi290IcoAwgNQUF3HZ
         68CVI17HbXKbJCufUeEh8ssEexP0EfUQpH3aVWtnKxygCcoAHxyPV8CAEHHiuBvy2uxu
         hqKGeoEkY+jmVFAyZwSdBR0/JIONwnSuMJfBd93Z7yRd3Y+Icm/UEgZz5PyMF0DzSujH
         BBAw==
X-Forwarded-Encrypted: i=1; AKwUvBxtCt/ebhCw9m9JlkHVzdqPpi/kIlM2aPliFoHkrXO76/JkC2lp8v/JjXa7ndq67MD9b0UKUljh+/VskFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWvBGCaohK9Yry17AzbsKtBvVQGVKDsigyNK2g9jgMcUbQ6WY7
	7a0T0cYW6zL6/NMkrT9BvRX2UeRwFCrSIJO+sBe5Chzyc5cc3wFvIwL3
X-Gm-Gg: AYBFou2X6nZ+AjeUpiWAp3o0hwwKUSJ++tffeqxUzQurq9p9gniU5R+2yCxagPUk7Mv
	AM5zQ4Y4L3KiyG78yJLRlQTLDrklBl9hJ7T48Xj7RfIzhapx0v9Hr0yGh5vEhf6kr0Abld/T9/k
	LzDKWMGRB9Vws3GNBmqaaorAhQVbtvI0fy5dyi5LKJnlxUO4y5UB5hEbtusmElltpCt7U/JgcGl
	1RG+nRp2SoT+1B3P5j66yD+wH7IDXCqv69qNwMZmB+cAsDKDLCSlRi1S+cfbw9ReNk3q4b/Ow/Y
	vtCU+rix6KgOf5iQGwK8NQUgKub3zlIG/UoMruu145Xk2C9ZLq4F6ZSmLz8Y8dGmczY+uYC4fbf
	QgUEl0K/V/MIAjZ+yA5Lj5Ng5Se2xlBCI9hqxKcxILGkQYZl/rl3eqseBLmGaZVx3eCLADBRQcx
	wBwzwgwJKQDGP38MEaAd0LHQVMkeviWDY9pjnADMUEvmgLgztZ8PjB7g6hi2v18Rja8Q==
X-Received: by 2002:a05:693c:87d6:20b0:34c:6942:8a47 with SMTP id 5a478bee46e88-34cdb8e6084mr3928132eec.8.1790840642073;
        Thu, 01 Oct 2026 00:44:02 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3e33b73sm4876955eec.18.2026.10.01.00.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:44:01 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v4 0/2] ext4: fix shrinker scan budget accounting, plus a
 related cleanup
Date: Thu, 01 Oct 2026 15:43:55 +0800
Message-Id: <20261001-fix-ext4-es-scan-nr-scanned-v4-0-b13703714ce2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADsPvmoC/43NwQ6DIAyA4VcxnNcFkCnutPdYdkAoSjJxAWNcj
 O8+9OR2MDs1f9N8nUnE4DCSazaTgKOLrvcpxCkjulW+QXAmNeGUF7TiEqybAKdBAEaIWnnwYZs
 eDVyULWkphC20IUl4BUznm35/pG5dHPrw3p6NbN3+544MGFTMSMm5rKmWt6ZT7nnWfUdWd+R7q
 zq2eLKsQGkLW9SyZr9WvrNyemzlQKFSaGmNsjT8y1qW5QO8EU6bXgEAAA==
To: Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, 
 Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>, 
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This reverts the v3 simplification of the ext4_es_scan() shrinker
scan-budget fix, keeping the unrelated locked_ei cleanup from v3.

Patch 1 keys SHRINK_STOP off nr_scanned (extents actually examined)
again instead of nr_shrunk (extents actually freed). Jan Kara pointed
out that a batch finding every extent still referenced and freeing
none of it is still real, useful aging progress, not "nothing left to
reclaim"; Sashiko AI review independently flagged the same issue.
This restores Jan Kara's v1 Reviewed-by: the diff in ext4_es_scan()
and __es_shrink() is unchanged from what he reviewed there (only the
explanatory comment reads differently).

Patch 2 is unchanged from v3: it removes __es_shrink()'s locked_ei
parameter, which Zhang Yi noted is dead since its sole caller always
passes NULL. It keeps Jan Kara's Reviewed-by from v3, which still
applies unchanged.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V3 -> V4:
- Revert the v3 simplification in patch 1: key SHRINK_STOP off
  nr_scanned (extents actually examined) again, not nr_shrunk
  (extents actually freed). Jan Kara rejected v3 on exactly this
  point; Sashiko AI review independently flagged the same issue.
  Restore Jan Kara's v1 Reviewed-by on patch 1, since the diff is
  unchanged from what he reviewed there. Patch 2 is untouched by
  this revert and keeps Jan Kara's Reviewed-by from v3.
- Re-measure patch 1's test data against the reverted fix
  (239 -> 1 calls with nr_scanned == 0, vs v3's 238 -> 1 with
  nr_shrunk == 0).

V2 -> V3:
- Drop the sc->nr_scanned computation entirely; just return
  SHRINK_STOP when __es_shrink() frees nothing (Zhang Yi, Sashiko AI
  review).
- Add patch 2/2: remove the now-dead locked_ei parameter (Zhang Yi).
- Add a Fixes: tag for the commit that split count_objects()/
  scan_objects() apart, and Cc: stable, matching the equivalent jbd2
  fix.
- Re-measure test data against the simplified fix (429 -> 238 calls).

V1 -> V2:
- Correct the comment and commit message: nr_scanned == 0 is not
  only reachable when sbi->s_es_list is genuinely empty, also when
  every inode walked was skipped or had nothing currently
  shrinkable. No code or test data changes.

v3: https://lore.kernel.org/r/20260930-fix-ext4-es-scan-nr-scanned-v3-0-9aef0be87d21@gmail.com
v2: https://lore.kernel.org/r/20260929-fix-ext4-es-scan-nr-scanned-v2-1-f4e8f6f6b8b1@gmail.com
v1: https://lore.kernel.org/r/20260928-fix-ext4-es-scan-nr-scanned-v1-1-91d88228b0c8@gmail.com

---
Qiliang Yuan (2):
      ext4: fix shrinker scan budget accounting in ext4_es_scan()
      ext4: remove unused locked_ei parameter from __es_shrink()

 fs/ext4/extents_status.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)
---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260928-fix-ext4-es-scan-nr-scanned-5af70744f6cd

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

