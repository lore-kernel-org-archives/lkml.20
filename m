Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21954E3786
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788916; cv=none; b=QNdryc8EkoVg3MQNNmVcRI5jzV43WQODzg6wLcICumc6Jx4krHMKDUQry4+q1euyhzNzHB/W+s5lbO8547bLhMPTL9trbr5tzdZPJ5RswZxEP55+Myv1MkKWcqcd7c5aArnj3hpLXYGgKrlUcPVNYR0sPrlXRdS75q5pV5WZGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788916; c=relaxed/simple;
	bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s86kz+zherdOwfoUUfbZb46OJZ983wh9q1d84ZYzmzkTLmybvDKUuj7SiBHl3iVYI5fs1R4HzbfpyOPVQ2xlqsy98fJ7QKVfWVRjPuKoU8jeLss1YfT6peKxzK5L+OFRUY/d3+wet4b3nZLUe6Fm9Rtfqh4TPDFc4nCqEyhaF/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTQ8IVwa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdK522E0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTQ8IVwa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdK522E0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdBOq851137
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=; b=aTQ8IVwav7WBOWsg
	ABzkUGrkJ/Dalckixx7L5N2i5f8US8Ghejb80zi8gRwxB8n06P7vsdKwNoGD0IPc
	RGriEEGl5TFa2GBaK6IhmyXj5sMql6U56Oi2Xbj21Yu+VWsIPoyFV++xIHa/fpxm
	wln8eAr95R5lvj1/HCbTXbvL/JqGn6EyGVyl9JuhuKZ+w07czrLsiUIRzV6ApoUA
	e5kjdOctSPPRljBf+AajKRd1W91K/UnyxaOuapZCZ404hcGY8blvjx2YTMnctKx2
	23Q59KHcFR/NF61AP9ntY/8KdGeNtt4PXkGA1qiJzA+5wGhljiM1bLuUCgIihyvc
	oCIW4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8k4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:48:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so4323357a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788903; x=1789393703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=JdK522E0DdyZeY3VHJOx4XKjiOqjN4UI5RHnYp6dUdJeNN8i7alT9lpFslHDIhnnHI
         K8nK7OT0dvGqf//3VyERMunt1RFwhP6kZDVu4Vpch5VxyNmzVeu+hSy6FtOCeKT0er7J
         DPxN/WLOr4+koDY4jFb1YIIPei6XZ+MQYyINifRzlIV5b3dvfJKN7ip3xz77ywNEdAUE
         /V+w2pMQZlIq75lx1qQsAmvJUA5j0Eqzzta92sqKWFqdgwd1h//xc3SUfRWocmc+Pa23
         xF9IsPRVSPm6TKnN2d4PtKrrXC67W4Ed8QVcDT8z2PL7HXpLZVcHxx3RhBcpgvWA/8NT
         6mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788903; x=1789393703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=Vcki/QxEO0uE7iUg65o7e8bco6U6+1B9EHMHwnluLOvBaeLPTvDvBUDtij5M4lrw7j
         X8Gjsg2OuXojMBgZloxx3Sfiq5OqklKwj1Fwnyv9wjFr+h8oQTz3Dxo4VZ5xfxACssBB
         3acZRxQLrjAkQJgpwjLwz1dgiYXa0nwm/ZICmv4djUEBID5JEtIs8PCiJCVVq5el+syX
         UMIwzpSyARty372YLs2rqhXdsuTgyvtXk/E1TMNkqC6A3OvWUaoaDmSGAFQPJ3RuqM/M
         PooZD5xdzSNhLk08hXnWCmHX9KPFNJiUxWQZWMEMXLm47ypRrxfLlKwkLwuog6gyMvLW
         po3A==
