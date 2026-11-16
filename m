Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809637;
	b=U7+8J658sYGyyFo3i5Fj3jFdHNxyLeaXURPlkEEqL482rQ3+dTjjnChfo7lDCCujVBay
	 PjtDhqjjWELoMjPngHyJr99o4pHY8DmR1WviPhsbh2msTpfQJtkCLjU9BPAkfpeEeLp7X
	 GZgK3YtZBF7N1WOBbvsoIePrOsJf4xkD3dHoGjjAlZzrBK6/LJ6A0qyiXAJVa+EFhxOur
	 UFctqKZqRca70nLnX4ieGEs9b3ubE8t2Se9OEyN3OZMzTTXnqbDkVJiCFqAfb5sZ3Ag3b
	 zTUtJqrq+xh3wSjH7djtMCZ0ZK8q8AX5SBFD5jlFgDMFjsWi6o6WG2zGDFOx68yhCyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J+qZCltAcqejct8szYhfiVnTIvGI66yxeSULXoBe8sM=;
	b=EyQdCffcI+sjIL2AMGYvfIqsbiFBDaAzGIxpGDm/SmEWFpu7J+XGx44ODfiieBoDK9K4
	 qryGhVoUbssM/AY09W26CWQ+LzCuQsE8yd3XiPPgm1/fplRnr7/kyL+A0lKAus13/VQGF
	 SQkddgHImudzwRw2I34ZFC5kPhAzTnNWTEWbgVFyZIF8cTxFyya+E8kMdotknYIl6fm1N
	 TqMAKuwzM2kG2u2Ebo/xv2tUQQwqdOFZxT4o5YQqbtHKPjW+vEkRqdidBi0cXR46OEyrk
	 Rj2n2G8mxaYwB/pUQJ1w+VCDUWwF1B0XaO+WCEh1GRieRN7vNX9mkXzI8aCXc8rp1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEQHxOZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sj0NVEMa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B242606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B242606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEQHxOZh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sj0NVEMa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LiE3112176
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+qZCltAcqejct8szYhfiVnTIvGI66yxeSULXoBe8sM=; b=cEQHxOZhR2gZTgWT
	xsHZqB1mZIqA9Dylzot9SPkBj8a2OLSZUdW2J6pkBVIhst96j4GsazKRVq+mxmtV
	B2OiBmzaiAeHeKZVB+1dWuvQjCDLVq0ozOCf6k2NbyPzbqFPD9zLOf4Txmr67I8M
	ntOWHEoToXji+krnu7HRD/2s5FWeJvleqzPzG8VPWFR9lrgmGMhN2teA9WM5Cx6I
	dA0hCc+/Ft1TBa/ZaxkS6koLF4p0i8VYBAnrpLo6zo5w8SeaLaXjVKSWSXi7OShF
	tTvfFUyO7xIM2GcyPTp6WBflyMPO1RoEeH3L+JTTJKYaBoWJvSWVwtaMMEi8qpcB
	ZK8EBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwd0sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:13:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so3924939a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809635; x=1795414435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+qZCltAcqejct8szYhfiVnTIvGI66yxeSULXoBe8sM=;
        b=Sj0NVEMaRdr4VRpxTJyt+In/BOYFsxy//IORCGMaP7bqjnzntPgck1GWrI7EvJWdzN
         PdWqjXY+XRq58vqV/WZ9HaIOMvYG0uC9qf37rbj6dtmQj4aKproe6Lmo+/HX/Lew0wIY
         8+LWi6iM1rLsUsw2glS1TjqJlmMUfrmfgzYQvO9GgBdXp7utvEsbcwnwCLcDuB+J2FcP
         Z93sWvZm+8alMNayvU4iuncfhupDhlcucqEedkfLkMoDSuEN+jCL9Cj+LRg+08um0Hke
         HCPad99ZvPtzqfTt0cmGUURC2tGUU8GaA7mNpxCfMB35bqHAHLdQ2axJi8eB0QQuS6nn
         gJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809635; x=1795414435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+qZCltAcqejct8szYhfiVnTIvGI66yxeSULXoBe8sM=;
        b=dZDxSF6QQmEBCGeG/nzE2zWHTRxDm3lySaC/KAjuNX5huMG21kyUET/zboQ7XG4aPs
         jlVmdtL1rZNX00LUaeLTrjIi4dh3TFkRSC/8ItPJxMEA4WrNlCWgwmmaPY/vhO9uN1S0
         h1skYMVK6I4gbUsZT/KYczkSkiThlEyvgoI54Z2a1wzwagy3sBUjkeyzELy1DIzb1PKT
         CdhIa8YSiZV9QyHCNd+w+x9lHZksPA0Etzmh4PqZrdrKuY5upMqzsfh5t4/B/bBybvPs
         wBkC2MYsw5jIY/KJ4GY4PtBuMx4B984RL9T+WVVjiVpnxKXuV4h1rLrWSp38toYonuL/
         M6OQ==
