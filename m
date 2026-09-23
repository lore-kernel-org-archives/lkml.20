Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C5A51FCA9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179979; cv=none; b=XIYMlkRZs6lw0WLX/msmA8EdASz3k5AIBY3o3ylQOnGNhIhwTDvFZB07iGR4a21pp2F/dujIdSwHvfGcEuWvRrtsTvwMzyn4V7ze+SipCyRw11ZIeTDQW9g2Ib00rVuHmhaiQXPB9XllWT+tnGNzXUYy/MqRF+ehdTuXm3gF06U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179979; c=relaxed/simple;
	bh=PaRaVv+Z9tIc8Sg76WdgsFP5rdDIoba5Wi4snLM2ebo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k9weqbeSCf3AKzuOqI+6H9i5MCf8IB711umMY2EVVKXGmYzAYISOqZeNNKuCrVQO76CRCt6y2Mmr2ViHJBceWp4bkWZQGiJPovZKHMfdhkRPqsHg0JxAZN+drw1hnSApwMEpa4/zZKnYHlgc/mAnsLGPZTLO3n7LODayU/Q4TQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBTy/bvs; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBTy/bvs"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so158659285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179976; x=1790784776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ptp1S6PEvwhlOiXeXKp9TFp5hhbpIwPkATNA+GKV8f0=;
        b=HBTy/bvsN6EDcuPKpkqkLnWOi7Kdc9ZZjhdyTBAwyWFzkKQcwe4c3YsMSdeu3L8FY4
         qCWeTjvzYemOdZk5EQQFTngHy9m9tYu5lrlpk+sjFGnZ9eM08YUyVuZrJmWOIu7rrDJe
         Xl7wRzQrKYUqmPM7hzYKRocV93AuZ4Kqp8poQJW4Mecem5tKxpkA00qGX6ayTOLZ+gjd
         0nz6vEJ+cD7jNKjQLEaxBo5kfEyCmqFiKF2Rs+zgnrqHY114htvauPokzzHx7n/ty1bI
         VF0Nfmig/6f7JQBkv2QEkJOuRTwMs22dLt81vm4NVIPquAydTZfzYWjB6jWL4RGzA29t
         q+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179976; x=1790784776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ptp1S6PEvwhlOiXeXKp9TFp5hhbpIwPkATNA+GKV8f0=;
        b=keYVrYzxGE+a6prR3S7iVRL2qHXmNB0Bbpi6S/Ng1MQu8q7CFDUhmjRMf0OapDOqGY
         VHh5lwcinLuB79nYq528dvZA185RFxOYInlMRSOdVzQ1pnRD5x3Ngs1qbgmJ0Y3IS+wR
         oS5Fq1FsX4ekBSm6/0KTbZj8Kh6+wtDsLcE0hH18xgcujifV9MrMCqDFzqFtAHamuAoq
         YHMjIkjxUeZqGA1FtJePN/77zk3HcdUyiFDvreVtGxjOECNCOraAxM+ueG0h/NZ/x8Ah
         PVwXxJmzhVnDvmX5hekYKnovICdljhXdll2/P49Zat6s7EwnJDWt+/ZgdkiqxTjAELTo
         oZOg==
X-Forwarded-Encrypted: i=1; AKwUvBwssVnt7SMCsmAGA4F3CtDA7XdttJRuuqBnI390w2PeYO82giRsA4GHI3SVxFivVV2uUCYSfXZak4dxMVg=@vger.kernel.org
X-Gm-Message-State: AFuF++nF8Wapl0WFV1PdTBVW09A0uFkfTE+JE9sVvSPdJnUDZMHF38Lw
	ml0tqVw6XOFixm8ghyJdCg2eyC/552sAKkr+hymlhryq2e9e1rU/OYSRQy2Q1jnY
X-Gm-Gg: AYBFou3lXB67uh+EKrviTS9UVIA0ftww7ULpS6DaobL7MBzHKg7+lQryztR+8+HBjR7
	ZQZiMix6tLJL+XjXr7Mw1szE7qDMWUV9mTCA42+lYGodhIhkY/QAg14DHRijh/asnyUxW3zHkB+
	LxrDv7peP9yFug/JI0wRqwI8OfNWeMIDRWzbp4eHHtfDKrvOeemyvyVBkCjfbQnlRBit6lVvoMB
	n8/C3g2tcR/VhOlr8QG26WDB/oZ5LzQ7JPyvL8PlGLGvWKjw00KrsdgIBqskNiPF9jd6deDJ4Nl
	tsDGugNRfEUAWD8dknfFmz935WTreRv/E+n25CaxHup3Zdw6e6lEl1XuHYTkem2eYAA0xqIomBs
	1vimVl3ORwBneLQpm22GPpCZ33xXAKbDGijmTrcEJMRNF1NM4nE0MnO1XI9Uc28DBI67h+A9Hb5
	wSqhL4Gi66je4KhGXx5K/vj0C2rGAcl/gkk/nqh//+dJDZW1PZ7FL7O5mCWLElqUVHwwFCWGQgF
	ZnUHGxkSuPsZrwt0xq1CuS5w8LKPE3h1g==
X-Received: by 2002:a05:620a:370d:b0:93b:d7a0:d9db with SMTP id af79cd13be357-93c2520e6a4mr500584785a.53.1790179975757;
        Wed, 23 Sep 2026 09:12:55 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248223dbsm259134385a.10.2026.09.23.09.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:12:55 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] ARM: socfpga: Fix OF node refcount leaks in sysmgr init
Date: Wed, 23 Sep 2026 12:12:37 -0400
Message-ID: <20260923161248.586695-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

socfpga_sysmgr_init() looks up the sys manager, reset manager, and
SDR controller nodes with of_find_compatible_node(). The returned node
references are used to read properties and map registers, but none of
them are released before np is reused or the function returns.

Drop each reference after the corresponding mapping attempt. The MMIO
mappings do not depend on keeping the device node references held.

Fixes: 9c4566a117a6 ("ARM: socfpga: Enable SMP for socfpga")
Fixes: 44fd8c7d4005 ("ARM: socfpga: support suspend to ram")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 arch/arm/mach-socfpga/socfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-socfpga/socfpga.c b/arch/arm/mach-socfpga/socfpga.c
index 4332af2d8b862..663765280d0c9 100644
--- a/arch/arm/mach-socfpga/socfpga.c
+++ b/arch/arm/mach-socfpga/socfpga.c
@@ -34,12 +34,15 @@ static void __init socfpga_sysmgr_init(void)
 	sync_cache_w(&socfpga_cpu1start_addr);
 
 	sys_manager_base_addr = of_iomap(np, 0);
+	of_node_put(np);
 
 	np = of_find_compatible_node(NULL, NULL, "altr,rst-mgr");
 	rst_manager_base_addr = of_iomap(np, 0);
+	of_node_put(np);
 
 	np = of_find_compatible_node(NULL, NULL, "altr,sdr-ctl");
 	sdr_ctl_base_addr = of_iomap(np, 0);
+	of_node_put(np);
 }
 
 static void __init socfpga_init_irq(void)

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

