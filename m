Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538245;
	b=f//E+C8HKgoyWULGzboNcaMwBy+bAyNB2ACwdb5FP21ywCwxrzybtt3cCzsRZezDDk9D
	 EtQhq3E/yDIMeqMXM/Tbeguf7M9VLnoIKtHfYBA2HNPfBAO1nOX99SbFl8W5NiTLvF1++
	 gLhyLzdw9kd2ih9m35A1HveP7HSNNeX/BzxF7iyEMSrojK8i4RzbEbOws98WbpyCSE60I
	 M3cYdhT/K438Sp+vYxIi4pFc4KP3Ue50HmlN8syPzcfd8RTlGgsITAWn3edb3clvc6gB2
	 w5yBr/epD5IQPAICsPOKXbruH2YHogDDzI/7nkYW9tEE2W5Es8RL+E4Cjvko3RnhJdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=;
	b=K6V4lCao7QUrOG8XmGroddq9oG9iBVqpBSH6yL5Qyy07vefuBoCfm08VBHla+2kADcTu
	 WQCT0tUbB9Yh+Q+IzkP6ogRgz70sUNSxekNEP+QuVtMdSqMEm4T1KACs/i/2OnjtP635G
	 X1M0k9MCyItZOC+cnQyuHFJ+YaRdFgq0331IZsz1uo3u2vOmvPNs0hh8PJxB5WqQI/08W
	 BaDPYF2K87ErPMmcCymZh1BsJ5tn17+BKsLtjxjxloEwt9n7muMz4DM4VvjIVJxXb0pe+
	 OisFORiQHx9S2vFkMCWtIqMT54LW5TverBKFe3q3fDBHd9UELdt3dtLswgKL1OGjplg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CToyPsbK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/YLeiOu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0C2606A885
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0C2606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CToyPsbK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/YLeiOu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2JxMm3116267
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nGiFHSQcrHd
	3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=; b=CToyPsbKFCoOPs3/EIqjX3Ihiap
	I+wwiO3W2C5kUeqHrum6+bapQ5dtJMede6vqUi472f3aaJEeugYRF5+ZqNEyG8Z1
	MJQb2yJ5OvS7R2DLuB8Pc7qlzFFbDkMxF/VdwPqqMjq2+ZIXO/eKkUVupsERuZeE
	wL/L+EEkA16OywuXuXmdWVVPQZ0NZaj2/n4Xb/51Ruc9bPtpbdzqC83YV9rah8n6
	pZSb5D3nHJqIOyCJ77GWZA7Cwwb2sPP9gHMMuzbOECJAgRxXuF1hA3kENNJghQrX
	1PQnIKA/gnLQ5bNA1OaJMnEDO2WuNNiOhRBKFEtBZgu6M5i/7dfrEUiH7LA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdh7sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so8394915ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538243; x=1795143043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=;
        b=K/YLeiOuQe0jLhgYQTa4eAW4FvDtMK17+glE9j4W5QalkJeURsdtSodVG7Blw86LrV
         nyAJ9J3Oaz4xm8ZA7udTnJ2ifA+VlnY2zKydULA1PjaCXHghJU2/huL+psNNGLEesLQ/
         LUiM0U91yisRhtijDIIEJkvuGFfQ/LYQnfsyJ66tzSUcJeueS69LiaJcG/szBAj67GG0
         MF8vuywQKgLxyHp7YkwGCR7N3BqjMxqOH2APfsiZcMwwdVE/Z8511z3c+EFKvJMsDu0S
         wnoiWe7TPvyluRKQWcDmWgXS4bXwhjZxbn42VnOnIVCaptI5qmiSpI9IGuCiZrRrFEaj
         TCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538243; x=1795143043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=;
        b=PZanA5tAs1JMdZSnAT6kM9Pdp7oQPD4VTghXNwAl8DyKBL+qHmhBPyPKXzlduLFDCu
         xNOniA/hZH1jF6/CR4ls4aLovpleaAtWtVEqvfBC6wH3MTsKVXd7K7bOF1otaGn7qqt/
         47T9blvVV2Qa1ag9YygTz+BypqhzDCppTX8pz6ZkAni6wgVjrsjVPLOnEeqeVyiir+4F
         MxzDE9dH931sSIkImtCjQJ8d4s+C2d8R7+AtsJMwxlc/jiAG9N0uL0+oCVKR0kyoTQ0m
         oOo0vTH8HljiEBeLIUQ8RcoUZFwMt03+hujcjjrnBKO4WF+oAI8+QqraGsoUy/AbGhNj
         MoIQ==
X-Forwarded-Encrypted: i=1; AL+hErH9SUdtyg7YnMPPCRdx9SK14Po6lbAVYP+SbgDewgD6P7/zCyi2LA4z8nikZaCfX8oLeVnTtm+/iXZz1XQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MxCHTwqmzbiCRQYhH5x/ZPdp7OmBcfvF1vgE0ukN39Q5rdIrG
	Gvszpcq0WMWm3rnWAzbLlfveZZxnpL510vA+1WyiQybyx7g22rSVcLUhoAXt4UhjoFic3HslGzC
	ZeBoEevy4B44/IXSXzmbGE6RwJ96+TGyWXB2a5EgWLJa7ttFxFeALBbmYLFTfVmkQd7w=