X-Forwarded-Encrypted: i=1; AKwUvBwVetLRr2EaB1gieY8ahRjveq5v457SAysJOg0U2p1YYbnGQLgZsHcFEEpTS4vFWQl1bDAkrfcXAsNpYr4=@vger.kernel.org
X-Gm-Message-State: AFuF++lDMzxwwlbnJb5Fl+Y5xvC0/RNdubQWq3QiGE99elSMHi8m9xEr
	li9IsA59TvaqPQmyzO9ow51Or/ZF+v6RWonqKUdwQEeoNM8UuVSY3kGhylRk6WqoO0z7KXIlghJ
	AqZ4E14+fgHGiVToVh5pVHcO1WhkBprgTFyyVN0EzIavzG7emhctZVww9kf3+xwk2rv4=
X-Gm-Gg: AYBFou0pg8atcyGrz+qMi6P1sKnv2ND8xRdXJwoIKc/ZPpC6Yx5C+lCeYyb/YHhuZGq
	VdG5yRPvWGhjve3LTbdvg3EJfMPwLyReozjQSQPIkujRB0G3s7NJKpw2F3VWGBtlQDtkr5kS7/E
	WeLAO6nHtghsQtrmkZ6q6Huf2KftU1GNCU3qVriR7wRQBYvs/bhh0HfhaBJy9ZhBSh5ByboVA93
	KtFETuk0i8WHXDjF0503BB6uJv4vDJRV2+T175nooJzH+O/5WNJpnxK+gmLw8So7IOpRGmGBrsC
	wU8QYrhxI0l1LrhhaSuv5TGem7Mg7rc7J7ySWC7GTzDoVJ9WELqttlcYhgh35LjtI6pTsInyV0A
	G7lrQAovvrHJbiLTeMjlliC25aCZqMw==
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr35663576a91.7.1788788903221;
        Mon, 07 Sep 2026 06:48:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr35663460a91.7.1788788902390;
        Mon, 07 Sep 2026 06:48:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm20826354c88.8.2026.09.07.06.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:48:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 19:17:55 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788788886; l=1012;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
 b=ZIyCryHXV2gt2/XSnLwKMB+WPlZjjZsOE12H8inwzxYUxB+L1C0SoiX8QNjZqh24fhoIxwWtV
 O5rUihrTob0DEibps3Eg5C1WDdR9s7htcDArZfz6bT8G9Fqh8hOOS5N
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX7SRXL2CdJbjS
 hDaT9j1bxoNCFIKXZin0vtuTRT4ztUVloWJpwghVa8wcndQf23Q+SOErxNpluOyq3qhnCfxRrKc
 ODp8nGKaryyo07ao2gxdHYFX/OVDLy0=
X-Proofpoint-GUID: p6LSIPs0iM7wbYKwJTmJB3HksNhRK4yE
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9ec0a7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: p6LSIPs0iM7wbYKwJTmJB3HksNhRK4yE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX4VrOwyK1DACa
 Uhu6f8+g0tp2b3ClJElwQ45Ll1ALprRbPUomTR0u7IdsT+OzbxzCYO93G15C1fFRaJngwRaRhMh
 vWTCvCHZDM83JSwUTm0kyB2vFFP2TlTKiTB3iXFpRded94ZFH63lqnrqrSB2UxqBBJZ7Jgld9SB
 yboiOcV3BbeXrf+5uKSgMLRVF8tO49KpJQ3I6C5KVC9XJNFFw7gDetjAgQHvUWnwU0xzQZgt9B4
 mLvSlJTFcVQiPSeP39VlENaxZbeAhibWJrQyHqMD8MilmZpDBf35OPysfi5OE0Da7PC0CePBzPf
 WBJigJo4i3/Fi2Z3fK1A4bEcvZ588sjuAEt5g57sYVwQBhnTwjur38/CwP0n3oYED513W96b9BF
 BIZ9IBf3zW/oqnlr4qSZRZQshJIkk9pAZ26sxKc9PM1+obb3tDpffJBKUi/KldsBQM3zytsi+72
 RxvKI8ERNyMfYz5Z3MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070153

A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
stats like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level
LPM stats along with SoC level LPM stats. Change it.

Keep "qcom,rpm-stats" as fallback compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b299f316e3c61858c4b380f6211d0f36ef9fecf9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats", "qcom,rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1

