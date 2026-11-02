Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616165;
	b=w6HKgJC0peYdrj5vmr+nvGh7dRYKzSxpEDeiBXJKivuRrClkz/CqvBdd+LDP3p3CTfyn
	 UZXxE+VSU61raP83VgqEMiPJuRKyBmXpgMfJN6rcRQqmGAM0InsHwN6EW4t2/ka/BA2uS
	 gtYm68i8DdGcQcjksZf6GWavvR1ShNW3z9089/dKHe4Dlr8ayOcdyV4zbAR9DUjngIcDT
	 LtJ6ABQ0NlMRXoTNtqo2nGn0F3DmO/C+wYCAG/jma27/YTYksZFWHVu709/XPzruixse/
	 MsCWRFvHo3hyMShbCN+pWb5Up+xNZlquiwUiSkARLfJm4TUKRkXvMj4mzMwnJwc/ZEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
	b=BbnPQ95iCjUiuiVvpMdSZ2mv0cR2UFJffU/qTdxWgTErbaLEft9ADx0VnA9L5e47O21K
	 h1hsRyUAbu0dq64N9m9mq2IVn1e3SXm1y5iLtmgqxyVqLyPEnHai7i0nwh1829wF1dERR
	 Pmwo4kzN4zBNZ4Hi4XDbI5mdfktegDxvq9nS3+m7412gUUwebNe6gUtSnUnx8sYGya/Da
	 BMnBMSXSJlwcS0Y3maXGZu8x1ZA06E+NgfwhIRuuuonOP5u4DnwMRW396AsqpTHZuEz8M
	 OmldOT4RCr9sh0Zx7DANxjDjh/ymwAOwoTLOIGla8bhWowaZmxPKigmQit/MZp4rAfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaFOtdmP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xf12DpO/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399BA606F755
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399BA606F755
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaFOtdmP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xf12DpO/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALR42880833
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=; b=kaFOtdmP024Jr7aS
	G0xi9hA4iBnG5ODY/1hcwxRRjEjhSiHO0bsK3NVaCCsdex7iBF1mHrlcigoQrt92
	QOjhU/HCfwYcJF1bMVd3Xi0TDNjyeYuLJ0wcKljPX5gUxTRunDkg7i7CehUNBI0s
	HLDJBsO2GL3YvBSXIXBnNCjup9J8UItVT8zUicXV2XPToO9wzxpYYMLFhEIWs1Ei
	XoDvCQKlsNsDUNRYaKKDri+yTHWPpncnZXQByHItDE/ojZjMVkCDPd3V/Aqq5qjl
	M98FebJsDaJrLjG1S1Y7OPWFP14URmD8KIZ/8wtPikyOu4OtH505Bv045+HqNc9q
	B9/eKw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgdwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:44 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8490a7d657cso3386250a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616164; x=1794220964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
        b=Xf12DpO/kZnRBRN6AvepZsRZ1jR8MM1mU25GW4EmDi9jXmDRCIjQ9OUqewn+Ed9eLH
         AofgjgE6gaWzpmJgLYm+rJVZ91a9PkOXl1wCWzcLetcNKz8UvXAyM90yVpSkgV3IDx9k
         OFrNXVuJEIh8i16uJL9cUW2KxDlFWLR84fB2G8sEPD23vLsGUYa2+wC8XG+dNWCo9GQz
         DTJH1n04nk8bbnzn1kJ60xsESSSEXLN5dK88jb14XT/ljJdA7OkGhSy4+tmosEbdk3hT
         lKxExi1aWstqtPiK4Vfq1PEyPscj55yiEtE7y341dSZyOZUGWwnGV2k7WpDCRuK3znJy
         QO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616164; x=1794220964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
        b=yDTHIjQDx9ZZpeWKuwyG+cpsx54sjuGwzuC2guNGdwI1b1nxcwX/IN0VFXmWEmbXoK
         Es8zq5Q3gkKiAK8YpkxQ/XkBjv4IEBpCrZgEriB025E9m3prKuwpQetEP6FwEi2ka31p
         yqI4b7Ca4D3m9AT/MZV8UY6MPSSqM/D52KXlglUmYKUoRh6mAiqgTqPnI4nQ4G7Cmlhf
         5ndIvI0J7FwvmlLwh+5eAFaNBSqM4fTmc4ZBDDOKoe0V40s7L1NapTclZiTjnzjsdmIU
         DBEsX8jnnXoS7QP19tm//kJ4b5cjsnqhh7Xp4NZO2djHPWtgqmglSFGrc8sxmknW07fH
         OVDw==
