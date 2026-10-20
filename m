Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482789;
	b=pFqKvRWedutKPu275s/F5DA+oT/kdDyIN7vCzcsAIvyn6HJpgeF473OjEHmSOzIozXKB
	 248lfLomyKotpLCa7tBq0n0KhF4BAwPbYEqEibv5jV4V9BgTrxc1bApvDzGiTxx6BFndI
	 tP1le8t0uOFROrgmugjBZSm0S1iKQNjiW27PfY2f7+A9n1UlpMjjxHxC7SNoNz7fIkDXJ
	 OFW12gf0jd9h/piORNtlD9gzYaXp/X4UDCLPSFUpNtVMQSKlRBXY9GKLZcDKGn+NKVNFw
	 awC0IbDjjA+f29TvZPCEsWZrYb1E3YkF4ngI6JZgSKIIyzZnn2BCK0PZDfrNnZvUzXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dZULhqVxGa6w65QkJiF5vsmoK4e+Xzrl3DeeSL9YLYI=;
	b=mz0N7D7SK5BSFGsBrjCRxgZw7rdHtRWdbmd1pikc4ddjiXmWs2J1xih8u1WyE15ngb6w
	 VVFj0wFx7Adm08kA9kwwQYqSl7Wsxd88veIyEdmOlYx+huYD6WrNE8Lu/PR/z50OQJEbB
	 7eaqJaUIDFDZDuQN8zuIeNmtLARJR/xqu0dVSAa9eTgbHX5dQOhj1EQvTRXjYQ6H0IzBi
	 /v407WTH4SDfKO7nqolphszje+emXq2i5aaZ5PD3rMZFKQoSQmpMgAh/jiC23Stp38MeD
	 vz22HVVoZ95UjVjJmg7vRFr2sAM1M+G9pO/Q4cg7w6MkypnfiJ9fAG7E2aFIPGs6H+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHve2Wo1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHGuWxrV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13157606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13157606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHve2Wo1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHGuWxrV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t5wf185852
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dZULhqVxGa6w65QkJiF5vs
	moK4e+Xzrl3DeeSL9YLYI=; b=HHve2Wo1LcJqsNMc+8UiLc2+pw7DCkmG0OdxGa
	+4S8AXZUkw2HMn7b1sZ/A7W89wXa1d7DU5A89YUlGMwlNh9+1tA9iYastQ05bt11
	lbU7mwCtp1wbTmIkNw2dD6+W2g2ESZPFd5VKDk+SZHZwbSyqANPGgQHJHW5b9zK8
	eA/jninxa6XGnqJXTdfsKoavsSSLKj3euVzt1Alz5l5BEyS93zdwsKz5yrMfI3qY
	EdlqF0gvuArvovzcsEQSX2d8S0VwL38OWL5TEBdjIHWFGCHXK+IyAb3p8IKWuNS8
	W+9Vwq0YALtGtX31AWWevR8hOb1TQGLf68mv31SYFBC7+c4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsftk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:53:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so8362874eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482787; x=1793087587; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dZULhqVxGa6w65QkJiF5vsmoK4e+Xzrl3DeeSL9YLYI=;
        b=AHGuWxrV0Ox1HV5/TzMQaYLWwropMdpTh532QThn2mxfUlz26Yw/6YSA5slm7uWUF8
         FTeMe3dar5MC2GE77KwqHI+Gqfsl3vdc/I0dWhEmZSlViy42IH/DHLfOQfiwBUImACke
         0yyOSI+brN5j1pgCt47fOJEgW7AQxwa7Z3QI5Jakz81RTfCjqpvOcYaApPOiJirI+gZ8
         zTFyuaw8foPXZqu2PGRWiTPeOS0cjRWDVfMlzAa+qhmWP1jA5EbkZKO+20G38W5df2HG
         SoMgcOXwWx/dajM4VFgzPN1Tr6FVH/YZNVs26IIQOnQ80NpslnTWLK8SWjRp1xdAZR27
         MPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482787; x=1793087587;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dZULhqVxGa6w65QkJiF5vsmoK4e+Xzrl3DeeSL9YLYI=;
        b=sTj4tL2LCKuY/J4KewuRmbiCy/XIGc1VVALkH6S2htkG877y42Oa4Ge/4lYRjMHrgt
         TyNE18ozRDqRu/FFl8TPalFvWgYSA+1I5zsrIN7X2m1d6o0NEpkQWp//10Fin5mhVD/k
         8j2iE3NiefFMtsLRwAStVlMq3abQpExiLZqctX5nFgh5X1pqH7VmK+vDKOFUCD/LuXLO
         oOZQWOsdFmsmUgQn57Zl0kC8LVU1CTIoaS5prBHv5XM3X5QkSVSo5JzchYFeXRZlXFfp
         idCZfYQWJ2LLMkrXM1O8d3IZFFzWcLexRaMj769xOHwzi/tkQ+npRHaAgZ6tfPpAGoQm
         B1eg==
