Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C8D395AE9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354913; cv=none; b=cSuHFHTDSupAb4fY91eOsDMh7B5281ficKPQxm/IerFc56VAvF4Hc4zMgaCRskssoE+CHiLEVcS/1ZGUGD4hrZSj5M1cZCgDpvb8DeBscIQc+Y0+HH94eLUJeznWgWue9obpvoOF1zQrwqZxQ7aaBerAL6Gq1vZScEz1pCMrK5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354913; c=relaxed/simple;
	bh=ANiyNAzq9EBMHsGO45jafQjAapsSSbkejyGpl0OH5LE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rtS4AmkuOdoO5aDDsqhJrbHB4dGaDZKhgo5m6BBCGPw57EmAHLf1QFvAYPhrjYeukAqFl6PvSjOdJsC9RDjr8MUHLHDLVKhZ0LvdveqjH6tLLqDUCr776n+Wd1oqJ6WfujDncn8TxWGEnncsBHJlmo1F8lPssN06nGK5bQLNFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DtE/20y8; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DtE/20y8"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so9770585e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790354893; x=1790959693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F4SmAOu4LRaXeJAwbnJSCkU55b6d+NP4hrpFwQbS6QI=;
        b=DtE/20y8m5vw0NcLP0mNHB9FraAcCgPVXx18THIi9mXi1TeOLSZHTDHHIsyIgtXhPW
         /kdCxvJDJRwwCv4R2+r3NWD2W374rUv1jQoJQDK6xwA8qOCtRL40L1hkqizHu5q3tvCd
         oawoy5HMyPa3S+1zofK2o9qq08nT84jjUYPG6DSbxmx6VouLsBaBAtv8SLgb8maz8C1E
         20EHuXH0N+UOi2epiOkAqSP08fZ4hIMRYT4kcKQceYaRdLgglMJVwt90iP48L4P6r2Fn
         CeG3Un0LeQS6b4RMMxZL5RB2WUZdPT3kyo//UvdOkKJOP8UuKbpBBY/Ckzwkr/jYNpd6
         30OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354893; x=1790959693;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F4SmAOu4LRaXeJAwbnJSCkU55b6d+NP4hrpFwQbS6QI=;
        b=ea12DVTriRBtgjSR+NYR5WwGQ8Iz8OC9PLf5TMY098Q2lmnD7buuwLOw55PJDsV+Oa
         NCTVLuvswuI3djSgflGSQfFz9n6cgrQGPQ2iNllCKqoTVzrIB8j1U3V8lAq1wYmdo2TU
         q+dua9nlAKAbm0TmOkfMzSY2VrKXMLIF7/qXjCN1VfheXCTuEhVBaOUDdtFZLI56zz/0
         i2leDliE2xDoLu3iNqJO7fP4E8TEhPKT0rhHYBC5N0Oh3xzJjZhl0N+o3/VumglHNyep
         fxevNe2hrH/diUPBHPZysCj//TnFjH1plxgG1ExOfYGkgDEwOXln0sKhzWj/iS7DyoYa
         uDvQ==
X-Gm-Message-State: AFuF++njakKhiX+6YvLX23qxIhrlPQUEuaaMeZTLeCAFXVGh/Ox5sNMs
	/slkuvnW+4HiPPgri8AjnMYNnANIXYgjaZsSliqoJ6Adh2lSKmKsxu+2Pr4ORMCfWox7e/j1KQ=
	=
X-Received: from wmpl26.prod.google.com ([2002:a05:600c:89a:b0:49f:e58b:90d5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e8b:b0:49c:fc6c:be06
 with SMTP id 5b1f17b1804b1-49ff06eeb73mr50524815e9.29.1790354893192; Fri, 25
 Sep 2026 09:48:13 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:47:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925164801.4047844-4-ardb+git@google.com>
Subject: [PATCH v2 0/2] PCI: Allow non-prefetchable BARs in prefetchable windows
From: Ard Biesheuvel <ardb+git@google.com>
To: 0001-PCI-Tolerate-non-prefetchable-64-bit-BARs-in-prefetc.patch@google.com
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Ard Biesheuvel <ardb@kernel.org>

The non-prefetchable window of a PCI-to-PCI bridge can only decode
32-bit addresses, and so even 64-bit non-prefetchable BARs of devices
below a bridge compete for the scarce MMIO space below 4 GB.

The PCIe spec notes that marking such a BAR prefetchable still permits
correct operation as long as the entire path from the host to the device
is PCIe (PCIe r7.0, sec 7.5.1.2.1). The same applies when the OS places
a non-prefetchable BAR in a prefetchable bridge window, and so this
series permits that unless there is a bridge on the path to the root bus
that is not a PCIe Root Port or Switch Port, allowing 64-bit
non-prefetchable BARs to be placed above 4 GB.

How a host bridge treats the windows that firmware describes as
prefetchable is platform specific, however, and so this is only done if
the host bridge has no prefetchable windows at all, in which case all
prefetchable bridge windows are carved out of non-prefetchable host
bridge windows. This also means that devices on a root bus are never
affected.

Patch #1 is a preparatory refactor of pci_bus_alloc_resource() with no
functional change, and patch #2 implements the relaxation.

The series is based on pci/for-linus, as patch #2 touches the same
lines in pci_do_resource_release_and_resize() as commit d58384c22739
("PCI: Fix BAR resize for devices on a root bus") queued there for
v7.3.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Link: https://lore.kernel.org/linux-pci/20260910143440.3865663-2-ardb+git@g=
oogle.com/

Ard Biesheuvel (2):
  PCI: Add __pci_bus_alloc_resource() to allocate with explicit flags
  PCI: Allow non-prefetchable BARs in prefetchable windows

 drivers/pci/bus.c       |  70 ++++++++++++++++--------
 drivers/pci/pci.c       | 115 +++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci.h       |  11 +++-
 drivers/pci/setup-bus.c |  58 +++++++++++++-------
 drivers/pci/setup-res.c |  29 ++++++----
 5 files changed, 228 insertions(+), 55 deletions(-)


base-commit: 9a8daf68b9b30c536b0991d9f098ed0db80abc1c
--=20
2.56.0.rc1.315.gc6ed9934b7-goog

