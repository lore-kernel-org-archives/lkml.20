Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ECA4DE71F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606334; cv=none; b=JgdZ320afWfE9OanEJNDS1O/LM5mJGQDdbAu1TAzRunfUfxp2sKApEzscrPJbd2oKGvzi1zhgS5A6LI96cHNqOlKysl42FFrPybTImvpVlLoqZpWafdNBnz6gG28DyCXxG/0MSb1Y/zjJAke5CbLXQu1biUujTki/dEO2YaLgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606334; c=relaxed/simple;
	bh=yRSrMfOIOY8yc+H0kITYB7yCLVZjoqzSM1JBHxbzG64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cC7oA2KVIGJsaNKTQEr60Pr6VBbdHSJ7ZsznFBrK8XA3HkWgltntpARNu/DXx7mfFXq2hEyszqndJAgq2M5bcuQh3VmxFlROlcbjyhgqVBWdSbMxXrSjxmabZKPIT0XKsQDq3STn0ECavhMdxSFp8l7PT7VVgRSocG8OoMFiO2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMdr6s/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVmOHp4c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMdr6s/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVmOHp4c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAXr51042639
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=95f+Fzhwpw4
	3Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=; b=MMdr6s/ssYyFfuRlTdQjkQCbpmb
	f/ssEosnetm8jJ4kwLwqF35IMwwxxbL4dnl7LoGzzMRtqh3+R+xinaj7DNfgQ2Ga
	8Fy160rzhWysrV3GR7XiQJDH+kWFFlADerqmc9BHUEef8rnpccfEYuLFzmMdATsB
	3d2OuWjIf3U7Prn4tYsYMPvq3Yh6ANS8f2CrHpLroXfPgZYFJZ4MPiD20cw34Pcr
	vCMizsLjBIUMxH2yqZe2hiOP18Jmug11NTuvzHNS/3eQDvoYcgZz/vzUVJIcrpMO
	r9JmFn7Ah9My+daLge+eNX8ZN37hIulxY9tCaDYmtwqRS7UJEo6600umIpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5msrxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:38:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-882776aae15so2177196b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606326; x=1791211126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=eVmOHp4cMLIAx8hIL9TJoHVSCAeBrfjkw0yiRlRb7QonpX2eeYKeKczN28lDW6NOew
         D84avRaXmhmXyK4ZUxYyAYGCakZjW1YblUS6tklS1bHgh1JFqSNDopLghga7OkKPMsLl
         Q3FssKXjDMUiIRpWyjSoiT9rcOvevcRjh4UOZNm3Yl9W3kQG1CJH34UCBhhkKZkfoZIS
         MP9ryZxX/f4UT3URWRi4SAk5bsdJiDlQp6dQGCvBGonQyYZEjEm6cnq3EzZXWFCg4OrM
         NYO4Le06sGJOZko2n6/F9tuQqHrWRwlcvzeY8BPgjbuG9oKkAGUpTjau5I6AXvlDREMO
         ajZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606326; x=1791211126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=RwpBrWBhUbFWvK2h4tUO/2deYSR4U7wbLJ/xci8m7sEa1xGMP5kxTUrX2B47sYGkCU
         o7EsyKTsU1YwrukHFvev8uvQlYk2BvG6O0yZN15msPxqRHDkM8C/VkPqiIXrXhR5kvLR
         x6YCk/Hpn9LIk1fP/Y3vTISXCrxwLz2+DuMFnQm04oLYFd555KzwnyhOIBzsMF8DGbKD
         KrTf0Uds4MbInuIeqx6FNoiKG+80yt4y3TZ0QMK8sTr/Uq/aIKh1gAJ2A1INa1uFADHS
         e+bTHuN51T1odoS+aJ6iHqpH1Eg1zuyoRPJBaK+cP+D4whRiICxxcdMez9zQtl/sZtft
         2V5A==
X-Forwarded-Encrypted: i=1; AKwUvBw6G+2tRsUwcq3YZsmtzC7LXB0rwmUqKk061l/9BQxrs1Sde/IHj6Q5DdH5DkdqO2QUvF9qhJZcchUELX8=@vger.kernel.org
X-Gm-Message-State: AFuF++nsQEKMAwNI+XeXZWuDhn18nG91L7CKWWNmxZggaVyFgAYStBd3
	HFmIr1EynlOZHsJY6Lw6orR+TAEmxUKwHVQDfWeTyBoDsV4k71BmU9swMI0adPaTc6huGbb6I3x
	L32wwl5pFN1D5rPGBTLEA5fkz/XHn+z53AHF/03vse2zp3MMoE82Y/YapdLmLVFniRIbNwlbZma
	k=
