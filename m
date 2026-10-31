Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452261;
	b=z3djBuvYChA78JZnxbQgyHlNFabuE/EiXdQtynwYvT9j+mhmWcx6rirKqlvnjCl8ghTQ
	 AGMIc6YSFKwOuQhPpHGmLD1e5RMz3GZPgLVxjAEHeSjIEqNI5pbkzFTmDNTPO1vn0EtXY
	 YwVpbZxHs6ftpIqQkiquOHghQJKet2N8TAV0gP/OAXPWZn2AIdhV2vm2RA5RA5JUMNM6A
	 crp+RMf1Eep7/2bzn0sI9cStR2HNvvCqMxi6QVodVuO4gIKGd7l/HIBAYNpg6sxh8uvJv
	 Nu1ZWpAzszulYBLI/0yhPKdR2UXdXxbkJ/eqHVV2nstMXW1Uzim0GFHCxxN6/uIxVwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FN5kU6oTioq9bW3byJMj7ckiOeO0+wc8DN3aRibQaBM=;
	b=BidceTsCbghK6cUEyAqV17lhsWVJnp6ay0RYaZYO2jEQdq4Di7pyVC0WBB7IgskWpHAt
	 dj+P4mRIPoQ3gyIfDthh5AW+XduYhUO7+hSqDOnvu0j0GnEbLXf1fqQ53sQi3vqATYleT
	 /XB1EnnCWrXt8S+JxSjjb+wUTeFRDQoipZh9EXOvuleEwqWZWqjeZxu9IxdJAjw3FstB5
	 M5WlJz+8ezMujH6DhPuaw/HW7cgDKASpenh3bIJ/tqXDmyWYJEvEc0yQzlBwvVs0Km91M
	 X9oBw9C1hSkL5HwWvoWUCrJQyhNDIg8PoswCwSnavsMVkht8EzddFBwW/y8LtPt1U3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSBpY0LI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PqsVWoJa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00C606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F00C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSBpY0LI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PqsVWoJa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxwKZ2161161
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FN5kU6oTioq
	9bW3byJMj7ckiOeO0+wc8DN3aRibQaBM=; b=lSBpY0LI1Wu9AdHjmXG33XNieDQ
	rEs0iirMpaqv/vc9ZVJAiQPtyTaVCwTYrsKkAxqVbZ2nJtI/bTm6c9fUZgnERKfE
	KAOYPbqPghwauXP2nqSQEu+skvRJoy2q4ODwpb5K8MbGUQFuqofSL368pWPgmZKm
	o4HT553FjvI+GrjNvgHQ70H1Cs1hxjxZml9R1oXnwVsfMSABz/yDdGr3Lit+na+t
	gVpG95IotUDidM69zVilmX6CnDYv0ZcrkrIS8Zv3AlPt5JkAyt1hWzFa+3Bi+3rF
	eVQO+VnZClhomwAeaBJj1r7kyAsu5I5fdSpa0k5JNUzfQ4UF3G6v4bwMq9A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2s63j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:10:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so6897434eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452259; x=1794057059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FN5kU6oTioq9bW3byJMj7ckiOeO0+wc8DN3aRibQaBM=;
        b=PqsVWoJaPA6kqArxt70IuLt9J6u40auWla9DYIpqfwT2nvvzVoVq8uEE1CtT77/tn7
         YmAfylK42G5SEMFTdVw2OZFsq7zeLZqiif+opvbdaGRGeGOyTQQojFzEeIWxLfT/9uPQ
         37b3PhdudwoPRtSS2neMc0rVx/Rw2dfkxzKGfqgfxt8qaVR5jjMkJXmCkposodwcxCHA
         YNbMQ7jAydD+c0JlsmGV5KAuWzYkfe/GpT0hOofrvzmG/GJxeOz2HR0srkwG8zDEbBE5
         Y0c/dViGDXI/R8T/Q/58RpORB4Sd1USJZdXJn/eIBWQCh+riT9hNV2fWjztNN+CJQkfd
         nmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452259; x=1794057059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FN5kU6oTioq9bW3byJMj7ckiOeO0+wc8DN3aRibQaBM=;
        b=e4ouVRJiWuJ5Eue77e8kOYDkuVfl+NISzEsTVmiAgWK/4cR4ZoJNOi7xsilyT/MtfY
         BGA433dokuVXu5jYnQOgGxqaHhJ9Hlau+Rrm4S3b/yVO9pS/KMNgeQ0QFrrU/vjF5Qkt
         qmNW4Eb5a5g2vxTeeMKzKSmyF7XyfMmnM0PgNfqaodlcdyY/dJ49jNyv+H4T/58rrZxW
         fnduSFvGIp+fi/QLt+vcCCUufxbcZs5b6rK+Q7E5KWyFcvWHhozy9ACuyGO8fY6t9zVR
         zTNhCykOqWqJ6gIykipmPJb2Vd96MZYUlHXHKzeB9DvVAS9IpzFhIXgjTMr6NvdJuALx
         J1Og==
X-Forwarded-Encrypted: i=1; AKwUvBwwEzffhgZSGRoO7+7rfp4Jk+GscbDaJJglo8YidElK0RxER61ZN2f822tdj30/oAzfehAiNBFFHGwNMi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn/EbMB9OJfyd6ekk4LQTiBVNDwa4I5kZD5Pi5HfWIjlqCecw+
	6HzskVZFZ08XUyXoT8hBaEPe7V5omUavRllw/02PenhntSB139XKdkb3fsIxhh33pDxfqacv1G4
	d2LgRF9C8T4wluMfThfQ9dS3niST9CBngrAVk8yqn8nXCTL+WzdPAgl9o5YhyYdDfLIs=
