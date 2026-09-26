Received: from mail-pz2-f31.google.com (mail-pz2-f31.google.com [74.125.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9393009CB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396654; cv=none; b=TM4Md5Y1C+aJqaxqfKbtCACSxLl38rci8843173Km7mbFjZp51LhQ4w9chU9svfQXx6mzi3UbDOeJB1b8IuJnVfJ7HbxtEcf02mCKhq3L6pPaamJ3CIPg4RucuQeWLXRLEd+ss/XsHjRGfcTzCcVG2S/8Njoo6dblWskTmz5IbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396654; c=relaxed/simple;
	bh=O2/+WEYXzMAVhFRsU4oTF3cfi2iLBRmM9EnhsqAnT80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrQvUWDSxyq9D6bRMoZ7VXzNGIHybFddiEEl6lEfeBbjTwJfWX9pRDCoTThyPeG4RzUzTImh65S+DucUVKV2qclS5G+UNdPLTGHK9hYkHkxfemvpU7ZgIW1qU+XOsnGF9mBxDVvdmiqbMecVvr4eD8CUiIqfpHFUVXiw60dnAow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4aXCG/e; arc=none smtp.client-ip=74.125.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4aXCG/e"
Received: by mail-pz2-f31.google.com with SMTP id d2e1a72fcca58-8814e797a5bso127730b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790396653; x=1791001453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtAmnq7GHFyoC+l0IK8HL+LJqCl6RnngBlg4/6pPAk0=;
        b=I4aXCG/eR4OwSSar80NU1pv58qwCXMMWTefdI/cO/tw+dY70SsrInEDCfcKWjJj8Vh
         mswywTbJyaDqLvErhuFjDbHtjOHnBj0YIhq+h/EoDSYryMbWO8h78hjsbdPq2gupvXYX
         C/i9qaIn6WBg/MMzjAveNNGBtNbJzBLpAgF8bPxPdwGt5aMQKLoltY02QC2RsrbKehxQ
         wwPrE6hBlQ0/PGrfdJVNr78lA8ZV5ehgcdN611X9dBnE0qPjI64phBgpN/S9bYldp8NL
         5qt+txF1HYILUD35RF4TExHpeyx1acUOEy2vJkIGjId/BBp2mOlSNovXX/cc8DfB3Dc1
         YOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396653; x=1791001453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtAmnq7GHFyoC+l0IK8HL+LJqCl6RnngBlg4/6pPAk0=;
        b=2OsT4KA7mNOcA/7+X+52CyR7CnuHJyNjIwXc+WFiKXnkvcOZXnSQVqNMfl9LQehcmI
         3Sa8UBghVjQHiZ0LFQTJcUPnVeEoIOdKpIgfutl+gqvBcaHaW3TcHkGD0hzu/DlfepVp
         rxfKN3IcA3qiODXV2GLmrO/q9Orv0gkrEKO0VQMwRUz6CYsNY+ETN6U88j6t3Hf+fe8U
         SSbg62WylW7Z/yal51ifqdD36ZT+e/6jEamU78JbaHc7wdHeLlXuZ+RGhcocszSUSzUc
         To1yYFNr8SyrhJdfrdnBjU/sPT261ryq1x1xSsC+Xkpg6E9AIj97OdlfPxFZK6WYYXwp
         oxoA==
X-Forwarded-Encrypted: i=1; AKwUvBzZKkRKaKluMB74MsYcG1zJ/qTLIIfoZifbZ1qDYsatxhXc4OQxSFoaKC/eR1UfmLkwIafdJgttcXGcIKI=@vger.kernel.org
X-Gm-Message-State: AFuF++kni3xlL3aXPbo4JabRRCrZc58XctL29HfJ8nOlK+34W6itH7XK
	ibUrO/qC+JCgrR3cpnkou9f5ON1P7iSSexOdLqX+uNWV+NDIThMTjuf4
X-Gm-Gg: AYBFou2/Si+2MA5JG+PoO8kAKNbSp0QJzMcKj+53fm/xuNMkrxNEG6huefmyhJK48nA
	1WrTmCb1/8uERe3YGf2vc0yjTG09Bbuoohu5K3/PDKSyNkCgpBK9HlWpVtqHGIYNuQeek8fXoX/
	Glhfi3CjzRMK3kG1l/fJvr0KDRvP1H5KDq6LWqTBMfWgYXkBpVnWFHGP5dLgEVIVMLF7zBokfVR
	bLvCwfy+jCwDc5c7CAqNnDarhNCC/iRnrkBebL+gXLtKl7iHa/uqwoeC8wWVpU05wMZqsFGYeOV
	uxQsGu82BdUoPdN+pe3J+PMgK3sYEbe25p3dAVILPmj9TF0rpHq9hpU3gxMq+hUYFfo7xGf6C4U
	IjsnND9mxpE8Y1OJPoy1voNvD9oD3JkPs/E7sXtieafXUXfj1iXAw/jvHaosD6gIrnCkAgFd/P+
	nJ2DyXRk1hxpQ6GjA/tWtJhJkTssqO59OEJj8iiHQTEzAyH7xeLUA7v6bmwThHnkubqfK5VkjPH
	jjkXU8qt0r8GH6w3ohs7/6k3kgxQ9byTqtPRvxx+iVBXb2tlWB2vFM94LG1ZT1OPkStHaGdiXbZ
	f5R6d5uEEPYU86qEpER+dJLKzgIWQzM8Rtm9+gJ1ad+eECaFHw==
X-Received: by 2002:a17:90a:2ce6:b0:3a0:a055:1741 with SMTP id 98e67ed59e1d1-3a0a0552127mr3650622a91.27.1790396652570;
        Fri, 25 Sep 2026 21:24:12 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ca127237sm2005316a91.4.2026.09.25.21.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:24:12 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Antoine Tenart <atenart@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] ARM: alpine: fix device_node refcount leak in alpine_cpu_pm_init()
Date: Sat, 26 Sep 2026 14:23:32 +1000
Message-ID: <20260926042332.1633698-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns the matching device_node with its
refcount incremented; the caller must drop it with of_node_put().
alpine_cpu_pm_init() obtains the "al,alpine-cpu-resume" node, maps it
with of_iomap() and never releases the reference. The function is
__init and runs once, so this is a one-shot leak of a single refcount
during boot, with no functional impact.

Drop the reference after of_iomap(), which does not retain it; np is
not used afterwards.

Found by static analysis tool CodeQL.

Fixes: e9e06f2853dd ("ARM: Alpine: smp support")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
    hardware; I have no Alpine board.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 arch/arm/mach-alpine/alpine_cpu_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-alpine/alpine_cpu_pm.c b/arch/arm/mach-alpine/alpine_cpu_pm.c
index b48da6f12b6cc..332c3c00d3680 100644
--- a/arch/arm/mach-alpine/alpine_cpu_pm.c
+++ b/arch/arm/mach-alpine/alpine_cpu_pm.c
@@ -50,6 +50,7 @@ void __init alpine_cpu_pm_init(void)
 
 	np = of_find_compatible_node(NULL, NULL, "al,alpine-cpu-resume");
 	al_cpu_resume_regs = of_iomap(np, 0);
+	of_node_put(np);
 
 	wakeup_supported = !IS_ERR(al_sysfabric) && al_cpu_resume_regs;
 

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
prerequisite-patch-id: c5a3be8688fd8e88a00352acb1374e91fcb52a03
prerequisite-patch-id: 67693e2c08624df0841619cc085ce9200f4385fc
-- 
2.43.0

