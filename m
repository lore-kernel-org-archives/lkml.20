Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738932;
	b=tD+wiGGh9ZXcj8viZqxpGXyjyHFzDjchdXvrYQdMGE9Jkw6CtK5y76e85ukTFOlRgshD
	 EKuCQ3bOw6gxjbua3/7JdRQkpKff/jCVAPeZuVGrbPqIqNp6BYAd8SFH5KlSnluI4PzWE
	 Pdto1l2d5DO6GdqHah6rPl84IXBvMFy7pkWlzvWzF0L8L19O6JmRBJGgD5QBCttT+CYry
	 r5N3lp1hhWNjmWBJCri61KR15Kzy9eVKSNJQ3Ahy0aXE2Wkp/I+vd8sGL8YvXHU5SQ0I3
	 vBprKxihY99Kh/ig+V6/vE+lqoO5p+s5+tq3aNaTQPL6jhtV+FY2sHHLBn6zKP/Ax5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
	b=itQefsSaM6jgKikWhvZ1vwI3C6ymWZLsDYYFWKo+cHzyeU4iHLnEqkmlhy9bKO069qn+
	 uIE8dHt0LftDev+ZNmBxDypDRlfyIdov118vUwN2bpE0QFq8eRa7fp1TfPBFMBjhOIrlw
	 hdOTTgRZnk+6j703Ubs7/72fFQm19NrmsltdwsVWRinSvg45n5ZO2dWPa4u+G7x+NKxUL
	 xHsGw+TOzDNte2BLpNcPBUH81QaL0AzPvJ/xkCgdYo7MPohMDls/VFOxqMlJeV2yiiwlI
	 sNspBuHf1p4B5TQkUbQtVzdNmH2fH7KqryZA94iPX+u98is/gqWTvHw0eiMPwK5FUgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmIybA5L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDpkCYmy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490F3606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 490F3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmIybA5L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDpkCYmy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FZg01318626
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=; b=BmIybA5LNPjbOAIc
	0Wivavpe5HSCZMshL0jUJf/WlUpJULjTEhXrHa1qBqkBrLrCIudR3WNfh/8BnfIO
	xVBnNXJ3DE1KNQfksDKlnxG7rlXIz4ddOzS+cqBovjIh2WO96NvsIEG2hOvjYia2
	nP3TjDFlolTfISpfp4cdGl5gidF4Y1j9mt+ZgCI0xzIbDoyoISsOhLf2r/XwcgpT
	XpeMKgblSIGfoOVAZPtAguY5HJclylJw4AfGWYzhoD6Dj3XpKolRCKY/I/f9qgHB
	+WTP86ge39R42HJnIyTbOyKHpMD1tPEByPULPDHLQGZXpLVC+cDX2iLoKIeUqT8G
	rJ+ucQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyg9jsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso650813a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738930; x=1793343730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
        b=GDpkCYmyyH3Rql4yFP7QklsPmFvePDvd9/3dkmBTeHAgAMwT+ch25GIQwsOK/BWFZb
         Sk+SYHcN9Gc3LUjiPrOr4ERgJtjApfzps+DCxF8DyB/mJbLqHN29/vIL7PY8zo3kOiL+
         qYUnWwYrIbBG2Sjzy++hBHqdwzcdecI0tR7rgJNOnldsWebawjv07G/TiPNPCRwUEkEt
         a2k64ftCRlBTZNlVd6qlOvFrDgQu0XuAJmBhp9CPUxosV/UBGnsyH2nM7YHjkCjJoogv
         /15TKSdVIU7yLo4L7K5fPhbchYB8Gqlvt3VcdyCo5/CppbGyNzN+wPGgEcEIGnrZS2Sx
         d0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738930; x=1793343730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
        b=EDLtpXYHQNpSu4UNePkfYYJRmVAjKSa00kFBthCOfDDZkpEZJMNu8q2UFgB+Gl6uuK
         o5gyRn4omU0/JaVbQHeAuT8I4C41obFs0zWbosnAZH1B6AavHkURGvoX9TBmQcZ3ruoq
         sE1IUBUUiEcbdTmKZFAr+I56IO/UbsXVbc5rihkczDCZfORARsd2QaVx+trYEl5gOGjr
         XbqqFruxCjCq+1cHkoJI5svSUeQikuLxUsWVipfAfKUEnPqspL1WRLKHmn/A1ES/64Bj
         euTAHwAnk2/kaI+7oEXVE3dG5T3U2F1h6u1Lu8SylJBwj2UiNdx4N5RTcId8wCY3uerH
         0gFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRDFMYwn9pcTQ10bbuweFulDiQPhQZ1FeqWgMu2SLcC4ReLVxta7eR98Tsma0IRxM1GhAKxvOhsJ3Me94=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHRBM+Ms06olkX7d3rzrTIrBfz1J/vbiO+v7VQTxudNKfT/tu+
	CFhUb+COUo2jbkX0F70y2VwQjEGdPLx2MOPhqtttD3ziTvxKPGXnteDEFEsGpkNnVe/gc32NoAZ
	aShtEuZOwlT1TEMlNeAg+1AOYDEvlQgVm0s5sT3kiI9/XNsr13prSG7qh+dCUG+C81Ok=
