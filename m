Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301637;
	b=5O0qn7h+pUHUJU5K+6saJbNRRg3+FowF714HQWjg2NL5OD+6nnCkQlQIUm9DacA3ohAT
	 UWpNRvVN00+GaFLJ9clkW+bdSh9jdJDX4WtF/s+SjNSYWAQx8971udkNM5uH+hon32JpI
	 VkwztH1pSKdNOH01HK5hD4/S900sFv+cU2CBkZWpk8Imueo5bMelkLfGYPgb93ewfsCyR
	 eOC6jwc9446gvTt0G3SIAIHi1xCETq1ej/hhJhqNSCYCQgu4Ea4eMGx5rAzRniX6FS/IN
	 GmBO6A7hlgAlNKA8wJW/YYI7x3xUjnmbR4V86faVTZF+0ZvbZXHaBtj4OXHt+CnwzxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=14aLGLsWkqwOe+y/LxSquOFPPznEs4fAM/FiOWbWkA4=;
	b=0NpLA0uYVAopnjcIlnosPckb61y3742+4tS+cgKrdZiaQE0gPUN8piQAJUpYMYAbUwSM
	 2WNdU9Es2g8Tv73B2AmB+at6aKIwdAYKA7PyFeMB0cVYMU1cCcbOT9AvUnzPbABaY+Eik
	 D/zUqi3mrXR9bIX1CWjqxfPrd/1MRTAACLB2SHXVv/WqEIbch28B/53fsHx3sc4Q7CjRB
	 mi8CXCHl+1C0PzWzEHoO1tCRPbPcM6qKpw8sDlXvFswlr+3Pq1b98v9tnELJ13GXq1pcb
	 EfxuDy6q48x7duuATezRcm6MZaeOrsjcFOEBWxqVeG/tHmLuNK5yPQjnbWW9ym7JfdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZnlSJYZ;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6EE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZnlSJYZ
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ad98c3fb15so23668467b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793301636; x=1793906436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=14aLGLsWkqwOe+y/LxSquOFPPznEs4fAM/FiOWbWkA4=;
        b=CZnlSJYZ/tWIl/rHPEYZboy9t4UflbqKCUbeQ2R/5vGK6ZnLpKMhxvQFjmrWEJO4BI
         cBC75mIRcTo12jW4KwWFARPrKsZgUSfYp1YFmfrMVoG0V3mTeIFYpDuf8bpmMoGQsAWd
         VhLNG2I6AemeQov+6sEGULNIas+2oVCz86Z08a8SCBsfn9+yOCSzY/aHSTjqXbTpd9hi
         iHeeTcppH7a86dUfRtUvBj1t44VvbseC5BEd5CCuZ5UZtkjkj3d1w5YUm3Q33dtVTh3q
         7Kw1zrXfiqkfOM4RWfWfQbNvVMGoBxDd/90RH91Pfp7NMomlxt+df3M9EF8Elh69BpMd
         lUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301636; x=1793906436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14aLGLsWkqwOe+y/LxSquOFPPznEs4fAM/FiOWbWkA4=;
        b=nMti/M7ZCYpKAZ5dRs2mkbwojdj3ZndCLF4RHmKUwYLEMhbjzniuA7NsidbF2HsO0l
         WNPpbD8M0CeV2/liyJ+ZUe5Lw6pYY7OKsLuV1encGJUQYD/JHDlGH+yofmwba7bQ3sAA
         aTQUYKtLmhiHHj0kmEl0Z54FxbSZKCZffipIRdMxsupaOAmxLH740hSZz3QegQNCuErS
         4ULb/s/mDJEkWZYPKEpV8uKE22fUC/8TL6UBJxs/OCP5GEDJAddXZpviMlrr3Y6TKfFB
         Yyu/QG1VFB+J40YRaUKJvBiJ60fQI9/byeGfuOFdvxO7JxL99h8vy/mnmCLMEeEGyerG
         uxoA==
X-Forwarded-Encrypted: i=1; AKwUvBzwEWv8RbG1SzO+OiZ09aJsesxP9EpKCEizNZ3QOnN57DZXQblFFd1YsnCDY7e7mOPH8YWHsfJe7wsHEtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDna8JrOv2xZgZTu9ytgyShsKRiD78nJzppUZoFkWxCpt6E69u
	PJcDwYa0fvIE06H2I7FsKXX5ZYkXvbgk9mF2FG6hL6otf/DTVLfiFAJk
