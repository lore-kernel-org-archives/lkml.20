Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B93B840B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135993; cv=none; b=NpEqSPqoN7rS+IQ/r24LjnMNzC7mMWIlMq6k/Wk/wia2ijzGPFC5FbobaFADFUlGcXrSALEg1+bTmbTV/lan954bFnJD7Te9MjxhYs2ih1RNtuLkdVlJadLzF8W3y6INXeDI/wh/GAQUNiyDGvl+F3oQYPAkcW40aTqxKUXat4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135993; c=relaxed/simple;
	bh=xH4hRiOAl805CYlDfNg6I0TltyntRRPXeq1yeY1sqr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BOEyYAI76AgAgHVdH2pVLNKmIjreVN2Tk8okNI2FCwc27hQcuSIL1qQEMMYE6T0wobUah40r0sn0Zo29xbkGHSj2ZDyGezMz3sB+XWMS5D+NoyuuI6/VFDDKqnXEHyEdppxUGCaspYDHpn6eH8MNuOib4YHdDk8St9CU/Pp9l0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyCzLO3G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QG22Oqwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyCzLO3G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QG22Oqwl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iPFs783403
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kmIHfMDMkexbd15J3h4moF
	XMc3RAffHwQndAuDE7/q4=; b=WyCzLO3G02k3fUrSwuyu4JPmcNqGQfSIq06lw6
	SaIOy3aq+owGVKS4LA0pG4lmasms9ekUfYYb73FNf/w4pa8h+JcXYOJ9BXQLfgNQ
	HmPOvNMwPR6KJntBVPCigGEZMJKOOX7ScgKo24CnqsdqZZyx1fMoHCXzXaZXSiTE
	6CUctio1rBLPfRQnbAU9GSc7xNr3TEoTf2R8Tl3jNJanK815xx75jVBMdFD4Ea2v
	OEULuA9fbu1g9yYosfKfBbo4GoEgbcxCQKVgloF/C9+xXpJ++NN5cabyf/itlJ79
	/TBKoawaqE/pYt0w4oLp4Q+MDd7m6UiANheWs1J4nxwpt64g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1vg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:59:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-338c2e27430so281681eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790135987; x=1790740787; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kmIHfMDMkexbd15J3h4moFXMc3RAffHwQndAuDE7/q4=;
        b=QG22OqwlrwtNkoXYpTNRLBH+W0bSOYT9YB0uRDrExpXq03Hmm09z8M57NAlXGDEUd0
         2amhHHdq+e7v9Ai8KPZ5SS4mL0uwcSpcjiKhDe2dG4c8rqzEWpSR110lSewUuI5KcmST
         0UjnTro91YCgACSpyoGW9rArwIQM/w2QyF6D6izUBrtqUOAymeIlxOmSJ7ZhvORJ03+2
         fxuBQ+Mg0oqPFCafNOukbGHFXbXFxvYq2YnrRB8Vzw2lhumKTIpz9SS6XzOLr2WbXBPr
         i1aaPmxAw1Up38ny7zfGwN72PAvk2kqG7c2BPeWwfjCY75YmlHrGJLUUvMOBI/GuWqt1
         C4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135987; x=1790740787;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kmIHfMDMkexbd15J3h4moFXMc3RAffHwQndAuDE7/q4=;
        b=hG5zXLS4rxR49nwS54Q8eidafr939lke8KLADr5eoc++RUO1ctEuQO0LrrJpYSWBRD
         e24nJM3zb1NnmpgOPWY59TZEPqt8sK93Lv18S83968UeVThWIQ2wfyWTAOegZarPrOYO
         zsHgUJuq0yWWY6fMp9L/vIaN0BAriLD4cJsXVS7GBj9XxpuYW6NYWDv2hc6vc7k9cslu
         KD+j02bg2Xf5+1wP7lUzS20qR2vK6J+d6lOuDowBF6anHFRwH4svR7V7Nbb2yehmcJ54
         WaYerDBW1QQlFG0ZnGXA3aMm5+VjaCPEFavx7gBpErdNhu4HXHijnQtiQQtChgAPoI8/
         REpg==
X-Forwarded-Encrypted: i=1; AKwUvByMytGzMoalwhKGglQQlzJQmAhlN1ClouKsgaHqLcNN52WvUp3rcdL1+UbYuGdcAaF3zgXnM6iDWC5fLo8=@vger.kernel.org
X-Gm-Message-State: AFuF++mw0XVyhtlyLr25Q2sbSl8F90QW07iNH+GwW5hgJfYeSfiCXomg
	7WeHMRG9BppU9URKXe0ldCcYdzoeiX8qzVXS3wBbSLxrFqdIR4SD2qmV+Co2FB4/nWiaqThJgfk
	ZmCWCMwTWM3kTq00pV28sZxh3G9+ibbJ5DO6ANlFgYtJ1d9icR6GWPUYwm8pCfj5+WGQ=
