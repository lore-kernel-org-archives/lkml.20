Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46463546F3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914356; cv=none; b=aKRvLCfLmyumNLc6/bmQUFHRXq+7Cg4bQCtY+7NyF2nMz8rpkMwi2pnixieP+UQzcbcUTQHhRPdkeX0d+gw6G2YzUFXFpR6sJwr6BeG3mSvLC3i19kqpHZi98aj0vxFVQd/WGHGPh+Q00CRPmYZkqZ7GsEJrAmptm6wE21NZt60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914356; c=relaxed/simple;
	bh=oOk0mRh1Zu9+TZU2VveQTBrJgYISQnjjC2uG9A/pX+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U98DyDZsbx6nULivvu6VGWsOIJbYZCuAL529XRfRQtrq4oaCx5fVkNmQ7FzRl4MoD8Fm8bWZb7vCZZwww2q9Wv9IbeFPYuRyL/N03g8EV29dOk4pQNp3HvNuaB0Wplh2unr317Iv8EuN5/HyfWXI9XyiHXRVuc5xb7QBtfDUX1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJWo4VAt; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJWo4VAt"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f38so32944935ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914354; x=1791519154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xy+1LeyVsAGyBzZFBYPpptBj3oT6vaEgfVU1QwMeY1M=;
        b=IJWo4VAt4hrJH6on0pL53BB463D925W4AFjy+TK+VIzpj9W0TYCt6Yqfpxk9FzZoJ3
         AUabFRIdiWJoFwdhF1H5/I/COyCpgGzz7xc3ylJDLpEIqQ3n5R0cYvn5Hw3hKIKAzmR1
         GFBsrzoi9Ag9k2+AM3Ijk8G+ZZ405zlgb5pQhYs/6UGBlubHY/jEc2hy5H6wUzDqS13O
         akAMywuJL8HXc4COp311qYEho7BxPfV0DBSyRCYaoSKT17exiXo5HcoD6EqOoQpguEFm
         Ua6g47pjCGnoORfN+9xerLuOnUU4MaE2It3hzoZRH8vzKvFQ+zWLK28soUxV6rIp7sBQ
         Am2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914354; x=1791519154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xy+1LeyVsAGyBzZFBYPpptBj3oT6vaEgfVU1QwMeY1M=;
        b=aO/4Pnozjn5xgvW+NxfG+UwS3GGogZdp4wLthbzPIJkgeoZ/nI5cYceTT9C0R7VhLe
         0bmYwP1/lA/dbEto4gs3J79EF7MWF/7cee87kjHbJgvX19QG/3axF+pcVwucR4rigCec
         c/l+IEfsM/FzMlhGpvb9xycy7uNaz2yoiASFJJ2h9+rbvWBdASr59aMIKsXOm1Hf1Xyv
         Hj7bfCaw5yL2vQsL9uecQ5BahupbgwA8S2qxXQegY9v4caMqZQ0WCfspza8g8bUMa2XQ
         0v1Vt4sIJId5/Krdvt9zPUCbegatwR98ucUVuI3ksRKHIcxvW1bK5m+AOEzDDwf6cIHe
         gDhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEQuIGiGPc2Nzbovf5p3QNuSFFUgwJLo2vjsE8ie4098OQRqWYDp+BinlklQuuTzPZnSO+NjRHcszduyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8WOhGTrqL/9g9fIPNZRH2Yv3B2259a+8M5wn9mKlnzSWOmS6A
	KGc0ZPbjhtJiB0w3FIXgUOLXY3Oi4iop7I6eQyvEwRfcrRStvfbY7L2N4zHIEg==
X-Gm-Gg: AYBFou2ey5F35Zh+V23v8CiSltIPbbkUcH9i8TcsS+Hlq17x+DduaGI0RLma5OmDTGo
	b0O4p6jlIPrwYbUtrecYv8YfaCbfNZtXxSGs55YoRgTOTdzvHL+nd9pmdZ1D7B39IIAz1VJrabh
	71eVCbqmSnp6Gj5BqTjS42hpFgx70NPxdTxzEc5bPOhT6eEBtGxoDy3HPjswCFrbyHCT1Q4nJ+d
	EVN1xp6N1hf1ulZce2rOgMexKlrr5brSYiXOIh18VLfkE6FCJP9TuslfyXHCwEgBlp7hvQnDcNr
	k5YxmD1lo+uGzfsRj5nzMT8KEeVN+rsUxSxhWtMYPvD7UwXnovFxulot6E1lZ//qR/K35p6Jvre
	/vETDQppFkOA3Unagi2tEVSqphfsNshhfWipvR8DDe7oGetNnKdgkudzcrJAQyy1BjkN5/igIMl
	WTeZDcI7f2IcY2IsojxCqXiEtU4Xc6bnCui69+Y2ue3y0959+N8iUz7mucM+DzLjdPGr2zQBeG8
	o56rWDDdcFFMYaV5PQ1dRjzse87PU4eA+FvrMCscWplqK+b
