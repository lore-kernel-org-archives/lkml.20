Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768193;
	b=SuQx5QEAb9+8tFO/eDZ/XtITnGBnLcCofiVZ5YKocbEPjYRAisTzqzHsjOEyEU8Al+YT
	 AofP6BhyNG4qosegbDCabdDHJ2axvTRAr6QzBl4QbPRL5FjujGPbgqd1ofStcNr1y4DhP
	 qb+nH6OpoUy5ZwZYOJcQtbpHkEcuuCG8uETDrR0nlqBui6HyvaobSVsCYqqg3afUlqLjs
	 34ZWqjPObJV6+5tthSKFC1bGmewTrniUeX+l4S4nmTMgaUV1V6RlP5+1U8rtqBmW5ivyl
	 YNwzip4F7/o+o68KeC6LXZfROeoZrnhBFr7Dstizc0lu8h5WjqWetsfi2P46dwjGVNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
	b=aCucMyqncOn0MY9bTMmsSy63VyV+gBAC1D5k8+x2vYTcHVlDXjSMSXn6+ey5lCUrcvS8
	 V2iZWCB5UU7QHKzae6XmjjMcfjxGSelaTV981m6/0yImC3/KGgXjEaHgghIZmYZDlJM/R
	 j2TpInCTzXsNVWowSy2k8wtSMccoKSzAlnxdVn9X1EL7E+Z50Ft2NjIqM1bWtfMwlTrvJ
	 Fh/SWrJZ6E7OzHKK/4pAUqaEZxrVoFkdqzjHzfVnzu17MiumMgeoedK4oE5mO3CS+AlRH
	 FDsVJcIUT5YFewVWZXdLDhIDYSz/3c2WKFr4WP5g+8Ee91Ah2kZYZKbFgOMLsLs3mWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py6aQLEB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OB/M08LA";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10032606C944
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10032606C944
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py6aQLEB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB/M08LA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6CdZ2462562
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=py6aQLEBrnTvjNjU
	gz7uI22+xwpuJzETVKih34DNDaXYpQiDG/Vw+7ck3gZZn+ACPRSForH3VG12l1uw
	NKH+7didgfxVfOjWgkyT22d3pZxBhS1XNci/Bp1OApEPg7bjlXoZ/GPpfBQ4aLes
	+Uger+I0Qly92vg9OJul2+Z5ROMBDZ0FZ1gNgWYWU27n5vNPxVAoEfNf4IIrp84O
	CPSSDOrO68aODZbvMp/pDIcVEpW8dXxSPf0FdxyyrtZUDOr8OWxQ80omy320pEfV
	1njcrBcJpUu8c9UIpPmcsOyI3EbAN1EZAdKNK3oQncT4+98Gs3HRaCjF7QMcjo8q
	u6m6AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtv9nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so179683385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768191; x=1793372991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=OB/M08LAGRpVrRAdzAXcFZVTLb4hx2ryKl5A5yvkq8eXC43R9QjuYq843DXi1QN2Ew
         PSq7yRGJEWBxc5vD7zClSLqf/mrr13dvFMIGrqF7pacnATxkJSJrRrBX1aTvj6XwhxPJ
         6HFDCfKzW6gNI/6+Cd4Mqz5U7vdGLoap+Qc6XHPJL5lpmVMq2KEhqqopeP7G7wSvf4Eo
         4rvZhyZ123ab1in2UAuUCUU0JKv8DMipi/dJkUT3Ie9rNamvZDWRbluvHKKk2TOddfQh
         Pank4SBpRiIOrISlbXho6+lCQMNp8R+fINWoMMZtgmMV0weWROw/afnXj+pL6CGHppF3
         5qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768191; x=1793372991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=xzbBgjg5d5NlMmdmh6ZDIx1xauk+a/jH7SkjmB6d6/XTOR+qPqlhxDyjEBJA3KhHgc
         e3/dUg7oSJZO9+sGvtrCl02rIeke4OIZ2nL1uuzCRK02bcSGhLfpDSVhzacj+oxkdHSZ
         VkLP2IPi02OsjIlmXvxG0yRpaLkxtN9+FG6VIlA1aPd1EJndIIByZ4I3bqO6T+m1CGh3
         EuvE8/K2UATBeVILOGOhiLnrdNwV1WO87WetR4FbaOdkMTEwTKNNWB+3mfFVBvp3idgY
         7mNdc24aafSQgCbaSICcUto7JLZ2t/9R5YZoCSoqB76DBD/cEtn3RbCXPsfsZXHPzi27
         6Upg==
