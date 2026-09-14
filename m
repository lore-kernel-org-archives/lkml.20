Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0953E5ED8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369315; cv=none; b=US/1msu9aQsGAcJN6KEkS1/VvWJJvJ0OwH31o03P+8ScI/5GSX+7xwC2PelkNWij2w5rtXvHrMq5lPjcPTaq7r9NtSJscm36JXiWZ6PdeBED/xmDQUvTWUUQCW9VcuhHRuu55hcb8PdRvx4TTb2/CJGVEVHbSE9JxY3uYbWcI7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369315; c=relaxed/simple;
	bh=42U50INRSZxWg3ETrZcW68RSLtaZLOmje+FzHwpFxbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQDt9ufpVmFgLSgZ8/B1IRaiUBY0TWfnULNB5sIVFLLH7AGjfLWyDbuIutcrm4Nqh0WfwKkOWvV1wYVIU7LTTzwM5ixOBmTDeQTnmzNR/M2M/hvjz60sCidBh4ngzHlGaYDSgpVpgWbdIU4crmDY4v0zG1ALYlnnnaYdmdI+s2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaHc0iX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8pTsWMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaHc0iX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8pTsWMF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifHP3900798
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vrMYgIQIiWa2cJzCSEHychhDLNiioNENEzvG+FNq5E=; b=NaHc0iX7IDxwlzSR
	ox8w2Rn49V0QWKJSSNiYwyu4i+RUDA641AaDrSs1Iw/JJtu+qdykccVZvc94KfYz
	kgTruDPPteJofF3U1gKTkIT0M7vL5adLKuYHtHtAe28TpQsp7LjpHZtT6lDZKM2x
	GXH7EiGAyxnv1b3/f5Koa7j2QEBeWm3iKsJtuwbG52FhjKQ/wN0yPaWaW7vksuZF
	gA/Uv/Dj3XHWlt+MZ+DjAwMm/ZpmQmxwgWMQpaYdede0JGOsiptKhCxdX2Dc9TL1
	Vuq/+jmJei70Sy6wAkHe9egREopLfQC3jBUFi12iCyPIKjZvOcIHrHzQm9qrYRUZ
	/detbg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5d8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:53 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8052a85c6a0so2857987a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369313; x=1789974113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vrMYgIQIiWa2cJzCSEHychhDLNiioNENEzvG+FNq5E=;
        b=F8pTsWMFsgYkLINfA6zYj5jEj6UNfXuzdyzaCtAx50IlTzBYxcCa7zwFN4e0Alxxzv
         t+0U2Pv9HaW9E6fkxJ1W3TxDjsM1a2qfce00+uuLwbbssWUL8DMR9OVlGel2kb4o8wbn
         WfiJICBVxfGVxkJZazj9f+cndAQMPcIwU8Oc+ccwCrzYkQtp8QS0O9XCnu5s19cUkvcq
         WzwO/abDK8HDHsLI7IFnvpz4qNAqWsOyHNUvPTrTZDMbMwwaT2vuBmcl1Vn4cK1RXzWq
         jKuhqq4r5jFDR6tM9MAlpZ3iHvGGirTcYvhTdYWC+DlbldwJ3PQaRvwkVe+prMF+fUft
         vkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369313; x=1789974113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vrMYgIQIiWa2cJzCSEHychhDLNiioNENEzvG+FNq5E=;
        b=JdJza194PkTVnKra1Edklv6EVFv94i3colxB95tCDIFq1DzdsdJe2njxmuPCzGZxWS
         SPODQlLLw7xy7XnGRY3xBb5PJfhSlDFtMijJkHbKG1BI8iTUlE9946aLNvOArdrLeQWk
         J0DEJ7H1PW7z6bKuyZ6vrdhIfPlVso1mn9MAKJFgN7b2q3jjW1esyRA9BZlUlRvPc1sp
         iho0B3CdpQtKE72F8iHzP/3Tsr13IDQE6lXnBNihONObHd2TAGzMsI9Woyy5+eU/05K+
         5ECfpptl/uDEbrhKzN/BpDiRfvdxI7jWswbwdj7rwLiY89V5exak9RDAAo98nCnJaQMO
         SA/w==
X-Forwarded-Encrypted: i=1; AKwUvByCW7FmCP5SMT10Z9aGd5xc4tD+2l8QmuPaJx6YAl7rHIcnf9WSp26UQTif+o3wyyEp9scyhtubKh2aoss=@vger.kernel.org
X-Gm-Message-State: AFuF++nquszTlhZFMI8ytVvx+RfVwpCZBdb/k2LW4fr+vx5xaQU1MTlU
	BunK3oSXAvbMG+DyojXNoIMr20NmWqx4suaeaYRR3XXKHFn7Xer635sWDxR3UPJ+FkHlUep1aJD
	YCQplfhS4R1q4sey80BLQRuDNR+LKo1wZ7NbTsMKI56w47pyKVMPIVa0keV8VyzXGrIs=
