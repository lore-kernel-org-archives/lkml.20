Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7193D76
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959097; cv=none; b=S7zE/4FOH0fuvC0WpzrXYg8NbwCBWxZhLtlEVojqfKSfRRazOQDeRoMAITw11Np7nvSzcCHqO5Zn+/+5iXSec4jVahulMXadA31n+Ei/q5Hk0PP5qlywc+ZFYArwOPyQHhw/UiNVj8gkqWeKXNUtWoDIUNRVYlDJc/tBEwJnfYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959097; c=relaxed/simple;
	bh=+zmHpDxGzsgXIbjLeO+2/jn14t5d6rmiuLroQYwwOUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RktoClyHyyw3hOkVe/XgeHsc69SwWoa/JB0j00wlZhgkvN2cAsfoHBRloHcmte0PtucaHLzL8bXkK23YjhShS2SFU50GOFMqLpMEfUdSMufT2VJGcoHj1rGKuT2okDoeDOAmqRNrn3BZ4ucEFdNoagkrY4OnFyxEAh+Gcsjg4x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2MstG8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtxT9Nu6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2MstG8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtxT9Nu6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FH2xD2121143
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 16:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e6P8A409W54
	xuekpmuoPC4b08ic6FRICkqYkILbMjjo=; b=p2MstG8CMvZ02YFurKyDitqM9nf
	U2vCwtuCzEBykfyi19gxp+QnUJlA+lzWLq5yzznJaj5foXNCKsPKoVJwA5Whai+P
	EPIxLvhm34VMeQ+jzIU2KLkyeX6kCLwJz0cQWMwfMRoqgykMznozDbdRKXgjYD8A
	FOVDQAxgxe8CjYkvDhH5iqdxKGWp0LCehxtjqUzL95CdjOpx9zRCJ2n3kAMFEWdT
	ft379YP35M76qZPsyT3lSOvIIphQrx7n0E+x53IMG1StnFSIdGSaIDNfILZsvtAu
	MLJlBRCNMLz5jwE2cy2FknluH1BtpHRPxHmb2b6wQPMHp6XdQXi5u2+tX5g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh36fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:38:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so15075082eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790959095; x=1791563895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6P8A409W54xuekpmuoPC4b08ic6FRICkqYkILbMjjo=;
        b=VtxT9Nu6JQjU5VPDb27HL45tSsz2Cos5H7SjC0viOb7xPSZECuQJKzdQMzxu/0MLLo
         nJ+lGlV2+V8sR1Ca8IQdGTYJX/ixTWAX6mEirnIarERukHB1jBk0Fez0Jb4jGsksSD62
         1rXRlLdhK3+thwvHKk14nJCNYd+KjDpxbbtaiZwbHyhbohxjnXWq8aaOwFi2XuGAYzjA
         UrP50aKFZcCRAObrpKa09fx7vfwy4TaRs5Bv9pySmjtkbterMRpu7glKEyjJvMcKyGxR
         72V8ycfHZvyxGXBnRN4EAqV9tONehQVzPyGqDwLK6cz6BxR7KiEy57gMSDMd6LxjcjPn
         qaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959095; x=1791563895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e6P8A409W54xuekpmuoPC4b08ic6FRICkqYkILbMjjo=;
        b=nvibwyLoum7ybstvGPBhiJAgPAKvp7XgdAXq3pKpGy52vWdZkFScwmGw7v8MUiFza3
         mQbVGkPB9k6U4Wz/ETSCvmJVMLcThNVikVipobyoneN+cH723kdGfnPRXeZNZroSEvqu
         os+biLhCpUiiItEqPdfTa7iX+fqUsi4sWG+6k5Nd7AZccC8t0exOPw2RsaNRMB6LPyEc
         gdEFsDiMweKMC1AHTCsVbxlHR52pQgaK5KukSYKar2nUxUHFao/p+EtTr1EE9DsJX+tk
         kCWSgu5XWQSTstAeBKF/acqq4QEH91IoIXlDGOxPycUmJb4uQK3Mm2nd97odxXYHCIyF
         Kk2w==
X-Forwarded-Encrypted: i=1; AKwUvByPLdssAB+D0OW3nlyGeDyRRb/AB/7kMX8t1rZyB/QxpDm6b/bZDgl1/HKgbv4ObWbtxp4Zq9I+ygTsi5g=@vger.kernel.org
X-Gm-Message-State: AFuF++kiLccUua2whN7oZLfY5Thszw7QiTncFon3QWaqfqYh7Tez5G7V
	L3keAtWJrmsl45AFdHdF/6jhCq9SXr543b0onxS67notPpkmIXEk73LEGJhWxoRkKbvC2A5cNZ+
	tkfBSdMDTx6Vx2yb1P5/DBbKgub0puKK29Jb55hHjTN34QV+T3mbzMTf3nl+oYlXDOfY=
