Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C704C4F73
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388612; cv=none; b=nDjbRyR21pt307tqUxab7zIuGhu3z+ya325Img3DoZDMCk5crcvKFLUYJoYi3Bc+42c53GaF7elrMmyL+u5Sysgevok6qDtfEtlPw0WcYwcAC2whPhc7om7drcAM9rLrwNMLTbP1297tNGGiuXCrrMYwydIFg8SYPTvYai3NpG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388612; c=relaxed/simple;
	bh=tvrkVnNVzVqPHdbF+BqM9hoF2JFlmngrQMDOSujCNuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzxkwVTg+6BbtkfEjl8evlDKNWJoBAtjRJpb7eLOkipC1OVUko2ahCrAsdSGFgS3baQPGVHUorHyEAi6Dl0nyaghXa+4vbfaDlOmEsWSJZoauYJxQCQNIOdqx86wXnc1B1Yz5fOuorwYdGGMzh8wY+pRM7rJhQ1v6sbDl+m4CeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ny/VrXaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyLncjxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ny/VrXaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyLncjxU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtTcX3250237
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 15:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kW6rpnxwzXFfRRNw2MCCkZ9ojaWatWJeNEHaV11Hiu0=; b=ny/VrXaXWxLVArlW
	S3njSt+LwK6ZO+aC0v//TafyuF7gn9gNsn5v9KR2VjLdJjWWE1keSbE+h8cqQ7FC
	68p8aNFRZ409VOI5eJoLw7W/2kV5RhwigVVe05y4UcQZKwYNZ9vUopfZewanx6hc
	cqfrGBj6/LDmphJP4p6atCZ7ENbowVzVcDz7udN6m4wQsm8uv96mAULIP6ZWna05
	YzFg6jeDr3Y0BVbKrQTGsu7JPTnv2wKoUxevUZFf+cvczmPIcmSYel36h0gwOEHg
	esyr751TUsbg3e59snsI7F8mOmTjBE+9PYkulPaKVGNTwUxO7Fs/FPAoZZ+GEjhd
	i3/o5w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mge17k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:56:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so1731787a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791388608; x=1791993408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kW6rpnxwzXFfRRNw2MCCkZ9ojaWatWJeNEHaV11Hiu0=;
        b=eyLncjxUXZxSHVEDsyLM+FGn7inY+ks9B86luH3TfqYZWIgWN3TGTOGV5c5EfID/+o
         /VfIrENcS2bwV/z/UtAmCAU6+R8s8ccPqIkbJ/m+Rn97ufKywVq438SB6/iL46oBMeQp
         bqyKWl71RWoeW5C+F+7DKddl8O4ZOadRkkBCYxTXGD+XzmEX+DGzh/PBdz8RlOdSZbfT
         6BE2rXPwZbtNXm7iO4g0FR/3qV3cdSxS4Vgb53jH99fMQabu223/E0juhnhIc7HH7FhR
         gXIuMzxUcCqqlzjLh7Ajbt1PtxWjvBLveTOxMY/YFQpa/YnRNaTWE6s/nxQDL5HyirCs
         D5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388608; x=1791993408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kW6rpnxwzXFfRRNw2MCCkZ9ojaWatWJeNEHaV11Hiu0=;
        b=G/bBH7ZVyj8ANhaSeuuEsCOaA5RNlkooU/9PF6NXoGCRf++Kvk4XeIO4H4DOYA6ZWb
         TgDEzC6tRYoZPKdh3cWxR71hjdT51Eo4Huoh0sDAE7rStCnViqoHci5aFPbDiGoByRKM
         YVoRJ6nSJBYBABBJ6DYT3s2DGFnIC0UHW01ffUfTkdQgFEBX1+K4SYFu2xrj9p8Rpnvv
         I/k1iKfzx/bqudkkrS0mdqtPgdt3b680W/fgP4OqKHDo5ERqytOD4CVUptMjWk3s8Nxr
         Vw6FKGK8nHFI+6Uly2W6A5OIXc5WBVCZ3sf8sksTzofiCtmfJzGSa32eAOg8OIfbCngT
         NCtA==
