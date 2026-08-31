Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDF3E00B5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170599; cv=none; b=EZggMQsWzcSYms3mSqkFVbdMX3Frygas3biUAyOpWjL9DbZ7XhV7UUPvV42yiEV55QQxL396ZK8KMfeVazPvxwOppWNjxZBXF8M4O5w6XkdtMs+YKygRBLsXw1TIEtAM6xU6InnfYaj6wWM5L7q4BJ05wGOGrlWdLbUXffauvt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170599; c=relaxed/simple;
	bh=E3Bl7IOJLWC2ncwLiiHDAe5gFUZwRKnRj9M4ZT8jOpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Po66q2Sk5wEOkWK1ZAijFvTUCceNdeFpcxWIBCcag4j3VLidVL+BOzTb7Dz8Efn67RolQLic7ftyV8NDKpVKDn4qNtII4qHnK/5gNsOumzi4tSeJFV2jH0GY8XT0S7ZHTmA1kgb+P1+wkaSwwcVPBAT5rkhi6cbB5nk43t+COsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOerb1an; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOxfTU4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOerb1an";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOxfTU4t"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8fl1L2520270
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=; b=fOerb1and/kf85Cx
	GTjt61gvSOwW8cAkisoDYx8FA/uOWPhGQcC+70l/fmvR1HYC9xSOE0EzbCiqWtki
	BZyli4EKdO3JxjI9BMmYb2mp8ZUsdj52Htk7uiZjSG6WgpPO/BqYQEyyk6P6aWU5
	VdXl8mRQPfTjCQiNRAJxmdGRtqHoSrJyojnkMEfBEbnDgJrrnfshEkk/IaGEpQvB
	+zqG/a0CEgu+qzzaveqgY5IxblEFI00JyQCFAG9gxtkCjAgzmEFzBwpAjmPWqvlF
	cO/1yPsAno2i57ZqndnoSyeodDeoPBKHW8PFba+tiwciEoR5y6ArMGmBPsg4EglR
	aflE6Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6aygabd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:03:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bfabbb06f6so227603e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170596; x=1788775396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=;
        b=WOxfTU4tvj/jjmqH7gR1jaEmcK2BEByyrdCuCO7Yh9LSjyTdGgDOL8a21akEC2Ta8P
         PUQge+FKA86AmoEFmztqhc6M3QBcwu8ntThaqfMpA6vipxe04BddPuuPSJ+iqss99iAS
         Ge/IqOd0gD7IWRGXm+M3Z/FNZ5yNDFLs35mIcvHwmvRBiPRyA65JnSUSZz1FIZfaox1n
         KFQYz8H7xsQByIOhrbRbcBxWnLIzVfpEXMhK+LKm20SCW9DR2r3QdlfK6xgbftCpJwD9
         I2mh8Gk3foAvzK77sV8jNmoTWByfIVbGV1G614g6KvRVusSw+lvtqfNuyisA5Oa7TNob
         +ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170596; x=1788775396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=;
        b=LHZ664jLjs60WBr9sgaRkzYLPzsC5WdCamu3oWv8/ZmTBjsbX5PBk0HhEjnXsYcqt5
         aXw8Jk3eqJex9iNEs4K3CDrxG3M1njaaZm0G21feglrBSpQvp6YuskYFHxOS4SvmTnjo
         QlKTXFN8pImGfyiUCQGCdUh6I3DkJ1W2vBDLcf0TV6XiwXXFKN+agG363NrnCJmVaRvP
         RgwtloQiIPInXSxjR8KTKNa37Nnr8JqDkDwD2E/IX8KcbtpQ0aoFckFLP9MAb7F3OfTK
         W4B+XMwM2Ff28dR3E0HR5FxVrbKul0GCtvtRJtcNum18bsPrMp8f8dSlc0Ik8WxnZomg
         yFZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb7O+NS6+fGCOiYGwwgL4RZj4j9LPvYourHu+nSq0Ar9u8BtfEbdEKVs9DdRqtHVxyxKrQY/Gsop4En+g=@vger.kernel.org
X-Gm-Message-State: AFuF++mXX6v+K4cDh2hFx4aDtQVWpLOvmVneRuFW/itMFFwGZ7V3FN5+
	Eb2cqne3mWyPL11sxd/Hc3hbH3YDCbiEtHdZTxH0FP+ONxPy1IqXPV1ANBmZhCbap1kaWRIN6yD
	MVOBK+gVd7CzguojeXbRcJsYMLKOTohOSrz84oLnFXVOKF+UyTm0d9M09G+KjXE54g6U=
