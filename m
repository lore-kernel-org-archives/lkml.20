Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA3E472F78
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191297; cv=none; b=VKgnngScJlIreWtbQX01XdFpC7uJBnt6QmTXNBdaH1bF+s9fyUgTt7CLL6qudxMSwlX0JL2zzd0NZHDUlWKc/LfyMByY6CthpVvLojUuzdiToIeILtCjAtgIcXn9XWhnCm22dc+BzWLElHq6HOCTyDPrtE+LmiPICQnODWpuq9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191297; c=relaxed/simple;
	bh=N4AdlAsQKxMJdowNshEikVOytfPVWy9gkAWSYoaqOCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpOoZ+HPnj6taqU1i8jDwk31GhFdC8dWtJk1LblVgrY+3Rex0qre0yaJvbAngV0UJ/HkxH6ZRxKzvNgel7jdJPPYvSgLOuNnU7E/kQUnMb08zAD5VjeS4orZPz+vfbG5GDT8vw8EBkPIwpYSxX2NMfVdNOMVql3QoDNDrMvvAVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4SojzgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvpJJPTy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4SojzgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvpJJPTy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VET8rs772421
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uCsZ3FqknJ4
	Cg45n8QFzBYP04ODkNeuhexPi+TmKkwI=; b=W4SojzgPN/KxEI1QZcFHTQkkI4o
	kLoj5HjsQJaaHcF3UIgrrD9Q4ffPLiMpDQhaPUysXeo4WG3lYzRrK8duXosf6bVI
	3J/dyf7+u3lQk9DsBsRMW/NsFCDEkH+LPAPzV9pxswBefkXKMO6s4Z/3mEAHQe22
	af/yySr829HOKhK8LxTk9o+MEyVJQs0TFpCpLqkeGC6OQ6GJcetfxXlWEo5/PA6J
	ew48ic9E2ydthS3my4Az4gyQQ/RzQA+dyFzVb1GnZTQb+661YeYrg7l4IYoChlxq
	J/uhTrqetGfAS8xukZeIR/SJcRdRQ7DU8f5HglS/Lon6t0X4+HQM1B/mNIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvs57f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:48:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef13b61bcso739465385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788191293; x=1788796093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uCsZ3FqknJ4Cg45n8QFzBYP04ODkNeuhexPi+TmKkwI=;
        b=CvpJJPTywmHJSlnttU0KPkB/g+BUWZe1wrMUDx1iwkDyXQEwv898BQSj6OCKpBIMGl
         BI4kMY4soOPSMCQENbv5kTZvl7HHlIlWS4vbuUwkZwMLzawOUBfNZbyFuytiia3/gUnY
         jTC1wPO/7pXIS3cLvQy2QoNkGT3zfcAZ0bQe8ytZQPopXhE/F958xtUv5La2M9V7fQCz
         P4bSpqlTb806zul4GGYNRSX/YzNXAyy0vIogu0nqQvfYMaONkyd/PrM+PDeIth9+Ad0n
         Ja5Gzvm2ZAC87Jpn99iqreNKsh8wUkqvRHsSc+m8b9RnxsYgQQn8j3idGBdDC6l2F0Wq
         GJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191293; x=1788796093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uCsZ3FqknJ4Cg45n8QFzBYP04ODkNeuhexPi+TmKkwI=;
        b=KRKGHW/Eo3DMj6pzw67NVIPax1inXCJwTWUiYQZ7e+Hd3/8ET0xkXqXPFHuBahlXlq
         YBGGa+4SX8iloQNYWs5hKYFsIVim88tmDaDLPyzUB6e9NPucf9QpXDMwtl5OixiS9an6
         WXEqKmR9yQ4N0aIiF7hvkLzv0XrNBg6HkwhtoogK8L/+bAYQtvK8soyOEi4jZRF7D2qn
         7ShbPgY0mbVITHHZc4ERtq9B/O5Kco9Z8x5NhO9LzBJmfrB58HaEnQpem5IyrXsv5YdE
         ZFaSKbyeKUro+GPUgHbokEE/4k4WCxWIjlGmruM9bsT74Az2F8gflvFd6w+OT/x0Su9L
         hB4w==
