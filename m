Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A43939D7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377627; cv=none; b=eqErDo+fAgCH4QOWmXrs7BwAUDHgXfss2yioFEGWe6TYPTZi6vz1LR4uBLk2jYwx1weZi0xJPcjU7AwsUVwkVYR5DQRs4rOvAzH9dbm+htP+C6U06OxfLs19cOFydt96FPS+VTONH+H4jFUI942dwMDg16yhqr1LIlFPEc4MB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377627; c=relaxed/simple;
	bh=gyVE+X+o7PdE/gdFHzrfDPj2zra6PGHM5qWRBKC/E8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lov5LPBioI+Dow4yDseXlQ8YvRcrTr+VuMilTqxPdlyOYkGu87lb2QeLEBRxdSowoEAVX1ZTppYlrDUAKu9kOYzvlRThEkfDbcvAwPQyTplZT+67vzMlrRevj1kFNVy4knCxnTpzvfF/kKi4aZwWkQrrtpsCfZaYCed23mcK21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie4TBhiq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrmxejQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie4TBhiq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrmxejQL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr1Rd2372725
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+
	WQweM6EI=; b=Ie4TBhiqivgoZgq4A2+TqkqiddEKzO0EVxYDvc3EcNl6frVMCeV
	SO69XNhP2XGQG9UjNuhFob4KAWMwll+a+avJECXb2hB1v9x7fAKcxE1XRasr73+x
	5JD+w/LBufHmlaHdwcV9Ngw2sP7aZBgtg/ZaxmqjhDESAUwlCZRuf7GKY+RGn3im
	DaXy1nrhYVNWfPPmqfJ3XfCZv4J1GggKXDelDr0tmTJr+hwzgRu+KLZD8EdBzkXt
	2quNT0JNV3ptRDF6GMGJxDFk81QEsaHZjEhIGFhpn75iI8DVIzdQa0raiWvY8grx
	aS3Ce7K8inSGDyWC6D+HKuZMCaEg20zo5gg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a3ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:33:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088203so1869341a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377612; x=1788982412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+WQweM6EI=;
        b=XrmxejQLSYeZPjghrKlmTiHXJUGta7LtlCZRew5E8YB7Fx7ceqdR42GrmdCrNDzhZO
         4hIow9SRv6m3OzezlYlRee4ld65J1vuS0pv6Zs4FFJgFKXe1bsGVyeXX0+Wu+MSr302c
         6LTDKhb2grZlVQQtzqqKzVA7CHOzynohBWVc8EfQUT9iYbp3kk+L9cNWiRrXQZu706ym
         A+a5BP6wpSekoNU7UPQa8AgibBr2svmsubFNElXs1He38Mo6hy3X4gbYWylWJStnfxX6
         jJ5gGsBWDwqV0stwWHYP76AVfpmrGGeh8y6cYEGV/r5p4OJUv0Ebvq68gOQhDSmBha8+
         c4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377612; x=1788982412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+WQweM6EI=;
        b=D+FcgtXtoiOkOps8vVdduPu9+UC6R7MwL09g5f+FjjMfxAkPn2zV+QqYh7MKix+tXB
         YlOxKInrvY8PHILXEdlYnM7bQM1J82UlMXw9fa5RlcTYpuKqX3R2YZUF5Ux9N1/JwdNF
         XWa9YsaWNfYXLXaBVrh2EGSz7PK+ImWGLZbgULl/spljXmFeVXrseA1LUi8YxtOYaQWn
         aNnLNlOmr6oANqSCuFw8D432UsajMoiSvGzGNeZe8/MV/62iQ1LM5r4OZIgZ10N7GIlJ
         AgUEwbMVz9izHS9qXS1fS4Kz9Ip3JMxj8FCkQGFOEYn7YqLaLjZnidIP7/oXlxWBMVoU
         ZSlA==
X-Forwarded-Encrypted: i=1; AKwUvBwiWKhsfxI/wJgL3uuKbhxACbleKYCDnjC7t90lIwgVELGK9RUZCYyUJ+0l9Eajd0FecHoIsXXL6IY4X94=@vger.kernel.org
X-Gm-Message-State: AFuF++mwxYtfTahDbLYjiw92XStVCq+aDZAtblMjoN1rboMGaTBwRSCK
	gmzmK2Av3dpwSIEIOxebRrlUvJAZpkSlaWEXMQ1UsNLxWaOBmRDfJr8/55oHGv/eYxUzmtzesfo
	UbpqGvvSYwR3gEqLDJdeTAuAMlEvD0vNuknshc7bFCoxC57Kn25IyAeNexIoK2fWJjQE=
