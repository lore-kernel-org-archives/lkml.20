Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406760;
	b=1PJLFFltCclvdOo5+DhrIeBRSuvKQhb0m8m2oW7GT8FEsVBOEbhf/HW5lwFkqKjcsUy7
	 BmE1YfiTO3FaPR92oFEntNjSqOP+yXMRI0OlCTaeWCV1qarAKl7UUMaeRacg9qzAZ320X
	 ZYOB2Ak4Jy3t8PLmCpsL9q6MxHgHy9Wz46LKTVXj/LRNzIMu1488Ndtua6b+7zz3blPWH
	 PMS0es+Cjy4L0HK+RJmChOjcao+tSheaOsnA5GZC+CMmqM1rboH8JU5TP+U6WCw7ydf29
	 g4IXBukOYtDe2JwJ2YFEypLK7rKiLI1IDxV79N9Q+MpHW2kNp7fjjt9pUNzGz3JgC+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/YBRtnGmpBB9s0CPG0c3lmE8GGo5ap9/PpQQReA+vmw=;
	b=rdg0uCuJ2I/2gh8XMrXdiZiTnv3qJmQKrkM4MmipKHxj/Em2X3cP8PsnfdhfDwpdPo9P
	 ELatzYHEMIYhmd3mEUZvCjonq64Kvngq8zjHwzrw88pQ5AqP71qOqWixj+LxHoRrY2G1s
	 aWlNnMfRIgWKn4u4YhW7FXbvfiov7QSgIZ7Ai2fEJsJln0aKeycy2WtBFmMeyddtnj3IQ
	 b4hAfQwFa2YmbEaKbrfo9910DDMN5WaeRD/VQAkbgVgsl16OEehHsUNsxeqYP0lvdy1EO
	 7qeyH2KxLwWNnrwrx2lbloWEJ2bzehGr/uEsdlhz2TW+1dsFhNIbF8ZhAgWyfKnpKWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kscJ5hR6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5+pIDPH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC67606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC67606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kscJ5hR6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5+pIDPH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJIQK527720
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YBRtnGmpBB9s0CPG0c3lmE8GGo5ap9/PpQQReA+vmw=; b=kscJ5hR6kPSqu6er
	qiRfnhUyid+QAabDm+0Rw4sKvsSgSlXGvni4ItUI1Kb2/xhuik/GF5Yj32JbpQ0q
	XarSZX0kkxFAIyMyCgvBliphwozQO7v0Cdm7N0BVhHCpTnsCcOmvGcBJn4SYYsK7
	oNaSPSXysZ3LNoqa14dDBcMzHdg0alM5ltDcqBre7DPUfH3ehQTNBTTNWExDuPl4
	AVrIzp9kZdRHRxYDuZSQczt+qh74uXJjZ1V6vLqOW5FUBTqT4vst3IFSIquYe1bw
	JCrmq1FJbZpRK+f35o+EmNDOhRjPiNBix0r74a4rcLkCU0fXw3IQBgWtw751IpOy
	pfaYhQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjrw4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:19:18 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so6677317c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406670; x=1795011470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YBRtnGmpBB9s0CPG0c3lmE8GGo5ap9/PpQQReA+vmw=;
        b=b5+pIDPHwkEZraf7xRoaxwAAFj22si6808/UcmC7Lo27yCcDWTkmg62+8ooG55+80O
         JirQOCufzJcUUdQzGC8hb4VgaXGb0DxZGENmXkn/e4xvRy3YE4YwM55m1p5N6iQYQLXE
         VEzBQk5T5pyeW81v5aoguskZMtm9xVCsxpdo7gFowWsAzLG1Ck2BcY8Y6+xILqt2oK2g
         Nt7tcGwNfXSr6vTkFQ9td9M6a3E7OGavL7U9LLBCdvFX+IjMqWs4JZepsr+QEXP+FyaT
         DstpiUWG1YcO3pIddcwa+4Km6DYBH/osDxKHVz/6OvJiAIbZYTx7L3F3Ocbid0/zQNwn
         CJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406670; x=1795011470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YBRtnGmpBB9s0CPG0c3lmE8GGo5ap9/PpQQReA+vmw=;
        b=S40sPYiuZK13LtcE26UPmVAj2/SUCEhFzjgRYoSrDDTztIfMEyH2cYxwsqu83GTqDs
         ZHfJ6O0z/EFzwhVFF5hmFu4GUl7i27MCYx8IAR0pnxBWcX2S4/791Cw+YGh+n1c0bILl
         9/4c96J9qpwvmMvSIvOdy+Mn1y21coQnSFBtv/1CUkQomHjfN3kX2Lu85cyJbyQgoQNa
         LhBhUrY2+uIK9QVTots7lcHIKP/IWJGtD2y1UexANuehT4WylAGlacjioctywsc3Ar2G
         iI8M+JAU//DKjQrMuU2jfIxNPJuwHgDKv/eyPdcpluzSIeqdoJ1SG/3Smi5OOgxLjbx+
         8Atg==
