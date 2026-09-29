Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E7B47A0DB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670949; cv=none; b=Fpa5ZoNLbEpXiVYZybrn3O3PuTaAIlMyTxD6Eg6UhZGbuy7Y1/+ogkU4XGAcVgFP05iL7i3EL3lx4fyNFsv1cNfJybdi5QZiB8itxtZbA2a6D3UhhzsurbgtaNEzw3vnBTbg1a0IhoCvfI1XNxZD/bhm6YMLb6qpIjDJ5SVI784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670949; c=relaxed/simple;
	bh=+WBtgqUYhmMDwHP6ldLVMcFGhuRVIKD4iEmEu265GWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EOSmhLHaHMQCbTQmoo9QQTCCJgaKPHGCY4Lo8HqzuhpmxqYRev0GYlULvbcKgJ0dsJBUy+oNU0eimi1tucm0yumnYC8zkZiJo/Dg5Lf+4SZOSuJ7po5C/LXTNTSeXrvQMt3C1GJ6dH/0/QvfkFxi4fnPeOi6vW7BiK/twbDgbe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fEhWy+mv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jpv7OfN+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fEhWy+mv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jpv7OfN+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Ttw03684740
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NBM4ELYuf+0jaJ5Okv38Px
	7MxpDTXfLSZ8Dy00vZtW0=; b=fEhWy+mvtbrdohYvNUycdtIVSw5L43FCTrpFOl
	GX7VUg/eg37iBh7QMKMyaio3y+n3u5tvqZhlyJs5we7FNyRXkka64o0zTwXUWBzt
	8NUw8gsBF9dh76y4sAv8GExD55yaNFF0mtuc4SsaQHxc9/DH2Nau4qmwZWPCemds
	AKocRAfpSdKZEcUG/eaHJH7y8osC4+UdxB6km4mRVW43GglbN/YrexrbRNzUF6xy
	q3eFLyE4KJ+FoMuwgqVewKXVgQRT2yvMSGBvr7qnbhZk45lrNYjPqqY4yioNRFPt
	51EPG3YoJimyMvzpuzSq+msG5qQACm6HKo6dvX0xnda1aKQg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144t061-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:35:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so2103298a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790670935; x=1791275735; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NBM4ELYuf+0jaJ5Okv38Px7MxpDTXfLSZ8Dy00vZtW0=;
        b=Jpv7OfN+fNpr8oFQ67qf7pNrcSnxMOywO+gQidtGI0Tid5nkLhtrhaHkK2OZoNtuqE
         lX80IEnTMGwGbkLS8+MKMtDNsp0sAvdchuHvHCF00RC/nea95Xy4u69NmS5mEBr3/qqC
         6axY1yFLb9YXDtHXU4UwMkj8ZbCD8tSMO3LzKH4bakMUrnCg0AHVv/WYVcd2oNZwkeV1
         kK9Se7j86ZOBOEEonbWn4MeHb6ZT4GeNT9goDMJ7I3a8FKkwkQZHJQjr3WG7zc4G2YA0
         NLtuhQqh8BiuQpNARgyU8Os/Z1yMPOSuNOa6wmyDzE4LH4BJnzHbmpm6AZ1k2q6vGkZM
         +yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670935; x=1791275735;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NBM4ELYuf+0jaJ5Okv38Px7MxpDTXfLSZ8Dy00vZtW0=;
        b=QPb8ZvKR5MOXxLMY83b1IBERDZb+59oUQ9E8tsjIjxqjYYrje0WKhCf6P7R6BTx96f
         EnAad+2RdkYmUQSL15sN5kCk5UNeICdUF1vLC9gkKm5HQVZRcVHTGAov80h4rOQZmZbO
         6moqtgxNgiC0uWQpiBVqrSiIC1ZDyaZxHn4mPnLZyWjXKD78s4Jybdckr4FcGh36oMSH
         pEzqOWr6r9Ex51Fbd7CHBSmn9t0Zx08pRHf+NyeCyA55vnamyjEwqwKDm1r28AFe/WyI
         NPUouMiq5g4hzgyST85pi1eVXNTAM03VKN58c5uL8D7fEcPKvibjlmN2MP5UVVINTWkA
         5+Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxqiKtPO+1y16/RHEr5nWqm0R75btHH6KsEEw0RbHNs4yd2ZFT9g5jeeKXiBXscylb3LH7UiX6OoESV0aY=@vger.kernel.org
X-Gm-Message-State: AFuF++khCR5PT4y5NjrhVf+cl9Yt47Qui26hw0xqYlcpnT31srp2aZgG
	OS5b6VpawbMEhi02hR0GrMigsuyH1V33qKFSwqJTixY/tO0aZWkjElXGZNiiUPQlJpUIKjAPExS
	0wDzpQu+Qa3KQ/75CSjrEed91/lYT46ezlbgIwcM04NHgIaWR+P3RejeOltF0+t2k1+cVV9E6Uw
	==
