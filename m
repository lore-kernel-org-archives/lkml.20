Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941111;
	b=n9Grku2YLDAzynOGeNmjbjvmLuQSnv7JI1PMm/RtTROEioyC6dsk8MKebdgjOc9OaKnL
	 YNwGUriyzs9dQx6E7HP4H+OcbRa4o6DWJwK3sQrXERVYZHDg3hrfwzvw/Q/jP4MkkeRs0
	 BlB1KE2TvlDQt5udsjM7xTKUrdEtBudpV4VipFTkUlRJYGIKK/NPbksAwomqLzPBPXSUU
	 9Talfpi5ty4WDlK6Ia3/51zHFGInU73jb28IIPrCpeBZGPqRrBzOKUZyzfFZyCMiJdgJc
	 +FMpXaNctEQXWU2eYemAe3LEAMR9IzonnV0zu8JfNfX5dQesBKW85e80GKtnkGLlx6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZS+ZPBExf8N6EoGjEt9fsjVijaVhiR7NVbU8PoRpNXA=;
	b=KbKrPy/CZCWpD9VsZEMuKjMmNkdaLjUXn8Um6UW8Gr71sXXl4t/sgetcWrnX7mbXEyhu
	 PHVLzR66BSCUXkqAKy6bopFIqp4wv1ZIu2LT8CC7d/y+wb/4d8e6BTzb+AvV3YJh96mJt
	 KmXHN5cAn32WgrkTeeLtahENpde5MwT3nqLZmr62Jf0HeH+gH+UX9WBIjE+/mytj7CAdL
	 zGJX7CCR7u/fWOoZsmoPtD6eyIKMAV3xCgf24O4jAnd674/5090J0vnF/ojmzKQmukZ8Y
	 Qz5ybm2sUqRqTxR7hMQ4lgdagunnNO+BvPlMOSEvzPFdHZkBgVGy6lRDLMzFn9sECUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d3rJ3wnI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IucSou4A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C4606D80D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845C4606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d3rJ3wnI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IucSou4A
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6400Yv2779108
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 04:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZS+ZPBExf8N6EoGjEt9fsjVijaVhiR7NVbU8PoRpNXA=; b=d3rJ3wnIp4OYfRG2
	cEBP6HwzASjm7dggTDaU3TGUHSMc8uqAw2lDLhT77A65Spvo/Lt9rXIkuok8N2/0
	NBWAR882nFpYBqAdXm4YBBLe8cXiNXOARZcecyhFIdfkHMPQcUz+9u27bNn1Ict3
	TqFGN+6Xm9Vrsp1o548fE+vDAviPF8BAfomN29OvwSZfo7TjY3HN2aoUKNEj4wlG
	wIp6kMASNmfEOiO5unKheS7GDsSV71yIAruIMcj5wkFFl6LeWQUHgBG+oXe7TIoB
	6nAYA7pB/c0ZWnez8Y/Rn0FgGOi/BB8dt1QOAIxrthGuirizLyT6xn1EA129Eurm
	UDt1BA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0xfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:58:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25dc2aa8bso609807c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793941110; x=1794545910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZS+ZPBExf8N6EoGjEt9fsjVijaVhiR7NVbU8PoRpNXA=;
        b=IucSou4AsdIP802iRgVco/k05HQE8loT5yZKH7qefjMyNxQMb1Gv6u4yP175ZbfiXR
         jSPQ/RS4Jy+NC8sM5Ht8dd56Q1WDwEnPrc0mka4HV6SmHE3eIT8NSBXXxksPaHBVOAkw
         MNbq0BYwKuvOUKjr+T7wRPOTU8q3DpnHszmp7+8z2GOtcqr7v8o0VwD0UV3o+OQK1h3N
         j4tMnSOYlR67ZK3fj/UeVNDes+hJqozv1cGF3+QMn27l8shzlPW5JQCI8TI/Lk55TQVz
         VMhpZp/76KgdprpundNZJOEMwCXdQQH15X/sRIWPQwOzTDvvado1M+R9OmNOJj46ktVI
         xu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941110; x=1794545910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZS+ZPBExf8N6EoGjEt9fsjVijaVhiR7NVbU8PoRpNXA=;
        b=QA2t7kbiWJ+5pxJip3Nex3oGoZXUFHhoi+rrFE62cGFv19qX+Tnrmwpl1MmZLtLzml
         JysB0iEqnbcCcMZs0b8EIqO/rpzaYc/evE0xTzVxYBaX7l27HsIKpFQyLHJ6vejQJmzF
         LsjVKemlRk+oqNkHezItComGvfaw8ISErGG620rXfEAyEqTz2t8mkiqiNepIN7IRr5p9
         Y4NU1wCs6QEqYqCAIwEIBqRBVfZSC51R4J5bCN/M6YwHt9O0twte5I3Ntp4P3Q27VTCM
         49z4b7YPKe3OzECMVWKJ4nA2HAHX3Ch5Abzx+qN6yl4Iw6o69lRI+W2fFJ5qadqSPvp9
         9XBQ==
