Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8927144B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141955; cv=none; b=pMVTtuaX5WlTodFL3pTW2ElXyB5flaXvfJCDk3o8h2kqC4n8d2Cu0zLTiKz8uunwnhk80/CgCPOgYxLdulhB1snJyefkLYA2JRbVdTjF9q4+hraLZE3HtSsH/vW6HvT3NSeoev2BLo9RiHEAjJ0oVkEbHcYGHmN8T/6ta2igEwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141955; c=relaxed/simple;
	bh=g/gsbt7EIm1j7HvPMcOkx0nfYt2JIOIMaAqDBNU31qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n0tAuThUzOa5fmIc5zDstKfG2DgNAD1CMloe5Ei5GtYUtpyx9QgmSLYay12DoShm6GSrkOhGOZnEKEWoGQirXlZVQrvsQSP2JK+9nbKLnuErfSxKHp6oS2cX0DHrYazlk83Wu0Xrv1Uzv8IH5EWkRJU0m7M/6ieBrN/NFkIdprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DunqSjSK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vc6km17f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DunqSjSK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vc6km17f"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m4uS760290
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=//RczmxSMnpxOSf8tkC2k8
	XiomaCqlwdhQzjMC4NzoE=; b=DunqSjSKYXUnTpLS4f/pVICisgQAdryBVVAeIw
	w71T0q01frlwN/OAjBDjwYrhv276xg8wvPBhUfBucfa60Ngu0Z+7akWWTH19d1D7
	WuyjVIA/89eYGunc7igjNgADtI/0CENBa5NYEwtN8Lu9n6txorqWQsVq8Mui+LTE
	/xr8CBOGGYuM/d2HwFyrNR1LYFZrPGaKxGa9/o+mLbvCWsZ1HUJ+narmlcZctebI
	5nBezS+zz2GYxyQiobp94LWViop1dFZXBzFbkUOCTNA20SmkgCfO50Q/mn4XO51m
	lLRso41f2rpCTiPS+iQHE74AzCXNQdm5HiMQCXpH/YBfEZ9Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tbqns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:12:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so12701745eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141952; x=1792746752; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=//RczmxSMnpxOSf8tkC2k8XiomaCqlwdhQzjMC4NzoE=;
        b=Vc6km17f4nZm+y3ViuaaNNGuzPX22fbbq832hVyi/J8iFeFG02gTswVwrGcW3Dvrcm
         FXx3ka/Ebygxgc1Wx1yosl5vRFbZTmwkLcDwc4HyJKNz5HhxgMGgHIPf9g7nlRlm+krQ
         cBw22HNrmnto6R9SD577PUgf+WCeeY7nlrk1uvYW5BXXXZHCGp79fh1wOJOEmxYS5ttT
         1b3nd71/lbL8bmzs98Q5YhcAdB0g6tXlO9Bj7rTK/JAVaHlZKbfffV+ytLP47IYRKyRU
         b3YznDBKJZL3pXPjzR/E3cJ6wpuW1Ec19piNkJ3Qcee4+S5DlY1byzaT0QxxL8IF4N76
         N9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141952; x=1792746752;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=//RczmxSMnpxOSf8tkC2k8XiomaCqlwdhQzjMC4NzoE=;
        b=qi3Z6N1MpKcyfBJ9RzbgBnNwv4g58MhPr2eoKf3AaeZVr2Kp3d30ies9aSc1C1ohR+
         yrcjKcOcIEIIBW/NXuSRUiqdG5tMCwWrUw1CMoescHTMMHadSDHd7C3UDVcj7RNY+3rq
         rrgUts/09pyi0Wu7/QCegV6Tr6zsBv2o98cb08naiNk0pTfkGiAx5W4bB6KqxNdovJKG
         6o/u59/XVe/+I4PzbDTymEGcSAR/MOp4byHC2XdTFqwjM1NrQ+KN38PbBWjamATaDdqb
         1HDXVrRsQ0+tPBbe0hhkz4fDxqxVvld1Mk5rPXVEZBdiU3GYE9D1z+2wo2zzi1yCoKAo
         x+Tw==
X-Forwarded-Encrypted: i=1; AKwUvBx6HAW+SAGHPK7FadusPVwIfTJOI4/+VZdwHbp7MC7lyrakH5bHbHd3KWvKbShgKunyInko16+qg9S6vfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIImVRm+otlOQAxQFy0t3t9Jr+r9splvf/OW+KxehcbJbnw3maW
	ONjUvdobxVTHvayDWz9BxJySm33z8AeMXVfOxnqszn0t69nQ8jdNWQEiFOyBN0859SIP1unmgeD
	iTyhkxpqpVskwLMwoe/3oiuOoxEYgGyVrC+VeT67UM8731j70icBqv8EY3B3Y9t4kFcA=