X-Gm-Gg: AYBFou1/5uuTKyCXSzS73NjG15jy2I970yup1y1egi9ViyD1wvjS3sjc6brNxE+N/Lq
	Nk1eoBGRwlHk6Tixop7u2ytdjMYmNXzZmjRlRkDz9AXhmHlzgVFltJmcn2I7bCwGbYRRFdWC0Zy
	u9v9zHCx4F/M66czwD77GI11FJJAj/NFmN8EADtiDTIcpMRGMWYwWsKsOklSnHLEiZg2jbnIT4X
	SvAOPSCFBqm4Nua8bsOqWkHi0tCEIpUAV/pUqHGXWa8U2XppoVo1SGqp9fnC8Ru93pwoWbQNFkX
	+sLZh//X2eUrxBkbgk0d1cITOy/auoixFlJi//g24DH4by0cVME4l/N8Yiz8RhIqQVEHZsSTt4H
	/P3v7n7MFliw5jfCjZsDn141pMLk=
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr11480494a91.23.1788377612209;
        Wed, 02 Sep 2026 12:33:32 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr11480435a91.23.1788377611618;
        Wed, 02 Sep 2026 12:33:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/5] remoteproc: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:13 +0530
Message-ID: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6e1g7sK8OP9igXwiEqFQAIIkkqN_SjGu
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a987a0d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=prJGSMnC0dN4-z46mKEA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX6eNJHzsSg1XP
 /PqGrw80e0PLtYkQqiNpJb2h6lGJ9dW0t1R/WYESu3jjrMq7nEcCyYSo/vdxGBtY29IyhGUd5ks
 sBAKimaq9mUEvNQGsOsr14lKM+Gl4fQczPYl99ng2km3pqeKiQk3LeC9mL647to8FpY8urs2U0m
 LWc5C6zySTQ6wLViPBM9wHxj+rZ/J/iWbMJ476T7nCal4feqc8HVkJ/IHITRix3jTp37EXBaha/
 0sBAUuIuItJto2JPoVK5PzfY+1T444/7tmmHrgCPdh8ButBdkbPzYyWa4ujaadMJQvXSZz78JYz
 YZEvpHxhZgd9Z5PZLf3M+pbdd0gPZCl6yC1sVhj36JsdkvkDCcPYq2cOEr2KP5VCNRFYfBsMvJt
 fcBVfvjmdK474lz3aVdGLLXsrq0nvAyvuqS4goj0vEGFOlFNrAuEPNw/O0BoHy+99WEsoyCUxaj
 8v1G4KvZX+4ux6kTgog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXwodCTcKhWxWi
 IzX9UNzoeoq6f3qbcL2JPu2b9WzAJ3cdkVqjogdATDDWgJl+zgVN0CmOwEc8RI/5MojRWO2Cic+
 PIF3fgke2qrlWFBk8X+hOjqHMXzoejo=
X-Proofpoint-ORIG-GUID: 6e1g7sK8OP9igXwiEqFQAIIkkqN_SjGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Several remoteproc drivers manually allocate a reserved memory region via
of_reserved_mem_device_init() and then pair it with an explicit release in
the remove path. This is error-prone: if any error path between init and
release is taken, the region is leaked for the lifetime of the driver, and
the pattern must be duplicated for every driver that needs this.

devm_of_reserved_mem_device_init() was recently introduced to handle the
cleanup automatically via the devres framework. Convert the affected
remoteproc drivers to use it, removing the manual release calls and any
wrapper devres actions that were added to work around the missing helper.

Mukesh Ojha (5):
  remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
  remoteproc: keystone: Use devm_of_reserved_mem_device_init()
  remoteproc: omap: Use devm_of_reserved_mem_device_init()
  remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
  remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()

 drivers/remoteproc/da8xx_remoteproc.c   | 10 +---------
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 drivers/remoteproc/omap_remoteproc.c    | 13 +------------
 drivers/remoteproc/mtk_scp.c            |  3 +--
 drivers/remoteproc/ti_k3_common.c       | 13 +------------
 drivers/remoteproc/ti_k3_common.h       |  1 -
 6 files changed, 6 insertions(+), 50 deletions(-)

--
2.34.1
