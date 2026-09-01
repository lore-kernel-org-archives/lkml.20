Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D3742E42F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250067; cv=none; b=csU1SJIyjfQR+7EdKOmVKo1d/QRofrJoQTHvUWUID27k2Q48Mr4bUPmpML3I/ajbNxf247ESS2jjTq0rRnur2GI5oFc9eaZi51V2h1HeAO4bUkR2MfxLZWk7kgG2/6bdWD8aXogN7qLFHlFkNzxHgWdWs96EAmpet59r5ttbR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250067; c=relaxed/simple;
	bh=08WdFK8UjNwaxYA+Mjac90vOPfMlyu3PjX7RmA7bpP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rE6FTuvdFVZy49xMqJsnSHAgL4kJc4ZyaSdPpIPKL4U2qza8pUTKOl1eFtfa/OktPadLNjK8QBQWrerixumgc/nHnDElEHJI+WnNTI0wHrfDS160l29ZeoaIwseSNZEGK+2bexEMSbv7odiezW2q3+km4D6D5c+sNPi6TG3sZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYcbl1ly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHUuWWL7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYcbl1ly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHUuWWL7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179OJf2321945
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hObe6IJRPL50bbdsgxF23orx/eRcm8Si+sfd1CaAVg=; b=YYcbl1lyVM4NBjzi
	abZ4kGLeYhIEVadjsDmGHg+WHzaDS9T8FqXQJ6MEreIFpewL1PxvD7/i64Y5471G
	Jz2gw2pgQxoKq8Mk1ibig/PCafR3J3BlbeIrVMLtW9IJkUgNgpYJqpvtbcOpSXp6
	oWv1XDXeJA/338wwtHGtDk+eJPrwPwjj5FwKgL4NmEfrpkjl0qUFUc44npdgpKom
	xWRU8qBbxRkFDLONOeF8WtcVg1cu2JoJ+A2xWbwQWHgmVpvJrYobvHjGiuZecwAV
	m2GkcHDZEcbgkcyNArW4V9Ey8jDvdKQiWPooniiiDLK7IuakIeoG/97REbP7LI63
	uusNWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchau2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:07:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9382f9430deso133358385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250062; x=1788854862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hObe6IJRPL50bbdsgxF23orx/eRcm8Si+sfd1CaAVg=;
        b=bHUuWWL7MZa7JxoYWeONNVdvA5sSS+qWNU66QWEAF8l/AnJ+KeILzu/seDIjRz+JRW
         yrINEV39vZWECzOOuLktE82sL8IjwKsfwHB6rH/o4fVtcpY9R54fYxIz8TBwhVTUG+dk
         DKwCppV1ySD2IFQLWj4XH2t7V3xzFFr2Ja5KZgzOD0dTOWbWLK1T4flvYK9QNfYQaLTP
         +LuS1sm8rRCZ7LMUXwS5kCqVyqDT9Ccuakumy8VY5rP38tGyO8sYv+algteeY8pUJwvq
         1LfLEcEpxSIhwK33c8yp4W3zjWAQQ/r6f+64bJBH4fUK9YkYAcOFiy7k+La3YxdwgSag
         jWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250062; x=1788854862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hObe6IJRPL50bbdsgxF23orx/eRcm8Si+sfd1CaAVg=;
        b=oMAM80Jr4jielcdBwQH1ZwKgdjqTLC7ATNKT0dsLVwHAW0tJF5iNlCo/y4F1tHw/53
         l26zGmOuLpRbe3EahYbpSgiYALYQKvgSesbYYlJpgSb8X1zuFjNN6dK2AfVOIGJukT+n
         BGz0MptzHJUiqHmeMs0Rlci9UJJ9QwsIYPNknioTIqznBfI85AgHXYeB05o+QGfzghrC
         Z3u5atzIkx+wlsCRCynKlW0x6MX9V2WF5FAnSvAX6hOdTtNTVx03rAO1XD1WcXG4izRW
         IlyT70OFMV966E837ghNtEYxEVodPQTM0hSNcysoan3F1DSH3aRC0Jg2PjBnp7Eg9d67
         Nz1Q==
X-Forwarded-Encrypted: i=1; AHgh+RozoKYM+ODgl9PoEuf+EZ1KBZkJ9lLco1SUKk1qryPRSkMRYGUfbE19VuwhdWyI9zm3whQyOeHjdcAoluk=@vger.kernel.org
X-Gm-Message-State: AFuF++naXsXH30fap4IDaprotvK6SFypt3b8nSb80uusRDOW2fSXWnnG
	cPfkvCMUQ/EcXs8GfU6LPWGJYeorC0FBU7MZJjORUk/LeDVebOQbEB0kHpPb/CdbqvC+saEsjec
	rH22XKypRUAylATuvwH1JHfh6OUIPHpvxLU5O/DsQ5soXl2ZR2sHZIXs5li8+yQUtTt0=
