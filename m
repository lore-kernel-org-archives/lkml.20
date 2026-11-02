Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631695;
	b=L9pJXL/zvW1znMcn4dK2YZbBnPE6WaX1LL+x5mb2+Iywz6w/ri/cQOTZEAKlvvRgbOX2
	 hSoQMBq/V9GegOimUm9jrwNp2N1WXQpp24q0RluqV2OQdpHYznFiX6anuA4tdDgrkkj19
	 J5pk3t4jw9ym81kCAddnlZKX+w4sUEZP3yBhWiT37nZCIf6okPZ4y4KP3gikorYlH+yC9
	 R5tpBs2SfQhYnVUoLu+PMIoL9GdpjVuZlqecB31F1Loisr3lxJn43avfv4cvXMKPMMXOL
	 I1ProofQjCZ/U7T+4mpl5VkUChk4asRs1gtkjiOwYTL1Wpw96xWbnOZSXBmj9LcBEhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z0A8W9k5M2rC0HGmQPRaXBbm9a8tKFZcCFhC2q3wOtQ=;
	b=ZeRHENpGDsm+fHCh/4HCeECC7Ps7e5Fmf5vb9ER0z3eksKdFtc09WSyShVVfNjEx9/Sb
	 dtQ1bzkkDGH4B2o8shyV/VxP6ZKe/aouNxee0fRRuvzs0Og6w/AP4TPjV0bfvuzh+T3Ay
	 nYCCTRVcniNgtsVeMEoVRU3kD3EhKowBGPsNEKdBge1tKZZLmEEpGs4KMIVE8mUQatsfr
	 /MNiXyta/0Oe+SbSiDm2fw5JQx/G3qyAvpZMIdNYS3O+39OQE81L4wdnSvYPBEw/MznK9
	 mkCPQHIXM14u4pwj3v2cj0wxHTC+LRDOlTKL2ky0avCY+djAS628lCfILI0dYHzhMhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ILDthXLY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cjrzFAv6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C06070D8E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865C06070D8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ILDthXLY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cjrzFAv6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpS3s846155
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0A8W9k5M2r
	C0HGmQPRaXBbm9a8tKFZcCFhC2q3wOtQ=; b=ILDthXLYJ1LhmQFFWuryO+lbwwW
	kXAyEALMj/DhLWPiIconrjnpzwGt75OOn6IkOIL/mv5X5jRhm31lY7LZxeY4OrcI
	MwHSb2JYjvRDZYbdtopBaqokYNVs3syQYwLuqZeJ3A6a7jFwSLaZCZPtdOIcKZOK
	+P9/0b31mDvjE/CBmybvXP2j/nbQOAd7CzwcP4fn325dKXNsqOTupFlSllo1j16p
	8pU3rB3tmb09GnHfEdwsKgCCJVqk0RIZ4mxmRlXAz9BMY9zeoaQSZgByTO+HV9wu
	IJUqExdyn5rcw7c48/d2+UbnP2uKB+UmPubvulM2DlAVCbRL7hhPBL7L4tA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1t65r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:01:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99089f9591aso549720241.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631691; x=1794236491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0A8W9k5M2rC0HGmQPRaXBbm9a8tKFZcCFhC2q3wOtQ=;
        b=cjrzFAv66KR8GXACLZUm+iqr0/cWFFWBhIkof1P/hdVxvh9JRabUM/Pg/f+fvsoZlo
         ysTDXMgfK9yFa2XDhKtiRArJV5HPWVBg3Glh+nG+zyi/T7dSfVNZ0Y4EvQNkGplrlAcN
         PEUj+7+vc8blmOQgZs7reUn6fZYf9j1PiMinMikG2Td436oN/A1MFYW3b/7r5TLSqp2v
         rnD8zgTyELzLRmiRK2arU48HhGW7AWyH5/EeF3SOnR7joVghv4O24eN5bMOvsl5eoJLQ
         FRQpF5DFpcU02NEZCF63koVXDhdFR5gA3s3zIRsMXh0Yl2/dMuQasdnEK1GXJl2+2zLw
         aPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631692; x=1794236492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0A8W9k5M2rC0HGmQPRaXBbm9a8tKFZcCFhC2q3wOtQ=;
        b=sRO26e1PDCE+fG2ASDa52Sv0Vs8AuJ/nVWkfBHjbN9hozPcjvWkI0OuOfZz92DYZ3U
         7JsXrPa5VJAxDpAAr2fUw6yGsLT9j9ExBlJT9HgqpSvx3tNBVtsixhX5WUmmg9mPAmLK
         tKJoZR6HIYFoJmYArtMFREIAjkoEhTLR1WXigOS1AN4tPW5RMY34d1uk8oirZGXxuMEO
         vS7QXfguieqceIPgWn+4vI9PTQdpLV/rsyxCAG2hbh1FumQ16D7AOgQLpp4JvCeWinaZ
         J14xq3RVIzDJ9D5m+rhIjlxv5P93JVZ6/IJADjpDtAVmIS+oDCX+Xs7s9qiPsIux/xC6
         nv+A==
