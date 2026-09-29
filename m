Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536A42CAEB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670915; cv=none; b=OiOIulDJmqGrtJmblSXD0EHAWOcj2n7s3CbA0t6U6f+bGkFAgLlmv8U4qM4BqX0fA5TxMnAyS2BYNIMHitwouIYklaznE6D6Hv+3BSObbFCl82dVYEIMkZsXDOMWj61RPPusUzT1F5QsnqhluokBgaV30A1o4cAObOnq+WEVMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670915; c=relaxed/simple;
	bh=KANagbWt5hpCauhkiqdUbkQP+nHMV9F2Ikx0ggfVSQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fm9BUdcC+7UeVwMULwpjLQDf5rQSGH9aoLO7Uv4n0QDWmu/sNQecgapXNl46JCN0Zdbz7PwBCGTaXt8U6rPh0X8lNckRW+ARML8KxvYJUKHYnZGU3JRoRoKPsL0EuEdw//zqURdqHiDV0+A069z5anurCTJMuQfbsNd3tYM3MCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddIgNvQo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVUavmj4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddIgNvQo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVUavmj4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tqix3435284
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N0BFxVMy5WLhBOwqj477cY
	5plIGLA43SzUJ9PBjvt8Y=; b=ddIgNvQoEZsP5FXd1vdqapbIZmTSj1wvtACnqn
	SQ6abJvCmR5bKHMIsif1CiPDSETCohqhDaSTdRf7YqNzBko+rTTOFk4iSqEQuSoD
	C32awfAZmXdVOJuVHowAr7QAgk4NMZKDwZoBWnALPF4Rkb/cKcle8TBNhJy/owh6
	kdW2Rwy/+x843wRcM1R8wt3QWRRm03UbHcWgCt2n/yjbVr2WPw+IwVJZwmqfQ9mJ
	U8OdvzeXbGtW5OXyT+MITEk6vGY1XRMYD16JJD0YnIO4/d3LnM4d4DJBzk9eBjAU
	DZXrC7fAfUfEOZunsgUNa+tSIXU8WFlrmU6SGQFNkUlmhzVg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnb2cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:35:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc78c0402e7so448852a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790670912; x=1791275712; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N0BFxVMy5WLhBOwqj477cY5plIGLA43SzUJ9PBjvt8Y=;
        b=hVUavmj4GLB/h8YuuNoY+zHW4+7t112t4tB/ggAENPWO8/t7IJX11yuZgcs2oLsCUX
         UWBKhSvp+xmMx3aC4nb1PIog65p7oSygqwhGO/WtAaDXGyPlUUjiLkoadQ+xh+gv7wBU
         HUaZMYOjKFLhJTuWgnbz/4b/VyBYMuoPqlFkGOtyp7fmnAq1nUQqeTNLllhJYk+YZIdn
         fWn+FE4hK9z/89lpAbyQs/p0LX0d4Tep4PILrjprxySLbgssdeLtsK7DmWpNCvFw/QC8
         Iyi1po+5szXtLyhXk8IaN+MlObQ/aprOuKFIOSMK1Q91A5BPaxOn/yuPBAz/v8IBeEir
         qv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670912; x=1791275712;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N0BFxVMy5WLhBOwqj477cY5plIGLA43SzUJ9PBjvt8Y=;
        b=IOIODWHMmGF0sm43N/9VB4cZkruzwxUUGsHq3IHvvR2pqCbZtHYjsonJpeVd/6pM55
         JyDHrAQpsZuqWq6+/fP+CD6tFpmz7Cnqr4uG5Hxt8J8cFMbUovwbAkEI+upwXzoOesIF
         A00J412aHCXdiiFRfrD61xIc44J8FXrGPtl6gFWuHQ6bqM0ryAGUYwqyQUZXrmvxxquw
         gJQLBO8IyWQf/rFnNKbub9Vcms4PjKnJ6UINpoL3RyAAZI6POghnxYxRmPUnczAv+CQw
         No0nKsg6s+Sd+qa5mdWtqOtCQlor3j/51I7uft50tnyAj3SI6j6Uf/mxYsNcC8pXXpAu
         zmnQ==
X-Forwarded-Encrypted: i=1; AKwUvByrP9LnFEJ8G34SAyow2CkhnSGtSgRZkGdgLdKXfsqfCfPL3kCJHuSCBnSHrQqcV/+o3woV3khP0GOK5EM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5QEQYPpQQCCmqhRiWfKXWoJpaqG8fNLdtHdXSvD8WxrssIfwX
	0FCV4NGr4rEPfpff8B5qb9PAUSygiBJc/r5kQqylq0okGF3wdcnlFaYehGze90NqPcwpzFp/v4d
	rOwA09KV55CmAhfifFzlsO9bM5W0ml8QKPqj9Bp5m5xetyP+aG6aaZRiBRysVL9mG4AM=
