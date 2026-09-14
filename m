Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E5480959
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390147; cv=none; b=BwJ0hxAzq+gs6KcGjSpKVjzxXw/60xAUL0JKlZ7GA2gGWBSZU31fAkWK7vpPegCnPpRrriyKyS4Q7C4MSWq6Ror9PkE4FlHz5zuq43lHzog/Q5xBT10sniHrw4c9Zy+AXh/m0EcMFlUw5p+WDULRRaKjGqaBYvpPpAhGCQL8ScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390147; c=relaxed/simple;
	bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/BmZqFXET869yLCNoC7VDZs9oKL7ylCTnbD4gdlHMFXA7BrNHxpiFd0IM1L58ksHTfOE8B6Ruk2vQpVU/1V4hdOtigtUdPXexcdRACz1oeqdw9FV9+nnYEkGQORFMxArgmda+922Bb1q3Xhy2B3C3ueTFYsQ7iHCA8cmQhaTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6sVG7wz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYfosXkw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6sVG7wz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYfosXkw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7dP3793323
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=; b=o6sVG7wz+gYfZ45G
	bGAojeeRPwvrtQZFVP9Tdu2uzggOlvL7kfoWxrB7ai/W7fEiSJA5V2lO2RJBcLYV
	iwsDeR4g16ZiqyyTyXTpWDjXKvbjgfQfcRnAUGs5cXiQxoWClzX3a9K3Z73fMhfK
	HsGRo3XS2s4ANEphBXlvcompT9UMXumdEeNUGnczm3j17j2m40bzUqgOUVBezlxI
	26d7LKg/OmfzmWCgPGbwlqMFcaS+tgWwe807QDS4/ll4kwfEWNQi7ZKYkKDrFmtl
	gPzVNN8qi+7tUoGjsXsz2WpHsjXt/wUyITZOQ84B3AlkauTZLskmnI/iFyFcUPdm
	60Udow==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg15x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-798c310ebb9so1030030137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390144; x=1789994944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=dYfosXkw2VK4ul2HbBIF2oqRrPNfeR20LmPwXuNftxzPjXAFtNMjTYyFEKeTRw3pcw
         Zo2paX462PgtpjBFmljCJhLn7PBESXZMxcOhyrLmjoBdMV7vvYV3gapMS55sBKqW46Qt
         AFivJCxcVyb5dMxDWv1a+CmoN345kSzJlLk/sUhRDqc5QtHP2+cvMN33NAsMZNbwyFfv
         bQk0MLnhwhwqkw9vEvrOPXfsMT6hlKKfsjbVY3YfuEvsbsHG5OWKrysWoDzot2XYOex0
         GFyB+L2g95sRer50c8bI8+x8X/nCGNXpNWAtqKoKhgK+ChdFrVv+aS4Wy4NY0FVdA8DA
         qUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390144; x=1789994944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=OxLUULskoAt0P8aqN5QLQfJR97x8CF2lr5PtL3Udb5nnZm3uLCcZcYvYVtQRFChv2t
         Hm7Yd7vlwN7Wtkf2beU8OgSLDHBIUHvBH01ShVVMuYr1emd6lmk8nUUXe6jV2Ry4A5BO
         8JjMHZrUMp7MdNlzzD78f1PkbjnOcTvmdc8loh5ubd+29Kq4DFpznrv9x43nzjKuQMlV
         LvMlv0raMy/gnHAJ03bsJT4G20569Bsz20EvRap3USOMGEnkqH+s3d4AAcaT+6UwmGoj
         pBfsahAd0Drhb/9f66tFEfTbjW4xaFFRqRF5ByAWTpF6vQ2+6s/ZeaKwfIFF0eRR7swt
         Fnfw==
X-Forwarded-Encrypted: i=1; AKwUvBwVdRVEctJAQK9FbJkwfMcDDkNBkrMmO/45Oq7f/tg0AgB6TGVdNeOBmFx2sFjej1G3wB3jZLGyor3CFM0=@vger.kernel.org
X-Gm-Message-State: AFuF++kgjvCPoqhf4QZKVoeYirEjqfxPV/yI/VcM2y3b5yahPNpxw58a
	+wlyoyVMZB8FBQKsqwgOjwFwvR+xxmEMeSI+6bkAxk6Rt+7S1Jd9shvg593kCRdGBUyHoLl2J3j
	CYPa7tHx8CmP7z+ndgLqrfYEg87xen+ydg7oCnDe+CJNMxf3W4H9Tu0DHH7jgDcp8cUQ=
