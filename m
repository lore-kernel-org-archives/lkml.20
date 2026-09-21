Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02EB1FDE31
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971598; cv=none; b=D6ABkAsi2nnavzeWliYzL5kInvcf+klh/ehoxuPegCoxp+yIMMR1jelF0Bciru4Lmt0Lr3eFuZ/UIQymmeu4NBxQGtoZfXQnQq+pAyNUq1EKG47XSNgZ3rXxb08t1wk/Emsrs8DVI0hJV7PipjMUKMXEQ60cq0xoIE1X81OTcyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971598; c=relaxed/simple;
	bh=80/vGrZ3GHUbldEoaZPJNavu/WmYAHTn//dUWIpRDOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKLOLy6qqeeCZfd1CAw2S974cHHp8n2zm7P+5TK8P0i9jejn7pcFlKTM/de+93ldNHh0DYSSjcx2IzAN5MJXPDptMW2Ln1FwoAeR6cA3cMnpmiE0TkwLE32nfvGURHDW5nDRrd5ZtVIk5hKT3pxLPVkqEMEPpSXSrfLgkU+GFew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuIfRqk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLJngAd8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuIfRqk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLJngAd8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L4Ja7q002290
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=; b=PuIfRqk2QP7HSOZk
	fTqbFM0wMZMvB6w2T08iTyr8zCAicKvM6dtlrZi6ePtwujzaHOKEGA8lFIkxVua8
	jX52Sc++aqRjyeoz/zr290QvTyAinTbuetZ/PIO2XplgAllWjMVm2RMdZQZ5q9i4
	iAf+nzTBs/7SCd1aAiSoq8uM+Lee+n3FQKLo9DdTlawuYWmgo6pjRse7fa0IAplM
	jlOf+gW8S161jhqR4CaeMIZ5vDfpj49UgVaLEm11EbP3ZD9CNF3tDe/piB5doOOJ
	l9p5zg5az0xH5kZIOZvLmogUwM2wBi5tWoCQ39hdCQrv0BmcnMXAZXllWs1QjB+s
	BamGjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5gbr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:19:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1972834a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971594; x=1790576394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=;
        b=RLJngAd8aW8Rv3v+eRUk7yYZ2EB+5cYbkx7RtG6rQ6aZ/nnNZtTRGiYPigKOA52N7L
         DanEp4n91DSEsNXZRw+86pEluPAawm7azkjcoEhcBNAs2ANvNaeLWLUomx79nzDfPJRA
         FQnVXS7XkzrsM9LBmSYHbV/HERGBZ6zvHQlFgsrUwfxOwxMXqgzJItBPNUr2LRVKkWxR
         tnmklhxfpQl2tCzuyEHWccC/4ID6QhGaZEKqt6T6bSSpxpMNgF03Hv3oSuqAqxmBuoi6
         CMnhQK9BJCi8b3pkwfrN4U76WjcBs4dBFnEfFmrfq100F3GsdVoZo9JwG2JK0TYra5Td
         f/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971594; x=1790576394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=;
        b=T3fa6a1KDOSC/X87wVxFUAWxlfptiu8aSUGek2s4tT39yC1Fo7MzOrP1ZM91vatRtz
         U/XA6xaQUjQ5QO1V4T5W6FipC+ouyToALgLiWek4pUgRuvCvqxgq2qX2U9RG33n9aMJT
         yhxyMSlx9lSVISGTBOfBZmuf5pF4qBibFCwrZkcw/F9WARH4hrr8duYxLWCdw8+3ArGP
         QcZ05O4o9BqjWbPLx8SX/8M6kOo6w6MyTGS63H8b2WjfqMxWNjH13gUbazG3bKmwHrFS
         lUJhzW1OBB2axCrer3CA+AM3ochIcid121F+5lhhKc+dNcYKRCHi/oM4GCZIOc5QBapr
         DIjg==
X-Forwarded-Encrypted: i=1; AKwUvBzKTtwPkq3eZJ3fnQ4xy8AwZ8jb0qSqmhwJfoWLzpZL9T1u7NROBWRyhAgew8v7A025OiUMne9KsQrbyf0=@vger.kernel.org
X-Gm-Message-State: AFuF++kT1uN6FyLnu7lcEQqIpWF8RsM9LJ5kw/J8wE9+fDGLSEY0uYhb
	m9OL07OZpznEoup41Ezma1ZmQUuX4WYfS4RGSYBDkvHVABYjKKHzk7xEo3zqv5XIkGT+rh7aMQ0
	XuP9Z259QPi76+1AshRIZEykqnG4SsCh31wK8uhBxTmiisOHJexyVZPjZHhpFkelVYHs=
