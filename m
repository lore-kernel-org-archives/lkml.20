Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206103B637E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556719; cv=none; b=kdGUyzkOv4tyQkhzae9sMr0ULVoh2t+b+H6Xh2w7ZpwcPp4UE2XdmEqJbjdKP9SgSZyaRZYQVO0nb6h4i/0b1G/L8holaZdO5z5FlwFpBJgzk2HgHTMo8nPf0ae016NyColsby7RcMauAxFcbxEGEx2H2jXpt+IiqGQolCf8FVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556719; c=relaxed/simple;
	bh=itzmVFDKn8NTTOrGyTyAW+4CqGuA8ijGDX/I6QdcReI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s5oKUhJNdewsA08REBQaidc9tz2rAOytabv1hZkIbvcvJGN3Xl/K0OsQFmlnC5I01a88dQqfoHucKc63/uBy3+z3lgLj1B2KYiq1FuhfzwiaY7vBpqAN8KFvNc/nkapRJTQ41vMVvN8ZOY8ETADpD0rxRl+pGUcLWOhUNsrD7CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZZKytLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pzdw9M9q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZZKytLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pzdw9M9q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92p2k978298
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=56IGjlGPF3KLMkCxJGQ8bq
	STegBdBTvKkf6Q5DGZFS4=; b=EZZKytLw7p7w2j9kFoqTavCpNanC1/h7npJXM+
	jRb+cqUKydn1qdxDN/4tT+HnQyhT16gP9HEQFxMyrlrIYxIcrb/UJNnLqL4KDKWM
	3Y4qi9EexTs9Gx744R+B7L+gwVL2aN0pMF+5wTrvKhn7NSXzawS9T3Sr6rWQ8qEp
	clvwYqlDBmI6/08esEdPgXdBUc892NIWafcaIcyQvXE8V6eL2Va/QkAoEHeLKe1b
	cwdRs1ozqfSP/zIfmBlnKMwQp931AMi7oJ3nDi3h7XqK1KfZQ43USQu5809+Tm6s
	Q83QZgmlajj01H8qzXAQh6KHoss5YlcasAMONjeixiOdUnag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rkp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:04:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so370742385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789556696; x=1790161496; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=56IGjlGPF3KLMkCxJGQ8bqSTegBdBTvKkf6Q5DGZFS4=;
        b=Pzdw9M9qPPlChkF5jqvqOBYA/GoDB8CZOQbaaRZ/iT/eski3suxziax/YMVNeq4xxK
         yORFJsj1Y4NsP4s+HWsFVqfXiPD1r7+6DLoP/kyDPFkGIAaZ0ul/lkxQ/4vPViGSne/y
         354T2bawIxHDVr4y+0ah8Bq3syeoPxDApYXyn02DzF/VGcNEpeMVg6K3xCTrW2cFXRIU
         dUGzMBMRg/etVQzV46EWkk2gkiIRgM9ukasd5jFOrmIsC0UH6DyFN8tsgXm+QP5qS1SF
         TCYv6Q8flJ1A7OWkLu5bWQwdPNvoJUFGz9j+ROByX9th616q+DhSnjLsFDOAV7AXpbVq
         V7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556696; x=1790161496;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=56IGjlGPF3KLMkCxJGQ8bqSTegBdBTvKkf6Q5DGZFS4=;
        b=zrRXhSBi2/hemiNHEfaLTgV0xmKlYmQD0i591t6ww+etiIg2HhDn8ggWtUiPHYdwbE
         OLpY0cTm74ZFFrS73zgrM2oEsUWTwoN/+WzlVQc1MJkkdOw35uEynDG97F60gDG1oEf/
         HFZ21tdP3uADaTmPM5GGAy7f+iHHSyQrJlU1UCtJ1zxqfQuhFsJTWuCqRCClFSZu4kww
         FfKqaQPmvjrxycdSvyH14V8cC12FZnMzP8+23fyDa62TBW/32V57p0mS3TTdl9jjb2rj
         YKpqU68WcAmhE4dKFW8p/DZj6tlXXBQPQBpVzDzVVd27sMkd4XrsqL5NiB+MVgcriVPc
         zesg==
X-Forwarded-Encrypted: i=1; AKwUvBwoRWMuN52rQOeFoE1RfpPPlChPOBM95eXc/2vdWlmy+uP3yozOFBPX1LZfKPyLVRC/cdoUuYlhVTy0aaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n9V5eiXRVPeJuau/DUUZ8s9OO6irQrYLU2VgEzjUteZYcdpz+O
	WxotS7TXbZpz4yS4MlDVjLLoCZ2R+btBGJx/ds/5CggDjyrFh40jTNRrUOf4w3p1gBMqm9ZQlFl
	cKfhg1deW1msNtEyn1yMvWBXr0GVEP7Jz8r2OHUGMSGa/4ooYX/DiC2KhRr1SqDrQQAc=
