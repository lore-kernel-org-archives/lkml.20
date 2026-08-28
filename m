Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6143F448B82
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920709; cv=none; b=B6OE8VZYatLshW7S/5O/kiEw2zN5SfcWKBYCzpDoeA6AigWkf1mr8akM/icl1i+FPNIEsyLnnTZsfmcF97lAolkJ4hhY7mx+gIjUuXLSIeit+HkpKNsfKG9v1wc/xeLKPDB7G4Nm85VdoAhzqGEgAXK79JVRK2zy97HYsgOojEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920709; c=relaxed/simple;
	bh=zuOlkz0pOCNT/GiaY5MrppwVUHwtw1Sb2NzG5lI5mdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xety5spRgYlqq8PskbaNZwo3F6pr8Dg/SJdjwaYQ9oPG3po9tOil/q1LXA4hVIAXE4qUD5BZseQUnSNBASYyvsQ4WDxh9I7SP4Cd9blsuJ/KaMEHDDOIPFmcEDxvftX0xgWgAGAL7KO1rn1UUEEnmHVhtbpP4VefS13Ipc6XmGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1RSb3qH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sfq4Vdoq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1RSb3qH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sfq4Vdoq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7RcU2061323
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJwdJ7nWOixJVF6VkFy7FyrvOiCvaX1T+cB5raNhPXM=; b=F1RSb3qHSOb0Q5+O
	KWOovrMpJEhdVJldoANyMFD/P/RmB8K46JWaGi+BhSCvFXA2T1bhXvIYNS/of8Gm
	OkrvUJgy4/9hjZrrH3HqnDx3xutPAWYyPtNIihprgFlnBOLME3FjUYeM8MfLDjfa
	8LPt4Ie9OcN19+OeoRSe9cUj1rxcxa63sqo1veV/ozjqabx2SxyQg6taNKpgcRLD
	CRmJFVTGZQS/4lSnmTd4z5WeIznTNx+KWDbztx0bm9P+KnP1n3KQNHEuzlKI4Ybp
	QfdLbIB0OEvJNPmRT8JKWQUFxBUB7QN+z2auBoSDT0DcoMKvqfz2l1c3LzBLsEqo
	SV8TtA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu9q94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:38:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so24109211cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920690; x=1788525490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJwdJ7nWOixJVF6VkFy7FyrvOiCvaX1T+cB5raNhPXM=;
        b=Sfq4VdoqNTooWLwi9lqo6ZrRLMgUNPkiqeDPwMj1XAhVDt6D1cbr0CRsjsDbesRIR9
         jHpPKlU7xX1dkANB0K1bjSaf1GRmNDmADbVvTkdhPEPSNJKlPCgnqXkl16l/RQEPDboi
         Euiv0ztd8iUg4K2/Lz4YRUSi9YZS1JnT58XV13U+kJ/TjNFqxZb3M8wcdz4oP3uMnDsR
         +48khVzEfjaew1iLxKrjxne5Ay4WcT3MLy/aq8vZdDCYSVNyxbA9L9oZ4uyAi2aWpXx6
         dksjpYLBk2JGfWREmSIC0g+rrSvkHPKAQnBUMtQP/VkdmNHZJ+E3G25b2HNu0oKmzvLC
         uyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920690; x=1788525490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJwdJ7nWOixJVF6VkFy7FyrvOiCvaX1T+cB5raNhPXM=;
        b=njlWXV0+W0emoUItJsClTAa1nu0VBf8fbvrjm/VyERJ1lIEZq5oJ38Xfrwp7syVB2G
         nzpAMXywSRNbPdslASp/Z9doe9zJW8AJr5LeuDMZsqAZ7UZHGErlK2f5+dJkxQefCV9s
         N4BiKazySyAQvwg81Xez34oeShNnheYUifwytPJJ2oG5G5xRQA4BSRIkmXAmqbql/Xy5
         LCEs/ky4lxIo8WApzDVAH8/q4s9QHCshrldnK30cA2ax0hGbEkNYc2GrhfCoD/VANwdx
         EdAcIlFR0SSQDCDUz3Bd0DNAKpsvolz2SEkTkBMLFarJ2P0sNInRBjMDzAlQGThB4dm7
         1lPg==
X-Forwarded-Encrypted: i=1; AHgh+RpM5IdLOn4xL3eXsqV6QtdkDkFpjJMKRfxbVIoF8kWtq8ErSkxmrprKmb4vw9nXkFF0TaXUdmnL1L/s/ag=@vger.kernel.org
X-Gm-Message-State: AFuF++mSYD1TN6oxJ1rxlro7WtQiA/g1FViXDCih0ymDN2fFGt1c1JN3
	aQss/bPSGXzr/uUBVlBZe7lQO414UtDY4DswT0pRtr8la6RvtFVT8KH8+EvCtXllx11ECAHA4U/
	udPHrLaJcIgfsbOByPJUBnEeiB/aTJc783xlB/3grrWO99hTEqQJ1XljVZCb83E94zZo=