X-Forwarded-Encrypted: i=1; AKwUvBwe478VBXIvyaA8W7YXiiVPM+BIajpU3jgT/xcEhUZ812XPnn4d0Tdsr0r5s00WBz3stblRuZbyYMwgwSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbhSuAGnmsHlk/yR93Omf+spmDV/B3PdCgBY44kxUD3Dn30g9f
	xJM9CLKqn5Ms9S4EsCwh8KcnAoEkp3Zu826bQ+dHMV7EjVKC1gr9AeYNOHj8TIIKCgXhd2/UQG4
	odKp1iWEpMWZh8f0SC5/9+mzjWRfbTnekAOpb/nTOIfM4S5NsCsF5h3vZuVCsGWWLGMc=
X-Gm-Gg: AYBFou0wPzPoI6Wv549sL5dpK32bZk1pHa5iM4GDWVM68FQ9z8k7Kx0iU957Fp5k3VF
	V6AYCsGg47QUlNncgJlo18nNCxbZmrMOjiBvCWcHEt9aG7ih6fuI4iWIWg3KwVgsiZUjUY3nXHP
	yrRb8HZGUhOuB4KVQDs4HBWeUcxyzgjP10bBdRfuwcxDgXj0tv/TBUA/e1bBs3/9EMQPp0ql7WL
	VySrDdaFOfBb2LxEgK92Ing2dqFkzsRbQG0I+SRJkBio+uWtk8fHuSNJq5ITzdF5vCQ7hle7Z4Z
	Uy/mN5CBMIOra2bPaVbE/ORXnhSzrgb+CbZarO+Eim3P1G4/4nXiBp3+p0RYjkhD6F+lV48IIts
	Gh3EDoMWNatlqdjFCiXb23rtQyy0H/5iag4M1Djx/PtikQfmj4IY=
X-Received: by 2002:a05:7301:22ab:b0:351:7ec0:daa3 with SMTP id 5a478bee46e88-361a2541f45mr16393594eec.31.1792482787311;
        Tue, 20 Oct 2026 00:53:07 -0700 (PDT)
X-Received: by 2002:a05:7301:22ab:b0:351:7ec0:daa3 with SMTP id 5a478bee46e88-361a2541f45mr16393563eec.31.1792482786739;
        Tue, 20 Oct 2026 00:53:06 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm63829468eec.28.2026.10.20.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:53:06 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 00:52:50 -0700
Subject: [PATCH ath-next] wifi: ath12k: set MSDU payload correctly
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
Message-Id: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANEd12oC/yWMQQrCMBQFr1Le2kASYileRVykybf9RdOSn0ql9
 O5GXQ7DzA6hzCS4NDsyvVh4ThXMqUEYfRpIcawMq21rtNXqKXFd/Psx+6hs6KILhs6ud6jFkun
 O2+92hS+jSrQV3P5G1n6iUL4zHMcHwz1Tr3kAAAA=
