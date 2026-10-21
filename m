Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583111;
	b=qJWqf8I8dNorqnhLs6LNXGIT6Cbhf/Gmn7N8aM3RzLYPSFlKYoWungQTO4Emeab/upPH
	 k+450ww2GaHO+Kh0Sr8WSf9TFgTolYvUzkoOkvO5tddbHEfJX2eeCYWujouvQlpxHDq7n
	 nOON3XMdRR5FIAi4km4hVOzHwIiOPfETqQMJ6LLFaD7B0S1wRUMWrLupczienl6Vvpxdm
	 OOZb3uo6MccCMgXyZ55Ejhm77Apexjf320RfNqWFDCHrFHTmiue5SwMLi0EgVaDrC2Th0
	 PhoR/i3eChKn28YIKoy5tReDesE0atJp3IJRcwcGUbToIQd58RmTwstQUsx5dXKsAnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
	b=sJbweu2MoiTJifl7bL+Eem71nvfxlHOB7VgLfX7mogFGgoRKcW5UynbHIF9RNVFIKOBu
	 u1+NvrQJS+piMK0zpgw7dzggjymSI4MHw3Z9mMdnRnvjpisbwf9sPzCqgcR49A3L4dpDW
	 lr6xHGXfr3FIiph78gu0ZMMm1o8phtslz9Q9LZ3JXESr7v+uc678DxxzenTZDqupxPqxL
	 IqW+YDFG8alkGbm2LFaQVJE+kif1zRmopdC/65q9dY+Xi0V6CcUylrgOCGvoBhMJu2OS/
	 8o3xHjEdLywhjOeRJdkP1bLvRYeov4UBSmvd7nLPaFo5vi0t7BLKJevPJTDiHGUThaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mf5/vKjC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjjBOknv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A3A606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A3A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mf5/vKjC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjjBOknv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg7Un3830241
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uw8HOn1p1eSQSwTBq8Y1Cu
	ifynw+A2KsCcsyQI9cCJM=; b=mf5/vKjCMM27Gsa9nkwo7PjQ3a1dhpNx7+mLDz
	avt+TSZTRK4Db1vKZuhKdFAuby9a2cRtehLLh7+lhIe2WcEU+aH0VneTLnbXAFO6
	xXiB81MnnhEodvjaBD/jyJvUrukgOHZgJM8bOgOCTl1Le29LsHXNvP7yPQ01ClBm
	KTJZwozqG+32htp9tAT9OOo3gUjRcfNavoJ1oK4oxRdZWbHwVf5h/IQXPXwtltUk
	1xkIlf8qhQcse+K5mY+gMuTRH1gsHwwrQAvH07MmH7Ga/ZRosemfcZextZixAfv3
	o1OlqKncKOs4brOuuDrArNbXtv4TeZjQw2Um4/nbqaEEzsPw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd44hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:45:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1199228eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583109; x=1793187909; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
        b=IjjBOknv9H1QX4NkUvOdKa45JcUBCI0CUBD4ThU49mkjZik7T/hWpuNhtgLe+oqwLK
         c63zBHaFOl/4IhcFJb1yZPROHC0BnzMjGuWsSRo7frTZsVBbALfu7USyeZU16cQv+e/i
         TaddiJej6sxgA53QNOlap+CPlhJc8G5LnJFqEPXCZZKBJ8ar+joEnr2dDetEgE6FRS1M
         EeoIjVeb1OUyNim+NE/qyuVWLbL1UoJ4ZPQYGs2rBzp9l3vo5pCfgRwwtw26bWiBS5/x
         x4h2VXpyjPTUl9tTb+v+7gtqWYTZFG/GNEG2Bbd7fFhyaDM0rREvXrt5m8oF3BlDfYm0
         usrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583109; x=1793187909;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uw8HOn1p1eSQSwTBq8Y1Cuifynw+A2KsCcsyQI9cCJM=;
        b=bas2k4XI+LkK8Zh6XM8W2BBOuDOwyg6IGJBfzUyS4DgvA1oRmuImjYHOnLGu49bcaB
         8Fdiwh6ileAI6oYDDiFoo/ON/G0Pc6mCOHZPv44EyY7gnX0QfdsJALVhP+mtxCgPHZOO
         CCSLXhzuDPo8dztgW7KszgutE7scc4xVaolDhZ4cWrXPknZx3lIUYarBs648tQx7U0ih
         oUTo9ZRAIEr+L9szw459IkDnEbrbZdQXsJkQSG/tQ82Fjqcd+0G1xR3ykC/vYsHe6CYd
         FMDaAp1oCNdnrEDsdxOynEABywjvyOvDerir7zds+5LAdx3uNAlW7wGm47lcIzeM64QZ
         nqzw==