X-Forwarded-Encrypted: i=1; AKwUvBweHEMEodx9TfMSszRH+XlkCVcY5PqRwwpFZNgsx9+I7xynPakFW6IN9ZU2b5ON7qfLhV/eZbg9X7yDKVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+xx3FFVPaqXGtbDlofYOMKv2Aq939N3B2Re7yWAa6Llr1Vxtg
	UBktUZ90JlGhyDhtIe8CcAjUJmdaZaOUhjApAaFvwm4ZWZrtMg9l/XhbJjWCKVLw3KQ6tLpJQeI
	rhKHeTjBtXJ62PP4PNpffr/IPMLJy38hm7ID2vqFCHtSTrIbG1jlarlWVrs2A3mBMCTg=
X-Gm-Gg: AYBFou17gB4l2DmfNxVhYNcIkISHaNFEoSbh8PXZp9vXfXkvSA7pZf89xSCLSP71q5D
	hnbv08dAAv/3bXtxgtY/U0OqL0w07JBz4c5WWCWpfAKtz4Z4ZePGi3lqzbd3n401CSI3giKBWLn
	UkpiwzF6Oe8EVFsXt3QbkBGuFmlXumVS3a0VtaQ/2ghEvDNaWiGvKlwake09Ll+rTfbN+twD5Ji
	yHf/PI7XO9ykhG8iG/jxRT+d80L2LzROg5Jwbzd3aerPVXJDoML3C+s2QwMkeeRFh3GKLG1DGv2
	wBepnIWgCECmY+kzCigU2N99iQmKUnqr0IpQWbY9NRk+3dyFJHiEN1pIGxD1vVc0ajlswyqQawA
	aBIApu3ZBS7HAcyM/W3aSPZwWA/8TlbWWUwG0i825Xgfk3ECoq57vZIGXSrKm5g==
X-Received: by 2002:a05:6122:2087:b0:5ea:c77f:2f22 with SMTP id 71dfb90a1353d-5ec6897bc06mr4078614e0c.22.1793631685824;
        Mon, 02 Nov 2026 07:01:25 -0800 (PST)
X-Received: by 2002:a05:6122:2087:b0:5ea:c77f:2f22 with SMTP id 71dfb90a1353d-5ec6897bc06mr4078176e0c.22.1793631679691;
        Mon, 02 Nov 2026 07:01:19 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm279827185e9.2.2026.11.02.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:01:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 2/2] firmware: qcom: pas-tee: Fix purely theoretical out-of-bounds read of resource table
