Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340126;
	b=KNgElz2hsR1ZWFK7G3TaNNxz1vRtChkExhbLT0LHQ30x+g5b6/u93a8/UA3ISiY6Qc9N
	 RKkI8BjgOiWlTYCbNBLELK91IIE02Af0xqlnZiFZWqb4iPLBf0ebMCofPKyr+vbvu249V
	 9wamJ0z/vAWDfpOBZK3v9eJ9cXYTtstbuqSVZ94pFjZNsUocUrkShqtL0qJuE3DsuZX96
	 jgbdEjtq4FtUS4F/A5rzOyF1JyAwxPMbdECTmjyKEoHWAFx8HcKzfBJrm+ry9bafYIBy0
	 gJSdnYl1SyFBkTOxKtFJRXXSTs6dsKOUyuAHGRnRzejOr1OkfZqgIjhC2NfVMfViPMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=CmA1pNwi2TQe1eHbiJP7d42K2x+/yrr6U2KplA0KwnmT6w2J/8sdaeVSvuZ9nwOxp6g3
	 02s/o1qjtKI5693bK+t3iOaqQwIF+hsX7YwsmnYEppRIZ7YrBYg94ZUDcLEtGxErpu+0c
	 KTFDKgO+A4aZcsLB0xC5tvnohRsyQ12bpGo2bTUmMIVqak8yF2RaDd9Bv6BDHYd1Setyx
	 TBVrTwBxWMMTLoVjGtWOmKVKckzUsP6yO6iBEN83towfbxtRu3cWrk6j+Pimx6C8m7nBq
	 05IOQxbNisa3junn4WRByXjAvf72BFUiBleqg8xWeSlGKb3WSEDIhbD3VQs7r4NQSXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4oO5zfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcJ24Dpu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1E9606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1E9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4oO5zfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcJ24Dpu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F6vb725288
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=D4oO5zfB0ukpVjYw
	cTk8tCKl+AE3jcORtYJHG7tWO9ZGjdcduXPIbCVfA+fK4HR4hE0pqpFfVfAdKfGd
	NkI0N1tiqC8IapTi5YOGJcd9F8OJYLMWSdpg2uNY5fX52Jv4Tl7LRYV1jXJJP/a9
	OchfynMmeE3qJmKvCDiCHKxi4iQQY6iq5r4NQet6TJvaGm317DgJVUvOzdSo77J8
	JhKs7vP70ldaeOC5d370wQH7GdyJJAony4kk04FIW1oyHjsrgIeDGTKgOz3WZQiK
	W1VWuCIxKTkMTpaqyV0p+CAE1XmCMOeNJpnoW5/NRoHzdh1CgJwrpx3RdOftMIBx
	VwV4rA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phe3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:02:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso956296a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340125; x=1793944925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=bcJ24Dpu3VB3UBuyZC2Ff2rkcbhr+Uf1bAZtfXiHaEN+R4947K/4GZUNNzjRVlR0bF
         k5S7KaO0O7qQ5XuapExgzzlrCW5Rk5qvfsh64c1qGRvyolRs34bnlDq41mE5i9qVQZla
         fy3gCQestuJeTexIeXNErii47PxFx0wWLrTWvNgRBT3M/8r1H35gzZ3Xwljg1SIcq+Xk
         6O7jUvJ7FXbhSmmNnDmL5o3GMQQQWK+PDS10f8YqFYsT+IMzomfLJ7DmjJzUgulxqyl+
         t6G3km+fKL1T9pFnyf2m7LNtch3cU/HJVEmm03TNnfH3OrdnM79w1MVE+QMK5C6m3lgz
         olXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340125; x=1793944925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=Z0gFlx7QzYz8Q1SnVdKl7i7Y4AdMX9uC3UIsDtGbn5mfX9OO2g5a9Wd79dAhsynnj5
         srWglnjuZKehklbhhLzjxRJCuSmfXW3l5sk5pGY+cum9ImElkst6RArGUM14bmcPQYRS
         4IQBZdRWP4ZIyoGugXtuZMnV1mjr2A1NQwzssBcAm9rDeMRwrE7ppXsADb+dNNQPt+nl
         1M3Aa5XNOqbD6g/bJN/FDUcI+jjqBpRU9KfcRSFHjStuK+Nlv11U5tb5+UnePxwiBgLm
         RB9z96j5qxz4cafaNT8og47V5SRd/irKyra4otltDlaKSZsqY/K1svY043P/Mj1MpI9Y
         0toA==
