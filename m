Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FA33D9539
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696628; cv=none; b=aDMxamR9hpj7bl3l3Em6tX/81pcCdg0YwdzauFm7eEFq7DtQ0Ys1m3yJCYIc9v/HkYh/GNuHUbExFPmGOxKUYL6Gt9DjWH/Lo3IX3ZEIC3bxbJAajZ0f2i9Q3S6EGbVQjeVpiZV/+2j1y+id/D/mSIYBS159s7VGSLs8Sqj/AsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696628; c=relaxed/simple;
	bh=UZI2uJ0GRKNIwaHhWA+c+1oR+tYQ0JrhA39dRJLy9+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBFJQ9+cExcuvx1hO8cHGjrjsHJCbfC/SxtyNtQ2D+oANGwBEulCwESjROm01y1PYHhk8hjc8CN5LOo/I6IwELVl2uE4ke7+0X5L0YeQlHkkm9ogYh4P9ixOz3w1nXsKuyRb5B0TuFlWSzQ3TLay1FftOjdTamCxJ99oiTDoA7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WgC+CS/i; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WgC+CS/i"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 591221516;
	Tue, 29 Sep 2026 08:43:42 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.78.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B45F3F85F;
	Tue, 29 Sep 2026 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790696625; bh=UZI2uJ0GRKNIwaHhWA+c+1oR+tYQ0JrhA39dRJLy9+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=WgC+CS/i2RyQuA6gDnGFWFZ6FvO1nBPhW5iC3Av2J3IB0cR02EBq5F7Tx2LJg8CU5
	 i2XuG2r3aDMr3tFemxKiz8TJZd/SHPzMNW7fhERB2q35hubBrBngDme045IMqKJ5Tj
	 4dO+Jfaf7nu7H/EaQ/wks73mZ/J0/4cp15zytUJw=
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
Subject: [PATCH v3 0/2] arm64: errata: Share broken AMU constant-counter handling
Date: Tue, 29 Sep 2026 17:42:12 +0200
Message-ID: <20260929154325.3416271-1-beata.michalska@arm.com>
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
v3:
- splitted the commit and droped changes for cpucap_is_possible
---

Beata Michalska (2):
  arm64: errata: Factor out broken AMU const counter cap
  arm64: errata: Add Cortex-A725 erratum 3821522 workaround

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 29 +++++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/kernel/topology.c                | 16 ++++++-----
 arch/arm64/tools/cpucaps                    |  2 +-
 6 files changed, 66 insertions(+), 15 deletions(-)

-- 
2.43.0

