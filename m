Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4C65237A0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063521; cv=none; b=F8iVYuFGJT78EV/6XNGV9aJ32e8pKETmaoNt4ZNWdZXtJf+i8ALQb7r7ghhzzNCdJzWkr4wudYB4m7x/TgbXcMWiav48ZHAD5Mm8GRTRQJQIiZL4cx/FPKNKOKft4XmRtQzpUkbzAXnbjrBk8Zj++LIPY/iDTkxy8+81L8e3FIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063521; c=relaxed/simple;
	bh=b7ujB/FUBCCNBczDNSDcdkCYyV2RNFwoeFuDMfKZA/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uv6tr3Lkr4LJZYxU8Mws5kNVsuDfN2ji1k3awZ+ok15iLwWTVH+NjLNSfte+/MTHEiudUf4PbYEsBlerwOV5qJowIySO3V/ttBM6b0T8GVcKp9BaQr5jiA7EMPJzmmZyi2FElEslRpgPIE9yQDmtwsepZ5IzESjFjN7l3KJvhMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFoa4/NU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hi3EeQpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFoa4/NU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hi3EeQpy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7C1Uv1980018
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3CG8FZGwsWk/apQfbkKyCcm2F77ug1bPQn48vgPi+aw=; b=iFoa4/NUuozUAs4f
	ddonadivKGmmCwm5MA2fUW/KRrs1OBZn3uRLHsRn5JYfcpMKrbdGiExIM1ep7APs
	eI37YAlxMxxau5z6sj3wswPuIBQWfXfoFUkZPzdQpiXAj1l6e3gngdIVGHqesOal
	m2/aIvl2R9/stPIjzEicOEwK2TkBBhHqJukCMzWSiZJ+wB3RQ9pWAaghNrClxKXq
	cp+IDq1LZb7tZAyZU9OMW7gToeIVXweSicUVWLvXvNOiHyRbWqb/dMVVdMYL4mo5
	uWbUkfn8f3A2wDv2GabSR1Wy2DzJgHvNBlgv/JrXIznQGUPQ79k+n7ondDzsJR1i
	K/Spow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0hq7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bd22160bbso347107685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063500; x=1790668300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CG8FZGwsWk/apQfbkKyCcm2F77ug1bPQn48vgPi+aw=;
        b=hi3EeQpyUhhnXQZdhSxXmiG0CQiZZ0AzabL5Ad48eMYBi8wO6voEThLoUboV2C8ib8
         NnmARQdfpSnfhSFfW/8/ZF931whvCEeYypjtbzmVsmPk7j5x3SmAedEiqRHGSsRNRfR0
         Hjk4/ATKZWwHwsFZ3t/otDceOnsO1qCAowWJjMyFamJ4Syl1Evib2j6gShqVtN/U7ZCV
         mQOjMnQHH264ZFNoq7UD/ADtTpkEM/xJHo4xewLTmPUkmbUmG1IL/ygm/t5GWYyUKVBv
         W5hljgF3jduT2lbUdOXRkevwwNuehUJta/tOQ6ba/Me8Rdpxs+mQKKcloVdqq08PGr28
         ZLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063500; x=1790668300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CG8FZGwsWk/apQfbkKyCcm2F77ug1bPQn48vgPi+aw=;
        b=1Y+ww8HN3+B0mChQA9WBPf2HB56AFtIXWpCZgds7x2txOTXg7E+ztgpSua9ahJSWO4
         24t2eeknmGyIYuQsKkZGu2XFW7mnO19I/TGZsqIhfMbLqA2fQi6eFGTm5rvVExszuGH8
         /RUxvVbfW2d+Dyrhj+h2nH+dX/LXlqGJwryp5FNdankfYvq3YFNkLPaZ42edmUgSoPct
         0FfKMqttle+wlA0PlOXkcWjEtD6KfJRwV4WpvqC6ATnmcTnNWO/htQA0SP154orFPcVf
         sAotLL3OWEFrSMSH7tX8Gz5yqHojmsxUJDEy85XZTrXvV7HF8sw4jZS0NEOwhzCgbr8c
         4kiw==
X-Forwarded-Encrypted: i=1; AKwUvBy+uNT1MxigOpqwl4kZl1ivQem+aOtasbt6t3r3kvhnlnS5dTSlD81dzH64oisTvn7DKyoXYFCfTzYw3xM=@vger.kernel.org
X-Gm-Message-State: AFuF++nW1pHlEY352WSH0YVSmgD6Eq4ZJOoAlkJhTXbqTo8ixwI4Q460
	Mh9EYGx5ZOk50cxDPhKftbE7ios9dLh7T6pNHUB1NuOmMsmONK13zU6z+6bJfpCbjNH7XrfELjt
	sY7aU8FCxQ8K5UiFTzDLvGIVK7kIhKsJbjeuktgAvy3W0AbVyDoc3L/pADch1xVg8FFs=
