Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB123515DF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376161; cv=none; b=a5wFmaDLNNXNP4x8fpKrno2ZJwCaNKrRphza69AXSZ+BP9CpoGg3bzCFXeVnLowCnfHbH578VIvkqQB4eWatAVVYHPLrEXCNlnGM56PKHRjvxfVar5KLkr1xO/qmgav5VqJ0MrbJD6zcXc0U4pTyYvUq48bdd8chrdvwPe4i8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376161; c=relaxed/simple;
	bh=Dp1TMlpdZ+dS91HNECLHkK4AGyB4hgRlbjkwGiarOSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEOsUpu+gagBS1HdGy8vvPyVL/dAaJD98o5uX4mN0FuqaHeEZjC0t8pafLkhQsMHH3Q2KKz1HaEkaAjC5jrPuyzN8p/mvNKsloFHQmDBUA3oUlD/0911hagAb9IICj5K/+sWHqJmUkzsj5iaSeCrnWhA8uyayOA+ef+tC/Baseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKwkhejK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVNRhp8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKwkhejK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVNRhp8l"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1Ftal244868
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z5XVahu8zK0
	MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=; b=iKwkhejK8co/NAJKei3qD86umom
	OAj3ES4qJgkDtzYhL3VxJRzIKT3JUTDwHTqxy7syhM1msGx6/TOE0eGL2BBQtqFK
	zyO6SC0D6OApzqTWbxivtK74L2NH1QGAXwox5v/ejnvJp4xjW3ETaIVFLxtJ6uKw
	VuO4IpC+Y0eaeP00jpbMfkzAI1mPWci6b1SOq0LMPVh2jjvRnES0XN86zHpFKEPU
	uJFCWAmXxcmQAzbNT0hIVxS+I1cH/SQfqkdpdnmSR9pzlJcRPDGKOSV2emcVbfoc
	k5OXlybQ5ydT+/OaOC8yiO0LeKRoCNhTG88muub2B89+yQ1JvbsIG3axd6g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7vevh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:15:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35d4538fd74so6076189eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376159; x=1792980959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5XVahu8zK0MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=;
        b=WVNRhp8lJdk0HXvA/8F5qMIzWs2Vjm7PGZxop98YBZAwCKgO7SrV4YMdmX1IscibLj
         GcS+yWTpB3sJF8BglUBpJIbDmWu1ltyaurYRfTIMgIFAE6EoJuVjO1fcRcBFpQjjxGee
         Jlyhe4OfbvRRPZ+6Eqh4s4uR+A4WREtvB5tisjB18m8Yp0ZMsUhzriqlZsK6qqPINT4v
         RaG0kjTUaQVr/G3or14BDi9CKqoVu5lQYO9smbPCvFUNoBnDSlWAkBiWLYjFfCZE+2KS
         fLi5M8Hdlv0yExADJlxZ+s27gck975Kqyy9WLJ8jFvwC8EDxXESlMSsCvH4U48gD8z5f
         /xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376159; x=1792980959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5XVahu8zK0MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=;
        b=OA/G3XocrEgzO9P44j0VUY1ZvYU0SHD33TCcABNa0OmZ5FDkX9RYGHA1DOjUmN5ne3
         /svVQoD1MXpslFE/vch2cSUCguXBpgzc/NkqhXUqfPQw0LxH3ta+5VePjpl4LDRwUDJw
         qwfm9JmxipXx7As2oI65r/odUytLfFTSDd8exYFVJ9ypBAbw/F2ljMqSmtzv8KrQryPM
         5p3+ksFpk4alYtUav7aLJ7mHG6dQ9hz5MJzyHroOhVt/CjEO/yJwXT1LnyrO5cddxylH
         263jrH1rBCchZifiUDWB42qRhnjcg0Wa8Js8m262s3wt0z1Z86RgpjqGEUVUDPn9o1Uf
         3WyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEqsdMewxa31ZqdE6ths9m5+roylSPBB395hFFQ/HM4wXfffBeQFVdLEa6RuwOmCqF1xfMAh4dGc74LBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ+J/t0p3TRtEXvAuwYSUC1vPa3LgI1JnInGiKqIJG1L1uQUsk
	GQugJCHCQWNrftl9K+qFM135PUE8OlYtrLM1/Tp1o16AXg8QxFx8YSXwO5zRG5xpn/vpYyePgpG
	Ij7rFK9pC+gXK2h1RQlokiYD4MzjTxGL0m8lZrJPM8aNYwb3Feucxae/+Wz6u4eiFoe4=