X-Gm-Gg: AYBFou05SyymlobFnyxe2jGwACHAv33JCbjyQx5X/w5Rs7Vl7V6GlwwEcRwQrOwRNDi
	WnrTYA7EOMNybUy2cd7sDnzSkesNEQUC5RqQUqd6zREXZErsQRkNJBQQ+hQaOkKehfy8ezKrOIg
	XPe4i+uxzC8NAntJXWkSzjBUlTXkDsPuLeW5H6sYeLu6v48gjKAicRgiVDOSs9L5Wqe/c1turYL
	/vheKYT7gfrRqPGnboPt8ou3d7vxLK76fFBrFU/S0fCyrsGZZeOO3iz4OI437G1XEH9iYd1mt1n
	DvQm4mzWreBOY3uV9zbz28wGp1t9BRLQeL9EO1JXFdQ7VAm8M8KBMJ585m2KanUE5EqKeI/l1GT
	+2/pfMdY0/IfGxcr150EOlrgURFqC5KIpN+KvduIYojDipah1StaVJV4jsTmU5ZIeq6PNrrqmno
	pIow0faQdydeTNRw7C9Zm/VA==
X-Received: by 2002:a17:90b:2d8c:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3adce150b14mr1050606a91.66.1792738930274;
        Fri, 23 Oct 2026 00:02:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8c:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3adce150b14mr1050592a91.66.1792738929816;
        Fri, 23 Oct 2026 00:02:09 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:09 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:16 +0530
Subject: [PATCH ath-next v3 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
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
Message-Id: <20261023-mpp-bringup-v3-13-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb0673 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HzkBA2_z9QidxsSae0AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX52HcTtPNuvZv
 UudDLpeE9CQfh8sjAeWrmM7a4jRt6Lyv4e4tN/B8gPDjYbm2ofTF246QrqoIAZCnO6S/xW/h5RA
 xDVk1fc0VllvoULQx7aCBsK9cFUFmnE=
X-Proofpoint-GUID: mblmV3FMvlbGN9zL3kHgM1EyvozS5ATu
X-Proofpoint-ORIG-GUID: mblmV3FMvlbGN9zL3kHgM1EyvozS5ATu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX4JxwINiQU1Wl
 /XmL6wETGfJgeIcFHV3q9czaGEW5foyb6jcx4BnDJQb64gN6snLkU1pOMCV/CQflyprSs6+c1Tf
 prhIIkPT1nawJOrTM6TNCLabAMxCBSe/NODc5vlvhww3GiBdj4r8lHtkmnAFPcwe8cZDEDz2Gdm
 5vNizsi3TCHkCgP4HcUfSZs+8wptaZdyrvGjhMxML/TUTIGngX++QTKpmxm/jJgRkWYWdKta9Ey
 ZXbVk1ACO9djTBqKB3IfmhI0pDz9oBRIRVlO7w5yi/Q1702TrsGFaaf2eyoHNXzFYIfurx1pUt5
 VFSnV3bppYaiEBjofxlc9dWEYWoI+Erc7BjNkPPoCJZQXctPejRTBimuIQXzM+4tuKUe21gUT/F
 uNwQgonW1vvX+gfUYRBs7dhMQwvPB40laxck9LY25iskan0RloTksnUWCnORDrbGf+F9xYDvb3X
 Od93oleS/X9FZJzBF4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

Use CMEM-specific write operations for Primary Page Table (PPT)
initialization on hybrid bus devices, which require special CMEM
access handling.

Propagate errors from CMEM writes during PPT initialization and
partner copy cache initialization. Abort MLO setup and perform
teardown if partner copy cache initialization fails.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  7 +++++--
 drivers/net/wireless/ath/ath12k/dp.c   | 30 ++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h   |  2 +-
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index d2ce01e0d7ac..cd0aa24848d9 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1174,8 +1174,11 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < ag->num_devices; i++)
-		ath12k_dp_partner_cc_init(ag->ab[i]);
+	for (i = 0; i < ag->num_devices; i++) {
+		ret = ath12k_dp_partner_cc_init(ag->ab[i]);
+		if (ret)
+			goto err_mlo_teardown;
+	}
 
 	ret = ath12k_mac_mlo_ready(ag);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..6cf254b2d2a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1307,8 +1307,8 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 			       enum ath12k_dp_desc_type type)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
-	u32 cmem_base;
-	int i, start, end;
+	u32 cmem_base, val, addr;
+	int i, start, end, ret;
 
 	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
 
@@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	}
 
 	/* Write to PPT in CMEM */
-	for (i = start; i < end; i++)
-		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
-				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
+	for (i = start; i < end; i++) {
+		addr = cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
+		val = dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;
+
+		if (ab->hw_params->hybrid_bus_type) {
+			ret = ath12k_hif_cmem_write32(ab, addr, val);
+			if (ret)
+				return ret;
+		} else {
+			ath12k_hif_write32(ab, addr, val);
+		}
+	}
 
 	return 0;
 }
 
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab)
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < ag->num_devices; i++) {
 		if (ag->ab[i] == ab)
 			continue;
 
-		ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]), ATH12K_DP_RX_DESC);
+		ret = ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]),
+					  ATH12K_DP_RX_DESC);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 static u32 ath12k_dp_get_num_spt_pages(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 108e27dd5797..5e9cdf72670f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -737,7 +737,7 @@ ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
 }
 
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);

-- 
2.34.1

