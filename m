Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884084;
	b=jj9jZKU4cOjjKjzmC4Rdp0cJZS2MeqcduirT84BKWhAYjJPmIzbW9c//nS7NzUijbNua
	 /bdtoKIuD+2ZQqtgnJ5XOMN6y0b/zVvej2KBb9QiLjLcRv383xYRgpj5i4+NBGRdxb/8s
	 zYJNPtDcGljCy71T7aOutbhP67l9ibkNM7pSOD5hg+0OEfGNHJ2kuXoIHAdhU9D/ersFR
	 EtEQaybJ0EqxrRsMZIwecIgUG++BQo1dJzoYPw3M25vinh9imAuACcyomU2tQxZMgbm1G
	 M6vk/8+m6EzCAkRX2xGhYBGMvIB56CtCQO9ugN+eDR2FHJMG8evY2VLCa/BVgibVZjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
	b=k9+G8WnOel9AbdF8TaWmkn5M80j8xq8Wz6klY6hjSqZtP1pb1ed3ckAusq/EBXsGJLio
	 dE0t/+9h7DQst0+43IHUyh3pUfi1oHEq730ZTZhV27lkYH77+sbT34lrfvMsG7W2n6jfy
	 1fZKpWcLS3AhidZ9GjbVymKEnnEHOY5ob7hFUtLhYDF6hArz6EYS/bgXIK8jB7wixKyO+
	 qj7ncpiKN5ZpyR8PO5yztEOpo2v+jTg4fdPDzkyb828jCzSCVJB9ikZWv1k7Gpq+JJuTH
	 Wqv15fcrAOq0W77uwskLKM4CXFKMZQBTEclkHwC5LD1nXnEChBF+Np4qen5CZoE+o/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2Xx8w7s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bB+dvqV2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80B606EE94
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F80B606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2Xx8w7s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bB+dvqV2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tE9d444508
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=; b=f2Xx8w7s3yMUKtuF
	IvYhi2RQTzagLYMaqzVa2WnLKnzbYJ+pCUvBQL0UeSziQmcEp+dEWf3WIdDPiumV
	9itzRHLAZNA7wcenN9XD7YcLQMKznGih+FvNUILXUfvXyczJzrOVbnGNC4F7660W
	ugKDI7WSMZIiFcyEtQdbvv6P/FDd/DCLIZMhsNqsGzgg47bqPF7hUx+3DhGeaq2w
	R5AMfiTNc7WaeDafHP86mLPEPUfBwDFoaGHaAoflCelulEtSsFObBk7qMrlc3die
	mqvE6fIgqHyiQcJMx9SD+S+tvnIh8LgaFf0l8LtXxPpwo4BaYVf0aktPeLqTpkx4
	K95S4Q==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaah4fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:08:03 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67bdee091feso2459681d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884083; x=1794488883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=bB+dvqV2NXnlZvco1aHuMzn57IqQ8KQ7XxASNn+6tLDbeDmzwIfyPz18pYwddOWH6Y
         1gFXfmpxJQalVLejXhVmuNhmeebz3VrQaNSpdwQylOKYHQPigOPkViwq/4rE7Ab64995
         IwjDNxim2seUyYzHZFjs/nhbS9I0QukaA4+AklE9dMvnOXqd8s5f6c26sdQ46crDxzCc
         EtySKfdsDnNGYHr4nmEEpb8isCRzB4Za3cLDrZ6G2OmFpLFlojyWUCIqbWMhag/kM5uZ
         FcFktBXMhsq2M35/9JZMRVSqm7SPqYWVQsgEyEQOk3olaVEW7kradsrJIG0u2DoJ0XHc
         ERTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884083; x=1794488883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGXbSeZlkSz4Cin5h1fvK5nVxqBe3jrdrGrRDjDWmYs=;
        b=NYXsVYG8c1FPne2fr92Mq/SZRAp4yrIaRavyi3tMqlBOwA8DF0QjwO5xAbJRzaQwEb
         StxC8XayH1sGnMD/JEZpygCadW5cLXoSlXTSSlBE2b7M05vTreNWqT0W4vttWs5KgGl/
         wqNR/wCK8RXdxAekb+pr38BdeyA2yGXhSXG9hKXJhMZVlvAGlEPLZUwwqzLw5hbGHigJ
         ePcQTKYJMPF229KJN4pYR6XOAv0/uTwGyp/zl2CKNgTRYmx7HvTpOy4XmgZO50CvRhiR
         JzSqCae8tK9IGfckTo9ncy/em54OBHEfAMOMVoXQ8SIhO+W6Uv8ZS5URDgwPlbJ+6MMj
         8hqA==
