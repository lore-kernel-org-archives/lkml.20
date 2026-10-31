Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456729;
	b=Zk07/dZjDFKRbjIXKwMKi12lIQiVcaNKpoK/6KI/HU/KbRSVWGD0ST8xV348aqKAYnwk
	 Mk1JL8y96G7WYuOjzxF+M0EGcANRFbAGe5N5QaE78lhhl1zGmZVCcitnMI/IrmKVK/AOB
	 N7rOD07Ui8Z6Q2sFB/DHziezeyMHK8q31GXjVl3APxrzt1MW+zpJaXyhlJbx4aY9m73yz
	 PmLfe3Y8e9SgkxqSg2RBxXU7dCw9MRsMuoHf4xXuNAPZY6XYlMcqmjHgsovBpegYPRBVN
	 j9NXJ65k2+lT18am6eitd4AUsugvo4U/SvPvML/SIdBYbRbt6EmpMldEaZxKVJCyk7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
	b=cgRwAKJBrmCh/MJFcbM8QyyI4o41LenX1io0End4bqZEGuFYfmutDHFQxvMluF+UW/oE
	 f8ziKmGknPTCL6o4/OtXvzwtLAzJQzzK9TqeMBBK42c1XsNsJIhd5EyTJQW3Q5yefhC0M
	 gAp8iSozw8AYctxAZoVf1FMKLQ2+CXFkd4J9yDHjQhEss5e2xLW8u97xpLLKInZpocg6k
	 257IwbEljvOqPK+duoAR6QgBIAkEZGhCs4TZpmy++Q5y0IpffxpnJE1oGYA5dFS3IzWD5
	 yt9JJ/QY6Kb7vDchA5xgeig+oPc5hUbET0KezWvogXztxPgykqq7PkqPXtTmOHEK1CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LiQeguRt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LySodKSq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FF2606A326
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48FF2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LiQeguRt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LySodKSq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD00nO2202683
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5uJBzesEdn8
	JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=; b=LiQeguRtraozvTWcJG2Lfi4vsn5
	Uzsyy72XxzJUSNOdDh0auoKDMqtlAWcwaJYmwoF8umt1t2+CrCKBCh6rh5SuVJh1
	8I2EJ1WR4M7fQ+7v0/DkAFv1iGTb13vWaMQ5QXHhNAhmmug/S68djh0jhCGo49IB
	k/kkH3tPBiDgPTp3eYGxIhf1HM5CPcvlX0vE2xrJ3KEuOmPgR2gImnHmeoCyunyT
	+Az8YaKG1qAP/flAc9cQ4Hf2PCuN7EvpDnI+KXqzijY1IV/WCdIerki3OW9xDz/f
	DYQE+thPlG0Z6U/txpO3fQoKdEBY7V+QB94SuvFWwGYdT8Xe7pweG5wEZQg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkhmu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so2355132eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456727; x=1794061527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
        b=LySodKSq+22PQBXoo2UsyFDdIxRz2Kg+JR//CanddfCixjoZNyJO5swFEc2Zp+isib
         ffC/Yt1JEZAIaEdhZFtjkvB7VYSuWdm78V8d1krhF6KElSUjQYNrYyXn+tXVimDtqMK+
         PfB7roycmDecfYJl5oTbkVYilHUKczFkZwlEQ1Z0vQs5kFUFquNHspPGUW3JSpUrEEe/
         jJ4edmzMEMD624+wOivKF2tqM/MFF7z2PdtcIpRMIYUFc9N0bAhXrvd1OINzYy+jd2I2
         RgGyJ1aP4Hw865xJtm5BcOPjzp8ScvJwjl8JX7HYFwUiNRHrQ6PjaHgZhMFZIdaw8+y6
         Gq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456727; x=1794061527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
        b=vj72IN0gUuJZUCHZ1NZe3CuIK/gRQg6+3pd0jt7vYsoe83qAn+ZSM2+Gw14EuneNOZ
         8LP4dlMimigSfyNuAES2JBDfkGVdYOKOwIl7zeNztpxv42tku9OPVZeoEQlBq+W5vHX1
         OTLP+uDLua0+i6B5vzwa35oMS8LMPIQSlAaoVL0jtEnw+D+PVU/hJlkhSj97lGS5MDAG
         RRprvRIehHmiTwhV4xyQD0ONdnqB8JIkqhpxy/Hff0XZuU45Otui+fTAUG7I+NGKOw+J
         Sa8Q5HB386AIKRBOluqDKbj+hs264EBJPn5alf8SPaKK74REMTT355njkIVsbIGE/ERt
         YoyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAqJP9X/OsPiME5Fx+vYoJnnamgu/v7QN1p1Y8+vwpOwm5eYHeqkVuQ6M3XSh/4IXAd7WfbbOA3pI80bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5dv6ffYCymt3xblVNPukkzCpFBrg5Z4AQz3OnrKL7/kuP9uPn
	B79JbrRtvEjyxPyxID65Tql4akmT5xYg3DcT3KBdaH6I5yuOOEYahx/hCZipZZ1LWS2O+KTbMuJ
	dhcoAC2YCHUfU3KJ1Jhcd0/gigVXEJnsEtV4AEE5LyUk6677DvxFTTM7oc1gJMsU4qGHL2xRrNn
	bVaQ==