X-Gm-Gg: AYBFou2Dth5r/ANz13NQf6087pOSwrRARmsuO454RztDhuUcioY0Yw1Tm+EOr2VNhj6
	7AgrixJRJk0iWZIzJkmtuv89f0cvC8V37zWOwQG+r4SQTyG9ti3p08jhso8xH5sMY6Nm205BlP0
	gfM0biYiCwtKw3iaKel06sF1Z5UMmVGLCW8/6Oxgy0SqH5M5avAcL9CuG76jV3HA54U4ZHfnU/a
	0koLA8k/kDxvfgR0l+BSAaICdSNjOBPlxXNxYHYZtK9y5WaKXq4hiKKXNTd75bxbiRqnOZmcoHM
	jIZnhp2ErkNolRc6i4p4WkUjbF6mPksl5F0LjcJu1qqjO3J0kZbm77ECsUudpiw+fBcAiKRdgd6
	1pNVas4OGB3l89WXf+R6JBceWYME0RkUSdYsNjg9g3fgD5FlAb5I1PZkpp/+w/7kOVwWJFSCMx4
	2g98UTowk1JdDK
X-Received: by 2002:a05:693c:20c1:10b0:351:595:750b with SMTP id 5a478bee46e88-35105957899mr2170003eec.36.1790959094490;
        Fri, 02 Oct 2026 09:38:14 -0700 (PDT)
X-Received: by 2002:a05:693c:20c1:10b0:351:595:750b with SMTP id 5a478bee46e88-35105957899mr2169976eec.36.1790959093938;
        Fri, 02 Oct 2026 09:38:13 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fd5620sm7756398eec.21.2026.10.02.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:38:13 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net, anup@brainfault.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH 1/2] include: sbi_ecall_interface: Add defines for the RISC-V SBI watchdog extension
Date: Fri,  2 Oct 2026 22:07:57 +0530
Message-ID: <20261002163758.2919372-2-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002163758.2919372-1-prajwal.n@oss.qualcomm.com>
References: <20261002163758.2919372-1-prajwal.n@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfXwv2auIv+0592
 on39pyAa+xKuv2U7e+GTgkSgWy+6+o6Ncn+rmijD3M+2hI49MIJ1NG1dml8nZQQshax0B7cvTij
 EbHjSzHmg+dW09VeR35cu0FNVHJMZ4E=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abfddf7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JCsno87Pq3fPI6XBcfAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX2fEtA7N/QZPW
 UqijkqrPo1ajX1ResBkF58TB0y6qVsyZ4xwBpKIjycE+TdCFV6RQ7gf63LyojzyAAYQgz7u8i5B
 z+wCQcqc3oehJu5T651zlm5vmg7jgOo1qceo24XNGpNBubAzjb6EZsaV/il6wL6/2LtcAIliwRr
 BwOWU0ASJk4XuR1wujx363OxshDnvH2cOoxhUeOL50unoVb0VNjtA2ddu/5HNMU59PrwLWUSR6p
 titFvErKR/FLlxpBPocMY9Y38oAm//oyDEN8r9K/5d8dCAMhwNGeUnZ6FwoSeiD+sC7P7QR2oez
 hWZLYePYx0xWGFO5/gsgV3A+kdZSvamEjzOYmoOzaX26jwh6kyZ0vf7AQZSBFQ45ehVHkZyYl1m
 DaorRnG+HbsJo/K8G7j5QcIHyh93vGGITqTITE5V/7CkSaLwxdciSIQ1wpOALlDqrrmAQpcZHbU
 AiAEglQ5Tj4InsbKj7A==
X-Proofpoint-GUID: vdlh8uXpXbWX83V5M1UePGPiPU5zua2a
X-Proofpoint-ORIG-GUID: vdlh8uXpXbWX83V5M1UePGPiPU5zua2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020066

Add the SBI watchdog extension ID and function IDs for supported
operations, including start, stop, pat, and attribute read and write.

Define the attribute IDs exposed by the SBI watchdog extension, including
watchdog capabilities such as MSI support and configurable watchdog
parameters.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 arch/riscv/include/asm/sbi.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..b67ee507c517 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -38,6 +38,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_WDT = 0x574454,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -534,6 +535,31 @@ union sbi_dbtr_shmem_entry {
 	struct sbi_dbtr_id_msg id;
 };
 
+/* SBI watchdog function IDs */
+enum sbi_ext_wdt_fid {
+	SBI_EXT_WATCHDOG_READ_ATTRIBUTE = 0,
+	SBI_EXT_WATCHDOG_WRITE_ATTRIBUTE,
+	SBI_EXT_WATCHDOG_WRITE_NOTIF_MSI_MESSAGE,
+	SBI_EXT_WATCHDOG_START,
+	SBI_EXT_WATCHDOG_STOP,
+	SBI_EXT_WATCHDOG_PAT,
+};
+
+/* SBI watchdog attributes */
+enum sbi_ext_attribute_id {
+	SBI_WDT_CAPABILITY		= 0x00000000,
+	SBI_WDT_STATE			= 0x00000001,
+	SBI_WDT_MIN_PERIOD		= 0x00000002,
+	SBI_WDT_PERIOD			= 0x00000003,
+	SBI_WDT_TIME_LEFT		= 0x00000004,
+	SBI_WDT_NOTIF_TIME		= 0x00000005,
+	SBI_WDT_NOTIF_MSI_ADDR_LOW	= 0x00000006,
+	SBI_WDT_NOTIF_MSI_ADDR_HIGH	= 0x00000007,
+	SBI_WDT_NOTIF_MSI_DATA		= 0x00000008,
+	SBI_WDT_ATTR_MAX		= 0x00000009,
+	SBI_WDT_ATTR_RESERVED_MAX	= 0xFFFFFFFF
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0