X-Gm-Gg: AYBFou3FPjXI9/iJBOIX0Y3hqDKWolynqMv8YHddwfUNgv1rqjzI9yErzTAm08of13N
	1mkqG+kxG1A5GzdXTvajYWqdaJatN+ejqLlg/q60m+WIZFip3dlCw2OiQR8t1YTaBsGf3ePtC59
	n18M0c5rsRkk6/b7Kd5aHzJwVo8Mc1zMF9NsOrHtBe8vlyJjQlH5sSafwjD1J9vgQZzDhX8/8hW
	f1QWLUdY2n3lZwQtlSsSDb4d25/HLz8vr4UuzKQXmDIFoOLOXQF/QJkwS9tkFigFRv4w1DlxvWb
	n68hJoX78AdqmLPnOVHi7BKH0ECQWXnEPjcOy3g05DYa7lQmAZgwcZF51MND/Z9GbbAdyqWK1Td
	nS7Fu/dJWaWDKVkYYPxvEJ9imZff5DLy8/xIgm1PftXMhKJ5RKDcd/wk2eveKAMjLFF5YwRt8Hc
	Xi+eOIugI=
X-Received: by 2002:a17:903:f83:b0:2ed:1b5:8443 with SMTP id d9443c01a7336-2ee0dcdad0emr11990795ad.59.1794538243027;
        Thu, 12 Nov 2026 18:50:43 -0800 (PST)
X-Received: by 2002:a17:903:f83:b0:2ed:1b5:8443 with SMTP id d9443c01a7336-2ee0dcdad0emr11990515ad.59.1794538242578;
        Thu, 12 Nov 2026 18:50:42 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:42 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:27 +0800
Message-Id: <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX/kY7nymBtefR
 HafBBBUtq4l9+RynSzM7fvzjnGy4/lcTKQvYo+yFiVJF8ohymI7ZU+w7kyjhgowtrQuqEWzY/Cz
 SNl1kBoBkhXnLEBhE+od7+7GSqjU4po=
X-Proofpoint-ORIG-GUID: 2KijGvX6slufqMZ4UvGBDgc9rXYVSxQq
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af67b03 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=-8ZncIIG5GjyyUODfMoA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX/xOaaFDnWctB
 pQdt+PRs11ziugOaxdiEgrTjBKOKaA1odW9pHg46UlzYqXt1zjnVBpf72mmqfRvqwIDaa3DCSOD
 4vMWMTblFvEnm2ezuUVX59/NhDMDoYI5LFxMZiFEM7L/gi+NGC35gEWXQUdjI9/K/cihwr77dx4
 ulILsD0+jO1N70OQ6q+XIPAyyfUXx9EDW01hF9rfZ6g2cEifu45pSje5DHw9ptLr8/cbcSurTZu
 gDx8B3RDq4wRK+/FaJFpcIuCvUjW77ah9si37DjBpH5SiUoYOw2Dm0GhL/FKDkd4rBOUtQapLDC
 87ep4oBXlH5zRwl+DkWdqpMxo3sF8di4bPYU6Iu4kPUQP8LcUoLp20EiZjTU29XqJ6novAZizVn
 N/ZRz7Dm8jIKdPhBI8jSHCaDPkrE2tlJt4GT4R23eOXHVDkT28ofMUVGipCizNt79HVmTPYHB0q
 DIP2ec+j7coWaQVtM9w==
X-Proofpoint-GUID: 2KijGvX6slufqMZ4UvGBDgc9rXYVSxQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
generic ARM CoreSight Software Lock Access Register sequence, which
is also present on non-CoreSight-labelled components that follow the
same architecture (e.g. the Qualcomm TGU). Keeping them private to
coresight-priv.h forces such drivers to duplicate the exact same
definitions instead of reusing them.

Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
include/linux/coresight.h so they can be shared outside of
drivers/hwtracing/coresight/ as well.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
 include/linux/coresight.h                    | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..0d3f6229b282 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_ITCTRL	0xf00
 #define CORESIGHT_CLAIMSET	0xfa0
 #define CORESIGHT_CLAIMCLR	0xfa4
-#define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_LSR		0xfb4
 #define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
@@ -116,24 +115,6 @@ static inline void coresight_insert_barrier_packet(void *buf)
 		memcpy(buf, coresight_barrier_pkt, CORESIGHT_BARRIER_PKT_SIZE);
 }
 
-static inline void CS_LOCK(void __iomem *addr)
-{
-	do {
-		/* Wait for things to settle */
-		mb();
-		writel_relaxed(0x0, addr + CORESIGHT_LAR);
-	} while (0);
-}
-
-static inline void CS_UNLOCK(void __iomem *addr)
-{
-	do {
-		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
-		/* Make sure everyone has seen this */
-		mb();
-	} while (0);
-}
-
 void coresight_disable_path(struct coresight_path *path);
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode);
 struct coresight_device *coresight_get_sink(struct coresight_path *path);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index edf2a2fc697c..0168f6abffaf 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -35,6 +35,25 @@
 #define PFT_ARCH_V1_1		0x31
 
 #define CORESIGHT_UNLOCK	0xc5acce55
+#define CORESIGHT_LAR		0xfb0
+
+static inline void CS_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + CORESIGHT_LAR);
+	} while (0);
+}
+
+static inline void CS_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
 
 extern const struct bus_type coresight_bustype;
 
-- 
2.34.1