X-Gm-Gg: AYBFou1y2hyJJZq8mpDsrmouJ4CPk4OKiIHGPGcnZVhB05pUPJdFg73HUmDfoXkHrBz
	7i5zQh2+CakzniFMcE0k55rHlnt1cIq40AGHf+rFe3eX+TLkM0+n9a4/K1Kzh94IwV1ShK+4MBs
	uh/Ora7llLWWT3aWrf1JlzxqQmFAfm/fRPmFMCf40F0+Cnb4nfGyzuWzeFPhrUI8SPyOBr3mq7u
	+cc2cEiAme67tTaQOjnFpJbhvKvuoyLZAANSP1yv8sqZ7yDbaLWv8TP1rCwbT3KVLlKjU1Eye1Q
	PsdByRtg74RuWI/k5eNLm82LsFpdzAH1wwJHETyVK6qkXpdo5vtvb6m8SXkqfOPzMexDF0wW2yL
	KCQa+mO/RKlsvodJGW0v/frucLhNIbQ==
X-Received: by 2002:a05:6a20:7344:b0:3dd:a197:cf33 with SMTP id adf61e73a8af0-3de0e96b81emr15004007637.87.1790670934874;
        Tue, 29 Sep 2026 01:35:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:7344:b0:3dd:a197:cf33 with SMTP id adf61e73a8af0-3de0e96b81emr15003971637.87.1790670934215;
        Tue, 29 Sep 2026 01:35:34 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5725689a12.13.2026.09.29.01.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:35:33 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:05:18 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEV4u2oC/22Nyw6CMBBFf4XM2pI+DFhX/ochBNpBaoBqBwiG8
 O8W3LqZ5OTee2YFwuCQ4JqsEHB25PwQQZ4SMG01PJA5GxkklxnXUrLGLWUneNlXCzO50tyivth
 cQVy8Asb4sN2LH9NUP9GMu2JvtI5GHz7Hu1nsvf/mWTDBLDdaNzxTdXO+eaL0PVWd8X2fxgPFt
 m1fkfJS7r8AAAA=
X-Change-ID: 20260922-fix_l10_max-c7390de98d73
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790670929; l=1585;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=+WBtgqUYhmMDwHP6ldLVMcFGhuRVIKD4iEmEu265GWo=;
 b=SvE0b8+yUjIHX5wffqmbGI7TugouNVEuLrzdL4P6CzY0RV2IwzIV2vCroJCIx2fdG/aVVZT5H
 sNttKes6gvlBbeSt63/DVdg8ARO7JQ4XCDifrJxZTQq2y59+gQDz7Fa
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX05GRs5E+Hfv1
 6HPvYEExtr0dIPT+mhtl/0liwbZNsWS60t1VaxeVL+E7qZXTnDQaGI0K9wF6ttGHjC5xdsdaT7n
 GuVwnNNwXhkSIhgQxjyIYetrcON+umISG8V/J1mq8KstlOehhGdc5qmtpr6r4Xg7cyLprB6nM5H
 U4yjKq2Spa4MFBCYcaZm2N5gVj6kq64RAZJdlVmYQrE4Bs7L4ztxF4hLiTYrtgyPuJWymTWbtr0
 8F3g/OmYi4wOdasBpOQyUUcTkyNlnZjmaVL9iPj0ZTqI8wVdwss0frPuGiRTUQ9VnJjUk6HYlQO
 keCFNoUxoPyKOv9YuQym1b7YpFNi/B/m1+BCNHJOAh/D8ub8E9P33suh38qGPMZgT4yOLbDbBH1
 tzoyP9aI5Eil57U4Dy4rJnyptjjNsuRPusdMimOf/KGn1BdaoLMLc6CiPEM1UfEpNOUGRgd6PAY
 di0ostrURoH01WtF2Uw==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb7857 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iJBOt7TdxrhOr4jrKroA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: mbaUxYgxCmTtyiYrS9deB4RfZFjPqd1q
X-Proofpoint-GUID: mbaUxYgxCmTtyiYrS9deB4RfZFjPqd1q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX2HHAioE3ngGG
 ZO09VfV322iobqZs86tk7jiIoXu8i4Otx8leyb7c9W8jPVVNKJLmYF24LXLPaCarXZe/kDgTi/p
 Wj9sf/Z/JPZ3ZkzFCUC5AzGH5/2sVUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290034

On Shikra IQS, the L10 rail supplies the SD card's VMMC. Its maximum
voltage must be limited to 3.3 V because the derived VQMMC voltage on
L2 supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V
can drive VQMMC beyond its supported range, potentially causing SD
bus bit errors and resulting in the voltage negotiation failure:

l2: unsupportable voltage range: 3500000-3296000uV

Reducing L10's maximum voltage to 3.3 V keeps both rails within their
supported operating ranges.

Co-developed-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
- Update the commit message.
- Link to v1: https://patch.msgid.link/20260922-fix_l10_max-v1-1-d0c99f063bf4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index e119ace54e58..ba8c93f01546 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -172,7 +172,7 @@ pm8150_l9: l9 {
 
 		pm8150_l10: l10 {
 			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3544000>;
+			regulator-max-microvolt = <3300000>;
 		};
 
 		pm8150_l11: l11 {

---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260922-fix_l10_max-c7390de98d73

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

