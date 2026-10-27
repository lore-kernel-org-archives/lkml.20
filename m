Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112078;
	b=QGPZ5WG6UUmkJy5IuDgPnHK5lxMQ9+tYeGLcFMg21wnnYWb6mADe9G7yTzikMilmKhjO
	 3w3H+gU8BX4rbacb6mGTzJL7+hagAWolpT8aC8ewKaa7SGul/Q/w5OOdKexPmzd4KY+gq
	 QBibn+cOYRqf3C9ezO6UJH5DyuNUgjBFClxyv1Lkx1WTcJGMvLy5SeFx49OBVaSib7Z+g
	 UkWopI437IWetMgIxrVD0TihZ+D/bhml6aQicCQppiZ8klf6/Qe9APBzBWEsp8cE2PS7/
	 H5roHM/SiEs4Nc7iUXgZbXnDwPDjFXEh+NlnX3YelzGAphHM/1ZqdPordvNtn7DAfSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vYGAHAvMifjzfkrBI85O1q13l3BAF9fl4LmL3f41VpA=;
	b=0RlUBRqqXeCH+HzowNBrC1gWUn6RX/Qi+hJDWfSXBMk/R4pURNy+AKQU8AU/91pHuKJI
	 OZyRL0HA96Z5J/btZRGSv84dAYhFtOQKoNb7ynte8RVgbCxl8sf37L4ZePh2tDBxuR+8u
	 p78D/3SbnjayvQS7RzUyZgUFncptuMGZE0GZDytv916zk104MU26SJVBRUsvw6Zuj90tE
	 qbLJE7rPNpp1KMzDQ+Dflon7JdF57aC8MOSKiJfsT1S1JSiG+LF37Uc4e6PqRheD67Vj+
	 KEkUJmMF6Lqx/k8GKgJbJsw65q0uwnpw5WFsD6B69jipPeVaMA6ToWlwynF2IqQ/G8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dwQj1E11;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hisIKUG4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FF860A380C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FF860A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dwQj1E11;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hisIKUG4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoMi1858547
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vYGAHAvMifj
	zfkrBI85O1q13l3BAF9fl4LmL3f41VpA=; b=dwQj1E117HezDmgH///6IxHQuBc
	nBvpwI6a5PVCTCTm5kzLuoxEHJqCw7NBM4/UlI7QVls+bCoqN5QoLwr2EVGFklx4
	tupAGLGHPF4POJI7sRuXfmzW7GRY1b9QZe6+iJEz9FsubkuSv6zVZrM8iX4huzui
	JceW2Ox6hAigPv4kO+VrBuJcXbhKpEqpKNPHUtf/Nv3GngACesgSYumaI4Dw0uO1
	vKkCRDVCckfsXvJUVcsOP1ey1emsnnGVsy/6hWJzsyw+AWLNQQp7hRLUUrfxHp6j
	2cWHL6hV6gJIe6qpSP12Yqz+kYSAhCqDVxoIowsnj611tDqeMwKA3/UYFZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54mbdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so754750485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112077; x=1793716877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYGAHAvMifjzfkrBI85O1q13l3BAF9fl4LmL3f41VpA=;
        b=hisIKUG4AfSzjRRK7J7bvoxZMCIGrZQcosUDba6VEEvxgUkOxbIECn16sbme9bGKY4
         oL1UZHNayybxOUAYkCj/PjMqJRUjQK7/h5snp1CdWxJEvF0M3Fzt1MkaF5mbksMlGjVL
         d6yEkZiwsCoHGytjFEmEfm0m3oTDnr1/ZB5Mp3M3pXSY0Y/rVTz2mDWnWhhAXukdi84E
         COuUnNXyBnwDHLybUOlq6Yt0mmYuU+8BmahSsBwCWyCimsgQ48UgdKcdMPzS0Ko+691s
         4qSYQrOnFl94s2VVouryN9tp+ukLrYG+dEiMscfqIRTnWh0lcuZKUt6XTXiQDqAizPyq
         Q8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112077; x=1793716877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYGAHAvMifjzfkrBI85O1q13l3BAF9fl4LmL3f41VpA=;
        b=TutzMyMi8In98hOIhUrbNd7KBN2O/MjIkRZCjO5s+6BIl/dCUZQDGfKeYQ3RIXCwAk
         PLOngEjHRnanYP9a3y2zMAQRFb003BNfy5VCIkG4Atafg9wS2bjmgEJRq9P4M8Blt+19
         4hSbWiPD0GSHKfhvzEi5Yr2YnH7z/mFJ6BRDV414YmQQ8BAQ3EQjWqtIzqzk7Fzx5je9
         KqDeQYy0SbR4HpJfnB+k95UBXQGFFs0MGKoRQNhJy+ctLQqnzMGajmYlYMb9wunII5lA
         CeWy+qbHwNiSA0y9D3m3lQjpVcASpXfNxvy+coN5gUGI3icqHCcnCpMWWCVDSx78ml3p
         cHsQ==
