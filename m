Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124527;
	b=KFoY7UdCLOJjiSZUN2WNoKt0T3Wca69OJszwsMmjuBiCUdWdR9TSmkG/ysCptibMuyHL
	 uOR2fCN2N5wPykLFMx7F/W/uDhVLfCiOovYeh8scl6WdsfJxuuAj2cfmZMKh7gw4dToaN
	 b+qrjoI3jQZGTQPI8qokCJhnzkqkgSWD1k+veiZWbEiZMxJdJVJ7m8/LySqBafEc4lCr+
	 AGcY+5JtiUzWqU52l5GoKC35lZFRLAuZqi9LVaHp+G53iOxpGOMzopN4wVwVodg2EX+3Y
	 PSNdK6AlwRMtau084PgP/ddpV3PSrDGg4A6r8leJKevLLqPP7nOhBB5I4HpmxEkDQVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
	b=qArNShSdfB1IbOpjsuhAyA0evd+4J0foof7xR5KNi9OsloNB0kIzZO3ZfNMYKhLaoiXP
	 rIy0NHb1XN+9rij39X29fCL1VbtvxMgnXambQze9Zmrteb/BTg8Z5A/VxrrBkQTwL1oNu
	 47d98i5Y4rWdKUNM2jdVHXxlEkeBA0B9cJcDlWRrbX9ZgmR04uTMmfmqd9LIY2ramdw/o
	 H1B1pqOQxTchpO2KEUzVpatCVHTYGNVyX1+l3LgKtIXWBydtG1BD/VUpbpedVba/65lYA
	 q/pxK0wiJUZO8IjYRT2SZzcgi7bYz5bHVZlbnl08csx2AkEUd/aYR+osK1VIAAE2CvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWq9MGrG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5ItdqCO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40029606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40029606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWq9MGrG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5ItdqCO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH01aS2772521
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=; b=MWq9MGrGHekRKODJ
	mzxuqkcgIkzutQUFtO3uw3hWZy5Utu+wADC90/n5qK5ydh7iQczljCYwGVwzZrQr
	G7FCLT4Y/vZqiPWOMlB9hGxwZ/ih8jB5j7TFU5k0jICg9yYtPnu3LJ2kspGQpev4
	wd2TYiWNfzVzDwXVeLySY3QA66DgjtED9tfcETTqZB3BvIBVGYkJ3bVyVhfnAY3+
	/v5BUymfcTvBHzaOG/Bf2daRDB8Mp+AICLxreyvKhtMjBn9H02YCxNYhvUWBCTpM
	6vU2ypOXNazANZ+ZDrBeTA4o0arhOnQyzxZu8khpjLNCw/VqQIoQZ5m6zLOFFiYQ
	sak3hw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6accu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so214989c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124525; x=1793729325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
        b=D5ItdqCOtKE0ryGGQAT3M20htsDuAKVnmOZvodn1iCbY97UkNVtAzmwZrM8oFH9Rx7
         j8Ei17sr2u4wqEmdYgmg1sG1fy0uAqYwApD/0bZIVCApu0nwJCEPxyUy6p+M6ZpBoBi8
         /UNpWq2yjUNm385lGdh78ZylSO/6QENpSOodCprdnlUrtyEzfFXfqma/NpA+A5hwqgEA
         DTIGDUHvC9GW+XIShjVGi3yV//H6B+KSKoy7DxFmTyysb3epOc/i5PWud0+++NWfc0nj
         FmgHHFopEumuYLJ5NNuCHsw2C9rlzahSuZ6VRHtClgmXHTTLc4XNDCrERKhkS+C2AmAw
         qTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124525; x=1793729325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
        b=2XwSdKJ3WMTT2ygix5PdcnkwrHyUFk6WFM/7CmbIVtXePiA7F7NTCF0nwbB3+CVUaE
         bz+I+LS2D5Tok6uCNmeWB8wyHeTAsYrX/PHqq/K3ICeMleRF9naGok3riofBnsbDrD+j
         uF6UoCH4H2dxVzWzs+aEJDcRbpSSlIH+Q4QN0Eg1oK1mMCTV+iiFFpu6BW4iSr1i7s25
         kEo5vJCSdZ8Hxk1lEUh86Lsw9rvf7xibalOIhL3Y3E5IxSSzA/dn+5CaN6XKbx1tHmzK
         YKwqKwWy+yI6r2EN768jRBm6giNQqHg3URD5IJRtFCP3PGvG7WzskYMVE9jpL28r6l9w
         Tm+g==
