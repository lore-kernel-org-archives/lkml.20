Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CEA522EE5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063524; cv=none; b=Mc4MslnDEx5UPPoBEDPMggTqvncYoThHW2EbUlCssXtmztyuQuLpRLUwQabBzflYsNhh1qfkhE8lCFjr/0e33kwQ6u0QuiLq6zscUy10npU3/Yre6hWdq4aolTOCyNNYY5gZWnWXAj/p3ObobJVoF7YGZmLB8bCMCPE9IhvZag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063524; c=relaxed/simple;
	bh=OU5t0isFhdEjZbDP62BfBhb4x+q5Dv6Vy4reHdXUe2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4pltFle8LtYPJJqo2lunmFlIFalXXWAkS5T/B6DsDrvOnc04np1c3nrSAIfNv/ZVnKlJlrVnevx+bIVUv+5np7aKa7fp+xmd/DyjOF3X2r5/lLVG9o1mZzvrBEqY57Z16r0Xvbi/lbd/gRk9uOLUSYB1HLcRBgdXcdGPtxGpRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kybpJ4iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJCoJGSg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kybpJ4iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJCoJGSg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6u6c42165589
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUBRV3U7ejx0DxeLdoe1m1E5NXK3ux+Zx4E9n6Y7+bs=; b=kybpJ4iw7IcxUHrG
	HjZGAZtWaNj9XGUyvhnRlp2fScOmYV1pcGSYTEa3r4p2DrUEsRzRxly7Td5AsYAg
	EF5WHRpbyhxGxTfDWh3xjOeVvfwROngtOwGN7mGPsinYRPyvvNBD1MEfZ9mzzK3w
	R6E2s69m4K0k/TorbtfORqAIrgVZXBSoV89HPvcQM5XCJDCBmNnFbStdHN6Bpkyc
	U7XVh3QaCiGxiCvL06Gl/pZLr1xWQIg3Ziic0w8dCpIFuqB1HUbgEM9QIyapvGrM
	wCfeZ3W8m9/flwbGNGSrAf5iw9eeKxURKaDSMV4xBXHghj3kzQGNvi7dYVbB8zyJ
	PV8FJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetw5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso603482585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063502; x=1790668302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUBRV3U7ejx0DxeLdoe1m1E5NXK3ux+Zx4E9n6Y7+bs=;
        b=IJCoJGSgYSvi5XeGM9DOH+qn9TyNt/AJlIiXbksDywLEyZ8O2vxvImj70MHmOFRlC5
         3TtO/8dQcaPRlDVf/jLsX4e4R6qg0FJn+5FWhVJJ98RPgMoVwG3JdMDFQqc+SVgoIyOL
         Uzkb29flh2E9zpULw+JW6JK+AbyGfFk/eOIdTmt318I9OIlldfEzPsM3bBH6ehnHPobb
         9LnV1cg2pFLSVfD/2snge7TKv10csBvBwiDkHjxXBJjctrDZU8XXkB36jHiMlmi/PntK
         zgArU4jnrEcUxqeux1Qrus/TPQ1JDwxLxl0iZUpgKAOMIhaZrlAxPuBR81d+06unzEDG
         xrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063502; x=1790668302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUBRV3U7ejx0DxeLdoe1m1E5NXK3ux+Zx4E9n6Y7+bs=;
        b=oq2/vdROj90oJD4dnd9ag/YThXJKPOkFhiQ3R/KTQ9LPMuKLvRIL8QfKLEx6Php4pX
         hJjezF2Iesxyiv8LNdbEGNI+pxydyrIWMgjnefzy+JNzTDOycDIFYszWGhU/kezB1dfY
         C86GvZNhdc2z6kx17CONpV/g+WS1bK6OAS7c6QOEJW/ivGC4HOiqy2p0YB82ig6jzeNr
         Zy4W5YHm1TCXeTCleo2EhTMsEBa1ryMdA2sQa5LSPnzwa8PbilrFT+c895sF8o1txXSd
         lIAyHwAxdXhkaYkPbJEkF6Iv7WNqky5vV2Ib3rklmXNK7wrBuYakuAbfrLvI7Q9rdOsu
         LFgw==
X-Forwarded-Encrypted: i=1; AKwUvBw2epHwIadVfXP+63VQaWiZJSzOw/1crkjCdofp3fNeOuYkV5b0GcOZHnHirVWu/r7jnJZn4tXBD1lQk2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mryTOvyjnuok0D6Es70WS9vBlBxYQ+ED5RcshqQKWuwgirRYvW
	wiyO5MlaqfRkoYH0S2eoBFotXwRZw0CaBmRiaTHqUdPe6up17DigQsK+Xs/NT5dxGxRDYQbpkGr
	d+l6bzFdlsH0Hd94RnIx95OW1puWYEc73KOadbiXEqEVwPTxMbHRZX4qIU4c5SejQjhU=