X-Forwarded-Encrypted: i=1; AKwUvByNwSeVv1dQ6JrhWaMa2+Ve09nxb+IuVtB+UL5dvD2GltaGFvmX3Gpk+mkoQNf0nn4jTyTdi1Wd/jZYhfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwoWgH/3OmGEw4dqN0ItfznXICZxsYrG2b/h/4jrNzsDE9JOEg
	5Nl/L6KQ4mQ7nrLtyDiP21rUDoSMprWZAaH8eKnFTp+U4zyua+vX9iQud2eOUYvHCF5bF5+H1Tj
	W6ZoUAtYqeIcDx19KKLj6ZnMB3M+9JA1Dhh4XUIpH4tnCSuGyCaxxAm45CLM+bFZSOAI=
X-Gm-Gg: AYBFou31TeL/M1mQExcoeQY1AUTUu2QvGp4D7gG2uiec59H3GKq5IH3oCKqpy3vpmQ/
	NO4w96mYFZv9ll4GOejl5v5Ebo8GkZ/BEJm6u8vHUs8hxqqCw9s+/bQO+w5yw2+18MHF6SP0JAZ
	UA97e/CMMU9dvL2uUli3OVx7CiBLmgV+0KYZpEAa2qjYKhxJ7Ectk8tQs8frzWUrbNusQKn0DRt
	v15vKz+GNhsf6jjF2690icq8UsEVTOSCbxrtQVS5QQ7+NPC3coUcMBLSh6hT9O793aavpxKHzIh
	6jAU2vlj5kwGTQlI9UhKtPXK4qgT5fpysUm/n6Cf/HrudwYh0rVWI9iO5SeZPjSfzRVToobzvei
	BKfVuTVBOJro3U203U2JGreZIEOlqw0OO+Mg77XTyd+Qo+VfVJY+vg/kf5Q==
X-Received: by 2002:a05:620a:1a08:b0:93e:96cb:3083 with SMTP id af79cd13be357-940ef93e368mr1522389885a.33.1793112076562;
        Tue, 27 Oct 2026 07:41:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1a08:b0:93e:96cb:3083 with SMTP id af79cd13be357-940ef93e368mr1522383285a.33.1793112075965;
        Tue, 27 Oct 2026 07:41:15 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm468527766b.56.2026.10.27.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:41:14 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 6/6] mmc: core: Add support for resetting an eMMC at system resume
