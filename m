Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CAC47206C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965677; cv=none; b=ct0NiyQb+IofyT2MCyOFXc08kz3+qCwYdU6QzGL7jfpq9hY1I6tnyRSB5A22IB6IBs+NkJb/Ni1rJEYRW6HP+oNOeMbw/vspVw5qV/uJ3da/1LwAENrY6mAjjsXdQdVeCY2P2Fjffmp1Tn4JH0zqIZ5h/R3cVKOBhMKgIfl7JVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965677; c=relaxed/simple;
	bh=isVFex81GmYXUE7XpNeI8h9xnX/Z5JYbr7nohRWPFqs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=lbCGS8s/49NzJc+1c3diwu685NBODQY/Tx9z8Qlvu+ByePGU+LRMpZAdS6bauNx7qKblWkRmRCH9hgZpt5w5CW0cXMaWpIGwH+IBXDJG67MutwTVAU3nGYoQHu8qTTiKfrwu6+23k6ysgdve6FG0KV9HwRSU/7Jw+tYMzdrghEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=lDEDM0MO; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="lDEDM0MO"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E646GU2182309;
	Wed, 14 Oct 2026 09:13:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=oLr3miDz7pUAJC50HoEFTw6
	c9z1+NoyAwV8Pq2AtTkM=; b=lDEDM0MOnUNP92U6peWWCpz1YuAQDkwD2ln8YrG
	ZW8QUl0ZRDPU0qm9XsL3ayBUvL+BScLusD8FWKhqIq5tsQbEAs4iWRmadmH3A3QQ
	oFFV+KZFfFTmfLzhIQwKpH3kvXWep9U+zi+3HpMt6wow44kHo0pNG0HicsRZcNS7
	LOEU+fIqGA3wQtChr78gm51Ijo43FrXoEF8m8R/m6SLqFO+Dc8vSB/dK5nVC/vT9
	mISfXYk4XOwsKJd+jQ+Xxi8izZ6luFH26iU1nJb+RbKxVS8f/uDCtEsPmrrtCPcF
	rp3p+U2zXE+5NP6P/4QcK87pAZMrIt4UJ1+C8CuM0ouP1zg==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4h7bmpapbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 09:13:47 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.23) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 14 Oct
 2026 09:13:45 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: [PATCH 0/4] drm/imagination: Clean up MIPS firmware interfaces
Date: Wed, 14 Oct 2026 11:13:06 +0300
Message-ID: <20261014-b4-simplify-mips-pte-defs-v1-0-b4ad7bb68e22@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJI5z2oC/yXMQQ6CMBBG4auQWTsJUxoWXsW4sPSvjhFsOmAkh
 Ltbdfkt3tvIUBRGx2ajgpeaPqcKOTQ03C7TFayxmlzremnFc/BsOuaHppVHzcZ5BkckY7gASb1
 0UTzVPhckff/ep/PftoQ7hvk7pH3/AGsaHdp9AAAA
X-Change-ID: 20261014-b4-simplify-mips-pte-defs-e2be1f613d14
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
CC: <linux-kernel@vger.kernel.org>, <imagination@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Matt Coster
	<opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791965625; l=1581;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=isVFex81GmYXUE7XpNeI8h9xnX/Z5JYbr7nohRWPFqs=;
 b=v45hrTr6EqvbFJNwPVBixni3ILqcB2OgFYqih/1ctaLWW1gc3uhamrBnuGe51uD2TBWpSlBgy
 ir20L6EWAtRDn14eyJmnWNdfkmMZ4jICnJyWExAkQwY8kZY7Eq8dYEP
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMiBTYWx0ZWRfXyn61mNcYeQZb
 i3trmZoGEcTTemQTLY1FRjkmmH7eI+qtqzVUb4bzB5nvFiDBsMwUyS2Vhi1EONY9Vy5Rfc2vke/
 K1R3uxhTnr0lWIxEiMpl2eGMxYDNlHjMD4DN5lYJkvGX8DYK9GaRtvnA24O/5KZ1p4O2PIPnC5h
 uWTAQhjnb8OPjeKGyFARLGV20QKV+Hj4Rub7zuhj4VTmxVfq57sA4N3CFjuhQYLQrIdELCOJcQq
 U6Z2wD6AOn5ovFbg8dCdtFkZHnEyGfGTM4l96LIwLkDjyb2B/Z9CUQHH5UFUUdCtNZyDjDP/z+s
 StksA1GCAH/WNyxyAD7s9ZaoYytEjj8ljAaNaXN+UjnmOg1ORzyIq9a4DZ8311nzYCy8XK5KSV7
 D7+SPlFL/6vpvY39qztc3cmIUPlRh7TriCs0sH523ZvX4xnVs3a8dZB1H+4Mdm0J0ai1IvX7x4M
 PJTLkmzzk64QGOYaimA==
X-Proofpoint-GUID: Axa2GqAeopZDp5_kJ1qVY-YBUL85ITOp
X-Authority-Analysis: v=2.4 cv=QpDLTlyd c=1 sm=1 tr=0 ts=6acf39bb cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=Vfs-8JXWiL0A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=uKU_ccNhAZKVZaoNEpUA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: Axa2GqAeopZDp5_kJ1qVY-YBUL85ITOp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMiBTYWx0ZWRfX8MGlftGlvsyH
 QXCPYsJ2/M1eHMk4CXkJ62g191rn2GclD0oVYcJL/RPyP9zw63IT1MEOXLh4C4He1C/g3E7C/+L
 Z9mpGWW2q4y5hyeHJCtEsAfUvCfXlDQ=

1. Limits access to the MIPS firmware interface, keeping its state
   within the relevant implementation.
2. Align MIPS firmware headers with the other processor headers.
3. Improved logging in error paths.
4. Simplify MIPS PTE definitions.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Alessio Belle (2):
      drm/imagination: Limit access to the MIPS firmware interface
      drm/imagination: Make the MIPS firmware headers arch-independent

Matt Coster (2):
      drm/imagination: Improve some logging in error paths
      drm/imagination: Simplify MIPS PTE definitions

 drivers/gpu/drm/imagination/pvr_fw.c               |   6 +-
 drivers/gpu/drm/imagination/pvr_fw.h               |  11 +-
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |  79 +++--
 drivers/gpu/drm/imagination/pvr_fw_mips.h          |  49 ---
 drivers/gpu/drm/imagination/pvr_fw_riscv.c         |   1 -
 drivers/gpu/drm/imagination/pvr_mips_internal.h    | 309 +++++++++++++++++++
 .../gpu/drm/imagination/pvr_mips_internal_check.h  |  35 +++
 drivers/gpu/drm/imagination/pvr_rogue_mips.h       | 335 ---------------------
 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h |  35 ---
 drivers/gpu/drm/imagination/pvr_vm_mips.c          | 162 +++++++---
 drivers/gpu/drm/imagination/pvr_vm_mips.h          |   2 +
 11 files changed, 519 insertions(+), 505 deletions(-)
---
base-commit: 6e375de99d0c420169481fcd36064177ab55b09d
change-id: 20261014-b4-simplify-mips-pte-defs-e2be1f613d14

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

