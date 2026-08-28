Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5770E3B52FA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910208; cv=none; b=HwordqKY7hLLSYBKEXHwAmKdaqMxUvJELmqq0VntkZWmqMG2YoMTBTa7o261nf5ARRIJC3Y8gtn9YZjN/P5CBMUOxw/J9KJeglzc0H9DFoQSJeao/LjCDj6h/1G4szPSwmleHxlVfIJiFrkGTnOdaRLKvQ6QYAeJ7NuovxQeSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910208; c=relaxed/simple;
	bh=t5WkXwSSrlJHLhd5C4o5PoYR9ZvFgasOSNvibgtRfkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tmgdc4tfr76aJUUl09glzhMfd91h89LLvzRo+1Jd/im96bXE6eR4cTgXe2o7+qCbUnwmMLRvEWLq6HmW6732Gjm33cCEE6ek0/UC6E37LrlsKDNi6hrQZ6uZP6xn6jih4GFfHJmJMfwCyap3VAwxU3VoKc7RVHJDFZ9J3uf7A5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETF4woTm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPVWZ3lE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETF4woTm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPVWZ3lE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S98M0K2592617
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFmhGdCQxjWoN38GCOuMwu32e/UJVZjw14beK8J5W+I=; b=ETF4woTmv6F1egZV
	HIXHkfY5XDqJmNeU/fE0aZP1/uimm5olQk4ZCKTwuS6fZBovXHxJXH+J7a4/ySU+
	KyizSOpRDj6teu5kCuO9+YCXN/GL/rPfNCjYzD0JYueayVqND+TufPMVH6LREORa
	ICb+fqCFQ9FnckjWEZVoK6Xy8YfUdsjtJxL7koa0H92nxsWLCxH5Ty9vl7Jpk2Xa
	sJ9lHE+tAhTf/FVmjCxo+2gcBySyodo+thtb5ngIDvu7F64PT8IW/lfcNmrLsmli
	O796wqvz/o96BBf98ayxboN3bZk6GTaYh4wPjltWnmUDXoKlQ0uXA0pnaTeKob9K
	iSDyvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh0401-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c057f480so1105749a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910205; x=1788515005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFmhGdCQxjWoN38GCOuMwu32e/UJVZjw14beK8J5W+I=;
        b=DPVWZ3lEf3Os2lnG4K/f8MzuDSDbChMZ1fLUzaRCiWIQoQ60AqOPOH1YmMz4QwsLT3
         BfMiCGFOhDrCSLfXr8QtGMTJ4dkC4yVMBVtmZkm8acnfNgL+HZcXo1u3Whv8Ie77hlO1
         b0BFKlQpxqcy1ZstztcFrsG0SrNZrx50gUdDyCIMC8ms49tJ9xfIcFxEYl4Sbsx6oCke
         G+EpzuI8J0CdRdr/CG1o+yDpGUdcJ5BVWBQeijZovG1KQ8ciWdLgxxH9FvmnBsV80nfg
         Mcyo4BXw7fjLhFE/z+kDN+FLxe4XZmGyYhAxuvu4mN8+w3hghhFfypWbacgYuBCQjDoG
         4eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910205; x=1788515005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yFmhGdCQxjWoN38GCOuMwu32e/UJVZjw14beK8J5W+I=;
        b=AWvKsd4DMEaE3jDX49HFLSy278tL9dM8QQQXzJzjQgxQG+LpapZ6ao6JPt0W7vSfKr
         ZDBacrHTIxFOHjqm0/p9N3qu4qMwOeAP2C0xiuHgxvwK2bSe6s9SGBRjlFwA6ROFJp4B
         oD5rbYa470YUrTVrH2JPUXKjlmmc9kgoENLkpnR77g+qV85HVx7GavcUhZzAtZuhGK2t
         e3OWXTJxB9pSlybzevaE9DHNOsT3dctVui4VHP/43/LNvRPWGPtDGIHU4XnBNgh7lLsm
         FMrbvUsK/SwHjOeJd0jwYe8G7ONPaTEkKBPaKSLlkAnTdyVnmyiO5KhsRKAa48XfTG3O
         tY/w==
X-Forwarded-Encrypted: i=1; AHgh+RoUp5eyaN7/8vQYUU77f5DL96jriZpmFElecc40RmlXe9PknMVMubI+BD3fbgCSAQ7CEHPAgbONzyKJDHM=@vger.kernel.org
X-Gm-Message-State: AFuF++lX98GI7QcU511h62t76Tw/gtvZBLV8JeO5jUMlfxPpS9921jGo
	V3TZGxOX+4ZWhJKmwHDZyS7DwQFJCR8eGJUQboTdKWO0HB+0/mHtR5Cd1PfT1m3mlk6J3EULFCh
	xj/XVx7YVhDmIZJdQaIs9kSOuLPR9SMWU+iIkkTzf9DSn/gIT0whJZKlwNIfJaBnDdLo=