X-Gm-Gg: AR+sD11O5Iouv+kuvRIy0qT5HqN0e9uhSf7zJvOrR92+DIIf08UhpVSCSUmyygI6eSB
	3Tvhwn/JhRDWD7wh/GW5QI56/SsAc+Aa8Hs8UiZ49dKAgTuxOIweBXkL2JsJCOcNuGfv7Dn6+WK
	1dKdxPS169e0Inhmq40beCGPgorpy3eBZy/Gr8qVfNVzHiNqedPWbsZOiS0cOENOhitlKAkj8vt
	jAOpRp9UFjGOyXemoYPjq8DOIKRqGRjWfb61DWcNm1oYjbbmIjUH3m5vbpeusOTr5ZxAa7JeDhG
	XVXkX4xFWDAuQQzM1Hxb0THNDMH6G0GFjJ8OEhwNHZ+40E4T+D/LWTfc4CQ8ZqHDhiMit9Q9RE+
	Of5FCnA==
X-Received: by 2002:a05:6102:2907:b0:782:de7b:eead with SMTP id ada2fe7eead31-785962b3b4fmr7225458137.1.1788170596224;
        Mon, 31 Aug 2026 03:03:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:782:de7b:eead with SMTP id ada2fe7eead31-785962b3b4fmr7225429137.1.1788170595657;
        Mon, 31 Aug 2026 03:03:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:03:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:41 +0300
Subject: [PATCH 1/9] arm64: dts: qcom: x1-crd: Mark the EC reset gpio as
 reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-1-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E3Bl7IOJLWC2ncwLiiHDAe5gFUZwRKnRj9M4ZT8jOpM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAAZIyy7ye6ciOZ+4uJhM3RuNFexVLbi607h
 1ZU3xcKXXOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAAAKCRAbX0TJAJUV
 Vv8VD/9Z5GEo+B9eOGEodRBXir0ytlbuQJSg2gAPlEqbVp7+UthBwuBcwyJsRNQ7wQnwyAow0Bf
 pg0EUHsouEoJ/4wG1KN5kuwRbtLhtidpHAi8mjcUtzeSwVpKoHBBLWpppFwLqrPd5iaE/bB79wi
 PO00TrmIqAobR5kBGFVgBhp+5KAwvxim2mRcfR27C59yB/O7dmbjhCTKyqDXgmcRv+6Og1h5YgL
 qb72j0UY9jIw4GjPBSf+38+f0+FBj8m//qLDTo7q5x6+3/PIiDDUfA/S48XHXWUR3PdPSffk0g3
 oSVMmxkZcgQUUXLibbQ8ZOo7RusmQAgIfGW+njIWiu2BhNBfBkwDP3jws00lgw1xTbilND/uD+i
 E2lpIvxAaXaeTe3kA05ZCePuQTbO15HVe2gFbkpnEyzyRQ9EA4+paqabXpWaseathTPN3NchEY9
 UAfhWEko8xNyyiAqp0oHmmUUfVcMccLz22hPoyro4r5oWSYMW7zLQia2PYzwHhuCxhzr0H9tLma
 D5ri41f35pWU/A58duC9ANHqHUoTz7y31JcXWMthZROaresG9IUdNbvLT0zLNiDVsFFAjvDzqJR
 o4QQ3cZyCglG0aZjJPhkPASCMDDpCtUCscCpcJLOjUlTApb+6Gc+OH+nhEqoX9eNkxOo9qNYH7Q
 qTP/6EijT4sGBoA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX2NF5SNnDD3eA
 WInxacpOXM19fjumNYNZFGw/3Su6QFwug/4tO6QIwYjPdvsjfZxHxTvkR/7xbbjC3cD1yqWCkeQ
 D78ON1rxG1E9O9wQAF2y4G71YIwylw4=
X-Proofpoint-GUID: OW4shaFjtifY0ygsjGyaNYKEUS--5Bub
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a955165 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nR7Le_ho8Ysjy6FeGUUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: OW4shaFjtifY0ygsjGyaNYKEUS--5Bub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXz1vwzkLJmkyC
 vgz5UPQNegaDv1s0h23xERzTAHJdKHQWJFMoUk/wUoVjKpsrc1S1Zc9rVilde2qr8ZgB6KwSnLc
 i9JrT6wdu/13S4QzcdP0e8iWJ1pTNe+D1XlPS+yaT9r7xmstTtVagNunAjwdVJvdVi1KvT+n/j2
 bgc4K2m2Hq93sv2d9kOFWCiWF1OQh8K8OzSN4MfKYWwnTuoML9KpsJICzhWcb9R5qNBNjLPp3hn
 +ocPCUJ6P/YzsqDBoZNpZh9VePK6pmNL5KkqbvsB7Xpnz1z1ydCtC7FAkAAPrs0/F8hAvdSs5lC
 LQpn05RSG1eQmhjvkiwdDBB1yVkSgyO9VOzaeKLVjJil9kME/eTW5ykEgKc/n49NPZBMXrMEJXx
 PLDaW9mJnDoyjNfYpYHDTeX4jOstJ9gwvKOsJ5Au3wvueE1fE2shEIxjbjdOqRqEeVpDgFDumax
 YuQAVzBAkGAaQ2ZuCCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the Embedded Controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985f..d1bed84725e8 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1531,6 +1531,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	ec_int_n_default: ec-int-n-state {

-- 
2.54.0

