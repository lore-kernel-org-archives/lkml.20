Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA0A371D13
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775333; cv=none; b=YoBYEZg9hdc2QIeEsT4mjFjf6NgBT++r1MYaKDETBwU2DnmM+rmAuKtUOzlvlkvT7TPBtyyhMqs6lKUMnZPRV+1VHYBxBuujAgGQFUt3mhoGQAY43hkWkXKGY2Hy94Zf5iOCoaAbIFU8BYO7A2iHHScFO+VTEvMCHbQM40nQcPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775333; c=relaxed/simple;
	bh=MKhPSHZ5MhV65xr6BuVgzFg0wGRW5rVUSSJGsXi9CM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aq2YaSH+aVl0x5wM+dQZ6YpvuvdtDMNqiEK3oEX4uIFIzKtFpdnz7Eds2yNlwiqedilGuI8+aXplH+VJ/5wsBo/zlrpMZ1tD7iI9UP1UiLAK0cY8WVRo2/vmqYeTgBnLnBGJpYOCnKSIvXeVoedYlyXwp7wHHkQQw9ipNGyVajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=rmR99MqZ; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="rmR99MqZ"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 545FFC001505;
	Wed, 26 Aug 2026 13:15:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 545FFC001505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1787775325;
	bh=MKhPSHZ5MhV65xr6BuVgzFg0wGRW5rVUSSJGsXi9CM8=;
	h=From:To:Cc:Subject:Date:From;
	b=rmR99MqZbMTy8Crg/jHGbA+PzGeQ3aG1cV0S/e5z5uG0VcAQt24aEQp0UZ4n+sXt5
	 ixWUhRPheY/kodI5ndLA2l0ClaZ7gvHGUIezMrKx9NvlMrtM4v/lf53r0gJ5FN119d
	 pHawu6dReHg28OmaQqB5w+/1D+hrDu956zmo+kwM=
Received: from bse-build-07.ric.broadcom.net (unknown [10.136.28.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id BA434A9A;
	Wed, 26 Aug 2026 13:15:24 -0700 (PDT)
From: Danesh Petigara <danesh.petigara@broadcom.com>
To: mmayer@broadcom.com,
	krzk@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Danesh Petigara <danesh.petigara@broadcom.com>
Subject: [PATCH 0/2] Harden DPFE driver against buggy/malicious DCPU
Date: Wed, 26 Aug 2026 13:14:57 -0700
Message-ID: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series hardens the Broadcom STB DPFE driver against potential
exploitation through a buggy or compromised DCPU coprocessor.

The DPFE driver exchanges messages with the DCPU over shared memory-mapped
regions and currently trusts DCPU supplied values without bounds checking
them before use.

A compromised or malfunctioning DCPU could:

- On API v1/v2 boards, provide an arbitrary MMIO read/write primitive
  through the offset supplied in get_msg_ptr(), combined with
  root-writable and world-readable sysfs files.

- Make a user who reads world-readable sysfs files trigger an out-of-bounds
  stack read of arbitrary extent via an unvalidated checksum index.

Patch 1 addresses the MMIO read/write issue by rejecting an offset that,
along with the largest field accessed (DRAM_VENDOR_ERROR + sizeof(u32)),
exceeds the recorded mapping size.

Patch 2 addresses the stack over-read via the checksum index by checking
it against MSG_FIELD_MAX after reading the response from the DCPU message
RAM.

Justin Chen (2):
  memory: brcmstb_dpfe: Fix out-of-bounds access due to DCPU offset
  memory: brcmstb_dpfe: Bounds check DCPU-supplied MSG_ARG_COUNT

 drivers/memory/brcmstb_dpfe.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

-- 
2.54.0

