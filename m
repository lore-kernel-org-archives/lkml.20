Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9444E0B9B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471148; cv=none; b=Zxo6PzTXJ/RcbXWv1fT1bfeakPxaXdfQh/iVMOiTm8N52Qh3ILG0mn1TD2XViyObi2ajx8jLuB4x2k3kUYEMkTLGiNgol99YoHKS8OzMszro365seXhgvzkiF90cNDP69jXmuNg7DV6FcjD3TgiimL42IGovZeHhUQPWNzNI7ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471148; c=relaxed/simple;
	bh=f7UgC/h70IbjkbEhISDmBS8SrsPHSkVGFtcsHrdgTXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUArGzZOFCDM44833Jnzsj32RlQdbaTXYkmBV5dAYXFHZjNZJRsk9FSTqEmwnXB+G7RMX6zsUuIx1FWEZTORatgcdULTOZsKTJmOwRRGVWi44PLrZs8mEoziqP+9kl9NnrTtHEQUMI738nBSsNI5yzeh+mzCQUVai7vssmJD8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7WtzRU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpkWvGfA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7WtzRU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpkWvGfA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EW0gu2535711
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=; b=b7WtzRU9DgBftKJF
	YYqACnn+AAgRSOAx9ZHUHDBR1bGmvFQ5eWD+tJtZ4qQmb/fatQPzHHPs27OPdXdJ
	UlS8wI8xPKxDaI4WEtYkxqv2KpsoQkr+NQfoJwFywdlG3wRXbQMqun0lRWSF3fxu
	f7jdjgT8NintvQSSFtQJfEt2w3BIz3CVa82qQ0VAuMMTTIbm/a6PBTqug3kXB1Ja
	yPd5tLnIKzdzt1OTRy+R/nO4qgQqQMzb7tdUtelbwxqADPpO51KiK1mv+spODvMm
	UzXdujQqpVDpuhMfum2H75aPMshtlfdXef49fkRksB3mttNuDPR2uoqpuC14QzaI
	9xjKbg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe53cya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:52:06 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836caf085e0so43445457b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471126; x=1792075926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=;
        b=bpkWvGfAbuleiafRArVXmebl165R77BgalP/gwREHsJFVmoUWQrjd+ddTNHBHTdF+5
         BMG5WxcTuVJs86MchcIKV1GvGRl11V/anMR84ycyuYyRuVxbp8M0HxH+0fyd1Ra6jjcD
         t3gFGiobCP5WvPfqJbFkrXAxE9uq17d43YOHfOCYt24/xQbFDY5q1jGI4P5NqBNz1uVK
         VU3aef7Y2N+SC001R/f4Z+7+aVUPxgHlr2KMVL5xfrlk+n84FjvNm2JgrusxehMSYF1V
         JeVdYgtau7jU5BgfvS/54u7kOxg3XnbldaX/WOuLo2lUcZ270R+g956qxWHhz3sfGopp
         7b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471126; x=1792075926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=;
        b=U30ldqXOCrwiGMYUTUk7y4rc7JBuBhDpHCdzQh8B4LJhfGmmmoa4yXmVzd9hEnOx93
         ycF3UqZVIv05TiwHb4SojO/tsakrGtpWYEZLKE2JxTVEgTiiool8KDw9zza0SUIs4q+F
         NB3573JlX2O2qGnYKp1OVyHjAc4JYK7dYFm/mFxqV0QiJlnQZW94lTavrztB4TZHKJ7X
         iltScD9civqw8lDH8vErYTbUb/0YJRiCOV/iFz45Ug/TXMDo29t52Y6rYPx6aYquQeIO
         PGChGmcJ6lQwCghEj4h8LFZdG3MS86gCDAaHlJd6CN6wX5ZtUs+6fIiTzfLW4yNpyxL9
         SEhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiM67r3YjIT32MrsHaHt8eQCbMzAYcCrC9NHhKKg3S66PT/o+zZ13Wx8HdGSJ/M69XlTG30eRzVJfznoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGceHUDJpBOZHg74/VSlQbf7yX2M0XGtpc0W/4Id8qInzAIdTo
	ASJiKGoJeRGmqZ3BhQiGVypHzDZhKeUC1OcYt8fnCP4Jun/pMPlK5Fn2N1jjkfvN6VBtXIhgyN3
	07I1gOzIDYWKPFebRtzkmxhklAVzbT0IqbMRbGqVuyHfRqjVjTXB/OnGRJF0rf6cn4mo=