Date: Mon,  2 Nov 2026 16:01:12 +0100
Message-ID: <20261102150110.227479-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=qLzdq/l3FCpuzwGztqy7qqwNOzx6wUZeD13FV3iP8dU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6KW3ng+OmAg9FvAlryl47/287Hy3gmJ0Hvo8s
 CJF9xNx43qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiltwAKCRDBN2bmhouD
 18dgD/4oL0GeGT9G4GLwasi9cAQOMH5w/KawkU0/+6UHTWdId6zyvcDzXvwzb6SFYotztZUjWRA
 VyX2Kf5lZZXkFhLUmNrPnDm+1bEEV6L0s5PPfRn2LT0nmHRxCIq//IGn9T8Rd118AU3TYO5af+7
 gWK26gS9Q8bWHJLikmFUightnMsdMZ3m3utioJHefczKNXH7UJogYX0OH6j1YVXdppnGiXa9S1H
 V1zwCHyIg/FtYeTvn9NU0ROt1p577UuTF+AqSgDiCUbhmFuDMpcBeVTpG4myyq5TNnROE57d18X
 j80kE6C3sy/VSiEjVHkiT8ut4BlR1vh0JkzNtneYZTyfzLbz/jLteIq7qKeseC290AuTRA5CHfi
 C7B/riV+lPxVo/GyHuBKgb11o9mkw6O2XRJrH4wKyWiC3+VH+DAlflHYohvSwJYTWKSqayNff/0
 pKVetZiITDbI6CLomA7l2qId48CJRR+OwVB7Z40HDtF2vT3e5A+7OGczXxiwOcoxiheXW1YcO9y
 uj952h092gZf3/ZgRGz8jPUipVjKTVWWiyzIwOjyPNoKmHi8aC6FzUR/KexyQwzjjDwwgeSV+5f
 +ogQc5qfD343Ibl+qaCRJSlXwTvvkOaVfw6DTI8gzXXinU60duivGPUgeFjelQ+9hqSDGcFyaWZ 1CXanN13vRoAevQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX6hxF+8X0v0jC
 5DysH6wNBN7Sxw8R8SPEwsJ4DDI/XwcQ8dtIY2ismgd2q2DJ6rFhb28ThYr6LxDmC3RA3PKF7nV
 JWL46+JLFlFmDYH8N6NSh3YuPhyZjTh7QI7k+O8g26a3yU5rRAHrGiUvV6ECOjkg/ON5DLK2Lfk
 txIre8MY4m93AgHIoCqaVgEGBdaKPcWxSFvrLF5vZH+X6Dpje8nmhQ/aVnZfATBzVC/Np3ObqsR
 6X7mO+oVJgtqmd3Yck2OMnoEsNHEGynI2bexMR3op3MXSouDujme4M/mdUb8mX8SOh0EchieH3K
 3pUzqP/zkkk2QsodwbggoPLi45JbXCRcNSJTIHR830G7Q5ZYM7QDoVk341j2dNFNWKqx+sAG+Z5
 1FYd8PRjUE9W3E1OqfAPF7QmCD2KcQ==
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8a5cc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L1n7qZ-GtGzK_Ty1_EsA:9
 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: WnF_Kw_QcM98_UVjfa0fvqahwyBUWVXM
X-Proofpoint-GUID: WnF_Kw_QcM98_UVjfa0fvqahwyBUWVXM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX1HDUD2ktfrV+
 pFMmTQiShxav8TMr+qnoru+kDO9dhe+n7Ts3X3DsjVXg5E74CI8tokV+Cv8uftghB5yktiReWkK
 4fYSLlEt9Ksjx6tUy+6GodvgHjzHuTw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611020059

qcom_pas_tee_get_rsc_table() first queries the TEE for the size of the
resource table, allocates a shared memory buffer of that size and then
invokes the TEE again to fill the buffer.  TEE can update the returned
size, but the driver does not check that the size returned by the second
call fits in the allocated buffer.

Theoretically and unlikely, some erroneous or compromised TEE returning
a bigger size leads to kmemdup() reading past the end of the shared
memory buffer and leaking adjacent kernel memory.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-dc984fcd-4884-4518-a98d-9490de9ffce5
Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas_tee.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ba9957023ec8..cd84befa34d7 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -244,9 +244,9 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
 	}
 
 	if (param[1].u.memref.size >= input_rt_size) {
+		size_t rt_shm_size = param[1].u.memref.size;
 		struct tee_shm *rt_shm __free(shm_free) =
-			tee_shm_alloc_kernel_buf(data->ctx,
-						 param[1].u.memref.size);
+			tee_shm_alloc_kernel_buf(data->ctx, rt_shm_size);
 		void *rt_shm_va;
 
 		if (IS_ERR_OR_NULL(rt_shm)) {
@@ -270,6 +270,12 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
 			return ret ? ERR_PTR(ret) : ERR_PTR(-EINVAL);
 		}
 
+		if (param[1].u.memref.size > rt_shm_size) {
+			dev_err(dev, "PAS get RT returned too big size: %zu > %zu\n",
+				param[1].u.memref.size, rt_shm_size);
+			return ERR_PTR(-EINVAL);
+		}
+
 		if (param[1].u.memref.size) {
 			*output_rt_size = param[1].u.memref.size;
 			rt_buf = kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);
-- 
2.53.0

