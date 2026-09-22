Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CA25519B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090356; cv=none; b=csLzwt9cgmDUwBeDcDfyTpdAiFkuZQcdnmIsQTH9cn+wkopOf2BaVhOSdXb9K5MallANDyHldCKkTLnZcDEx/8S//FZrAFKAJewdB47w/TjXPDtpni0dCqmJecfJU4ZO4liXCqxC/gs7GqoHDmkjUGd33IKX4RLZfRHkD8cOHXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090356; c=relaxed/simple;
	bh=qKU/+TC29Qdo/H/kbTGQp+ZjmMowErRa4hVsa8ZF49I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sd5nWckCsLnE8+zYiXTY4oBswzmfInabCS53ZeCdeDC+dCeArHltYwRq6H44metN4qH3iSgLKsKkaM8XZisxUyfyqiyaiZJFIXTbWLPr1nKRuguYMqienDVdsLP5cu8i0Eqi5mkIyRl+8G6Z48s5wQgEFT56pjQUvWwbwGhb0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SL20+d3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjSv3Qk1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SL20+d3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjSv3Qk1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjQDC705843
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QJ7BDtvrQk9oc493hpD5+c
	MdtDSBDbzy53kpeL3b5jI=; b=SL20+d3hXneetHnxh7Oq8zr8VZELVI1fHqEBbC
	1z/tbP5Ven6FRDLwn/by9b7bzYx8E1erSkPqus+EwhnjL2y7YBkM35DUHgwcZWEE
	jQMOPpGxYkAPwIm2MmGppInkXsaFdR3HngA9U4l2KbbQGhLLX4TMBa4ZYRygExs/
	LZwTkZDM6sEICK9nDxxjoZf8CPD1HYuTjwf/d1zoIUiWTdOKoLJx8sg+qqnsLNRm
	Rvatf5NLh1NLtsrEVhpASzVB/Lz/qv6mnNB5NLz6gdRlHT09lu1eXQX6RqtGSeU+
	ExpPmDnGcn9zuqPTvldAlGdrQQj3RwGGPIiFVkdDz2tVRMpw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbauev6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:19:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so1885a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790090352; x=1790695152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QJ7BDtvrQk9oc493hpD5+cMdtDSBDbzy53kpeL3b5jI=;
        b=RjSv3Qk14lP1raQeWDBvZp/x6twTTzeRX+1iKm95CwTL5eIeoYR4JcP2VTW1qpM6Dl
         YHm70KjRWhQNuvOok3p88l2b4RicESysoiLtuZ6HVYHkneDdu1NQiN0PbtF6C5QnWZgM
         +QHNF9C42UgqqwHYSkORbEDp5eJ/VTRNPiDkBmp1+xv9UdYZ6x/Vx7Spuvvk3HKA41Ou
         1YXA1UZ61XG9/5QVLPvqCcJlSRT5tHVw7GLWl4pNDBZIeAaqbiDfi7j86frcqU01ZWBl
         00aQC3tLNUhxqeuHrXqWJvLe4OdlD1dxP+pShMaJ8JzgX059DC5D5hIwqmzl7ObKs1Z/
         MGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090352; x=1790695152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QJ7BDtvrQk9oc493hpD5+cMdtDSBDbzy53kpeL3b5jI=;
        b=jjTuOtLOaA/21IImoGjvt9dSYaBCEATDWdgEBFG+4RjZW7v+xn0BrqzRUBtC5ao3K9
         gFRM5hdTFAfp9RNPg4olL45ekfonMTnifwhNuP8dj3c//FCBZrkw+KZCCT8IBN1aOdHu
         v6XKyMbKMjMaPdplXuOdUuYziXIqetBJvN0I4WkMr7+KmEdeKig2iqcdipfmTikT4+KW
         R0IXR1JQ2pwIi/FApPrXB+m6N3gExwi43jTEPXoa/Oxkf16YPt6JySn3W57ZOo9p+Vcc
         aYStxu9k5iz18e56sd5eOlU//eQxnDskJje6b5MJDJbfMNm7FKrRVCKbUqrLF/zNwvH1
         UO5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwakxht4cevXHEb0XIcO2RwRWiPfsPuyoel5TxdglmbO0BWIoa96hd4ZCeg1H/bxhSr2G2fbROc63hqYrc=@vger.kernel.org
