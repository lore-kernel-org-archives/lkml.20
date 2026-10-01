Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B94E5326CE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867901; cv=none; b=kkAY5J32OeZOREWn9VTmMKekSlzI1/+qGixTV6gERaC/NXxaw3Tdni8iZagVOliwnrfa4bs88bdI4q6L4yp4TO7tzdsiYKtjhfU4NkrT8YZf7RQyeG591kICqmstmYV2zqPLQDa/vDoR99Ccz34hQFer6ndF9Qo5tAEzeHkKl9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867901; c=relaxed/simple;
	bh=5KV0AqXX2OEMwqqrKW1yCmYhVV+tDtyhJFj2NfkqB2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQQRd3J+rinNzSIZifL+6YvGrbZiCnCJojSez0FxeBqGZyoOt2a9WuWsPW1PGnaVl8C0fq6m2vqaoYe/rkhXOCki8JJPgRUvYTXWXLGdCvmUoMjrkVbHGECXIkj5cD/24zB8Yxw+oldtioH6wYNYwOtaPM+M5U7A1XIF+hFuB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKY/NbOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/sMhD8+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKY/NbOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/sMhD8+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dir4I3228354
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=; b=XKY/NbOdlUui9Ojp
	qDH3nBxycXpLVRkUUYre34LEk1ujVox1wkIw5Qhqfe9DgKEQzidXbL6CCr+4s7Ti
	G6rVsZCDUgG7O8WzxHjPUpSEkqIf1cqBT6HPCOS19glQUewdAJCEiBMB5SDEfION
	K/kGvsXoW17RPlt2+dhwAwbEqPSNwb0JeILJceYCaHzWXU4oLUH0mzSjr0vFP4L/
	7zRuo4w2uia29meqOsaUIOK/cGIm5gaphMM5eQGJQtk+OUppA9Qahaz2E2vEeH2j
	tOuFkNIQFnNC8jbHSNMNfxMZOZOYG8VOwuQLekouvbAv1V16YAvWgu+K35KQeZ05
	qlQpDQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk8p5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:18:18 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-142f4306744so8362738c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867897; x=1791472697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=;
        b=S/sMhD8+0m025H8h2FMM6cDH2Eut53eTT82jsqgP4si02g/sfZ4NB1hM2o+QBpIoW+
         R0XtHI14y+g8ziI6uvCQRVpH0dP5RuF7QTtMv5PuPj0TYvx0LHpWMQg+VCgO+d3tNU8+
         s8L+q0VziZSbzYnhMNY2sn1oIEwpe667lS70IY2qpJbSkRnNOUFkxnuNq9nLW4SPAKYl
         TyqMQJxM3zXunOMQYXy00fRw5ud0kqIYkjf56oNxUsOWJwpgyfn44D/zpTlI1iqEm01t
         DVAiALE/33I2Fv2VFeXaTESVHLVLUK01DxndcRBtPYzEIO3TMRGibHNAnXT44oNQpuy5
         WjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867897; x=1791472697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=;
        b=TmWhl0MaeHhOT0xIk+TO980Z97Q9k7Hq0ZKWmCS++WmSRp9w8FxJ5wetbMi+hmy6ZE
         w1btJJrsPgyVM5c5LN4SSjcApDPOEuQlX/1ifZkmkBVsfKRlRRWu0MSUiPU9QJbiT3Qi
         7sm3dJ7G/dO7ljg5bZyB1hOIWN5KqnPgucw/dGNDHvbS4IVuSa+QRFQMYR0Y8RyIPuM8
         mSz8iPaE7lmiDSRKQemYZKBhMEkjMSO+MWfgMz5ZLSY/JbSyeQ58L4lsXjoCrAHjxOQA
         UTE9a1YEwG+QyiwdOmlQrtc5AfHtvQBkgNYzO64TKZ2POpLZm05D9I3rG5iQawahHisj
         q+2g==
