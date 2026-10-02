Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22F93E3C4F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968280; cv=none; b=EU/BB9np00jb6NR8cqqeNzjgwvOfHt5EdlHnKioND7fXmooKPYsS7x23yhrwnQFDTAa9GIm7vy3mzYwrLE9YJPEm2F7cm6TZX5zoRi1oAUZ+trgJmKPQwdO5H4XGbfUNjd+qLy13+NJQUeZ+ApQN1HdiKOmpdfM0E3U5VXVL7Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968280; c=relaxed/simple;
	bh=0RY+5h/zu7/yhOnDJV3XxV8qHBqQrPLsYnUFndiFQ7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+EyAk1qU0bRbOgFbFOIKtUdhp5vfy/VIF+4qw2arow9P6yabzaka2XjWFq4rznA9jkvh/0oPi7QUkDsksgn5LOH0nvBcLgzo5iS/EVOtZTOwegJYAKj4tdP0DgBVMX6CbOo3zFJieNwYPznc3rPF2IjE1gEsGt2Q4a2+qiLNOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzYD8kuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhRUpMyb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzYD8kuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhRUpMyb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H5veG1277952
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 19:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uuMxPdvGxWc1nGfBGBs+8fEcCV1kypQ35Wv71IAG3eI=; b=hzYD8kuo6vbBFU61
	pWO7vg+b43CUgV20izONEHJIZMMm9EOvBpCZGqqtwiLO15rbhnnu2r+d2SxaMwt0
	zQvgA6tOKd9tN5lXeUWh5ITnpd4vP6TTElMEnS4E2YcIciw8faNn0QjuCHpok6Lt
	UVBn8g8XVHDsOqVjUr4eoIfTMxhPo9h9LAgPxXezubLCn++zohRbGjBCqeI37BnR
	ATE7zYW3ju4mOS5pL00tkgQAreKUxpajS2kMQB4EsiD6rWjozPZoJ1d9Mpn2KF9W
	JVrXLdyrgtS/SILQiwcWuJyfXNKEahO/DfMxcZZkArgQZKDfjI3eNFBFJuRTjLVw
	ZM0BcQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdhb3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:11:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so724207eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790968272; x=1791573072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuMxPdvGxWc1nGfBGBs+8fEcCV1kypQ35Wv71IAG3eI=;
        b=DhRUpMyb9rOWUQz5PLxZOez30BKtiWYW50Oj4lbcOP+Ebgo8eZPbLrrfOPxddpkar9
         0rsHRp65PGYLjv/HL7h8T3nNhIQe0nGmW+ryf7a27gVHZrZ4/zJNckdNj5cmHSsMNMAu
         3Su5VS1GQHEcicsSOUJSSRAwiO5Zy2CI8qfGwlsRHjoQnHMY404I1UlM/POspFQFo4tu
         +fE8Kg26GGZle7dZFVqIG8ZcETBSOiqNOCGlw0l7KbPkTUrNj8ZDKcqJPFqaU7V7Rz2W
         AETAqVc2D+4OnMWC7p7L8PKI3D2v9b1G9vuZBYih5JxagEocZ9IUbwaJv7chyJyFy0p0
         xw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968272; x=1791573072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuMxPdvGxWc1nGfBGBs+8fEcCV1kypQ35Wv71IAG3eI=;
        b=sBzUpyqANxsbiDwX6AJBmyZgtEmlL+IPw9uqbvVKPhQY+ruYlMIzyUcfQPoWvO4FUA
         T0dAi6FFO+SO81QxOMaNGSfNf2e7UIRmDfORugdg5gs9zWcNGFQ/4xNkqEd5L84UcyKL
         mvNd1ElJcCVgvh/w64tdDQm5OV/VzNIGHgX/pZq7NmLUFO+OGlig6IPNJ9Oas3t8xLhc
         cZoup9mw6V/G9OWVy98JdjckhKniwIJYk7FV5wS/a3HyQOtvn0KaeyG/GhoqAuVr2SvU
         /hUKGgXZt4hlRgp3NbZo+6W04zCj0Q6bKhx3G4zuBcYdz2JSdKXptFh8RbQuxKMbQ6Un
         sscg==
X-Forwarded-Encrypted: i=1; AKwUvBzYIs+xO6FLYRwR7bFnzm258vlYeGOYVpDNvArEUe1elv4eBVKnS9d7iLzeBrbjH5hsAfx/KIPxVc0aXok=@vger.kernel.org
X-Gm-Message-State: AFuF++lsE/X3ananht/sbv6PWig9eKKFDNIIvv3hM54f9XohxCuoU41Z
	dKNGfWM+tagYNSr6v2tA0E63R2GJvotXfv0LVHxpOAEugZnqkoJWAAiSmJt27IDvYtw3NSpmn4+
	MXH/nCpw/MGnD7A11pKjJ2atokC+JrjGxqSMtAWYXHz8RKWuH0VGFX68a47NNoKMssXI=