X-Forwarded-Encrypted: i=1; AL+hErH8mo44bCvULPOxFJjg9xQBavrmdQycVceI5TvXkC/TS6ek93hHlctlf6ctIbhKjV++05fBdtGX58eLMzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z98I6EDdAvi6oPzM7RiLlwmXML2+CPnLGc5hVN4VWi5pnWaUaAp
	ZtPFEZbd/c9CWUzfiyzKithj0t2W+LV4qE+axuQVAFbsXyXrrOIdxnrF5n1elGSIkNFeYU7fvxF
	E3ueZTR5EJwzFh/lVJgo0DaD5ZMjv1VWwwqER48qP+xeBvlz/v2sb6l9Cnx6evJZQ9dI=
X-Gm-Gg: AYBFou24ZCxvVYKw2wTrhRdwiYMqVCCj1fVKyWMYgX3KT9TFHfYM+ZQUAwE6G8c2IXn
	M4BGP2ICGXDpNaRWHT+2Zvx82reF3V/1AprwLsGBfiNyvIcC3mFvDqWg2O36s2Lch5oM9qWPlsP
	O095XGy6vYEdJzwJlwBWBMBmFOqkfejA+L/bFxD/hANH+J/zWzQS/r6cLC+jJTwvs8/7tI6nzSZ
	LavvWYNQt2KT+xJ4eMDnumvUa6PiXmpry+EKqBwatYdJd+lFW478wAc/jpLUhS8ZztxZL+uzUTD
	qhgdCGLulRTlSDzCYDQWfwzM0j03viTuHbO1pFr5oTu+LR7SZdWQSRU93rzBmHsylcugjmCow53
	PllPuKfphWtjkU0bpEfvtw/WJkMUHifH8QkrvS/XlKmJx5eZ9ojQsvyGQlARjzXS1JUwrOtNdCP
	2cC0m7mShODRb66Mef/unsILrghk1RE9ZUiobnYg5rsxVLKTQu0QO9lUjiGAVNb+FLn0f8RuXlM
	UYk
X-Received: by 2002:a05:693c:8008:b0:369:d486:457f with SMTP id 5a478bee46e88-36f73e72d61mr1900162eec.2.1793941110206;
        Thu, 05 Nov 2026 20:58:30 -0800 (PST)
X-Received: by 2002:a05:693c:8008:b0:369:d486:457f with SMTP id 5a478bee46e88-36f73e72d61mr1900135eec.2.1793941109700;
        Thu, 05 Nov 2026 20:58:29 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3021327eec.6.2026.11.05.20.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:58:29 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 10:27:43 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: Extend BA buffer size to 1024
 for EHT capable links
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
Message-Id: <20261106-eht-ba-window-v1-2-622f2272e582@oss.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Paulson Raja L <lraja@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793941100; l=2431;
 i=rameshkumar.sundaram@oss.qualcomm.com; s=20250120;
 h=from:subject:message-id; bh=4swqYOm/vWgu5fj29xpSAZ2upc9FVcz3hlehWFqxrj8=;
 b=vTZPB0TRQ5gcBj/f2Cc4sgQMqu9JEOzJF64Te5bBVKPJwjJOugIWd7RPUAIOrqpjtUEpQL599
 Ic34wB/Fvl8DUaGlZiCbHlVC7V5fmll/XWf2XbewIDZnfH8uwhcmkqg