X-Forwarded-Encrypted: i=1; AKwUvByCdY4GCbV8PL46fdA2cLrRvnGZ8XG0T2Iv0hcFPzO8bz8Zw/mUo9e877GqvlLGgKOJ4+OMZ0k8fexC5SI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1ZHRPDfJqW7CHmbq657Qbe5nRfuJYbn4qu2rKmM+YCWfNuxey
	hXvB0FAPAu+nMjlW7MUsPS8bwy3NkTmRvdEuye6Ye+HB3w/u6QuBLqmDRBGwAHqPQ7hM2IHOv1U
	QlG3jKJBlTgOZSkjW3Q053JVvVYo6r2IIR11o9maFs9wNvevkbQNbtqwc62gnzy1zx1s=
X-Gm-Gg: AYBFou0mYz1ydt1PnUFXxspksQ48CcrEwLQ91+yzWb9ZTvL29GJXqmnrDW7JhFF4rRH
	is9aILn6r2AudDTv+g1zpfAl59o04WhDZOCXFx0POSLkKiz+Dv1koFxaqHRMkZsER19weU4GQzm
	HLdVYIu9bgOA/kkf2Mtak67MEBRVq62v3ZYpK7YHsLPdQu+7tWz4uYNNZSn/fXYc+lMjyV6PR9x
	JSC0T6u2Ky458FcyNQC0lsMdqHM5cKeaP6lZuhcH6+O2qOVBA+ERzRQsDPVWELNevHSvwU5MlZn
	psq7jUwD61DzW7X0vUiVI4fuN5ukgLKPnH+9fMKZQ99ENqOhBqIPRgPM0/F7s5YEqtWAERQ5WRU
	TPeik0aJwla+FwHxY0lEfVeF5ZextN2oM
X-Received: by 2002:a17:90b:498e:b0:3a6:f87a:46d9 with SMTP id 98e67ed59e1d1-3a85464680fmr3958979a91.42.1791388608028;
        Wed, 07 Oct 2026 08:56:48 -0700 (PDT)
X-Received: by 2002:a17:90b:498e:b0:3a6:f87a:46d9 with SMTP id 98e67ed59e1d1-3a85464680fmr3958954a91.42.1791388607483;
        Wed, 07 Oct 2026 08:56:47 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60f6626afsm11000655ad.44.2026.10.07.08.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:56:46 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 21:24:54 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: kaanapali: add CDSP FastRPC extended
 context bank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-dts-v1-1-b52eb8c3613d@oss.qualcomm.com>
References: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791388595; l=4490;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=tvrkVnNVzVqPHdbF+BqM9hoF2JFlmngrQMDOSujCNuo=;
 b=bVMoxCUqeE3RzMQO+BKspcuOaaC00iKAJcI3e7zRokXsfGsUT+/5sVHZ6pXoa/nLzgo2wCqIz
 NJF9EviVGKsCHHQv1o+nkx3ltYlODwN7J6njaiSRbUlpsOMQXGG3hEr
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfXyJ5kh2nZkviK
 oND9I2WrtXFJhIWe/4d/C6bl5oVsjSHri380MBnPdGk63dYVqpKypr7Yl7KzznJh00/W4vx5voV
 ry7hBVx1nh88Kn+y7xPSAegIvrt+6qU=
X-Proofpoint-GUID: 36HTRAgr0RvMTZMdfY3v76k1OwcZwIZW
X-Authority-Analysis: v=2.4 cv=PdJqFShd c=1 sm=1 tr=0 ts=6ac66bc1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Eg_51P1V4iClgTwtoi0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 36HTRAgr0RvMTZMdfY3v76k1OwcZwIZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfX9mk87pyX/2Nm
 YU5qSbOtrmm/88xa8ZLTPkcfz3/rXgBNCMw1c9YBj9Y6mjsvQriQ0yoNW4kEJ8FP1IXUDq9Zzb+
 CDYEEYsI81RJ/5HSD7qJ+EtjmG3kSXOcKQ5njhcEewJ83f0YSWxAhq8qg+wFTnt91lCig3HPE0I
 mFxyliD1biDyR8FiOvzbUHMfpU6/N+95cqQZP2kRDVeF/IL9n0/M5G6TCdTXj6tID1/XiUulncS
 3J04sFvHu8bFDuOGrenaNBJeln6+HRx27/xWusHFEmxrps5NxuucGGx9hrJhffHUjWoecX2BLqw
 +ogIY9EzRa431fliQLDMUfjopcFjD8gw5qJgroj9Qrb9LpBbbju9klasElTjIzhfEyI7dpl1G6Z
 8sOmqxFi4EHrCJ+OQ/IpBODNuBLPm5iPW/k5dg5winbV1oHwoe/rwpWj3cpkMtuyHFVPFgUJhf6
 AFgvgr8W7uQBPI67/6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070063