X-Gm-Gg: AYBFou3DBMccq1QfWF1S8TKsAxJwY8HDTIuhFIhvvRzzZZIZGSTsLLWZthGeVlp32Sc
	8LuQkLdt3e7Xx/DuDPLb0+YJLBbUmRQ3IOtL/Lrn2IsT7ZxCb5Q2oW1+m9QKQ+cbLURN0gv5yl2
	gD9Jzc76SRkuQtIt5eWis65gIgEF0p/OXewwHhHecj1sqGmhBDnM3WegYr/cixy76gC4cBPBLZA
	m3trDgmXR1Q//jsItjggIcB5lZiMOoNGg5yKpi9X1XK1ljQlUg963TCNYTYbRylq1SbZNAqBcMc
	duki0wDLJmzXPiNHOq0CNdvz1HPyNuSqiYq0zrKm70ga63sjRR8ivtRR7BIdvBF490esEm8VoUb
	yrp6hYkVqrtC01ZqBauGCaAGkVkPnbpqg0TZJRGZP4y5oQgkU1AaAGzjc4qIiqtX/71pXjHlCSI
	BCHqXEkhqn6cTkWsIKf5g7MrH77zEK2eev
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr7966068eec.34.1793456726941;
        Sat, 31 Oct 2026 07:25:26 -0700 (PDT)
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr7965970eec.34.1793456725286;
        Sat, 31 Oct 2026 07:25:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support
Date: Sat, 31 Oct 2026 22:24:33 +0800
Message-ID: <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: OKGk9g5XfcY9qgbwXvQ53kMtsHc9sIAO
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae5fa58 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=grFeI82b2oVWyHTUkKAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX036LlzszWTQT
 xKnUbDPqou7c+tLnICkQr2sxHoxGB00JlgOV1KVHsGKQTbVLZiVKiTtCJTIbmJRqvCTAfDURlYX
 8yKE2uMXnZaEgS8c9XicgHguG50ta24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX/jc2mIt4+9UW
 Z9FarOHqzHnmv+Ve//KVRfYAja9R1OcGyuKumSHd8/T50CEwRMYugcrRsTtXTxkhIAhr8MYLx78
 /bDcOLxWEMD+pw6KkGYruVhN77xgIelUeNN9gjluYTGy0KQ3T/BxA/FeVy7WRNI1T3vKfCz6NeZ
 pVPI+0y9pOJRvdMdTlkouYCdB8RWg0FJudml17d23m05umqCON7YVAds4teDJxxw9bQtlt3FvWF
 kXwzRflOMFp3niw6OYEgM9lkVqPUPvVnjogtRh1HStIq82zP0G8+iCjPeiTCZ77PTl8PQ8jbab4
 OIwGtUqaCIAhgeYAEO0CfXUE95UCO2pRJS0UI3JLXiCcK9m0lOTyOST5M4FTp1IA+Z4kIVbAZJG
 9oFjmiy92Hvc/chVUJEJ2MQ47Ur5imWakibiXTB1y6CleavihmDMzGhfJhzcNGF34QJx/Mq1YTL
 cRmke3NhXusFSjl9FZg==
X-Proofpoint-ORIG-GUID: OKGk9g5XfcY9qgbwXvQ53kMtsHc9sIAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310057

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
to the WCN7850 PMU and describe the bluetooth node with its supplies.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index b23c1a81a376..827d3ba3a238 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -602,6 +604,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0

