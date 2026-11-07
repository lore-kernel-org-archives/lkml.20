Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074815;
	b=dWXJr/LVF38uyDwQmo48M5RbkLO6ef0b5mwow5vnZY2e+ElaU3UaYoWVdNwEYaPLMin5
	 HZzRKJzmfS9uitC8oZyYiX5RREbqZ98VmeaE3kFCyAdoJsNC5EnCMMw8pniZqkf6Fc0++
	 KRe6OZFqOXjRbVj3coIfC34XogGzbWaICkvS7YU69bsYq9IJjHVHNfl2jAs2B2yHJLKTp
	 454EpGm2WIRjEKmai15KZWFR74xL/rzAzN0wGMQPQofibLNB2EBqdsehbqjcua4FCZf4x
	 LvXZtfdnl1XLrkr7AzlqXh7bUqpRqRSSlfeBHF+Jv/V5FJMv76HcgQbD3KNe6alMobg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
	b=QcUugQU06qHVRmUaUG15A6+X0S99OplTTaNfuwBcppr1Q/10ivV2hUBMzTckHNSRiiC0
	 Vd3EswyjBikgkGuHyl2en5yf6A2Y/aEfC5bO+t44RIiIofLvrMlUDS+CqHwtXTgttDden
	 3bP+0uY64nhMHbsc6zc8bn59pC/cIzvLiO0zJQvyhvCNAh8va7TBu0rjOshkMZHW1UcDP
	 zP+t5S2kw/LvmgyWd4WslDPjrk+6Z+FMujFKwgxy0Q59GgnkjSchTGk7EBwkMHF85mbEv
	 odQWDqvspFOE6jk9aPtXu9WzSPyf16646eTmaBoWqNgKw4FlxNfCoNsYSKvMIMv7UEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SreeR8Pf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJxR6hjE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D945606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D945606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SreeR8Pf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJxR6hjE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Ht8ea3387287
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 18:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KtXcfDwP0OI37SAv9nafNa
	Chy8uheMzqgS7OX1e7QEo=; b=SreeR8PfOUXFldSESQfVsX5Yqmkvp1ACbfBR5c
	nybxUPAOJHvDNI3VlvdU1kRKc/j2sMU/ae58GpQMhHw0pDCytxxWxAfoEqyEFTwa
	xxfp5J+c29n0rfMa+CwIAPxjsiv2+IuU+ZBtqHaKIPsSXWcYUM/0wT8lFk25e85G
	NrLe2cGzTBuWzH6gW5gZPpWS6tuHAGxlg9bw81b5gQ6cdK/VOhKEC7RXh6y2Dn8m
	cjP1hTRNLQxraD7/VgVwq7MpHeGG9X7Og0B4hHY2Gq2n8QF5d5EhjMvRuqK/cVFr
	O7zSqY3raS0lDW1ySkxUsCbT4/r3gZlS1ZDlhyHQ4J3ooQLw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv731cmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:06:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso2308834eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074814; x=1794679614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
        b=EJxR6hjEpPTAq/Q9kFqBqHGQ99+GIL2Uc0vI+sLW2oXwwnbkZ8Gt7mx+ZHa1lLtro8
         izR0A5xatBt1crM9igbIjM8Msff0d/P5g3xFvHJsniuaA8XRM+Qjp29Sj60jCMLHdYra
         60Z2ZTC6a+lDScX/3kfKOeOhsZxABh2iC/hWSC/bAj0ql+IV7HruOMuZOvdlPT8D2oZy
         skuQNqI/V0lYxZQAHg2ULO5fYUadFi8u9/laFHsXUG5t8jfrMXxci2Ky5C6r0iJEdWJr
         BE1vnVN86FopAw/3sD/zRA00W4TLdCQO9X4X7QhpwOmbL+dnZU9LOIfHPrwruLkRy51h
         K5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074814; x=1794679614;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
        b=OvzoWa+ApKhOt+Vr/9I95x+VGvOEfZmuTZRjOZ+RPfWp3b7S+5b3gXwlGxq0CDUDZx
         pJwTaBUzv8Wpf6DNBuj6m4Bk3iLz34YHZRhJLQJtjRtyGnXwhN4gBJWjjawk7MRggUL2
         MpDPP0TmUOyfQ4FcP30BgZXB3rzNGsOrb1+/dRtQN82jDo9TrPQeXWxupj0Ga4HGI+kL
         kcdAdrypMvSjOZ2OVGwQTF2UtpHbqwjAUtkfKQHGVVJWp/B+spHkh1907g1nE3h48pqU
         ZBSX8aln8nocMQKBq9Om0FUZYtbRxRMWfh2LKfZCL1XtpQQkeZbMNg3JaBjJvSM+ACM8
         O41g==
