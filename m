Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00421472085
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390153; cv=none; b=dlNIEcGA97V1smarPATPXSS3MTsmM0udLmrfVU3lHrKiwr8ldkhUq17Iq2LPYBpUI1jHl6/R8AArj/Q/8vjzoG7sdFxCov9JS8FvZF/B0CSiO/dSdYInOw9KiQCp2zM3M8Z/fMN8Y/x3pp61a2Y27pnXsi7nDhoigrK5ChCSb78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390153; c=relaxed/simple;
	bh=0KiiHZTi/qlr8qqnehNkibdGn4Of38rmmw2GrafGWVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yihuw6kju+mT4YAGuzhMfGpIOR7caZP+c0qXfB4nsIjXvO+QE+sJpsZHdjkCc4MmDW3w5rbU0yrKvfaWpf5e2Qoq6QgS+uNOpck0GnPoaUaEITtjORRjYawdor+L4KIXZAlJF3JNlb/UIqzZ/lX2IC4QxI8roRpEsDqFIRP/QsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClexxJ7R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Crdpv2aB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClexxJ7R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Crdpv2aB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwgu3860401
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=; b=ClexxJ7RMEObehna
	4apQR9V/N4vMZkqziVoTWoAfPdGiOj1yImKIRuLPOLBguHmFOCoxRReNnvx0m6dc
	KSrlc/z7IdZUa+0mNWPFcZiYlT45KLTiWp0JS/89Bcfi5zVl2nvVZqwjUhAP6aJz
	WfATFiPXMDW/cIdioLla07LwBOOGENPx0+rPvh0qWBaCRHgU2zbYthv9Dhu7oQC/
	fzegqFLOqdxPWnE9zieeZOhjlzJ8Zd9t03pJ2VBS/HCLr0EZhB9zsDdSobxOgNnR
	czLC17P28gahvDk0WEdgh4VKlYHbGgzNl41pyh42e9xcIz4DmJfS1pHf6VUqfxpD
	bt1lVg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f11dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e98e74535so64160536d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390149; x=1789994949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=;
        b=Crdpv2aBPy67XsvQCTzqbnkSBTrPyzVAcEYd9nwqHJhI8w57PXs7hXq1qdtA7FJxVc
         NV0Eqs4eJkMZGsRUIjK1PLl/EhuD0X3qPwT6F6PxxvrChSe8FE00Yfy4HgQoJReeBK7K
         5VIFg8I/bvE9dtWXxOGIHLwYXsAvsBTpr1sEg0Ey1Dmni9eiK/aHhWmRdoLwTHQiNftT
         rhFxI8pKnYKOAsq2yx2Wh0SVMoJsXk9q3ZAtKyM9fX8rQp3h/ftRmfuSDlcgQiU9sxR0
         XLmQDGpGMa7s2v2fDGpePIuRimsNbBTDuShFcJzkYFlrn3t/yMC/rLzJDcqTWcoa/Oak
         hM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390149; x=1789994949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=;
        b=h02aCrHT53A5bFMxBqaQHFVGuiZKjEQX5ckKx+R98MyFpNAHAUuxgREzdgAuavbV4J
         p35p8+g0Ygpmb0VvKewOP/ZUsLA00R/6YqSQHoK4qBOvvwChh4AJ0+sq7DtM+lia4QjR
         Zppu/3PFjQ7ZvFVvwABFH3f2YjyJZ3lmqBcS5Cq8XlkKJAeiZeIm/FutochpkwsKV0th
         1BnbF7kYckRn9dmgj9NJooebM8W9gz7jT/HTwBI838O8xkzxxImDZsRydbYdC56IULf2
         smv/x/I0gHq6EUbqVGBXhNdP3XtKKQmT2agfyKEFmr9Y4g9ihvzWm6bEmCZlLGoSN/2u
         ebng==
X-Forwarded-Encrypted: i=1; AKwUvByBipwgx7NX+wAtYs/lp1Gs4OrVPnVmQ+heq39F9YUxv7EP2jqN+KafKf8J9L2RFTabgDmluH6spvOi/9I=@vger.kernel.org
X-Gm-Message-State: AFuF++kqibrk2nd74EuPpxiCXDnK0VhmxPWtP/INzIkibOoS4eAjW4Lo
	jb1YhvBgTOyRtGzkCloKFy7osKO3i4B7tgw6UBdS+WmePH6305npiTd50Rct+8zaR7y26UKpw7H
	t2dN9Ng6pEzHD550ZXY3FO2LJRadg0WoVz6WnVrYSYgvzwmfyXT/HtEQTSryaWVmpHdM=