X-Forwarded-Encrypted: i=1; AL+hErEdMprTSnViC7W9MzGJXBCyTVOgE7j6OecAQznl9GEmlnlTfIn5DkAkN8U6CwSCruAiHcAu64CF53on7M0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UtOX7RT3yFzLyDCsWCPMgkRNWpW1ZlYCj/kjDoVTmUgvbhj1T
	odUPbm0xCQFFzPqNuagELkUjjAGgvsTydTWRGmlXbHPdGDO16BZCH/VqJaiuWhKf1oF5qt00w3N
	gtocetTk0/48Cm0Kh967FgIyFUsxer3Xy9pvqxilox79gXzjGrOTdwJUSQfJkediUEjQ=
X-Gm-Gg: AYBFou2ciEd23wNJOgzivHIZndIg2NCXXfIXrppnoJq85fef/lHMQihCQD/H7BepBnu
	ILbaODv1vL/7t6FWRyjmysBZ6I8xtapm98yVwrM21j54EziMiNekcWylvy86UStMfVhw6M4Uh7Z
	iFDsYLYBdr/o72QYteiomFQfNAa7WjO6Wm2++784FF+xaLWNUjftvfCtG5YpiWqrIrEpEqSYY+P
	CHruiaveziYYHqpUeB6fwuy1OHcaR0ijB1Jc4p9/Kg4DZRxGHnIyjTQFVU/CewliNwaLOSMo+81
	7wJNs81izHz7Za5YRuoZV2gT+cKD+lkf9IRf2G+tMf6oVg93r/1O5MTDfeuWT9FINcqk4GJXm6s
	iB6OJ1n/hXe1glEz9uyvfzlGwKf2R3afKp+1OfUwqCKOeHyoIT+IWhwqjW/iVWYYZ5E6uEUfswg
	==
X-Received: by 2002:a05:701b:2603:b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1b3c030e887mr2858751c88.22.1794406670150;
        Wed, 11 Nov 2026 06:17:50 -0800 (PST)
X-Received: by 2002:a05:701b:2603:b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1b3c030e887mr2858715c88.22.1794406669493;
        Wed, 11 Nov 2026 06:17:49 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33747063c88.10.2026.11.11.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:17:49 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:47:06 +0530
Subject: [PATCH v2 6/6] firmware: qcom: scm: Drop exported ICE wrapper
 functions
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
Message-Id: <20261111-ice-migrate-tee-svc-v2-6-29d19f6c92ab@oss.qualcomm.com>
References: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
In-Reply-To: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794406634; l=10826;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=fCrgNo/wtyjSv5o4RCovHkPYaFuetOaaEpqw2NtaGHM=;
 b=YmnN0Lia89sQ0GHCXp5ViHe1pgl+mLExglxv5U7eXcxaMzf7JttD2h2UoI942LofFDHxsBhtU
 Ivg19f7mjdvAm22iGz5APGNHsmSNYp9QaAFtqONgcU+lXxp0xevY58r
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXyeE+g1C/DtKf
 itQphlTqfS17hd+i/QpMIqtGOwisZFZsYOuB6UMsUvi6J0QesK4m9ZWAR1nxr+hV92i/X4lxmDC
 WZFNy2TaKSHxw16kxP0+hwbtCW3+mPcjczACk2E7qNaoP5+K3VCevmjkjKm854mAY/GZgiUBoQg
 x2DnKM+XUU3eXKoBupZG/ABPmXcBwQ4SkdpSixiDjgUk3OPnUX+zpI7+DQvxEjjafh35oOJanRD
 qiPPoy24uWuSKokCGdd3pcI5RCKDWpyvkZwU/5I+J8pVSl8DtVSvSTXDQlIaYjAqmuurN0Jq4ba
 P7Da3LCYpYBI37tF+C7AHAsmFMchCx1HvcVCJjzY1FyTsIJOazR3n2+AnBGc/ArvzZRztQ5kXca
 clKr8iSUga1z6Vql//Se+9bV2uGfA0UopTkcTk8BnO7YsphM0Ud5hQ2V2DNhFoClI3+CrMvJ8VY
 zRE9Psc6cDHDFCeeiQA==