X-Forwarded-Encrypted: i=1; AKwUvByaWv5BZ2kIpH0mucYW0pV3dBoISxiMYwKx+45mCr5BzbPy8EnUzq0RnWr5NZSXbMwuwGoOag/7echFyrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i+fsHJdrnaW3ZFFo1GHuq4/4/nw1kddLf6D0Ao+TN+pbE2DVZ
	1EZHe+3cfFMcu8QxgW7GbVgvjkrp7N4IN/yPcRxjCYdw4Vv9MQ47ZDpWA7VAIBi7lxTl/RRsFEa
	ZfUDa2OMrc06dMJA1EUtHxH1mDBZRtBEiNbIa/M8V3VmcYpbJm7nExddY6eypl4Xy6Pk=
X-Gm-Gg: AYBFou30nBDxtE1X6PKnWfUdPEunbMVVxYyz2qx/SF02e4pq1F6hmm5KbYonRa8DKBl
	fd70thywqKo0mzdR37obbkncyq5nZvYyHDhlNh4aHXhJdEUaIrD4+sad5Rq3I4gYkIKvYgzzfe+
	xqAsWjtRyKx9GYgPbWLHMEAR/rl9DFu45dlWl2PZ/ciWmcjnUwUJLWXqkPzSPYEa/7IyTo45gSr
	HbJgdrdMDI5M62tv59bGnuVZaZrRRyuAgJDaTM7QUE7dzrvp2hJS8mbkayay8KtxEIczKox0chB
	o7cJ4+/iaFMO39/Vy6x4TTPeZigrgqAfST79OAy4esnc2X5egRQtYMfrESRNypudEt0EhBRQtHQ
	1hRXBZjrGDbO3wdd9Y58NQqmDLppJ097bG0xk1qkztqOGt+gc5Tw0TnUQmxk/pT/r5muwWEFsoc
	9ZNZYcNPrGaw3xpK3I
X-Received: by 2002:a05:690e:108a:10b0:676:86cc:c3ba with SMTP id 956f58d0204a3-67ba4f54b7fmr6712596d50.68.1793884082939;
        Thu, 05 Nov 2026 05:08:02 -0800 (PST)
X-Received: by 2002:a05:690e:108a:10b0:676:86cc:c3ba with SMTP id 956f58d0204a3-67ba4f54b7fmr6712590d50.68.1793884082464;
        Thu, 05 Nov 2026 05:08:02 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:08:01 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:15 -0800
Subject: [PATCH 4/5] arm64: dts: qcom: Update IPQ5210 xo_board to use fixed
 factor clock
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-4-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=1379;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=5TarJGRML2ryvcb/ClCF+1MotlwLtOVZ//s8pIACGiY=;
 b=3mqRC4X34pzKkW88rrjp6qxCP7hp3Ti8ZBVcdSCHjWbioQuMLytsd7ZQFXH9LJDd254AKeU1X
 UORE1rhCVcsCm8iT4fKvmQPNiXsSy4KDI90CKFvid0gAkha3KqfZvpp
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXwwPSDQ1hO9mM
 BVq0kmpH5rwvvsrOxwdSeMB56mR0+bmafQsaBytLlDTC6qIU6YSMeQC3ZwR+L7umpFMdlBLKsoJ
 OXXwQGdFbtApgIHjoL8XuJ1GS8OHclUzw4YwdFUbPPkJl9PshiWITGx4OWcrzxNsHWNuag+uAXe
 9jRJai7R6Ui5vn2L82gkAKGM8iQFSejf02hORIYdRevs2SCKwv02ZCD4vky1vkz8EFmm3nvM1jO
 IQkcnwNBjzX4odNntuxm1/sInou3u61Sa2VbcNgbBBge1/3mPLykD7wJ6PZ+BcFV03d8oNkW1/U
 fTv5j7MCOki7Zzoz0tVCIqk+/t1g5c3JxusHwcAEAGkpMuJXwIHoRTfzszP+YHKSfBPL3a7JZUn
 XcW18xqInxR7JxJDo0WrSrPNOSFV77BV3azeVvjotVdtH1lbs8qLj2857jWJxE8y8ICKEaPF6DY
 LNs6oKvJkY+2e16w8xQ==
X-Proofpoint-GUID: xRpthBOBrPsDN5t-zwV983eIZ_Zq5Sf4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX/QtE9iZdB1jT
 EnNfwJ7KhYF6JmBcaQ/GNFksH+wUM6amv1/keFoJSkTHsP7KddMhJumPHmoyL7GOz06VdvXCA2V
 LmVWUfHDJ7mscVRlhdBfs2wzCN+HDEg=
X-Proofpoint-ORIG-GUID: xRpthBOBrPsDN5t-zwV983eIZ_Zq5Sf4
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec7fb3 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oqiXH2A-fwTjus5yMdMA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

xo_board is fixed to 24 MHz, which is routed from WiFi output clock
48 MHz (also being the reference clock of CMN PLL) divided 2 by analog
block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 61a53361138b..519307c6b61e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &uart1 {
 	status = "okay";
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHz, which is routed
+ * from WiFi output clock 48 MHz divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 52d851a0dc2b..0c1ede0f73b2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

