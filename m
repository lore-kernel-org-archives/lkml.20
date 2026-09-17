Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABB74B95AC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638038; cv=none; b=WtcDCFuR2Le7tvMYpEdilgbPufUHKifdtK87f5l16l+E4mbPx1/M98GKV5/DaxOyLsYTl8IW42cStjCG9YGydNQS21wZ+LBgucsV568kaRzjb94js13nrOLimQwwVetS9bfC28aA5vadMwnzwUxe/siGQRiOdGI3bX0S6M59pKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638038; c=relaxed/simple;
	bh=cBSNXOMGIDt/T+TMgdLf64Xou4UhaPFxYSV6wdg2sso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j9d4eE2snskClgV7CflKqnj/NH2wuhcGSfTjBfCW1FIjQXpS1U1dm98Sl0tVnrC1232BsX1BVsKxmR5rKiSgysjA/TgyhYqgiR1Tb2AN9Gaa8v7RueSzY1wBQ2C4yaIuLZ0jxcZtIz90gSQN3TPPRijlE0mPRaUfbVcQnaV/AUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khcg2Iwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WaWTvVUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khcg2Iwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WaWTvVUl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZsQc4186752
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HviKUstLs7dMID5WQ7sady
	Dcy4A8d3RlgNXEaO6wr0Y=; b=khcg2Iwya9HCt1EXGRg45vXa/GrAa6s1hiIwyR
	YLBAji7J2k9JPlt8Su4pQ2gwkfBraaV8euGAeTI2A4kUXXiOZcZGyeQukwvbkG9g
	mkUlfzygj4ND5kAmr5yHKpfTOm4YCjSdPzbBrXzvwZbCRqRy2B3TitMRcdy5h6+n
	rmHyu5leQ+S5SMsHPfpPYaFDNEpfUOpiGo4mkEaXLSCyJC2W+Ca1AlKOSXESmZs0
	fXdFVvS5LfNni1W9Az5k8+wewtCjO72ZawBCDsEo7JZNFRasuZvNjkLD94t1Rbe5
	KK+FdU0aI8JQ1Okj/BdUn2IpYyij4/8nb+BmHqc7FoZFo8vg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9ge4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:40:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so1246098a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638018; x=1790242818; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HviKUstLs7dMID5WQ7sadyDcy4A8d3RlgNXEaO6wr0Y=;
        b=WaWTvVUl7XSzVAWpuP3OblHYmLf3VU3DRYs1im1asO4D6DBCmJ09EXQ0/fIPP/ZUbb
         RozjK6PxyeVlbB3egKS46/A4+G2XvNf7zMzdQ7aFpDNUhayiI2L7zxAj4WOfZKctQGEe
         tfqwCMe2oe0dUVp1SpcG9RHnCwawMqLuzTg8lctyu+FTtW0Q71G0VSClZ8eZivX2CGuh
         Zo4yvFQGo9gft1ov2qSD9dgBDIB8LOer1yz+TXjbyv6hicy3ojPD9Cvvn+gRjXDy9tZm
         iwuDbqHknDmAPgRRVT9RzoPExCUyRhj4/KNgOOo3vBUM+5jmGLKpYEnTytxcz0zDpmLD
         kSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638018; x=1790242818;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HviKUstLs7dMID5WQ7sadyDcy4A8d3RlgNXEaO6wr0Y=;
        b=owwxUKMIPc23xoCzmJreLOYVJYnPycFxBiHCGmfDt1AxDrKfwPcbQLs1Gmh5FG8OrY
         t2TxmOGYJuU+yNU7PZFzb2yfnLO6kf0bfnGKvLm8mdqxRNBLgk/rbN7srxqMqObgqdWb
         cCDLaV4SHg7Umm2ezPkRjzdWacYuhS+P4dFrNBonSe/09F+z78qO4/g2w4u3hmlQF0mS
         BCF1hzNb/y5mHy5djB+1DcAlWm1BcI33TEDY1WU2WeUWOOn9GBiysjLEhFtxo5I+gsic
         /RrThtMjXgReaZVEV/RygRrdQyfuX6ebvl94pvkX0JMAMG0Pn6P3QUSDwZ0DlHRYOC25
         NERw==
X-Forwarded-Encrypted: i=1; AKwUvBw0Pn1LFzEIpIMf7Qclfdd6G6jN1n8hVH6lWSby1Fu0n8s1NUp+NTKM2tZul0Xo4OXusDuxqlLv63rsHTo=@vger.kernel.org
X-Gm-Message-State: AFuF++k+NsQpegQkkwCboQs1awRILWzBK0YKEocW3tsf99YdSPSwLwKi
	wUjwsRaWWy807c0uszCRxeP7xxb60Lhg34XN1IPyB0vg4Q0BWlf6/JXEM7CnLgoeh1LepiZ3Giu
	aaW7D7UHUitNOKi4lkL3n7SgloUOhfCQQlZ+AQsseD5zWj0Yx7fWww8YgYxYFveOQz8VuUvXNb2
	A=
