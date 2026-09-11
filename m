Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C130B368263
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139112; cv=none; b=B+YGlCsOTc0u5IOBKo8jqhbL0cFi7QdgDgHaG/nr7nZR0Y+bvXV+y6Fzyq2RVrtP3FPdjDqeLllxcSSMnmD/zW8zyRihyICIG58B05xJb/gICTZH0wD4nf4FNgmGKlyz/EGmE/DzRhydIUIoNtoA/l5a/CTYmmmX5Zu7XWuVxVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139112; c=relaxed/simple;
	bh=X2genqnDXLZF9jJMjeCeymPoDXvSYysWx04NPl080aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CmZVitqPMplS/cxJ7b4M/PkOFbnmd4qEEJo3f2oijdWs6nwrZIBMVbDAdvkh+6cyTAdajdPqW0G5317pcCDoSx5YwqoXnZs+efTpr2CmJVPZPGOXCP3fiwxbZKv5eeF0ErwauUA76V59DuMMUXPGvy67pQL155NvdcxRcmJa/cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J0BN70gJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J0BN70gJ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485850cf499so831706f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789139108; x=1789743908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mniijplyGZlkQZmDrYFnOPglJBLK+WFjfb4odBVk/dg=;
        b=J0BN70gJBpALZ5NAb8HVZ41mSP9/J/DQNVlrJkhBvSTR1N8A7x8ddzZfKZh0SJlz0n
         EG59W4FW4OfOLCLDJQ3QW5jOwWevhD5ne941ddcKG6gTU6L6czm4z9xKMrwviUmBV6sV
         d7PEVY/QYi1rssM3VbzKy77hEZqLlViCkV7RuVqrHHmNQTT3y4gJNjbhAd0KHPQmppbF
         GZZ789lfYYlhPD5y7WO/JpDdbqFUbaUF7u3mAlSDATgFCYd+Yjcd2il+A3SX7CfVEgYV
         klEHMqJ59eev7SBZVHUcfH4ZBOyC7J+bgmEqW+MQHONP1dRwGuUwzuRTdJe7ARTxrZt8
         B4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139108; x=1789743908;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mniijplyGZlkQZmDrYFnOPglJBLK+WFjfb4odBVk/dg=;
        b=G0oKfK7wKh5tz8WfChTkvzL/eKayu6sxUVftG2AjbsChgTrBN2NOK5qH7DGJKK3Em6
         0nL1XtnnXXnT7aNgBKBrIVmFzSx3wLnl5pIqDyDLvnVDvipKso/WyJh4O/YDAM6CwgC+
         aVJmFY/9d79qaACEmUfTl+wzuHBQ9L6JY8nD3kVf/i/W6hNY1BJPYKr+10ekfbu8boS+
         QrecYcaN6kcEsjvL8yqkF70ZZYIHNvb8zVZW2NqRAsgpoB/LM4SZVFPORsge+o927rId
         vwYiWMO+8LSORc+nf7ECVoI7XP/aWEeSqZYNaUrsXWBUtuNM5jaZ9mKk6J1spbX14dqO
         pDIw==
X-Forwarded-Encrypted: i=1; AKwUvBxwpja75BZahrbCj2/RexoibPVp5ctcoaSqpDYoX4CIoakfOk1QKz662WSMbumqEdnGZGE4VS6weIs9X9w=@vger.kernel.org
X-Gm-Message-State: AFuF++lnxkWfkWQ2ehcm9o6RGYxbDsTvztVHVTiHveIgjlwzIbrHKrca
	nPKLlIuGSFvhXZA4G+OUo6brMAtbQ6m9JBuK2CK6obFlIyMOMfKIew6jCGJ/cHqisn4=
X-Gm-Gg: AYBFou1E6laUbsqSduayKDJQ1YHbK1qRzX0kgOBXjKlMkTCO0VzI0/3Q4osEMgK+CzJ
	wzedQ0hkF9XE57pjAeEo0yWhWcaGHsuc5f/ATLueIMJlmnINKABHewxOc2auMXsfTeTjVHvvVA+
	VPSwDHwDSwPpC9CC6mQ3S1IC/UUJn4SF1ZBO/KyQpITj32ZRvyCoVCYH4U2QxVg68+/WUg6bkwh
	QX+mk1Zz+wZuRDGfBP+8xRNCxkXCby/vMJQ8SISzrXYcmirRlZGxLj2dkdLp29I+i0FXNSV2BN4
	XPCNn4Kibxs3XsUNbVQfWFElc3eDdOWalgIJyQggZUt/wmB3e64pSjyT7e6MomIXFkn1rUQMXG+
	th4ecBPywZYROO6iLQ5tNWatncxlG0NoMAbz9ujqoPGPUA1c5+65aqYdHaV2IEdC9JeUE5accfw
	38dJcUx2hd0sVGFEDr1plEPJvPEpDaMuqMW4czVoBMsNeW5E2pqBZEKSPnz3CwasV6GTa4JwWhg
	Ld6Vbmh2ZOLQArj