X-Gm-Gg: AYBFou3+FTeyNZ4JCIolZcxsvQZkVW6pwaPe9YkZt1Mbne8/gL/lL9HTWZyqqz6AlpP
	CL0NQ0/b6FnVPZ2fMViVViagmvqnlNhfwys7PwydOBcELUo3UkA50vJ+PUNwqOBPeMsz2K/VWsS
	Gksz6DRAGo6zl1a0kFb7AEtoN7iPvP0V+IgDG5xM0hnC8cSF0e8EzJcduBRUnE/IEY4kt5n2bLi
	2+ZrMeti1jszKxTKLZnWxYGt8zws69Yijm9swEBBqvv5j+17ENushPWt5oihh9UDDofwMS8qGAw
	VXNCUf9bCLO6OaTM9OUpQlpJKhDmZndk+++rFPB7/qFrB1Pvl0OWi+jE7SJN7LpNALkixcX6KYu
	9ICPgywa1DFnYzs30fgECWgDu0q/kZ0AdylHit0Yrg2yhGy0sDdYZe9MxLctSE1bfg3itX5mbLP
	0kBqTfsiGodRe0/s56SzpDymXWsrjnEuhP
X-Received: by 2002:a05:701b:42c2:10b0:185:1640:5536 with SMTP id a92af1059eb24-1ac5ab52fa9mr7841617c88.19.1793452258504;
        Sat, 31 Oct 2026 06:10:58 -0700 (PDT)
X-Received: by 2002:a05:701b:42c2:10b0:185:1640:5536 with SMTP id a92af1059eb24-1ac5ab52fa9mr7841567c88.19.1793452257680;
        Sat, 31 Oct 2026 06:10:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:10:57 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/6] arm64: dts: qcom: lemans: Move pinctrl states into lemans-embedded.dtsi
Date: Sat, 31 Oct 2026 21:10:38 +0800
Message-ID: <20261031131042.1200862-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: A2vUkdr18X4XokKWL9B38Db93pfl64wG
X-Proofpoint-ORIG-GUID: A2vUkdr18X4XokKWL9B38Db93pfl64wG
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae5e8e3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8rxlO3qUXUvb7ns18uEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX7ZM1nmB5iVko
 0DzBT8CKkwdMX1hZDjJJfiw51I18bpz8fIFffuEsbjIL1FijOOy9ycq6q39isy3HeSs8NtYMEGG
 S0UaJyJbns63g8evkZL/DLcsBH4ZVjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfXxBlxGTD+a0te
 1FT8NUvwKD4nNzZv8WePU7g58RYQ8jDOmzwDjuW+fsKLLqzEpKrP8SofevKInAwPULJhDlkntgd
 VHyZJxzQGJX5ihrcRCgazQJbYO2lzRnytbU/tKkH2RibCknOqB8FMEoWrRs8lpqUm6CHIFkqZMy
 iafV9YXZJsQmrP9fRhgpQOlyCX7NN114hrprGmAnDkp2yg5wn2jWIq3KJomAw2Qtpql9/E6zWx7
 5PXEG3ZUgS8VIxhS/BbWN+F1HC7vD9Mrg4Lr2mCw8Fhe2Bsn+0JAftvpK//D65kt3Z3rneNPl0i
 Egor6HPjsruZ89+3XHIzJbTHoQDr0LgXSrAp2qY4Nd0B9pb0ZqtabiGJTjXcxpWd00ffFVcRaEO
 ztlByFww66WMM6CNGwieYRvy7EDmfj9ljiQlg2JWn3J3SupISjWoRoOal8v2mLd9aIEHgDt5c2M
 31Td+lY0xrI3s9JHpAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

The lemans.dtsi will become a base devicetree shared by all Lemans
series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
they are used by Embedded variant (IQ9/SA8775P) only.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 808 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 806 -----------------
 2 files changed, 808 insertions(+), 806 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 80d8c75e4895..107db7a74756 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -4,3 +4,811 @@
  */
 
 #include "lemans.dtsi"