X-Gm-Gg: AYBFou3KuZ/3L8ZmMYBJbBuSXWD0gZ2Wcxsjg9vThni72cxjl7SK9mYGMyPb1LVoMZZ
	+kFu6Cv63bcF/kYe8xprJUo08ZJMJiOl1UFV2Zx/XYxAQIbzwV2LpTI7gJUiR+nMmR6FRuVvK5N
	1oNvML/38TBAAufT620tQ9BlndoIa/9II2Nsk3f6KPYD8b4itHZSTZooEgma/cQ9JtQGHDDZlnS
	P4SN4Y4/y2OE/i2u1YYTya8lVFzD4BzmA+uPAO+UzE+t1gSAKLrKlx+OytMp2kz0uKBrZxyg/6t
	Ki2ehLP6X2AeSsUNJDkY6cew8DsYnDaMpqXm8lZ3vzGcOXKoPT2BJ1rC3CieIM8nQo26Exx9AiT
	mGMNYrCpQmtiPW3lqso37MiwsMNPqTZol+4Dl5vP/6J/7rD7A2i1Mi1o=
X-Received: by 2002:a05:693c:400b:b0:34a:c4e6:27c with SMTP id 5a478bee46e88-3511143ec5fmr585732eec.18.1790968271600;
        Fri, 02 Oct 2026 12:11:11 -0700 (PDT)
X-Received: by 2002:a05:693c:400b:b0:34a:c4e6:27c with SMTP id 5a478bee46e88-3511143ec5fmr585701eec.18.1790968270979;
        Fri, 02 Oct 2026 12:11:10 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm5263296eec.8.2026.10.02.12.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:11:10 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 12:10:57 -0700
Subject: [PATCH wireless-next 2/2] wifi: mac80211: remove redundant null
 check in ieee80211_assign_beacon()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-csa_cca_fix-v1-2-b83a998aeb44@oss.qualcomm.com>
References: <20261002-csa_cca_fix-v1-0-b83a998aeb44@oss.qualcomm.com>
In-Reply-To: <20261002-csa_cca_fix-v1-0-b83a998aeb44@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX/8yp+YzU+8Am
 Cmoq3hKApeeBiC6SxXFqP5yiN+pAXfYS8JCthF5lr404mcotBpaHMlbWNwRDDtj1yIpTLEN9Ki3
 jV4R2Fp5mRXN12H9kAEYEjdkIl3WU9w=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac001d0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QPPESg7f5PRtYPC1LuQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Pv4lT_Z6FNWw20IGh1HyXBXccfNw8bkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX49YAGo/Z2l+0
 MjrHsKUuY/qGF1dsrUNdPWAJP4hgbY4UqZemM548Fb6wqxIIlxRr3A8QbdkQHyXXpaMymWGCiAe
 DIFfGbJ+h7fMuesoToG4u73lYF+SSidPZuOytnn6EM+57LHVZN2OP9+gjSj3MDlNvphLsu9X423
 VfFzPUQMzWtovvLFC/jKUIGwpxq6h1CaMG0sFpJoEWp+MzUnZawrX5QbRJMNxp4bwX8sIWJDRcw
 P5KSWcWdSwZ2KcElBpgbf02TBtxmeToBdHBIjn3PDHxTkE0r7tF4DfmsXr6wzWsDNRBxVnQ7ee9
 jPtZcLcRhBY4suaxK/9rflxM6s0CNEGtNJN0n2gPr9+E9BsPA1eusouhD1UQJ8r8UMxGUEXHumQ
 v/SuEUh8svjORAt5ymOkvgEYXbaGDQKjzWJehHSzR/CnN9AiAal4rADW0PMR1E3MQxqMFEZoVPk
 +kszkTOZ5gJCACKxQVg==
X-Proofpoint-GUID: Pv4lT_Z6FNWw20IGh1HyXBXccfNw8bkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020076

The else-if branch condition 'old && old->mbssid_ies' already
guarantees 'old' is non-NULL. The inner 'old &&' in
'if (old && old->rnr_ies)' is therefore redundant; remove it.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 net/mac80211/cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index b38941e6784f..cd5781ba2873 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1531,7 +1531,7 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
 	} else if (old && old->mbssid_ies) {
 		mbssid = old->mbssid_ies;
 		size += struct_size(new->mbssid_ies, elem, mbssid->cnt);
-		if (old && old->rnr_ies) {
+		if (old->rnr_ies) {
 			rnr = old->rnr_ies;
 			size += struct_size(new->rnr_ies, elem, rnr->cnt);
 		}

-- 
2.34.1