X-Gm-Message-State: AFuF++mnQb7odYkZag+u0HhyoqUC1c3lNW9xHQNbLHF8OEgOM0ZUKoXI
	RlTWXy9ZVXTRdSqRD61MOsvW++d7HKQOcqDl0ToI4DQEcMqEPKyW9249Z8NHqmKMGOAkydci9f9
	JAw4cuFBGGrJ+Ru7PRVXLSaGMSP/0/epfh/utf7zCVqaljN4S9eHhILGsniNuyoi7Ihw=
X-Gm-Gg: AYBFou0oxvr/a7EMmfpJH2bNGTFCgl59l0zTisaGdoZxeXpShS6x2F4U3z+5cmVl8s7
	BuXd+VRYJqBnmbMTBALFAqBsI45jFClEPmDundeO7ziKXJtjdZ71NQKBuW2ClS4T0atulqoR9At
	436yxey5PRI48gkfOp2ToEb0Ww3xLkrfKoRQyAo9zOnqpJmK1SLJx79h8JtKHfgF/VCZME5p18/
	FLFqKIpEIIZnx5unbrRcV4/0ca0RF22dW9g7VwbBEeElWz1JVkVh/5SNwwghVLt8jj9OsvDZDeC
	DX1v5srWThiQ/EXcp7hjOUCtApFFhCgFcHvUxBQ1gNcnnCP5bhTl49H1HPdLfWRdgr3ImSpGnVX
	ZoV4b9HVubphSmnzt1+/tu9J9x+UPMFClgrteSq9GJL+ipV/n2STvFQ==
X-Received: by 2002:a17:90b:5806:b0:39e:6c69:f47c with SMTP id 98e67ed59e1d1-3a073273eabmr1751192a91.59.1790090352045;
        Tue, 22 Sep 2026 08:19:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5806:b0:39e:6c69:f47c with SMTP id 98e67ed59e1d1-3a073273eabmr1751157a91.59.1790090351483;
        Tue, 22 Sep 2026 08:19:11 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07d881b4bsm31367a91.15.2026.09.22.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:19:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 08:19:04 -0700
Subject: [PATCH] MIPS: generic: Remove undefined image 'ramdisk'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260922-mips-ramdisk-fix-v1-1-959d163c2445@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGecsmoC/x2MQQqAIBAAvyJ7bsEMivpKdKhcawlNXIhA/HvSc
 QZmMgglJoFJZUj0sPAdKrSNgv1cw0HItjIYbXo9GoOeo2BavWW50PGLm7ND5zpNRC3ULCaq+l/
 OSykfKmiGe2IAAAA=
X-Change-ID: 20260922-mips-ramdisk-fix-bfd73f30eee1
To: Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIyNCBTYWx0ZWRfX3aaWyGma2aoN
 peGPY/dwzdxTKDMS5bcJ3TzkZPb0jClIIxDAjpcmCKJD+IOXyLMUXAgcBJ38WcQbjFKY4FO3mJ/
 oxCpPIrfqQ5zHnOyG0IwAx+0oIxaveQpKxxduaEfCz1Fwi+ZE+aHh9KlhzRswLGYVSb9SgN7vBb
 z2f6GLRy0kHNr5PjEDOI4euc4zi+6tYlMOGgddN1/9/juT0cZP4rlyMNXt7NkC28QS0Y/7ahSCO
 HJEtpUFUzkc0pvXoU9OQVpvFi2J/hisEvCEAVTg8hXcg51dQfje5TYfzseLkAfRwOejF+O5Q0ix
 BKddfP/2aUYMQPbEUfUzG4wAQTOXUl3xDDao4EGOFOEK5hEdnzFk0uFD+XD2XcIkshOIVCMQfgD
 VpLpFR77TaqwZAM78VStVQx5MB6Z40NrAgQA5XPuFVtYJ9/6yoSpFfgqAt/H7k9JUtYjDRS6ZUP
 zwY8ktfm9X7+iACcV8w==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab29c71 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8 a=jKwo560XmKW45XqFjXMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIyNCBTYWx0ZWRfX8pN1R7h8239S
 qjn8euT1xuNlRvaUpDMAetX6LNPsSkxuLlWS7hxSjXcSEPvWInm4Ahl4u1PqTggCwEs4Ryli8kc
 AlrMV5iukaeu7ffb7b/ios9QcFW6Zhc=