X-Forwarded-Encrypted: i=1; AKwUvByLJh8z4KPDFdOAO6+HKWcdxa9c57tLK4vTviGH0zx9OC+WFyanW7I+PICBwEdyAxj2Iy9FnT1bR3ifuDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZXSIO+B05ORdcON/K7sA9YojeJ6p7JuYUN/O6JCQrT4pjSbml
	PYyyrzcVtWt8LVmGnYnZEL3OAjuPGFIbcUdBQSXP+Tjfna5i5Dx7m/CenIHHM+LTZdab6iLiPVD
	fAiWH/M6iS76mCDUs0meJWTPVumJjrO8dSjElOgV2MDWcf6VC1H/iFH2rmdh8kMAjsfo=
X-Gm-Gg: AYBFou3i9NjA5Ivof7vszoTbacOoKKm4l3mWXB6btaB4H0jBI/rLPfRv3U1oagU1V6U
	AwUwUpwGL7gjHdm6bM6l8yo1v4T576BTT/UOY2F4fDyV12drWzw7417RjgzbC2MvEKkSqlTD4Sl
	ckWCj1mfnteOX2MAo5Z5EoTWEk2P7AKXEiUbAhP1dEFpKVXJ/GYXkKbOuF60u2hwunCsyL+PBWn
	27jzJrQwJi4kPm5CXLWQoccR1gOosQNrRPjeVohmbvPV4/9FcUDsGf/hicAEy3BAkwdj1+t52IK
	enN2jNSc8/KLz2yLmiKt86ykz0FE1C/cS9ndUDTnnmpYbO5NKGLZNRqAvMC6MVtm6EfYXnKY9yn
	CW84LSfr+eOCd2d3fUdDvOwMhoM+gb1XOD/+REFyy3z7f5pDIT9Kf2Qfj/6lmwtO2wuAuQUeRf8
	ER2EtrjVASvYyjp8c7gXKgu664b6xPuJB8yhPqZS1fWr66dnwmrgVc/TmXP4s=
X-Received: by 2002:a05:6808:bc1:b0:53c:156b:a16d with SMTP id 5614622812f47-5640de7bd03mr6296057b6e.56.1793616163648;
        Mon, 02 Nov 2026 02:42:43 -0800 (PST)
X-Received: by 2002:a05:6808:bc1:b0:53c:156b:a16d with SMTP id 5614622812f47-5640de7bd03mr6296049b6e.56.1793616163284;
        Mon, 02 Nov 2026 02:42:43 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:42 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:22 -0800
Subject: [PATCH v24 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261102-kaanapali-camss-v24-14-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86924 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8_DlIOo40D_9WoOrjau90-UFDwBnAo1x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX6BmKTCUUd8Tz
 MZSOduqNAAlSq2pB2rp+N7M3K/Jcy+yoNTu2NEKpsvxUU2WKz8xdtUuAw/bZb/ki40zTqvSGB+p
 lOT9A67ga0M9q3kobQ1hdIlgoQ0Ogig=
X-Proofpoint-ORIG-GUID: 8_DlIOo40D_9WoOrjau90-UFDwBnAo1x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX6PH5s8TtEler
 Mv25VE7nKOaruDkzTVEBKBirDQ6nUCBEVqTL/goit3pHdR7kaU0ZgXQeFPCRYxvIDP3xaAmZOgU
 hrgRkFr5zB5n+JjHA/emLMssG5Q7XaLmIkw5K1CWbWINhYasOVaq709TQWK+djjOk3sRqosnLRE
 xaP76QshTcQWJEfa2hH7N3KDA/Ov/1XvKCo0M7OF/SXhW5vEiBCHqxY3gz5Q6HPRtKDLBwTzgDF
 uAwZiAld4uxVlkBxiWcgvuXnEeQuYV4t5omfz1a6ZeFM1Fq67/pQszmHniMPbcSNcfMB6D549K7
 IHfQo7kPGJEIlqYcUHfmDCpo5OeB38mQfsK9Grxa4HuXrDUfIFlgkA43gWle9aKobLeadtnJefL
 xyVA8EP5dr5QULuJY1SeN7GNzOhH0eXJE72QkCt55xXo6etmNEjxnNoRYeCuZG2+vZ2NH7Q6D+P
 VIstC2wZrgozAbCN64A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index fbd65c2ad95e..cf43cb8351ed 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4645,6 +4645,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