X-Forwarded-Encrypted: i=1; AL+hErFhfPnkoVERaRECnjALckmgBYYwf+3+++SNii0zqwrdVHw3YMkAtJ/v11Zrq6JUZ1wHZ6E7v3OhYLNWEuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+visi9gPyQpTJyLe6obw/4wGUetG1yGgaWMwfoHbmCS9OqyKTE
	s5I73mHUSfih3HibbYigMfp1mmP7YIcVSsXlWIK9HT7BmrNIHsiXr1/PZH80jR/M5Gge1oQjKjf
	/wbEL/iSt/Co+UoCTnJKNmesQ39WrNSmWSqsKN+0z3kQGVNgfMj2dM2qG7q5U60J8Aew=
X-Gm-Gg: AZFdTZe80R/DUYMqYiypTwh5wICOLujTay8SNKMYc/4bMjvvdg4SGMxWs1KMZHx/KkD
	ft+knxcrEz78GqdQnMfhGA0aDyynNlv2ffTSxF/dJSUv7Ye3NUABwNYGS0pTanKQa7w5vfuzsOn
	ACwBEmYFtJtCN0iigoBC+0I/+CIh81yckqCvfA1Fhhvn1tiWkWsUF2wDZDYuOUn0UPjJWbNI56S
	LnpfvVssa9Y8EV23Z/3iQGqiZAA3JbAXbb/GqP6fvvlWSYhnuB3d79dBGAkmNUhUcaHEILvkFsS
	PEiVq/4PfwVGX/X5z4Yf3xyyqQqmTDhKxJ28JXvWh8roouSuW9J8GftU7QAP9FRMNGdfObTSu/C
	9XGBpyQ3sRUicMNe7cA8qS3C52e6JWKtS+LnUTbYjIYO2+iY4ea1VTyXAW9XlvZ7sLHRd
X-Received: by 2002:a17:90b:5645:b0:3b0:a7f4:adce with SMTP id 98e67ed59e1d1-3b197c8ac56mr10023482a91.7.1794809635065;
        Sun, 15 Nov 2026 22:13:55 -0800 (PST)
X-Received: by 2002:a17:90b:5645:b0:3b0:a7f4:adce with SMTP id 98e67ed59e1d1-3b197c8ac56mr10023460a91.7.1794809634537;
        Sun, 15 Nov 2026 22:13:54 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:13:54 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:20 +0530
Subject: [PATCH v5 2/7] regulator: pm8008: Add PM8010 support
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
Message-Id: <20261116-pm8010_i2c_support-v5-2-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=8040;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=n8bkGIBO1JRh1eN1vpkRI+zsQxSGMuSSAZwbhRTOncI=;
 b=69kYsmWhoN5X2gCbIYrxUMpzutXHPPN0NOaSG1bX0qhxIo4VorNiLiZ7j/7zRwePs5C/rU5Qr
 v9soVjtaQH3BoBscJoBQU4UqPDq4yFBA8O764ni3Gx5xao7plRDMU0l
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXwhwxvNt8QEFN
 src0K5RbOOg5Hi2NekoQrqosM35m07s+p13hNcA4lPRPteygTIVKe7K1utt060kO0Xc4SZClB38
 +mGHwmw34XT36vPX4n+Opl49Tz6RhoVTrW/onlKfdUGTw5AuMTcP16QWk6Ud29jzn9G+9UtV62B
 6yaYHKe5knz+0G2YTlSguBA2CW2DlvS7WQaDLB2FULxtO0ldMdPweDeB+G3GzEf8/8Q5lP9PLlQ
 wr6pn24FyyfyIKaVn3nuqnPFPPWjiAA5ZJOLf5JI3CjtKhfNCWEYdU+IO4TVvuXiKxwTO46xfTn
 zL00qp1yAvwIBpx7MgV5LkBT2V5gJ45kiOO3TGeAHqVpJjY6upg6Zvsy4hwYgnypOdd/m7XP6UW
 WhfB0GyFGJHd/f54ISnxXw5YsDDrYsaN3ujrLrPsFUXXTV9khc6dMopV8NgGOwxrKlx2Q+PI9lD
 RCwdNQ4RC730oJcVSBA==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa9f23 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=CF1g25cjMhU89PGl3DsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZBn5HXXYjAbbAJhBA4Yq6YbenNap5-2H
X-Proofpoint-ORIG-GUID: ZBn5HXXYjAbbAJhBA4Yq6YbenNap5-2H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXzzOEhtfz3Zjl
 vSEIJh+NUpuFDdzXAjBmTkhiyIyRzA9YeqE3J4L6AcDEITs7xek2a8F3UKS/HmU4SAWbqknlE19
 bifgHUkDSdwHJ1zfnZdY3Ekr4qCSQdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008.