X-Forwarded-Encrypted: i=1; AKwUvBznUOLgZdDkrIc2QOA3cyivzwExtIqLq5bXU24drSSQ840611g4j6+9HRzEI5Iqi1SCuAY06xFGNm9mJjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQVjKWiBW1+gkOIra2biOB93yNWYxJa8Jg0sI1E4Hs4Cpeftka
	4qsBAtKuiymKlFBAiI/R7olIR7RDEB2pwCTy6Nia7GEJq6lwkMjfn11cIfLPyfTqiOLXECq7PU6
	C39Lb8koKjyckXo+qeKp5MC5CSq0wssWErZ45Li4FH4+vf6/swahvy51egUIT2eZdFuI=
X-Gm-Gg: AYBFou2yGWARxCd+xUCCHDhvsfXaQs3GdOxdkoPJ79FEQvkq5hYKo1ObDgivONpyctR
	oM3MSfG5uHQ62nN5Pt6oIyfVMHFfS520d/hGbc2JMi6U3XxCdWn5GDCOZfPuzl3/WnzvkQRKO+0
	Fe9F6o5jN6NHOJGeL+S9paw8kWeVlZMLAHbjD9MfdorqzP3GvPPKe439imGz73gHKRG1tzqTNSx
	MPiqC6d4MIDy2UYxnCszKVo6s67q0DpxfrqSb0rYOax4PS5yn/qTBzy1xCla3RO/yMCZ/oEqxxw
	zI3V3BV71fgyXqGC/+o6RQvL7PJG9AbwcBoOxshrV+UrbMAkBiLfCNSJiLSSZ2uWCf1y8GoGwnA
	XDrM2mjSD0e8hh1d6UMFcjKkimaPGdnA=
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-3674f2250dbmr2595164eec.40.1792583108888;
        Wed, 21 Oct 2026 04:45:08 -0700 (PDT)
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-3674f2250dbmr2595123eec.40.1792583108246;
        Wed, 21 Oct 2026 04:45:08 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed295sm7556732eec.9.2026.10.21.04.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:45:07 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:15:02 +0530
Subject: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
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
Message-Id: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL2l2GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyND3YzE8kzdogxdEwOLJCPL1KQkU1NTJaDqgqLUtMwKsEnRsbW1AP4
 M1K1ZAAAA
X-Change-ID: 20261021-hawi-rh-408b29ebb555
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792583103; l=1802;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=TzY/8yLb7ebLKUf0lf6FxtuE/z9EmJHPGEB+lGCDCOY=;
 b=dKfV/PdNOkQZRAlrWVQ3ZwiknN/YmycciTttmCFN3Apbes+kb3h4kBbBZ7+hzkEym6bVUmcjc
 GDR5dAcnfWVD0H6wOeDkgudDK7gA2M8JE5J3Mf7UcChfUVsqupX0etw
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX9CDCCMGcs0oz
 QS+Ft2yphgRmNw1BtPeooU4iXQ/2wS9tsew5lGA7ZapCGn461dKScBNbQNPSkiKbj6eUnviv6j5
 hmz931CRUAtPvhHoq9LFV96ZZsJYoIKWrPgMXCUzS0GVgzojQdfmj9Y+xkUIxbA8hrYGRDSOHxK
 fn4XQ2atNC0+51Y9dA4QZD+WLsKdLYiGXmk075v5/yXRhE+7N31BL/00YlcTxnvEAX3s5SYgTqr
 RqNEy+LZ/ra2YTEwFEsZ6C4iDYWWxEJmk4/PgtLOXmUKC2l/fDnW/AT6mx0PtNby4eRRtzZIyk8
 tacDuJ8zQO23OFRroJmtZh7Ym+DBh48pob/BL75luMHQAD4aW+joX6lgCtq1F4V17PIsoEXI99o
 vC3PQE63yAc9U9wkn78JrtGyU3rBDfu3F2+fHIjfp8lxNMI8drAWw6yX41ZouzZwbIDPlEaRVbW
 tPVzJLWblz29TCyNEVg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad8a5c5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ecT6ZAH8srv0KshgsUoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: MNWLsew_GQIWNFSXS_-Sm5bq8hl7DlA4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX8BRXp0kuVw15
 Y2qSgohIm9eSZp4rQ/JonZRWQMHwk4LeuTxkMjjiOoEiFgY5aOLWRgXwY6jWpdWCPxbQACc6zAe
 ieBFTH3q6vg+H64XMg3WgXYYWPq3lH4=
X-Proofpoint-GUID: MNWLsew_GQIWNFSXS_-Sm5bq8hl7DlA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210046

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..80cb00eccdf1 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -441,6 +442,14 @@ mpss_crashdump_overlay_mem: mpss-crashdump-overlay@bd500000 {
 			reg = <0x0 0xbd500000 0x0 0xf00000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3781,6 +3790,9 @@ fastrpc {
 					compatible = "qcom,hawi-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-hawi-rh-408b29ebb555

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

