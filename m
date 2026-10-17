Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626CA3BB665
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257213; cv=none; b=I8P61Cogs7LPEt5aBF061CVDtF5FQKrOXsxGbSgVePmS0s4X/LMOxJH81MXOg6udKkHAPXd7jax6vKh4zhLGTdAb58Rt8t5skuFPEvIQiYfO2/l48jlh+Gt6XxzsmLWW5ujp2fCby9f+KlAysAbSAThlAcUpEOv6Jkl846zgMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257213; c=relaxed/simple;
	bh=iLTG4aXBJUiekJtaSGEXYlzQAoG+/N4ms096TFYDMFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfYXyvaM7wSGHCCQJxZykQxAaP2b/NLKGWOwthFI6/i71oEqb30xe07ol67DXYPMgaWXngjBSBgO4bCgmqDEZ4W5OHrUugrrFCJu4TvSMWBBBHhTbDKmhffxqFHxBoHFwNEh1zRT+R/USvWXWb83Q0I6c2bM7T7q9dGkR9bQNjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrLV/mp8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VoJZZlov; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrLV/mp8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VoJZZlov"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGBEsB1523211
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YAhtsjeGVm9Y9dmXAQSVWYBk/S4IJYojGbMjX5OJWPk=; b=mrLV/mp8o0rjl67k
	/Oel/i61Mi5YyJ9v3WV5Qgt6PCtgYmi7O5SgirLH3WE7dL0BWXBK0slGWKpSETRZ
	U0TPyw6ydT0dH0ONtPllAc63F6J7LUCdOAu2S4D0/CVu9CFi4lRPJvLcznnBZz7l
	M1db7WB6cRMZ8IndxrVwFl+HYR2ywozmXl5CNVk3ufMday05WT6jkeO9onbcFUPo
	VEOj/+/wZDjGui+QXpj33xp3uXhbPO7YwlKmgugqmNQwO9cDMOIsgCNTzDD0UPmE
	rwsdwNA/2TotfWvgwA5S0ckws6Uy4yMWy3iUBiiK2uHHjiLFNIfo80TzkCpVMQYO
	w+b6ow==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1839d3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1755084eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257210; x=1792862010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YAhtsjeGVm9Y9dmXAQSVWYBk/S4IJYojGbMjX5OJWPk=;
        b=VoJZZlovk+yxQs9sE+/TWhuJ32VpxmkfzRU1vT7LpPVTRtn3dl0MCQPzYRjPn0PFw2
         J7K7gElfs5vRsSDKjZrt6LLFgIePeMrWmiPEhN0CiCgbTmq3h/E5h6CQOyx/QwAEFEpe
         XsTvQlsfuRZVNblblEnmnGpJwP2+k7wt+PQZ5uA3tgBRbXmR++Ynj2pDo0kLry5zDwjV
         AI1oMCv5JT/wF/vHclaeo28Sjk8MMOgDNmERWFsXTu1+XUm6LU7lAW1CKMlWD5BpVfS0
         5shDPry+D2jbdunyf9INFXBpIp9n8tCcJYeBzEEnkHW5MtdJmSeW1371MYrSIlL9cj+o
         A6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257210; x=1792862010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YAhtsjeGVm9Y9dmXAQSVWYBk/S4IJYojGbMjX5OJWPk=;
        b=btQVwS+504M/b6X9BPCiQg+wxroS0vty/+4AjAp1hWsWO1dubMsVzUbGmnR/4u6UpV
         iTp7i1aOmjB4MyVSWiGqLQqTrQHjDPj4FrSubcHztzyTMiD9zLMKUsGMmGH0UKeTThqP
         4JBOI2uV8+L9KarDck7ddQS1uwajMAJpD9Pp8iSnWaEVFZiCnffGz4OzMYqEOmNG63Oo
         jgTUgqvY1goMCz0F3Cj5c2vD6+E3JjjIQbuqRaOs+dNSgZKAMZ+lLw0WPAkoSSbX7Lnw
         zr7V/eEOH+ZlmMoCLzv7j+16OKiqWa5wpqtnfhIhqb3TazYIbYIpANaXh/8mUI8WYYS0
         r3lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCsDc7q5w7g5gmEHSYzCQxZ5hIeaz9sErEPZAkijoSRcSJB4H8vdUBGk3D6/ad9z87Y8DcSY+jHulP2IA=@vger.kernel.org
X-Gm-Message-State: AFq9FYILRh/KujeF9G5F8WId8y7hUBaknIdhQx0vbQ1+M8OQPJRlyZzU
	+tQBt88NTOfRI2+1A1IYRQIjPcn8c/0sJ2G+20EkqEIQqEwXxjFYt4zMJUsAqRtmMZ7TAv3x/Qx
	nVd3ApiPl6hxsIUAspSJZV/++aIMlHju0aA0J1JgqyCLOGE6rGty1hUq8KZS4d3+MJ+7jgQK1DS
	g=
X-Gm-Gg: AYBFou2Z0wcxIK8KGn5+tBVXDfUqyxDfzJZlbuH5IQ88Eb9P3+IsUl43e/P1RmTCt92
	B2vx59UxFPJb2kYatXgBPd9SQropZ1MHWB3gnQYxvo3rmXevwUjXVAFkt+f0P4i/oG6OvIxTbun
	GljUv0IdEMBkn9oW1221S45pH95gKgxnsa/6bCdf7a2A8BvJn4BGsAqHEWaNqqZaGC3SDAUrujv
	2u+s1h5u+P5UuY4BJbG4T3r6kWnMeK+DjIWdfKwIq/MkrCDd9Sc9oJKZrXnplhxWu1zx3iU8bPw
	Fk9/ec53QqOv1MiAlAJDlW0Dp55G3PDqTVEolvzZ1ZhQqAdL0rbcbRUsedLrGWLWlVFufQjt8A/
	hMxL9wU9AX11sqCwJc3+n96/H5QNh+A==
