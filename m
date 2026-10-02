Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A730429825
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936052; cv=none; b=KF+FjpuqBaWro7LtBSmzXOsIeOD0/fqgUi/yH7OzFvtuU59NrP5JscSSysEcBDGjebS6eF+iLHq983l4/MdG9f8N8OEdvQucKXRJnXD1pGngoicEYErYqUH7V25aB0BXJkXt0hprLm8SSEer0oZ7mKaFgncYdrPi8GRrDkoGALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936052; c=relaxed/simple;
	bh=d29mPynXlVU5IrodkVbb7jj8Q7XCINfa0kl3/5j61qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q21BM57L3DSJQ1S1I1jTxP2UMBjxNu6nUzEL0Uspj7ZdUE56duwsPniZOxK2GgvApSIre3VKw5FYHq3ON4xyD3Sj3/yE7zs/KMkUJVtY7F+nO/lFrkEvyBPOio3HTjwdtZpHgX3fHJvWM1zGCKSH4lEu7fTAQJJvlM76bkwfcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLN6gfyN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLN6gfyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1532D1F000FF;
	Fri,  2 Oct 2026 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936050;
	bh=/EuUS+BAWIVHhkVwRoKy4GSJcLZm9mUpQPw2aPwcarw=;
	h=From:To:Cc:Subject:Date;
	b=BLN6gfyNjIzWg592fd/fSnZ7e0bbuahDsWvcpp0ju01WAG/fWPGEqY6YLJ8HHzq5S
	 xk2rAmo4jSpHSqyuzoxMbFD+WDeyhVnTXpMh0bZ9GCtYsScPHxpBgFG/eb5j+ufGFj
	 8EtZW8zX+176CoPC3/OA5T5GWCMT+nak+r5tZwzZhPhxZi1zVYAGHS+ubWLcoutlRT
	 lKXj/gT6BSXK0LahghtK6eEkvGgpHXAr8/LQ6w8VaJMgJV4wlPk2//q+Y8gMJKRuNl
	 R/QqphTF7sITAWc62i65dVr9Mwbz0E34wsTCynNXZQHjrYS+gtbfGSPzDlhx4yBa8o
	 vJ0sa8dBWbJ7w==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/9] nvmem: patches for 7.4
Date: Fri,  2 Oct 2026 11:13:43 +0100
Message-ID: <20261002101352.1084447-1-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg,

Here are few nvmem patches for 7.4, Could you please queue
these for 7.4.

Patches include
	- Device tree bindings for Qualcomm Maili qfprom, ti,am62p
	  efuse and MediaTek mt6323 PMIC EFUSE.
	- New mt6323 PMIC EFUSE provider driver.
	- uniphier-efuse: enable for K3 SoCs for early k3-socinfo probe.
	- layouts: support fixed-layout as the nvmem device node itself.
	- core cleanups: const for pattrs allocation type, drop
	  duplicated kref and protect nvmem_device::ops with SRCU.

Thanks,
Srini

Bartosz Golaszewski (2):
  nvmem: remove duplicated reference counting
  nvmem: protect nvmem_device::ops with SRCU

Jingyi Wang (1):
  dt-bindings: nvmem: qfprom: Add compatible for Qualcomm Maili

Judith Mendez (2):
  dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
  nvmem: uniphier-efuse: Enable for K3 SoCs

Kees Cook (1):
  nvmem: core: Add const to pattrs allocation type

Loic Poulain (1):
  nvmem: layouts: Support fixed-layout as the nvmem device node itself

Roman Vivchar (2):
  dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
  nvmem: add mt6323 PMIC EFUSE driver

 .../bindings/mfd/mediatek,mt6397.yaml         |  21 +++
 .../bindings/nvmem/qcom,qfprom.yaml           |   1 +
 .../nvmem/socionext,uniphier-efuse.yaml       |   6 +-
 MAINTAINERS                                   |   5 +
 drivers/nvmem/Kconfig                         |  14 +-
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/core.c                          | 122 ++++++++++--------
 drivers/nvmem/internals.h                     |   5 +-
 drivers/nvmem/layouts.c                       |  13 +-
 drivers/nvmem/mt6323-efuse.c                  |  83 ++++++++++++
 10 files changed, 216 insertions(+), 56 deletions(-)
 create mode 100644 drivers/nvmem/mt6323-efuse.c

-- 
2.53.0

