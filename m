Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029373C872B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461697; cv=none; b=r3AZ0yfNqJHCiCa5qLHbs/HAG8UCgTAy7ayPUuAdTE+BLQnqwNEnGSQI2IEW8bwH3v7qqmOmo75TKGoCAm2Q54EGBO3S6K3Cx0V7BPE8StENeQoc9m4GF8a7lhcdZ5iP4LaB2Gp8j1iYyePyTKxXJbShG3Ln4+btENwxB875QKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461697; c=relaxed/simple;
	bh=K+J5JXbqYwK3TUxpCoU6dPlVnyBExv1tcHHZpJs6rIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lF9KFjBR1ozZeotL57gDUIpmakoQiptRQV+lbSfJsZCw2B2SEzs3wLn3EB0TjqEvituIzHTnPgAeZbftYJYbDIpVmVzQsK0incrgCqCRgVOeNx6TlDv9ON1y3DYILQRsOOoYH5AvkFwJJCa1D9HwZNjdSfVl4BLKI4rC0SfAgpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDxQXeGl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ob7Ifg0m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDxQXeGl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ob7Ifg0m"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G36Ew2088737
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=; b=LDxQXeGlbB+zParA
	4JxeTWgUg4obq59z2T9jEIaY3sJqLOVnjcOZ5op30LxQgwucPzpW7H6GqETZJ4Nq
	V/RMxDDvTzTuINKMeFSWBzRs8fQUDiJUxt/T9310441FBwZfVZCoe5joc70zRfbW
	7OAVPgp6wGQDLsygXQpX1eDQwHazn3JiK8MPOllZhyt8PkFoAD35JF3cDm7/zqlP
	FGQpNXbFxOVzz0xoG6uYMKBBSNEGZuH+2BN4CBSjbCIKzp4fa+lmQBLS3hOEyseR
	qiM65+SBwSRYgUBgBNrFseN2Sa0sFg+IWnjSf22omtTmaBIG+wfOIfyVKs3uDPQ6
	yplvAQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b19r1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:54:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso140862a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461683; x=1789066483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=;
        b=Ob7Ifg0m5OCuZgMuEyx8JT7urnNM33jwjDd6DeVn53pIobfw2jU2sZbhd78n8BUp1T
         adz7VgVLpcBVIl5dOzKtCqm4bhPjdlZSLNf3hNh79pcft7so426N0jb4weeQDYB/wpe7
         U7MmL+PY1hEK+0Cf334q21vjRNGfqR2ZpQ8xcylqH9hCFG27n9xb73tb0CN6jSCpvD2i
         PHWKkhnpx0cwAUYOFhXHuHgl7gDARePSHX9kc4MP5kWs/oJ5ixvWQlk8HNW5vQAMNFK1
         +gbEjUJ4eeHomjzs0tU/Q03NJU8+VaPmt8MqdiT0qdNKaLajAziTJuordS+C2NaAdw/W
         MbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461683; x=1789066483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=;
        b=OW1jkqiKCIkwM5VvimvNAK1b6wbemtSS79MVX7iAugS9vSUyxMr96/4ykdAn7WomU2
         aORCy1nSxOmHiNXJGPgthAWCz6Aq49Rn00U4/eYIVifOL8Wfx3lG8dbSK67Mjm+ihkMt
         wYT3AnOYjxpNLxtJAQQuuiL1UrRmetnhjWXwu7SRRQ/LZLYCC9/5I1JLjprhW7Mo4N47
         qnRKbxzZHXpd45OZzTfpZQbBAWujkT5XQka7XAW+oRwugGSY9jNBtVGlG/G5aAiyQtq1
         9uiBXdIMkLA9XfA9+00LQGZIruMsVakRPANp+SxvZRqr1UFW18TPCAWD8BzO9+aaqjYj
         +8Gg==