X-Proofpoint-ORIG-GUID: lDJMWrx1CcTvFoG9roTZ_g_cscZhKzm0
X-Proofpoint-GUID: lDJMWrx1CcTvFoG9roTZ_g_cscZhKzm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220224

As originally reported by Guenter Roeck [1] and subsequently confirmed by
me [2], a MIPS allmodconfig build can fail with:

Error: configuration 'pcb110' references undefined image 'ramdisk' in property 'ramdisk'
make[3]: *** [../arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.itb] Error 1
make[2]: *** [../arch/mips/Makefile:403: vmlinux.gz.itb] Error 2

Or with:

Error: configuration 'pcb105' references undefined image 'ramdisk' in property 'ramdisk'
make[3]: *** [../arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.itb] Error 1
make[2]: *** [../arch/mips/Makefile:403: vmlinux.gz.itb] Error 2

Guenter's original report made the observation that this was triggered by
an operating system update since he saw the same errors appear on
previously working kernels after the update.

I prompted an LLM with the information available and it provided the
following additional information:

This is not a kernel bug — it's a mkimage behavior change in u-boot-tools.
Your system recently received an upgrade from u-boot-tools 2024.01 =>
2025.10 (Ubuntu 24.04 noble-security), which included two upstream commits
from June 2025:

- tools: mkimage: validate image references in FIT configurations (commit 7a8b25a)
- tools: mkimage: propagate error codes from fit_handle_file() (commit 21705d3)

These commits made mkimage strictly validate that every image name
referenced in a configurations node actually exists in the images section.
Previously it silently ignored undefined references, now it errors out.

The offending files in the kernel are arch/mips/generic/board-jaguar2.its.S
and arch/mips/generic/board-serval.its.S — their configurations reference
ramdisk = "ramdisk" but no ramdisk image node is ever defined anywhere in the
FIT source. This was always technically wrong; the new u-boot-tools 2025.10
just enforces it.

To fix the issue, remove the stale ramdisk references from both ITS files.

Assisted-by: LLM
Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/f817c158-412b-4fd1-9941-9c2ff421b91a@roeck-us.net/ # [1]
Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Link: https://lore.kernel.org/all/7eca1c7f-52d5-43bc-afcb-1f6ac198e391@oss.qualcomm.com/ # [2]
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 arch/mips/generic/board-jaguar2.its.S | 2 --
 arch/mips/generic/board-serval.its.S  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/mips/generic/board-jaguar2.its.S b/arch/mips/generic/board-jaguar2.its.S
index c2b8d479b26c..a91a06f1254f 100644
--- a/arch/mips/generic/board-jaguar2.its.S
+++ b/arch/mips/generic/board-jaguar2.its.S
@@ -28,13 +28,11 @@
 			description = "Jaguar2 Linux kernel";
 			kernel = "kernel";
 			fdt = "fdt-jaguar2_pcb110";
-			ramdisk = "ramdisk";
 		};
 		pcb111 {
 			description = "Jaguar2 Linux kernel";
 			kernel = "kernel";
 			fdt = "fdt-jaguar2_pcb111";
-			ramdisk = "ramdisk";
 		};
 	};
 };
diff --git a/arch/mips/generic/board-serval.its.S b/arch/mips/generic/board-serval.its.S
index dde833efe980..3b89e208d29a 100644
--- a/arch/mips/generic/board-serval.its.S
+++ b/arch/mips/generic/board-serval.its.S
@@ -18,7 +18,6 @@
 			description = "Serval Linux kernel";
 			kernel = "kernel";
 			fdt = "fdt-serval_pcb105";
-			ramdisk = "ramdisk";
 		};
 	};
 };

---
base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
change-id: 20260922-mips-ramdisk-fix-bfd73f30eee1

