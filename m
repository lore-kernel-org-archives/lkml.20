Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AB2DFA3A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527466; cv=none; b=EM3NEvj8Qd47GsVqHmaXR+f6Rgq47toM+P8hpVmkTp7j9TB/3+4AOuIVFnplN0q68Xtmt2R7Q3OSKVbTP7waZ99L8twqb85RvsvDjOfi1fx02SCP3+/J+QdpTkA2yPNum0+EtO3osUCtuRksm0Ygb7FmBZp4QDYF5aXMjCTpV/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527466; c=relaxed/simple;
	bh=L+XBQH44WpfOLeDHic6+FpCkliS5TT26uzehiypPz5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdgMdJr8aR2ykHL7DgG3yrzYBNGxMqwPsyOIMX4XTGwp+2oxIUMngrHAewK3mIVv3vDtokgND4H/+kke0trwPQ5sfbxpBHx51GKH/aBfhUOvBffvlT/ilTLXbYsOlk1lPtLHHNdHIqAvGJpU+yNlTiFc12ED/gT/EIkM4abFcAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkrEr7vo; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkrEr7vo"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a60ed65bc8so19647751fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790527462; x=1791132262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9i9q/dJ0TzJzbLEzaTtZxs0gRFtr74CiVWwdTizVWpQ=;
        b=LkrEr7voM4wWkm2g0dQTWMDgDNDUmekj96Imc3Ym1hLsqQt8Utx6h5lSkVRV0xNGkb
         cjK5FlPDEtzIcpnylSNpEjIqYcunpiO11B7QNjybuELECLgcys+t1Vc1S5xmPKxBhbs7
         17pBtcH7Uu4rXgko4v0tFqm6rTGT5GYqqikK20uxo+Q2uzgJLCwWAiw3Ihee5cYsSdMR
         fUf5q4rgOGtFa0Rs5s8z8QclqeviPfd8RIa7UXcJQO6PJHiSWgp6h2aik+aSr6gmSOOa
         7Sj81lB/FNuyc4SRiniJcPt/mcH5325BmSv6EiPedv80NH5b2yi13LGpwISDEiovbcKx
         H4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527462; x=1791132262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9i9q/dJ0TzJzbLEzaTtZxs0gRFtr74CiVWwdTizVWpQ=;
        b=YE+gqnfDqzSUy95BIJ8Gh8xEuE5eKGJayR26gszJcg2kegRSUV5vwwjPxpbb8uZCpQ
         rI3+okdhf7Cpfa7B+RJztwOD9ynZnZfx83GJufZOPcqXrhwJSpETLbWMTf5v4TPUFiw7
         Uw/8laWK0W8n7SkryvPVGUfBYNDcfT08kYImZ7uGJLKtCsCQfd1YT81pDp+xEbKA8Lgd
         wZUZhU75Ovl8Q5HhjxG282DBhlVWEN9uv7ke7PWloFHkwhl6OPTwtVv2jvm+b4c36kMg
         2pFdFiwUEHTou1ZsgUZyBRuXws3JMWmAwOdVSWxpLByQ/KwJf3LPH5f09U2QQGAGg6/D
         3XuA==
X-Gm-Message-State: AFq9FYJ3qG4vKG/fLrlY6irg31DmimFaKmk9IxEVBI3f1MNF32np0/Na
	CMLV3/r25aW6/1R9FPpAnkaBiuR4u2ORM3BVsxu2MV0tmhM2RjhtXI02BXF/WzDe
X-Gm-Gg: AYBFou10p/sPT7bJ1MSoJ04dxvcKJu6IHFFSOTgkFGW9RXFfdp5SpDYJpQGGV5pV2i7
	JVVv/Mm3k9uLjNnBFNLGsCSwr+dKWKh8kzShR56W7mHLvTSyAxyB+SQjKRoUddk7CHFFThNQDXy
	j7Q9IDNGFHrWKhQbU/XAmPe0vGPJsalKRQZWYn+dSxVRb/v9zysL8S134ccrMEDWLmdUxrS8mWI
	CTfJCvD5BiNHrFpghkEIC845H7h5uT/MgDVV3Q8qeMVtjnymynPFHq/WI9TSoKECbR5hV+ij2tW
	xm14KY0uqymgO1jblq7e1QmLXqVEi54Yb7/jREXryLPMgwXJXMqOMSnERzg0fNrtX7rSaztxKrW
	kJc/jISrsfFW/XXz5kh/Io9pOp5GKzSrd1eFbiFV/a23ah2xymHGmmVKg/Moz0goEjtNAmi2het
	y32Ccry3tb+SWbG1R+E5nadno0uAIOrfyU+/+9xD+y9v9oSxHJA5Auen1dYVsllD09KSr98BZqd
	TfgVv8NBvOyCDYQ4Yo0g6oCT/VOMrlw
X-Received: by 2002:a2e:b8cb:0:b0:3a3:74b9:8a7a with SMTP id 38308e7fff4ca-3a63c410288mr30893731fa.19.1790527462361;
        Sun, 27 Sep 2026 09:44:22 -0700 (PDT)
Received: from artemiipatov-ThinkPad-T14-Gen-2i.. ([185.119.0.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580b28sm22425781fa.11.2026.09.27.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:44:22 -0700 (PDT)
From: artemiispatov@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: tglx@kernel.org,
	peterz@infradead.org,
	anup@brainfault.org,
	atishp@rivosinc.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	hui.wang@canonical.com,
	artemiispatov@gmail.com
Subject: [PATCH 0/2] *** cpu/hotplug, riscv: Fix CPU stuck offline after failed hotplug attempt ***
Date: Sun, 27 Sep 2026 19:44:16 +0300
Message-ID: <20260927164418.3090433-1-artemiispatov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Artemii Patov <artemiispatov@gmail.com>

These two patches enable RISC-V to retry bringing an AP
online when the control CPU failed to complete the
SYNC_STATE_ALIVE -> SYNC_STATE_SHOULD_ONLINE transition and
the secondary CPU is stuck spinning in cpuhp_ap_sync_alive().

The need for this arose during debugging RISC-V SoC. Control CPU tried
to wake up a halted CPU and sent an IPI via OpenSBI. The IPI was masked
while the secondary CPU was in Debug Mode; when the CPU left Debug Mode
it saw the pending IPI bit and started processing it. Meanwhile control
CPU did not observe the ALIVE state within the timeout in
cpuhp_bp_sync_alive() and aborted the bringup. The secondary CPU
eventually entered Linux and got stuck spinning in cpuhp_ap_sync_alive().

A retry of the bringup fails due to both the current sync-state
switching in kernel/cpu.c and the incomplete SBI error handling in
arch/riscv/kernel/cpu_ops_sbi.c (see the patches for details). Both
behaviors are addressed by this patchset.

Artemii Patov (2):
  cpu/hotplug: Skip kick stage if the AP is stuck in SYNC_STATE_ALIVE
  riscv: sbi: Accept SBI_ERR_ALREADY_AVAILABLE in sbi_hsm_hart_start

 arch/riscv/include/asm/sbi.h    |  2 ++
 arch/riscv/kernel/cpu_ops_sbi.c |  7 ++++++-
 kernel/cpu.c                    | 17 +++++++++++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.43.0