X-Gm-Gg: AR+sD13Cq9K8ZfXLh05nGUsIz5qqt5B7Dd1l4FQa7MBrcpxYHPwbLsdVpqSAAu3suIw
	RGGq6gyHIJ38bIFs8kjA6eazywJlQErTr3WPaEQdZ+2uw2e1YN3ZBkQ2u+8SEZqTSlfqnHHjDOy
	UwBsu9ICIXIkGiPDyQj83krNK6D77gBKZRqcG/3cZns++xZGYiLNuxIrto0u1bExS+J8pVhiJQ6
	aXulWD3Y1S+HZVhEFlF0tImxnIqxVnWd4wk1Zl9r6LgqOn90uC8V8D0S0INKwaiqV3gne4NE9Ah
	88Tu9TQH6vJQuot7/Fs7OkWag3ll0ZmZOZgQv5s2x2xyBqaQAt2nj/n84XzqaLwK9vQyLo3ZDSz
	tJkqbXC5o
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3313917485a.37.1788250057230;
        Tue, 01 Sep 2026 01:07:37 -0700 (PDT)
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3313871985a.37.1788250052016;
        Tue, 01 Sep 2026 01:07:32 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:06:59 +0300
Subject: [PATCH v2 02/16] arm64: dts: qcom: x1e001de-devkit: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-2-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=08WdFK8UjNwaxYA+Mjac90vOPfMlyu3PjX7RmA7bpP0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloesSkOJyRLq2NTXrr8Os8ygT26cpCUutkudg
 IP763jhZfiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHrAAKCRAbX0TJAJUV
 VubeD/9liQOuSvAKBgq3ZkuJVfk1mWM3zFcEY8PLf+5CWI/k8bkxWqSNzkxhONVMqHENAbNQBWJ
 z5iKmotAcX7Od/I+vWg1zaVU/NTld3QAdGf9KawNMZW7BLAX7wLr5XPRp21TqAKs2xXx8K8HJx+
 WuJwbaptTQi86yYM+XAs7s+VOSt9avkXQnuKQ3pWURQswos2lPbXVb8L3jkPpL/lURE5Rws3t7c
 3ljg02SSYueL5moMBX8qZL/cM3ZIW3I1ZadneLDBcxRwwxoJJij1DIDp5qLorXl3Bl8ZlPzrVkZ
 StZYPXyI0F6ODJkyNMQG3ys7zwt4ZyFIB2wFmzC8jT7VnoZv42OVEycPe0/GFkTg+rCw6DPz8oV
 udgnCynrjnw7fHM/F217ct27JvYTLs4fJl+6WneA6STH0KJlPdJT5lr7R7HkaaCCtfTnwEn95Ru
 R3DZ6mASgdtO60PYq+4QUY7L1dpCN6gLb5fQ89VhUspMZHomHRIVSPOvBv1TBXzuIQhhk7YqMtO
 +mV70kd+YDRHZxvV5Ri5tLZfJfxmWnoouUnvhVKARArhfXgNJk6DjXFXZgV1z/aEA6yoRMv5ydM
 0VpnE6tkIc0uc2k/qeLJM2AqGt+bBglgLjYjwOswmH02pIP8dbOrODsiz3O4fOXKvF+Q5sOqk3x
 as1ZywBKRL/Zc/A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: UpacNCzleqkyl6Qdc5_1y0rP7Yip2ND8
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a9687ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UpacNCzleqkyl6Qdc5_1y0rP7Yip2ND8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX3RP7OsxZHQpV
 eQNJTTkfl2W3cItb9kFWzSNUqqQ5x6lDLuZWmKTgZAz0goscrZTSq5I4c/HScen6og9+QrMiIzu
 vuro+S3LmyqbzVzwn9RRSy3YChEU10g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX2TI7zb7oa9P5
 j0vNIWsbyS+3rOmfoBcjP+/+xPp93E+/Bjc54Uz2Cp1BIn0xcz6/vNAj81pxeUJ+yC7dUGadMHK
 UbLF2mQXtHh+j2YZTwm+4rE83BHqcFu/CYNJ+X5OxQcetRdqwUNxcy6YNI6D6j4RDvn6v6gGjcB
 94yfkzD2c8Vh2qyH565g0gF6FagDJ+RfaEHo3rBtM6JNQjPCCbGFbZIvh41e3xN4AVWBPDEwaVb
 ++Xgk1kB/46kUwmWN95/eIQkY84ZJR/KGK9F2Sxsq34Ks1C5KSUc0Jy7/nVS3+MWi8X7HyoGzm+
 aKrFZPRkyA5nLrG8cbkC1f8KwOCrCu4hn1aN/6M/NRr/F5zF4ByoWHlRRxIUi0hPu5TaSC0WVwI
 F5dQWRd5tgNzCgfgSVu5aBPeP1+6PrPm+YFtwBx50XcD+2gqrdJqVUoE5KaIksgIZw4wWLH+tN1
 Q2x6DGTqnHuUhO6BHbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index be1a8ac8c699..3ba45a7884a2 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1194,7 +1194,8 @@ wcd_tx: codec@0,3 {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
+	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";

-- 
2.54.0