X-Proofpoint-ORIG-GUID: dMx1hGyumPbUb92PkOy-2LFn9pYdBUON
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af47966 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F3QbZBHQcOWnaqSeXxkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: dMx1hGyumPbUb92PkOy-2LFn9pYdBUON
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX/795D0Y957Zs
 3u68VxoUBfIWlElyT816oqD7/kvY0pt5VUp65ZGc2bE8cfg+80SXV8wLo1OATYtG5zXl2GjuLfm
 bUD7CdY4lMIhjDPJjC41mUqPrRxgF4Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

Drop the exported ICE wrapper functions from the SCM driver since the ICE
driver has now migrated to the TZ agnostic ICE APIs which allow runtime
routing of ICE secure calls to the appropriate TEE (QTEE or OPTEE).

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 117 +++++++++------------------------
 include/linux/firmware/qcom/qcom_scm.h |  20 ------
 2 files changed, 31 insertions(+), 106 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b66bcedc84f..277334f71178 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1399,25 +1399,20 @@ int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ocmem_unlock);
 
-bool __qcom_scm_ice_available(struct device *dev)
-{
-	return __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
-					    QCOM_SCM_ES_INVALIDATE_ICE_KEY) &&
-		__qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
-					     QCOM_SCM_ES_CONFIG_SET_ICE_KEY);
-}
-
 /**
  * qcom_scm_ice_available() - Is the ICE key programming interface available?
+ * @dev: The SCM device
  *
  * Return: true iff the SCM calls wrapped by qcom_scm_ice_invalidate_key() and
  *	   qcom_scm_ice_set_key() are available.
  */
-bool qcom_scm_ice_available(void)
+static bool qcom_scm_ice_available(struct device *dev)
 {
-	return __qcom_scm_ice_available(__scm->dev);
+	return __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
+					    QCOM_SCM_ES_INVALIDATE_ICE_KEY) &&
+		__qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
+					     QCOM_SCM_ES_CONFIG_SET_ICE_KEY);
 }
