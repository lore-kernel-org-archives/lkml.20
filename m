Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FD492E53
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920579; cv=none; b=UFnoXHUNk55RG4xiHn15hkQBlCuIefKsEQnrkPzb+I6ZbmZlmRVQDgLPSx6bIufbEOrcerC2j1Wo3xXfdtSWeRFhHakSOx7X1x6s2H0Wxp8OngMco8sDI25v1rwmJyDQKelIiGpyNHvo+djahL6tGPfMXJqAsnmVKn8QJh8QvkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920579; c=relaxed/simple;
	bh=nNOwCpVAX3p0s96EA+H6jaLxJ2gbMs2ykI5rAVzNsH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1OOXpvU+T2YUIdL6s8gIpL72NVGmD/Sp+lDgT77DK34DaEnZ3uIlOnw2taXk/mF8PKPZJdPfHW9Vpubae9O/0vdh7wp/TDvntP/hl6ZD27xoA/4m8MPVEpW7tshxBfj6gUCBp8/zgpL3wn3u/enXLVCRGhZBm219c05ZE8J2/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwvspjjQ; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwvspjjQ"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a30eb3bso525153b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788920576; x=1789525376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8HvuJIgvYZHLCMZ3KdaCZTooT85AcaXoY9f8Nx7M4w=;
        b=XwvspjjQ9F0z92cmj54/x3wurMTkFitwcqFQwuFBn77qaZbcLW1A4OLduCAGHyVHLD
         /Ymn+sXyy8wMQO3rMozBAnJDSnu+8AeRzstJHclyyi7Z61Sdo7tazL91WzDaHtOOLf/i
         Y5XAoqMkeqjJ5GEuhKaHbvSEhp/qwcV4Kg0x259o4SOJMvTH/Eig22ODdbvrxKbsoxBw
         rOdl2f/ETXaQ9fKgu8EsuqZhiskcJO57W7CnOxvui63oARs3jKCbRFrENDHY8mGRhYtF
         4BBK6En3AcEbCvQuoCfLfvX4xbrYXQCmyYnzXj7O8s76MIgWJMIoLDdVpzDQMn1vl/m1
         5WNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788920576; x=1789525376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8HvuJIgvYZHLCMZ3KdaCZTooT85AcaXoY9f8Nx7M4w=;
        b=swuSrdq0sEb10OkrII89+VArfe1kRk3NIEuKo4KeetV7rH9La7soTeToYNaiKmWTGe
         i156U5feR6Oj/T5P/SZfmJYuv6LcT1YHjaxptdwrh4GxHx8TeWc/YUyZgNZxcSUklrKW
         w16C+OK2+r8GrSZqMnQrbbWK3Tvwh/RF7lJyGfRShmZdArUESB4JgdNBZnir5OVqLMd5
         r6mtUmNnqo54/Q09kr3T59E41n19D2gncXTYrTdymxlJ/ung6NIgBVUyRMiX1kCrp0BN
         +L5o/HgIp6K4tPalu2o9uDafo/76v06awSIJL9c6nOxQkOxZF30Rxt25VeHCoQfiqsUG
         YpXQ==
X-Forwarded-Encrypted: i=1; AKwUvByS+o3QlF1QBdbXj6qGTfc4NMsde4GDnO/aYUSI7sajIH9MkrPoAqDEMY4bUVqnDqIP2ky+1+8/gWeN+A4=@vger.kernel.org
X-Gm-Message-State: AFuF++kPvcdOuMgKdXBihuGsDZN+sN71G0KhZb1GayXfhWXkoKZYusNU
	J3tJ8xdaYe3CR8rY1nS7BsmBNARdpyIroSgxAtDvYSNZytu3UkJ4dOre+f/Un1c5D/3uBw==
