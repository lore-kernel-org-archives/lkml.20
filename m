Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662464;
	b=2o1EHWHVqoCCVJazWA+KjMLbZbYlIFIz0JuMtuMQMAxdslL7ESm6gX2w6k0vENxWLybf
	 EXefOjr34/zAArwYENgbIv87Or+OqLsXtRKP/l1IoFjBbWA6zgFPJrjYH6XK8/xLD18/2
	 BDMHCjNe8Q+hsnFVOe+lT7LcBFguZJCkC6Ql3YZAfXlMv+0B8yfX+cKl81QOcCBHZqb+d
	 e/QlTMj1NXgjE/Lf3lbXfGpGigDKJTALFrolOrQrv6JMEYVEr1b8hIDupDhJcD/jR8i7w
	 dKXBh1zu/OXlMD+FdGT5zJk1vFqsmyWBmz9vyimmT8f78a6GCIEL+0PF76GIQTjeYqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662464;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key:X-Scanned-By;
	bh=B5BT9RkKuWGlJFAd06bfGaLdbPk5O7hiPF7RMVoDruw=;
	b=xs8+6pvotzQYCESADckIxJ/KJr9ftCukArf8t3720a1q5vQJIon08XgErJudb+wHaNCO
	 GEhN+GFApokHNplkAJWjuIxnKR+3OUrhSIXuC8i6OAGKXReUx7kCGfGZg5f5SYxkqrBqF
	 NiobIFK849qBmRlfxuLtkWM1Ayw5pEpW+ByfQIT/84+nY5PXu/KD8CZLPUZtuhGgkm7Ek
	 EmRQWCZRw5kWUolpYTmwKl/Frkdx4H8hpRVStPNqjTasiNlsuG3io/wCalxhYJv2T1maD
	 cf3Yeo4uKww74tKrq/YNHg3nu222jIbobDdmHspQtSli3gx9XQGGA33asv8bv2IjB1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRFjYCnm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46276606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46276606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRFjYCnm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792662463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B5BT9RkKuWGlJFAd06bfGaLdbPk5O7hiPF7RMVoDruw=;
	b=CRFjYCnm4PH39oKxV1possW2/o4fXAc3aF3c3bdfjft5rFAs6sVEQud9QMlg7VtI1leiaj
	sdVDFh0nXYkJWycqM/LK0cZtDHUhjDk8AS1nzZnT27mQboKW+geElhogIRjdvFVLtnJj9k
	xWbc/kSORTWl0ZGKSzDTrrtxaQtlwXc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-216-BhjNJxLeO_eH0z9Jzr2VMA-1; Thu,
 22 Oct 2026 05:47:40 -0400
X-MC-Unique: BhjNJxLeO_eH0z9Jzr2VMA-1
X-Mimecast-MFC-AGG-ID: BhjNJxLeO_eH0z9Jzr2VMA_1792662459
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A0AC1955E87;
	Thu, 22 Oct 2026 09:47:39 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23B7746C;
	Thu, 22 Oct 2026 09:47:36 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v4 0/4] Add automotive SMEM hardening for Qualcomm
 platforms
Date: Thu, 22 Oct 2026 11:47:20 +0200
Message-Id: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMSw6CMBSF4a2Qjq3pk7aO3Idx0Kd0gJCWNBrC3
 i3ERIjDc3O/fwbZp+gzuDQzSL7EHIdnHezUANvp58PD6OoGBJEWSazgOKQJ5t73UHAsrRBWMcx
 B/R+TD/G1tW73uruYpyG9t3TB6/VbIWhXKRgi6LDSjAcuqQnX5F2np7MderBmCvlRhdiekkqNY
 Uo4Ry2T5o/SHSUHSisNxhKvJdYtZwe6LMsHNmhY4xkBAAA=
X-Change-ID: 20260819-port-smem-7518c77c9415
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <sarannya.s@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
 Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>, 
 Tony Truong <tony.truong@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662456; l=3065;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=HkznHTYzrDwmySwFPgBC3n2BHVdhiWisXElpepb444Q=;
 b=kRYveuH2OUaGhkE/IeyLny8F5eX4Or9g177lUEReoZitbghA7mDVNqQuWrbHZG6gdV8u0sI0y
 YJrFsi4x/g1D3RuqKmxMshBwNpMq3OblzZKpr9N1jxA5vfP6TIydwTx
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

The Qualcomm SMEM driver manages shared memory partitions used for
inter-processor communication on Qualcomm SoCs, including the
automotive SA8775P platform. Vendor trees carry additional validation
and partition-enumeration logic that is not yet present in master.

Patch 1 adds IN_PARTITION_RANGE() for pointer+size checks against a region.

Patch 2 adds bounds checks when walking private uncached and cached
entry lists.

Patch 3 validates item payload size and pointer once a matching entry is
found.

Patch 4 skips multi-remote-host partitions during enumeration. SMEM
now supports partitions involving more than one remote host, but the
driver does not implement that case yet.

The first three patches split the original vendor boundary-check change
so each class of condition can be reviewed on its own. All four are
based on public vendor patches from Qualcomm [1][2]. Adapted for
master. In particular:

 - Dropped the xarray partition rework, which is already present in
   master (79602b750b96c, "soc: qcom: smem: Switch partitions to
   xarray")

Built on master (Linux 7.3-rc7), and tested on Qualcomm SA8775P Ride V3
board. SMEM platform device binds successfully, socinfo reads (soc_id,
revision) return valid values. No WARN or canary errors observed.

[1] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/3e521f2641c8f01f00fd74a088206942ce23d6d4
[2] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/842dd28b0276b3824a607e067b3c20e266bcf230

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Changes in v4:
- Updated email addresses in SoB and authorship
- Updated IN_PARTITION_RANGE definition to use uintptr_t
- Changed while loop conditions  to `<= end` to avoid
  rejecting headers at the boundary
- Fixed post-loop sanity check to use cached_end instead of phdr
- Rebased to v7.3-rc7
- Link to v3: https://lore.kernel.org/r/20260924-port-smem-v3-0-fbc2ea81a654@redhat.com

Changes in v3:
- Rebased to v7.3-rc4
- Split the overflow/boundary patch into helper, list-walk, and payload
  validation patches
- Fixed qcom_smem_get_private() while loop condition
- Fixed indentations
- Link to v2: https://lore.kernel.org/r/20260904-port-smem-v2-0-bb497dd3c48b@redhat.com

Changes in v2:
- Update patch 1 authorship to Sarannya
- Update all emails from @quicinc.com to @oss.qualcomm.com
- Make smem.c copyright yearless
- Link to v1: https://lore.kernel.org/r/20260820-port-smem-v1-0-d19a45f583bf@redhat.com

---
Sarannya S (3):
      soc: qcom: smem: add IN_PARTITION_RANGE helper
      soc: qcom: smem: validate private entry list walks
      soc: qcom: smem: validate private item payloads

Tony Truong (1):
      soc: qcom: smem: ignore multi remote host partitions

 drivers/soc/qcom/smem.c | 110 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 32 deletions(-)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20260819-port-smem-7518c77c9415

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

