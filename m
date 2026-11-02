Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612886;
	b=jCRLp7UYDKlgPZ6vI7IVV3YAgF3+uaNP00daDZMRZSsueiqSUP19HuapGChHGo9iXcaa
	 FQSnqgQrpUI1CCDzdjEOq3A5+YBlud7fUlCRKy/X85+J7XxYSGxTkagtVS2Gu53C0uO/o
	 A/4I3eCLRdL8UlHDw0FeUbuMpb/mf31S2aEgDxwX9UJk337R7tMI83ggQ/5TXSzOJ5n3+
	 VxoYqCDYKXVg6JSD/UrUY+PSwj0QufUmJ/MQzd0QVrk9F8uRE2MfFk6EuRcQ93zuasEEW
	 yJcoj8co8jYW7NDFxNjxMJXTNHwXORWFL5bLdgAzNbAAHRbhaQYhzssxtzBr/uTkUkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=MLZOopjvF/KcD4nvPkhB7ls1eF/ocln23cUR2jR/TZvNDGSNDfJvASkNRiucEwhqd9d3
	 M4rA2f7gkUvOTI++NaUSWBuLw0VECb/917SCnT2BHNIDiYNA3WicPGpt66eLd9ORLwpE0
	 M2UoKMacP6JICadYnJRE/omjRqsadcKIDsD97bxhVEeVHjlCVWYafGFPiKCE0MpCnZDBP
	 WBx0s7xxDF1KAiIf1+LFWNI+fLslb5TzZW23bZkz6IOB2KFvxhpq+eTNEEDu5h6960BVX
	 84d9KRxh2PAKNIkE7+K4jlSmw9l8UVQHCUI8W4Giw2/Intd2/adlI7pUjShvapzR6jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGRk0PUw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHgVmN9+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1B606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA1B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGRk0PUw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHgVmN9+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AIeQ2880814
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=EGRk0PUwlYLATkc6
	inuDWGTCv+5a7aJVbA4ChuyMdjE/YZYmbLyR6AE5kDMoE9BOj/Bw8UzdIpfR88EK
	iH1A4N5ZRWPTO1lgS559yHa/F40mAQiI/mJV0wTVQZRSVT/EgQ0XCepjm2pVC4PH
	gUhiN3hw9SDr3udADTbD2yqtc3jilFY0K0EW4rjPyPwzvXTpZnuUsGxCfZd8sgBd
	f9u4/yoNRwvmxnkn81tqokqBrtjtDdT1djJHIo3faDQle598G1apcTxHfaYCURUQ
	9PVk2szIsp1sJVkDkbMPS88R6oSfplZhAaibVnp6uBFM6Xvk3LTZCCLuNMLXPoTD
	DGoUYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg72u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:48:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so2937554a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612884; x=1794217684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=AHgVmN9+Q4WjWhDE1vNCwLFIDJabGLqJp+/MiQlPQDnM3SlffQDI8Tm/NXURBFCwHh
         vgoSR8h5bmHkJxKnhQlgyCEr2NAvmeUgzZHIJWJhj6U1W8Agh55bW2cUyq1cL+7lRgUh
         5lEdRI9/AZF4Tzu4+aZTuRAAq6pmm5R+UhrS8hwJDHSltmvc5UgjrekgHrTvgMxIwaFa
         35kTPF9ggK9lxLXLmbmQWpqRD9A9/CLwNY4XhNGv92pbklTZbhu4xpqG0WGG/dU4VJq9
         1j9YpeNaEnnqlt1MQDSVwhQiMt32fcBu0LJbT0j+QyJ3I95jFqJgeCa2ASxSE0yuARzs
         pu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612884; x=1794217684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=G8CRf0qjiJaqkMFfG8xQ1Hcq9yIy8STtlDAJCPsnlbIAg5GXPuHXYxku3Cd8RpSYii
         NI3PCUVsvb/79v/qkPnB2GwKTFRzBpqgZcLrL8jhhitp5PWU4qzmFAYO4h2JlTBrQAhq
         bVuehMxRqHLVt/cXOdaM8yhHLzZ2O6sZI9czDMGGq+iQa7XGSQBjA9gVXUZqrKkw/6Z7
         fhgxriDj2wU0f39BVhAOK9uyUtF0n8K5hBmvy1uxvperdhpyxQrord2bhqUTbyZWKMLg
         +EK69nhrYLEDtV36HXuusUADpYcyOWIk2fX+eii71M01MREkg+Hz3IzU8TmUnhzJp1gG
         WKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5XtWhjQXgtM6LGX5EdUV2O0zQNx6n9Cv/iIUqi+iw0+qaZ6yShJXOMSkykWwTOxjgltpE7BmwPDvscxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QDbPFK9AIXdEivYU7KDOmcqHaRgo37E+ArBhEK9lYjlhr/fev
	QoY8SabjLr9Bm/kJieYkfmxQ41EQ7gi6hBXRS9fOm7PX6R7NkCySUvR459i0V3ufP+8dxXm5HEp
	sa5zdXgLSMWrXQTOe9gDWceZ9hPN1KoeHSqOowHeawapdaL+hSHlxW/J5tfUknXSTPUw=
