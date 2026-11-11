Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400824;
	b=IRVt+1CtNpxMwFfjUF9FB/XVP2i5bJ+tRX7+MMnK9zaieA5YBvCBYmMQvjklwO6lhgG3
	 2bEFt5lI3xQAcZY6qoaHa5nHQ5D5amF2oAHndIWHwYiqph76nhb65pJKjgCK1pKjljPj5
	 6HxsuonLQQxBAFsSrD6Ovcu/NDhleBeOooI2cv+vsCJ8lMsCKjx1lRufp0iOoQ5DEYN6a
	 0lhr/xWshrDNfkNjY0/8bDXQn+V1EFPyyLcVunzglyUyGHqpoWaEzVjR6tGFfHbTygomW
	 nCXPT8DnxPPOCkSO8SJO/hgqOvxJnl1zht7FfCNxcq1XlXFxhAPn+Vuhdr1tsPR/MjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400824;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wNO+pQA+z2mGdW/buS+s8Ij2Nth+akjvSz+KUTzTPlI=;
	b=Z30AHJ4xUyP1p5uLAKp4i2a1QNoPXMlaX97q+0ATLUl9TfetIkOlaX0xICbBndIH9d0E
	 cUU9Eugp9GEM0c8vcXHXchBkuV6e4lqHT1XuBWtx+wQNWWJmCKIuh1Rfuxr3WrLwu9sVA
	 c0ORsdGO8xRx6SO/j0rbl/oBvEf4G+LCAaE4k4iaG35FZQgrmRZkppvWhKsTJKLIM0JIb
	 UE2sILwdsdVpdo1Xz3D5x3qpKkan4areG7ioDiUIoqgDLt3e4GCRjZJUQXKmzdUnRyHD/
	 gqIXC3jnX8eAUuJ25Ps4n63tT9M8ednwUQJlo2gb/6d94cDfRTz7UIK3TDPSbEy5DCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dQE2JrKm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2B2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dQE2JrKm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C9DF1576;
	Wed, 11 Nov 2026 04:40:20 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.69.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27C773FA32;
	Wed, 11 Nov 2026 04:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794400823; bh=1Nc0RbxOXukH7jC1DIpqnAnnH8zu2+0RQlLG4QdYanM=;
	h=From:To:Cc:Subject:Date:From;
	b=dQE2JrKmfmCoeWZd9yX1X2s50vjMwG1cj6e4Q2Ae/2h9jxMnbImZ5p4bzWn+zvpWX
	 QHJZN21ceWzJj0pU/ULFnQxcqwi6FIm/VZVOjsy+i3WkUWoBupBSCJvZzYFPGDpno+
	 iIralfhTnzPOSUM3S+QdFZzGCPMkwD9zu/lJVMjY=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: errata: Update AMU workarounds
Date: Wed, 11 Nov 2026 13:39:26 +0100
Message-ID: <20261111124005.2688820-1-beata.michalska@arm.com>
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


Beata Michalska (3):
  arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
  arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
  arm64: topology: Reduce the skew for AMU feedback counter sampling

 Documentation/arch/arm64/silicon-errata.rst | 12 ++++
 arch/arm64/Kconfig                          | 44 ++++++++++++-
 arch/arm64/kernel/cpu_errata.c              | 29 ++++++++
 arch/arm64/kernel/cpufeature.c              |  3 +-
 arch/arm64/kernel/topology.c                | 73 ++++++++++++++-------
 arch/arm64/tools/cpucaps                    |  1 +
 6 files changed, 133 insertions(+), 29 deletions(-)

-- 
2.43.0

