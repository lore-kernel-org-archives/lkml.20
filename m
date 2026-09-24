Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B24503E1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249988; cv=none; b=smUaAi0aotIY/wYEAqkRaJ8THVmXzOKIVIWxD+dQeXmYiG8mr7xOd7SSeMFbj4U7D0QgBzCQVL9a6MCzxRzTbFUT3t8/QqcIctF4cUkEvBSnltBd8qo9DCgkK5nk+kGctlTnH7gv6gpUEh0OFwIgpsAFmTxYM6MI/aGeVhO41Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249988; c=relaxed/simple;
	bh=/lbvMmhlO++ZuTTG/5LKyiWYny//UPssn2sr67Jl/m8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PViZ/YAgzW6RYWhdqSYAI80+PHYhHEq7GX485vNXk6Bwy2mowQJCr2qpHMq3xFFGQkol4qmTM7pclFIK0cC8JGfltMf3uCvwzCMZYK9fMU47a8CZcq1rtN81pznk4M81whXYPDwqF/hiKkoPwBKVsrT6GPdwWYjVQmg+WQMhUpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRuOOHMx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=barSIlsM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRuOOHMx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="barSIlsM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1QdY2857997
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7/+uyVMC+2gJk/WZarm4fA
	BHT/pO1A0jQduvUZmyoXk=; b=bRuOOHMxg4BVLphU/UiU2ciSKKRiyNUDdhm20x
	c3tgOrgKp+cSf7Nfkr66QSTCXkqHhOUfeu9mXr0mtaG3tp69R3GJWlZHpcPpboZU
	i/QMKhA4nB/vbyOZzYtO0zi3Uu4emOWDoRkoPf/6ZV15nWMK36M9Gdvk6TPW1Z9N
	Tu9rc92+I64nY7ptc3rb7XUFOgmik/wSnz204oSw7afUwrGbtgAqwdpTOdtGkNXO
	MQKwKZ4z8hmmlXl+s4d2VZmVxkvjHHlqe617SDCW7eELz/07C291KQ3jBgNqsPOE
	b0eUEqg05FnhUFRmALVyfrTNoxsQ/HfoxaJMJUr6+HvBeyXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragcpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:39:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so382298285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249985; x=1790854785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7/+uyVMC+2gJk/WZarm4fABHT/pO1A0jQduvUZmyoXk=;
        b=barSIlsM9X4VngMliDt+QX/Gfp3RJNVZ6Z/vs7vaHPsEpenFX6WPXWuKSP1Oiw3bXS
         p7Og9/gRa3OlX+1Vih+t31Ub190l4qNf7o32b7lL4pusjTl9sCB1U8OkLVQNMwYFv2Re
         aZwSib3zyocD91U8aKEX3xs3vJz4Yq/JFivd2GM+Vbb3S+PApPXR3SEhpeIOdweIWpku
         XgbC+CYuKpajLZJy0twSJj/9EJJGrBxzE2oWlKMwDTMyj1FNKTJLnMRZM7pvFZAKuXuW
         ga3U2kVrcobIlEce8v5ExEqHDEAAnzFembNG5V3fpjVy9PKbZ+v3uaC9gRyfWtlHCE7i
         PtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249985; x=1790854785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7/+uyVMC+2gJk/WZarm4fABHT/pO1A0jQduvUZmyoXk=;
        b=sU5HxSM/iThlAYeUVZ2efJh+rvVwB/D2NjvJYzpfkjU5y9feSFtTXnSjsxA7Sqz2Hz
         N3gKtI+806a0ez6SC+egaJbhlavslv6OOF5260pXhU/5pab2nqGySL+mr1TrEiHiHJ2g
         +a/V0TbPLVgXTU5kE5sC23iKYFWnnVCA7+iRRIs4mHXLEhYQotzgkoJRjKAVvt8mE2EB
         fefTeDwHA5wot7jZGXUmDMWzuTnibH94sw/xMaF9dC5qLQIa7jps7XJn6REfngaycMd1
         FfKsGnOBj3ZiR+JOml74H2WRYTBcDmoLyeCEmT8baLIT79KSjgVNGlINQgGFXVVp0Low
         TNpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3mejr5yHIesEt29eont8+etozMWPUjLriKk6ri0jlhN/H/ZKmp8Jmr8bkMfxt9xbmacZCFxBPDZW5e9o=@vger.kernel.org
X-Gm-Message-State: AFuF++lDR/S7Fj8f4cHtx6EroC9uVji+C0SnuUe8Uw2LGL7Rdjfwlqku
	7xNXlraP9g1mUTFzjZx2JTl0lrCJzgou0n4amib0TpINiXAupPBueAQdQpeWYLSuVrmCzBSQPPx
	26abu6jQBi4xYHn+sdawFApQfEHkQoJyJjtQyf36RRXYFyIq4tKNMOdDI/o+GUIF20hc=
