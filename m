Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773CC34EEFD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358340; cv=none; b=RYnWQNRXwXjCfN3xI3OB9rJ1KVFHjnXfaTPWsQQPMXh3/QA6g7tHVizYbinnnPvvT1TJuCvnYO+/IAI4NBVcstAyR5uJ1p+zpbfQke7VhQqZmGxx5kYhfqxRZ5FxbJLiQSbJUSZ9zuFs+/NV43Du6injlu9y3BvgvPoWVmb1S/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358340; c=relaxed/simple;
	bh=9/0X5x1xXm8iZzxib+GdUs/t5i5t4uoWiZA9k58E6MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEwJBgxIbS81dWqTgx08kCfiMO3Od+6Oe5nzky3ZIFXTiq0vz78os/LlAEzQWI7LiLm687s/oDDOBOGSbPQ2J9ksO5Cu9FPhz0yLtyPmdWNj86i19HYF+kMvOz4X3TVT6GSe/kbTEU8FQy77wpFgtAPqzeIE2NHmOuOjM0BreUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuXZDIYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzZnnXII; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuXZDIYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzZnnXII"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69776U593213245
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TrPqnuCmGBJoTkrNjmurDatiLKx80qmQsRw
	Xr61wMdo=; b=KuXZDIYXhNjWX2UAjQ2k1PdIRJNrI5cxJVLPWSTq1YJhTl5b5+q
	s9jEfkvitihUgM918bI6yL6429+IeBjgbzHYB2a4VqZ0sO4QHMo4owUJIyKDzot2
	iTW9O1FVo+szxpwsBZ7O2ijLMmzFUou5jEs0EQSQLCvL7wdngpYDNpkQ2M+ntwQ+
	BQTuuRzQUojg8TCxv8yN0ZFec8A4E/JTXIy+dg+q2Qmpk0tbJ26RV52HlRIAc19i
	pFLS1eUaghd2JEn47pumuO0wNqX2y59aDmY4SJ2dJScsB/Iae91MBARlnTbg8jW6
	0LlPtaP+/8/Nos8kfTQGgbYYs/xF6qb8ugA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcr2dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:32:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so2342500a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791358337; x=1791963137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrPqnuCmGBJoTkrNjmurDatiLKx80qmQsRwXr61wMdo=;
        b=KzZnnXIIxUIURnbQvB8pjZQ/ahpdX7EYEs88yOuwqxK+ua+entJAfaUO20dSqTa4wG
         iiAfKf8BeN2Wsf28nnrsKz2XW6QRVaGEIBsJks+SvfaFysK44M8GOoNX6soj62ZEYL5q
         tqRC2pwKzoWkrtNGUnMB2a4NtubkcHzQjPQnNXuBm72MP16tA7rjNFdic2oYPiDFRCYd
         vFBAvCsPzDkZR3dtdWdOagy2zImra7cdHURdKW9mX7bmR8krcoamxs1FMKmvuFrDFCQ0
         CyezDGvtcrBsjhmzuuHS4q/u8ygKbamgxy72UYz+llFVFojwSrBYAc9u4Q3Svw34Nisx
         G9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358337; x=1791963137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrPqnuCmGBJoTkrNjmurDatiLKx80qmQsRwXr61wMdo=;
        b=pkAJOSkxtW0NfV6HWQ1VeXr9pqKC1tSMw9ra65n7eZZ2OKm7gchiA78WYAdFA4cA92
         taJ1ITrDvHgfxIiy99cEufRCQRoMUT/M9lZFKc6rT2nXs4ofSfN1670/qQlawpJZNpkr
         eK14olYuqP1LzCafnsONisLdSNgC6rt0LIiJxEDhyFvt0yq3sgPyhHB2oit6feOe2syx
         FDhGsDUjMzBAYgP+d1tfIFdPQ19h6oxjYxgf1dJpv1Jy4AmJcHiaUfemnN0SEus1IOVl
         uDFfxpGXFASxYav4p29TDXueonuuUCOzixmU4Mrzmkf1/Z3Lbz2G0WndaC8motnlJuN3
         9NSA==
X-Forwarded-Encrypted: i=1; AKwUvBwQh+870pk5psbF9VGfjBIBq4ptfq3UjZDapmPojeMcZunnX1XoHl1kFJfbbhmLeufVA3CErRH1OOCboYE=@vger.kernel.org
X-Gm-Message-State: AFuF++mKtXjXHfGRPmwMkO5G9DBYbp2WF75mJvlPzG1o6/UjxrJY2SG7
	5WJPFni2BKeTZA60jlm5PDyzFmNlK7Ob6W5y9gNz0Iqc0yKBUgVJIC13apWq/U+a7O6Wje2ZGK+
	O3IvEaU3lctcVKo6ltJbCdIIGlZPQUedzXTb0J7B/lwHqYIEQlTMWYnDEdlu2W3+yaJI=