Date: Tue, 27 Oct 2026 15:40:44 +0100
Message-ID: <20261027144051.249211-7-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX0bExpxZnnlQu
 yCFnNbzlzKEnRAeoM5z8l2/eqv+faJ7+KiYYnG2zrqujm6Dh8CkBdjH/vqDJiIDrzZPMd1jW9RB
 kZ6Gd7TFMHzlwD8nYf9sChwk1ayIX0M=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0b80d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aACyBoiUQpo5pDtu5t8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: FkA_EbI5t8Lo2LQVfCobQ2-S3jeeemla
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX3NMbJ09vQ7rw
 kT0/RbrK7LZRT42g9TuTct9nM03rSIVsgkx8A8q9fl7A/N9HczNVMKl06xRDXH232Y4Xi2ObKqq
 iqVE8lgi0l1FC23sXleTou6EQumUp8A41d0bEMbKmb1AZO05tIxH4M3MGBas+yBjOXc7fA30YQl
 CCcj/kOS+aFdNjYsFSXG0LL8Kgea/y9Vs9zGF9fzTIMPFWIafJrUPXZSZUjt4vE8SEBzVc2ULFc
 t1/cFafeslHSlq0sN1mZhnFGER4kpDwAa44fQi5TeGJoM5ZAiH8AkfR3OptaurkNax0xPWHK9yy
 9eTCTiip/qPjS9JsetVdGkh+mlO0wKUqnwcQpvg2cZ27h82isrvHcnO2FH1H722pRi+sNeMiPj8
 lrkRO6lZndPSm2bUY8x0yLEmovxH0hcl6pVeC+ZocGTimBG/zodxeOop0CAX8x6XltYbkhuOEcV
 amhOGBXT/6Ms2/aqJjw==
X-Proofpoint-GUID: FkA_EbI5t8Lo2LQVfCobQ2-S3jeeemla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270058

The DT property reset-card-at-resume specifies that we need to make a reset
of an eMMC card at system resume, assuming it also has stayed powered on
during system suspend.

To implement support for this, let's start by parsing for the new DT
property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Based
on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for the
host, to keep the eMMC powered on during system suspend.

Finally, to manage the actual reset during system resume, let's extend
mmc_resume() to support the needed behaviour.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---
 drivers/mmc/core/host.c  | 10 ++++++++++
 drivers/mmc/core/mmc.c   |  5 +++++
 include/linux/mmc/host.h |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 8e9e61839198..e3daf4026cba 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev)
 	if (host->bus_ops->pre_suspend)
 		return host->bus_ops->pre_suspend(host);
 
+	/*
+	 * If it's required to make a reset of the card at system resume, this
+	 * indirectly also means that we must keep the card powered on during
+	 * system suspend.
+	 */
+	if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
+		return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
+
 	return 0;
 }
 
@@ -375,6 +383,8 @@ int mmc_of_parse(struct mmc_host *host)
 		host->pm_caps |= MMC_PM_KEEP_POWER;
 	if (device_property_read_bool(dev, "wakeup-source"))
 		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	if (device_property_read_bool(dev, "reset-card-at-resume"))
+		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
 	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
 		host->caps |= MMC_CAP_3_3V_DDR;
 	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index d4bf0f25bd74..908d5cad304b 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2315,6 +2315,11 @@ static int mmc_resume(struct mmc_host *host)
 	}
 
 	pm_runtime_enable(&host->card->dev);
+
+	if (mmc_card_keep_power(host) &&
+	    host->caps2 & MMC_CAP2_RESET_AT_RESUME)
+		_mmc_hw_reset(host);
+
 	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 	return 0;
 }
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 032c018650e0..552873da7987 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -430,6 +430,7 @@ struct mmc_host {
 	u32			caps2;		/* More host capabilities */
 
 #define MMC_CAP2_BOOTPART_NOACC	(1 << 0)	/* Boot partition no access */
+#define MMC_CAP2_RESET_AT_RESUME (1 << 1)	/* Reset the card at system resume */
 #define MMC_CAP2_FULL_PWR_CYCLE	(1 << 2)	/* Can do full power cycle */
 #define MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND (1 << 3) /* Can do full power cycle in suspend */
 #define MMC_CAP2_HS200_1_8V_SDR	(1 << 5)        /* can support */
-- 
2.43.0

