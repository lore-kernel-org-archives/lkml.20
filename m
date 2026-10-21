Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595888;
	b=kbqzK/ajqM9juj91ruZo0e58bpmhbWJnEHXGbk+uR6GlQx2kM1F/Esry8asZ68RIie4p
	 ZscD7MEa+M8g32tGwxerZThclRMVdUejMI2NJGLZ2zflA/90PkeTadXHuNZaCGqQxGwEe
	 ndE+53uHuINbUjgq9z0711s5kKUszonTlNrDPaeYZoKE1wFP17b25MVvGFEvMTnevQ3ZX
	 WTVFmEaRIqKVRLKe4ngIhJoaxzPseMsZHaUNFNNI9bP/KSb8YWm0uIcKzjdJOmGAn+tUb
	 iTtrEF2CxE8CklJqyMBu050UN7l9jx88s5WFVZEepYMZUriPRiqTADugAgUbbaTCdlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
	b=J9EuE5A2xJzacG83rTtNmT0UYoMgmSVr4sAJwyNKyK0p2y/qv9H0fNq8BJPo9eYQMOFk
	 mjkELzQfap2Uq+UsznXSBfdNbsAHpwfrh32lMl3LZWEeJAh3Jo6R9iv0cPL/CGxKfJu00
	 Crydo35vbMwajOUyU5DeplFICJUcTf9xcN1W8yrrerpWBIScBvFEAH5ZlONB2Otrh0rsQ
	 SXiPrl+47XZcQq0+/WhyTmJogaWmva5+cig4tI4vgFmCh/pdIYfkrifpqTCcFBBGTDH+k
	 EDKEJRWMIAcPlIrlYi7+OIg5ILzpQT4CBgCWXBQrIg0559dT+8YhvwNovicNXc2JmTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juMBFt5f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuC+0OEB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265A606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7265A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juMBFt5f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuC+0OEB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEExuZ514704
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=; b=juMBFt5fQg6G/ln9
	RkrfhmZCpWEYfGry4aXOj4/+pMiGw6UMNV/pX+x7BdIxsXxxbIZOyKvzH4/HT12z
	zFcBgJpDibSmsig15qm7ZJyPW0jtPmIJ1ZW4Y29pWbPHHrQusT4ViQTTSlOa7BNs
	JDSkcPiMEBa2DhxDA6WAes9SwVwQ24l9XGAW24OeqKH0xVXI0e4l8OzNzgn+YHz2
	EJLtDt4yQO+2PIU+rZVNpc5PnDjyfiOsAK7LlfllYuIFahPPL5XkSvLT42lQcAoN
	DVKH0drXCZPCOwEUfLATZUB+rVeylG2f57P0W4GkJg8gdEM/LsSS5QTjTK9dGr++
	7f1DQA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrhje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so2013230eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595885; x=1793200685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
        b=PuC+0OEBcTxg3Awhw3aX8SIySTCnFlB9TWX2KpyySf5U+epwNtwaqyhlkq/jHSxBCI
         CRe9ER07teSMaIJhYKZNrpKd71BMDyr1rHp/zBLGra+zFNjqXa/OkMWyDK8ZvZUW4Bhm
         WkXAchSJatyBpEPZ/DdIgN0+91VwRspvMzdGteMWHWg6EpigAIEMlCnW4T07HD4qJLDj
         c6OCngaqpWNTWfeZB2+1QeJb43e6TCEw3RUIPTOd18uQFspPYPOYQwtld/fto4lC+9Fy
         Y3IepwNdGxQPHAtN35qqHVPK345xG/tGRb9uvWRmun+bWePv5Z1znkcKQybPQlr/X6sW
         dBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595885; x=1793200685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
        b=UbcRh9jrvxUW9m4gDZrzt9/Wk4Ia3RvEpwnfAgTdtDXQ6kxXRUjcxNVJD5I+3YaJjj
         czCNjzfr8Ac+rVoHaWCRpTTDP94DcBIo4ZX3fYLT5WqTk8fllcO4v1E/3R1lrnSSH5at
         v3W2FCIAn8z+l94W6oNIVE4LGMCxZbhQ1QXukImSMRvoBB3LQsoRxrAr0QDVxQBo1nQL
         GWG37A7pVHI94ZyD2EzLd6vPauzWbD9rLYmqIDulA6Ax8Amr8S1x7epU8UIaPZFoeOau
         H8mvCrwd7pLVLt1/qeAc3UTh0nUGPJovN+hdmn5mgAOt/uaAnQjtX3QO8I/kV2AzycRK
         h8pg==