-EXPORT_SYMBOL_GPL(qcom_scm_ice_available);
 
 /**
  * qcom_scm_ice_invalidate_key() - Invalidate an inline encryption key
@@ -1431,7 +1426,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_ice_available);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_ice_invalidate_key(struct device *dev, u32 index)
+static int qcom_scm_ice_invalidate_key(struct device *dev, u32 index)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1444,12 +1439,6 @@ static int __qcom_scm_ice_invalidate_key(struct device *dev, u32 index)
 	return qcom_scm_call(dev, &desc, NULL);
 }
 
-int qcom_scm_ice_invalidate_key(u32 index)
-{
-	return __qcom_scm_ice_invalidate_key(__scm->dev, index);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_ice_invalidate_key);
-
 /**
  * qcom_scm_ice_set_key() - Set an inline encryption key
  * @index: the keyslot into which to set the key
@@ -1471,10 +1460,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_ice_invalidate_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_ice_set_key(struct device *dev, u32 index,
-				  const u8 *key, u32 key_size,
-				  enum qcom_ice_cipher cipher,
-				  u32 data_unit_size)
+static int qcom_scm_ice_set_key(struct device *dev, u32 index,
+				const u8 *key, u32 key_size,
+				enum qcom_ice_cipher cipher,
+				u32 data_unit_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1506,16 +1495,7 @@ static int __qcom_scm_ice_set_key(struct device *dev, u32 index,
 	return ret;
 }
 
-int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
-			 enum qcom_scm_ice_cipher cipher, u32 data_unit_size)
-{
-	return __qcom_scm_ice_set_key(__scm->dev, index, key, key_size,
-				      (enum qcom_ice_cipher)cipher,
-				      data_unit_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
-
-static bool __qcom_scm_has_wrapped_key_support(struct device *dev)
+static bool qcom_scm_has_wrapped_key_support(struct device *dev)
 {
 	return __qcom_scm_is_call_available(dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_DERIVE_SW_SECRET) &&
@@ -1527,12 +1507,6 @@ static bool __qcom_scm_has_wrapped_key_support(struct device *dev)
 					    QCOM_SCM_ES_IMPORT_ICE_KEY);
 }
 
-bool qcom_scm_has_wrapped_key_support(void)
-{
-	return __qcom_scm_has_wrapped_key_support(__scm->dev);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_has_wrapped_key_support);
-
 /**
  * qcom_scm_derive_sw_secret() - Derive software secret from wrapped key
  * @eph_key: an ephemerally-wrapped key
@@ -1549,9 +1523,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_has_wrapped_key_support);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_derive_sw_secret(struct device *dev,
-				       const u8 *eph_key, size_t eph_key_size,
-				       u8 *sw_secret, size_t sw_secret_size)
+static int qcom_scm_derive_sw_secret(struct device *dev,
+				     const u8 *eph_key, size_t eph_key_size,
+				     u8 *sw_secret, size_t sw_secret_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1589,13 +1563,6 @@ static int __qcom_scm_derive_sw_secret(struct device *dev,
 	return ret;
 }
 
-int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
-			      u8 *sw_secret, size_t sw_secret_size)
-{
-	return __qcom_scm_derive_sw_secret(__scm->dev, eph_key, eph_key_size,
-				   sw_secret, sw_secret_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_derive_sw_secret);
 
 /**
  * qcom_scm_generate_ice_key() - Generate a wrapped key for storage encryption
@@ -1608,8 +1575,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_derive_sw_secret);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_generate_ice_key(struct device *dev,
-				       u8 *lt_key, size_t lt_key_size)
+static int qcom_scm_generate_ice_key(struct device *dev,
+				     u8 *lt_key, size_t lt_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1636,12 +1603,6 @@ static int __qcom_scm_generate_ice_key(struct device *dev,
 	return ret;
 }
 
-int qcom_scm_generate_ice_key(u8 *lt_key, size_t lt_key_size)
-{
-	return __qcom_scm_generate_ice_key(__scm->dev, lt_key, lt_key_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_generate_ice_key);
-
 /**
  * qcom_scm_prepare_ice_key() - Re-wrap a key with the per-boot ephemeral key
  * @lt_key: a long-term wrapped key
@@ -1655,9 +1616,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_generate_ice_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_prepare_ice_key(struct device *dev,
-				      const u8 *lt_key, size_t lt_key_size,
-				      u8 *eph_key, size_t eph_key_size)
+static int qcom_scm_prepare_ice_key(struct device *dev,
+				    const u8 *lt_key, size_t lt_key_size,
+				    u8 *eph_key, size_t eph_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1695,14 +1656,6 @@ static int __qcom_scm_prepare_ice_key(struct device *dev,
 	return ret;
 }
 
-int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
-			     u8 *eph_key, size_t eph_key_size)
-{
-	return __qcom_scm_prepare_ice_key(__scm->dev, lt_key, lt_key_size,
-				  eph_key, eph_key_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_prepare_ice_key);
-
 /**
  * qcom_scm_import_ice_key() - Import key for storage encryption
  * @raw_key: the raw key to import
@@ -1716,9 +1669,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_prepare_ice_key);
  *
  * Return: 0 on success; -errno on failure.
  */