X-Gm-Gg: AYBFou2MJEInP4SgWI6qzA2Rl2tlH111zmFcJc/Lt0wXcKvKh0vwZJPSytyumtKNRNw
	109b9wiclQ/H/u9Ln67AXWPTZXtlxAZYfHqUeYiyMn7qxncunqmxn1QNB28XC16jO/CULFTeI0I
	jtEIlAD04gbkvGbQ0P49miJbwrdsT6mvczna55KqrgtPNOZL9bMV+Zs0mTPcrBQgq7D5HLKwMaJ
	mATAAJi69wr6VqLFFaWTjfANQL5kBwVIhQsVKSDWkBNR5zuBibSY8jZB7F6jVJpp2K4g1z/n8dy
	beAQCF6gBhZQAvpL4dcMHS9TfXpAQ8QCfWDkx7QPNzsicJtdR+3q//Av3B+0F5D0RxvyQhUa8aH
	HaVm/9FWgIrWe3dToYoqzCpvkO9sNlLthfZKDJCorl3kzdf3GmQ==
X-Received: by 2002:a05:7300:ff4a:b0:351:f762:a10c with SMTP id 5a478bee46e88-3619b20edd9mr9199710eec.0.1792376158531;
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
X-Received: by 2002:a05:7300:ff4a:b0:351:f762:a10c with SMTP id 5a478bee46e88-3619b20edd9mr9199627eec.0.1792376156877;
        Sun, 18 Oct 2026 19:15:56 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:56 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB controllers
Date: Sun, 18 Oct 2026 19:15:44 -0700
Message-ID: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX1mABxZjum0bq
 AhGQCr9CqiINaXpNIwZzJtHPB5g4AU3h+Vc7SA0Zgq0/mlpvB2SqHYtsfXd0Vd+K/XyqvQQa2LX
 Ck3k/KT4X5QkxhA+9p/fCxQfUostKoU=
X-Proofpoint-ORIG-GUID: BYQWj1wqimglrLyURucy0AowqTsrBRyv
X-Proofpoint-GUID: BYQWj1wqimglrLyURucy0AowqTsrBRyv
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad57d5f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5sioUILVtsypdmoVIHwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX+2u57zfieDCa
 nqrW+ysUyXpHqZm0EmJnUBEm0rLPQiuQSxxPofJyG4lzIE3vLXeC0UT2sGdegdEha7l13aXIb2L
 5G8jj4wn3eXfAUHaWDhcpHYf5vvELc6EHiYmmbMGToeSua5vUmMDvbJyRLIL8JRel2MFmT8tkUd
 dknk6SjSwy5yKdByV1Tm8FjbEGKwQCYztYBBcgVDtKdlqsVqDdSdW07ctFs4bDJciL/0R5y4D5m
 sMNs1tvuyZA8AdXmRiVqYgBCl86czsvIHpZ1sjISoqyN6YPn1Tg/x8j4Fp7lowLfOcB8yTyougt
 uLZTJWt5CCDSsu2snHzVtYNs4JNTgWoa8SzqcRnf0uq+DObE8VL7UvwpriYFWH3+CKmFO7sxRNp
 jxiu2ypXwn3UoAhbX82mUqQO8Ea7M7SfLy5R8zShTcHHF/KkMg9nA+xNTxPAP55TqPtryz61jAr
 1e1fN99YXH743KtJt4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Without this bit setting, USB2 HS device cannot be reset after it is
runtime resumed. For example, after:

  echo on > /sys/bus/usb/devices/1-1/power/control

PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
"port_wait_reset: err = -16".

Set snps,resume-hs-terminations on all Glymur USB controllers. This
makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269ae6e10ea..023a8448449c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5544,6 +5544,7 @@ usb_0: usb@a600000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5620,6 +5621,7 @@ usb_1: usb@a800000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5696,6 +5698,7 @@ usb_2: usb@a000000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5783,6 +5786,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			maximum-speed = "high-speed";
 
@@ -5858,6 +5862,7 @@ usb_mp: usb@a400000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			dr_mode = "host";
 			wakeup-source;
-- 
2.43.0

