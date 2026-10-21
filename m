Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568243;
	b=oMBKdF8JjyR68wIZSADBZ1mAgqV7AquTCZW/f8+OuniQAwOgynXjC8aNPlHTljNrSn4u
	 QseSyw4L9e5cGHbAWmytfT7isFTfL2HxpVKr6T4BivIlTPWTmH9AB5MJp1w145CX7Rj4J
	 Nvgkr9TV6zxWieVImyb6F2tM0JPCHFMFBPuEJRRNlHPCbSXadrh54rhyMy78dnC/k6zrm
	 GDmXxfzT2px+/ntljOPboYI3YK1Eq9GGMtmCs/BFtr7jGnM4g1OJKQpxXxiC3jUyiQJYy
	 ES4xdMpLOFpWJs/+tCmA1dMpoyiDOdMxWR7XonILieUw+EaAoJeQfh/QqRSY7ELgtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
	b=GH8oyjxn/G+UbrHAsNN5l0WLkn4sYEPLyKFBitZhwzdSm2QpK2MACfkJ7cQ8kpDGttB3
	 enTQzsABcUdE8X6MlS6X4DXzs6OfLbO3XlgENe5GFaneYp4fZ9jDUJ8ZYiZuxDLgNboX3
	 AUuLNiCuP5SB8SYoOVTWNB9rrBqhwZLPOSgJ0cs9F1/O/9Dxod1oNgPGa6mjLGpsuCjn8
	 DobEKSe60gA1Z7TjvdgQB5bRirOknIlYZPUKo7OChXM3sX8iJRYVi2QokqsK/y/dX/0TK
	 d3lMcrsTWHGBBUEc52uHTe1NlINZfx6Reyw9XVscZLA4juTjcuLTWKEeE3/1yu2zzuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuL4TOi6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jedbhIVG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677A606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A677A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuL4TOi6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jedbhIVG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jCEl3711978
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xFjlgVkkBc5
	JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=; b=EuL4TOi6VdzJ6Lyn5azxY6S7176
	tyZj7tTeneP/jkP27UOzjQ5YylbTBveqHHe8i+r8U3a1mKzkRk5V+1lW9Z679yM+
	2aK0lZXV4Q04vOt988wMIHd2pPYTQb+e/F9Uyp5nNS3+X0FroUo6UqStTvccbNkU
	6LyUiZwd5Lel33xOoJas16+7TT1Uv6OUJ82mGEs5qdDDk/sQghOYTGrsCg8Xt+/a
	pHCR0QDScNXPkmcHoLcLJeYTqacWR3MePk8d+e6rrCSJ3xvKbxInEATx29h0/69L
	0Gz6NeCx5uTOiWTJbGWodIWOY8on2D/TTcUvP2y5N/sSmxrPcYU1oZZ6h9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v2mge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c902e0da2so1946316eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568240; x=1793173040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
        b=jedbhIVGPXEJpKEkGhWb95ZWA0cuqjdmepNYvF6LtCpnLvYaFOv841RHOCTS7dcZNW
         6rWEHpcrk4AVKmF58JyJZ6myH1hfMmhMu77E5kDWiJxdamGuKWnZgxLllohiHBIn7VL7
         Ln+XsDIOZkXEw2i2vYPlV0B8D5iiis7KyPiJDDSQaVfFjoudZmk0wAjEqZB3MeMSx8tV
         LvCZPwpOkBkpAmjNejZFg/BYJlBcgZshZavpWNdy2/W3xnfi7F/8vT5cUuasKSl1sTsq
         7eDARGOuDxcK/jjiVH6l78KdiI6SlsbeRJq43N0mtFYBhS4y7UVc/anABiop5GZiXLO4
         oTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568240; x=1793173040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
        b=GnHFJbxi2tJrcaMU3Gx71taLD++QxjGUbQyATTQMSSUx6MGMViN+cAi8+diC67NEfH
         RmgrErK5uxT7z/wlEc1BCPHjP0sl12oRExU7NqaX2H7ok5SNA+uDQf//6+O7jaM7uSwz
         aqSMee1Msmn1KEZjhG7WxZ/3S0TdSd6yb1sjAqBm5lJGI2/gMvA+zU7N9fhJcNYJSnA4
         WODROZ77btoYBTGXPSbWqsOVN0OMgz/34r5pWl2fJgTrj3CYP4aVOewHdofGEyGPqW2s
         x4/smNWO0ZFdiqMpO6NhgVgQqNvoPTjFpo5n6c/QrIGzomyMYrdwo8XHJ2UG5sC5jhcp
         jD9g==
X-Forwarded-Encrypted: i=1; AKwUvBzpRRRl3o2IZF/6UuIGALmHa+U5SO70R9itCv26JHyqQ/+2x63Yubiovq3bIR19dfG3THHt85C1ZsOerm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ5tE5ZP40OXXP49sSuvEdfs+wzgOszdnOG2+wEQTiInHRUbgc
	qpq3ygddYjbv4bX1kUUTkkTCj8BwT6f+irvplGlwRVWTs5SmKFqc9SIeDSStsxRYBxqJmccK0Cg
	5bM7iZMyIzUDIoQuPBz9I1172RnSO/ahSQ3D2Z+z4eDKhPT3a1Xgu5iLRd0AuzJpq7po=