X-Gm-Gg: AYBFou3pQsokR3fW+4rW/oxcf0uCgGYsyZ6rYQyTk7o0pO5Dt5oji2hLvxhVmlYwyDA
	T9KxyS3jLb7WFh+BjAWAPQHJZaFe5iHUioiRGxvPLWnGeBG+uoKvDDoZ2Q0mlxigz1eWIsCx+h9
	t9h42cblsPFoqTUrfzjCMhK7jCSkwc/jZcLVa8joIjdq2UHfMVPdQsbvO+QBlIqXytVduOIzgOB
	iAKNGdqJOc4w7kzo9Zp3MCFSWl8h6wmeYKQT2jgVkg0RhPKhW9MMZzxtbKL8pl6TmqrPg4s57+I
	wn9L/3dEynBBsDfu3SpmHkvzG1CvdUNLr4+81Wl8acEE8xlroQ7o9O/+u2DsliCsY6/TB7oRTZ9
	w6CZkDNr/nKxO0Y1rfHbMv1Y4hFfyiG3X
X-Received: by 2002:a05:693c:41c1:20b0:33b:f153:92c2 with SMTP id 5a478bee46e88-33e8d9c81bemr1416530eec.23.1790135986989;
        Tue, 22 Sep 2026 20:59:46 -0700 (PDT)
X-Received: by 2002:a05:693c:41c1:20b0:33b:f153:92c2 with SMTP id 5a478bee46e88-33e8d9c81bemr1416509eec.23.1790135986441;
        Tue, 22 Sep 2026 20:59:46 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e972395f9sm2381006eec.30.2026.09.22.20.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:59:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:29:39 +0530
Subject: [PATCH v2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKpOs2oC/3WMwQqDMBBEf0X23EjcasCe+h/FgzFbDahpsxoq4
 r93670MDLyBeTswRU8Mt2yHSMmzD7MAXjLohnbuSXknDKjR6BpR9eM2rVG55ek/ylyLskJjS6s
 R5PKKJPOpezTCg+clxO20p+K3/hGlQkmq2rXGaiJX3wNz/l7bsQvTlEtBcxzHF+e6sQKvAAAA
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790135980; l=2316;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=xH4hRiOAl805CYlDfNg6I0TltyntRRPXeq1yeY1sqr0=;
 b=+P5Jj9zJrp69rKYmbZcJb6VjZH5/NkTPs3NZJqekJwX5xcFMVFzNBDOyDO1f7FuQeJbMl/xSL
 c3ZIm3mlIEjD8xUz3K+89rQAgpiXGZbjfmDZLk4XmdcPETE9Hxmax5U
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: IlMT0QSU93JbwHU312Npdxr4TYz5PPip
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxNSBTYWx0ZWRfX31ckK/XNRFQG
 M6sQtZRD/KC6hslbwB2L+Dg12Avgww1j4yTBl48mqQhqOR3/1aBFlQn5x9kmG0RwoCIkrhimh19
 KHLOJbZ3zFzdkpPq2gnOhn7VYjOLYtw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxNSBTYWx0ZWRfX+9gNR83KhfMf
 JwpcvSRK0Kn/c89rgYni0xpOYnonIJWJ28WDa47mmFFpdix+hMBUAuFIwTRhQQXOKRHnVxkpRHu
 cTgNlVOMelAyrEn5Ob0M7KS+IneTtVzbxUGm2NOwJxCfsXAl0UdGhiSJLoUM+XCHIvEKKFl6KFP
 QTDgnpgsTr9KVFtN41jOr4B595RQ5tR//dV57TTIZwZMlp0eQLC8vyQFC8iyRkZWIPCTX2P5Zy4
 TezrGcp98UHTohjQoj8Tn461PttiZGGBaw3PGb2EOjOOksSrRx2i1iFCo7nNa582M9HtxJJSKks
 TGS4vQCxK/7syR1JuRdi2SdtKYWE3iB+eeFgvux5GFM4ztTIXMLxUJ/Du4iHancE0BUBgu6SCyc
 Ddsmc4SblMs/Yp1qDvxZ/XMyYvE4NI6irIErQizd0onuI4J2SHKjzGiUzzDOj1ncgcyQvPEOppk
 LfKrmuwTkJJLy97wmxQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab34eb7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RYp5giNeBl3isHo28N0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: IlMT0QSU93JbwHU312Npdxr4TYz5PPip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230015

The reg value of a compute-cb node must match the SID (the lower
nibble of its IOMMU stream ID) it is associated with. In the cdsp
fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
14, which don't match their SIDs and leads to SMMU translation errors.
Fix the reg values, and rename the nodes accordingly.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Change unit adress to hex.
- Link to v1: https://lore.kernel.org/r/20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..3219603372ce 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8471,9 +8471,9 @@ compute-cb@8 {
 
 					/* note: compute-cb@9 is secure */
 
-					compute-cb@10 {
+					compute-cb@c {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <12>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8481,9 +8481,9 @@ compute-cb@10 {
 						dma-coherent;
 					};
 
-					compute-cb@11 {
+					compute-cb@d {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <13>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8491,9 +8491,9 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					compute-cb@e {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <14>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