X-Gm-Gg: AYBFou0HovxIreqXqsWLzw0jQTijXzrh29+5oDaUQQu7wCO/mBr/w9MU1aSJR8uiW0A
	PPAaAAi79aaLybjAqh4shTP2cKdQbxGWiWwzEvaHckvi6dTK5EHoTT4NJst9RifDlXvsrfdbgpa
	2LvaaqC16H5naA/Qewk6vSB+KxMg3cdZGrVygWWCOQNuwNrKMwZSjncESM1nK/Ndbnq2pXRu7zc
	asc9sgWcg9yF0WFfug3PX+ntdCDc6Anv2ZPJF9A53jiry0Rzj30c0+vj7ytmSFsrbGbB60nNEzS
	fYNQb1IsAVwP4K7lhHUhD4eGZUU/CNLotknc6cdn4PNJ0TM9hORNqsqGY4lCVPJ6t67jnSRKNFI
	BCUb/8Xzer6tzEKW8JvFORjBcH5kK/GLEx37DaB4nZ+s=
X-Received: by 2002:a05:690c:c5a2:b0:8ae:521e:b3e with SMTP id 00721157ae682-8b05b07f2f4mr28435897b3.64.1791471125672;
        Thu, 08 Oct 2026 07:52:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c5a2:b0:8ae:521e:b3e with SMTP id 00721157ae682-8b05b07f2f4mr28435777b3.64.1791471125014;
        Thu, 08 Oct 2026 07:52:05 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:52:04 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:43 -0700
Subject: [PATCH net-next 11/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 counter debugfs support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-11-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=6180;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=f7UgC/h70IbjkbEhISDmBS8SrsPHSkVGFtcsHrdgTXk=;
 b=wuap9unxYof7C0T2ucWWZklA15SI/9X2QkntAkaUt9ntWiHUgD/rMEhKFOb3gYZO/O0RjFrYR
 T90Hgv6EFvnDfTy3agnV1lJaAm0oudZ8g1O6zdq/XDzOBn1BPu5dw6q
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: 4EX-zQWhVq5oCuNHelBNDo8TOxfC9bXi
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac7ae16 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=76TLMYU0KGnaRKKVPX4A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX9vrd8rM3xXoT
 dZJdV9aEJKqtPfF4PIovbt5Tce0J9qri9ACu9Ac4y0hYrw1NzzdV8NeKaO+MQYtlsyvPCWC1ZmE
 0OD96p0TnjnuAf2tMsnkyXQX+vk1LNU=
X-Proofpoint-GUID: 4EX-zQWhVq5oCuNHelBNDo8TOxfC9bXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX9otSgH8aEMy+
 iF9E4RczH6wtxhd7YZVx31R8cv9idKexZ80syTjBd3VI+ySD2L4CEecBj23o+L3CBpfPHj7ELh0
 1Kifj06rP/R3x75xGjZJ0NFec7Ki0P3W2OFzjGr+ZLI9vK/Gyn6/OvELCilZWej8Sf+wDu0U/Zq
 lew8FEoi8ytAdSEjc2RloczmKWmAvjavsklbUvP+QaoAOQ8Ra8ZnSLqhFukzA/LWbCjUvoNAEj+
 uVve/y9jTRs1jHIEScvB9VNSvxSrH3n2uKNh/VACzlzPuEKIOMdcHL/fAMRljjsbeLq0FhxPG6z
 VRsB/rGVNgJu6NZ5qgaiZAJ0+72Hw4TzV9LIRh4O32Mj8B7bIdURt2grkwxyG7EGkba5+MvE1nm
 lmYxPQH8gSrGt1uVfwW4pq6aZuhxNvhx1UBbQAtt51Wz3ihhTWxF13qwe4WsmSpRHFvm8jTHLVI
 PLAUgisJA2YL35VY0/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

IPQ5424 has more BM ports than IPQ9574, so the BM used, reacted and
overflow-drop counter tables have more entries on IPQ5424, and the used
and reacted counter tables are located at different addresses. The BM
silent-drop counter table on the other hand has only 4 entries on IPQ5424,
versus 8 on IPQ9574.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c | 14 +++++-----
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h    | 36 ++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
index fd959a76ff43..8d5a6fad8337 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
@@ -201,7 +201,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 
 	seq_printf(seq, "%-24s", "BM SILENT_DROP:");
 	tag = 0;
-	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
+	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES(ppe_dev); i++) {
 		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
 		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
 				      &pkt_cnt, NULL);
@@ -225,7 +225,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 	 */
 	seq_printf(seq, "%-24s", "BM OVERFLOW_DROP:");
 	tag = 0;
