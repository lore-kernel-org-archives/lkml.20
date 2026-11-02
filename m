Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620146;
	b=3GCaIa/8t/C60evTvQmwEDfizVA05ldjWB8pRZtH+09vaPf6mvk6+8CHJJMfbyPOxUrr
	 gGRNqI4yXXsfIUORRoWHnUv2rcf+8wFjRp1Bb5to9mKhoIUecwPOTy4XwM28bYcPSekm0
	 Ytx1QHLSPo1s8N59opD4gy5QtXumJxlbEJVe65wtLO5xL8C4X36k/7RHekGOIOmhVVvrp
	 85fEPeQuDcBPBsoQBn5TQt/kRkKo3ulJV5Od/buzKt1k0O0GlnGxLV2t/G0QXCoMS2czo
	 5NYsf4Tv9txQBM52pZPOxohkYf3WxtNhy2Sxj7aEc0sEVP35IrZSVHOuFFKqIdy9bjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=;
	b=WCW7R29I6275oI95/uBFGQil5e3lIGnmzSwVkcUiz6P6mU9STnvq5nkJc55WXnWSSIEZ
	 eT5kLrLo0SgkAOSKx2hCxFNtVq89ILgXvr5vcebJNiJ8VUbR11lpqGLmi1s8+owgEG62R
	 0pO1yX5YYgWeFAIsYBUOCgzgjai/1d5aYLk1t6h/jICek5xnBBxKg1j7bW0aZTcpeDsqN
	 8B4vrx/qi4m5cft/h4SeuXUfD+MOWutvSF/YCSDw9YI6+MigRVJ7k8p0Aa0JrrN4V7LjH
	 6ICNrD0CBlXrzF4YnIBCf0r5gOEmSN26xHWn2lzvVr+7eVLl9R21BekHId56TwYf3NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UIATvmLO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wzl8Kh2z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB545606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB545606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UIATvmLO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wzl8Kh2z
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ADxd4039441
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=; b=UIATvmLOWQpaXQVN
	oGiCbTvXKK5nFoQAnD/bxxWjxPEGIR7w875WteIQuZvgNtw/JOlZYYncbPsW2Cwb
	lGZHvoRzoK3qpEQ4Mv1OwSlZ1XnVQmWrPR73PIKJj+obSGw8TOGFcVT6JITmth4y
	4CWEy1X4f43m6WzQiJl5SIq9nd6C3Wvol1vpwMMDrj/YR4hv62wC1vegav/DTmn/
	m2LmkEO7EkS/W2LSS0G7n6wlHmoB9kr4f8u1skbtrLHszBfSpKXrTWfsz9dEtDPA
	T7XqraNVmTpc0hmPpoZnOJXztQLNXONYiUBA4Mw0yVm9oz/Uy81MXI/TdFi5cI6h
	BN65Cg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18y2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:49:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so606127685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620144; x=1794224944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=;
        b=Wzl8Kh2zfhAXpthsWdJ21rDDhz/L+jL0r6sEnr93shwUEr9Dhoavpi73d2ERli/t6R
         0VKhez+7AIYXTuYlwCduN2U7B1sRKBuv6JH56kvIl8Stu4dLg/3mCue8My6ukNEhr9BC
         S6hHj7YEna8aLLEDYAa32YbM9Z15245YZw8QSYGoaZjX4XnaYQGnDVw+13EYi3vE1ccd
         AwBd8CE6IkRnQGzkQk0LykJNhrlqmxbzyhTsBA4z58qgZxkVuJQMBgCFehRL/SumhLQ0
         qi374NJSF8I0lAySY6xh/2+m/umLgnW+x47KwwZ4WPR5kOHMIKtTygd83Rrt6ldrcB88
         NvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620144; x=1794224944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=;
        b=NC5qS2tVib02x62aqw4n14+PzlI4oToehFQyQVMZh7dNEv6CksSEJJL3fI8UizIMXx
         OMnaxYQ7mrr8qTb4wbvoTvOT1RogkcvJwxYHHksnLhkX76G/ePSrAufrDTLqc3B85UDT
         llS1WjaQ6KTjkjMJdCNfcbV6YC49deeIYRzvqN8sXJo3Ahapx7W7FHldnj7BBSZX2VJi
         meykOkNa1r3I+o36+wbXclK+4TQbUj3q5tKGIcuDB/cwabZbqI8IChSkFzVm2oHXobBN
         krkE8HjtjYvPmBvH7A9Wd8WfNgtaLNBJb9LBzyUTEdzkrKhF4xDGBKAmUdLOJ13B6Z+w
         nA9A==