X-Gm-Gg: AYBFou1bYyysiogAQ3pGJ033Qf+eR3oflPt80+Nuc0qkJkF5WteGTgecGl8/egjW0ca
	BruQuXEjgVvp04KprI83L/Exf2hZqdhc6jZ9a44gWvm7e4Zi6lvGrQP7bzyhL1Urz5Pxdhi4g2w
	feLBvzSTIPuJVUkXUqMWSDiezq7oL4ahPQ8KPMIozX/elq2kXJKCxXa+017c3pXElthMM6xM0eR
	gT+HT3pCGbtE3z+iyLRiXwYjrV0mx121gPErZQLFUpRrftdb70Ns0Wq0BrcjBzUkhxiPCJJOace
	8JXDG12TXs4dusViKi8ZwStvTg59UPlkNrbncrJjFpl/oR69kMPv6oK+AUF4TkLqdjTXVFdKRhR
	EKmSsqNSKzznKAw==
X-Received: by 2002:a05:620a:c51:b0:939:993e:bffb with SMTP id af79cd13be357-93c3628e16fmr246047685a.22.1790249984643;
        Thu, 24 Sep 2026 04:39:44 -0700 (PDT)
X-Received: by 2002:a05:620a:c51:b0:939:993e:bffb with SMTP id af79cd13be357-93c3628e16fmr246042585a.22.1790249984087;
        Thu, 24 Sep 2026 04:39:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684863d9sm14251392f8f.12.2026.09.24.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:39:43 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:30 +0200
Subject: [PATCH net v2] net: stmmac: propagate PTP addend and system time
 programming errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-stmmac-ptp-added-systime-error-v2-1-beb2a6b5f866@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQrCMBBFr1Jm7ZR2xGhdeQ/pIiYTGzBNzcRiK
 b27oSdw8+H9D++vIJw8C1yrFRLPXnwcC9ChAjPo8cnobWGghlTTUYOSQ9AGpzyhtpYtyiLZB0Z
 OKSZ8mO6kFCly5KBIpsTOf/eDO4ycoS/l4CXHtOync7tP//rnFlu8aNPxWR+dYbpFkfr90S8TQ
 6hLQL9t2w9YKNFz2AAAAA==
X-Change-ID: 20260920-stmmac-ptp-added-systime-error-bc9566262f2f
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX6UhA0V8M/N9i
 /Z+NoiXOVbN5yBGVHK1iQlG/cKc4hiKxr5gqhaPzo1HqzrEDqYliRiyRg4YnpYKgdWRqPF5Bs7l
 U4ee8Fq62Qlc2D8mxvoENtPeYkLKMy6UPPwx0E4nm9BgTJ7I6qv3Ai8h4ZHRPsqBe8pZTdvB0jY
 +jDt7Hdnb4z5aJzPc8giAMLUYfnF7tnv2NbwkcPEp5aw3MuoQTS6FC0CE5GJX1126FcwPTEGzYa
 ndzYkrTejd4fS6OH1uOrPL26AyITExmrY9ZFSwnOhkbs83PUCvdZkvV3/LwqDpp5F746BcY2vAW
 W7bdUyWnuueS+izv0DisRNEvY5D0jaWoBEUsZXB51QzUJgwO8qbRmZTN39iA2JChM2l65WrV5NW
 HTC3nCQUZtxwSQdM1hQebLwhbKKQe8RBz6DbCoO+OJHJN6tgKYnDj+L1RzqjHcb+NW38VtZMBDn
 S8E4ybZnqIbjFyXz7kA==
X-Proofpoint-ORIG-GUID: Im1prtLAoPUAVjaTedmq_ysK0gG4QA9E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX2jpNsYmRZJff
 gui4nD3lNkXoFuKIN5/dy3vdjuKMXK2IXOIctRcDqGfEvH/IfAyq+83JFHNPvwZoMorEg9nC7Cz
 HdNy4EXNoeArv3ojDZn50w3B8eGJrCg=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab50c01 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9VuKQwgGOwxQ2f590fkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Im1prtLAoPUAVjaTedmq_ysK0gG4QA9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240048

stmmac_update_subsecond_increment() ignores the error returned by
stmmac_config_addend(), and stmmac_init_tstamp_counter() discards the
addend and system time programming errors, always returning success. A
failure to program the addend (PTP_TCR_TSADDREG) or to initialize the
system time counter (PTP_TCR_TSINIT) is therefore silently swallowed,
leaving the hardware timestamp counter in a non-running or partially
configured state while the driver keeps operating as if timestamping
were up. This matters for TAPRIO/EST offloading, which derives the gate
base time from the hardware timestamp counter.

Return error codes from stmmac_update_subsecond_increment(),
stmmac_init_tstamp_counter() and stmmac_dl_ts_coarse_set() instead of
silently returning success.

Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to generic HW Interface Helpers")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Initialize sec_inc to 0 in stmmac_restore_subsecond_increment()
  routine.
- Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-added-systime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 87 ++++++++++++++++++-----
 1 file changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..28a83f4a174b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -601,31 +601,63 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	}
 }
 
-static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
+static void stmmac_restore_subsecond_increment(struct stmmac_priv *priv,
+					       u32 default_addend,
+					       u32 systime_flags)
 {
 	bool xmac = dwmac_is_xmac(priv->plat->core_type);
 	u32 sec_inc = 0;
+
+	stmmac_config_addend(priv, priv->ptpaddr, default_addend);
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
+	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
+					   priv->plat->clk_ptp_rate,
+					   xmac, &sec_inc);
+	priv->default_addend = default_addend;
+	priv->sub_second_inc = sec_inc;
+}
+
+static int stmmac_update_subsecond_increment(struct stmmac_priv *priv,
+					     u32 systime_flags)
+{
+	bool xmac = dwmac_is_xmac(priv->plat->core_type);
+	u32 sec_inc = 0, val;
 	u64 temp = 0;
+	int ret;
 
-	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 
 	/* program Sub Second Increment reg */
 	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
 					   priv->plat->clk_ptp_rate,
 					   xmac, &sec_inc);
-	temp = div_u64(1000000000ULL, sec_inc);
-
-	/* Store sub second increment for later use */
-	priv->sub_second_inc = sec_inc;
+	if (!sec_inc) {
+		ret = -EINVAL;
+		goto error;
+	}
 
 	/* calculate default added value:
 	 * formula is :
 	 * addend = (2^32)/freq_div_ratio;
 	 * where, freq_div_ratio = 1e9ns/sec_inc
 	 */
+	temp = div_u64(1000000000ULL, sec_inc);
 	temp = (u64)(temp << 32);
-	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
-	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+	val = div_u64(temp, priv->plat->clk_ptp_rate);
+
+	ret = stmmac_config_addend(priv, priv->ptpaddr, val);
+	if (ret)
+		goto error;
+
+	priv->sub_second_inc = sec_inc;
+	priv->default_addend = val;
+
+	return 0;
+error:
+	/* Restore previous configuration */
+	stmmac_restore_subsecond_increment(priv, priv->default_addend,
+					   priv->systime_flags);
+	return ret;
 }
 
 /**
@@ -864,25 +896,37 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
 static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 				      u32 systime_flags)
 {
+	u32 default_addend = priv->default_addend;
 	struct timespec64 now;
+	int ret;
 
 	if (!priv->plat->clk_ptp_rate) {
 		netdev_err(priv->dev, "Invalid PTP clock rate");
 		return -EINVAL;
 	}
 
-	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
-	priv->systime_flags = systime_flags;
-
-	stmmac_update_subsecond_increment(priv);
+	ret = stmmac_update_subsecond_increment(priv, systime_flags);
+	if (ret)
+		return ret;
 
 	/* initialize system time */
 	ktime_get_real_ts64(&now);
 
 	/* lower 32 bits of tv_sec are safe until y2106 */
-	stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);
+	ret = stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec,
+				  now.tv_nsec);
+	if (ret)
+		goto error;
+
+	priv->systime_flags = systime_flags;
 
 	return 0;
+error:
+	/* Restore previous configuration */
+	stmmac_restore_subsecond_increment(priv, default_addend,
+					   priv->systime_flags);
+
+	return ret;
 }
 
 /**
@@ -7696,18 +7740,23 @@ static int stmmac_dl_ts_coarse_set(struct devlink *dl, u32 id,
 {
 	struct stmmac_devlink_priv *dl_priv = devlink_priv(dl);
 	struct stmmac_priv *priv = dl_priv->stmmac_priv;
+	u32 systime_flags = priv->systime_flags;
+	int ret;
 
-	priv->tsfupdt_coarse = ctx->val.vbool;
-
-	if (priv->tsfupdt_coarse)
-		priv->systime_flags &= ~PTP_TCR_TSCFUPDT;
+	if (ctx->val.vbool)
+		systime_flags &= ~PTP_TCR_TSCFUPDT;
 	else
-		priv->systime_flags |= PTP_TCR_TSCFUPDT;
+		systime_flags |= PTP_TCR_TSCFUPDT;
 
 	/* In Coarse mode, we can use a smaller subsecond increment, let's
 	 * reconfigure the systime, subsecond increment and addend.
 	 */
-	stmmac_update_subsecond_increment(priv);
+	ret = stmmac_update_subsecond_increment(priv, systime_flags);
+	if (ret)
+		return ret;
+
+	priv->tsfupdt_coarse = ctx->val.vbool;
+	priv->systime_flags = systime_flags;
 
 	return 0;
 }

---
base-commit: 58eb1b3325edac42dc6df72c80962bd53a3c8ca7
change-id: 20260920-stmmac-ptp-added-systime-error-bc9566262f2f

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