X-Developer-Key: i=rameshkumar.sundaram@oss.qualcomm.com; a=ed25519;
 pk=CbWiiM4JikGBEWI7HtrEEE/Hwkk7TTcob0SwaFdAwKo=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed5e76 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jeHpWAP0zc3Nfv8w7osA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX0UWF7TTJb0yB
 uujDNmw7mMvOfpeDzmNjn38Z9hL19LWSWs7E3blLTpFj7JJYHsQuBfZ0cU8ByoL673w7f8ZJusR
 cUT67tG9p0NEF7cV1xi3W6+yuBSlSng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX1ntAY/Lix9Jo
 06GZaF5McPmOaXvzLy6XT6xEzz70W3qRiMsSisBVX+ToLqIOjRy3AfEqI3Q4uKUPQGZ9ExvtBAK
 xox6nPZZRFP/I/Yk35ihbM+boNI5P7i80PuSu6GnkgzqkDQSMzHcWFl26YaAA+4y9UBrs0lxw9c
 HF2bsuBbnZYTWPa28WwtsdyArOhK5sNJNpGblAqdFDi+OxYdX5Me48yqNQYdjY0nhH74FPlXXQT
 2kMWQOkqa6OEkihCXT2HAF/3A1gQGGityimEk1c41lIaD6YP6l9OkB7PJYcROwNKlPihE+1oD1O
 G67zo09ZxjX7wVcZ9n997hGKJQ6jkphkQc8+Tq4CFZNBNVeaONlghw17K15Zq+4jroLmYBE/DDP
 Hye37f9t2a3cS/fqGgjOUED0HQy+LURTJUSeJEsGW1ZWbxzLQLZRj976JXOQokjOWlucC+ZrcON
 iPd54EXLBg4ZwZG9bZw==
X-Proofpoint-GUID: IUzZ9Rp9qzz7dm76YD7Jz7ozK-OcNVXk
X-Proofpoint-ORIG-GUID: IUzZ9Rp9qzz7dm76YD7Jz7ozK-OcNVXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060019

From: Paulson Raja L <lraja@qti.qualcomm.com>

IEEE 802.11be (EHT) extends the maximum BA buffer size from 256 MPDUs
(HE) to 1024 MPDUs. EHT-capable links are currently limited to the
HE maximum of 256.

Add WMI_BA_MODE_BUFFER_SIZE_1024 and select the buffer size based on
the negotiated mode: 1024 for EHT-capable links, 256 for HE-only.
Also include the return code when reporting BA mode configuration
failure to aid debugging.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Paulson Raja L <lraja@qti.qualcomm.com>
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 711acb32a6ca..0ad019fd4918 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4889,14 +4889,18 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 		ath12k_control_beaconing(arvif, info);
 
 		if (arvif->is_up && info->he_support) {
-			/* TODO: Extend to support 1024 BA Bitmap size */
+			param_id = WMI_VDEV_PARAM_BA_MODE;
+			param_value = info->eht_support ?
+				      WMI_BA_MODE_BUFFER_SIZE_1024 :
+				      WMI_BA_MODE_BUFFER_SIZE_256;
+
 			ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-							    WMI_VDEV_PARAM_BA_MODE,
-							    WMI_BA_MODE_BUFFER_SIZE_256);
+							    param_id, param_value);
 			if (ret)
 				ath12k_warn(ar->ab,
-					    "failed to set BA BUFFER SIZE 256 for vdev: %d\n",
-					    arvif->vdev_id);
+					    "failed to set BA BUFFER SIZE %u for vdev %d: %d\n",
+					    info->eht_support ? 1024 : 256,
+					    arvif->vdev_id, ret);
 
 			if (info->he_oper.params) {
 				param_id = WMI_VDEV_PARAM_HEOPS_0_31;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5d0afbf0bd0c..78f1ceaaf5ff 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -171,6 +171,7 @@ struct wmi_tlv {
 #define WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG 1
 
 #define WMI_BA_MODE_BUFFER_SIZE_256  3
+#define WMI_BA_MODE_BUFFER_SIZE_1024 6
 
 /* HW mode config type replicated from FW header
  * @WMI_HOST_HW_MODE_SINGLE: Only one PHY is active.

-- 
2.34.1