X-Received: by 2002:a05:693c:39c4:b0:35e:cfe7:4c5e with SMTP id 5a478bee46e88-361a284a463mr4376594eec.41.1792257209673;
        Sat, 17 Oct 2026 10:13:29 -0700 (PDT)
X-Received: by 2002:a05:693c:39c4:b0:35e:cfe7:4c5e with SMTP id 5a478bee46e88-361a284a463mr4376551eec.41.1792257209000;
        Sat, 17 Oct 2026 10:13:29 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:28 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 22:43:08 +0530
Subject: [PATCH RFC 1/6] phy: core: Add MIPI C-PHY configurations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-cphy_support-v1-1-8b0e1237ce95@oss.qualcomm.com>
References: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
In-Reply-To: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257199; l=2564;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=iLTG4aXBJUiekJtaSGEXYlzQAoG+/N4ms096TFYDMFg=;
 b=1V1fOBAUlXQzeyOk6+8IBwwFEUOKq3bVHM3GzS68oaChvztykygkzOInlOp5bavxsytAoE9qL
 KE7av4aCjXzDPbW/KTPgWO+IH+OTNmu9x5OIF36nucXhvVrhI2jBQZt
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfXwBgUUjl9B2sw
 lVhF0sJBakewoBps+uEZYLoi4brP6RoDsHnlPeUAKxnW8W6qq3zWr6lucO/VQMxh2Kxp5YIYb2I
 KSk6ExTTVfiiqceB4JTB+Jod9cw43KQ=
X-Proofpoint-GUID: _-Duu2uTkp-i8D9smemAccnQ5uTUuyGg
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3acba cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L7UytvBZ7DJW4f3bhNUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX2vLv5E0pawlo
 6LPNd5m66BrpbII/62VfanaT73ezOGWImzBgpCKwRefSMLa4o7O6BAlznEc5mOQZqJfV7o9YHz2
 xI4Oewh91G8j4o5SD7BkAdO12QfxuiY5peCbJRG+8ABlBUxBrMkB067NwkA+z3yr5XtABcDEjjY
 kGx4mBPQUge2Lm2NvttSct/K0Q72nEiSSUIBx0WMKuo+t4FgxTCX0fUlznPFH3UvC5xnpYlL+EV
 HJmo6Cd0Lq2nPW9jZgy4HDMDKQRCDwqJx3clMZ0i9N69vI5F6/wmCTuB3MlS+jjj5Qb0i6IFc+/
 Qkgw/X3XxMUImuTYg8QSSXxUe5Nqzrj/yiHfdEtAONF3xdWzESsQ/fFkxIPv+g3bHLO1+TxCRmc
 6E1DHhcWvx0NvfJMxMbwlWl0jtSBgbg2qYjQ7jaC04Jx522UDWEW0EE+rxDc9TbWjapSjvs5/op
 JiiSy0qMKf3aqeGV67g==
X-Proofpoint-ORIG-GUID: _-Duu2uTkp-i8D9smemAccnQ5uTUuyGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170068

MIPI CSI-2 receivers can be connected through C-PHY as well as D-PHY.
C-PHY uses trios instead of lanes and needs mode-specific timings passed
to the PHY provider.

Add PHY_MODE_MIPI_CPHY and C-PHY configure option carrying the link rate,
trio count and C-PHY prepare/preamble timing.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 include/linux/phy/phy.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index c480d6cb42c500a295eef3bdf42fbc6d36f54bf8..c3784b679f3a26686324286d407cfa9d258579f1 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -47,6 +47,7 @@ enum phy_mode {
 	PHY_MODE_DP,
 	PHY_MODE_HDMI,
 	PHY_MODE_TBT,
+	PHY_MODE_MIPI_CPHY,
 };
 
 enum phy_media {
@@ -64,11 +65,56 @@ union phy_notify {
 	enum phy_ufs_state ufs_state;
 };
 
+/**
+ * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
+ *
+ * This structure is used to represent the configuration state of a
+ * MIPI C-PHY phy.
+ */
+struct phy_configure_opts_mipi_cphy {
+	/**
+	 * @symbol_rate:
+	 *
+	 * Symbol rate per trio, in symbols per second.
+	 */
+	u64 symbol_rate;
+
+	/**
+	 * @trios:
+	 *
+	 * Number of active C-PHY trios.
+	 *
+	 * Minimum value: 1
+	 * Maximum value: 3
+	 */
+	unsigned int trios;
+
+	/**
+	 * @t_prepare_ns:
+	 *
+	 * C-PHY T_PREPARE timing value, in nanoseconds.
+	 * Time the transmitter drives the LP-00 state before
+	 * starting the HS preamble sequence.
+	 */
+	u32 t_prepare_ns;
+
+	/**
+	 * @t_preamble_ns:
+	 *
+	 * C-PHY T_PREAMBLE timing value, in nanoseconds.
+	 * Duration of the HS preamble sequence transmitted
+	 * before the first payload symbol.
+	 */
+	u32 t_preamble_ns;
+};
+
 /**
  * union phy_configure_opts - Opaque generic phy configuration
  *
  * @mipi_dphy:	Configuration set applicable for phys supporting
  *		the MIPI_DPHY phy mode.
+ * @mipi_cphy:	Configuration set applicable for phys supporting
+ *		the MIPI_CPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
@@ -78,6 +124,7 @@ union phy_notify {
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
+	struct phy_configure_opts_mipi_cphy	mipi_cphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
 	struct phy_configure_opts_hdmi		hdmi;

-- 
2.34.1