X-Gm-Gg: AYBFou1iy9frLzbJtGjcfScPVU+tBB/BsoF9GNPv08oe+0i7QgZsZqKGdM985sc6kL5
	g4NCKKMstb0X6lBzv3UI9J3OTlJ9oJxRjVl3inZzBC1EwtnDJcr7lz1ew0/wBGrZxHfMPqQBvIa
	6bzP/sY2/iIzfirsS95IXMOsR3bBES2yQr8bZVgvWyP+euFdtNnC47t1N434uozh3PxCnJdk3j4
	7lL5aV5/iKOG5VwZF+myMe5vXtvsZHuj5J0c4SmPtrRwLvQSlrwDQAkAIVNQewym6pLidDQZLLM
	qaDkHIuzxvzgt8MgCvrcVhmsSpxVftZuC3HYaqd8Io678bG2AcvkJnJSFmn/jyY+KchFvISbGwb
	3RFboz9umQfc4IjUNmzRRtJhApbkPdATuDGfICGQL289PBdRgtKauYQjLALByk4JoB4EUVg==
X-Received: by 2002:a17:90b:5803:b0:39e:1329:7816 with SMTP id 98e67ed59e1d1-39e1e484be6mr13489131a91.15.1789638017595;
        Thu, 17 Sep 2026 02:40:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5803:b0:39e:1329:7816 with SMTP id 98e67ed59e1d1-39e1e484be6mr13489028a91.15.1789638017152;
        Thu, 17 Sep 2026 02:40:17 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac47cfsm13161400eec.17.2026.09.17.02.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:40:16 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:10:09 +0530
Subject: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHi1q2oC/yXM2wrCMBCE4Vcpe22gCaLUVxEvNs1U10MbNq0tl
 L67q94MfDD8KxWooNCpWknxliJDb/C7itob91c4SWYKdTjUjT+68opOkcEj1OVhtn2CH2xPeO5
 CSvvIoSELZEUnyy9+vvxdpnhHO36LtG0fbE4b334AAAA=
X-Change-ID: 20260917-smb-repeater-power-leakage-e1af2dd4ba29
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789638013; l=1389;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=cBSNXOMGIDt/T+TMgdLf64Xou4UhaPFxYSV6wdg2sso=;
 b=7VYnGzUyDOG7tGq9tACsn9MIxurQJ/BNeRW84gsnF0IISn3t852Jsme2eiMyFczHtNKEu8TQe
 sj3+WFiwWbIA5gwEhfwkF/GhZWXSkY05MiurSNd/JOIO8g5a/ojvhka
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMSBTYWx0ZWRfXxaSIf/ZkT8cK
 +e9OTpGJa3ReDVrNHhMYXFKnM4LpMWz1LjxcwOcx7G+mQpkIqwLMJEx3xSdZVVTan3qq0CbTeUv
 tchArrRF1j9+kqEpUQWVsxwA+5GhB8AW90qV/dU3q0HuZb8qwa00A3LuQrTlj0Ke/XRMsKBJE4T
 2O0zek7Bc/VK/LaSxw7TqwZnD+rREPkQ+3biLWFnYLar01pUrhQF28A4sMGLhsQ/GIY5X+Lwrus
 o9sUoFhPimy3qHDUZ8LotIRyaaEjRiZsNbPHnfXH/d/r+kMADdsP1F34tmqXV6dbxy1QarB62vz
 jppNKiSpwYV7axNipW02eJ7Cd5UgwsAle4EUgKKlL++lQgPmnma0oLEnvv98RjR4oaM01I9TMng
 aCcjp3IRZBnj0pM3dqnlQvIT8q3OFXtmVs0SWlJigg6px4ndED0A5rA4drjXtPkGwAPtrvHcMJT
 g40EgumFCCT6MsacmGQ==
X-Proofpoint-GUID: UBNQCMS-ZYnhHcsr8Be4d025C-LQkDHN
X-Proofpoint-ORIG-GUID: UBNQCMS-ZYnhHcsr8Be4d025C-LQkDHN
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabb582 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RyVTb0XvSxcqwvHsJZ4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMSBTYWx0ZWRfXwfhn2w7+TL5H
 eqRPc+8AHFbTeUGa+jgPpAQegvxMgbZw2aLrEVblHXXWPy+WC30/yhFVzqDVlEpehr0Bewg1u35
 vjWmW996EE2QGTHDU2wzkuKdEQgvYHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170131

On Glymur, it is observed that although the exit call is done, there is a
power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
well). As per recommendation of HW team, disable the repeater during the
exit call to prevent this power leakage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
RB tag from Konrad received on an internal reivew.
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index efeec4709a15..7db2fbff6163 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -229,7 +229,10 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 static int eusb2_repeater_exit(struct phy *phy)
 {
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
+	struct regmap *regmap = rptr->regmap;
+	u32 base = rptr->base;
 
+	regmap_write(regmap, base + EUSB2_EN_CTL1, 0);
 	return regulator_bulk_disable(rptr->cfg->num_vregs, rptr->vregs);
 }
 

---
base-commit: 8bc74189b12e3d094d45eb82946c1fa17569fc93
change-id: 20260917-smb-repeater-power-leakage-e1af2dd4ba29

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