Wire up compute-cb@13 as the dedicated extended IOVA context bank by
adding iommu-ranges = <0x4 0x0 0xfc 0x0>, restricting allocations to
the [16 GiB, ~1 TiB) window. This allows large CDSP buffers to be
mapped beyond the standard 34-bit limit.

Bump #address-cells and #size-cells to <2> on the fastrpc and glink
ancestor nodes to accommodate 64-bit iommu-ranges values, and update
all compute-cb reg entries to the four-cell format accordingly.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..f783a039aee6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -6306,6 +6306,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,qmp = <&aoss_qmp>;
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
+			#address-cells = <2>;
+			#size-cells = <2>;
 
 			status = "disabled";
 
@@ -6317,17 +6319,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 				qcom,remote-pid = <5>;
 				label = "cdsp";
+				#address-cells = <2>;
+				#size-cells = <2>;
 
 				fastrpc {
 					compatible = "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
-					#address-cells = <1>;
-					#size-cells = <0>;
+					#address-cells = <2>;
+					#size-cells = <2>;
 
 					compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <0x0 0x1 0x0 0x0>;
 						iommus = <&apps_smmu 0x19c1 0x0>,
 							 <&apps_smmu 0x1961 0x0>,
 							 <&apps_smmu 0x0c21 0x0>,
@@ -6337,7 +6341,7 @@ compute-cb@1 {
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <0x0 0x2 0x0 0x0>;
 						iommus = <&apps_smmu 0x1962 0x0>,
 							 <&apps_smmu 0x0c02 0x20>,
 							 <&apps_smmu 0x0c42 0x0>,
@@ -6347,7 +6351,7 @@ compute-cb@2 {
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <0x0 0x3 0x0 0x0>;
 						iommus = <&apps_smmu 0x1963 0x0>,
 							 <&apps_smmu 0x0c23 0x0>,
 							 <&apps_smmu 0x0c03 0x40>,
@@ -6357,7 +6361,7 @@ compute-cb@3 {
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <0x0 0x4 0x0 0x0>;
 						iommus = <&apps_smmu 0x1964 0x0>,
 							 <&apps_smmu 0x0c44 0x0>,
 							 <&apps_smmu 0x0c04 0x20>,
@@ -6367,7 +6371,7 @@ compute-cb@4 {
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
+						reg = <0x0 0x5 0x0 0x0>;
 						iommus = <&apps_smmu 0x1965 0x0>,
 							 <&apps_smmu 0x0c45 0x0>,
 							 <&apps_smmu 0x0c05 0x20>,
@@ -6377,7 +6381,7 @@ compute-cb@5 {
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
+						reg = <0x0 0x6 0x0 0x0>;
 						iommus = <&apps_smmu 0x1966 0x0>,
 							 <&apps_smmu 0x0c06 0x20>,
 							 <&apps_smmu 0x0c46 0x0>,
@@ -6387,7 +6391,7 @@ compute-cb@6 {
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
+						reg = <0x0 0x7 0x0 0x0>;
 						iommus = <&apps_smmu 0x1967 0x0>,
 							 <&apps_smmu 0x0c27 0x0>,
 							 <&apps_smmu 0x0c07 0x40>,
@@ -6397,7 +6401,7 @@ compute-cb@7 {
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
+						reg = <0x0 0x8 0x0 0x0>;
 						iommus = <&apps_smmu 0x1968 0x0>,
 							 <&apps_smmu 0x0c08 0x20>,
 							 <&apps_smmu 0x0c48 0x0>,
@@ -6407,7 +6411,7 @@ compute-cb@8 {
 
 					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0x0 0xc 0x0 0x0>;
 						iommus = <&apps_smmu 0x196c 0x0>,
 							 <&apps_smmu 0x0c2c 0x00>,
 							 <&apps_smmu 0x0c0c 0x40>,
@@ -6417,12 +6421,13 @@ compute-cb@12 {
 
 					compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <13>;
+						reg = <0x0 0xd 0x0 0x0>;
 						iommus = <&apps_smmu 0x196d 0x0>,
 							 <&apps_smmu 0x0c0d 0x40>,
 							 <&apps_smmu 0x0c2e 0x0>,
 							 <&apps_smmu 0x0c2d 0x0>,
 							 <&apps_smmu 0x19cd 0x0>;
+						iommu-ranges = <0x4 0x0 0xfc 0x0>;
 						dma-coherent;
 					};
 				};

-- 
2.34.1