X-Gm-Gg: AYBFou1JfwPFa7u9l8GuoGkh9TVkZq5nlaKmFeyfiMWy/CYAi9IYfIAqmHqO4nPDZY6
	6B16Ffj6Zq6k3pv0kM+hXFbKnsPSBvZUpo9hB+zWO0ZXCN15SfVVW8v/15crKFtv7vhRoUF7CX2
	acLexSPItQjCEdkhLjLsLDxmgmf3q7Toop/TzQLDqIvXh+2y4YyOE76N0wESSwjr4Ry/GNVP61S
	XnxoDZ7rAQN39PxP5mjmt3ezd+6kUanjWJPQETSDfHoyBLcmvSKV/w8vS9pxQt+IorAJGX739wL
	440cHcmU5fz8VUYWnDk14LfKWWoPLmotA0oyqwnFTBn1ao1Fxjs6SbEK3lmStAiNOZVNbkFDfPA
	ZU9E1RMJOSb97HeNR/dW6SUL73HkJVjVnx5reqZutwwE+Zwv9gseMsq42GXTCCNctNq8mZT6PGl
	hWSSgdpifEcOPhEn+1057fklahlgDNZKeYi2I=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5382310a91.26.1793612884079;
        Mon, 02 Nov 2026 01:48:04 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5382305a91.26.1793612883592;
        Mon, 02 Nov 2026 01:48:03 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:48:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:36 +0800
Subject: [PATCH v21 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-8-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612831; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=YVXq7+0T5BuSCdV213rRQvJ4+GN2bAvUYub9zWuGive23qGSHFZbkQDtYyZzBpQgtwIIHF/Td
 +35EmNPqL5PApKkGK0WqAbW5yI7cW0wAAWzpo5mZfP4G68dKcWDZtIX
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae85c54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xMjeOBObfecWdN-3Env_IspMbAYFWGmL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX32AmCs5MKK2w
 Zm4n13/HnaYKIoVXYqJXc6Pe5ZxSsqjo+C/Z8v8sZX52Tgn4/0g66CD8x/3JS0AhLkSfqUt5gjn
 QRpmSr53MuI7rDb1HgQvyWf3G2HYc+s=
X-Proofpoint-ORIG-GUID: xMjeOBObfecWdN-3Env_IspMbAYFWGmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX4ptofr+Df6kP
 8e/5ZLotGiq8l76CX1MRlP9N4HLnn9PLiHpthvu+LjpEbvh8K/gDTvwfB5mcHUSpFUNTdgInI6l
 Z5KhTvKKseNtIMs+Yj35nGGeRs2hbm6qnUYEwk4NXcgXeeqG5knCS/v2jm2Bm+rkj2QxzhaOZ1K
 6P+rJiKmjDl/2uj8tGOXZsq/tWgk+l4OwE++z+DQIZ+C3icT7LDDRvRyVgJP3XiChdphHb7RngP
 hV95O9ieQfOxDxF/HyCpBtuYkPIQFhtU1wx3Q43p3In1Z6m43gYSD9I3qoc1P9E+0C4oxG1zMIj
 hpVMh3JWNy6WEsdUJFGK/0yK8f/gPTOS4joHi5mhiLTw5wXMDfSoBuvDESeCNZyQ2MTn/GeLEFC
 qpBpwKFKvRYov5H6RvEkqW+Q6dFccmOIaSCodImqlbqfRiVVeow0Ii116/Qr0vvi0VV7yTWxpp5
 yJ+pMYd7m/uymHOfo7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038

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

