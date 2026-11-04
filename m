Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791493;
	b=AeLFhJBFwHizepx3Iwtwrq0OVJet7+wfkK8FE1GD/BsHeK/4l1Z365+xCaddINPG5rjM
	 jUpRNkBj4UerIgBdZ/JRac+XODMDskNElJKqkxNfw9PZ3F/GH8NnPQB/Nt/UmVg3G1GEZ
	 +T7s0EOcePujUapgHiYPmzEJNHZl0E9D14jLszPwkt46SBNZbnF4YuLeJcT7zxobTboIb
	 ag5IB165tn8iN+GXO+66/rXiId5gJYD1YOVNeu1951ZvxRPNau0TAk8JezVqbyfW0w0jD
	 X85zbVeZQ+5EZ/zIv1DObFiuVVsko1IM/pe565FrY2ezDPqgQeRTAMBkiUxEcRaCOgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Originating-IP:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc;
	bh=+LaAvsatzPhboEMA9CsDMkCQTdMZQ3XoWtydHwd37WA=;
	b=bacEMB4pGA6e6/fFCKmkq1TXJdaAgn5LbnzK03Z9KHcYEi9UGoTo+df9387TMoUoarTF
	 ddBkgwT3gpAUFKRTmU8i7wD65+dYXYkPrby0wSHwDnpZKv3t91cBBu2gqAdqTeoJwEFqi
	 zvc78kEBexPRNnLL/F3CazB0CslYlOkAcvIrB3xA8hfPFXGDU3GaPgQTgx33+zke4KHNQ
	 7021VWpUr+PJ9QefOEpc+3R1jsnC/izDUpX3M/9jEOywE8WOGaKguEfx5HZiJj6ymsMAS
	 WUDZmPuhMrB+qTr9ODFhh1C70sACctcqypdQ/LLhkMHci0UhvTFdKvzmQlYqOPHiI1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=EGoP2eG+;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D7606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1D7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=EGoP2eG+
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4B7m9f2267898;
	Wed, 4 Nov 2026 11:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=+LaAvsatzPhboEMA9CsDMkC
	QTdMZQ3XoWtydHwd37WA=; b=EGoP2eG+nbJhv7IDmIW2/KC4ea4A2AByfa7Ng/u
	JEOZY+9bQHVL6ykV6R9Zjk9rus8DMnn3xP3VMLQaR3QG2tIJjZTCR2TMzOwQ8cDK
	4hKRbXu1/Ys4y4lOF5wmwe3LaXxJv1MZzxHPycu8HHiEV0JBonxICorb+0rrOoi/
	x/k/bExH5vPX5/ZgqtV3nNWlVakud9ycwiqKmzdp5KAn8BPNiC4Lc0+rqEFw4SHm
	fid0FHIoIaXbzp0BUuhTbhHS6WAP/uaj3/hkSvN4dHVMtvb52sKBmPp2oq02WuXv
	8MlnQl76vm3FF3yqgfN+ChjjACG9QvLFvpaW6KLU0reK2vg==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hr3j6r0e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 11:24:31 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.190) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 11:24:30 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: [PATCH v3 0/2] drm/imagination: MMU defines updates and
 improvements
Date: Wed, 4 Nov 2026 13:24:04 +0200
Message-ID: <20261104-b4-include-mmu-defines-only-in-mmu-code-v3-0-f9925419b8bc@imgtec.com>
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
X-B4-Tracking: v=1; b=H4sIANQV62oC/5WOyQrCMBRFf0WyNpJBO7jyP8RFhtc20iSStMFS+
 u+mFQR3urzvHs59M4oQDER03s0oQDLReJcD3++Q6oRrARudM2KEFaTmBMsjNk71owZs7Yg1NMZ
 BxN71Uy62m/K5FJTXVUWaslGAsu0RMvnclq63d46jvIMaVv1KdCYOPkzbK4mu3P+riWKCWU1B6
 EYD4/JibDuAOihv0Tqb2EdMCWW/i1kWVwLUqSrLUsjiS7wsywu+6fAPSgEAAA==