X-Gm-Gg: AYBFou2pWi9odKPK6w9Hm0i934G0ENpg2lYQeXMS6xRvtZiZ1DKOp0VjkKasjGFoIDm
	I9Y1D8r3/eZQ/jWBuy/OrM8sRniDGPX/Ez/relLdzfxScH78HQcGNlZLVEnuszVe04v2YEDxNon
	oMT4SsplS/MoDI6T4E5tluIr7HxrU+kV7Vz9P9d1CJxWUpJcOQu9LpYdFYWopyWlTKYFRyzi76q
	O2BadCWph32xSU7pU0T53fbFQsCnKAV8Y2MS/vC6ar+X1+iEQ1KRiE0SU4DmdsFwWsqYxgOXwiD
	qYV6LhVHCy2mzzrgYe7q+d8oN9curLKw8K2bNClctNCYiFZ/irIduO7psAJ9hyBBm5Ctb3I44vM
	3zi9NVJQM
X-Received: by 2002:a05:620a:63c6:b0:93b:d79f:d94d with SMTP id af79cd13be357-93c15eebe76mr436992985a.66.1790063500421;
        Tue, 22 Sep 2026 00:51:40 -0700 (PDT)
X-Received: by 2002:a05:620a:63c6:b0:93b:d79f:d94d with SMTP id af79cd13be357-93c15eebe76mr436988785a.66.1790063499894;
        Tue, 22 Sep 2026 00:51:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:14 +0300
Subject: [PATCH v3 05/13] arm64: dts: qcom: honor-magicbook-art-14: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-5-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b7ujB/FUBCCNBczDNSDcdkCYyV2RNFwoeFuDMfKZA/Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN2BhxTI16fI539nCpTFzw96Mxc/agT0JJtg
 /aEbXQAsOmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzdgAKCRAbX0TJAJUV
 Vr4iD/4x2+Cobqn55XpC5Jtj2xHmazDHJRVaEQZlyyukAT38AKCechSwn7EFUTAsSGh5QIGvngK
 CfaBy5UU+Bv/R1KTZKtZGlghA6xtQoGneQB+n1xXO59KhoqikwN0yRHpJNAX/6w1RxIayrlnmUU
 GyD/xLSOmZJN/+39I1kJd3IWLrIq6HlEDRXmvIBbUJdfCDu8rQdgJMKOV5PB1Q6a4sST8v1Y5ac
 2bV9f3s/vR5t762/HkCgaLhVzTcBANlnjwql+utKYD/1jrkC/rIir23PitnxmW9ypmNVIjdk2JB
 +AD9e9G7TuX7UqwNhiGk6sQ4/PgFMpEtkjfeZ/LgFhTOABwMWafdBbkGY9kX2oxOU5nnE/SdYLL
 1fUCHiTMg7waj8voRxJbr2IY6gx0oLoAjljLYBQUwPEoyRNOaY/KsSv802gOj+/XV47gaIw1u3N
 6Lh7yu1c5g8kajTn43Mi4+2CynTV5eFnVtSbbgr8qOaXp86APjA7LoEO6bd8iVf7M4VGYKfa0B6
 WmfhJNQAeBj1VZ9sPAoe0C7sm0AkNc+5xO7JKX4QJtXAueaAMw/OySLDVBDJkF/XmgpDtfoRfIP
 zpBTn0yhoz+IcT/FWUmqbcfybia3DK2kB8By77YFfqRmiRrn0nWjAykLtDZttpedcD5hjsLosoV
 rWuBfhTHb8uvQig==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: TTd_c7HuB1t6gIqaQu2KaiMyzDsc2RHX
X-Proofpoint-GUID: TTd_c7HuB1t6gIqaQu2KaiMyzDsc2RHX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX/a0LKmgoey60
 OHkZlNYizUc/yPRTJZbP1M9yc4ycXGIrgj5Kk3IjIbciG0WfyAFKtXQFYy0GDs/ydDeZsKnD9D7
 T3Ex89eqJ2NZzViN3voQ+fm1j8ueva2ObBnyiyTnP2QKHVyUCyFX+qiBgV1rTDqvzM1z59mL5hH
 cFJCylGcYsEXGCh05mj0tw7urmU6oQqABD9KGErgXwq3W6GsNPZB3+Aduwdw2scJCVNVsWk+DKX
 gPu9jt5duW4nAV5tLqYoRTWNv+yxv2i6Fodmgmi7NHR0gSgmYgNbTZaMmkuehI+VWTbhcI+0Ny2
 UafjZdjMOQNk8Jrmj2Wt+D2ofV7VpHeeYharCyU6PLDkus0flL5JcBqjgt1V10tzgX5UKqotsnX
 cX4lE5fhwtHp5hAmn2Akf2P0d52QvRBDCwf6p6PaaA5fdUksMpRzUriLmbFgiorhjgtHWIUTzO/
 Yyn0F1Fi12EK40sOa5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX9iy4qDrnqdeF
 Z21cWhl9DqS0OJZtgMe+f9yMvbxE2eApKkPQD3XnJYh4GRSPToM64QvvNWRl1VzlVy0TmXmyPN3
 xjYTTjMnPk5WqVBflJB6qrHOwRz3icE=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab2338d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 21b15fa5f8f4 ("arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
index 603f6d7717f3..e5b285b04f53 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
@@ -1089,7 +1089,8 @@ &tcsr {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>; /* SPI (TPM) */
+			       <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	tpad_default: tpad-default-state {
 		pins = "gpio3";

-- 
2.54.0