-static int __qcom_scm_import_ice_key(struct device *dev,
-				     const u8 *raw_key, size_t raw_key_size,
-				     u8 *lt_key, size_t lt_key_size)
+static int qcom_scm_import_ice_key(struct device *dev,
+				   const u8 *raw_key, size_t raw_key_size,
+				   u8 *lt_key, size_t lt_key_size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_ES,
@@ -1756,23 +1709,15 @@ static int __qcom_scm_import_ice_key(struct device *dev,
 	return ret;
 }
 
-int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
-			    u8 *lt_key, size_t lt_key_size)
-{
-	return __qcom_scm_import_ice_key(__scm->dev, raw_key, raw_key_size,
-				 lt_key, lt_key_size);
-}
-EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
-
 static struct qcom_ice_tz_ops qcom_ice_scm_ops = {
 	.drv_name = "qcom_scm",
-	.ice_invalidate_key = __qcom_scm_ice_invalidate_key,
-	.ice_set_key = __qcom_scm_ice_set_key,
-	.ice_has_wrapped_key_support = __qcom_scm_has_wrapped_key_support,
-	.ice_derive_sw_secret = __qcom_scm_derive_sw_secret,
-	.ice_generate_key = __qcom_scm_generate_ice_key,
-	.ice_prepare_key = __qcom_scm_prepare_ice_key,
-	.ice_import_key	= __qcom_scm_import_ice_key,
+	.ice_invalidate_key = qcom_scm_ice_invalidate_key,
+	.ice_set_key = qcom_scm_ice_set_key,
+	.ice_has_wrapped_key_support = qcom_scm_has_wrapped_key_support,
+	.ice_derive_sw_secret = qcom_scm_derive_sw_secret,
+	.ice_generate_key = qcom_scm_generate_ice_key,
+	.ice_prepare_key = qcom_scm_prepare_ice_key,
+	.ice_import_key = qcom_scm_import_ice_key,
 };
 
 /**
@@ -2894,7 +2839,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	 * ICE driver could attempt to call the ICE SCM pointers before
 	 * they are registered and assume that they aren't available.
 	 */
-	if (__qcom_scm_ice_available(scm->dev)) {
+	if (qcom_scm_ice_available(scm->dev)) {
 		qcom_ice_scm_ops.dev = scm->dev;
 		ret = qcom_ice_tz_ops_register(&qcom_ice_scm_ops);
 		WARN(ret < 0, "failed to register ice SCM ops: %d\n", ret);
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a0a6bc0229c4..36b87be82804 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -46,13 +46,6 @@ enum qcom_scm_sec_dev_id {
 	QCOM_SCM_ICE_DEV_ID     = 20,
 };
 
-enum qcom_scm_ice_cipher {
-	QCOM_SCM_ICE_CIPHER_AES_128_XTS = 0,
-	QCOM_SCM_ICE_CIPHER_AES_128_CBC = 1,
-	QCOM_SCM_ICE_CIPHER_AES_256_XTS = 3,
-	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
-};
-
 #define QCOM_SCM_PERM_READ       0x4
 #define QCOM_SCM_PERM_WRITE      0x2
 #define QCOM_SCM_PERM_EXEC       0x1
@@ -86,19 +79,6 @@ int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
 			u32 mode);
 int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size);
 
-bool qcom_scm_ice_available(void);
-int qcom_scm_ice_invalidate_key(u32 index);
-int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
-			 enum qcom_scm_ice_cipher cipher, u32 data_unit_size);
-bool qcom_scm_has_wrapped_key_support(void);
-int qcom_scm_derive_sw_secret(const u8 *eph_key, size_t eph_key_size,
-			      u8 *sw_secret, size_t sw_secret_size);
-int qcom_scm_generate_ice_key(u8 *lt_key, size_t lt_key_size);
-int qcom_scm_prepare_ice_key(const u8 *lt_key, size_t lt_key_size,
-			     u8 *eph_key, size_t eph_key_size);
-int qcom_scm_import_ice_key(const u8 *raw_key, size_t raw_key_size,
-			    u8 *lt_key, size_t lt_key_size);
-
 bool qcom_scm_hdcp_available(void);
 int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);
 

-- 
2.34.1