X-Forwarded-Encrypted: i=1; AKwUvBwP70kGrmMDJR0wltoDX0qE4Nm1GSjjL/WrUQmyGKJWqS4CY6b3Y39/ODlGZ7owhg3bDjLe45U9nOTrPs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtC6eMQPcySZ2IqhICaAFWKrOmq8eFSF/ENc8aswHN/R/AKYX9
	GDWnUdtec5RXsHEYx0hRDQqtSkqOIj0hQ2NKc/Q1r6+JTot+Z1iUFwWZvbDsxvUS4ETvT7omJ3Q
	09hAjETpcpTcborPIOvDhC6CzazwczL4b0z9UFvT/i26VR/ZC6APnCTZ1QSORv5dl2UA=
X-Gm-Gg: AYBFou1WnneQUZYvHWlGN8C4gj23gmYZ9zKC9dniNVg7ZRN6o1p+7FfoFZ34ElTbp1x
	wkdknauRLZwJWYAzvK/zHj1XjgYIarLjHrx/J9qKcYQ/uHMFvLDfD+DITDq20Hu7IDCvJqThiov
	f5kXjEFQB0+lrJS+DBmzopTARCvePIFG3tZaa/17M38+h7OxQZuhACeINHzAanxDnzmwpJEKq4B
	kCx0nfq5W/nan/uzZVp0S7yNT8GSs3KS9jknNMXe/MDli7vD1tH778dS2NZlq4zTSX/YcbAGJSk
	7t/hs6R04tuVb4GqVhmuv2AYywdrUXrVuVJPCldzJsbBTDcb2x68ylH88uUO2GN3xva1d/A8nje
	8XrExcjkUV4ZLFCAbNaGy8IixJ11saVNkNxsRAquCz2EZPZvyYs7cMHQs0A==
X-Received: by 2002:a05:620a:4448:b0:93c:8544:6adb with SMTP id af79cd13be357-944217452fbmr1624820485a.22.1793620143836;
        Mon, 02 Nov 2026 03:49:03 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:93c:8544:6adb with SMTP id af79cd13be357-944217452fbmr1624815485a.22.1793620143115;
        Mon, 02 Nov 2026 03:49:03 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:02 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:49 +0200