X-Change-ID: 20261020-msdupayload-2c8d4c1e54b4
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482785; l=2433;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=0QLjlN4xVDDPAlasPy5ys/3L8XpQjPcTWrmFjypqwMs=;
 b=2L5Yc+AglV1IkLyw/yoK4HQ/bzPueEFUOHBlMCLdg6KHzhuo4sttL/WD9xL6mD51voEG6RnKM
 i9QLSnXb0lFCNlL2FWXEsOaKkZbhdDHv4U+edxdf5XcaY/KrNg/8gIe
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: 9T2SootPq0T9y8qgqfKjqAr5oNfMSZWX
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad71de4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YtwzFU1t9WoBE-wIZ8cA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 9T2SootPq0T9y8qgqfKjqAr5oNfMSZWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX1lt6X67CvGIP
 4w1fa7aGBU/hZ7f2QHgqP+7E3tPYy9AhGEFEzBlWGTMy8/lddLvIeBtREPc3S14js0/d1kgAjIg
 Hz9gJSy1nlSmT7mHTphPr0GTkdUoPRKerkzWyqKnHny7UWbHuuctsw/nEaSjw4A19Qgy6GyITxc
 nytmz4An+s3id+ep4UPyE67i3zxHGal5qEJKmd3OX3HcT6RkFQ7HcGkM/a6BLCdoIrgsnMesCcW
 F5gF3p//fs0et1w2FWnuKXS4730RMiIKaWEw8cNE2XtLzFPWNtIMCVTIjgqRRtOrA80Wdh0avYm
 rrns3jGuzUIcWU87u4pPU55j20cVsohVqL4s5nR2PuKGHmDZqWpyQJ8Z38v1cyncl2gcopPIrux
 BGFWXKdgcxI8xMFMTia3LIj+9Nr0/YC5c/ADgHKDbJH8l0IIbiXCV7w8tCOi7aNEJC45nRSaqjN
 ZxP/kGVZjkNdKE6gC2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX9P1HdE8/gnFl
 6lD8ZzkR7mJ40vHm2mSvOsAoT04xTzv0r9GsOLPmT8ci+uHkcstM0D2u9mnzaJX7T6QuuEIGb6Q
 XfNbDZs7LUFaDktY14TPq0MCMAiE5Hs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031

ath12k_dp_mon_rx_merg_msdus() mistakenly passes head_msdu to
ath12k_dp_mon_rx_msdus_set_payload() while iterating over all MSDUs in
the chain.

As a result, skb_pull() is applied repeatedly to the head MSDU, whereas
the remaining MSDUs are never adjusted.

Pass the current MSDU instead so each MSDU is processed exactly once.

Also rename the helper parameter from head_msdu to msdu since the helper
operates on any MSDU in the chain.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 1cf514fdc790 ("wifi: ath12k: use different packet offset for WCN7850")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 709507d44d8e..ae14e118fe36 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -186,7 +186,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k_pdev_dp *dp_pdev,
 }
 
 static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k_base *ab,
-					       struct sk_buff *head_msdu,
+					       struct sk_buff *msdu,
 					       struct sk_buff *tail_msdu)
 {
 	u32 rx_pkt_offset, l2_hdr_offset, total_offset;
@@ -200,7 +200,7 @@ static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k_base *ab,
 	else
 		total_offset = rx_pkt_offset + l2_hdr_offset;
 
-	skb_pull(head_msdu, total_offset);
+	skb_pull(msdu, total_offset);
 }
 
 struct sk_buff *
@@ -261,7 +261,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k_pdev_dp *dp_pdev,
 		head_frag_list = NULL;
 
 		while (msdu) {
-			ath12k_dp_mon_rx_msdus_set_payload(ab, head_msdu, tail_msdu);
+			ath12k_dp_mon_rx_msdus_set_payload(ab, msdu, tail_msdu);
 
 			if (!head_frag_list)
 				head_frag_list = msdu;
@@ -296,7 +296,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k_pdev_dp *dp_pdev,
 		msdu = head_msdu;
 
 		while (msdu) {
-			ath12k_dp_mon_rx_msdus_set_payload(ab, head_msdu, tail_msdu);
+			ath12k_dp_mon_rx_msdus_set_payload(ab, msdu, tail_msdu);
 			if (qos_pkt) {
 				dest = skb_push(msdu, sizeof(__le16));
 				if (!dest)

---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261020-msdupayload-2c8d4c1e54b4

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>