X-Forwarded-Encrypted: i=1; AKwUvBzM7+Cqy60h+htr/Eea0lT78HaOdJaJQC2vIg/1CNpElThGDABxQ6siwGzFDS8h9owBXdRIqxP4LBfUepQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEcsuo3AgYs0aPL1YBLNiZFqyG+LWH/Z3K6d81/e07PllGWIo6
	ScUEdnfbZCS/FubZoNbp+Ahlr0XlaEwMVh44mN0hEpHnRE8NKESuA45WpaAtKiEb+2w4Gu3Pk8R
	5SuYQlNNWCAcUbh0Z4FbuabpSvivuexUqDj0pTvqgcyVNW8J0xI7iQvbXuHGiv/Tq1tM=
X-Gm-Gg: AYBFou3C2IgNTQyPuOgofpyq9cEqgOmmkVd8o1C8tCT5cxqpPb/ssKe1Os/HISMyOF1
	eaZzFcbKHtVZEY5+o8pFDz0L++U5ZkElADSYmCA68Ua80YSv9X8M9ANC93/RNyz43D39nZBKyii
	wx2RMHJtA/kE9RclHufSB+w/2Yl3Orj5/b0U33YP6tmjmUKrT5sQetyfTHXsziUDPRCFD0fOTr9
	XUDGUAcI1bwqNy4E7oSEY2JVPpQZ7z5mT0bsfTKHFvnfY6C7uP9mNDEvdHSSS4aOl9Zg2344MVC
	SFka92egq2CNfzz7/QDn23hLVTB/fCcF1IXaFbb5n1AlMtN7aEvuTm7Bbwl41VoL/34K9xtl1Np
	m+PWuG2od1mRGt59A96PgxgSiCMw4mytgiz1LOq8kg4C0LYwccmycfJK3CWvU+yyKtiexz273qi
	SlFPK01xdKs8y3/yWBqZPSn5xeZCvIR6E0QDbJ
X-Received: by 2002:a05:6a20:7d86:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e913d6c56dmr3755874637.46.1793340125036;
        Thu, 29 Oct 2026 23:02:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d86:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e913d6c56dmr3755846637.46.1793340124566;
        Thu, 29 Oct 2026 23:02:04 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:02:03 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:31 +0800
Subject: [PATCH v20 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-7-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340078; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=JfkIeEFLPGzKUpG0HRMgkqeOptx9ErA+QuK8jh3YSakUhmfAPmYeCF6CMtBo/QwluH/Eyd0+O
 jXmEfKT2S3qBgkxPuXok1OqX4eD8wBAkcfh1cGtpxBMvv3/454koBsT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXyk9O5wg9PhSy
 P+Q7IucCCCg6ubdGoOuAiInAa2NrCSj0ZWBBf5EWR/M+gBWBR+tpDPsq3uMX0ucMVzWGmDVV4iG
 6KZm4khDyyxcDTXrhnUv+3nis8ca3iM+hsakjzh4KmF//f+m5B4fooA1X8EHdDx+uY+4/O2jNvs
 EQ8nZ1m9d7yNXODd6IbzzRgDN8g5IcuDefywn6ssw89oy+WEILWhuCCj93XY8OmKp5GO7OVkqRU
 hNalgzZtweYBXRQQKEeDJaqjzZhWE02Gkyh2Kaz/gvF45XCXabaVbGEURew4u8tdwqAYhIWzLnY
 gXhU4+EkoHq2HM+DVM8YiQC6WRuD/GgyoEwz2a2+WSWBDagVLQCOY43tLQMKhBC1GkKd/AzoSb2
 jAtSoxhey/NP/eY3AaqNzhqM7QzvqZQcn6i+1TvUit+hVrhZ7SLQv2/lj/CthrgW40odRfHm2PW
 8uPCYT/XJJvKTyDYhKQ==
X-Proofpoint-ORIG-GUID: x0MFqIidbIJkLn4Ot4NCjhNlC1wLoTRA
X-Proofpoint-GUID: x0MFqIidbIJkLn4Ot4NCjhNlC1wLoTRA
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae432dd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX7DEyyZwAs5Or
 /Lq0KC+ui7XiRQlufgsQC+PY6y0K2xAg3YgYqQC+x81EFejvJiMbKowZPfcWNFZGuZOngLrs8oL
 OeeWgs5E0ihxvrDk/xGoNsc9HMfnPkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300023

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