+
+&tlmm {
+	dp0_hot_plug_det: dp0-hot-plug-det-state {
+		pins = "gpio101";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	dp1_hot_plug_det: dp1-hot-plug-det-state {
+		pins = "gpio102";
+		function = "edp1_hot";
+		bias-disable;
+	};
+
+	hs0_mi2s_active: hs0-mi2s-active-state {
+		pins = "gpio114", "gpio115", "gpio116", "gpio117";
+		function = "hs0_mi2s";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	hs2_mi2s_active: hs2-mi2s-active-state {
+		pins = "gpio122", "gpio123", "gpio124", "gpio125";
+		function = "hs2_mi2s";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	cci0_0_default: cci0-0-default-state {
+		pins = "gpio60", "gpio61";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci0_0_sleep: cci0-0-sleep-state {
+		pins = "gpio60", "gpio61";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci0_1_default: cci0-1-default-state {
+		pins = "gpio52", "gpio53";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci0_1_sleep: cci0-1-sleep-state {
+		pins = "gpio52", "gpio53";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci1_0_default: cci1-0-default-state {
+		pins = "gpio62", "gpio63";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci1_0_sleep: cci1-0-sleep-state {
+		pins = "gpio62", "gpio63";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci1_1_default: cci1-1-default-state {
+		pins = "gpio54", "gpio55";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci1_1_sleep: cci1-1-sleep-state {
+		pins = "gpio54", "gpio55";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci2_0_default: cci2-0-default-state {
+		pins = "gpio64", "gpio65";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci2_0_sleep: cci2-0-sleep-state {
+		pins = "gpio64", "gpio65";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci2_1_default: cci2-1-default-state {
+		pins = "gpio56", "gpio57";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci2_1_sleep: cci2-1-sleep-state {
+		pins = "gpio56", "gpio57";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci3_0_default: cci3-0-default-state {
+		pins = "gpio66", "gpio67";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci3_0_sleep: cci3-0-sleep-state {
+		pins = "gpio66", "gpio67";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci3_1_default: cci3-1-default-state {
+		pins = "gpio58", "gpio59";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci3_1_sleep: cci3-1-sleep-state {
+		pins = "gpio58", "gpio59";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	qup_i2c0_default: qup-i2c0-state {
+		pins = "gpio20", "gpio21";
+		function = "qup0_se0";
+	};
+
+	qup_i2c1_default: qup-i2c1-state {
+		pins = "gpio24", "gpio25";
+		function = "qup0_se1";
+	};
+
+	qup_i2c2_default: qup-i2c2-state {
+		pins = "gpio36", "gpio37";
+		function = "qup0_se2";
+	};
+
+	qup_i2c3_default: qup-i2c3-state {
+		pins = "gpio28", "gpio29";
+		function = "qup0_se3";
+	};
+
+	qup_i2c4_default: qup-i2c4-state {
+		pins = "gpio32", "gpio33";
+		function = "qup0_se4";
+	};
+
+	qup_i2c5_default: qup-i2c5-state {
+		pins = "gpio36", "gpio37";
+		function = "qup0_se5";
+	};
+
+	qup_i2c7_default: qup-i2c7-state {
+		pins = "gpio40", "gpio41";
+		function = "qup1_se0";
+	};
+
+	qup_i2c8_default: qup-i2c8-state {
+		pins = "gpio42", "gpio43";
+		function = "qup1_se1";
+	};
+
+	qup_i2c9_default: qup-i2c9-state {
+		pins = "gpio46", "gpio47";
+		function = "qup1_se2";
+	};
+
+	qup_i2c10_default: qup-i2c10-state {
+		pins = "gpio44", "gpio45";
+		function = "qup1_se3";
+	};
+
+	qup_i2c11_default: qup-i2c11-state {
+		pins = "gpio48", "gpio49";
+		function = "qup1_se4";
+	};
+
+	qup_i2c12_default: qup-i2c12-state {
+		pins = "gpio52", "gpio53";
+		function = "qup1_se5";
+	};
+
+	qup_i2c13_default: qup-i2c13-state {
+		pins = "gpio56", "gpio57";
+		function = "qup1_se6";
+	};
+
+	qup_i2c14_default: qup-i2c14-state {
+		pins = "gpio80", "gpio81";
+		function = "qup2_se0";
+	};
+
+	qup_i2c15_default: qup-i2c15-state {
+		pins = "gpio84", "gpio85";
+		function = "qup2_se1";
+	};
+
+	qup_i2c16_default: qup-i2c16-state {
+		pins = "gpio86", "gpio87";
+		function = "qup2_se2";
+	};
+
+	qup_i2c17_default: qup-i2c17-state {
+		pins = "gpio91", "gpio92";
+		function = "qup2_se3";
+	};
+
+	qup_i2c18_default: qup-i2c18-state {
+		pins = "gpio95", "gpio96";
+		function = "qup2_se4";
+	};
+
+	qup_i2c19_default: qup-i2c19-state {
+		pins = "gpio99", "gpio100";
+		function = "qup2_se5";
+	};
+
+	qup_i2c20_default: qup-i2c20-state {
+		pins = "gpio97", "gpio98";
+		function = "qup2_se6";
+	};
+
+	qup_i2c21_default: qup-i2c21-state {
+		pins = "gpio13", "gpio14";
+		function = "qup3_se0";
+	};
+
+	qup_spi0_default: qup-spi0-state {
+		pins = "gpio20", "gpio21", "gpio22", "gpio23";
+		function = "qup0_se0";
+	};
+
+	qup_spi1_default: qup-spi1-state {
+		pins = "gpio24", "gpio25", "gpio26", "gpio27";
+		function = "qup0_se1";
+	};
+
+	qup_spi2_default: qup-spi2-state {
+		pins = "gpio36", "gpio37", "gpio38", "gpio39";
+		function = "qup0_se2";
+	};
+
+	qup_spi3_default: qup-spi3-state {
+		pins = "gpio28", "gpio29", "gpio30", "gpio31";
+		function = "qup0_se3";
+	};
+
+	qup_spi4_default: qup-spi4-state {
+		pins = "gpio32", "gpio33", "gpio34", "gpio35";
+		function = "qup0_se4";
+	};
+
+	qup_spi5_default: qup-spi5-state {
+		pins = "gpio36", "gpio37", "gpio38", "gpio39";
+		function = "qup0_se5";
+	};
+
+	qup_spi7_default: qup-spi7-state {
+		pins = "gpio40", "gpio41", "gpio42", "gpio43";
+		function = "qup1_se0";
+	};
+
+	qup_spi8_default: qup-spi8-state {
+		pins = "gpio42", "gpio43", "gpio40", "gpio41";
+		function = "qup1_se1";
+	};
+
+	qup_spi9_default: qup-spi9-state {
+		pins = "gpio46", "gpio47", "gpio44", "gpio45";
+		function = "qup1_se2";
+	};
+
+	qup_spi10_default: qup-spi10-state {
+		pins = "gpio44", "gpio45", "gpio46", "gpio47";
+		function = "qup1_se3";
+	};
+
+	qup_spi11_default: qup-spi11-state {
+		pins = "gpio48", "gpio49", "gpio50", "gpio51";
+		function = "qup1_se4";
+	};
+
+	qup_spi12_default: qup-spi12-state {
+		pins = "gpio52", "gpio53", "gpio54", "gpio55";
+		function = "qup1_se5";
+	};
+
+	qup_spi14_default: qup-spi14-state {
+		pins = "gpio80", "gpio81", "gpio82", "gpio83";
+		function = "qup2_se0";
+	};
+
+	qup_spi15_default: qup-spi15-state {
+		pins = "gpio84", "gpio85", "gpio99", "gpio100";
+		function = "qup2_se1";
+	};
+
+	qup_spi16_default: qup-spi16-state {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		function = "qup2_se2";
+	};
+
+	qup_spi17_default: qup-spi17-state {
+		pins = "gpio91", "gpio92", "gpio93", "gpio94";
+		function = "qup2_se3";
+	};
+
+	qup_spi18_default: qup-spi18-state {
+		pins = "gpio95", "gpio96", "gpio97", "gpio98";
+		function = "qup2_se4";
+	};
+
+	qup_spi19_default: qup-spi19-state {
+		pins = "gpio99", "gpio100", "gpio84", "gpio85";
+		function = "qup2_se5";
+	};
+
+	qup_spi20_default: qup-spi20-state {
+		pins = "gpio97", "gpio98", "gpio95", "gpio96";
+		function = "qup2_se6";
+	};
+
+	qup_spi21_default: qup-spi21-state {
+		pins = "gpio13", "gpio14", "gpio15", "gpio16";
+		function = "qup3_se0";
+	};
+
+	qup_uart0_default: qup-uart0-state {
+		qup_uart0_cts: qup-uart0-cts-pins {
+			pins = "gpio20";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_rts: qup-uart0-rts-pins {
+			pins = "gpio21";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_tx: qup-uart0-tx-pins {
+			pins = "gpio22";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_rx: qup-uart0-rx-pins {
+			pins = "gpio23";
+			function = "qup0_se0";
+		};
+	};
+
+	qup_uart1_default: qup-uart1-state {
+		qup_uart1_cts: qup-uart1-cts-pins {
+			pins = "gpio24";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_rts: qup-uart1-rts-pins {
+			pins = "gpio25";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_tx: qup-uart1-tx-pins {
+			pins = "gpio26";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_rx: qup-uart1-rx-pins {
+			pins = "gpio27";
+			function = "qup0_se1";
+		};
+	};
+
+	qup_uart2_default: qup-uart2-state {
+		qup_uart2_cts: qup-uart2-cts-pins {
+			pins = "gpio36";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_rts: qup-uart2-rts-pins {
+			pins = "gpio37";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_tx: qup-uart2-tx-pins {
+			pins = "gpio38";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_rx: qup-uart2-rx-pins {
+			pins = "gpio39";
+			function = "qup0_se2";
+		};
+	};
+
+	qup_uart3_default: qup-uart3-state {
+		qup_uart3_cts: qup-uart3-cts-pins {
+			pins = "gpio28";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_rts: qup-uart3-rts-pins {
+			pins = "gpio29";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_tx: qup-uart3-tx-pins {
+			pins = "gpio30";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_rx: qup-uart3-rx-pins {
+			pins = "gpio31";
+			function = "qup0_se3";
+		};
+	};
+
+	qup_uart4_default: qup-uart4-state {
+		qup_uart4_cts: qup-uart4-cts-pins {
+			pins = "gpio32";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_rts: qup-uart4-rts-pins {
+			pins = "gpio33";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_tx: qup-uart4-tx-pins {
+			pins = "gpio34";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_rx: qup-uart4-rx-pins {
+			pins = "gpio35";
+			function = "qup0_se4";
+		};
+	};
+
+	qup_uart5_default: qup-uart5-state {
+		qup_uart5_cts: qup-uart5-cts-pins {
+			pins = "gpio36";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_rts: qup-uart5-rts-pins {
+			pins = "gpio37";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_tx: qup-uart5-tx-pins {
+			pins = "gpio38";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_rx: qup-uart5-rx-pins {
+			pins = "gpio39";
+			function = "qup0_se5";
+		};
+	};
+
+	qup_uart7_default: qup-uart7-state {
+		qup_uart7_cts: qup-uart7-cts-pins {
+			pins = "gpio40";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_rts: qup-uart7-rts-pins {
+			pins = "gpio41";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_tx: qup-uart7-tx-pins {
+			pins = "gpio42";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_rx: qup-uart7-rx-pins {
+			pins = "gpio43";
+			function = "qup1_se0";
+		};
+	};
+
+	qup_uart8_default: qup-uart8-state {
+		qup_uart8_cts: qup-uart8-cts-pins {
+			pins = "gpio42";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_rts: qup-uart8-rts-pins {
+			pins = "gpio43";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_tx: qup-uart8-tx-pins {
+			pins = "gpio40";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_rx: qup-uart8-rx-pins {
+			pins = "gpio41";
+			function = "qup1_se1";
+		};
+	};
+
+	qup_uart9_default: qup-uart9-state {
+		qup_uart9_cts: qup-uart9-cts-pins {
+			pins = "gpio46";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_rts: qup-uart9-rts-pins {
+			pins = "gpio47";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_tx: qup-uart9-tx-pins {
+			pins = "gpio44";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_rx: qup-uart9-rx-pins {
+			pins = "gpio45";
+			function = "qup1_se2";
+		};
+	};
+
+	qup_uart10_default: qup-uart10-state {
+		pins = "gpio46", "gpio47";
+		function = "qup1_se3";
+	};
+
+	qup_uart11_default: qup-uart11-state {
+		qup_uart11_cts: qup-uart11-cts-pins {
+			pins = "gpio48";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_rts: qup-uart11-rts-pins {
+			pins = "gpio49";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_tx: qup-uart11-tx-pins {
+			pins = "gpio50";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_rx: qup-uart11-rx-pins {
+			pins = "gpio51";
+			function = "qup1_se4";
+		};
+	};
+
+	qup_uart12_default: qup-uart12-state {
+		qup_uart12_cts: qup-uart12-cts-pins {
+			pins = "gpio52";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_rts: qup-uart12-rts-pins {
+			pins = "gpio53";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_tx: qup-uart12-tx-pins {
+			pins = "gpio54";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_rx: qup-uart12-rx-pins {
+			pins = "gpio55";
+			function = "qup1_se5";
+		};
+	};
+
+	qup_uart14_default: qup-uart14-state {
+		qup_uart14_cts: qup-uart14-cts-pins {
+			pins = "gpio80";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_rts: qup-uart14-rts-pins {
+			pins = "gpio81";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_tx: qup-uart14-tx-pins {
+			pins = "gpio82";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_rx: qup-uart14-rx-pins {
+			pins = "gpio83";
+			function = "qup2_se0";
+		};
+	};
+
+	qup_uart15_default: qup-uart15-state {
+		qup_uart15_cts: qup-uart15-cts-pins {
+			pins = "gpio84";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_rts: qup-uart15-rts-pins {
+			pins = "gpio85";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_tx: qup-uart15-tx-pins {
+			pins = "gpio99";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_rx: qup-uart15-rx-pins {
+			pins = "gpio100";
+			function = "qup2_se1";
+		};
+	};
+
+	qup_uart16_default: qup-uart16-state {
+		qup_uart16_cts: qup-uart16-cts-pins {
+			pins = "gpio86";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_rts: qup-uart16-rts-pins {
+			pins = "gpio87";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_tx: qup-uart16-tx-pins {
+			pins = "gpio88";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_rx: qup-uart16-rx-pins {
+			pins = "gpio89";
+			function = "qup2_se2";
+		};
+	};
+
+	qup_uart17_default: qup-uart17-state {
+		qup_uart17_cts: qup-uart17-cts-pins {
+			pins = "gpio91";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_rts: qup0-uart17-rts-pins {
+			pins = "gpio92";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_tx: qup0-uart17-tx-pins {
+			pins = "gpio93";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_rx: qup0-uart17-rx-pins {
+			pins = "gpio94";
+			function = "qup2_se3";
+		};
+	};
+
+	qup_uart18_default: qup-uart18-state {
+		qup_uart18_cts: qup-uart18-cts-pins {
+			pins = "gpio95";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_rts: qup-uart18-rts-pins {
+			pins = "gpio96";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_tx: qup-uart18-tx-pins {
+			pins = "gpio97";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_rx: qup-uart18-rx-pins {
+			pins = "gpio98";
+			function = "qup2_se4";
+		};
+	};
+
+	qup_uart19_default: qup-uart19-state {
+		qup_uart19_cts: qup-uart19-cts-pins {
+			pins = "gpio99";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_rts: qup-uart19-rts-pins {
+			pins = "gpio100";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_tx: qup-uart19-tx-pins {
+			pins = "gpio84";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_rx: qup-uart19-rx-pins {
+			pins = "gpio85";
+			function = "qup2_se5";
+		};
+	};
+
+	qup_uart20_default: qup-uart20-state {
+		qup_uart20_cts: qup-uart20-cts-pins {
+			pins = "gpio97";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_rts: qup-uart20-rts-pins {
+			pins = "gpio98";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_tx: qup-uart20-tx-pins {
+			pins = "gpio95";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_rx: qup-uart20-rx-pins {
+			pins = "gpio96";
+			function = "qup2_se6";
+		};
+	};
+
+	qup_uart21_default: qup-uart21-state {
+		qup_uart21_cts: qup-uart21-cts-pins {
+			pins = "gpio13";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_rts: qup-uart21-rts-pins {
+			pins = "gpio14";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_tx: qup-uart21-tx-pins {
+			pins = "gpio15";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_rx: qup-uart21-rx-pins {
+			pins = "gpio16";
+			function = "qup3_se0";
+		};
+	};
+
+	sdc_default: sdc-default-state {
+		clk-pins {
+			pins = "sdc1_clk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc1_cmd";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc1_data";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+	};
+
+	sdc_sleep: sdc-sleep-state {
+		clk-pins {
+			pins = "sdc1_clk";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		cmd-pins {
+			pins = "sdc1_cmd";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		data-pins {
+			pins = "sdc1_data";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..7547042d8e85 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6004,812 +6004,6 @@ tlmm: pinctrl@f000000 {
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
-
-			dp0_hot_plug_det: dp0-hot-plug-det-state {
-				pins = "gpio101";
-				function = "edp0_hot";
-				bias-disable;
-			};
-
-			dp1_hot_plug_det: dp1-hot-plug-det-state {
-				pins = "gpio102";
-				function = "edp1_hot";
-				bias-disable;
-			};
-
-			hs0_mi2s_active: hs0-mi2s-active-state {
-				pins = "gpio114", "gpio115", "gpio116", "gpio117";
-				function = "hs0_mi2s";
-				drive-strength = <8>;
-				bias-disable;
-			};
-
-			hs2_mi2s_active: hs2-mi2s-active-state {
-				pins = "gpio122", "gpio123", "gpio124", "gpio125";
-				function = "hs2_mi2s";
-				drive-strength = <8>;
-				bias-disable;
-			};
-
-			cci0_0_default: cci0-0-default-state {
-				pins = "gpio60", "gpio61";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci0_0_sleep: cci0-0-sleep-state {
-				pins = "gpio60", "gpio61";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci0_1_default: cci0-1-default-state {
-				pins = "gpio52", "gpio53";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci0_1_sleep: cci0-1-sleep-state {
-				pins = "gpio52", "gpio53";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci1_0_default: cci1-0-default-state {
-				pins = "gpio62", "gpio63";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci1_0_sleep: cci1-0-sleep-state {
-				pins = "gpio62", "gpio63";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci1_1_default: cci1-1-default-state {
-				pins = "gpio54", "gpio55";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci1_1_sleep: cci1-1-sleep-state {
-				pins = "gpio54", "gpio55";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci2_0_default: cci2-0-default-state {
-				pins = "gpio64", "gpio65";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci2_0_sleep: cci2-0-sleep-state {
-				pins = "gpio64", "gpio65";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci2_1_default: cci2-1-default-state {
-				pins = "gpio56", "gpio57";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci2_1_sleep: cci2-1-sleep-state {
-				pins = "gpio56", "gpio57";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci3_0_default: cci3-0-default-state {
-				pins = "gpio66", "gpio67";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci3_0_sleep: cci3-0-sleep-state {
-				pins = "gpio66", "gpio67";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci3_1_default: cci3-1-default-state {
-				pins = "gpio58", "gpio59";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci3_1_sleep: cci3-1-sleep-state {
-				pins = "gpio58", "gpio59";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			qup_i2c0_default: qup-i2c0-state {
-				pins = "gpio20", "gpio21";
-				function = "qup0_se0";
-			};
-
-			qup_i2c1_default: qup-i2c1-state {
-				pins = "gpio24", "gpio25";
-				function = "qup0_se1";
-			};
-
-			qup_i2c2_default: qup-i2c2-state {
-				pins = "gpio36", "gpio37";
-				function = "qup0_se2";
-			};
-
-			qup_i2c3_default: qup-i2c3-state {
-				pins = "gpio28", "gpio29";
-				function = "qup0_se3";
-			};
-
-			qup_i2c4_default: qup-i2c4-state {
-				pins = "gpio32", "gpio33";
-				function = "qup0_se4";
-			};
-
-			qup_i2c5_default: qup-i2c5-state {
-				pins = "gpio36", "gpio37";
-				function = "qup0_se5";
-			};
-
-			qup_i2c7_default: qup-i2c7-state {
-				pins = "gpio40", "gpio41";
-				function = "qup1_se0";
-			};
-
-			qup_i2c8_default: qup-i2c8-state {
-				pins = "gpio42", "gpio43";
-				function = "qup1_se1";
-			};
-
-			qup_i2c9_default: qup-i2c9-state {
-				pins = "gpio46", "gpio47";
-				function = "qup1_se2";
-			};
-
-			qup_i2c10_default: qup-i2c10-state {
-				pins = "gpio44", "gpio45";
-				function = "qup1_se3";
-			};
-
-			qup_i2c11_default: qup-i2c11-state {
-				pins = "gpio48", "gpio49";
-				function = "qup1_se4";
-			};
-
-			qup_i2c12_default: qup-i2c12-state {
-				pins = "gpio52", "gpio53";
-				function = "qup1_se5";
-			};
-
-			qup_i2c13_default: qup-i2c13-state {
-				pins = "gpio56", "gpio57";
-				function = "qup1_se6";
-			};
-
-			qup_i2c14_default: qup-i2c14-state {
-				pins = "gpio80", "gpio81";
-				function = "qup2_se0";
-			};
-
-			qup_i2c15_default: qup-i2c15-state {
-				pins = "gpio84", "gpio85";
-				function = "qup2_se1";
-			};
-
-			qup_i2c16_default: qup-i2c16-state {
-				pins = "gpio86", "gpio87";
-				function = "qup2_se2";
-			};
-
-			qup_i2c17_default: qup-i2c17-state {
-				pins = "gpio91", "gpio92";
-				function = "qup2_se3";
-			};
-
-			qup_i2c18_default: qup-i2c18-state {
-				pins = "gpio95", "gpio96";
-				function = "qup2_se4";
-			};
-
-			qup_i2c19_default: qup-i2c19-state {
-				pins = "gpio99", "gpio100";
-				function = "qup2_se5";
-			};
-
-			qup_i2c20_default: qup-i2c20-state {
-				pins = "gpio97", "gpio98";
-				function = "qup2_se6";
-			};
-
-			qup_i2c21_default: qup-i2c21-state {
-				pins = "gpio13", "gpio14";
-				function = "qup3_se0";
-			};
-
-			qup_spi0_default: qup-spi0-state {
-				pins = "gpio20", "gpio21", "gpio22", "gpio23";
-				function = "qup0_se0";
-			};
-
-			qup_spi1_default: qup-spi1-state {
-				pins = "gpio24", "gpio25", "gpio26", "gpio27";
-				function = "qup0_se1";
-			};
-
-			qup_spi2_default: qup-spi2-state {
-				pins = "gpio36", "gpio37", "gpio38", "gpio39";
-				function = "qup0_se2";
-			};
-
-			qup_spi3_default: qup-spi3-state {
-				pins = "gpio28", "gpio29", "gpio30", "gpio31";
-				function = "qup0_se3";
-			};
-
-			qup_spi4_default: qup-spi4-state {
-				pins = "gpio32", "gpio33", "gpio34", "gpio35";
-				function = "qup0_se4";
-			};
-
-			qup_spi5_default: qup-spi5-state {
-				pins = "gpio36", "gpio37", "gpio38", "gpio39";
-				function = "qup0_se5";
-			};
-
-			qup_spi7_default: qup-spi7-state {
-				pins = "gpio40", "gpio41", "gpio42", "gpio43";
-				function = "qup1_se0";
-			};
-
-			qup_spi8_default: qup-spi8-state {
-				pins = "gpio42", "gpio43", "gpio40", "gpio41";
-				function = "qup1_se1";
-			};
-
-			qup_spi9_default: qup-spi9-state {
-				pins = "gpio46", "gpio47", "gpio44", "gpio45";
-				function = "qup1_se2";
-			};
-
-			qup_spi10_default: qup-spi10-state {
-				pins = "gpio44", "gpio45", "gpio46", "gpio47";
-				function = "qup1_se3";
-			};
-
-			qup_spi11_default: qup-spi11-state {
-				pins = "gpio48", "gpio49", "gpio50", "gpio51";
-				function = "qup1_se4";
-			};
-
-			qup_spi12_default: qup-spi12-state {
-				pins = "gpio52", "gpio53", "gpio54", "gpio55";
-				function = "qup1_se5";
-			};
-
-			qup_spi14_default: qup-spi14-state {
-				pins = "gpio80", "gpio81", "gpio82", "gpio83";
-				function = "qup2_se0";
-			};
-
-			qup_spi15_default: qup-spi15-state {
-				pins = "gpio84", "gpio85", "gpio99", "gpio100";
-				function = "qup2_se1";
-			};
-
-			qup_spi16_default: qup-spi16-state {
-				pins = "gpio86", "gpio87", "gpio88", "gpio89";
-				function = "qup2_se2";
-			};
-
-			qup_spi17_default: qup-spi17-state {
-				pins = "gpio91", "gpio92", "gpio93", "gpio94";
-				function = "qup2_se3";
-			};
-
-			qup_spi18_default: qup-spi18-state {
-				pins = "gpio95", "gpio96", "gpio97", "gpio98";
-				function = "qup2_se4";
-			};
-
-			qup_spi19_default: qup-spi19-state {
-				pins = "gpio99", "gpio100", "gpio84", "gpio85";
-				function = "qup2_se5";
-			};
-
-			qup_spi20_default: qup-spi20-state {
-				pins = "gpio97", "gpio98", "gpio95", "gpio96";
-				function = "qup2_se6";
-			};
-
-			qup_spi21_default: qup-spi21-state {
-				pins = "gpio13", "gpio14", "gpio15", "gpio16";
-				function = "qup3_se0";
-			};
-
-			qup_uart0_default: qup-uart0-state {
-				qup_uart0_cts: qup-uart0-cts-pins {
-					pins = "gpio20";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_rts: qup-uart0-rts-pins {
-					pins = "gpio21";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_tx: qup-uart0-tx-pins {
-					pins = "gpio22";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_rx: qup-uart0-rx-pins {
-					pins = "gpio23";
-					function = "qup0_se0";
-				};
-			};
-
-			qup_uart1_default: qup-uart1-state {
-				qup_uart1_cts: qup-uart1-cts-pins {
-					pins = "gpio24";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_rts: qup-uart1-rts-pins {
-					pins = "gpio25";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_tx: qup-uart1-tx-pins {
-					pins = "gpio26";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_rx: qup-uart1-rx-pins {
-					pins = "gpio27";
-					function = "qup0_se1";
-				};
-			};
-
-			qup_uart2_default: qup-uart2-state {
-				qup_uart2_cts: qup-uart2-cts-pins {
-					pins = "gpio36";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_rts: qup-uart2-rts-pins {
-					pins = "gpio37";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_tx: qup-uart2-tx-pins {
-					pins = "gpio38";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_rx: qup-uart2-rx-pins {
-					pins = "gpio39";
-					function = "qup0_se2";
-				};
-			};
-
-			qup_uart3_default: qup-uart3-state {
-				qup_uart3_cts: qup-uart3-cts-pins {
-					pins = "gpio28";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_rts: qup-uart3-rts-pins {
-					pins = "gpio29";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_tx: qup-uart3-tx-pins {
-					pins = "gpio30";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_rx: qup-uart3-rx-pins {
-					pins = "gpio31";
-					function = "qup0_se3";
-				};
-			};
-
-			qup_uart4_default: qup-uart4-state {
-				qup_uart4_cts: qup-uart4-cts-pins {
-					pins = "gpio32";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_rts: qup-uart4-rts-pins {
-					pins = "gpio33";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_tx: qup-uart4-tx-pins {
-					pins = "gpio34";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_rx: qup-uart4-rx-pins {
-					pins = "gpio35";
-					function = "qup0_se4";
-				};
-			};
-
-			qup_uart5_default: qup-uart5-state {
-				qup_uart5_cts: qup-uart5-cts-pins {
-					pins = "gpio36";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_rts: qup-uart5-rts-pins {
-					pins = "gpio37";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_tx: qup-uart5-tx-pins {
-					pins = "gpio38";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_rx: qup-uart5-rx-pins {
-					pins = "gpio39";
-					function = "qup0_se5";
-				};
-			};
-
-			qup_uart7_default: qup-uart7-state {
-				qup_uart7_cts: qup-uart7-cts-pins {
-					pins = "gpio40";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_rts: qup-uart7-rts-pins {
-					pins = "gpio41";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_tx: qup-uart7-tx-pins {
-					pins = "gpio42";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_rx: qup-uart7-rx-pins {
-					pins = "gpio43";
-					function = "qup1_se0";
-				};
-			};
-
-			qup_uart8_default: qup-uart8-state {
-				qup_uart8_cts: qup-uart8-cts-pins {
-					pins = "gpio42";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_rts: qup-uart8-rts-pins {
-					pins = "gpio43";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_tx: qup-uart8-tx-pins {
-					pins = "gpio40";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_rx: qup-uart8-rx-pins {
-					pins = "gpio41";
-					function = "qup1_se1";
-				};
-			};
-
-			qup_uart9_default: qup-uart9-state {
-				qup_uart9_cts: qup-uart9-cts-pins {
-					pins = "gpio46";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_rts: qup-uart9-rts-pins {
-					pins = "gpio47";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_tx: qup-uart9-tx-pins {
-					pins = "gpio44";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_rx: qup-uart9-rx-pins {
-					pins = "gpio45";
-					function = "qup1_se2";
-				};
-			};
-
-			qup_uart10_default: qup-uart10-state {
-				pins = "gpio46", "gpio47";
-				function = "qup1_se3";
-			};
-
-			qup_uart11_default: qup-uart11-state {
-				qup_uart11_cts: qup-uart11-cts-pins {
-					pins = "gpio48";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_rts: qup-uart11-rts-pins {
-					pins = "gpio49";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_tx: qup-uart11-tx-pins {
-					pins = "gpio50";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_rx: qup-uart11-rx-pins {
-					pins = "gpio51";
-					function = "qup1_se4";
-				};
-			};
-
-			qup_uart12_default: qup-uart12-state {
-				qup_uart12_cts: qup-uart12-cts-pins {
-					pins = "gpio52";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_rts: qup-uart12-rts-pins {
-					pins = "gpio53";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_tx: qup-uart12-tx-pins {
-					pins = "gpio54";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_rx: qup-uart12-rx-pins {
-					pins = "gpio55";
-					function = "qup1_se5";
-				};
-			};
-
-			qup_uart14_default: qup-uart14-state {
-				qup_uart14_cts: qup-uart14-cts-pins {
-					pins = "gpio80";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_rts: qup-uart14-rts-pins {
-					pins = "gpio81";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_tx: qup-uart14-tx-pins {
-					pins = "gpio82";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_rx: qup-uart14-rx-pins {
-					pins = "gpio83";
-					function = "qup2_se0";
-				};
-			};
-
-			qup_uart15_default: qup-uart15-state {
-				qup_uart15_cts: qup-uart15-cts-pins {
-					pins = "gpio84";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_rts: qup-uart15-rts-pins {
-					pins = "gpio85";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_tx: qup-uart15-tx-pins {
-					pins = "gpio99";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_rx: qup-uart15-rx-pins {
-					pins = "gpio100";
-					function = "qup2_se1";
-				};
-			};
-
-			qup_uart16_default: qup-uart16-state {
-				qup_uart16_cts: qup-uart16-cts-pins {
-					pins = "gpio86";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_rts: qup-uart16-rts-pins {
-					pins = "gpio87";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_tx: qup-uart16-tx-pins {
-					pins = "gpio88";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_rx: qup-uart16-rx-pins {
-					pins = "gpio89";
-					function = "qup2_se2";
-				};
-			};
-
-			qup_uart17_default: qup-uart17-state {
-				qup_uart17_cts: qup-uart17-cts-pins {
-					pins = "gpio91";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_rts: qup0-uart17-rts-pins {
-					pins = "gpio92";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_tx: qup0-uart17-tx-pins {
-					pins = "gpio93";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_rx: qup0-uart17-rx-pins {
-					pins = "gpio94";
-					function = "qup2_se3";
-				};
-			};
-
-			qup_uart18_default: qup-uart18-state {
-				qup_uart18_cts: qup-uart18-cts-pins {
-					pins = "gpio95";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_rts: qup-uart18-rts-pins {
-					pins = "gpio96";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_tx: qup-uart18-tx-pins {
-					pins = "gpio97";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_rx: qup-uart18-rx-pins {
-					pins = "gpio98";
-					function = "qup2_se4";
-				};
-			};
-
-			qup_uart19_default: qup-uart19-state {
-				qup_uart19_cts: qup-uart19-cts-pins {
-					pins = "gpio99";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_rts: qup-uart19-rts-pins {
-					pins = "gpio100";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_tx: qup-uart19-tx-pins {
-					pins = "gpio84";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_rx: qup-uart19-rx-pins {
-					pins = "gpio85";
-					function = "qup2_se5";
-				};
-			};
-
-			qup_uart20_default: qup-uart20-state {
-				qup_uart20_cts: qup-uart20-cts-pins {
-					pins = "gpio97";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_rts: qup-uart20-rts-pins {
-					pins = "gpio98";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_tx: qup-uart20-tx-pins {
-					pins = "gpio95";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_rx: qup-uart20-rx-pins {
-					pins = "gpio96";
-					function = "qup2_se6";
-				};
-			};
-
-			qup_uart21_default: qup-uart21-state {
-				qup_uart21_cts: qup-uart21-cts-pins {
-					pins = "gpio13";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_rts: qup-uart21-rts-pins {
-					pins = "gpio14";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_tx: qup-uart21-tx-pins {
-					pins = "gpio15";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_rx: qup-uart21-rx-pins {
-					pins = "gpio16";
-					function = "qup3_se0";
-				};
-			};
-
-			sdc_default: sdc-default-state {
-				clk-pins {
-					pins = "sdc1_clk";
-					drive-strength = <16>;
-					bias-disable;
-				};
-
-				cmd-pins {
-					pins = "sdc1_cmd";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-
-				data-pins {
-					pins = "sdc1_data";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-			};
-
-			sdc_sleep: sdc-sleep-state {
-				clk-pins {
-					pins = "sdc1_clk";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-
-				cmd-pins {
-					pins = "sdc1_cmd";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-
-				data-pins {
-					pins = "sdc1_data";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-			};
 		};
 
 		sram: sram@146d8000 {
-- 
2.43.0