X-Forwarded-Encrypted: i=1; AHgh+RqZKDkw4/gwEEvN0zAXoY/L+dMPmnQwK6uG9FN49oH6Kx5AyT1UnMkGtM8VfDqUZIGz5Nl/z5H487mhuaw=@vger.kernel.org
X-Gm-Message-State: AFuF++ni17CHJ/k7vw4iov2kkOnCoToeOpRRVhfkCUwpmxpY3igMW+52
	g3glsArR9e4h8a/A/XXpBE7JUk1UOUlABed6krp6EWP0mqWoCKbUvtT1TWkW8jh3aZ/DvR4N7WO
	SLzhg7P7wTdtt/4yR2IJH4TxHhhqMR7sWVzPUWBEf0PsLaDwv4vAfCtcbS1c33z08YHo=
X-Gm-Gg: AR+sD13HJ6jO/mYS73LAfQkeia5+o3Qta2xi1YM5QqFJrFefHkntup7ObW4M4sRFYlm
	gLKUbPCnd3LYel+zADA5p9+3Sl/Mcm4tK6nW8YTYJ4JINtu5srzHQ1SbbhFsNR23dK6YWg3Sqhn
	mrIPQQTJr/v272qzawkcHlhIa4B9O2n1QnoJAh/MF8kc8utFzu3ViH8c4s5EFtThfwDhRFd73ET
	vXBsnWWxhdgnHLtk63jq4MsY8YaGCBpZFoe838+plgjtTJ9WIFrtaZlivM2rFDBXzNr/5LV5NGl
	7dMip9A8FU/IGTxGNQz/L/qg0Y/EIv0zHITFD1hHTzOue85ys4cbENDUBfbHTqxDu4TJgP50eAY
	+eH4wRRCKl9n8HUeBcW00i9XfFKwUETFkfv2HK0nOUSdzVPU=
X-Received: by 2002:a05:620a:29cc:b0:930:f1db:b9e7 with SMTP id af79cd13be357-93913966079mr2783347285a.38.1788191293150;
        Mon, 31 Aug 2026 08:48:13 -0700 (PDT)
X-Received: by 2002:a05:620a:29cc:b0:930:f1db:b9e7 with SMTP id af79cd13be357-93913966079mr2783341085a.38.1788191292756;
        Mon, 31 Aug 2026 08:48:12 -0700 (PDT)
