Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510748;
	b=LG4h+gnyCz6wB3e9Qz9k18g2ux9zFstlE3LuQpo/Hxufla4kOO5EjND+3jfJHFJk2UZr
	 DA5VFsatut+7P2xH2DzP7ONvXwVT9szQ3ps+wL9QvGxKKv28NoVPuK7met3KPwLQ4zQGD
	 w0eRYlmKeKya6LJrsxcd0rmG3bmgmqAuoGCygf7AVZtf3bAxcyQ+EpAdODiBVXk1/AXIT
	 C9RIGSNFufueIefmgXV8A/bK0nnq6+T1zNJyGTLCedADBT8g/rPQZs96BUg1+8RCMXXRA
	 8TsmqlHewBOvd3kjMW5mSXgsV7XzlzR9VKQjkKuzHbgO3gmAIfpPZ+t68i9EvpyFdvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510748;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yWml+JngshRUuUid5RG1SkEObLur9Nu2cT1MS2aNr44=;
	b=yoMSpllHY8o6YxaIR/mdMhB1WUqhaoE9xwfLpICCTsTd04TJhRKifD5fcA/DJvNGqA9f
	 0tsrPpbB/CKfYt/JFNKpy6NHfPBAz2pWzrOpllPzmsRkpJUmaNEQTbg9dpZbO8gW0d7kw
	 qtioznDG6gn2EANXJCIMBpwOnYQsO48drdNkNTC4iVO/L4Du5qED7uhLEcgvtiwDoU832
	 Ukgw2l9bKpJUmDgaJfAiGp5Dpw6qs9F0CU4ztIEeFqwNIUD4iy0RveRO2lSNEL0P2snS9
	 bDeJfSyfLtJJINZtSQTM1iC6k1s61Td0JxvOi2sBc0S8EneHqahCIdv+s2JI8KjZAYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RV6+GUj5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ED8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87ED8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RV6+GUj5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C01A1516;
	Thu, 12 Nov 2026 11:12:23 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.66.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD0513F632;
	Thu, 12 Nov 2026 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794510746; bh=PlttUzhxX23541djYNwoGHlJ8peQvw0lYVkwfkBvQkc=;
	h=From:To:Cc:Subject:Date:From;
	b=RV6+GUj5zONdAdXvY7hToWFMeiOLRsPNIoHLH/DztwPKWcVGFLQWKV+yUXdvd4/iZ
	 bkDVEfSMY4VBiQs1r7HfhxiFJUZep72tVQoggSH6x/+OdWKjmcWBkgMTXBlGqHEMnt
	 A8O2AgpDxu4bGRbbhyCup0EhDZH50QLntAa8Tk2E=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	christian.loehle@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: errata: Update AMU workarounds
Date: Thu, 12 Nov 2026 20:12:06 +0100
Message-ID: <20261112191211.3336725-1-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This short series updates errata for AMU core & const counters.
The last patch in the series tries to optimize a bit the paired
readings of both counters, so that the workaround checks do not
skew the results. It is also intentionally the last one, as it
will not apply on older stable kernels.

---
v2:
- Reorganised the amu_read_core_const_ctrs as suggested by Chris
- Rephrased the comments to be more accurate

Beata Michalska (3):
  arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
  arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
  arm64: topology: Reduce the skew for AMU feedback counter sampling

 Documentation/arch/arm64/silicon-errata.rst | 12 ++++++
 arch/arm64/Kconfig                          | 44 +++++++++++++++++++--
 arch/arm64/kernel/cpu_errata.c              | 29 ++++++++++++++
 arch/arm64/kernel/cpufeature.c              |  3 +-
 arch/arm64/kernel/topology.c                | 43 ++++++++++++--------
 arch/arm64/tools/cpucaps                    |  1 +
 6 files changed, 111 insertions(+), 21 deletions(-)

-- 
2.43.0