X-Forwarded-Encrypted: i=1; AKwUvBzNKsqSvZEr0KW0yPdw3A1UcOZPktVvC+maT1DMccwhqV+/Ad8trlZs2xCvcIC+9TH/5Rb92Gpa2KBVzec=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt1p/+L2KBzZGBryUko7HKl2W74U0u9DfGFEreCWim6sj8g4SG
	1CUtxWAPm3m/0HMMGXBvoDENIY3aRvCEhSIU/RgJkOsBcKLJdbGBQqRdDjFmWudmTBsJPhlyzzD
	dXPB6tfNcpxIiyAFr2OwkAikuLl+RO+sm21CgCX9jLpmBKcJJCg6t2ocEG90BIYi6XCn6DP2PBt
	c=
X-Gm-Gg: AYBFou31qe4kHLELN9Anc+EJyUlT5vjwp1ZvzPveqSvUjIugmJ795XjivZvccQy/Nyu
	yjH5gnB4xMnIetUN8Al4DKMAkPkCeGKiP6T/ms7sxGrebf2r884tHgpbOKU9J+0+zZHXEMc7kk3
	fMGF8FI9/fCA611igcDKa31slblsdWmIToSNUV4fn+ky81o4a5p6EcSiw1Qejeu4gFbeMEpsEND
	LzESEgH6dZ+p2YAzQwseOO7SwfL08uXkxgwlROp/3gcR2uH3b1EQEuUgZUvtniWVGJTUet+Ls0k
	kigsKTyv0bJoOiYbKiBSz4mwc16IykeqYzShvp6397FT/kmMVA0rNj2dgO57HxRtLP+Ke3MZc1s
	he3xRG6AZxSq2PK19kywzdAluPYkxjIyF
X-Received: by 2002:a05:7301:d813:b0:360:f13a:ff0e with SMTP id 5a478bee46e88-3674d753a4cmr3341581eec.23.1792595884478;
        Wed, 21 Oct 2026 08:18:04 -0700 (PDT)
X-Received: by 2002:a05:7301:d813:b0:360:f13a:ff0e with SMTP id 5a478bee46e88-3674d753a4cmr3341545eec.23.1792595883840;
        Wed, 21 Oct 2026 08:18:03 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:18:03 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 20:47:29 +0530
Subject: [PATCH 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
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
Message-Id: <20261021-lyra-display-upstream-post-v1-5-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=673;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=PvJgpXbjwbKmN5hdDTOHLEi0wLguTf8dYpZBKf8nIB0=;
 b=QD7bkVOSV9SdvGpM2J2FTKAwcB/SWheGW/3C0KQYWHaSnIMXjLZrXgJmlttGvhy3Chng6xe3x
 7tOviLzTbojBgyDV6TwzXknfvvMOCGL9TJV8pOjb4Qeslv3iArQqBfr
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: GOGTERnYL3nYxS337FsmdxzIra65cVBf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX4WH76nzxEH50
 +thJVmETbRbO/u9aB5/I4QrC5jidzYQbMrMCNxVZO+4UE3T0Qtd/Aipl+xh/Jv5szgRpwd4few9
 9UdTsSD9e4nIuITe1QdIqq6S3qUBaF0=
X-Proofpoint-GUID: GOGTERnYL3nYxS337FsmdxzIra65cVBf
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8d7ae cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXzJ9OQVVderln
 khf2/mq9a69KOupvYgnqZwetjiugjRQmSdzAALDnnoYzPnjajuf0ungaiz+yRYRDajmbttlfQDK
 tpCpNWamb3Je4XJ2BQJcfVIMtCvjU9jBfkoi+8wz76Zh2uUTJ5ZM/fsUzNtyycuRV7sViqFzezm
 V7a0DvFm6RVlqb1f9SMf9Y/XD+hG0QhZtPoww4aZfEeHvwMtBXfXDkN+PZNU+N061EgtmD9Qws6
 gx8b1B7J8qSOrP3zYXMFjIayW0KCphDEtpgAts0hHzMzRT+RQZbaaLXkeJA0V1+UZRHj0zj79SG
 YaBsPb9uP6rR8jqeOTNyf3guBOXQYT9ZtCdBgrJfogOkJOOagUXBKEbL1dWwH3gQ8Heega9XAyI
 GECFkyEfB/v0Mta6+qjZtmWSiCxOy+S8uU/c41si7uyQ89phUATwfoQUj2pb2fThSAA4xtCHKZB
 ivMRwHzVlGFR6ylFVHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Talos Lyra EVK LVDS panel overlay backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