X-Gm-Gg: AR+sD10dCj/HpSzHahl+TOVtmXDigZGagTT+Q1fivlArX0pUtlEZn3928/+LbZmNSoG
	HjAKeYwBZoz3L18t+DKl12ksoT/I5b30ItR4bcU512QFX0zxOHhGJl4W62i6PprHe5jXGY2aaHG
	TkWC6a87OjAky2nKmQaLNt9PBuMJ48yfhq+XsS5KBW1GblX+23LyD3W7hVV3GuMJlTkl1RvrKkF
	oi+J7rV7u5Xio+DNcTkZUmsmLNvb6BXi8n+uvdgphcbV0S765Vc+Mc0OpAa5sGu1Ga07UELmGQg
	bEM9739qDw5XFsGbziJew5KbAcqxDP5i09gSsj6q7r3IAAAtB+3y14rrbc4W/2pI0UyauMMeX+S
	4T3gCZHE=
X-Received: by 2002:a05:622a:11c5:b0:52e:25b3:6b0b with SMTP id d75a77b69052e-52fa1d2afecmr144978021cf.16.1787920690306;
        Fri, 28 Aug 2026 05:38:10 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:52e:25b3:6b0b with SMTP id d75a77b69052e-52fa1d2afecmr144977311cf.16.1787920689742;
        Fri, 28 Aug 2026 05:38:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:29 +0300
Subject: [PATCH 10/11] arm64: dts: qcom: monaco: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-10-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zuOlkz0pOCNT/GiaY5MrppwVUHwtw1Sb2NzG5lI5mdU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYETuHnzmSeqH5oSOrACC1P21s2yyNGO5Comb
 PYewZzYCEqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBEwAKCRAbX0TJAJUV
 VmHmEADIlKSvouwK3KckDYDIDTwAfY8+nW++iYPSyiDYlaYjNIcEcztiKAUdl/cDVm9Jd6TfEDN
 avcBywATRtdWkYl7osyVwLmJSH5SBKJTN/o49PXTPHBSFVFwbUt+cPJx0HgIBBKcPW2MTO49gRw
 2GOVWSQ1eJd/Lg73wyIw0MDmHU4+ZzQJU9rPvaMH3H/bYoF8/OhBncX5MLC8OmPQAyw3YbrpRIO
 piuQ6FULhsVzh17U6EZTqYBY+8BO8yR4merelYTT28WB38M9qNp1l3DuYHy2VlzEFwSb1Bw84u+
 yts0Aq8yieBH4mk9SvR1tHtcOdTRgfwJC8UiYhj+v4sokoDPtuGWHbOVjXjRVWEpIUJ2WHQTk9e
 1pn97i7VV4Xod/v793M65o0GJjMzjhzCV9hv8sCgsbtOtxSe/IsT80Mv/ZwLRm+h2e0VkVp8ox1
 Ghz0EvzUFwCdZ4ZDna0RZtQ8yEf6U1diOXTCjMSPEuie/dlvWsAuGFvEowCquSz4f5xtsnZ9gFK
 vNnm139Qm2L8WhWGSavz2RnZrfocqgmKnsQVhaTLaHsLasN74mIjnN5thQktK+eac5woAVPmS3z
 H/Hq4KZMHSewqOsH7N1L4NIDJTM96sTfla4S8qSWUwuv7StgZbBn7h4TpWo6UNKVEdD0VzrsdBu
 hx6fwTesHhefPfA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a918133 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3uRjxCqquKrBO72mzOVYyAKEC_tStenY
X-Proofpoint-GUID: 3uRjxCqquKrBO72mzOVYyAKEC_tStenY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX4qiO5FJSgw3V
 Hl9h1tqvsVQRMoftDkrT4ovUvFFBJPiD1HFKgA26WQ1UDjcNiQFUnGL6D92WN88v/pIjZyWXYUp
 Ry1p5c14FV4olYg1BZm+wxAzCo+QvR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXwB9PnSNzowlp
 J+ZRC0bas+5CSuw4VcvcY44pHRs3E4vA7MPi1j3og6VFSGDQXKsqfGauZOwJfZFp5uUjPjHApOn
 Dlpf+3kL3N9MOm7poyNdnLTBa7dM5lg8ICuPHqksOxLk9h9mMnbDeEo1RbkEt3yNnLe6MGvDjji
 f/l2ADOYPyUVWvjGPOEoXpcCoggYOayqjLpReH+unR1GWTxstR5LmyHdtQXzamgcIpqGnOg4lrH
 h1rBEweoYnd4iANW2QKrdF5WxZTGmXPwbAGi86tZG17nI+9K8lLUV9RaUkdDZvv8o0wTP6/PJbT
 TQom65B+SU1vLkmhW+WWuwEjY0Gf6g/VwezhwYMeDJCVu0t4BE9OL+9TJxGZ5XLOyzXL8r5OHMA
 HlzzbuBjuZANDLFNSAXJ7jZ4yihysnYUJaZE3GELoU+LE/FNoFqMu7RKg7l/5FL+gB47LGTTSi5
 bWxb8JEP4JdpJce6sIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 68d5d9701a7a ("arm64: dts: qcom: monaco: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 ++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..25980c003a49 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -585,6 +585,10 @@ expander6: gpio@3e {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..e9b807df4a8b 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2723,6 +2723,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		crypto: crypto@1dfa000 {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..fbe36a3fc47b 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -569,6 +569,10 @@ dsi2dp_bridge_out: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &pmm8650au_1_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio7";

-- 
2.54.0