X-Forwarded-Encrypted: i=1; AKwUvBzRUJvov2uKU2xyA5D+MrfcMdJhw8bC58SKVEQYqlKpnQFqUynYYCWCqBNSWzZX8pR9JiwTMA9U9IftyjU=@vger.kernel.org
X-Gm-Message-State: AFuF++kRRYtDHZSLlqd9r2OniBuu4XmADXnLUQVC7tXcQtozfEzXKsRP
	+d2k84rsyFENeOS2wP0xKgxtBpd9fkwdmmK4PW/z/AFcfbOY8+SU9XP01v9ftMyysGJ8wCrCFuY
	83n8zACeTgAI7Gl+Rgp5o64A2en9anyJC8uX3M43onDzhdGkbn8uyMQy7bbflAuPRdos=
X-Gm-Gg: AYBFou2woCduvOIbN4pjm7cu9YkejfH8ogiTjvndqNE/HH+aB5a3lT2MiUt7T3rlsob
	Fqw07/gLfJQAAXAW/w4SZt4e3ZxXexDNojaUCPToS8I3/OCsZaPH9xMvJw6p73q6jda2ayjmJuW
	Beo4MH1iiP3IPfRSOeiOqyw9yTsX1LXDaTyE5u05g3B/Yhi/AUHDLzYWOyZuf4jpLDgs0AqD+vx
	CkxyqpRPAdb1jLCvO9nQ7VI4BN1DddNNQcSfXzdNmSB13DRUDLLAN9/p87B2SK8lZ38awZwHbIK
	2d9VSL+z4NhW5+rpWbWerMUCKxmHzdb2cncwWjaJFjzVKWihwvdP9BjUhRBbdZ5o/OAClH3vaNE
	3JP8Vk8c3sSAnkZmJW1qSwrPDTvMH5+e0Eg==
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr4080632c88.36.1790867897176;
        Thu, 01 Oct 2026 08:18:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr4080593c88.36.1790867896233;
        Thu, 01 Oct 2026 08:18:16 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:15 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:26 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: kaanapali-mtp: enable iris video
 node on mtp board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-6-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=963;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=5KV0AqXX2OEMwqqrKW1yCmYhVV+tDtyhJFj2NfkqB2Y=;
 b=1UY6xzT4aqvUmIBKJTk9yU2ObYQd4Uln0H0wq77IC++vzIUv58JOCkE/GMEFVgPM9tDWAqicp
 oza9/QuBBgYCp/e4rVQ605tNEgEATtK+FAungfosjQPyjxdI4X28TaI
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX2Vg/Ch475VFj
 4kWnCfTRMd1vHNYj3A05PXZmBsRRI2ywJJiEjd22+NbfUPuBrf4w1xK1EDTnIHjg4LiEJlmF+mw
 OghjPCVGf6f17myIdISgr+0fGEIPTy8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX6C1eVu47QB9T
 brem9GUm4OrdMVbnTYR1MJe62rLHY0CzFD5ORIshVKehxC1PkIyj5SPGFStzOGtfGSzNB8CjwyN
 iMJlQ1UrYXNpe48kSxd43QlCcIxdk0eOX6OU2qH2ff5/P62P3lap5epaLVXEQ7peRdFJQnca+VW
 KoOx7zD0N/jKQHkUrna8e2qfNADLaHAE4ITQkKJP1baQKPFkoJPdh0LiRHvibrAxOBVuFrJVrUq
 QLJexgNi8Nwh/vPJ3M+5j46xiZoSaAh3+d2oFbH2ksXQz1dsYdEBq/lIMa08m0AxQXXM/DJXFhw
 azTQidv9pv9vUJCFKmgXFVZFJFeNtWuqhGUhjRfGLYzGJCIvUjUga0y5zPujif4lWbmcQ8w4QZE
 VQGxLENO+Fa4KnFHEHhhmb8Bcegd7t9LU+cv/KaedUh7UTHwLprET0tW8BuMD6bHR0Ds1e9KKVn
 aVU1HuR+QW2NJr6rkTQ==
X-Proofpoint-GUID: FLvFR3FVjVF4cOQQ1XoRkg7CIUwPAgam
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abe79ba cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RDbdyBABLrhsN5S-fyAA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: FLvFR3FVjVF4cOQQ1XoRkg7CIUwPAgam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Enable the iris video codec on the kaanapali MTP reference board.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab6b3e3646753a880e4704a1abd503..4463ab8b136c6f3999198e159335e3096e181fd0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -916,6 +916,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu40_p2_s7.mbn";
+
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