X-Gm-Gg: AYBFou3WzQ3T+Z1pHQ8jo3c75fSCM9qXx6GL39t03k4+/R3AA+xdFbRmW/3gXAX0XeX
	VvEanyFP/dFLSiyHQLFrf9svILSqEtWVEafwFb8weCOqnLEc4Xq4ZEh2GQqN4w5CZokKRAm/mXZ
	YKA+lkW84SYbjeloxkkaaVZxq5/mzixWkNHDk9nkSqbWkKVVV4/DWiH6fpzVuyex32Z7ehX/ROe
	dm3cJlxJJr8k3lJlwkIe5VWvU7peT51AyEW2BsVsTzGvIeww+bnAm53C3CUUq20Uy2yzDpIgIzZ
	k2WOmRqjbIngsyWsJBFSIpzDYs38FYhoSVRUW1vRoczsvEcs709KF30gi0ExzARCWt1/gAfsYWH
	lsg2Gx+MRbRBee4QBXtVv3W89RQNqtg0N3bPvTQ==
X-Received: by 2002:a05:6a00:a90:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-88235a00258mr4457256b3a.12.1790606326267;
        Mon, 28 Sep 2026 07:38:46 -0700 (PDT)
X-Received: by 2002:a05:6102:3306:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7af1d09c695mr3831186137.11.1790605933082;
        Mon, 28 Sep 2026 07:32:13 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cba0ffsm4345440a12.5.2026.09.28.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:12 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [RFC PATCH v3 09/14] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Mon, 28 Sep 2026 16:31:08 +0200
Message-ID: <20260928143113.49838-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yNEzIfyWJ9FTu1qYt1QuPlBebexqMxNV
X-Proofpoint-GUID: yNEzIfyWJ9FTu1qYt1QuPlBebexqMxNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX/s+8MMN5QNfs
 ByLXMcPVuMqvG7f7rJlnLYu+myhfvRQC5oM9m488R4OBAsteZc5Go3A+Ly2KMnV/+bkEgdfn+oI
 1+HaeETwJHlJ0dxtB6tBh2ua9H+rRwn9pD/i/2yYkqfmMfs1BbN88rPvQk5BZD+Vk5Jp0aw4Wuu
 oUmreP7FHTpNJBDLVdTxHo0SO3Pebsy6+omQIjOTIqbbUQ999cfviauLC8GW4bMZlPN4oCK8h6H
 QfJ3j00AC554ckm08RciUJS4iJUHujP2T2JdPAa1dENoKd84ZE4IObRhi1mxQyaSvqOGCs/8wgY
 nXQI3Nw0VA9IZQYs+4B8X+asQtQvW84fCaKzBu9VBRtw6bDLsdxn6KLopGU+SKhRKbxhhrAxtQq
 24s4BojES1+1hSF6bwM+3YW5ldPdqaYbc3lK2WDL+M2m6KzteeMuddOjy99Q6WhbDVL6FNKDL5U
 GOVsJXORVrVhOsQHI+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXy79pGAg0TntS
 AWXSRUhGxHYkOwrUe3l2UabrablTmh6hJT+rd7dBCd09GKf3zPBVCqSRM3U/a9CnrxEVW/LGULG
 xXocvWIYU9x0ETykFrwVwUifyP3MWkw=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba7bf7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=cHhBG6FuOey2j-0mYlgA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280058

Add a bus token for MSI domains that remap interrupts, needed by the
upcoming RISC-V IOMMU interrupt-remapping domain to distinguish itself
from NEXUS domains. The token is generic because remapping itself is
the only property that needs to be conveyed -- there is nothing
RISC-V-specific about it.

Such a domain implements init_dev_msi_info() via
msi_parent_init_dev_msi_info(), which leaves 'domain' pointing at the
NEXUS domain while 'real_parent' points at the remap domain itself.
Accept that combination in msi_lib_init_dev_msi_info(); no other
msi-lib changes are needed.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/irqchip/irq-msi-lib.c  | 8 ++++----
 include/linux/irqdomain_defs.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 45e0ed3134ce..9027dfbab15e 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -36,14 +36,14 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		return false;
 
 	/*
-	 * MSI parent domain specific settings. For now there is only the
-	 * root parent domain, e.g. NEXUS, acting as a MSI parent, but it is
-	 * possible to stack MSI parents. See x86 vector -> irq remapping
+	 * MSI parent domain specific settings. There may be only the root
+	 * parent domain, e.g. NEXUS, acting as a MSI parent, or there may
+	 * be stacked MSI parents, typically used for remapping.
 	 */
 	if (domain->bus_token == pops->bus_select_token) {
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
-	} else {
+	} else if (real_parent->bus_token != DOMAIN_BUS_MSI_REMAP) {
 		WARN_ON_ONCE(1);
 		return false;
 	}
diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 3a03bdfeeee9..954cf585b3c4 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -26,6 +26,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_DEVICE_MSI,
 	DOMAIN_BUS_WIRED_TO_MSI,
+	DOMAIN_BUS_MSI_REMAP,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.43.0