X-Gm-Gg: AYBFou0mginoGYt3+SuO07teNdilZKogv3FlNUhsAfeHhDfM7FdfTwUPaYJ0sSmAx+T
	K4cYHrqcv7EEzyKhfSaLBxKfF+x3ZAKYGBkc8raVNDLmZ0Qzs5ijTeU+4eHjrntzJHzUgH+u6VG
	UliZdGwuTU0fK5uKZw05j/j5jVq6bfjk7/96tzEmen1pMqtZn1YyOCrw9fAKGtPi00wn4wZsmIf
	4/dPmqIUp9WQ48JXQOp5ExGOwD9AXlMwF8+MdViapNLSys6FrkVQAVYBET4EAu7+C0p3osikCjC
	q8eptWMgRnKjIGvVkLFM1GYIRhQm4hMfrI9enCaa3McBlXrTT/DKSvZ7ZRdAQgKQNUu8rqxsNA0
	NZuZUBF82
X-Received: by 2002:a05:620a:4111:b0:936:af9f:4c30 with SMTP id af79cd13be357-93a29996c2amr336845785a.25.1789390149150;
        Mon, 14 Sep 2026 05:49:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4111:b0:936:af9f:4c30 with SMTP id af79cd13be357-93a29996c2amr336840185a.25.1789390148598;
        Mon, 14 Sep 2026 05:49:08 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:24 +0300
Subject: [PATCH v4 25/52] clk: qcom: gcc-sdm845: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-25-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0KiiHZTi/qlr8qqnehNkibdGn4Of38rmmw2GrafGWVY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zjtQproKSTFdsa5ICvAPgZUrcCb1sxJKC1x
 G8D06fMFzCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs4wAKCRAbX0TJAJUV
 VqfvD/9uu8WONs3lZTiPPtq1taaj76EWB8UIRJ6MAwR/rz8ZV6QCQbvC7Z8Efh5luhSmewATN/F
 EHb6U/UlKOFGR7EpHsUND21zaKhFT4Acz1c27UQ1RYv/Ynji7Fzl+S9kJ2XDOet1I69f9/IWfa3
 4Bajm1XVx1HsjqJfMa/EHW7ZqJ21k1fjCb6VA+J2bOm7iPtmEgjS0vuNsf6obaSAupXq3qbPIEl
 IKBGf1MXHprPi1aYyfNtbfIP14qGTL2ZPWLVbnPgRN8zWakedmfOcwY9fH+S77fbw74p/1hgG6+
 EISRzI/l2Vx2R573AtLst0Dkoo+GvcSY+5QvYdSlVXMg9OIieIDHlaHs0PyDr0o8tmRlDU3lR2P
 LshqqIXv3hh6ZVX625vjTzO3crupPwcGkJM7CB89Igcaw7ocKlqv0z97hyzZ0GbF7nCKWirH6zE
 f7YZQqLK7WCUxQEm7mK6EWimeecCkLjcKTMxJZabW551LL5reR885XI8L3XQT8Mujm6seg6sK/m
 dSVltYi8NQWh4NCnRZISE7tSal96jQzHuLRvNM0r4hORYcqK0uRSm8efZg72qrMkarLDgs7K5E0
 pYFM6k8ZdQUm/SuJzpifR4PRyyz/1l/7dd41NPd+xf/Xrh5R+LtzdRa7YvFSy3UajiDwpCOxohI
 zo5qpaw9gDdyTcA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ixSKkrYAI_8oQLR0dHGydgve6Yi512Ih
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6aYrAQdqnjhD
 5d9CTScfDzz4LKGiMK2b9P7YwLmdGlGnjmWShfdjvRrz5AGcaaHwzWWHCYIEuyp1DSbwLfmfgVW
 eIwO4hFouXb2MiQN+Ezxa/UXsXX7dSQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXx5JtGU2kNw/k
 ifQpnUwd84ZUD3VgNRzzzAi/MtatFVU09YsCRgqQ+0Z2PHv31fLce98KPpA3qy/R6jgdXyLIwtt
 NTQn6Nv4obsUQbcuIxoDYWG7Bo56/9g6C3wXFD01nOqt+aRCW2rr+L8PkxdTNK0BmUjFglX6m3Q
 wX3N/G57cSmvfj26Ez9NQ//jpTSQB+a3p9YqYkStRyOHIxKNVqj89TBNxnjfCo0tKIgpIO4c+qD
 ZBTVZKGgL5YHJF4QsNM4U5VBIvQFcZ1PSrvdYCJsoJTjNErk/jM7lZ6hYacwaAx5pXHx1410nkr
 lAhWwzLJCSiU0t3nTzx0OEkRQ+SaPWXLRRBhTUIEUGbbbsOf9FuzUZll9GwLSAhgFDSTBoZe4fl
 1JHkKS3uiUrIgW2Dw4OEvAmkEmo3j8W8qsGf6MhK/UARMAWUNfdWVYNFjx4kc2W3aCzELMnn/a2
 ne1OK/krKaTSEO2khhQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed45 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ixSKkrYAI_8oQLR0dHGydgve6Yi512Ih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 57d54b45fa52..cde863dcf185 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3959,6 +3959,7 @@ static const struct qcom_cc_desc gcc_sdm845_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdm845_resets),
 	.gdscs = gcc_sdm845_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdm845_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sdm845_match_table[] = {

-- 
2.54.0

