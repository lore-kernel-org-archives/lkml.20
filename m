Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED494463B8D
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723800; cv=none; b=QZzHlEb1WkzBBDUAUkQ2RftYIe+0vTCFqtRrWZu0N5XAw2VEc07523i5fq0b9WMeiAnpbD/c2LZliJytvMmV2a9iB5KXlTjRm0l35kB19snLHRrR8EputTVaaFw/7K52cI+q4nZtvrm4b6oBUZbasrl9z9ciKHLE7UqcrQGSE5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723800; c=relaxed/simple;
	bh=kQtbDe8zCMRdfmPk+j4U30Gob+Qd5qfzbJSJNXTUK8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlslkplSvlukEVpla9PB19X0+y723eLV9h8Qe8GLgy2JeEXQ09hum0Rb388pM2k7BPhgzGb3P+Cz4k2cVYWcYvk1LZXn7EybKcZhYY82fAB8e9lwfehrcr363VhTTmDb8BBfDe1DmpxZtunsA/EjfP+jhjkmLkklVPxsqGLbVjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqtwYbNe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjBDzRQi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqtwYbNe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjBDzRQi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B85KUg1513029
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79P3dnElqFNOhLiTXzLH7VRd2bA/HKabBiF4C9setso=; b=PqtwYbNeNhcXFa/i
	J0tMlHKJNPm9WZrYkzNkUdf7YKDKwKswKlkGaVjyv+hAMZwqinyRwDC+sb4Krkud
	8t9cOlwsWBx76iTyHsgHSf0bvZcRXjNsJGwADpdBXDTFcsGLcH+iGB5ajeImlJG6
	04a5kppUp548LuTzi09kCxuMqdGVJGe7iw/VEbW8tduX5W5nk07xX3Cn3/n4FPpv
	G/j/wOcEZUA1sIgmeGinwUHr8SQt+SLhve5rHAQi+pBStfvmcirv71Vy32wPk5fA
	a8sF+Px6xIXlfaENoDacmbwbVUVlG8QuqzbuEs07l/MnXowF9umiPmk95q7FI3FM
	EOjY0Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjjx11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso602577eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723796; x=1792328596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79P3dnElqFNOhLiTXzLH7VRd2bA/HKabBiF4C9setso=;
        b=IjBDzRQidW7R3OHqbnWxzytubInKhtI7KoQldivhDY+0MbZd7tIIUJlEQjzwoYxyuy
         qUnl4q/ttbDs733++doKKnYLMmmmp/Vcdj4p9mxUEfva/gzC5rdYtHezduoT2s3PTF8v
         GYhMMKtWBehvIatztUZ3GZT3teyaAOsHsLEbRkczuu5N2KUWnODf2blXBYjm3UfDyp32
         FujJsuPC0PnS4jnVm5fxzXCdBWjloDn/5qc8UFwkbKTb/yW7oU4cqrvKWkmfzCTVUY78
         D/CJYd+KA1HukwhWCO1qqDny+TfeFYTFY7CzRD5M7V5adgIy62Jnjz0V03kfbpf2qs9N
         PEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723796; x=1792328596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79P3dnElqFNOhLiTXzLH7VRd2bA/HKabBiF4C9setso=;
        b=abogHVKHjyMK5u365AA/uBVy4vS96etpU6J5YnhoaveZJoSCaMGUO4MG9T07QVmYkQ
         Bx+To6XzNGzybXR+Qs1ctbjWhMgj/+DNy9fCvu4PSdkOdYXFj37T3PUXw2rUYoPf3HkZ
         KmiAuZaV+U5h2ww/MkBEb6amOKORb/p8/XSOvvbEF1PG+9jlZwyGPhXUBk0UA1o2L53L
         oICUgfGicFtERohXhgnb6GtFtw5u84xOAHTfVeq+yBVwXzqlmS9CPLfo0NHExUHlNrRh
         y71vmEbbamz2Sc2jBYNfFGZnNR4D9x/BFF9NEVhcLTRuBFwvtB0rkTiRIurynhWQVTbP
         kPWw==
X-Forwarded-Encrypted: i=1; AKwUvBwsJp7ultu9MEEcF4w7yaUEqo/tAQYg6QT1nxazMtSZqNlWl5hmJdCQ3P3+rOuB+kOHbaXHPIwC0IoCbZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvlW2QMVGNBF7IsohdL0ELoYzALecm+/NKH1NTaHjwtr2pZ1Kv
	L5EY9MPV4HYRFFfHCEz6x4NbrKFD3pBtzAcH5sDo27WxVZOSmTpc3wqKSnD1F+MLc8QVKZ9+r/j
	DjlTP13GPBE/y5LyNsujm1NOaH1GN5ZstY/9YhGwDUf6GxBR6BY49b1Sv7+A37fTF3a4=
