Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49C938837C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928462; cv=none; b=JzkcHk14LefM0M6wjHoLfwf09I62nJdAN8cIbqqYQVYFHAJzRpaV6FBJZHSFvYgP3uslzOeyAbFOI2K9tpRn7rCVcmtmq+phaLjZU/Qo523ak9NvSKtlOl5a/D8LwzqpyTCwOothXhtVtL04Vw9gNRyf1fCw6wN1/lCEr15sfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928462; c=relaxed/simple;
	bh=JrlGh43GDVTsnhG0JpjaYOMTUpg6rx6jLqB13gLHhbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BQxM5MqkGqlbolviF4B612zBq5x43eu+cjyATnCybxWA2tJVlfEMt+YA44oPh3+cZkx2h0MXZyF0njnVjIRzFI5zfnK0S27ZCFy+pFSrLQU0uvOZa9LW0iTwCucRcBwv+00DCp5JvHv7X4VIeMlv0ZhFfwb/VV7u2ZM+W4ygalE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3kRIctH; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3kRIctH"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso11825349eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790928460; x=1791533260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z54n6VzC+kkkl/3Ijn5IvZJnQmri9nkKbsWlxFk/GYk=;
        b=A3kRIctHQVWWtB8CuaYGY6qu9doP5kzmcLGdbjALlPlJ+PxOUsP0cbUsgVnq5eOu8k
         Ri0tCvWkB8Fs9eU22+AL09d5SRP85ajoMNDCJJqJsolKKQTejVrkw+mYBYEtTLGzeuFJ
         L4/mkO9wFEGRujkjXQ/Frp/k7lBTxJzDit1ZaTOpq0MWyweNQYlgDXu8RwCx4+3s4P+B
         5pBFmO8CGsahwHwQVgYJbKE9EHCexBDoo4kDL5ip72lgaO1JAFwGQ9HlTVAmM1pmD19c
         +Kpp6+QamFmRNLGJczr59Bfa1pbGsUFvCpb+VdErf1arJnSKInii5KkOYhKTtTrVvxd1
         n2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928460; x=1791533260;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z54n6VzC+kkkl/3Ijn5IvZJnQmri9nkKbsWlxFk/GYk=;
        b=AF3Rgu2oHre1m5Vl8gTmD353zS5ryRwGnOaUf4OukaNcbIzCICtH8QcaoubFdEaz2M
         R41dE3eW6DRYi09M2ATS26KZOtDeQeudE6ibjrg6qTXqPJ9FYPSae4OKgGRm3V4qnbd2
         snccSRGKdMn1JVoYZTajJo92ULWlujD6exBUqW89WWpNfsEl9YrosT7DdVQdKOj+bsl+
         fkSuxbps1v8QcVSqN1qt9FctK96uKo9y7oZV3JLZoBzahvBYSULLfWuHZXqxpLf9RD7o
         ka7kpusu+yQG5a8JgscQ9V4c2Z2tQU53GdnegH7atOpPHD/zQWCGaz8rvuvsKqclmLOu
         B3Vw==
X-Forwarded-Encrypted: i=1; AKwUvBx2bBL6sPAFYaTRKv/4wks+6Q/SeHLQrdizHhVF2cY/zaYGF7OZS41SbraUWVq5D/+lX6AToJtyc8hzycw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDTUYQ3O46ROpU0k4yw3K26cFtlOGWZ8Z7RkcH0ShqQJxiKNIj
	p2dpHSqFoW0/qdFkufS5VDABHV6mihq9wgD4YsA/Ig8txP/IqpuzSlI0
X-Gm-Gg: AYBFou0dUBtmiPmChz6d96zmzYhKy7vXkCFz/SmtEKnE8JrKVa4v6ecLpd8maXSaM51
	BM+ERzADG4hMBuKTKLetkbl6BSez3EkKv1tG3xPL/zjWODH6zdEmrPXhaVVi58JWO8h7TDXu3oa
	5YEMTbWvzzldRnis0791Y2+pZplVb+QBvb2Ua4iZzLaEjCiGoJBFl8yYauuT8pGDEsoRAVT49RW
	nPay2sJb3MGNRWzj08/cbHE5ohte9LIywtDQyd573p6T+FE1vZc2kR/YppkaRD4LnM4TJpJkfY2
	cYNEJHF6BtxyGqXxlLl2wEX4iEHAM8TAgb0PSZuJvT38F7bXy1hxaGa8OGGsCGyFWpx6Xu61u+j
	yG8FAiTuY7voDwuWc409jNN3IFV70IzDPXIXubnaOsDtp1w/CWaU5awLMdlxWRds0re9gjk8LsA
	FtOxS20TAVKlbzymCVfF52E0Z60JGLAiISCC6bHwJz+v/YHpOgxtXtlp0wia955mdNv/Uz34nSw
	spXjUl7wXFO9szaqBNXKqFGf6B1QEWLGoNq6SD69zEZ/CcP1F3Lxl/SJ2fwMtYkhcLYwBhGUEGj
	D4I1oEQ=
X-Received: by 2002:a05:7300:e9d7:20b0:350:7852:f7df with SMTP id 5a478bee46e88-3507852fc50mr1336424eec.0.1790928459675;
        Fri, 02 Oct 2026 01:07:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1c0e:3312:2cff:28c9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f303e3sm5492739eec.5.2026.10.02.01.07.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 01:07:39 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH v2] drm/xe: use resource_size() in xe_pagemap_create()
Date: Fri,  2 Oct 2026 13:36:59 +0530
Message-ID: <20261002080731.13992-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use resource_size() instead of open coding res->end - res->start + 1.

Include linux/ioport.h explicitly, since the file relies on struct
resource and now on the helper as well.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
v2: elaborate more in the commit message, and include
    linux/ioport.h. Both as per Rodrigo suggestions.

Link to v1: https://lore.kernel.org/all/20261001163328.51556-1-sinha.aryan03@gmail.com/
 drivers/gpu/drm/xe/xe_svm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b228a737c..a9b087c43 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <linux/ioport.h>
 #include <linux/pci-p2pdma.h>
 
 #include <drm/drm_drv.h>
@@ -1848,7 +1849,7 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 out_no_pages:
 	drm_pagemap_release_owner(&xpagemap->peer);
 out_no_owner:
-	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
+	devm_release_mem_region(dev, res->start, resource_size(res));
 out_err:
 	drm_pagemap_put(dpagemap);
 	return ERR_PTR(err);
-- 
2.46.0