X-Gm-Gg: AYBFou15MpST5ygOAhTQoA1bCtBip6o8jfzBmm8uOPnxqv0EpHGgqxiYc+qW9fLwT4N
	i8Ls+5FatElQLOTaeEpIFoC9a4/xJCFTlOTLVHfFA89t+pC/CiF5KtgzLWe0ymuLVBDeGywt+cT
	tFMMwEFwB2HENAOdbpkVfJmLmZpOU+VGGk10y1FahmwWKM9QyKA2PCS9/A5c5hO0WBo+JnFHsMl
	l2Y0yVM/RLDGvUpI5cxO+Rm8b5xMAqFbL4EVq8Op5Z1SDsSLmUUT9AsiourejeZbHSipvF2kQ13
	eQsLcmyV0fYmp5WnpulBLT3l3z9KmW3t9R3oR05wBzj29Yod9eGxvGR1R5AdZMu4t4ztg0DBf73
	olPE3lAU7jPltYpCSzgxOtM4b+EliX8SoBlXu74RIgwSBQ9Ebo8lXjc19puIr4wljCDlzfXJnTU
	JVgB+KbzhB/BIjoGthhFFCwUh+j69AsH/3LQ3pdfXaUR+5miH2TzJhZODpruSszuZuVMGs1/1rE
	Rlrp+GCqfijq6+6SAi3+t3G4Q==
X-Received: by 2002:a05:6808:4f0c:b0:4b2:8d9e:de11 with SMTP id 5614622812f47-4c025dce668mr4332525b6e.19.1788920576516;
        Tue, 08 Sep 2026 19:22:56 -0700 (PDT)
Received: from david-hassan-Inspiron-15-3567 ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971aa12cesm15580584b6e.16.2026.09.08.19.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:22:53 -0700 (PDT)
From: Fahmy Hassan <fahmymohammed@gmail.com>
To: helgaas@kernel.org,
	bhelgaas@google.com,
	scott@spiteful.org
Cc: fahmymohammed@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 0/5] PCI: hotplug: Check pci_hp_add_bridge() return value
Date: Tue,  8 Sep 2026 20:22:21 -0600
Message-ID: <20260909022227.620217-1-fahmymohammed@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909014143.GA123333@bhelgaas>
References: <20260909014143.GA123333@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of a fix originally sent as a single-driver patch against
cpqphp. Bjorn pointed out that pci_hp_add_bridge() is called unchecked
by four other hotplug drivers too, and asked that this be reviewed as
one series rather than driver by driver, so v2 expands the fix to
cover all five callers: cpqphp, cpcihp, ibmphp, pciehp, and shpchp.
Each patch checks the return value and logs via that driver's own
existing error macro, and removes the corresponding now-resolved TODO
entry where one existed.

v1 -> v2:
 - Expanded from a single cpqphp patch to all five drivers that call
   pci_hp_add_bridge(), per Bjorn's review.
 - Fixed the TODO removal that was missing from the v1 patch email
   (a stale archived patch file on my end, not a dropped hunk).
 - Reworded the commit messages: pci_hp_add_bridge() already logs one
   of its two failure paths (no bus number available) via pci_err();
   only the other path (subordinate bus not created after scanning)
   was actually unreported. v1's message overstated this as
   "completely unreported".

Fahmy Hassan (5):
  PCI: cpqphp: Check pci_hp_add_bridge() return value
  PCI: cpcihp: Check pci_hp_add_bridge() return value
  PCI: ibmphp: Check pci_hp_add_bridge() return value
  PCI: pciehp: Check pci_hp_add_bridge() return value
  PCI: shpchp: Check pci_hp_add_bridge() return value

 drivers/pci/hotplug/TODO               | 8 --------
 drivers/pci/hotplug/cpci_hotplug_pci.c | 5 +++--
 drivers/pci/hotplug/cpqphp_pci.c       | 4 +++-
 drivers/pci/hotplug/ibmphp_core.c      | 3 ++-
 drivers/pci/hotplug/pciehp_pci.c       | 3 ++-
 drivers/pci/hotplug/shpchp_pci.c       | 5 +++--
 6 files changed, 13 insertions(+), 15 deletions(-)

-- 
2.53.0