X-Gm-Gg: AYBFou1l4TvH0ioEcpaZoHFtDpcztB8CRVqLlR0pG7VENaWNsgXkyqWeLMoZ5ahCxXX
	i/B4gcEQ3APkWrmv/q2biLdjVuNPsWdr77gCKT19DXUmxL5lvuPiipsb02rItIoE419MnYaXJS6
	D1l2pwm+CGvAMzaAtMD+PZwYQ/7xJ6AwmaoyNJ37fEr6dY5LT5frlYGb/hW23y3LkwmkLn0y9uj
	gn/JmnexUpHowuXx14I4YUPOP7sN+ZXVnvdvgVhHhg2MV+fRg5W5y/FAXYEF7jUbGiTdSACOD8O
	ekpG8Fx9hXCXqMRvHU12SW5P8fMDxm81rjPZ+o0/yMau/kS0d9rLOkcj/4GVbfM4MwuFVFrypCF
	ixS4cCQgSaRYjEj8=
X-Received: by 2002:a17:90b:28c6:b0:3a0:34a4:187e with SMTP id 98e67ed59e1d1-3a49c120f78mr889611a91.15.1790670911990;
        Tue, 29 Sep 2026 01:35:11 -0700 (PDT)
X-Received: by 2002:a17:90b:28c6:b0:3a0:34a4:187e with SMTP id 98e67ed59e1d1-3a49c120f78mr889593a91.15.1790670911439;
        Tue, 29 Sep 2026 01:35:11 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4989739afsm1445684a91.1.2026.09.29.01.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:35:10 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:05:03 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADZ4u2oC/4WNQQ6CMBBFr0Jm7RA6qUpdeQ/DooEBJgrFjhIM4
 e5WLuDmJ+8n//0VlKOwwiVbIfIsKmFMQIcM6t6PHaM0iYEKOhWOLGov9+ixmyQgL5MfG45Ix7a
 1nlxd2hLSdIrcyrJrb1XiXvQV4md/mc2v/SOcDRo8G0fOupK9tdegmj/f/lGHYchTQLVt2xdtC
 6BHvwAAAA==
X-Change-ID: 20260924-shikra-gpio-expander-25ff4a29c848
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790670907; l=1737;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KANagbWt5hpCauhkiqdUbkQP+nHMV9F2Ikx0ggfVSQc=;
 b=mV+I9VYgPK9ueiSbeq2IFL0RyEE4bUjlmoBFv65ajp7CUpgteN4SNpqIOzLgBVCJm8Ks2yQlP
 ZdnskB1Ch91A6Nt8xJPz4kqcjCf6CLXRvgznPBntCckrPe8ldChhfg3
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: VO7ENXxKzUASoeR2ZdvqxgpKyZjAe_-Q
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb7840 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v3Re7G1jAfmgFv_pawMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX77I0tuCClhOx
 7KK+XYgvUhpXrFaCR4l+Ro9EReTD6UiSi8GX78E1wVh3KP/MiF2aADDPmPVpl8C4VWgdmrj8fm4
 ZFj9bqMDXV1XT1uqY4mPxTAdiuFCxiRb7WWftHP0R7/y2pUFL8VX/o5pBoq78a3To6JDwgB3MhQ
 lFOWommxbqY1j5DlralsnDw9QDuo++SImnwqr3IPaojXJBTZb19cD/F7SGE8bOu+AvVm57CS+8B
 rpmE0YIUhpmIQCERw1K4IEgx5Pd+Vvoa2SYuD8wlPikWG37NyUg2z6sZpQUCDNkb84LP8nRH61u
 OhE4dMwzj7ubK47YJgQ5k6zIMyjDQrWRptMG26ca0dPagJO00jMgLMxXx6DLsBqwwvwT+4KI85u
 XpnOfai/+WC1VSFGWdQe9u3tvqMVHE9hgA+J09U5GBBxz1iIMnipNU7i7/8fJRcEMYQPCHu6Hvl
 d9rBaKrwDiQCasetsbQ==
X-Proofpoint-GUID: VO7ENXxKzUASoeR2ZdvqxgpKyZjAe_-Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfXzkb6IIDLNt2Z
 gBT94qyYJZs7euEWY2LUX2GX4zrdhU4nrdhqIW2CsN/NxXmrT981iDVFmru10RfvmK//Sj/OoJv
 03CTzpAhIMs5afYGTeWIzh4UReNmNmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290034

Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
TCA9538 and TCA9539 expanders used by EVK boards.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Moved GPIO expander nodes to i2c3 (sashiko)
- Link to v1: https://lore.kernel.org/r/20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index da484887110b..ecc630117940 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -11,6 +11,38 @@ &gpu_zap_shader {
 	firmware-name = "qcom/shikra/a704_zap.mbn";
 };
 
+&i2c3 {
+	status = "okay";
+
+	expander0: pca953x@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: pca953x@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: pca953x@20 {
+		compatible = "ti,tca9539";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: pca953x@21 {
+		compatible = "ti,tca9539";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260924-shikra-gpio-expander-25ff4a29c848

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