X-Gm-Gg: AYBFou1W/Q/fcPjhQ/hehZ0y8ZRn7hD2YeFchJlHunxtTrtR7oYcxCzA1/z7lFRPOLZ
	NjCaIeOkqaaqYyLgg9lt3QHO0xijGkZcesCddusxsDgk7jbCmnEDoWdglubtmIOdqAVX2+n3K89
	LVKdFwbNyIYrFLtXFiaSplkqL9hyL632Y/tF3HFk8vCjj8vl3cReMKrLb/l4YoGHdo8i2sjDnHL
	gLrDlU/jd+aT/GB/gg/Zc+dd3BdmQErnH2LBV/3sncKt7CcVNsDxNmqHh/bO0uMDJLXmtoU+aFp
	DjSP1lE9atY/ogOsHl5RUaajgQEMK9mY70Lwe+nbGv5OAZNYgm1uECi5Yc8eJafXs5rD+lIcYF7
	CGWaa8xsMC8dFR1RJjtN98osXqvjD8qEIzSEhOujHOrA=
X-Received: by 2002:a05:693c:41cb:10b0:351:679e:ba2a with SMTP id 5a478bee46e88-3537e0065cemr9806980eec.23.1791723795936;
        Sun, 11 Oct 2026 06:03:15 -0700 (PDT)
X-Received: by 2002:a05:693c:41cb:10b0:351:679e:ba2a with SMTP id 5a478bee46e88-3537e0065cemr9806929eec.23.1791723794965;
        Sun, 11 Oct 2026 06:03:14 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:14 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:15 -0700
Subject: [PATCH net-next v2 09/11] net: ethernet: qualcomm: ppe: Add
 IPQ5424 scheduler configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-9-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=10683;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=kQtbDe8zCMRdfmPk+j4U30Gob+Qd5qfzbJSJNXTUK8Q=;
 b=4MR1nGE6bLLGvVim46WEJb6X/+iBuBg/WW5nFP8VTQgSArvaWQwPeu8lgG4AZmyGYkgfxyA5g
 6Wpm34bwaDbCAHCE5m4fXwjP9MUHZytB6gxhbpFzXNMGX6IomV1nGZx
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfXyAn1+mDgfFsg
 8yhHUZbl2KG88HYXQS8B77Jq/HOGnVyLnE7U6SfHlNmOg7XQ8BbXbOD4XpNZDj5xcwilCsu4Mg0
 OQQQp/VcUmV/PZ3eq43oCZrD+LyrQcsrBnkiquaACa8DFYh/WE1s1/BgdMb5X/e8ChxdnWNXatu
 6Ta4VKeHr8rlRfrBt42OYTf358jgVoegdfhQqEWZRdrMmAP4ePqRd2ohOSPgkrvjI80cCaSUWhw
 vwRDsE/Q8QPvuJuzKBNtuvOVuuSRwK5bwrNCu2f+HsT/Z5fCbbLXS2i+davLZ6c+9c5Z6bvcR+R
 QekpDxYTwT6p4OUUmZzb40OciUAT2T7bhsk9uQ7wEUMbrI4wlI0b25GOPTbdZL5ujZwMsVfQiCw
 IOxll+bDGpI4rl1m0qYZpVS7y+6sh/ZxnOXzDSq7Wqh+oa5qg1rGvlfKqw2vRG34Qlc2etUbhtx
 NXm1onHAzQByHNEY8YQ==
X-Proofpoint-ORIG-GUID: PQuRDDpJFtjXaspMvMP4EtD3CFlaRVJe
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acb8915 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_z5rImZNeELtsDLppk4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: PQuRDDpJFtjXaspMvMP4EtD3CFlaRVJe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX7VwnaJau0wdx
 lZm2G3DCUjYncs+td4Jw0qhjTUa8+fZBf/PrAs6srPcNyFOiVpYT92W4/hRgdRUW0d/SS8X1+un
 M25/s4u4b6rlIZm4yK1kSnGx38o9rJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110051

The PPE scheduler arbitrates the access to the BM and QM among the PPE
ports. IPQ5424 has a different port topology than IPQ9574, so it requires
its own BM and QM scheduler configuration.

Add the BM and QM scheduler configuration tables for IPQ5424.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 231 +++++++++++++++++++++++--
 1 file changed, 221 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 01c92a5459d9..017d2e834251 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -520,6 +520,205 @@ static const struct ppe_scheduler_qm_config ipq9574_ppe_sch_qm_config[] = {
 	{0x98, 6, 5, true, 2},
 };
 
