Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B72040910F;
	Wed,  2 Sep 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339864; cv=none; b=A48DsATq+gAkZteBTXXON6lyUWRGuqaeaS1UoKsqqBR2q0KIFelmpfx3G+QodoZ8UK/luLb6/dD3p21x+aF0EN5nfgYv30F8kB+Isy1S5xFiVeXsS1WHYWWTHmRGbvL7VRl+fFwZi+RLQ++178/xyDw8N8dmRZNFisv6Vwkx1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339864; c=relaxed/simple;
	bh=de+tyHpJ9qQT+Dr4m5YN0M3l4DSMo+n8dkmHRwarhvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DekvhrifPMcdO3VtT0v+1s3Kw4+TW7DXtkp65zJq20rj/JEkEAwqNUBsB4QRQvTNRWi6pYPUw5MarDI434ebO9g5He51achT0WKDYouU+sI+zuNohsXSoNCpr4PhLyLvGhM3APw+MMhQi7ClzY30xmVJVtIxrdgoQ0Iwsb4XNVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8DxztKT5pdqo7QHAA--.21687S3;
	Wed, 02 Sep 2026 17:04:19 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJDxg8yM5pdqsXgZAA--.26394S2;
	Wed, 02 Sep 2026 17:04:13 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH v4 0/3] EDAC/loongson: Improvements for Loongson EDAC driver
Date: Wed,  2 Sep 2026 16:48:24 +0800
Message-ID: <20260902084827.2652-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxg8yM5pdqsXgZAA--.26394S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr4xZF1fKw17KrWrGF18CrX_yoW5JF1xpr
	W5uan8Gr4Dtr1Ikanayw12v3Z8Ka95Jw4DWan7t34fZry3C34UXw4SyrWj9FnrAr4ftF15
	XFyvgFn7KFWDA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

This series contains three patches for the Loongson EDAC driver:

Patch 1: Encode node and MC info into mc_idx so that on multi-node
systems, sysfs entries uniquely identify each controller.

Patch 2: Get DIMM size from ACPI _DSM method instead of using hardcoded
values, enabling correct display of memory size in sysfs.

Patch 3: Add CS4-7 timeout filter for cross-node access on 3C6000
multi-node systems to prevent false CE error reports.

Changes in v4:

- int mcs_per_node; -> u32 mcs_per_node;
- int valid_cs_bits; -> u32 valid_cs_bits;

Changes in v3:

Patch 1 "Encode node and MC info into mc_idx":
- Drop mc_idx_u32 temporary variable; pass &mci->mc_idx directly
- Rename device property mc-per-node -> mcs-per-node

Patch 2 "Get DIMM size from ACPI _DSM method":
- Fix subject: get -> Get
- No code changes

Patch 3 "Add CS4-7 timeout filter for cross-node access":
- No changes

Changes in v2:

Patch 1 "Encode node and MC info into mc_idx":
- Use char other_detail[64] = {0} and drop the else branch
- Put snprintf() on one line
- Initialize mc_idx_valid = true and drop the else branch
- Validate mc-per-node firmware property is non-zero to prevent
  division by zero
- Wrap pvt_init() function definition to satisfy 100-column limit

Patch 2 "get DIMM size from ACPI _DSM method":
- No changes; rebased on top of updated patch 1.

Patch 3 "Add CS4-7 timeout filter for cross-node access":
- Assign valid_cs_bits before calling read_ecc() in pvt_init() to
  prevent using uninitialized data when establishing the baseline
  error count
- Add bounds check for valid_cs_bits < 64 to guard against undefined
  behavior when shifting a 64-bit value by 64 bits
- Rename device property valid_cs_bits -> valid-cs-bits to match
  standard DT/ACPI _DSD hyphen convention

v3: https://lore.kernel.org/all/20260812064139.1231-1-zhaoqunqin@loongson.cn/
v2: https://lore.kernel.org/all/20260805085414.1482-1-zhaoqunqin@loongson.cn/
v1: https://lore.kernel.org/all/20260730063035.230686-1-zhaoqunqin@loongson.cn/


Qunqin Zhao (1):
  EDAC/loongson: Add CS4-7 timeout filter for cross-node access

Wang Jinwei (2):
  EDAC/loongson: Encode node and MC info into mc_idx
  EDAC/loongson: Get DIMM size from ACPI _DSM method

 drivers/edac/loongson_edac.c | 82 ++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 8 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.47.2