X-Gm-Gg: AYBFou1traobfISs+OYQP8UFCAjKjYj1EtcPm8y0l2t59u+GlldZkbx/Kbc328IMhLx
	5olIesuLNmrPNBek+ixUksGxDOwTDpsX6GcQVO8wfMqUjYOoVAy2ozPFtC4AuxJ7232nhQ+J4z+
	VIe/IOfpW/u8pwxGVEw/VE+b3K3e8o1ImtX8xkKAgQSzop0CGwp8atD+DbplaGI6YFzxlqZ2wKR
	8VwfyHAFoYrmmk/U5n3UuKNQGqrsBDhW6ICWTnjwZDV7uMURZ4cd1o7gZPLZU8qsLVPSSH2ZZln
	/ae3SYYM/N7F1WbmFV5wHuKeJQgFkkZ29IymLA92z0uUDbolryOHgRF4OPejoLXCjkAe5xXE4kb
	L2YLLLrbb
X-Received: by 2002:a05:6102:a1d0:10b0:79c:23df:6fb4 with SMTP id ada2fe7eead31-79c23df76famr753380137.5.1789390143666;
        Mon, 14 Sep 2026 05:49:03 -0700 (PDT)
X-Received: by 2002:a05:6102:a1d0:10b0:79c:23df:6fb4 with SMTP id ada2fe7eead31-79c23df76famr753347137.5.1789390143142;
        Mon, 14 Sep 2026 05:49:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:22 +0300
Subject: [PATCH v4 23/52] clk: qcom: gcc-sc7280: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-23-9d5a606ada33@oss.qualcomm.com>
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
 bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zhUqYL4GQdIE1epatt//sFU1h1mpbwQp45O
 Q+dHaoYhjGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs4QAKCRAbX0TJAJUV
 ViJPD/4i9lM9z6lsNWsU1lZw29d4tEOhihEsXsZDJsNtUhU3YQyYyTErU1/22/czSoTWxXXNBU/
 rfZYgXjw0SOx9xCgEXIMDflKqEAZfwhqrqZqQ2K9PfEIN5+u7uYHmekBikeprvdFvEKynzwrX7S
 Xb/jnarpw+GKculPKBrU0B5SCf07nwJ/gI2XL61tXkODCU3fM7l9C3vfrHuN1FYstZOquw3S/Xz
 xWlUQrskkGKsY+JkvUmygSFODhJDiGRZtEQTSW6seeyOVNl//Eatoi/AiouubUfUIcReGZ5MPJ7
 c8NNW8RICmQ64lp7GdCfZGQ0XGaYdOTkoartcI0be1tojXO2espTVpzvkrDMJMslKNK8uSg4l9x
 Nhz4ooJ1FQ6bgPgSsglXuB/Quyaf8HHY8xBp1Ac4C/l8IG1UOlJQx2O/7e7FgoX6Up1MLSIPwCK
 3vT2qBX+FdAeqBa0e38s58QNNx1heYmdzG/oqXwmzZPOi7Djok4SZVqSv2YK4Zpzpf9sLWzv3F/
 a/c8Usm0Vemw1OcHZLkVLlogCWfjitffUWNCtcap/nzawWjqNZQPpW7TBENTd0OTfUUwx2vSsPu
 SfKOvQ8fmn8Bn7CyIeuovIp5qux3tUjEHRzFZNSF9xkxD74YpPfnQxLo00V5laF3F4nAf6pbOiI
 Vvohb6bDN3MiBoA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed40 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: VA-XwwpqLf2ikMivytQ-xnn9bAMQVlSy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX574DF2TMAeF9
 t/hLNZZ25xZp2xxlDeupspgGK1XBbBz8s5uHtoAWnDw5sQKa9Z2yMX2p4k2wCx1mpr/wCJdpmgt
 GyYvjt8BVt+cZstygGo8/P0F/S4wcwM=
X-Proofpoint-GUID: VA-XwwpqLf2ikMivytQ-xnn9bAMQVlSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXz4nmazy0ptaT
 I9FWK0SYhHvfYEJ+96a3Pt1gyDkqUgcsfTaCRDVEUkYVjo+9qrJooKrsEB7u/1SmvwUDGnBLnaU
 HQSx0PJIOcQPGxO1HWq1c9cAp/YSxsf8An1UWfCSjSqtVSsd5sOWO2dQZNyhsA6A7vV0lq6R42Q
 uUbDjkWkRmdwrn15xN8s8i9BIFLunGbNuBmUgeMNWkiyTrLrnDjpncYbEIyTC8bzfcF0nYntBo8
 bZirD1aFrvJKauf9b06tSX/UwIVx/oufzXsE1ZxtLYRK6d7vsGjOLiFAGL6SVThhj9ZckWWB+Jv
 3HlCEOE7n+sFEHJ336SMGmcB0wxiQxdgQOp6xq7NL6KBqiRRimmwazKvToMWH909Esj72ms9ebG
 //sa9qeiGXdeNdsX1E9G7Pmm0ubuXQKUh6S5c40f73cixTk8KXtHX78IaF3bDJc52aCWixpVEdR
 EpcAB6c4Yo5utau2wBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691..bb8f6efb88b1 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
 	.gdscs = gcc_sc7280_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7280_match_table[] = {

-- 
2.54.0