+static const struct ppe_scheduler_bm_config ipq5424_ppe_sch_bm_config[] = {
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 3},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 3},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+};
+
+/* ensch_port_bmp is left as 0 for every entry here, unlike
+ * ipq9574_ppe_sch_qm_config[] above. This is expected for IPQ5424,
+ * not an omission.
+ */
+static const struct ppe_scheduler_qm_config ipq5424_ppe_sch_qm_config[] = {
+	{0x0, 3, 2, false, 0},
+	{0x0, 1, 3, false, 0},
+	{0x0, 0, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 3, 1, true, 0},
+	{0x0, 3, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 3, 1, true, 0},
+	{0x0, 3, 2, false, 0},
+	{0x0, 1, 3, false, 0},
+	{0x0, 0, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 3, 1, true, 0},
+	{0x0, 3, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 0, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 3, 2, true, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 1, 3, false, 0},
+	{0x0, 0, 1, false, 0},
+	{0x0, 3, 2, true, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 3, 0, false, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 3, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 3, 2, true, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 3, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 3, 0, false, 0},
+};
+
 static const struct ppe_scheduler_port_config ppe_port_sch_config[] = {
 	{
 		.port		= 0,
@@ -1817,14 +2016,29 @@ static int ppe_config_scheduler(struct ppe_device *ppe_dev)
 	const struct ppe_scheduler_port_config *port_cfg;
 	const struct ppe_scheduler_qm_config *qm_cfg;
 	const struct ppe_scheduler_bm_config *bm_cfg;
-	int ret, i, count;
+	int ret, i, bm_count, qm_count, count;
 	u32 val, reg;
 
-	count = ARRAY_SIZE(ipq9574_ppe_sch_bm_config);
-	bm_cfg = ipq9574_ppe_sch_bm_config;
+	switch (ppe_dev->type) {
+	case IPQ9574_PPE:
+		bm_cfg = ipq9574_ppe_sch_bm_config;
+		bm_count = ARRAY_SIZE(ipq9574_ppe_sch_bm_config);
+		qm_cfg = ipq9574_ppe_sch_qm_config;
+		qm_count = ARRAY_SIZE(ipq9574_ppe_sch_qm_config);
+		break;
+	case IPQ5424_PPE:
+		bm_cfg = ipq5424_ppe_sch_bm_config;
+		bm_count = ARRAY_SIZE(ipq5424_ppe_sch_bm_config);
+		qm_cfg = ipq5424_ppe_sch_qm_config;
+		qm_count = ARRAY_SIZE(ipq5424_ppe_sch_qm_config);
+		break;
+	default:
+		dev_err(ppe_dev->dev, "Invalid PPE type %d\n", ppe_dev->type);
+		return -EINVAL;
+	}
 
 	/* Configure the depth of BM scheduler entries. */
-	val = FIELD_PREP(PPE_BM_SCH_CTRL_SCH_DEPTH, count);
+	val = FIELD_PREP(PPE_BM_SCH_CTRL_SCH_DEPTH, bm_count);
 	val |= FIELD_PREP(PPE_BM_SCH_CTRL_SCH_OFFSET, 0);
 	val |= FIELD_PREP(PPE_BM_SCH_CTRL_SCH_EN, 1);
 
@@ -1836,7 +2050,7 @@ static int ppe_config_scheduler(struct ppe_device *ppe_dev)
 	 * egress port, the second port takes effect when the specified port
 	 * is in the inactive state.
 	 */
-	for (i = 0; i < count; i++) {
+	for (i = 0; i < bm_count; i++) {
 		val = FIELD_PREP(PPE_BM_SCH_CFG_TBL_VALID, bm_cfg[i].valid);
 		val |= FIELD_PREP(PPE_BM_SCH_CFG_TBL_DIR, bm_cfg[i].dir);
 		val |= FIELD_PREP(PPE_BM_SCH_CFG_TBL_PORT_NUM, bm_cfg[i].port);
@@ -1851,11 +2065,8 @@ static int ppe_config_scheduler(struct ppe_device *ppe_dev)
 			goto sch_config_fail;
 	}
 
-	count = ARRAY_SIZE(ipq9574_ppe_sch_qm_config);
-	qm_cfg = ipq9574_ppe_sch_qm_config;
-
 	/* Configure the depth of QM scheduler entries. */
-	val = FIELD_PREP(PPE_PSCH_SCH_DEPTH_CFG_SCH_DEPTH, count);
+	val = FIELD_PREP(PPE_PSCH_SCH_DEPTH_CFG_SCH_DEPTH, qm_count);
 	ret = regmap_write(ppe_dev->regmap, PPE_PSCH_SCH_DEPTH_CFG_ADDR, val);
 	if (ret)
 		goto sch_config_fail;
@@ -1864,7 +2075,7 @@ static int ppe_config_scheduler(struct ppe_device *ppe_dev)
 	 * port, the second port takes effect when the specified dequeue
 	 * port is in the inactive port.
 	 */
-	for (i = 0; i < count; i++) {
+	for (i = 0; i < qm_count; i++) {
 		val = FIELD_PREP(PPE_PSCH_SCH_CFG_TBL_ENS_PORT_BITMAP,
 				 qm_cfg[i].ensch_port_bmp);
 		val |= FIELD_PREP(PPE_PSCH_SCH_CFG_TBL_ENS_PORT,

-- 
2.43.0

