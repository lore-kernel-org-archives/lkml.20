Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006056;
	b=v+JLVC2XmbwSnoc7dd0p++uHzLb8tv6pxeWYCGlY0yaVMt+F+0pdMR4QdNlKDmp5pzjH
	 OYtp23NrajvNNL/qXJX0xakEgtQVPajyqqYSXbtF9OHV6wsIaXkpEY6o+S2VreSZTpMAj
	 kA7equcig5P78C8FHfMnRGpiBvccmqS0DNHRa2NgklLPOQGeG96WbSaKx3FsWlYaXU6WW
	 PiulBELuVaFGuEn8UjyiPK2rslROh07s1FLR5uiSrpFlq7udtV5tR/jhP7X1+DnmNK3Ct
	 N7XVHTSViCMuC23y7dCnt5lWO528Or1JDvuIyx9n1+mE/kxcplK7MO/z4ttA8Wf6WgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006056;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=D9r8ng0a3/99ROwLTtCmGZMKEekUedb4RVa6e7wTYeY=;
	b=KbLvlBWYdHc1KJM7RXvDHGsjAYCZ29HStOt0Jnj9aLBeEUR7+t3aLOmgtKlqeuPOZUSo
	 CjjGgaBUZBZqxykKUtGvnnLtCZl4Reekq5pq/QZ+YWn4TyKvbuQ7gB4FM1WjHOU1sTc8+
	 08wEoFmox2nUz8QlPVBStpbL8pdDVmI/x8ar5SpDC5Y50ikwlsuh1KQdwUNrlJe6iCLd2
	 Ecq0HIFVD361Jzq57Zl/OWVgZSK8tY1DPVtDKc034B5iq0Ru9TCY8pstS3LIDMBjUKzf2
	 mxIhDmc76CVBy82nrq5+76zdLUWuMkqToOaPZATAOzgrUqOJlPM38x7yp6FQqpNdg5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="P6/juIXk";
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF6606A320;
	Mon, 26 Oct 2026 09:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2FF6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=P6/juIXk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=D9
	r8ng0a3/99ROwLTtCmGZMKEekUedb4RVa6e7wTYeY=; b=P6/juIXkZsSnKFgLuZ
	qSGpmKz5XSbdcK9RH0KABLByesMd0IRkqfA3tky61uQefei84/da3N6Vtsq98R4D
	XP6FaAuZpRGEq9qG6odVqbbJ1CohlybmsqiTbg0s3iWfaSLu7Ky+CfCvJxtqY5NT
	Rp92zR4ZEZa5w8hSgMeu/MBn8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD332jHGd9q4hmLCw--.8486S2;
	Mon, 26 Oct 2026 17:13:44 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@163.com>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] EDAC/loongson: Improvements for Loongson EDAC driver
Date: Mon, 26 Oct 2026 17:13:28 +0800
Message-Id: <20261026091332.30226-1-zhaoqunqin@163.com>
X-Mailer: git-send-email 2.20.1
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
X-CM-TRANSID:_____wD332jHGd9q4hmLCw--.8486S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWfCFW7Gr15tFWUCF1rWFg_yoW5ur1fpF
	W5uws8Gr4Dtr1Ikwsay34xC3W5ta95JrsrWFs7J34rZr9xAw1UZw4SyrW5uFnrAr4ftF1j
	qa40gFn3WF4DA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQYFtUUUUU=
X-CM-SenderInfo: 52kd01pxqtx0i6rwjhhfrp/xtbC7QoLSmrfGcrZ5QAA38

From: Qunqin Zhao <zhaoqunqin@loongson.cn>

This series contains four patches for the Loongson EDAC driver:

Patch 1: Rename driver-local symbols to remove the "edac_" prefix.

Patch 2: Encode node and MC info into mc_idx so that on multi-node
systems, sysfs entries uniquely identify each controller.

Patch 3: Get DIMM size from ACPI _DSM method instead of using hardcoded
values, enabling correct display of memory size in sysfs.

Patch 4: Add CS4-7 timeout filter for cross-node access on 3C6000
multi-node systems to prevent false CE error reports.

Changes in v5:
  
- Add a new preparatory patch (Patch 1) that removes the "edac_" prefix
  from driver-local definitions: rename edac_check(), edac_probe() and
  edac_remove() to check(), probe() and remove(), respectively, and
  rename struct loongson_edac_pvt, loongson_edac_driver and
  loongson_edac_acpi_match to loongson_pvt, loongson_driver and
  loongson_acpi_match, respectively (Boris)
- Reorder the variable declarations in probe() so that int ret is
  declared last, following the EDAC tree reverse-fir-tree convention
  (Boris)

Changes in v4:
  
- int mcs_per_node; -> u32 mcs_per_node;
- int valid_cs_bits; -> u32 valid_cs_bits;

Changes in v3:
  
Patch 2 "Encode node and MC info into mc_idx":
- Drop mc_idx_u32 temporary variable; pass &mci->mc_idx directly
- Rename device property mc-per-node -> mcs-per-node

Patch 3 "Get DIMM size from ACPI _DSM method":
- Fix subject: get -> Get
- No code changes

Patch 4 "Add CS4-7 timeout filter for cross-node access":
- No changes

Changes in v2:

Patch 2 "Encode node and MC info into mc_idx":
- Use char other_detail[64] = {0} and drop the else branch
- Put snprintf() on one line
- Initialize mc_idx_valid = true and drop the else branch
- Validate mc-per-node firmware property is non-zero to prevent
  division by zero
- Wrap pvt_init() function definition to satisfy 100-column limit

Patch 3 "get DIMM size from ACPI _DSM method":
- No changes; rebased on top of updated patch 2.

Patch 4 "Add CS4-7 timeout filter for cross-node access":
- Assign valid_cs_bits before calling read_ecc() in pvt_init() to
  prevent using uninitialized data when establishing the baseline
  error count
- Add bounds check for valid_cs_bits < 64 to guard against undefined
  behavior when shifting a 64-bit value by 64 bits
- Rename device property valid_cs_bits -> valid-cs-bits to match
  standard DT/ACPI _DSD hyphen convention

v4: https://lore.kernel.org/all/20260902084827.2652-1-zhaoqunqin@loongson.cn/
v3: https://lore.kernel.org/all/20260812064139.1231-1-zhaoqunqin@loongson.cn/
v2: https://lore.kernel.org/all/20260805085414.1482-1-zhaoqunqin@loongson.cn/
v1: https://lore.kernel.org/all/20260730063035.230686-1-zhaoqunqin@loongson.cn/


Qunqin Zhao (2):
  EDAC/loongson: Rename driver-local symbols
  EDAC/loongson: Add CS4-7 timeout filter for cross-node access

Wang Jinwei (2):
  EDAC/loongson: Encode node and MC info into mc_idx
  EDAC/loongson: Get DIMM size from ACPI _DSM method

 drivers/edac/loongson_edac.c | 114 +++++++++++++++++++++++++++--------
 1 file changed, 90 insertions(+), 24 deletions(-)


base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.47.2

