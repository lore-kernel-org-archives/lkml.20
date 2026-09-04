Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C569735AC03
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501257; cv=none; b=U21fRA6Py0yOht1lMc4QGZ8JzHusaYMsP2PxLflH51yJ3goqmGoHYDFghwkIw5P5+GcEHjXe82+mS5pT0qdgbO+BWLHIfSIx98jXK35U43Pqk8jpP8PdHtFvg3OxfNW9T182fMGu67WwdWkpjM5VWG7HfgRqizB54QHdzKny1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501257; c=relaxed/simple;
	bh=GxdFFEBziRWArRZIYgTS/uaZ4xH7TbMAI2n25jau+FU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kNNkYsEoBSpu2tv/2BgW41/B58FljmZeK1mOfiBhvXsNAgsfhnbglNoUJxm+Dq+s4b5eEUKp8QdbYBiGxyJlHifYSQBk3T2WIAeMzP2bca3+aXKljflaZMNMVnOrVqCxOfh0LREozSg/gQT6YbPDfgjZqye5M0AZb1XnyZLIKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFfXVZ5s; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFfXVZ5s"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so3239605a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788501254; x=1789106054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0e1R5GYTD1G+kVWlbZTazQ1YNcTLXzOn5cXd3jmGpV0=;
        b=IFfXVZ5sUrvTdLMw7mI+Esudl40+0NmTTnmUqoPa6V0UA80TRVeM0cbJ04tWtq8680
         VIDW+i4i6qfXge3NpWMYPyX1NLuQt5ts4C/h+Y3R6vtV+HDJpczPpgPnRw3ETLIb0SWT
         3hD/Tx0Iz4E3idKVp0/MZiKiuNFt+qMVvEVpoL3hCINqmSDH/SkeltVqiT1NAyfk9f5n
         L1ROZdbXvsHqKnZ5WU07iitA2CsQ1jKwpRziyNx7vb4CMshpYGi2quPLEEKsOm7N21mN
         utYoNz0pY2iHNayFl9cRFZiHQ6MdZIbXE709PZJmIqcCpfgKOFZYf3eEvCKX/U8VtUC7
         TXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788501254; x=1789106054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0e1R5GYTD1G+kVWlbZTazQ1YNcTLXzOn5cXd3jmGpV0=;
        b=AcI3uVnvYRAHCmRAKs7IWH6q7u/Z/KyMJEcIAhvZLuPFlqEhSC4SH02sqT5hSQvjD7
         d6vllNR6dRW7dw2MZg7N0+F1PTS7S/4N6wB0PQos6UfET61vMUTRefs/6fwlK5H6FCOv
         ZhCLixP6cwadtTaIbeaNC1wscuQYog2zekJzrW2vKc8dtSTVQOZw5NmpZ2f8Ggoi44qs
         NfHGsRPEDqtJCXVEu2HVaGbzvZuvekDCm7TQNLkrBnxrfPpXq1EesWYrMklTGK2KLbmG
         u5HYepa+lzWpV/atd8LuxMp0G3DOqVc8CxnthfvgmMPVKnm5YSccg+0yicyZOJhBDnQI
         j3nA==
X-Forwarded-Encrypted: i=1; AKwUvBwlEWXzzkbyOxDaFwAKl5INCNq9dsJBFwtTi3Yzj4kgsLo8EgXjGdrG+2T9hWNArJz7Vzype/VlClAh8AY=@vger.kernel.org
X-Gm-Message-State: AFuF++kyvMqtoYLcx2LPmApWZB4eMhHsZBkTNM+DFYIo+F+5B6FQhDnw
	oGpu9tjPB/EHqPqiPCIm4/Y3jZ13SD6KfiMOF3LY3pPorh4zVMFVc0e0