Subject: [PATCH 1/3] clk: imx: imx8qxp-lpcg: Reject duplicate clock indices
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
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-1-1c3fc3fe727c@oss.qualcomm.com>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RZEyaaRYv13ION5f4rFj0UmX8ETzVTuM6plCBDtwyOc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HioIWI3xswy035/XchzkLlv/zm+EO8le5/XT
 q7Qq8mSYTWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qAAKCRAbX0TJAJUV
 VsgOD/928SW+qLHLOl65n0GZb9QrujQ7Zureyizl9t0OefVjcjP21mykAsMGIeEoSniHqjhS3dh
 9o8386WaJvvhd5U4wyUjSbUPpzcavUDc6slJx1/60PP/YryK/qVjGlcFleMuT6imAr+3sb6Rphw
 3SnbFJGW21xR3VXYtqQZ2BvRYfWLuMdJM2czD/JayDvIdZgAd8oW0oA5+6OL0Q+FLmUSWP/ZNq2
 yiiDwCdGdw5ci7oMkyYGevi4TMJMdnyI6nEFlHH5dV92XqMAdqO7KbiVhEMcbsBnDpOLJqk00KU
 xAkz8nXjgFIxauRSkC1X58XKqbRpl9MUp0BNLVqlL3PVU6yl/ehyQ7ptdPuBMHhWpbpfs1k5thP
 mO+dUTSE72BWuFEr0HW2/4lgDOEcVH+WU6+8g3YtLoqr4jsW88SBIXOxhZcIMdk6RBTsTYD81VL
 MyHijeMbiIZ64URrco3dciJk4VgOdzdgQLAZvvK+y2AHKxCeY/r97P4xdYMOXfvFj/up7SzEdLC
 YhtYHzUZIDSSezYOuK/ona9sODz/Fpj0+sX7TyfX4JbX0vFQ3e6hA2Mw+irtKf3H8g7zcToyhYw
 FR1YL9p3sHJDCAVx1oUFGzn8LceOnKcKpwD0hEKSB2eHAnBC9zAGHD2PqzQjCS+DxsWx21KMGmn
 aw7oXRdJ0mjQR3w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: G1H-gw1oiJVbqMctseQ3s0BUdj3JVcaW
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae878b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eKaI5DNhNXE6fe47w8EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: G1H-gw1oiJVbqMctseQ3s0BUdj3JVcaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX9ShQZyQQiafU
 EMmFA47KnfmeNew8NmrwwCZpPAg/Thp1ostgPPEOka2fSWE907hTJRvXy8wnaRAgXz0VRrb1/oQ
 7qXMIBw1cZ8TNwc0qqFd/e6uvheRyobk7ZFp9iqhDGmBvwhrnptyvpXkRc37L/Xd4Vg/z7eYz/V
 r6sWIOp1qi/stS89ic57/UT7iRL5aC9VvwOnot1BEZZQ0cB/pRJwe/q7MFnJ6TqHfU1QN03hgV2
 vwvD/kCtHaz/fpXfNdPLiVI0SMCNONz7WhA0jKtwrR3Ur6RW7U2bhfpRxT1jMA7q4II56rckJL4
 D8tQNX91kZpUtIZhC4yoOnHUiiMXwE7sOjz4i1CY9pXkqEjBGyk79OiT49pULn39u6CeS9xQ+c1
 jZRAcXpmLodwXLNel2V+kduTMrKfh3Ia3HJs3rEPZeAQNnb+CgZUTw60Dus589RwTdTo0nd1P/M
 SFp4XpW5hXHVA2qhZsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXxBrSeYOZuzGD
 TGJXqNKnW3ihdTi5KROGuytqZJxqJMTPhA9P1mc2Dhkblq6N3H9DyyMF2SlD3xoxcikZoqHRLvd
 9riUrhi5Z+ua+uN2+hf/VzuGAn5kr0o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

imx_lpcg_parse_clks_from_dt() stores each clock it registers in
clk_hws[bit_offset / 4], as every clock output of an LPCG owns a 4-bit
field. Nothing checks that the clock-indices property names each field
only once, though. If two entries fall into the same field, the second
registration overwrites the first one in clk_hws[], leaking it, and if
a later step fails, the error path computes the same index for both
entries and unregisters the second clock twice.

Reject a bit offset whose field already has a clock registered.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-07b8d98e-feb9-4c88-afb6-3b5e0b05dc00
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index f0cf6cf91899..e57e7bc074a9 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -251,6 +251,19 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 			goto unreg;
 		}
 
+		/*
+		 * Each clock output owns a 4-bit field, so two bit offsets in
+		 * the same field would describe the same clock. Registering it
+		 * twice would leak the first registration, and the error path
+		 * would then unregister the second one twice.
+		 */
+		if (clk_hws[idx]) {
+			dev_warn(&pdev->dev, "duplicate bit offset of clock %d\n",
+				 i);
+			ret = -EINVAL;
+			goto unreg;
+		}
+
 		clk_hws[idx] = imx_clk_lpcg_scu_dev(&pdev->dev, output_names[i],
 						    parent_names[i], 0, base,
 						    bit_offset[i], false);

-- 
2.54.0