X-Received: by 2002:a17:903:3d0e:b0:2e3:100:10cf with SMTP id d9443c01a7336-2e49b6dcab3mr12216905ad.60.1790914354195;
        Thu, 01 Oct 2026 21:12:34 -0700 (PDT)
Received: from localhost.localdomain (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f680403sm3484055ad.25.2026.10.01.21.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:12:33 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 2/2] sh: add SH7305 CPU subtype support
Date: Thu,  1 Oct 2026 22:12:20 -0600
Message-ID: <20261002041220.133911-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002041220.133911-1-artem122novak@gmail.com>
References: <20261002041220.133911-1-artem122novak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SH7305 as an SH4AL-DSP CPU subtype.

Recognize the SH7305 in the SH-4 CPU probe using the existing
0x300b PVR family with PRR value 0xc0, and expose the processor
name through the SH CPU information interface.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Kconfig                 | 9 +++++++++
 arch/sh/include/asm/processor.h | 2 +-
 arch/sh/kernel/cpu/proc.c       | 3 ++-
 arch/sh/kernel/cpu/sh4/probe.c  | 3 +++
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d60f1d5a94c0..e71b5476769e 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -467,6 +467,15 @@ config CPU_SUBTYPE_SHX3
 
 # SH4AL-DSP Processor Support
 
+config CPU_SUBTYPE_SH7305
+	bool "Support SH7305 processor"
+	select CPU_SH4AL_DSP
+	help
+	  Select this option to build the kernel for systems based on the
+	  Renesas SH7305 processor. The SH7305 belongs to the SH4AL-DSP
+	  processor family and is used in embedded systems such as Casio
+	  graphing calculators.
+
 config CPU_SUBTYPE_SH7343
 	bool "Support SH7343 processor"
 	select CPU_SH4AL_DSP
diff --git a/arch/sh/include/asm/processor.h b/arch/sh/include/asm/processor.h
index 2a0b5713ab80..96321c46ce85 100644
--- a/arch/sh/include/asm/processor.h
+++ b/arch/sh/include/asm/processor.h
@@ -36,7 +36,7 @@ enum cpu_type {
 	CPU_SH7723, CPU_SH7724, CPU_SH7757, CPU_SH7734, CPU_SHX3,
 
 	/* SH4AL-DSP types */
-	CPU_SH7343, CPU_SH7722, CPU_SH7366, CPU_SH7372,
+	CPU_SH7343, CPU_SH7305, CPU_SH7722, CPU_SH7366, CPU_SH7372,
 
 	/* Unknown subtype */
 	CPU_SH_NONE
diff --git a/arch/sh/kernel/cpu/proc.c b/arch/sh/kernel/cpu/proc.c
index 5f6d0e827bae..b6fbe27742e0 100644
--- a/arch/sh/kernel/cpu/proc.c
+++ b/arch/sh/kernel/cpu/proc.c
@@ -25,7 +25,8 @@ static const char *cpu_name[] = {
 	[CPU_SH7786]	= "SH7786",	[CPU_SH7757]	= "SH7757",
 	[CPU_SH7722]	= "SH7722",	[CPU_SHX3]	= "SH-X3",
 	[CPU_MXG]	= "MX-G",	[CPU_SH7723]	= "SH7723",
-	[CPU_SH7366]	= "SH7366",	[CPU_SH7724]	= "SH7724",
+	[CPU_SH7305]	= "SH7305",	[CPU_SH7366]	= "SH7366",
+	[CPU_SH7724]	= "SH7724",
 	[CPU_SH7372]	= "SH7372",	[CPU_SH7734]	= "SH7734",
 	[CPU_J2]	= "J2",
 	[CPU_SH_NONE]	= "Unknown"
diff --git a/arch/sh/kernel/cpu/sh4/probe.c b/arch/sh/kernel/cpu/sh4/probe.c
index ef4dd6295263..7f77fc64258c 100644
--- a/arch/sh/kernel/cpu/sh4/probe.c
+++ b/arch/sh/kernel/cpu/sh4/probe.c
@@ -143,6 +143,9 @@ void cpu_probe(void)
 		break;
 	case 0x300b:
 		switch (prr) {
+		case 0xc0:
+			boot_cpu_data.type = CPU_SH7305;
+			break;
 		case 0x20:
 			boot_cpu_data.type = CPU_SH7724;
 			boot_cpu_data.flags |= CPU_HAS_L2_CACHE;
-- 
2.55.0