X-Gm-Gg: AR+sD13J9vmGug/YN1v2cCv6GUXzbdEPYwvu5J4dlkvMG7sXQOVmiC1jaqNzi91o6lT
	TblQDf80m0veZQEvIFb5KaZ38nwmdAtkF/WnalNnuxbd5Q9HSQhEeJAaJxgthhYZ4oXpEGSOM33
	B95T3itz8onHq6AJAObU152j6lx+a5kzth2mEvuZpGXpxYW+ixdCyGHSKjnlS6dRgYYLUAVzzVG
	vymnel3HV2jJajzs7hUQM++MtC1Bysg3CWpRxLuZ12Wj3dBrFgyOVqGZZjkqUDGYCoGnZFThYSs
	2L3cT1cu8l1E2cHk1lqWjH1LxR6ivudgWvZX0YE36KLZaQ0k5HXY5JLty7W+gvn1ZT45ecsterf
	pcOrh0rbtXcg/HwrKNO2a91qbcfU=
X-Received: by 2002:a17:90b:37cc:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-396d0d92d0amr12237771a91.1.1787910204885;
        Fri, 28 Aug 2026 02:43:24 -0700 (PDT)
X-Received: by 2002:a17:90b:37cc:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-396d0d92d0amr12237709a91.1.1787910204482;
        Fri, 28 Aug 2026 02:43:24 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm4166331eec.22.2026.08.28.02.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:43:23 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:13:13 +0530
Subject: [PATCH v3 1/4] phy: qualcomm: qmp-combo: Add DP COM v8 header and
 fix register layout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787910197; l=1592;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=w0djGQrJ22uNXbxdy3aclwgkEvuPB5Z6YF5eRX8FWBo=;
 b=pvD1NQcrR0rGB+mMYlIFiZDcO8CQgv8R332CY2R52m/HylODwIvU5KMJYuQ0Qf8INQQUVqyU7
 UYK2XbfpBg7CXhDZY/l+tKLLRqstLDaZnK3Hw9xQAhu0xTi6g8rskq6
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: SM3xidvQ1QwhufSnADaLYl5J6eBD1ac-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX/p3Yh+UCqaFP
 PjVs6CVw6V/ECEWa1mWLyMcMnxp20597G8bQ/5s7vfVscKA8Q9A830+6kRwaLaesGF+mMpw9wrb
 GAyUIe3EtdFX+dFgbOocZcSdqPxAiDeXlvw9Z/4W0arc7ZRvf8GChGRi/v9pB8hFNlHTLNyabNP
 v9sUyXUa3taJmWcHAUZdurJmmwcRiuRIpLtzev/BuVRVrDOztnmQeDSo8S01VmugdiK9exHPN1n
 fdhvMvO/H4DXmLPuobp9BivCw/nDs1M4cYWf9Uw9ec79iPXUuRdraCPGFeMC+nQwXDAogrxYN/K
 XuXoxbLNha3KUnVqbc+wc3uS4o1NSNpIuuXyZp1m+AZz0bPwDonW0xn10H4QbwSBLEvDIp6RNSb
 Cqhy7kfMIEC1Cv3E/Z4iBlJXlpHDJkGGIXrM+xo2N0Es7glZu7M2bBtaTLCC9BET4bZv74pE81p
 5Vyvo1n8H/8auxPqNtw==
X-Proofpoint-ORIG-GUID: SM3xidvQ1QwhufSnADaLYl5J6eBD1ac-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX7/5R7Vn+GlCD
 y7eqTHcx9EzDqPBbnlbTtPiv/z2u/n+F4LDWYuklD2t/gCy/NHs/RrcVy9WQEw/kyot7iu/5TUw
 hVCX/5LRAhH2U16UjglpH3LqD4zp15g=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a91583d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9hqLRW_DAkAp12WW2ZMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280082

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add the new DP-specific QSERDES COM v8 header file and update the
register layout to use DP-specific status register offsets for
C_READY_STATUS and CMN_STATUS registers.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c39ced168d03..4d31637f1dce 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -51,6 +51,7 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 #include "phy-qcom-qmp-dp-phy-v8.h"
+#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
 #include "phy-qcom-qmp-dp-phy-v10.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
@@ -318,8 +319,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
-	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
-	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
+	[QPHY_COM_C_READY_STATUS]		= DP_QSERDES_V8_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]			= DP_QSERDES_V8_COM_CMN_STATUS,
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]			= QSERDES_V8_DP_PHY_STATUS,

-- 
2.34.1

