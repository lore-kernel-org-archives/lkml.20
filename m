Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D338A4B0497
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845261; cv=none; b=BDHN5b3EJ094dM93EMwaXN2vnC0G0RYmVNlZop2v5CKIQ4mab3Cq9UWXxly0xAyfKwU5/BFQ7WknqYDhe6Mc53+gE/W4uDSPsB2drLeNZPvh8k7rBNlFZRxbHS5DpBnw1INaEhgK7qAzIkYyHz3xLn+qW4C8GNO/DXP/hwCaTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845261; c=relaxed/simple;
	bh=KpFLlIbgFKmtwym5+idRmX6jfxg0rnNaBCB2tjQsIU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cDutgA01o0JCur/+IGgXp/kJ2nubrJY++GCL1TgSejPgP8IyjxFNqZL9VcfCIa6+S8CHL/bJ/Pfqcls+qCWLQA7FKzNnFETv/nn3nb85N+3dOLTsyQ+Icy1GbsHxrAHqQrsNqOdmEERRxuAxTPEhWsop/nOPITC9zWq/H2sQIrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GJhVN5vM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GJhVN5vM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7310497;
	Thu,  1 Oct 2026 02:00:55 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.77.101])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFE413F85F;
	Thu,  1 Oct 2026 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790845259; bh=KpFLlIbgFKmtwym5+idRmX6jfxg0rnNaBCB2tjQsIU0=;
	h=From:To:Cc:Subject:Date:From;
	b=GJhVN5vM/OElXdPKTUMu/gwzOf/WZY9CLVYrjyjQRbxmYyJqfDvbcYQ6uYy5b6MJr
	 Dhau8RyM4IeTF7B8bPhMJUHzF/8iAkHJAOt9iIOI271aowTWPnUMQH8gvwAGsbBrD7
	 8YPuihgLShhiJzC2slcyRbzZIEZwsJzHRFzNYQXk=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	James.Morse@arm.com,
	xuewen.yan94@gmail.com,
	seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter handling
Date: Thu,  1 Oct 2026 11:00:30 +0200
Message-ID: <20261001090050.3849551-1-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
counter workaround into a generic broken AMU constant-counter capability,
then wires Cortex-A725 erratum 3821522 into the same handling.

---
v4:
- use midr range instead of multi cap list
- reword comment to be more generic

v3:
- splitted the commit and droped changes for cpucap_is_possible
---

Beata Michalska (2):
  arm64: errata: Factor out broken AMU const counter cap
  arm64: errata: Add Cortex-A725 erratum 3821522 workaround

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 24 ++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/kernel/topology.c                | 16 ++++++-----
 arch/arm64/tools/cpucaps                    |  2 +-
 6 files changed, 61 insertions(+), 15 deletions(-)

-- 
2.43.0

