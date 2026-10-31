Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456720;
	b=1MbEWDSZmRiomZotpTPpf5NSUsfX9jkGjTYv6Ob1UXcwG10FVTwmLjZUI8HBMhbBnbjx
	 NXQQjBgMdVFbeFgz96gD7Jnnu9DJcv+1Xy3rYH7dlU0pG1xoyVd2Lc+JIPcBWKBebP3kf
	 18X5zbgQebE0fHm+rN5CMKlsOvO91yTUviL2r+/NpIeIXZTOtr4jzD01vgW+CjkGiZAyn
	 kNlFn4Bqmj9jk7YWck/tavju2O1Sx2nDTY4CtlHO5u3FEVY2BvzyaL0FiLE7IxDzD3SIu
	 9/ZhmWqrxoV9CsdpYLILq1YEUIOsEhwGyy3aYtXMmfAE/AiRWrjzX3GrBjBXmQqmBbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
	b=1zJIN84irgMIwa8/oPQtnY+X53AKeRrNx+NgJmvMHXp5GkH/W3dMQgzz6ekd+nW4q9NX
	 +xP6QwGECeazGQZGyL3tWyT2AGv89J55wtDx7BSML5d24mejxBtDsjxxAKH8ydvq4l9TS
	 ljGtCzR1dVs5oiOkbBq6qipW7LcaNh1hQIhRrO1I6zZMF2WVEdTDjO5fngg8jec7uNUgJ
	 /8bgUr5oI4AMPF6fShqlnchqC0R0C9oCeR3nJdzDY+IqZONlFDzwulMb1xE4ZgJvG4Tqa
	 IWOACU6MXjZpcARwB3BnsVNqukOYmHQ0kSOSgg52Uu88U6rUQ7SpJtLTCFKnEMs6BmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQctlWWM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7rf7ITD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE89B606A325
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE89B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQctlWWM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7rf7ITD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0V5s1233833
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MTyYKP8mHad
	FxUXAd7WDw023+DtOM+dMa5aDUPeX23w=; b=cQctlWWM+R0ZNR8c30zj3PtiggE
	LRH/8C6QkvJC381qRWRhVzuwnTEB9TC4pM+7eUHBJiMxIbaYJCmFo3ZVhRlQH28f
	BWcW+QLFxxSeLkU0DBkHP0TFXWawYWlBYW3adl6zfYMHTLr7p/VP3IclJv4vq/11
	YFZMve1XBx8/l9or/V6Sbv/gCs2AuTPx8/pkCOO7Dq07xH7+ZEYzv9/kiTtGiNko
	/mRMh+UB709DXMudDfEJjv9k+BxDoruxfME9tuCk6IRFeia1+AQiqf7s8ONjue40
	RuDb4hRUEGWwHqwsq6SK2zqNpMpSBXRUt2ObPpSP/jYWNRCQwpMie2vnctw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9938c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso7809325eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456718; x=1794061518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
        b=I7rf7ITDC2rWfESHASUOQMFZIpCJ2g1khqyhhVNDE8PgcyAEDyRFQrdrAQxiQKDCE8
         /ZBxsb7hhDE5cwYzDmFiEPBdRrQ/oaSyJ2pFgC4D4qRz/IxxLbK/z13zaykuISTffXSE
         sh7LtiCPDVarxWlTkvPRrSpC4t+Z7OkF2YbTP24i1iGhrN6X1C9+LmEVDZbFG427xbqA
         /iUUxPuBH+BZp4YF8le+npwFJXqm/BoeQPvNzgc4fqRkmbAyhWdMrizcbLYLiKtmJOgp
         r6MNR9XWJVOpWEU2+odQ571wKXH2oICfScvTK0vAlcKm7XQZmPB3VClH3WOrj0s9lcPW
         SCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456718; x=1794061518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
        b=mWtfMwMZwxOkw5rFh4nIIlxyOm+ixP+opYAOysRFozpL8MaooGabgi+rSRdCN8F6OF
         fYyTS0ZF4x9qHeY80P7XocdLCU7gM0UHUXAIrL1q3ezog7SMwWnvzY6NNQX6JtBTRz1E
         bzRl0ryoEl2ID5Qg8gKArbV+oheKoRY4eMI4EeHhn8cMBwCNOztFMHImOoQ+4XvvgwVu
         v9u+oo/AcL36tb0TO8VUiwqpirlFPAl4CTQ/kSePNfmYeCYH5Sx/1q5Fxy99i8DISWVq
         Ufv4Kn39JF0Yz2udZ1EZIvHsWh0ZGf7PGhp9kQlQs4xwC8KnrQ2mlwbv2LD0738Q0zY/
         09BA==
