Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298859;
	b=N1+ttPZFzCzSKw9rTzkjYadwXXPRiebUSHa1PsTquvtTb7NarCa8qD99s5R8VbL8zwlA
	 lh0Zl1GLYoy12uC1LuRg+B34u4eGyuRVMGjv+lSvys/1FRrM3CxVxiTNABmf71+rpu0iZ
	 KIQB3lTLDNWwoWHKGaUrCPHmvuRDJKNZ+wTrlUkTwggsyd4DtmtIUDOokuNjuxHnm+SB4
	 DDlbd2rGvIkE0P+OBxS9MKQtrof6HfoRvBS00hdiSy/e6Whwi1zTcpKPv82AeknMiVeJ5
	 77gUR8KFXfsBaGXMBeJgVp7vZ2JtuhTTYogsfWK1T2PmByTAZD4hak1yG5RPqZun8IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
	b=tx6aXOoKnt9VQEfOmVLcd1CwTO1jbsHABkb/eoJHqIzIaaTLOBc4AHzvvzLy07BapF0R
	 c+wNXqsaWnR9zja0PlGuIQh7bShT9Nu6X6WkssA8G6cfAkHxZgcWt/mJJHyVWhHaA0pmc
	 WJOHXH7sOMEBXsM+AKZU+hpz6Qwgwlpgoejw58xw6Kvs/x/TE+GGdY235ciJrxqnqS3Bg
	 nasZVHuX/cJ/stl0ESDdcSts5NDHdtXqLHhTQwWkLT903GhoIQOfN+OG6T0UVSjMK8fQm
	 BEnrgdNAUOQRatowR8F5cvv4YzAEtiaMqcQ/kn4ipTbxzKnHymh4y5a4klCLAvpqMqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMqT1kSg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/L3/0ul";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9CA606A332
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9CA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMqT1kSg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/L3/0ul
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDI2E1654921
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=; b=XMqT1kSg6empzHnV
	wf/ioey4N6yT8NoWHDxlKCSriNgmHFmZ6iwjrb+45ERs1GkOHcp8fu6Q9hNzJhcr
	YqCQHiofDc2a/u0IDl5pSarwNseXWp9M5pbrygexrdqtRWrwiW4ic7ZDpW1CscB9
	ek2Wam/QP8ia948TV/FUUVJP8itxIXzRzA5eu5VMwVa3hqn/QzKBGrOKAdjCvJRY
	o9kG86TRcLg3z6qiuLHbXY1BECEh9c9+AS4Xixe/4SSBGbwit8e+JpxlUonnUDLW
	sxSaKoS/mMIzGba/cILNt5bv3EkPwcmR6eRasmGjjbDQgKwsa/2O4eMHBPwJdGGT
	3+CZAA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a226gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:34:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so3441323eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298858; x=1793903658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
        b=R/L3/0ulLq56Uy5iZ6rZPyOYAqnTXEy7mgoBmZRoakIxTXU/I4CnQJig405rK27AVE
         SbAWw/XVhI2ZjE/3zzwoWhxTxzhw+N3fR+wp9RqWfwNNCOuvL/1v6XL2YP5G3bJnwGW1
         Jm/PkyXB5j0/qYgrV3OHzmQRTl2zjZYQJN72MrYgG1cj5uxGJKQu17VEuNyCKz5nzdFm
         VzGOXVBqYtt9KPX7V7wlQZspz5abx0/aPzZpWzakjs8maA0rA+GcxHK9tNkZTF3B2/5M
         s7ihtl9xIqA8wdF7nupsLfZnJwggwchbrn3VmlzMFXK77C8UnRjgR9IVFHqtiJaqB6zg
         Bw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298858; x=1793903658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
        b=NU/5HjiFKULrf38gN95PIfWyLIeUNc6wemIsZIWaNHAdPusVNue6wDZ3Ef2ScOOPpz
         ITZriBcRx7HlP707pgD7K8a2WU7w+6qlojFlOA0dFzyiJszJE4vhW031B5l+4pgnBb4c
         7VzdjxvDnovwoU0YnvG0zvUM1Eub1A0koW66RQIN5U7sYdHqt+9M6RtgCffRIkf+unrv
         koQ8yAiAMzzBoLGQvRqLAJGtECV2fOWIKUsel2nAP5ZGXofRWAOkz1Z9T0QGJYU7by51
         SR9xnnq/lPe972hj0PxFBf74nj4Km7T16vqPetFg8VWZ0FdgkCePtUfVzQ5bwqkg/XZR
         ATfw==