X-Gm-Gg: AYBFou3NFdPyTg/n3RqcjY64rtnoy/I2Tbi/tLqmICcKbt5kJPZnCClv71A+EBiLjr6
	fIvty/X5Ga+zjgIFz2CYKF2ZRN7PXCpGOCVmEBeWl3pzdINvsLyH4VGAOO2O3lHdgVSp+wPYRWF
	bVnbpuR7qL/jJj5zpWhpRqxLShSpsVAIl3mwaby01gjp4XEpGxaKuwBKJY3YDYdVw7xtgdGh25O
	GpAQ/D7MnhXKSt7I3xBVzNeDOAth/ko3fJbKGqBUl5H5XSEAeZkIPALxDspev42yRThxP6RaUfC
	o2dJTVX/akXSbTQnb7AtaiCRbemsa9du2M+w9UKePeBp9qdSqux49K1SOLePpmgGHgG/omkmk1p
	fDFHh9rIWdL/TpAhl0UMRoY9mY6JPXZPRiV35ynZIhuwUuAWC2YjIeAszu7jD2iUtqNwl6uam/2
	daaiVPgDc62bqv2P613y9FIXeiVkX3BnDKDw==
X-Received: by 2002:a05:6a21:7e8b:b0:3dd:a00a:7acf with SMTP id adf61e73a8af0-3dda00a9faamr7840851637.60.1789971593733;
        Sun, 20 Sep 2026 23:19:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e8b:b0:3dd:a00a:7acf with SMTP id adf61e73a8af0-3dda00a9faamr7840824637.60.1789971593315;
        Sun, 20 Sep 2026 23:19:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:19:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:34 +0530
Subject: [PATCH 01/11] clk: qcom: ipq5018: add 24MHz rate for USB UTMI
 clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-1-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0cc8a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T_jLbkAMJ8GdCbUqRukA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: QVYIJBYAwZkbiWenfCOm-DLS45zV0au8
X-Proofpoint-ORIG-GUID: QVYIJBYAwZkbiWenfCOm-DLS45zV0au8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX4d7RftIVAyht
 kEH4ZQubQsc5Gw21pQetRsyOAuGmTpS8ORq/wWcL2X/FAhvGofsM5SmmJemIUAUlEyMc4VfrZie
 zjHOAVFv1VZJw0Wf0xo/FX2b5xEuCPE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX4fNJ55OHFLqU
 lL3vKb4T3q8Scaayb5GUnl5rfb6NUwIbqJ3aG/CjyErAe1X6jPq7CdjxihrtK+QYoQYaUEQeFTX
 GfBstUw3egSdxW0biZyyBU9nvk2n+lh6W2aFiI1Fn5oojdYMeXs65Q4w4qUO9BsY5CohO5jyomk
 gYIJe66U8L9ePldTRo1Onb9MnMq1bdOrc+FXk8eH8EKpDX5l3phwnEMkkNtDRDGs4khWwtfLGvO
 k9MJNOoC+Ct0YPlk7xdFOh0BkxEA/Hl7CdeMYqtJXtVP+WSDpJTJy1Gas6pxDz6LgPE/3QBMkvj
 bjJ3qRcDuK1FkrXRtqoYYY3v2/FElkteniatjW9rUUkmswRTYr19IKpoQq+k5blw4KMYaeYk0xF
 hervO453ajTnuBejiJrZvQ0IFFKWYAHHcGh9EHaZqs6sAX2EQnNrcg8jS5bheE1kmdlyOjRA0nv
 N4pBAQ0Eh7j6XiR2iSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210089

The USB UTMI reference clock must operate at 24 MHz, as recommended
by the hardware team, for reliable USB operation.

Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
fails when the UTMI reference clock is not configured to the required
24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
the enumeration failure and ensure successful device detection.

Cc: stable@vger.kernel.org
Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 594dae3bac4c..7d0889eeffd5 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1260,6 +1260,7 @@ static struct clk_rcg2 usb0_master_clk_src = {
 };
 
 static const struct freq_tbl ftbl_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL4, 10, 1, 2),
 	{ }
 };

-- 
2.34.1