X-Gm-Gg: AYBFou2NilNpEX2XXdAsezdEXd3XHEw8jDxGPOa71wkQF+b4wh1+nx2t+zCtA5y3pSU
	opEZ3A3IKDJLAKCSp7ZOh+F5OBuc9BH4m/QtL8pmbgNpGZoXJwDxyPWnYCe6Oosw78c3HLuJZpu
	DZ1in3ys8M/rNWx52uDT5EpV8DJ+tqwOHDdnos4DLvNuFJQ8NQxe2mApl76iU6/Ma61EdNzAZYX
	Cb9+fNVl57B3j5xVr+n7qeQNVrTYGWpsSBATNFdpsSja04qAKsh5Sefd9tt2WC+zjf/l0Zx4/PS
	NjReTqMlBnlNOGQnjNj+Jl74dK8Plh8KUNl8byicSRZLO3k0xPKAOWjBTig6+A2qbsSXjTipTaV
	7i/cGfrc=
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr948215985a.39.1789556695948;
        Wed, 16 Sep 2026 04:04:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr948162685a.39.1789556690728;
        Wed, 16 Sep 2026 04:04:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a8d6e2sm73188445e9.1.2026.09.16.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:04:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:04:44 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza: Add FastRPC support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMt3qmoC/42OQQ6CMBBFr0K6dkjbBVZX3sOwKO0gNUChU4hKu
 LsFTdy6meT9vPw/CyMMDomds4UFnB053yeQh4yZRvc3BGcTM8llwY9SgI0Eo/EdYOteGrS1UGu
 KYTBguCqURm1OpmapYAhYu8defi0/TFN1RxO3xq8RcJzSavxpjaPow3N/aRZb+tf6LECAqVAXy
 irkorp4onycdJv8Lk+Hleu6vgEvCAiD8gAAAA==
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4717;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=itzmVFDKn8NTTOrGyTyAW+4CqGuA8ijGDX/I6QdcReI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqnfPg4MFykmpqVGbqJBwB4eaymXfaDTE8VDGr
 x4VYwUBVGaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqp3zwAKCRAbX0TJAJUV
 VqNeD/422ITNN1lwQ8m2FqnsosMAPZs0HnCdq+RzXMlZ0t/3RAWEZrhyuCalWW4vgMXCNm+s047
 33p+6hhNT9HC0IKH0r45mzKue1ZgHdL3iyVFsnDhvzwVMa4oJoaEfEjcT+Bnvjxod4kwjCVnrff
 ILABVpta80mrclFAJgRILHgB4Ua1SWSXAgMwx+ugADMYDP+PZseEL+9N/tV3oLbMqCKM8ZH8u0N
 0b+OVhgjU2WHKJt9N+xsGWEVqXMRS4J7VVBLpr7QTDYM/4uE+FTxk2t1aVZjuxQpaSwgU5d1grE
 wcE+UAJqWV4R+WMF8Q6umo2ClAJgiZeFoP7PdTosFE3if7HjRyX7cg/xCqekUQwJfbLanscUKzF
 MphRFZ4MDP3+UhVDTichAOqzCku0JI6QyIW/e3jdUOwPgl2aBBiaOsMS3Y/63WD7Jy6YWuTFx6l
 xm6kPLbnu1jkxQ0s+7aAqji9XYylhg/x/cB9rY7agVVe4ubMIt8wAt3tjORKnEMk4FhEwe6D777
 wHzE2Td8ZO8HsdqM4f9sSfnIMr9E80fHQCj+tjR0i5c3n/ydlxNH6W+X0CDEEJpClJU5GJkO2iq
 EjpjIEwHq5CBG757xu0a4WjUksD7SBAurXMCzw/rY1js3rUCklcqUJQVNiozt2WKK0FCeQKgGpC
 u+xuGCtfVMLBn/Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0NiBTYWx0ZWRfX/2Wl5jArIt/u
 L96tOiUB0FsqEewoHGLKbZWgI0ldDzGTO0C+LEyATiG1y8yCpckpXgxPk485Hh2kad4ArMBhyrh
 XBIl/jAAnWar+pth8ePPz3VfxNse/K6fgRP+/dPnnY1ME1k9K1oaetSeCrPa42Rz2oFyfXTm4F9
 ad/fyho1qIKgJstQDlQs8EgxmFKU4f17VSPV41KOajEzIb3H7ecvLwXA9ETvfnIuH1AwTsLtQTA
 RwDFgMd30RAzUgMb7FLQPxswozEXoV40N/g4ERSdE3+1/WmV5UasRv9uOzYSz1rQRwiXGstrazx
 qtCWOxukEyIY0AX/28CcmafIvw6ozJckRKnB/pLwzjEKvVmcetX4L7AG6gdqqCh2Gv6m0DgtqIe
 EDZGRazldUy8w2eodU3uPdksoCcUV6CYM53RAKXKP8eN7U+Mvz/WeG8G/FAcMuuEx1LeAcw5fx6
 SQTC4hthKvwWmWOwA/w==
X-Proofpoint-GUID: XLVsdZx7ZMBqyO903Eu560VptQbu0Spx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0NiBTYWx0ZWRfXx148nOaXh+p3
 QBrLiq86CPe6F/I1iGl39yawfX7X4fuVLEQUEDAuZs6vMS1Uh9K47v9/nqDrEtwERUns6EQtSKc
 zKakfZ+Qs60c8GLHHBzRwnL+q9mNi5I=
X-Proofpoint-ORIG-GUID: XLVsdZx7ZMBqyO903Eu560VptQbu0Spx
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa77d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ACN0MSR_Wp2rSAuxn_EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160146

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1066 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 146 ++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..76221544a193 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2432,6 +2432,64 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4629,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