X-Forwarded-Encrypted: i=1; AKwUvBzqXWR3L+PpvNTvIdKp13t1L/0Nf6zcSAC6V2CMsAi8h4UI8p18NDQdyH5pIyMXNxDkQAxM9Qq4Stj787g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmjFZIYSKNeeFpEQ+wE2+HraJaPgrnLUUFJTvJPyCCf+8HUb4j
	ONeYOGmuw8Z54TU8ySywFWwzBHsinJRFBA/Y6eG6GSjQJuJegET36rCvFnxKc77K/OjN8A4lG3q
	InamG+EhBs2zIzB7Qn2a+liBQyQLekIoMs4TyJx4Jqk+qJGCKKh6r3RoLKIGwc0wKkV4=
X-Gm-Gg: AYBFou3zeDLh7kwnJlifbVlyUKt01eifaTw3G93q03JMZP97G9QCUElqhYhx99sIuOd
	u2odpEEb4BHUDJFSV/wF6xH9+xwZMM3wLtKUFe4Yv7JtcyO0qXkD57OOgTvmh5bQfyrhGT/T8KU
	vHR4VbtImYMXqeEKHyFBVs6EuBGA7REv0VihFnQq5Va8bnytAVskzW5MqkECMOpo7LvLWSXSJfl
	kWeOEN4VZMD8bMmhPqt80XhhB1uP24PVMgZy04nvBjTsXav3P97zgiv0RMF1qL+RIMh6YCej66q
	INDhSJpwq3tKTFqP6l9NucbWmL/NVgOP4wTWGxc5Dyeh1uQB9OWhAU4Zbpn5z50g/3/zIpndBQ2
	liPrJ9QxzBKcg+gT4mTgaDN2D7IDzZzTPa7zzAyR0Hc/YNkWBVRQ5fnTaUhzODbg/8zE7e5ycYK
	n3Z+XzCVR4cNR1l2e5FY6neddkVMDeWiGH
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr7876849eec.37.1793456718159;
        Sat, 31 Oct 2026 07:25:18 -0700 (PDT)
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr7876797eec.37.1793456717409;
        Sat, 31 Oct 2026 07:25:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:17 -0700 (PDT)
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 5/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
Date: Sat, 31 Oct 2026 22:24:31 +0800
Message-ID: <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: uXU70Rx01xIc9r2yqWhcP__dftT0A26X
X-Proofpoint-GUID: uXU70Rx01xIc9r2yqWhcP__dftT0A26X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX06n4u+w5invC
 pYPFcQ2eMAtYdKtHm2slxo34ENkXCUJ335CVxi/0H7hbBXEpiEM7zIDm9mgsdFKpoyGdoGsZnHj
 w+2LtBOHfI+j48vSs3AFF8fbsjkPle3R/Y3BNl8l8MXjMQNNnggD+R/ad5rzSANwdUuZD5sba1m
 SuHGnIi7PSply9FdvuA2W56cLDDFmpWrJ2ygyUC62Lwz2SllWcCfmhVOXJ1p/gJyvJNbxCKMOCX
 e/J5Ja7wCrHcF/uW6J9rNs/xhVN9tQaXzWVuicOFgbQvKuLJMPWfqafncVNmm+7E8g5Vh+H4Ta+
 o2EN5/fuKycirdFFjNQdiURVTPyEsjkHNBVa4TEtH5TgWaw23Yf3BP4Tq8nSBcLaccJJuyUvbz3
 3nsocoSN9p3FfzQXXZmstX0FLd058bySqfmzFMC2N2uiQplepK4UTFcZuRom/Q86X7nMNeIkhvP
 /XawCcxBMcmZNGj1gtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX5UcvAMidgNRp
 L8FU30UQXU2FK8+24JzvxW/mytMiKIOeuSMQn0AwBuAbt1slh5KW3ULDm04B4BULDdh/qL22ahR
 lpOdRDq166NwNQi5KYDuWni/4QgJjoI=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5fa4e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zbc3kRkrEr7k9oJ_x3gA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

The WCN7850 module on the connectivity adapter card exposes its HCI
interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.

Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
describe the Bluetooth controller consuming the PMU outputs.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index a9adbbd75878..3f764069bf1b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
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
@@ -583,6 +585,23 @@ &uart15 {
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