X-Gm-Gg: AYBFou01YstEhStDRgNwT/RCJwpOhxaUJtUXrHzK6PwdFr8f+lsf43Kk7fnBCHoE6Ph
	paNCqaDprg9/8QKnCt2En5xjY/WhEwLAC6KlLCeAexuc14DZ2UJz971ZuVlBTpZf5QRIrGmKg+B
	OH3wWj+XIaUecNKiqNr2P5WKkCwWRAjGwewwZDjQj1VQzr+Q62UpXRCtEj8ve3JvKbdxur2UVk/
	6TFcgtG3molZ5UzZsLTND9m2jwKivO/J4EJ05DvvFK22EhXMFK6YlThTne3N3+84RIkj1ZOOCRt
	p91rJq2gjwhURL1+YfSR0Qu5SCOMJ8NbOjV77hzIp7MTltrrFN4VYIBdRxTcTDvLr8C0s61bwza
	85i+vzp9s0sX6mkYJuEdnLjvkSfINJDdA4lnCQ4x8iM4AuyijgwwwGBdOZcM=
X-Received: by 2002:a05:6a21:3995:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3e13405391amr1044480637.22.1791358337260;
        Wed, 07 Oct 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:3995:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3e13405391amr1044459637.22.1791358336760;
        Wed, 07 Oct 2026 00:32:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a9ba4589sm956037a12.24.2026.10.07.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:32:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: negcc-nord: Keep the AHB2PHY_0 bridge clock always on
Date: Wed,  7 Oct 2026 15:31:46 +0800
Message-ID: <20261007073146.3162478-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O1TQY4dU_JJnrKpNOgGGKiJCQn8phzNr
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac5f582 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lWL-Se4DGgWCUzFVucoA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfXyJhmk4pWTnmJ
 uqEKrS9PAvkvzcPnc7JcgtEuTFmvSyclGizjiBaDWxWdjOu5dggN5DnHnwloGWHDSvkjI4yUAGu
 7J3Z3ECXZDMBTAuw1hCa8hQxK0MVir4=
X-Proofpoint-ORIG-GUID: O1TQY4dU_JJnrKpNOgGGKiJCQn8phzNr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfXzDQ/i6uDN32q
 DXM9s2U7FkkbNDyHD/YsEqR24y/1MBVmMe9vzBDsvqX5FVYwF4Jdb0erF99QlatpwzmCmcFFKM4
 pD2McV1SC6FVW4qsSIbdteFv+Zy5XjCnpt1SH23BQxnxnMWvZtZM3hmZbNZklqU7RNeYW7qpMog
 2bsBV3flgdmfayGXTDY3mqM3qXKC6O7x8vA1Gx20SvJM/igDdPb6J1EZRUnmGDgBKEb76Bpw1Ij
 PRuIe22Pexvvxl6gOWE/IPN2UQvlF00yYYi7r55h7zUSs4XhLMF75aOEUKIK5v5u/vuLdU+WZCR
 LPf9CD1vL9fEMBWo7xa2O9wdvRHb6mqZwyu8U9gRHfdIfqRflCy/GJtVnBrKdwmCBNVcmxULa4R
 hlEwrAvCsMJ6AJd3scPoXdh65+bFWQVMBBHaMrzbYi5oFrMfTGCSu7PGevZSEjqWKzzNxoTJC1t
 TepsI7hTpoe/ORNF8xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070028

NE_GCC_AHB2PHY_CLK gates the AHB2PHY_0 bridge, which fronts the
USB2/USB3-DP PHYs, EUD and PHY_REFGEN_4. It has no consumer in DT, so
clk_disable_unused() gates it before the PHY modules probe. The PHY
initialization sequence then never reaches the PHYs, and DWC3 core soft
reset times out:

  dwc3-qcom a600000.usb: DWC3 controller soft reset failed.
  dwc3-qcom a600000.usb: error -ETIMEDOUT: failed to initialize core

As a result, USB on Nord only works when booting with clk_ignore_unused.
EUD has no clock binding and may be accessed while the USB PHYs are
powered down, so modelling the clock as a PHY consumer is not sufficient.

Mark the branch as always-on, as is done for the AHB2PHY clocks on
other Qualcomm SoCs (e.g. Kuno, SDX75).

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 68ce4d6278ba..9c9b4a83df1c 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -812,7 +812,7 @@ static struct clk_branch ne_gcc_ahb2phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "ne_gcc_ahb2phy_clk",
-			.ops = &clk_branch2_ops,
+			.ops = &clk_branch2_aon_ops,
 		},
 	},
 };
-- 
2.43.0