X-Forwarded-Encrypted: i=1; AKwUvBwOf/RBtxncWElJVfSlHWtYS7NYiSrMvIN2sgzaC5lIoTyL6WMgI42EhCz+6xi0rya/hBzLJSOPW3hzTI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3OOVzxyVBFMCUkeMDtWo6R79oeJ0+wo2FCIOhQfjD0RhPvfS/
	pktAy1PXLmPC9+9yrc+9irUgwSaFf4B8UFP5AoQwlffl8IA0iTDMTpo7MsY4gE3SveniELfA+kp
	wSlswkPZI0yslcBhNQ8ivs8Q7GHzUNn15RYaRQSp4hHPICY33ddPBc3z6GZmqTbbzSnY=
X-Gm-Gg: AYBFou1VUjEfkyDOSc60yGpoEgWPIK6XVIDWAVTYLTIZVbyqkMo/QwYor2jWFvAiAS0
	PobeLgCiGc04McsUvdh1X/EDMUYVyzOIPPIx+VP1QEPrObQ+9NEfWxGZ/gMQrDzfgED6S4ecZa0
	5jIeYnpQ3sa8Sh3uTpYw66EgPnMKopyblohc1/Dos8CnpFdAs7fg60GqoscHToQRP+HFbjzBO9l
	hAmfFeWaMTnsdkADEhMHkTX42vqqHcNvBlBO2zAzkrpas2yvWlrGRxqoaan22QEidnlXyVQtdpm
	7HqN3Ux3r3P8ZjFSxpCxDTPEtFqHPeQJUINZcEFXNu50DF3AafQ0Tv1M2oxOQrj+PaEQl2kSqFq
	N5yp5BpiV1AdaPS8FG/3MWGtK+rmsI+ggR5OUWxOBXGKyMCgSPvQiLMKWasCSQaBIC04ewcwLyw
	==
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr27693c88.17.1793124524692;
        Tue, 27 Oct 2026 11:08:44 -0700 (PDT)
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr27613c88.17.1793124523711;
        Tue, 27 Oct 2026 11:08:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:38:26 +0530
Subject: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
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
Message-Id: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0e8ae cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=crv3FWtqC6gvpUHg9-wA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 55kwbuzj4Y1LrEcLzcDhHuzfRT3im7lI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX+3JVTRZPliu7
 I9nCBNLWO0WHQtavxagQ07/RuupU2rDXXPAf5FrFSF+L2MvDxP8A9epD/Z7TzpXG2ravn56wfQv
 Ed+PQ1h4gv2NNw7C8jmcB326BFBJBQ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX0yh8/+iErWRE
 BsZGNePJ8TikIWslXlPqZmYcP4NQNfW6TtBh2agf5pwAVnJJsa46p74wCPv598Ume96T7fkF4zO
 f5uAVG6zQ2oJeV0nVKS5SeSX1PasV4isaj0DY15OUA7JB/xWsDRdwtXlO6FcX5Ol/tfeXx1t0yo
 hIRZfzjTkXLAVa60M8e77JnpUZeTN1HOQcqayAZGlrjoqOsJyhFz1lg0oZHph16TKTkClLy2fvn
 wQQ/4h0wYrkI/3Y0CUXOMzzwZXTiNpksK+CLZl4HYilybW3xVcIs5P07EoHigM6KdG4F/tP1XXO
 VeyOVeslXEXDdMqsZaOKju3nWDZV3eSDxllyXR8x2hyaTAx5+8esnP/vnDzWrKOXaPAm9IBkadU
 wPG0ZqSVICm9G9vIkIHSYX2r5kVcqqasxGf/USqF8SgsuU0L3xnUyKL4LRJ6JXKVVjlnmJq6E/e
 uI62XkFVb33QVEmQTpA==
X-Proofpoint-ORIG-GUID: 55kwbuzj4Y1LrEcLzcDhHuzfRT3im7lI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072

zonda_pll_adjust_l_val() obtains the integer quotient of the requested
rate and parent rate in quotient, but writes the requested rate to L_VAL
when the fractional alpha value requires rounding.  This programs a
nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
parent requires L = 63, but programs L = 1200000001.

Use quotient when calculating the rounded L value.

A GPT-assisted review reported this issue.

Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
Cc: stable@vger.kernel.org
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5f16bb55343a1d1136eb07f3c050f..9782fb062a58a26daf3e911ad23c5e1d805b0c38 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	quotient = rate;
 	remainder = do_div(quotient, prate);
 
-	*l = rate + (u32)(remainder * 2 >= prate);
+	*l = quotient + (u32)(remainder * 2 >= prate);
 }
 
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.34.1