X-Gm-Gg: AYBFou34wxia4pNgLGk28VuTFPN6NGkRTume+xIQgn0vR/bIIIHHLZSZtnt/sNDvuC/
	82/Fpd9MAhune1ZVRjhNz8wYj5pqD1QNjnGYl6MqZEF1TRP6dTPUG2XD01NMfwVgDAK30PxCN5d
	XVIIOXcjN5xEBdER7c4OPt/aBcds5dXbbE7IUqLAWOliTvnIaJvcSbYbhUzKU20HWQxSNCgjn8e
	k4OaYIAsI5U+LWhMqw7kif8/zQuPvGEKn1xgWmOc21kd/dbGd1gPxiyCpeXyp68Oq/g6twvm1zA
	A0QGLyUasuAFvvkohy9e+1g8Be8R6NmsQ5ioSEl01Em3RjTvum6kqrja0w1tQ4h+oVD4z8NLL6H
	Sawd/iYX7rurbU+8bHp+0hYBMRd8brjVz78TyBhVXJm2qMqCoeeKyfTlQo9w=
X-Received: by 2002:a05:7023:d07:b0:143:3769:c680 with SMTP id a92af1059eb24-18dc14ef3cemr6480195c88.25.1792568240393;
        Wed, 21 Oct 2026 00:37:20 -0700 (PDT)
X-Received: by 2002:a05:7023:d07:b0:143:3769:c680 with SMTP id a92af1059eb24-18dc14ef3cemr6480176c88.25.1792568239738;
        Wed, 21 Oct 2026 00:37:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
Date: Wed, 21 Oct 2026 15:36:31 +0800
Message-ID: <20261021073633.2163128-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXzTaRuemCGXGJ
 YKBgYsEisWhzRl/7t7B7WgjfLyUD2nGYCWLUHTT+S72ZlScz/TzTZnDkfmkiRt5NHAFOqCkHhOL
 w7LtVmBG5+Xz8/zKbATnakNRrKkBq1k=
X-Proofpoint-ORIG-GUID: vL5RnSpVG5cGZCwQ6Ag3OsRRVqqIw9dq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX40B8j+ClUwTr
 R8GbyibxTKbQ6bWdDh8ChTDnnYVJHAt+V0kugjectZO6LrOWWPhY7qcpuTqgfyt3TTuFX8MRfWP
 AvNq5bUB8G5q8rdZu19XbOPXzSTpgMNvCuqGXSX6RtREkb/PpNPzZhSOnRslcMuF9zvjHfzAkbT
 NWxPijocBwuHQzKXuFFHqDXU1IJfqoDJGjGhxa/izIGg/Kf0YKm76J9v6izUwwbIgG5MY4tKDFm
 Nw397puWgAZmN481xITff2VUhk974G+i4GeGsdv0D6ioh2GwrCtvZOrl5HBsB9uA+l1sQOi8Mpv
 3x3XgKEODWayObJlqNUJDjjlpUD9yZzGOnRlLuMP0NwMgLXUjA8iKQeiH1mFlReCNWoT7DjbJLM
 MpbEQPrqRIPOkPfqZt5LR9wK+hVXrSm7QxbnskDzAffSKw7U92l3KfQ4Gpqw5JxS1IIwqtKFpFy
 ste+YjTqjqVDGCNlgbg==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad86bb1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=W6k6ulCq1w4nxQ-T7_IA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: vL5RnSpVG5cGZCwQ6Ag3OsRRVqqIw9dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

The i2c18 pins (gpio154/155) are configured for 2 mA. That is not
enough on nord-ride-embedded, where i2c18 is the audio control bus
carrying the TCA6408 expander, ADAU1979 ADC and PCM1681 DAC behind
TXS0102 level shifters. Transfers intermittently fail with arbitration
loss and unexpected start/stop conditions:

  geni_i2c 890000.i2c: Bus arbitration lost, clock line undriveable
  geni_i2c 890000.i2c: Bus proto err, noisy/unexpected start/stop
  adau1977 0-0031: probe with driver adau1977 failed with error -11
  reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -11

The failure became much more frequent with commit 8cb5c17be3a2
("i2c: qcom-geni: Restore the source-clock selection policy"), which
moves the i2c18 serial engine clock from 32 MHz to 19.2 MHz. That
commit only changes how often the marginal signalling shows up:
reverting it, or lowering the bus to 100 kHz, still leaves occasional
failures in a codec unbind/bind loop. With 4 mA the loop passes
reliably at either source clock rate.

nord-rrd uses the same level shifters and has not shown the failure
at 2 mA, but that appears to be margin rather than a guarantee. Since
this audio I2C arrangement is the reference design that customer
boards will likely follow, raise the default in the shared dtsi
instead of overriding it per board.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..1ead642254e0 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1221,7 +1221,7 @@ qup_i2c17_default: qup-i2c17-default-state {
 	qup_i2c18_default: qup-i2c18-default-state {
 		pins = "gpio154", "gpio155";
 		function = "qup2_se4";
-		drive-strength = <2>;
+		drive-strength = <4>;
 		bias-pull-up;
 	};
 
-- 
2.43.0