X-Gm-Gg: AYBFou1BeGEjpVJqn+wfo27hosGIWxv4wAHDnEEYcE5hCeNt/NcX2/gIPyKzd5wb2Zc
	sW7l2eP77ZVMxyCxmnAkSO/J3NLSFfs7l1ufBBIMu1DXotO5JXn6PpI6eiF/BkF4D16JMNfXZO7
	Q1H5fRJvMKZW1V5xK7ufJlVgR7OjC1/Fr6c2aZW2Bwyp3F2WctpYPdJhE+hvER8r1ks47xQpvkw
	Cftitbed6EGzjwMCoQFwNMRh8efTdaFMATpXrRnTUOnDVZ8+OLDjGlWvQjg92DFqqerLgBn88OA
	3hxg03MHD5l8pY1I5Mp4RDp1qpPk2CC2t3RcJaHuYBGjtWYkiXFdEI6Rr4/of0z6Ea9c82buVBq
	3XedR549pWo1mLgbP3p9BlB7fEdugezkKdhxsMjDM7ynb52XZKZVq9Ec4S0wZ7D+Ey3dq/HTBR0
	wr1gh2EhLYtK6IuFR8MnMnnfi5ZezKnjXcVczLhdlFcY20VbkLiBpRGNqjg7ToqqF1Jp9TuVOxx
	vmiobYmatmXDEEIu7hwOWjAX4pYIjk=
X-Received: by 2002:a17:907:72d2:b0:c25:f7db:4be9 with SMTP id a640c23a62f3a-c2610474cfcmr108471166b.15.1788501253841;
        Thu, 03 Sep 2026 22:54:13 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c01sm55918466b.62.2026.09.03.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:54:13 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 0/2] sparc32: fix SuperSPARC SMP synchronization
Date: Fri,  4 Sep 2026 07:53:04 +0200
Message-ID: <20260904055359.327050-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fill two gaps in the SuperSPARC/Viking SMP synchronization paths.

This series is based on the three sparc32 relocatable-kernel fixes which
honour and derive phys_base and advertise the relocatable image. It does
not include those prerequisite patches.

These patches can be found here:
Link: https://lore.kernel.org/sparclinux/20260816075141.3489194-1-linmag7@gmail.com/T/#t

The SuperSPARC Family User's Manual requires software to keep at most one
Demap operation in progress across the system. It also says that an MBus
system must ask every processor which can retain a stale translation to
perform its own local Demap [1, sections 8.5.3 and 9.8.2]. The Sun-4M
architecture specification likewise describes SRMMU flushing as local to
a module [2, section 7.1.4]. Patch 1 serializes each complete shootdown on
sun4m and invokes remote CPUs one at a time. sun4d already serializes its
Viking Demap operations.

SuperSPARC maintains I-cache coherence by snooping, but FLUSH is still
required after modifying instructions. It drains the writer's unsnoopable
store buffer and clears local pipeline and prefetch state [1, sections 7.4
and 10.2.5; 3, section A.8.2]. Patch 2 executes FLUSH first on the writer
and then on remote CPUs.

The series was tested on a dual-CPU sun4m SPARCstation 20 with TI
SuperSPARC processors and Viking/MXCC:

  - boot to multi-user with both CPUs online;
  - 200,000 concurrent mprotect iterations over a shared address space;
  - 12,000 executable-code rewrites checked on both CPUs;
  - removing flush_icache_range() reproduced a stale instruction on the
    first rewrite.

[1] SuperSPARC Family STP1020 & STP1090 Series User's Manual,
    Revision 1.0, April 1994.
[2] Sun-4M System Architecture, Specification 950-1373-01,
    Revision 50, July 19, 1991.
[3] SuperSPARC II Addendum, Revision 1.3, December 1994.

Magnus Lindholm (2):
  sparc32: serialize SuperSPARC demap operations
  sparc32: synchronize SuperSPARC instruction updates

 arch/sparc/include/asm/cacheflush_32.h |   2 +-
 arch/sparc/mm/srmmu.c                  | 120 ++++++++++++++++++++++++-
 arch/sparc/mm/viking.S                 |   4 +
 3 files changed, 123 insertions(+), 3 deletions(-)


base-commit: e6de5705a9f0d81f67bdb2917108784b5839cecd
-- 
2.43.0
