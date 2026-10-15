Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036555221CE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058165; cv=none; b=Lw6oaUNvUVKWvmThK51TM0yKwXvDP0Wd+baCfDl2W8FF2pf6kFV7Q5ZSg+nx3nvNPSCSrDXUSJ3nwDa+Ih7kJKlF+QanNm1LAQjPDVqFagz2X/OhSxVxTxlviAg/B+G8zTKkhceN7RMcaNPaSeGL2kTtnl2NGSAE7bgXtxI+Hhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058165; c=relaxed/simple;
	bh=QqnyGyqGJI3ins848hnKP9SiU5N5LGOKRYQENWIDFSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koLQjOnqSgSdsdSWQ0Ln2p7qU0QQVXl7F9kH/NSUOLKZx2NbYTg9dAPeDexpYCFx152WmXeZO1GWbiWnSIBTStH26D++IUqD12V+7f/SISTzImioqQqoe88VGmtWd2esySDvxthHRqHqdXeBF+xjx0r3BJRIyJlyvyUJ5Mpbq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGHK3e/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6HqYR+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGHK3e/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6HqYR+P"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jk3T3510586
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=; b=WGHK3e/oFJJfCbVm
	zR7C0DhEiSBbEr+Edr1kG8xyl8TcmnN2GSZiyFJkn914gZ151JRLlHkLtqdF1i2m
	tmFMoWXKH/VgoAQcNx1rFogXpLF3IOpvuoOcW6MOKbKv1pLtPq1SAcTdYQ8swfT3
	EkU0JFrrr5Fk3t4tiDXn59RkI9n/bGbIO9+6r0oXcAEzhU3GE7fO6utOqr5pRxjV
	DsELKiXj4sCktmVKAzrJ5h3uAU8C8FXGGnhbtPbXWe8hsVHZvAu5uZf8AGUQBNLR
	kyCnSQRvpBjP7bOn8WHFPdEjcGYwsZSINa5vP4JAH6kVcgeAjdm3u38OBMIhClIh
	e+oMVA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9e3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso10507718eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058155; x=1792662955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=;
        b=N6HqYR+PRutv/4+T2H7eKjJZYVpbR18tKUqDvlZmJULYhpcTNaOiUb8vwAPjWvj4oj
         uE6XBKQdRXfwff+hUjqbAb/dgCxPzGxdo4y2thfalKEnHtP7jAbiGrQntsSVDcvJGc9U
         td9CzXL1dQV6aeAFlsYa3BhK59EkX06P1srq59sPlsyakzY/1l85gKNQdc6V10TzaHL2
         GJ5EoEylD2iqenHA0zVoytMKLXQoaCAJw65tyq0LwzXp4s4wQ8MNHBLP7dMFWr5dLBSl
         WVyVmrAyXKnOTQv6SqSDhsSHPmE9e2CZ3kPPOZyDMdPgo0rt/C7QMsaVaIWuvxLwd2PK
         rqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058155; x=1792662955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=;
        b=09kOv1WeHeBdqKdNzp31rULjKrEn8fBrnum67ci/ZO9/c7vMXsswRM57PGOLJafSZl
         +LkqF8Lm0mAwQO+BbTneWOevPQeF1o5hMYXcDpudiqzUYvgVFUE2+RDlkynTTAK6M0dK
         BOmgJKH1fxdtNqntPWWm6Juo7rtDlM4MEjCsx9AU+pggq9OatSNU0oyhAmXIReF1gq+b
         0EE70eJJOd+h1f7TIFIDiMC8dOWuSzhoN1LXKm/ipsvnpFvyk6oiiAyU3bg87Zd6vQsE
         rDYPrmHs9RZPpJ/6QhEffQ7vaYjw6eqqTz/7Q/IPGLlRfUPNYAjWggdqm87YWgi2l/+a
         Df2A==
X-Forwarded-Encrypted: i=1; AKwUvByckud8uQHY/PY02jM9JGoTgZQK5QxO6apj9I3j2GaYXHv60ovA2Ln+cfGjZ5i+lP7CHikcDTNTJD2ldMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6aDwICAG9fD5H/JjYS5ZGPRczjYAAZP+QA1/czRaTBQjUn+RA
	xnKiDqtqtOTjBU0d8TfemaTTroBrKQfMBliLWPEkpTkMsJEV5ygH0JG0uVXOKXIfYuw4T8s4onO
	fWiZpB3WvWZSfx+hQkFT/NavmkPqFqpTrBK5MSrE3Q6f88PvhUIyszxmedSefjccGhFY=
X-Gm-Gg: AYBFou3/TwXS7hZL4I0prNvtkFADphqgopZHg+M9JxbHlr7FmQGOR094BvvyItOvtbR
	per1xcNuXdvA/XGmymvpPxBlKJFuOuBBNsOiEmPKeoVMMbYr52W7q1lgZt3gPByf6a8QQCklSOa
	EldApg0Uo09X4tRhfJlpFslwIvkyooGFiRUFOWqyBqGbXYL8I8nfJA1fWFKgPM7eh4zbdM4cNVF
	2pDk/6tVX+5K34AOzkRww1nbYdMTi9EVMCZ68s520L+dsLZKl+NJcx3rqMIOHDBCbOqk7WW4CmD
	do08NTEYQHeV+4kNNsogWAJLiw7V6h4ad3iYYVRb2Bo0MPRAlmnfYkdT3kAVpLtC02sieldED76
	K4Np5Z0pXsa1Zf/DjP1sL8Hg8+Zy/
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr23935756c88.36.1792058154514;
        Thu, 15 Oct 2026 02:55:54 -0700 (PDT)
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr23935703c88.36.1792058153000;
        Thu, 15 Oct 2026 02:55:53 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:52 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:20 +0530
