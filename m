Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180049;
	b=PElRRruJigI5RJhRLEZsKfXrHxiAdLmAFbevzl+qKsvNN+bjpkpaHh2hDWCF1jHn+zhr
	 su9iVZ25QQbIsACR1DopKzV7xuOpm6RJnisfdW+N1ctn5516u7xa/2rf0KKSJ2aA+4M0T
	 9Q6qM5j02HpPVqW9Cq1JS3z8FbXBFMt71Nr2reZJYgDA2SJIFj9VHCns2o5oiQyFhVLfY
	 KPF4OoNksUyDgpLJDZ0VWaoEZhkAFQ8bdO2HDvUi0ngEBg3E+0snAVWJvnzMlOjsq/z1M
	 VvPzkIhp3+6NXtJWUtWoXHqCCsP3jYVcLK684dxiuoE+tce6k6WniDJIiy4aLj4fjvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180049;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key:X-Scanned-By;
	bh=ztpW1cmZTFL1klozjEQr8xShJIFgMfyy2BPuyAgjvas=;
	b=tx5iBrC1ZraDG2r8PgBVL/dwHL8uAK2238weAVYqij7Y5ijGCnQfG9zy8BtN/nOwwhh+
	 adgKxoNIeojlAyWnlku3bW50vmRTxispjl1KzngaiI1BXnIU1Csf/EbRbeuiw2U2vfp9n
	 gEory4cmwg4GopB+K03pz8rMK0ibMtrbCxEl9e/mUa+FarrpBcD/V7dC6GdxdwJV1jR2Y
	 vrJfkEWD/7DWedopnEBFF3IEk8wUk6GxekHAZhtH0qkAVOPcpQvObgxXSCSqhI+4vYp+E
	 qzhjrM8aJ8GV5Pwcqyz3Z6O/fI5JA9KQ2I+4RIDdlSZ1XnVjJ4RTGS8SIzbj/katDow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igvqqN3e;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C53606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igvqqN3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793180048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ztpW1cmZTFL1klozjEQr8xShJIFgMfyy2BPuyAgjvas=;
	b=igvqqN3eSZ3D4XK/rCJEGxzj5hEbmHt00ipnAmTpcBO+AIhOZdNLkJ1P3EGOIs37Yo9/OA
	CkU80C2W77p8bxWp3byTD3qavPLZp2bG2CrnnNdBF9rMFj/DaHXdm4nemth31y6xbnxeMc
	OiEnEtYpjegwt1bJEsFVRzyK1W8BRK8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-CWwJ6owFN8Sit4txzsSoKA-1; Wed,
 28 Oct 2026 05:34:04 -0400
X-MC-Unique: CWwJ6owFN8Sit4txzsSoKA-1
X-Mimecast-MFC-AGG-ID: CWwJ6owFN8Sit4txzsSoKA_1793180043
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1DAA618011E2;
	Wed, 28 Oct 2026 09:34:03 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB72F1955F10;
	Wed, 28 Oct 2026 09:34:00 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v5 0/4] Add automotive SMEM hardening for Qualcomm
 platforms
Date: Wed, 28 Oct 2026 10:33:47 +0100
Message-Id: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTW7DIBCG4atErEvEDGBDVr1HlQU/Q83CcQSW1
 Sry3YOjqnGU5TfiebmxSiVTZafDjRVacs3TpQ39cWBhcJdv4jm2zVBgJwxYfp3KzOtII+81mND
 3wSrQrL2/Fkr559H6Orc95DpP5feRXmC7/lVQ7CoLcMEjWKd00kb69FkoDm4+hmlkW2bBJ7VC7
 Sk26r2yfYwyKOPfqNxRfKGy0eQDkjPgOq3eqPqnIBD3VG2/Cu+StKEjAS90Xdc7a38clFQBAAA
 =
X-Change-ID: 20260819-port-smem-7518c77c9415
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <sarannya.s@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
 Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Tony Truong <tony.truong@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793180040; l=3273;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=TtU6LeTmkDOOxYSSpvNYDWqW0i5o2/+GBz6R80HU5xk=;
 b=ZEFitHo8aBJuL7TbYJDdmQzn+OmogejzL3Qwhulq72Ve6yWhgSVE2h6WNoMhSOk9C9UYPZTN9
 qO+tqyXEXhoDUeQ6RDdyA54T2lh8R+U1/zVTVBorJ6mf52YM5Ps7Bnc
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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
Changes in v5:
- Re-added WARN_ON() macros for bad padding_data checks
- Update end of loop check to `hdr != end`
- Link to v4: https://lore.kernel.org/r/20261022-port-smem-v4-0-b0baf39c6e01@redhat.com

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

 drivers/soc/qcom/smem.c | 105 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 75 insertions(+), 30 deletions(-)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20260819-port-smem-7518c77c9415

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

