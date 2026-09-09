Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CC1440659
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938310; cv=none; b=Uf4QzHU5kxZFnWcexTy1G8XN4kEKb/6yjU6/P7IcsjTH0klXA8t3kRhbrFh25HfInpn0gx+YNowZncpTpGJpHNhZfmxBwuBHEHQ6t1t9RNcQZ2BD7GIbU3GfjSrJ8H9uRA98WRQvNLs2cS89TEa0rmVjWCpZCGPhkubbu4/Md8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938310; c=relaxed/simple;
	bh=yGpQHIlUGSLcMehqlSh+rkLZhK1DkUEjuhpBxSQMd/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZAFHBtqTy/gcycqaS5fxxvxd2gHHbWuCJq0DL7IJTbjeBU0t1R94J9wKVNKXSd2VvAofriaV7uT/Vyp8u8iO131m026XAgF75R2uvlAavqxVTahyu99Vi0qEG6I/CbYbPfpf9ULo58V0OXa3KE8/d2APfsYQtnDIkMOIT5raeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qc1t8k4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV7RK858; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qc1t8k4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV7RK858"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896FmKG045565
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 07:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipjpKoUaN2VNuCCh+tY6wwmbEor/xFlrcnQp2tSQKcw=; b=Qc1t8k4vjHMNcYHq
	rFbvk8kq06npBv0yyr5zkGJJ9ZB75IPhCtT8VILqxYa+J+WAumYgaSjiGCN8woMy
	Cyv/yEzOzM6gR8uXO/4QiUExWQnd4hsrEKFkGrLQOyjUy9FVPSnGfV88kPaKoapK
	mdZ8OXnsl8rP6hvfcOI+Q8kYmSTAKxQqN+7qh7ySJg0jHPARxiGn1S+ta/vYexA2
	y0MbYYGM6aJfZt1OKpYB7H+F/yEeioJBbI9XGxx/dCSOvLkt+8iM6N7lG+5PxWEe
	UgZIcC/2xk3VN3sRUFI+CPZNAFDoIMiRJ+MVpdG1pxCm6O70g6ID9476rvlRxn+X
	wlfQsg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewjq1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso3915963a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938305; x=1789543105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipjpKoUaN2VNuCCh+tY6wwmbEor/xFlrcnQp2tSQKcw=;
        b=AV7RK858gjGIURFKc9n/hWjjm47QUJNEgkGK0LX++yFXrdWukNZau5C6ZuwiK8EzCS
         SrUUeJz2jxEuekq/4ycDf7j547ZKIeVovzb8eiwZhX2QPc/K/wmmE30z0Wi3Lu4X0TKJ
         +VZ5CwoDjzltSR6ZpziQLb1haUGzPPI2mmA5Pyfn2WO1WERkzbZRA4cfkAbeJegyC38I
         ivPMCgntzgpePRe8+XF7K6Lsx6/TzP+zZheDyL4+setHRXL6yvzUGLDgJxYpSKB9pWex
         CAFmXhtjdHV5JobVPFWUd7nqTT/5ZwQzGSA2NeivlnYKImBUCjCc4TEeaoHwzt0kTfEH
         vg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938305; x=1789543105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipjpKoUaN2VNuCCh+tY6wwmbEor/xFlrcnQp2tSQKcw=;
        b=ZFm/PmzahW3FSjXnwziqUzvYmQlBS5E2cXWlb6rpvrxfHzBRiQh6YIYAIovxae92X1
         OYEPtbi8eH/Y55TM5JvLKZZap9ANo08qdRQNz72B52fbWCLj820NfpHd+iDbHWUEZDBg
         OoydvRuFfl7L2ToD3sxqjNOjlwHLnSLNa/JsFtDCgg4cgVHwbZR8khJm3Gu/pEMRP7nt
         sy7O2ifUSq3EbWMn0/1xWSy/dYC1GXIc3XmRKLpjw8G68qdn3TyA9CcjZjgR86FLgegg
         CyjVLHXlxTwYluIkSKzAqHkkKM23SMIEgBf+nPvGdE3Fc88DSD78YDVdIsNu/+T6DmEl
         LGbw==