X-Forwarded-Encrypted: i=1; AKwUvBw0A4Vm7Mmp5PRn6f8fg4nvcnkMT0JR0dO2dQl/cU7wdVyWaY1+Y5fX7devY1YCzQ8Me84R+R9wmJfe2aA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNGn/utaXWpxJ2IQWUAuL0DKM+6NIVwwcY51rPlI4kOEoZVrxp
	2JpGyqOpb1LJ9R8UP+B5MaDyLAbayPokTIyrortBB8hYnYE/k/7AR2zdEQzceihdddMGRL1JJsb
	RK6paYBDQzKZUujL77cqlbgxBwK0yCS7lYOibAVYnWDtGPznB1oCBGUpTB+TxwySxhaZ2MgLBPn
	4=
X-Gm-Gg: AYBFou0IQAnkEb0rIf//Tsfi0NOWaft509vB90x7F6tAn+uQ0rTdVHkiovOO58sK92E
	wsZhUEJKCVHKjp3wHfJCRR6jfmEKXklqCTQ/oIioLslQwRvHl9e54DdBctCeRMYb3nchLudHK6K
	9W2RobmTCdQSS8ier5KUccUA3nfKFv3iOCISyOcTyGuzdELv9Z0b3BusWusOI+kzhqq8+Yto5Q3
	autSvF4yFjJeec09jduZ5Z6ibj0BxYDCcmU/R2R2+nErQ1p9fGCEu71S4PTnBbS4iEZsZ+EwuhI
	HPsmb/HAKDwoLRyEhDX4po6m74Qyo3mITZSIpWEoiMZDy4BKLXhTkTeVc032MzUJC9UTNFK2VNI
	x1Bhvzw75dfZCP+cOZoG0xsrdqAd/22Xl3b2un6qNtrKVgFv0uJZmElXTLvGsdNmOykclqpnVFC
	Hur/2CDDKHFYQyPaICl8l6uqyYSNOSZ3Ln4E4UbC47dw==
X-Received: by 2002:a05:7300:ec97:b0:359:8492:20ff with SMTP id 5a478bee46e88-36a4240193fmr263448eec.12.1793298857395;
        Thu, 29 Oct 2026 11:34:17 -0700 (PDT)
X-Received: by 2002:a05:7300:ec97:b0:359:8492:20ff with SMTP id 5a478bee46e88-36a4240193fmr263391eec.12.1793298856670;
        Thu, 29 Oct 2026 11:34:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:16 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:43 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: sm8350: Mark USB controllers as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=938;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=q6qHNfYBzgQKg615pfscwOCc6p9bX6lOaiAEZbMgff8=;
 b=3UzHcLpW5lvtt/3IVhmh7IyyhimC6iVExWR7sijLVfm1qZTkgC9jeduXsTg28qAuHkir3cbjB
 Hg5NYAgSC/0BZzWF77wLNK/lalkDWie+930a50ho1YCh/oYq9hwqCVq
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXw3l5gIC5XM1Y
 kXeIqV6oStR9r0A/QSqTmEdaDiKrIzq/7YAVzhNyoPBEkm0Q5r+79V7l0yYWe/EKfFqgKQl6mHZ
 HkDD38GEbNLG+LvlZ1OZhLZkC4z8NzOw+frS/bDCvggD8TY2EAu6bAD5Hzwde0MkvQYrEMY2iY/
 jQi5XnyxOf7vU3atbBuURKHuDzRENKfO6iCEKbYaKdt9fDjJZ1sZIREtE0nhYyrS7SOgt/27Iry
 WpUSxDiKs0ddiGOdUG0Icpo9THhyqWakdveq+UgAhM07VVYdLuHuS3bB6Gn6AAgUDwoOajNXxMo
 N1wpXZkKnmhXIpeOxhv7f4QHm/M0cmBt4CHnfxPPzkyN9nC69OUGOn4b0LDB/xw+kHHcf9aM2IL
 20bUgqQNYl1Ba/P+Sqj7ufapkTBNz8RzFeyHuPyQnBfAcki2YVyj+A/ojjihH1QWZWTzS4WedWA
 iFgPP9gD8ZbLOBD77tg==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae391aa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7BzVpCbw7KuSwccWv-wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXzk44PzlFrVn+
 QpwIhSe3EGU7lrlLsqOKifk+m1BGTLAnx3WNJvUE9Q2WmwQp2oPvTOrg7lTHc7s6+gTeUJjB5UM
 WpkjdPhyZRekJaUt550FAVFQe6yBXhQ=
X-Proofpoint-ORIG-GUID: 3RHFeFueIcwNI-ZwWrpV4TL6Cxq5CYyJ
X-Proofpoint-GUID: 3RHFeFueIcwNI-ZwWrpV4TL6Cxq5CYyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290072

Both USB controllers on SM8350 are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050ce9c..863874da94a8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2669,6 +2669,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis-u2-entry-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+				dma-coherent;
 
 				ports {
 					#address-cells = <1>;
@@ -2748,6 +2749,7 @@ usb_2_dwc3: usb@a800000 {
 				snps,dis-u2-entry-quirk;
 				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+				dma-coherent;
 			};
 		};
 

-- 
2.34.1