X-Gm-Gg: AYBFou3m+PeJzrUcjnzDrGj8yqPOKFj5SzTVXnbCW81PTYWnHHhAD0xT3zBSGoXcZky
	dUDK0lhD9mjqVkrx2L22VgFwq1FGxTCHK8Z060GbZzEkKa0vSvEneUowLZBtkD7dj4zd7cu177I
	OAvMbPXLAKr8fXsr3QQ1fedWodoz53ArX18GZOiEFybSwze6yP6tdSanHATW2Y20P3EPbhKouSB
	4zx/KP/OvDKrnAKxEVoq3S4WstiQn2DK2s0aOVM+9XYo44hFptTv2Y9VNf1L56O0Bc1SL3TXcQ/
	3SVJY+Y9Ecc6m5duk/AQJR1aAqpTVj1y09aPz6DtVe6q2MvUtLxgSQxaIBPJcmSj3tErSG3xmyo
	ED6QmkVPp
X-Received: by 2002:a05:620a:6f0a:b0:93b:ebd8:9147 with SMTP id af79cd13be357-93c15d9c330mr413956985a.18.1790063502424;
        Tue, 22 Sep 2026 00:51:42 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0a:b0:93b:ebd8:9147 with SMTP id af79cd13be357-93c15d9c330mr413954385a.18.1790063501941;
        Tue, 22 Sep 2026 00:51:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:15 +0300
Subject: [PATCH v3 06/13] arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-6-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OU5t0isFhdEjZbDP62BfBhb4x+q5Dv6Vy4reHdXUe2A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN3hvhZkhelsUN8Sbek9g/PtK+0J88MCCeiL
 C2pkLgunyWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzdwAKCRAbX0TJAJUV
 VhGkD/4gONfw4EzaCRtg2cwXYtw0mqPB0wsaEYnk5Dkkntxs6j0CYhj+QECdrV4sagxD6GcSR9f
 Qq9jsCiO3KaIva5DT70YNVbh9I5SWyYsTpL9kSLux6MK5xnJoO/fW4Z7/ghZ/ZVzd14h1hP4GiB
 Glp/kU6tRNI2Z0jRdGttN3DsouTumndgXKMw661AhvT4Rh50Zrc/+roRNHS5h9ZEsKsb71dQF2v
 D6tY89yYHD5aFDlfbRy3mYWzv15lx0SO68ky4Z6USf4tua5bSnweosgrU4QJdmnk4bCuGZcrllY
 jWSXDo0xNcjqY716r16Wgx9sp3cYuvqUfsJaI9YTL1ZkLlLS+ZLVYQpni4wgV06W9dB2adINNW+
 tjUD41g9E1idYgcewgcTuWsSW776zhH7UC8C2svJ9MCwND2KsDgHJZ5anWMH3b3tmCclLaxFI/h
 FDbqx+jQM1aI7HZ0W23m/rRQOhoUX4qcv8lSbuqdvJnpSshz4klgNi3CHKGVE+HjxkMgyM5hdCk
 Wg4q3oWBivp8bUtYo7w6mPYIMT0hVkEci+KA6HFFQUkBQORuBwK2xG7IhjeflOXXMUTkwmIgTdd
 T0lvmv/GBOFj5VEyaFUSQQC3OoYlfXOHyHGAp9iEJ/bdJ2qmyf0OkipnAyQfli2yKWp4jNyJ8K5
 wqYESuKdjmi6h5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: zFcO2P7eu5_GUa_7BJNnzir6r7p_U0Pv
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2338f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W7BNYNnVXdRFd2eF4HIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zFcO2P7eu5_GUa_7BJNnzir6r7p_U0Pv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX1xO6loB/ZxsZ
 T03wFCLo7JpZ5ehA7N7cIVGicQZhLLFy4q0eQkmUChUoT++e2wlS5J9V3hm55QheavaqoHKdZem
 NfeDbsFgfnoWAXVqEZ6xdTTBRyT0OJxYnxEj/rhPIukxZ/u7q1a1KVXYEbzbQt83YzcMlqSyUSu
 KVS1cxL+cvpcm7/+pQ5eN3RfErCb2Pr5zNfSoOy+ECr0LbrcBFiNP1Q1BA4sxoydA9WbUD2mcv/
 CIvjMi48s9Nl2dOtKrV2A6Keg651oSR1aRaGZ1/iuytUOm71v4X+VvFaAnFBYrUaZ8C+1AStnjK
 BO0I45ksvE7gacyMcf5MXKrTZtI2alN6WvLWfj2vE5+UegyqIyN61drbyG22Y5GoqBQd6I9UE3w
 hN8/q3ZOJ2SdAMlZ+OiLOdnEd6+vQ8E7j2AZ/IZMXjVbnSFJaORKzYURECW2G0EqZ0O+fVdqpv+
 BPhJvL7SRyQDIAc+xDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXxA8Rj8lVXycR
 r96rFFoDt4WYt+aafOFHmfb85wjnY1yUVevBD1SeUo75y0ag2WvxFpLRNdtxRARTzm5LGDMv9af
 Ah+Pi7TMT89tJ7zPGxf6VdWLpNNxdlE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 2692e48537aa..dfd589b17fd3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1371,6 +1371,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