X-Gm-Gg: AYBFou02LIg7Fhgg1pfKeG3qpwfSOTYvs4Y0W1z06kQsWal3Fno772HW7MaOlBmfbLD
	euOvb64rErqUqN0N9a8FWEa2llvv6NSQMvjK2sJDtFiI5WZMAPY/poQ4Sp9gmnM7z16gM657ztG
	OrXEdgcrl6SnjE1HZ2xpcwGjwglzawPO+Ajam2MeSiTeYBoQjKsOu9pI2Nl8MPGFQX050D+pV9k
	BpHZZJLeHFrcKhWEFfCzqF8i1vW7eOEeH4wUGArBU6v88Smn78GbBW2YASMvsVcCQMTaAmJdhE3
	RZA92nXk4HkZWW+UBtNWpS0H6RSajSTq3co4SOi1VivrOKxt2t+ny7+gFUy7rPx8AAoVYpcs7PR
	sR3g36M5rF9fmR91lplMj/dtLGw5hE5wmhyFFZoHni9k1uztYsne0A5N1Cn6EwiZ/2YtyKbdgvV
	PCwpAxkzkMnsXxfkJ1FNUmffNNlQEUzA71YUW5CthWroAa8hOGAOUkvWwWybVCMaHwatZoruDzv
	hpOfmlt9R66rgz/zqiyUkbCHzess3IKXYDXfQsHEc6RV60WKzAzS0z+gdoPNarrwLZsjApZyJkn
	4eAGh8vwzWTK6W86Bwqo7dihQiydH8ZGFQZsqKBz6d1IOxDprfk=
X-Received: by 2002:a05:690c:34c9:b0:8b0:76e5:ecf0 with SMTP id 00721157ae682-8b1b59e36e3mr50161477b3.4.1793301635871;
        Thu, 29 Oct 2026 12:20:35 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:50::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b4b396basm668987b3.32.2026.10.29.12.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:20:35 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Alex Williamson <alex@shazbot.org>,
	kvm@vger.kernel.org
Subject: [PATCH v2 0/5] PCI/sysfs: Wait for config access lock in sysfs attributes
Date: Thu, 29 Oct 2026 12:20:24 -0700
Message-ID: <20261029192032.1325629-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Many PCI sysfs attributes that read from config space are using kernel
accessors that don't wait for pci_cfg_access_lock() holders before reading:

- serial_number
- max_link_width
- current_link_*
- *_bus_number

If userspace attempts to read from these attributes while config space is not
available (e.g. during a reset) there's no telling what values will be
returned: All ones, zeros, or garbage.

Looking at attribute addition history it seems like this was an oversight
instead of a specific decision so this series tries to resolve the attributes
above to match the sysfs attributes that do use user accessors: config & vpd.

Patch 1 is a prerequisite for the rest of the series. The kernel
accessors these attributes use today skip devices marked disconnected
but the user accessors don't, so switching over alone would make the
attributes start sending config reads to disconnected devices. Patch 1
adds the same pci_dev_is_disconnected() check to the user read
accessors.

Note: That check also affects their existing callers. On a disconnected
device, VPD reads and writes, VFIO config reads, and VFIO writes to
PCI_COMMAND now fail with -ENODEV, rather than returning ~0 data or,
for VPD writes, timing out with a "firmware bug" warning.
pciconfig_read() fails with -EIO, and the sysfs "config" file and
/proc/bus/pci still return ~0 data.

Changes were successfully tested by continuously reading sysfs attributes
while a reset was issued.

Changes in v2:
  - Patch 5: check DSN read errors in serial_number_show() and return
    -EIO instead of an all-ones serial number
  - Collected Reviewed-by from Keith Busch on patches 2-4

v1: https://lore.kernel.org/linux-pci/20261025000836.58294-1-thepacketgeek@gmail.com/

Matthew Wood (5):
  PCI: Add disconnected device checks to user config reads
  PCI/sysfs: Use user config accessors for bus number attributes
  PCI: Add pcie_capability_user_read_{word,dword}()
  PCI/sysfs: Use user config accessors for link attributes
  PCI/sysfs: Use user config accessors for serial_number

 drivers/pci/access.c    | 57 +++++++++++++++++++++++++++++++++++++++--
 drivers/pci/pci-sysfs.c | 37 ++++++++++++++++++--------
 drivers/pci/pci.h       |  2 ++
 3 files changed, 83 insertions(+), 13 deletions(-)


base-commit: f4319f548f7d8cb595ac1c91bfd459876399eeb3
--
2.53.0-Meta