X-Forwarded-Encrypted: i=1; AKwUvBwRt3/c1kN4ZyhoVjEpJNfWrD28W1okeRoBqbAd8TO2pK0wOYOdtjEZRj2HdUXZmDtA1zH4G8QMOqsJHho=@vger.kernel.org
X-Gm-Message-State: AFuF++n4cXKAK5lgzHmdHu8jbioB1H8megdK48BVTqdNyAGPLVBugW9q
	20eN1Sim4bS8c9PJ6dYwaVrXbbDXu2IOtc6+zojU6cKCJnfjRdFu/pS8c7mFkTZk5lcRENCPXRj
	JyxjMusvAEu+GLn63w+19DMEEWV4rEs7bmAkgXLzri2wxJKaViOte/4LPm4M9vO+T9qs=
X-Gm-Gg: AYBFou10DPR/gZrMbMEjH63LskK6XOm6NxALMtC6rqsFSD005oVs764IZlB1fo/e4e+
	fYsBaXGzgyoqa+xLHnIcdBFD5UFi0j2WMGSy/Hnt2zXVvN8SuuaotRVPi4I8LfpjwAk4OnV+yrO
	2eQdD01F+EulQUkM+Q6RJb6Fg4azq0vmyZNkDO3/MKh6X4yC7nlJCvpr7s+MnyYYWE/cAG/X8gF
	pq4psjF6/SHocPxG2zrmpy05OXnXH1haihWWjU/8XVRb393pygYl72ueUA7a5g5pzfu3gflmaee
	k0Pi/zFLfFKkuq1MlkUFfTsit1WkQCJzAcdVqPVC2cX8lOut0tIWRJed0i5swjGSBfUR/Zfo5v6
	joDua+UhiwogT8gtK9riSvc6gyzyFZwVUyyzdbjruNEdTlpAMZgHPA8woH9uvpYgE
X-Received: by 2002:a05:6a21:78b:b0:3da:bd6d:bef4 with SMTP id adf61e73a8af0-3dabd6dc136mr5155683637.13.1788938305444;
        Wed, 09 Sep 2026 00:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:78b:b0:3da:bd6d:bef4 with SMTP id adf61e73a8af0-3dabd6dc136mr5155610637.13.1788938304905;
        Wed, 09 Sep 2026 00:18:24 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:24 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:17 -0700
Subject: [PATCH v7 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-4-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=yGpQHIlUGSLcMehqlSh+rkLZhK1DkUEjuhpBxSQMd/8=;
 b=xucd5UNB8nwUt1Q7XFsh9HO+xqloZCrJ+Q7PIHX1iTnHfhmC+8polPnwLWvhxXXN2o5VItZSc
 kD8wCbuvqfNB+AIEzDN2qzlksaP/aeqwEGGnIEM2QfOFq/yzeO26/lu
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa10842 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: onb4TOaL7eoAZMHNPsXVa1RArUwqo5Yu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX9VtciSOEux1D
 EcNr6wMww9oAit68ZXoQ71JpWhPoDTn/diQzM05cEMvz1bzfc9y6+6LnGBd4G3VJ3sHWB6llJYa
 nlHCc3BO6qAoOpLecCAy5XhDQJjfUL2d8nB6OaSsyOJSsTQ1duPOepSBc9tqi3SwIsrPQGVJNwo
 geNprNyUBZNZXL4cK49Ha2XtXGQhixoUgpNYUuz3C0iOP88GeQMbJSO1Lt3dxEP0/RrDlPG9Je3
 LYBZ6Z4+eUuyPXBT8QITwoBF5IVJAsVW6fW5QYNtstSl4ogFKJ6K4TcWP6OJ5r3XuhLhYlKNa/O
 Ke7ZeEFHvktgmTiaAjdtEBmmhOI39sbgPqlrqNkQtHmzApIKCO2+4Xmr/GgbKgGjt/xQVUKCOZc
 2zTAlzi1G+R56F2yM2Qnx4Hv4o9it6XpAcbjPLFf2s2L0fR8dWRG8piUkuCGxrl4s263w4IC1/z
 nYBW9xXzOyf/KH2+asA==
X-Proofpoint-ORIG-GUID: onb4TOaL7eoAZMHNPsXVa1RArUwqo5Yu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfXzF8cA6LvY+zs
 rKchOZSlcwAQzdXS/FCfVR2gau5aBpD6CF/81tWcsGc+zWq5rXFOjE+7czSPSJpiLTxSRrRyDBB
 ldeiyzrckvsZedRmhBRqdq2aJgZuDLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090081

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 882d1865f3a4..98693295961b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2244,6 +2244,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