X-Received: by 2002:adf:ee86:0:b0:485:8c17:975f with SMTP id ffacd0b85a97d-486eb2ffac7mr4035568f8f.33.1789139107698;
        Fri, 11 Sep 2026 08:05:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm6853579f8f.27.2026.09.11.08.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:05:07 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Jens Axboe <axboe@kernel.dk>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Francois Dugast <francois.dugast@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-block@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-api@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Remove the error-injection.h include from linux/module.h
Date: Fri, 11 Sep 2026 17:04:00 +0200
Message-ID: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260816-module-include-error_injection-4f80e37a8ea6
Content-Transfer-Encoding: 8bit

linux/module.h appears in roughly 15k #include directives across the
kernel. This makes it a "hot" header, so it should avoid pulling in
unnecessary definitions.

The header currently includes linux/error-injection.h to obtain the
definition of `struct error_injection_entry`. However, this is unnecessary
because the type is only referenced in the file as a pointer, for which an
incomplete type is sufficient.

Add explicit includes of linux/error-injection.h to files that use the
ALLOW_ERROR_INJECTION() macro and currently rely on it being provided
indirectly via linux/module.h. Then remove the linux/error-injection.h
include from linux/module.h.

The first five patches can go through their respective trees if preferred.
The final patch depends on the preceding cleanups.

---
Petr Pavlu (6):
      block: Include error-injection.h for ALLOW_ERROR_INJECTION()
      net: Include error-injection.h for ALLOW_ERROR_INJECTION()
      syscalls: Include error-injection.h for ALLOW_ERROR_INJECTION()
      drm/i915: Include error-injection.h for ALLOW_ERROR_INJECTION()
      drm/xe: Include error-injection.h for ALLOW_ERROR_INJECTION()
      module: Remove the error-injection.h include from linux/module.h

 block/blk-core.c                                    | 1 +
 drivers/gpu/drm/i915/display/intel_connector.c      | 1 +
 drivers/gpu/drm/i915/display/intel_display_driver.c | 1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c           | 1 +
 drivers/gpu/drm/i915/gt/intel_gt.c                  | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c           | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c               | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c            | 1 +
 drivers/gpu/drm/i915/i915_driver.c                  | 1 +
 drivers/gpu/drm/i915/i915_pci.c                     | 2 ++
 drivers/gpu/drm/i915/intel_uncore.c                 | 1 +
 drivers/gpu/drm/xe/xe_device.c                      | 2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                  | 1 +
 drivers/gpu/drm/xe/xe_ggtt.c                        | 2 +-
 drivers/gpu/drm/xe/xe_guc.c                         | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c                     | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                      | 2 +-
 drivers/gpu/drm/xe/xe_guc_log.c                     | 2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                   | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c       | 1 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c             | 2 ++
 drivers/gpu/drm/xe/xe_mmio.c                        | 1 +
 drivers/gpu/drm/xe/xe_oa.c                          | 1 +
 drivers/gpu/drm/xe/xe_pm.c                          | 2 +-
 drivers/gpu/drm/xe/xe_pt.c                          | 2 ++
 drivers/gpu/drm/xe/xe_pxp.c                         | 2 ++
 drivers/gpu/drm/xe/xe_sriov.c                       | 2 +-
 drivers/gpu/drm/xe/xe_sync.c                        | 1 +
 drivers/gpu/drm/xe/xe_tile.c                        | 2 +-
 drivers/gpu/drm/xe/xe_tuning.c                      | 2 ++
 drivers/gpu/drm/xe/xe_uc_fw.c                       | 2 +-
 drivers/gpu/drm/xe/xe_vm.c                          | 1 +
 drivers/gpu/drm/xe/xe_wa.c                          | 2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                       | 2 +-
 drivers/net/netdevsim/tc.c                          | 1 +
 include/linux/compat.h                              | 1 +
 include/linux/module.h                              | 1 -
 include/linux/syscalls.h                            | 1 +
 kernel/module/main.c                                | 1 +
 net/core/skb_fault_injection.c                      | 1 +
 40 files changed, 45 insertions(+), 13 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260816-module-include-error_injection-4f80e37a8ea6