X-Gm-Gg: AYBFou32dxPTkERXqg5Tu8MgmBfOp8RijbcU9msCtLpIcAnnXSG5t1vPNoQVmpGxnUm
	HwyJRGCnPwCpAUyKevlkS2d7jC8PcrGUzgf4vHtFMORx4yWOHcl+1hdxBBucO+mVaZ3ZR7VqzjO
	A7Rg6LADDgugBnvRv9zU6xINob6P3iE6TX3oV/vzBTNWWpCeRK7uBXnSZkiMxaQnjaR92T0uw1v
	Jdg9+Gf2BSgDYX9KXlRQ9aP/pFcjzH/Q/Bnqm0TbHhldS9lgTkbJVEZQ4r3TQcoZiXmHXq1dsFL
	z/FKesnnYx1XTQMlZg8a1fDLL08twAAx5mclGc7BUfbauJQkAJd8G1kWqCWmrYXUE1yKFRpgbYs
	BPZMLzuBgZYPVTyN0t3yVSOOppFvovaI=
X-Received: by 2002:a05:701b:4286:10b0:144:c128:4c4b with SMTP id a92af1059eb24-16a5e49c474mr28272714c88.36.1792141951621;
        Fri, 16 Oct 2026 02:12:31 -0700 (PDT)
X-Received: by 2002:a05:701b:4286:10b0:144:c128:4c4b with SMTP id a92af1059eb24-16a5e49c474mr28272690c88.36.1792141951006;
        Fri, 16 Oct 2026 02:12:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm4917628c88.4.2026.10.16.02.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:12:30 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:42:20 +0530
Subject: [PATCH] clk: qcom: gcc-qcs615: Add additional frequencies for GP
 clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHPq0WoC/yXMQQ6CMBBG4auQWTtJ20VNvIpxUac/WCVQO8WYE
 O5O0eW3eG8lRUlQunQrFXySpnlqsKeO5BGmAZxiMznjvDXWcw3jrDxklvHFfcFbeckxVHC0EOP
 dGQJHrc8Fffr+3tfb37rcn5B6DGnbdnioqvN9AAAA
X-Change-ID: 20261016-talos-gp-clk-freqs-update-d1ec0627ece2
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: s3m8k--JSkpVnCLGwh6uXqqHGdHdscGY
X-Proofpoint-ORIG-GUID: s3m8k--JSkpVnCLGwh6uXqqHGdHdscGY
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1ea80 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gyo2YFX4Vz0PmhbgGKcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX5a9KxuU/8Dpq
 G+CJAvJqtvgAkNKMeeTZTRrtaV+YSOYhQCEPzSy3DkOVYGFRddIubmsUQFN8hrLgf40T46zUcEh
 0uiKMYQKfYkhBrkYY+/+bRGdKaLm+WjPx9T7SC84P3NduV0+/VjgZFv2FGm0h4qONHego3DHySx
 hAHCJar2Tn25wLDpfjWFEZhBG8YSPQRhdV/CiOyT+nmmBiz2TcAK5W5OZUwWrzAyWNddtOJiRD4
 wKAY3z3t+hr64+zyF3jYHSkhtpyEWUK0HOdtv3iD4MaTzWTxVA63Dq934Ct4leZCN5fb91Ztyod
 y8yEfgGTEZLBSUbxTG7zgaPQ2H9SlIDtWewrZ1YEiaTZBgsTd+QXR5Sst+CVU4uMmANArECzU8Y
 R5DpmsVLq5GA4DRYOS3tRua3aqWq4JuPH49YPVKcGSsmlhuhv2g6biMKC5IU2fT0tx6FftqTML9
 zXxdkRnlURK6lta95tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX9/Baq8J25k7R
 iLzVszqTYbw6xgVyJLKOasqYifSbyS3GilcUosA+ImFEKIlktK2VevFYRciu/fhIH3ZuL1eSAB7
 ZmmlA1ytAy64eC14HrW+KhYjVTi4AlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

Add support for 10kHz and 100kHz GCC GP clock frequencies required for
display backlight PWM functionality on Qualcomm QCS615 (Talos) SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index e096af7d82bf..f205de3a9361 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -419,6 +419,8 @@ static struct clk_rcg2 gcc_emac_rgmii_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(10000, P_BI_TCXO, 16, 1, 120),
+	F(100000, P_BI_TCXO, 16, 1, 12),
 	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
 	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
 	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-talos-gp-clk-freqs-update-d1ec0627ece2

Best regards,
--  
Imran Shaik <imran.shaik@oss.qualcomm.com>

