Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB7D4E56F7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416184; cv=none; b=MYOKuDXKXEVJrZelDmsbuuI4ZucADbEadVbjs4XIGps3bRV0PugNnjya5cUeFzCg2r0jeUjNN+7FQg7ZCKaOlaMOrmwvX+5UUIOm3ihVf5+H4/Im2zMWfSJKOy432xdxgQcQPJYDNaVGuwTemcn3IAhbORLPfZ7xmDMbvHMrKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416184; c=relaxed/simple;
	bh=9jueSkqmYlMHIeeg3lBLkqecovEhWPcOyvJaWRBbUCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cY+/xOb0AoJIOKXH4aAFx7DREqpVCfiihIa0d7ObSOy+y5XAHBrY6p+xoGQb7Oc0K6zm3EQ9BOWs9ZlGYEiAKj4Uf9hQAIEo4L/uo7v6UQAxKZGdbX26roJtLnGVlycQRgMhy73O4oaHzyAiV0886abkyuBghJI/zDEf80VaA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+VW8taB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+VW8taB"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so571263b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416183; x=1793020983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9H/VnVxiusPMdBOAZJp3aIaXjPwvC+3D1EpnDU0RU8=;
        b=a+VW8taBeuR9F0x+cjdTRiyfB1JWcjyyjNZcslw65vJbvesuJq3S55cCUvvwxvzaaq
         u85kVOUGyvxZIqCsnMBBXZcXiBUbOTXMcyokxiyk3yZAKLHHxbW7X/Z0vIjy6JzQvVHb
         W6pJyvWVvpcNdTCEcpEPlWsR/74XF5b2KLN32zcO0XXeXoCcPPjvTxuHsJ23JAr6SrpC
         OGWPL5aQKE7wtdIwShpz8mtfsithoTdJY+qEcnRLwRGTt77LqY1RaaX1SaOup8///j7g
         1clbiBWlGmdEapuwA3jQ71Y1OCqlEJIQAIg5Aqcnhmx22S2t0Jsv+aTP3QGQomK0qFKR
         Okfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416183; x=1793020983;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9H/VnVxiusPMdBOAZJp3aIaXjPwvC+3D1EpnDU0RU8=;
        b=vbQKMwPwCGVqI0XR2E37LZMspq8CmJ4ulFayxUqhFttZYGiOEVqjh+tu4fUOwegDeL
         unhp/Ibv86mc+SYPrzlLQSc4yZZuxeJP/NHrsSZf1rOKTgb3wd3uKAgFcc6bZf/RIGRw
         nbqVvpq6Dpzk/EZbpXjhGVwPb6M86odX7XvpJ8WrI6FZS0DxskCKmsmWMLcQhTkqWsbt
         q+rrTOFm/XIPsfWdFya2RkuigPbhoOCqzSi2UahQDjVui7ZKISKjXO59/zu6R0xhUNcV
         DB7NAlLNE/vMpCL7R8J+CyABQoudse1BNLDVlhiSjO3k1IUx+lalRvab9NjhwSd3PPti
         4f4A==
X-Forwarded-Encrypted: i=1; AKwUvBzUvsUKAfpiXvYwxwYU8VUQQI2sEkAtcOiMZhwVOlsQbcNvyHlCHYSGCBhE+b/cgprNd23bC0bZGpLWHlg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+B1erZXCOg1KBTz3Fitwlan4yju93hetUWm2eF32wR5c9/G2A
	78catfpKC/f/2SLloNw+7N2A3I0+tXyfBH8YwLcp3Pp7WZ8sH0cfn+TF
X-Gm-Gg: AYBFou0bt66D1T7AQ9X6L/1dK/EGaTzobh3nI5VEWpIhP79saDkxxOdd6cvelhC3rtx
	B/TUQxlCnp0myS2q65ZtH1rT8Ou4DPsEON3c5VvAqP9GXMlsI0TANaFf7EYDSr4jqSaL923GCCw
	AvnMCaZozqSdeEBzdD7hUGCVrKSbjSBhVFa7fC/i5knhzcko4EbsOG+1bS2nLuI+Ei720RGmLsU
	p/j2KiOchAzcA5jfLcvJF5xMMDlBxeJzOBNbYltErwVdNgxN5/RKdCAoOxkcRGAvq5ZYOangsiQ
	fdyfTqolPwCP26TQ7T7KUtoedEas/M7wSLhIcTTpmOZYxyS+SNXpMQxBjMHMGqMwQLVw9C5ImfL
	K8p0Jc40E5BkAnkf8KCG8HA+bBMJx82didPPx0rEKVxcQ6Jt3WMWQF45s63L8UL/A29oIQZY5hs
	/cCE3iMiWWab8825aicDiIEB3TVVCJw+KI7R6Kb9p9xAvtnZwjR2FKD9HwYKeOg6gvRpXD/9E80
	rbnRQ==
X-Received: by 2002:a05:6a21:8284:b0:3e1:c08e:38f1 with SMTP id adf61e73a8af0-3e2262511cbmr7173396637.14.1792416183098;
        Mon, 19 Oct 2026 06:23:03 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm3871323b3a.47.2026.10.19.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:23:02 -0700 (PDT)
From: Haoran Wang <haoranwangsec@gmail.com>
To: Tony Luck <tony.luck@intel.com>
Cc: Ashok Raj <ashok.raj.linux@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, haoranwangsec@gmail.com
Subject: [PATCH] platform/x86/intel/ifs: fix slab OOB in ifs_pkg_auth indexing
Date: Mon, 19 Oct 2026 21:23:00 +0800
Message-ID: <179241618048.5916.3224181188475430685@whr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

scan_chunks_sanity_check() indexes the per-package boolean array
ifs_pkg_auth with topology_physical_package_id(cpu).

    curr_pkg = topology_physical_package_id(cpu);
    if (ifs_pkg_auth[curr_pkg])
        continue;
    ...
    ifs_pkg_auth[curr_pkg] = 1;

But ifs_pkg_auth is allocated and zeroed by topology_max_packages()
(core.c:128, load.c:330), the count of *logical* packages, and its valid
indices form a contiguous range 0..N-1.  topology_physical_package_id()
returns the HW physical package id, which may be non-contiguous (e.g. on
VMware VMM or any platform/firmware that assigns non-contiguous APIC
package ids).  When a physical id >= N, the read (load.c:344) and write
(load.c:355) go out of bounds.

Use topology_logical_package_id(cpu) instead, which returns a contiguous
0..N-1 range matching the allocation.  This is the same fix already
applied to the ISST driver in the same subsystem, which uses
topology_logical_package_id() for its per-package array
(drivers/platform/x86/intel/speed_select_if/isst_if_common.c:301).

Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
---
 drivers/platform/x86/intel/ifs/load.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
index 50f1fdf7d..1563b47e7 100644
--- a/drivers/platform/x86/intel/ifs/load.c
+++ b/drivers/platform/x86/intel/ifs/load.c
@@ -340,7 +340,7 @@ static int scan_chunks_sanity_check(struct device *dev)
 	/* copy the scan hash and authenticate per package */
 	cpus_read_lock();
 	for_each_online_cpu(cpu) {
-		curr_pkg = topology_physical_package_id(cpu);
+		curr_pkg = topology_logical_package_id(cpu);
 		if (ifs_pkg_auth[curr_pkg])
 			continue;
 		reinit_completion(&ifs_done);