X-Gm-Gg: AYBFou2CQPp90SXb3gFeW6JaqFHwiXwvuR6pFu7O0DVjqNj1LqcaHDai9PFGjaIvM+S
	4iz/peGrs629z2SUuTiOBGXJadNOcRg6D7ovS9ub/+j5/MWLSp/jn38PYWMpHRy9ZDNg0Z3ADfg
	o9sg2wz5A3BYaOCX5SIcb4OPc54GlK9lZO/4wlEI4LC8J80MUxHYC465a8Pj8lq1ZmHpHkspOtZ
	yD9AFEZ2GLmDd/mq4DUIFJ+qffSLRJBwpxRajCW2++OmxxWhV3X9mLZXa/lzcqumKH4yuTsFGjP
	UIi/j9qkh8a8elgMcCbiNrWNHBDdgyeRmVCMP4gqMwFtlJAe2vcBdEukaSf9iEJM5Fvyy0x2psG
	VFHuGr/A70P5GqTwqZSavZkhMQC9A
X-Received: by 2002:a05:6820:f09:b0:6b7:46fc:1cd with SMTP id 006d021491bc7-6c542041664mr511930eaf.44.1789369313153;
        Mon, 14 Sep 2026 00:01:53 -0700 (PDT)
X-Received: by 2002:a05:6820:f09:b0:6b7:46fc:1cd with SMTP id 006d021491bc7-6c542041664mr511895eaf.44.1789369312727;
        Mon, 14 Sep 2026 00:01:52 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:52 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:57 +0530
Subject: [PATCH 25/31] arm64: dts: qcom: qdu1000: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1314;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=42U50INRSZxWg3ETrZcW68RSLtaZLOmje+FzHwpFxbI=;
 b=exHzsO2QFVKi/VGkfXrXAdryRDbVul1DnnyjD25sEfWQEJ2BdWR9TE5GswfEGOJDCgMcd+Xsn
 X6wD5EstB/YDj1WIVD0ma/b2ZSFrdIkmrXuMKyE+T3H6AXOqVX8yJXX
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX1ZZTdIMSd04C
 EyNEwgrI4gAhx5Z0PWrAUn2RsJLte+BTnj2MnZTiIjl4RBXCAQDhgXIFx9YaDMgITFVGTMYUlLP
 3HqzllQRSALMP8kmTsXxc/yS6HnN65E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXztbO0TjRdu4j
 93O5MaeP+2IWLQM/cTWYuh+vwcMhnFaTi4f55fTsgbbc62ZEfunv3lQzS0qFY4olECts6mDqq01
 UhBaCTvtL3exdzFK82zVaHNKF87ACqVaKzg0gzp1tc0xKmQNk0WZRvQZ+HF7HXTY+Kj2TuJ6q8a
 z/pkt+mCFWer28SSKwfwBFSAmpCI06KzJnJ/KcUNWDg55dr07jBqJlNKSU4ZGVWyL+wj17+hJUP
 phP46ApLHPwQUGLoYG+OHAYoqkzU4uVcO7aQJLBdXAeQZJoUEpQWLBNAyP7x62ovvPaBXY/MapB
 AxS7R2domhsWnq3Q0cJgFVYGCeuSV/PcWEPLSdpgRcYih57wxYYW6qmw2R9pVIBfOpJqU3yc59t
 BruaShr7/DkhmtwwWwqsReSLca6HLz1vNb/vpAJrU01wpkgz5fYLLH5GO3Vq9uDbZHPnI6vSQf3
 i73WzDzkzD2MBbfW+lQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa79be1 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: ZEse0G5EChhzj-66KeQ_He1g9USTMRCs
X-Proofpoint-GUID: ZEse0G5EChhzj-66KeQ_He1g9USTMRCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index af106aebd30d..1dfaac8c84b4 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -142,6 +142,7 @@ idle-states {
 
 		cpu_off: cpu-sleep-0 {
 			compatible = "arm,idle-state";
+			idle-state-name = "silver-pll-pc";
 			entry-latency-us = <274>;
 			exit-latency-us = <480>;
 			min-residency-us = <3934>;
@@ -153,6 +154,7 @@ cpu_off: cpu-sleep-0 {
 	domain-idle-states {
 		cluster_sleep_0: cluster-sleep-0 {
 			compatible = "domain-idle-state";
+			idle-state-name = "l3-pc";
 			entry-latency-us = <584>;
 			exit-latency-us = <2332>;
 			min-residency-us = <6118>;
@@ -161,6 +163,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 		cluster_sleep_1: cluster-sleep-1 {
 			compatible = "domain-idle-state";
+			idle-state-name = "llcc-off";
 			entry-latency-us = <2893>;
 			exit-latency-us = <4023>;
 			min-residency-us = <9987>;

-- 
2.43.0