Received: from trex (250.red-81-38-139.dynamicip.rima-tde.net. [81.38.139.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b456sm1558315e9.2.2026.08.31.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, stanleyjhu@google.com, beanhuo@micron.com,
        beanhuo@iokpp.de, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, can.guo@oss.qualcomm.com,
        sumit.garg@oss.qualcomm.com, jenswi@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Subject: [PATCH v5 2/2] ufs: rpmb: use a fixed-length RPMB dev_id
Date: Mon, 31 Aug 2026 17:48:01 +0200
Message-ID: <20260831154804.719528-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831154804.719528-1-jorge.ramirez@oss.qualcomm.com>
References: <20260831154804.719528-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfXw0XUyECoSVDT
 58TDBnGAAlPa9Flyo9dXycfLEYRawOGlT/qBxfxGi3Jlblynw6lM3xKFoJsq9IMYLkM8QblffOz
 QN/kgaS2pxfwtJ6zISVFmAgGD62OgDs=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a95a23e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N2KLPU99T7rsMuN2xAoQUA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PY6Zn8H8AAAA:8 a=1XWaLZrsAAAA:8 a=ArVhE-LcdHC59WzGYIMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX2myIsWOcr/08
 duwCm4j9uUSgdn8SjWdXF9UBmSHJ7cbjguKOX4n9WQh+EVh/7jVBTjqWpEZL5OvEaObDiteQ8Sx
 jlDCO5W+CaRR/wrPeedM86IPuXCnM5mzPNOT/hwMy+GG1f80bNOWHMsaX9r1GaADlUues0BOqwD
 aCbJJUl5C1ezcvvCaHmfuz0NERuf2ZhJhbFPXFYUVIwQ0tb5Qavwme00R/92vnbJaBObnh56MrU
 64LkAS8gBGAz/xQozolL3mMLe7ndpWgJQUg/X5ajJqx7FHmKbf+ysxRNCocgpHUJnyqeN4Dd9Zb
 lfeZU630XhRzxyNeP1bRZ9a6AIcvqnoRkwGrsbsmNt3wjD6UumN/hQnQU3t6Ie5fPigdt35toOK
 9SM6YM1awc1pvKNaIPgkftaL5i3heBosSCWUluXseC4LSEVTFizn/RX0N8cNwCmnIYjmdxfynwd
 CG/uZIfN0VLMJS2qR7Q==
X-Proofpoint-GUID: qZimuF5r1gQignqnusKMpCqdAPIpHD99
X-Proofpoint-ORIG-GUID: qZimuF5r1gQignqnusKMpCqdAPIpHD99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310135

The RPMB authentication key is derived from the dev_id handed to the
RPMB subsystem. OP-TEE implements the eMMC RPMB flow, where the dev_id
is the eMMC CID: a fixed 16-byte value the key derivation depends on.

The UFS RPMB id is "<device_id>-R<region>", which is variable length
and longer than 16 bytes. Handing it to the RPMB subsystem as-is would
tie the derived key to a length OP-TEE does not expect and diverge from
the fixed-CID eMMC ABI, forcing OP-TEE to be taught about
variable-length UFS ids.

A fixed 16-byte dev_id is needed so the derived key stays stable and
unique per region while matching the eMMC CID layout OP-TEE relies on,
keeping the key-derivation ABI identical with no OP-TEE change. The
reduction to a fixed 16 bytes must also be reproducible by the
bootloaders (such as U-Boot) that derive the same dev_id.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/Kconfig         | 1 +
 drivers/ufs/core/ufs-rpmb.c | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/Kconfig b/drivers/ufs/Kconfig
index f662e7ce71f1..b62c00e7ff06 100644
--- a/drivers/ufs/Kconfig
+++ b/drivers/ufs/Kconfig
@@ -7,6 +7,7 @@ menuconfig SCSI_UFSHCD
 	tristate "Universal Flash Storage Controller"
 	depends on SCSI && SCSI_DMA
 	depends on RPMB || !RPMB
+	select CRYPTO_LIB_BLAKE2B if RPMB
 	select PM_DEVFREQ
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select NLS
diff --git a/drivers/ufs/core/ufs-rpmb.c b/drivers/ufs/core/ufs-rpmb.c
index 79e6cd2b20a0..cb3ac23fa01a 100644
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@ -10,6 +10,7 @@
  *	Can Guo <can.guo@oss.qualcomm.com>
  */
 
+#include <crypto/blake2b.h>
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
@@ -21,6 +22,7 @@
 #include <linux/unaligned.h>
 #include "ufshcd-priv.h"
 
+#define UFS_RPMB_ID_LEN			16	/* Match eMMC CID Length */
 #define UFS_RPMB_UA_RETRIES		3	/* Retries for the power-on UNIT ATTENTION */
 #define UFS_RPMB_SEC_PROTOCOL		0xEC	/* JEDEC UFS application */
 #define UFS_RPMB_SEC_PROTOCOL_ID	0x01	/* JEDEC UFS RPMB protocol ID, CDB byte3 */
@@ -153,6 +155,7 @@ static void ufs_rpmb_device_release(struct device *dev)
 int ufs_rpmb_probe(struct ufs_hba *hba)
 {
 	struct ufs_rpmb_dev *ufs_rpmb, *it, *tmp;
+	u8 dev_id[UFS_RPMB_ID_LEN];
 	struct rpmb_dev *rdev;
 	char *cid = NULL;
 	int region;
@@ -213,8 +216,10 @@ int ufs_rpmb_probe(struct ufs_hba *hba)
 			goto err_out;
 		}
 
-		descr.dev_id = cid;
-		descr.dev_id_len = strlen(cid);
+		blake2b(NULL, 0, cid, strlen(cid), dev_id, UFS_RPMB_ID_LEN);
+
+		descr.dev_id = dev_id;
+		descr.dev_id_len = UFS_RPMB_ID_LEN;
 		descr.capacity = cap;
 
 		/* Register RPMB device */
-- 
2.54.0