X-Change-ID: 20260930-b4-include-mmu-defines-only-in-mmu-code-a139880f7fce
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Brajesh Gupta <brajesh.gupta@imgtec.com>,
        Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793791470; l=1871;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=QLF0xu+CtXIc2E1umLbajzZNbEgKws7yLaBg4qFqGqM=;
 b=927+vkhvFDroDatcVVc6/5QE3zpOaEiLNOST68r9SjD/MeRhesFH1PDBKIO4icGK7lr3zsK9b
 EyQo9ub1bzrAwHTuFArF9R9tJY4CdCEq3kNVTrj2T/PiHLIzxdsNtwn
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-GUID: -8Xqe99xcLSvEqHgnQFvD4hFjvBIU0ch
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX4dGkpNXgCCkb
 P39S1+pS7bN3hHVCliMpfAVDJc81+FTgjf6S9HCt3GYQjhU039EgULeMoZ3+lLrYn6yNKXfkEFa
 Lz0/2ZS7PdtVJMgJYBz91K/tNfVXWMY=
X-Proofpoint-ORIG-GUID: -8Xqe99xcLSvEqHgnQFvD4hFjvBIU0ch
X-Authority-Analysis: v=2.4 cv=DtnDa2/+ c=1 sm=1 tr=0 ts=6aeb15ef cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=Y9E4qlbPYa4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=ZgQMqL77xtEQzMyY3PEA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX9z10FY9UY0AA
 bf6b8PgWk8m8cz8BMuXFEdPmHRYgb6NHBQ/3WGEoYLFdxTuaFCfdNxoMo/uFts+7nG2mmkSZ7Hr
 25nzhnVqsId4DCk2p1xmsV6zvYr+/KFGsIL8+po7YO4jypkyN3UH/PaYTaZjF1uV1efYR+1So0M
 NkIEtDHS7RgWSwVPeT3MwjQU71LdQhEaKORXUPmI9TT9xe6WCNYEDriV79c+iC54aNeUN/R/Ary
 MvsKXzfjfmiY4brixa00KeN5mYcwzCAdKK9bloRzBTH742/E3Ri2HWmSX2aR/q1PfT1I7aDmOYS
 JMnARqcttFKZA6GSxG8lsEdryHqCaAo0rIIuf4IEm350QXFAKbv95WJT+hfWBbxQc5WhxvbX+rK
 g0AYxO98kTggtFRnthWTKHqTnw6uWAGIUb8ntDE698j/cNIEpasZq0sGAaRAMHoS8Rds9dP5R8N
 tgOIoXy2W3nWnfJsTWA==

- Restrict the inclusion of MMU defines to MMU code.
- Refactor MMU defines to use kernel style and access.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
Reviewed-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
Reviewed-by: Gyeyoung Baek <gye976@gmail.com>
---
Changes in v3:
- Added ROGUE_MMUCTRL_VADDR_[PC|PD|PT]_INDEX_SHIFT defines.
- Updated the cover letter with the "Reviewed-by" tags.
- Rebased onto a more recent drm-misc-next.
- Link to v2: https://patch.msgid.link/20261012-b4-include-mmu-defines-only-in-mmu-code-v2-0-8aec58777ab6@imgtec.com

Changes in v2:
- Update the pvr_page_table_l2_entry_raw_set() description to better reflect the general changes.
- Link to v1: https://patch.msgid.link/20260930-b4-include-mmu-defines-only-in-mmu-code-v1-0-291eadfde23b@imgtec.com

To: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

---
Alessio Belle (2):
      drm/imagination: Switch to kernel-style MMU defines and access
      drm/imagination: Don't include MMU defines outside of MMU code

 drivers/gpu/drm/imagination/pvr_mmu.c            |  91 ++++-----
 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h | 244 +++++++++++------------
 drivers/gpu/drm/imagination/pvr_vm.h             |   2 -
 3 files changed, 156 insertions(+), 181 deletions(-)
---
base-commit: 49f40f15d20f5b4073d517da7efbcea079f1b9e3
change-id: 20260930-b4-include-mmu-defines-only-in-mmu-code-a139880f7fce

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