Subject: [PATCH v2 4/9] irqchip/irq-qcom-mpm: Prepare common access path
 for timer and pin regs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=2879;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QqnyGyqGJI3ins848hnKP9SiU5N5LGOKRYQENWIDFSo=;
 b=kUj4K8H+/812w8y6hk9u6q85CN/ahAHrvTJngEOXl+UOJ9VSCJDKg0/Hx4noIeGANDsRbNLYs
 riFLI3fhEWVC3QMd2zS16g5/S6w7OE8Bk4tO+5zTwdrK8UW3yAsgOde
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: O8vKPtl9WDAJ8DlFOrpBdq5ColkQuXRn
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0a32b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lTbGvRf64-BgIYWFXWcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX9Hn1+Ld5+SmS
 L/idUBMMeDQO1Ecm32Jhl/Pb9ndZmz5AF5mb35rbFm17Lk9PPZLG/nQl3zr2RBpbeTqjKmyse3C
 70w/v98LnFKUvtU/Wtx6wCblyYr21DT+A36OIojjGuZdpr7/nkg02Hn7tUrYrb4oTm41FPz4WvY
 AJuG29c/Rkrn1buSyh7P714EwaM2rONvxVjQBCMtcEfILZi29QTOIu+DtxBVsWCuABHUOweY4qF
 ld+uyhElj90KdZGLKohWjD4Psj73wPwQlEPe+JZXJ0M43y4NToQM43AP0vXrmeyhSXFcR0IFVuP
 D5tG5m+RjNDse77rC2n822CFnAZO4DqIuXkEt9o7Woux0NC/iy+apC5dJVeXV6wKdoRdkFrkgXS
 izXqdEK+zivtX/rkujOyob7Ta6QsPssO63Dn2bTFzhFZOV2X/5ERAxc5aKtRZ+lREhHUZ/wSzE7
 /cSM0LD6EDqiKNTtmww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX4s/HQsTxE1Uj
 l8CBkuu9ce1MQJpcLJ72QGMlp1Q0A3tekb/JYsRe5Zl39uagcxqwddrh3fPlXhpvTZC3tLnS8SP
 VfgkfaryH+zxDGxe/OHjSHULxaND6TM=
X-Proofpoint-GUID: O8vKPtl9WDAJ8DlFOrpBdq5ColkQuXRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

The vMPM layout starts with two timer registers followed by pin register
banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
number of entries.

Use qcom_mpm_offset() as the common addressing helper for both timer and
pin register accesses based on that layout.

vMPM has MPM_REG_* values represented as contiguous register IDs,
hence replace the macros with enum qcom_mpm_reg and modify the accessor
helpers accordingly.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index a37c20a20bed34d4f55fbcc950ba39ab9799b7b5..0de6ce818a506efc07913b16c479b5d5efb15108 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -64,11 +64,16 @@
  *
  */
 
-#define MPM_REG_ENABLE		0
-#define MPM_REG_FALLING_EDGE	1
-#define MPM_REG_RISING_EDGE	2
-#define MPM_REG_POLARITY	3
-#define MPM_REG_STATUS		4
+#define MPM_TIMER_REGS	2
+
+enum qcom_mpm_reg {
+	MPM_REG_TIMER = 0,
+	MPM_REG_ENABLE,
+	MPM_REG_FALLING_EDGE,
+	MPM_REG_RISING_EDGE,
+	MPM_REG_POLARITY,
+	MPM_REG_STATUS,
+};
 
 /* MPM pin map to GIC hwirq */
 struct mpm_gic_map {
@@ -90,18 +95,30 @@ struct qcom_mpm_priv {
 	atomic_t cpus_in_pm;
 };
 
-static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
-			 unsigned int index)
+static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
+				    unsigned int index)
+{
+	unsigned int reg_offset = 0;
+
+	if (reg != MPM_REG_TIMER) {
+		reg_offset += MPM_TIMER_REGS;
+		reg_offset += (reg - MPM_REG_ENABLE) * priv->reg_stride;
+	}
+
+	return (reg_offset + index) * sizeof(u32);
+}
+
+static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg, unsigned int index)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	return readl_relaxed(priv->base + offset);
 }
 
-static void qcom_mpm_write(struct qcom_mpm_priv *priv, unsigned int reg,
+static void qcom_mpm_write(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
 			   unsigned int index, u32 val)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	writel_relaxed(val, priv->base + offset);
 
@@ -142,7 +159,7 @@ static void qcom_mpm_unmask(struct irq_data *d)
 		irq_chip_unmask_parent(d);
 }
 
-static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, unsigned int reg,
+static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, enum qcom_mpm_reg reg,
 			 unsigned int index, unsigned int shift)
 {
 	unsigned long flags, val;

-- 
2.34.1