X-Forwarded-Encrypted: i=1; AKwUvByQBjUCS9RbJy2cQ6yejfxIvZhQS7e88e3INgGxyKWMXX9lbur/1x0gkg+5oBijeQfMscnoHm2Xa6XGd5c=@vger.kernel.org
X-Gm-Message-State: AFuF++nwEejhzwJLLt6nqhlswDPN1SbY6v35kCmAp7KD7VPLVBoo3iMq
	4PpYVCAfWL/CEGIqXm3up2OBUctJaQs3azjq5LuU+omlxmYrUD9VoQe/Mom3WT7+1p02Bk212S2
	IrCanFqK0GYLAb5aoNWWGEGusGjpNG5FqzYSfMmrdzJD6qOLYAWP9bpxFB7SplhfXO0Y=
X-Gm-Gg: AYBFou2a53y5QMWwCpgPRN0QtzMqzYs1CfEccfkiOQJXpOBKvkqmrTxAIhEeul2a7cS
	hWvmnRqPwepNNEEOHsgTo+AzfQI0UmvOk7uDKoS7tE7Z+Xq5Nalta4JstOxVfRYS6JcXtDbunWY
	DNcrJfJlq5kP87EgkjTfZw8T8Vfi8nQGcYmT9nCCMRbU+7GTymdMNWktAKC7Eg7E8V7Rlg5CRNM
	qZaXS76IINL/MoxlnJ4D9vcDC7qxgfE5APg7UiO+k47Zwr0wvOQAUYbyRlbIzMqh+PtYrYj3kBt
	DAbKP9csB6unhWmTl2jHQ4+aKgJmUVN8kNC2MOXzo7JNg0rlrt0TAf51HDOWT8oVLDY0HHJagRq
	09ehwhNq2BaG19/2LcvEH1qLVrGfghQ==
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr723092a91.25.1788461683335;
        Thu, 03 Sep 2026 11:54:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr723030a91.25.1788461682819;
        Thu, 03 Sep 2026 11:54:42 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:48 +0530
Subject: [PATCH net-next 6/9] net: stmmac: qcom-ethqos: warn about legacy
 RGMII PHY modes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-6-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1105;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=K+J5JXbqYwK3TUxpCoU6dPlVnyBExv1tcHHZpJs6rIE=;
 b=VDlMBVbP9rRPq/DX36zllF3huKy8nLST52QEJlSSp+jxj3Zs1EezJmpRt51v27kOytNJ7XBqv
 7jGNDwMby5uAoWl595g90dVdQe+h9jNOgpVxmQVVPMCnxoHZ/z8q+ZM
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: lZxJkQLupsmwIahNQjMwz_GQ34dgZdNY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXxdojahfOVM4p
 +U+J5LzBsJUstGWPhXWZ0yy85Xxofm191SWI1hgQnEIQiPnIpAkqvzZrrQs4rYniuqHgMLG8sUh
 ne/DgJSK9qg6TDZNvSjzf6wDzM3WfZ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXxoOjLDNBiJqc
 xNM7JdJ5b2ur2lViPbFskwA02/Yj9dr3jHvALjqM78QeVm4KIPiuwCBh8SmVLJJC20ORTh/LZgt
 CU6yoMWQ3L5ApXxB6QCs4x9AE9CirYbfqCalfuvUuJAJkTZqmCtbAcVeQfz+Oj7qKCWVofh/4fj
 wkkdeTDvY4Js5u0OvS72Q1Ucnzteej/ApDdXdr0m+z3vaKWBi/0RSu0e14mvu24pbC3/ZEH5Bxo
 t6wQqa34UPazlAnRV+I863wHMEJHQWdXbmcxXZJjiOtEPT58tMRzkkkLoCkeSZsOt17VSirfKi7
 013CNEuBgZpHF4TyrzyOhGr7pvvHwZ9N6dag3HbXIg6RMDSttJl4JAw4xriJNjkJtxEPYUSrPFh
 Fl1mxe25JGF8YMM729CmjVoqquTU4Y7mIyH+Q6AqcqewPlyvF6UMEEE9EnDbbUUlVDfHdFpITyN
 pBE9Q4GuMlBkT2hpQmA==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a99c274 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IeZn-EEC65Et7LrU5-sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: lZxJkQLupsmwIahNQjMwz_GQ34dgZdNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030165

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 67738c1598c50ade22f2d548a6d66911c348af51..2ca2f03de30174c9771fdc517c0e21e3b392ad76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -554,6 +554,8 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 		return;
 	}
 
+	dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1

