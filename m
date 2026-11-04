Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820567;
	b=BPYIDsJfEfY0FQZEllmOfkIo6TZdogHJMHeeqQjszehmc007AxxiI8JJfRrytEui9c+/
	 HhTly+TBauaAEprlKnkljszJBjFMgEX3Lay3fqUohdNXAqrmPa3n+7mlDrYbWZsryHhcZ
	 g/pxecjdYBYNgsagK/sQJLsZnS12wtNMQu8lsGUUvIhgfL16rTSnS+36NjG8ggy99QGoH
	 Lwr23h12CIo0B8pgaCjE5gCZVbplYLETf/YccpdUSXNPOwvxQ8OxFQpTtA3mc2IX3LDP5
	 X/LMADThDi0fQ06fjnVD0fOYc5rXwNb62CW7fa9/vJJfenxTXDIBLYukRtlQJO9HBsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Originating-IP:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info;
	bh=w/dAVKn8Sq6badom+jT5M1+MrGVSHMw0ssqOulzkFPQ=;
	b=dRh7NvlVEeECOGNXQJ6S/rANX/L/44N4swmf8tACROl/3WGoi6QNzZVu6rqJq6oxVnNw
	 UG+6MXB5Eq1B6ivB0YnHCWoVRm5SsPmzzTG98TaVKjpNpVWsftdwIJFNGuig7yXxOiYvx
	 0gRWs0EWCWZkXWAS3LLnNIay5xf/OSh7fsEKHXiqxbHFMcKEMzd803k0xesVbAXc11P0o
	 0L54q942mm5zXkiVrxI41utDDnikBRtd42v0nEH8iahwilWp1H02Ivb7Z9yrYSHIdOmng
	 HIprr6sUy0K1NkgpgsL6yHnR01V1sGerQQscccxZuXj2HYyTM/XyQvkQXA4k4eLUSVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=MyF6aVAy;
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733B8606B2CB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733B8606B2CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=MyF6aVAy
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4IQOqj1937786;
	Wed, 4 Nov 2026 19:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=w/dAVKn8Sq6badom+jT5M1+
	MrGVSHMw0ssqOulzkFPQ=; b=MyF6aVAyo5UktaOcZKqpDoJZMgFTAnq9ZJVpMRb
	f+FBuHyA81229h8Qh4LS/WAz9HRSWRvA0nz3eEiI9nQLeiaF2p6Y5M8hzRKhqdyl
	/tIlGmwb9E9oyBUGDBxQhSybP7J56tCa8QogIFw8T3Hb9PwpMGRfwCu/fuDqa7E8
	Ne6isEgvkQ40DvvhOWj/fXWtAVimXVy7NWh46E/HWE0V9SCaOQr70ZHfew7S0OrH
	P0OvSB+kkCd1YrlEGWksqpx4QAeBR8dUtXYVaNHibVavq4O8qYo7QZWDOqnee2Hs
	29pvO3WNWth8lhMsHv3l3Kb6jy1YlxBr8Z1RQkgskFweJTQ==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hn99wkp2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 19:29:07 +0000 (GMT)
Received: from [127.0.1.1] (172.25.6.177) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 19:29:05 +0000
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: [PATCH 0/2] drm/imagination: minor code improvements
Date: Wed, 4 Nov 2026 19:28:15 +0000
Message-ID: <20261104-minor-improvements-v1-0-cc976128538e@imgtec.com>
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
X-B4-Tracking: v=1; b=H4sIAE+H62oC/yXMQQqDMBBA0avIrBswo0baqxQXbRx1Cklkxoog3
 r2pLt/i/x2UhEnhUewgtLJyihn2VoCfXnEkw302YInO2rI2gWMSw2GWtFKguKhB73Dwrr1j1UA
 OZ6GBt3P67C7r9/0hv/xPcBw/JAfzlXYAAAA=
X-Change-ID: 20261104-minor-improvements-2c62fc679235
To: Alessio Belle <alessio.belle@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <frank.binns@imgtec.com>,
        <brajesh.gupta@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793820545; l=642;
 i=luigi.santivetti@imgtec.com; s=20260707; h=from:subject:message-id;
 bh=SNWNsO7jcCRGjK+3CzKVxA4G72GK33zIx7fA33q/u8M=;
 b=1WbX1Fqyk1XbLdLfOHuowUo1ha1YnAsKO3VcTZoN3iYIctMA46FQNH7h3TizY/6W942+JFDxI
 7mGIaSp09wODJ0BMihbtIwJLcrDUIw6UDwmsE5DzKp8w4mVlfUhycbx
X-Developer-Key: i=luigi.santivetti@imgtec.com; a=ed25519;
 pk=jS7sCDyWFMopn8iAXVN+AdJi+Z3fZPQKsS5NdQtI+sc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NyBTYWx0ZWRfX0iBQpwrdO4s0
 ZS3r+yMpstN62zKDI4RWQYH0yEjaPCtG+M4fYeGe5E0+vXpszmYWdIwUUbvNAdJhwLT+9eygaJO
 bs5MZX2B9xkyH5yPnpFasrCnaKqafM9R+30XOns3O5J7+8QWWpHChvZD3coxPun8HVQEmCjcmwc
 UpeV3Nod3hNTmOL41B0zxESjDMFuCARiT0EU30ioV0BsMbF6HCmliF6EGyYHvNDzCaNXr8sM1KG
 UH5y/d507CBKshp7OKD3OJdMyVnDfOfRtxXO2bnh0kfOY0f4xKUB0/m2nX8q2hCi34Zy0/S/ExD
 FNxd0DtEyWDgmN51xvZll3JJPU7fVSBJKpokr2JWqa34WIk92Dooqz7WXoFwkbaqRv6Tsfyny21
 TbYkuXPHV5KHF5ADN2AwRe+n+NZJWYANYrcUnwwsqHiUMUsNTdAKe4DNKyDdZ+9TjMnKPMi/K6g
 0qtgcjBu2Og0c2XiJGg==
X-Proofpoint-ORIG-GUID: 8H2aazFtFwrZT-20QqLtaGzKyiA2F3Yv
X-Proofpoint-GUID: 8H2aazFtFwrZT-20QqLtaGzKyiA2F3Yv
X-Authority-Analysis: v=2.4 cv=BZlNQbt2 c=1 sm=1 tr=0 ts=6aeb8783 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=dQbN41boPXjwVbFuR-UA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NyBTYWx0ZWRfX3xdt2QiZU0UA
 QG7O6EzoI3Cw0nft9kpVKs4N4n2o25YpV6xwnZabKvL9yfsz6JfUWruynm3Wh5ZmPTqdzQ42laa
 ZCg4A80vS69WaFwHFTwZbQd0G6Qc6x4=

No functional change is assumed in this series.

Signed-off-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
---
Luigi Santivetti (2):
      drm/imagination: switch to inline init of rogue_fwif_rta_ctl
      drm/imagination: drop unused arg in free_list_create_fw_structure()

 drivers/gpu/drm/imagination/pvr_free_list.c |  3 +--
 drivers/gpu/drm/imagination/pvr_hwrt.c      | 12 ++++--------
 2 files changed, 5 insertions(+), 10 deletions(-)
---
base-commit: 33ed26235db93162935d1719bc6f538c384a2fd8
change-id: 20261104-minor-improvements-2c62fc679235

Best regards,
--  
Luigi Santivetti <luigi.santivetti@imgtec.com>