-	for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES; i++) {
+	for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES(ppe_dev); i++) {
 		reg = PPE_DROP_STAT_TBL_ADDR + PPE_DROP_STAT_TBL_INC * i;
 
 		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
@@ -248,8 +248,8 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 	/* The number of currently occupied buffers, that can't be flushed. */
 	seq_printf(seq, "%-24s", "BM USED/REACT:");
 	tag = 0;
-	for (i = 0; i < PPE_BM_USED_CNT_TBL_ENTRIES; i++) {
-		reg = PPE_BM_USED_CNT_TBL_ADDR + i * PPE_BM_USED_CNT_TBL_INC;
+	for (i = 0; i < PPE_BM_USED_CNT_TBL_ENTRIES(ppe_dev); i++) {
+		reg = PPE_BM_USED_CNT_TBL_ADDR(ppe_dev) + i * PPE_BM_USED_CNT_TBL_INC;
 		ret = regmap_read(ppe_dev->regmap, reg, &val);
 		if (ret) {
 			dev_err(ppe_dev->dev, "CNT ERROR %d\n", ret);
@@ -261,7 +261,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 		 */
 		pkt_cnt = FIELD_GET(PPE_BM_USED_CNT_VAL, val);
 
-		reg = PPE_BM_REACT_CNT_TBL_ADDR + i * PPE_BM_REACT_CNT_TBL_INC;
+		reg = PPE_BM_REACT_CNT_TBL_ADDR(ppe_dev) + i * PPE_BM_REACT_CNT_TBL_INC;
 		ret = regmap_read(ppe_dev->regmap, reg, &val);
 		if (ret) {
 			dev_err(ppe_dev->dev, "CNT ERROR %d\n", ret);
@@ -723,12 +723,12 @@ static ssize_t ppe_packet_counter_write(struct file *file,
 
 	switch (entry->counter_type) {
 	case PPE_CNT_BM:
-		for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
+		for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES(ppe_dev); i++) {
 			reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
 			ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD);
 		}
 
-		for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES; i++) {
+		for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES(ppe_dev); i++) {
 			reg = PPE_DROP_STAT_TBL_ADDR + PPE_DROP_STAT_TBL_INC * i;
 			ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
 		}
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 089aa34b7732..d08ab02bdf79 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -18,12 +18,20 @@
 
 /* PPE drop counters. */
 #define PPE_DROP_CNT_TBL_ADDR			0xb024
-#define PPE_DROP_CNT_TBL_ENTRIES		8
+#define PPE_DROP_CNT_TBL_IPQ9574_ENTRIES	8
+#define PPE_DROP_CNT_TBL_IPQ5424_ENTRIES	4
+#define PPE_DROP_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_DROP_CNT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_DROP_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_DROP_CNT_TBL_INC			4
 
 /* BM port drop counters. */
 #define PPE_DROP_STAT_TBL_ADDR			0xe000
-#define PPE_DROP_STAT_TBL_ENTRIES		30
+#define PPE_DROP_STAT_TBL_IPQ9574_ENTRIES	30
+#define PPE_DROP_STAT_TBL_IPQ5424_ENTRIES	38
+#define PPE_DROP_STAT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_DROP_STAT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_DROP_STAT_TBL_IPQ9574_ENTRIES)
 #define PPE_DROP_STAT_TBL_INC			0x10
 
 /* Egress VLAN counters. */
@@ -426,14 +434,30 @@
 #define PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID	GENMASK(1, 0)
 
 /* Counters for PPE buffers used for packets cached. */
-#define PPE_BM_USED_CNT_TBL_ADDR		0x6001c0
-#define PPE_BM_USED_CNT_TBL_ENTRIES		15
+#define PPE_BM_USED_CNT_TBL_IPQ9574_ADDR	0x6001c0
+#define PPE_BM_USED_CNT_TBL_IPQ5424_ADDR	0x600220
+#define PPE_BM_USED_CNT_TBL_ADDR(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_USED_CNT_TBL_IPQ5424_ADDR :	\
+					  PPE_BM_USED_CNT_TBL_IPQ9574_ADDR)
+#define PPE_BM_USED_CNT_TBL_IPQ9574_ENTRIES	15
+#define PPE_BM_USED_CNT_TBL_IPQ5424_ENTRIES	19
+#define PPE_BM_USED_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_USED_CNT_TBL_IPQ5424_ENTRIES : \
+					  PPE_BM_USED_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_BM_USED_CNT_TBL_INC			0x4
 #define PPE_BM_USED_CNT_VAL			GENMASK(10, 0)
 
 /* Counters for PPE buffers used for packets received after pause frame sent. */
-#define PPE_BM_REACT_CNT_TBL_ADDR		0x600240
-#define PPE_BM_REACT_CNT_TBL_ENTRIES		15
+#define PPE_BM_REACT_CNT_TBL_IPQ9574_ADDR	0x600240
+#define PPE_BM_REACT_CNT_TBL_IPQ5424_ADDR	0x600280
+#define PPE_BM_REACT_CNT_TBL_ADDR(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_REACT_CNT_TBL_IPQ5424_ADDR :	\
+					  PPE_BM_REACT_CNT_TBL_IPQ9574_ADDR)
+#define PPE_BM_REACT_CNT_TBL_IPQ9574_ENTRIES	15
+#define PPE_BM_REACT_CNT_TBL_IPQ5424_ENTRIES	19
+#define PPE_BM_REACT_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_REACT_CNT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_BM_REACT_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_BM_REACT_CNT_TBL_INC		0x4
 #define PPE_BM_REACT_CNT_VAL			GENMASK(8, 0)
 

-- 
2.43.0