Like PM8008, PM8010 also has 7 LDOs under it which are used to power
camera sensors. The PM8010 LDO are of different types from the PM8008
ones and have different voltage dropout values. PM8010 LDOs do not have
a voltage step rate configuration register.

Add the necessary changes to support PM8010 LDOs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 109 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index c1ebe5a0b500..0ea4ac016dc2 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -39,24 +39,59 @@ struct pm8008_regulator_data {
 	unsigned int			base;
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
+	int				n_linear_ranges;
 };
 
-static const struct linear_range nldo_ranges[] = {
+struct pm8008_match_data {
+	const bool has_stepper_ctl_reg;
+	const struct pm8008_regulator_data *regulator_data;
+	const int num_regulators;
+};
+
+static const struct linear_range pm8008_nldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
 };
 
-static const struct linear_range pldo_ranges[] = {
+static const struct linear_range pm8008_pldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
 };
 
+static const struct linear_range pm8010_nldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(528000, 0, 127, 8000),
+};
+
+static const struct linear_range pm8010_pldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+};
+
+static const struct linear_range pm8010_pldo_lv_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+	REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
+	REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
+	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
+};
+
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
-	{ "ldo1", "vdd-l1-l2", 0x4000, 225000, nldo_ranges, },
-	{ "ldo2", "vdd-l1-l2", 0x4100, 225000, nldo_ranges, },
-	{ "ldo3", "vdd-l3-l4", 0x4200, 300000, pldo_ranges, },
-	{ "ldo4", "vdd-l3-l4", 0x4300, 300000, pldo_ranges, },
-	{ "ldo5", "vdd-l5",    0x4400, 200000, pldo_ranges, },
-	{ "ldo6", "vdd-l6",    0x4500, 200000, pldo_ranges, },
-	{ "ldo7", "vdd-l7",    0x4600, 200000, pldo_ranges, },
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
+};
+
+static const struct pm8008_regulator_data pm8010_reg_data[] = {
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 296000, pm8010_pldo_ranges),
 };
 
 static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
@@ -100,7 +135,7 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 }
 
 static const struct regulator_ops pm8008_regulator_ops = {
-	.list_voltage		= regulator_list_voltage_linear,
+	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
 	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
 	.enable			= regulator_enable_regmap,
@@ -110,8 +145,10 @@ static const struct regulator_ops pm8008_regulator_ops = {
 
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
+	const struct pm8008_match_data *match_data;
 	const struct pm8008_regulator_data *data;
 	struct regulator_config config = {};
+	const struct platform_device_id *id;
 	struct device *dev = &pdev->dev;
 	struct pm8008_regulator *preg;
 	struct regulator_desc *desc;
@@ -120,12 +157,20 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	unsigned int val;
 	int ret, i;
 
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(dev, -ENODEV, "Missing platform device id\n");
+
+	match_data = (const struct pm8008_match_data *)id->driver_data;
+	if (!match_data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	regmap = dev_get_regmap(dev->parent, "secondary");
 	if (!regmap)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(pm8008_reg_data); i++) {
-		data = &pm8008_reg_data[i];
+	for (i = 0; i < match_data->num_regulators; i++) {
+		data = &match_data->regulator_data[i];
 
 		preg = devm_kzalloc_obj(dev, *preg);
 		if (!preg)
@@ -145,18 +190,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->owner = THIS_MODULE;
 
 		desc->linear_ranges = data->voltage_range;
-		desc->n_linear_ranges = 1;
-		desc->uV_step = desc->linear_ranges[0].step;
-		desc->min_uV = desc->linear_ranges[0].min;
-		desc->n_voltages = linear_range_values_in_range(&desc->linear_ranges[0]);
-
-		ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
-		if (ret < 0) {
-			dev_err(dev, "failed to read step rate: %d\n", ret);
-			return ret;
+		desc->n_linear_ranges = data->n_linear_ranges;
+		desc->n_voltages = linear_range_values_in_range_array(desc->linear_ranges,
+								      desc->n_linear_ranges);
+
+		if (match_data->has_stepper_ctl_reg) {
+			ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
+			if (ret < 0) {
+				dev_err(dev, "failed to read step rate: %d\n", ret);
+				return ret;
+			}
+			val &= STEP_RATE_MASK;
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+		} else {
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE;
 		}
-		val &= STEP_RATE_MASK;
-		desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
 
 		desc->min_dropout_uV = data->min_dropout_uV;
 
@@ -179,8 +227,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.has_stepper_ctl_reg = true,
+	.regulator_data = pm8008_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8008_reg_data),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.has_stepper_ctl_reg = false,
+	.regulator_data = pm8010_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8010_reg_data),
+};
+
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ .name = "pm8008-regulator" },
+	{ .name = "pm8008-regulator", .driver_data = (kernel_ulong_t)&pm8008_data },
+	{ .name = "pm8010-regulator", .driver_data = (kernel_ulong_t)&pm8010_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);

-- 
2.43.0