X-Forwarded-Encrypted: i=1; AKwUvBwomHyFEgZwJSn4tkjxYeFmPGf7ARQ7hSDeNf9qwczirgFAk5ylrwhNyFZ45zsf4Y6gtXq4Q7p54lB1bCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+pyFlyvBSomUzjrny2xNkD61SPEIHijffmguS/YeW5cKPbOkI
	Mj3ON7F0gEGOhbtJQfL8X3Nh+fGPtJ16IBMeAqc2tSDgvhZYrRudsj1mKxq0PvvAzqwmmDjHjxS
	jnAi07+4W/uEBCg/ytq9Fbyi5OGk1VMtW3+TjAJoPmAW/sIAWMusO4a0Ebdovg9/MDvA=
X-Gm-Gg: AYBFou3qwjfpBJVdq1ySpD1NcD8/hGM0d0L8bNM8VRzUsSsI2fX3sfvH4eO30OREXE4
	kGdBrPrhk/kvtSvD4UeTnufXNiFvbzCY+raz1TqccO9cYt0+61aWBtyZ8mGnYH2iKJtHA6F9pYN
	ZCpXKsdCBQLAjO82EtYqAkXO5fDRyOFFZhitck0NM3tKbIehgfEZyEqk5+z0dHTZKkDQWLf7JxY
	MLneNNAfk9RXg5tS28k/OSYSdLI7s9fycZ0kmm+lq67bO1tyg1oDK2UgwlOUB/xfrBPs+i4EmAg
	zG+7gkXHFo+zKxcdOXJJgzXgTRm2J+Z02ec/vaiSGuBa0G9VqF2ExGnVgREY7DbXi8V0Iz9JQuF
	dmOTnzmasY+av4U7ePt+jRCbdns7plEc06z7Kr8P2My8e/PG8Skq6c16ExJXqT4xre8chNMHSFe
	9XTdxtUUlaAtCTlMhUjRAQbj9u/zebt3K1ZuEQiuQmOQZBdhu6sdQ=
X-Received: by 2002:a05:620a:4712:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f6f91c414mr483890985a.27.1792768191482;
        Fri, 23 Oct 2026 08:09:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f6f91c414mr483884385a.27.1792768190952;
        Fri, 23 Oct 2026 08:09:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:20 +0200
Subject: [PATCH v11 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261023-camss-isp-ope-v11-9-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb78c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: M6mWF-3Ope1rbfpL5kd2JH9-jpCSlb2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXzSyM0bfpL2WF
 mqKeG2R6wvf29yiU3gj8T/quIlmGDvV8TlqlQqsAiqqDH+e+R2Mg2aWMIiqVot4yGEsPBRIWGFU
 SZClefVBrerYZmyTQfHRscD2wQUjOTELuN723Un6m1eYqNleOZggBropaTUGSuntGkl3TFPlx24
 lvBUJYlcDq997eineyYSq+lX8gjAxNLjUpGteSMq86PsrzbGFHVoC0giXvd3k/Z6NcICIer5H4u
 gGbZfG7rN7tUUmuDDxYcxCdJ+1LCchRAjV3ZBX+DvUK5wzKgEnzkelN3oxLZknkR5Ow5spGrrje
 AsI3T3/FMnqBmvr8x/LsCZ8Jq5ImIRGPTgnKMAtTNY7eiTYWOq0rs2ZNaGNqiXUWukm7LmsJVsX
 nfX5HYBwQC/e/kHEJTPWFyZB/GlLB5VSnrzBKfmKTv59wKqk5SYAMDSSXgkKTQ2QQvlT49eLgFS
 TqWVCKkOF81k1mOpJNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX8124/c0JGCpc
 DtrijXKhW/wBwOmFuBdMKqAJEc+582OUUXqhwHeiwbRL387kZbLbPfx3Y184rawc0yetjYIq5ma
 ANoBl0onAyC00roiYUw7cGAPAlT1qbs=
X-Proofpoint-ORIG-GUID: M6mWF-3Ope1rbfpL5kd2JH9-jpCSlb2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