X-Forwarded-Encrypted: i=1; AL+hErGLBGC6yuRh5aqV7QcjKn+ujYzbxVi6/d5RHjt/Ka88n9ruUdtehf4AgP6CR5PqqTDETVhefpe/3xr+kE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZMSO1iWO+OGLMQYBe8/kzGkvqAlZcQIwzOcz8tQjEDFZ0R+tG
	4jMiIUSBkWkqXqVkaVb1HHYlyeJrk6tQkb55G0Vuidt/CuZHLaYuLxm2zweQUz9fCca6ocDKwFb
	joXauf7RAzKkYrOT1i37UiReNkZLSiWZI2NZlcIMLmZnfxc1m6WDraDnaO0NNiSWEpQM=
X-Gm-Gg: AYBFou29O2IZVfnyzq+daQG5jXEzGdgHoBwizb9SIxxAnpnkZtcr2sOLqazu77Tt566
	KTVWyOjJjYfDobCd4EDW1L+37I8aO2aY56I3dUmKs+8EAR4x47bRHjXRPguGSIOdkeAHFAVr4JF
	XtEB1Mii2d9ob+ryWeXAO7g++dv5fVStyj1JzffPVLFW9Z505kqXPNPdIARdQVmC2oBfK+fDSar
	mD+IyeJy2Sfz4OTJI3cRf4X2dH/6ugNrldSmJw0amrDATI0u8iIX/cJBWhwyFQrX2t6D2pgEqos
	pmKtSuvEfheff4cnJhZ7h3sv/gL0QPq2+CZaDkYcUMizVADimPyzwmEafCOVYOtSYH47Zh+WQuo
	HQfVbmclWhQIrTVWOFNgeDw2EEyJfJeRP5ajcGnluJ+YbJOjaLRBD6SgE7xLTonza6pW3WNc0
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr8095924eec.19.1794074813463;
        Sat, 07 Nov 2026 10:06:53 -0800 (PST)
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr8095877eec.19.1794074812701;
        Sat, 07 Nov 2026 10:06:52 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:06:52 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Sat, 07 Nov 2026 23:36:35 +0530
Message-Id: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKto72oC/x3MTQqAIBBA4avErBNS+4GuEiE2TjWbEqciiO6et
 PwW7z0glJgE+uKBRBcL71uGLgvA1W8LKQ7ZYCrTal11akF0bNAdgk7OGPd0qLb23jYm2EkHyGV
 MNPP9X4fxfT86/JO8ZQAAAA==
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfXxVbS35Mmvnhp
 SQFcUePfI2I3OvdkqIy0lS4TEuHu5cZl5X9pPnBXCGxfAlwbA9gojSi2sVeYokX5/IWoCJyIyv4
 +SD1Riy9SR9404Te5ywhWxY/jyw2HMBImSSAgq1fO0gAoQjA+xtVDkkzfSnSlrxAWpWoKxHW+lV
 WCAPju+M9NhyGw7ydGz9PYz1roXWPkKNOnnPcChtCb8lg1tPsoKMM0BKCDx2QG2r+aJ4zSCvqWQ
 8SbjhuoXAsiIZJS/Xsxx1kHN4LRNVgmIrfVDslLG/Ul3Ur5EJV2KKo7Imz6LLulR1Pr7CCxSfbc
 nD+LgBgqx4u6BvNfitqTXDnBYuULZjyH521ip2+lPmktKgIrv40KYoE0cgqIqOFgoWoq6qIJ5if
 eYfolu9KtfFCgyLmeGiVkD3AJ2FyFJCG/AX6WibGjmAnO312acMflYy5F5CClsmpiszb/o+WsL4
 /LF908FeRWV/SOVau7g==
X-Proofpoint-ORIG-GUID: VA_-2jwhAC4UzrUWmxvYqLTAONBhqk5a
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6aef68be cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L8zgO8z3qB8kSUkvw_kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX2UtVpEVDW8WK
 iCBZmU4HQSrXKvUkC0UYBfhLDAWgsNSaqw88wpXuBxGcD4yH4IMixjQg0dfUIQZpnzhGnFfzvfw
 BNYOJ2gwi9/TJFp9oF3NfU/GFp4x0TQ=
X-Proofpoint-GUID: VA_-2jwhAC4UzrUWmxvYqLTAONBhqk5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070072

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 187 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |  11 ++
 2 files changed, 198 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

