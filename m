Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627824;
	b=RZjamRSPHaeqp/4mdja1PZRvean+4zNJ9hCr09+JZ9fpTX9tbRLKOBvCjmo4PstOVTve
	 I3a2AJYCl9GZ/gSN2SZvAGUzI9+F+HBGW0tsia/K5Iso0uLbXkpFq941+ZgsjaUcpgS1q
	 JLLYPzmgNiSNrTmGQ+0Wc8q3HLnsYe2nfHOQ0aU5yNguaKrmYNyZo6iljLUn/DWsh8mw0
	 x8ScOmgtMMDRHdE7uDWhchL+/GMc3VChQn2mQzQMjhsvdDQVonQfh0LnGge4euOz9rWpH
	 VhYFmbkYo9blwCurwz5Lu9JJnaIaeC+nrP+PVgjWqcRSn84+tH5GDiCqghcYDr2bbEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
	b=KSPT1WG1IBvLrMhMIDqQZK0O/cJE11EpQ7sEIGEhxOPMEBrLxxxbeD+ZdeldIopQhzX+
	 2cNqOaijbB1eZYXlnlDJTTaSHh5IGEgbMrq3BtNZl0d2rZui5+mcDztxLN1eDPSp5Gk6Z
	 RzOsOgC/u3bXOk+qh0nzCfs3E6O/X5Jz/5168NP2xRjysEXMpERzbJaK3ah/Qqh7UT9u8
	 SVhIdUfT1fGY0wnu8e1b+hqTjDP2nX2VCY5NixYL9aBlVlwG6ANVYUOiX1uFan60twaFl
	 GhwcTM1JzmbpVnzmFjkZxKsk7L7T8EdjrIBScPZg/UMaG+cQi/QpmJ1gLNpW+i/uAAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qh5hrq8A;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDDF60A3804
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDDF60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qh5hrq8A
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so19495215e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627822; x=1794232622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=qh5hrq8ATk2xevegmYrJJe/V3SZi+adLjiCL067pCp86DV+2uw6V49Hawh225VpKUx
         PAFz0T3i8OredE4nceP0qjiYQk3Zk92QrpI2Yx8OJg3ubhgGqv3kkue9gxvfUkFkWKY3
         C4Nno2ToGmNq6dIT9jciXm7gH2kbyLq5MDBgVeF/qX3GbC/3d1lRphylu5r9tz8Ju9eM
         Gap3+TQv0JcMrwi7lhlQQxhbdg1RlqPfiXUv75gJQ07tezDWQ5SCEpBaZRuIjNxvlru+
         AVlTIIEiTyEm9VpjB07YeWp7KiD5EAmy5pe3/EEiv+hTZIFD4Cqxzew9wo4k2sA3Ja3x
         b40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627822; x=1794232622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=hoXuHLjO6G46Frph7JJx+MOaxSKlhDpGexLhXQS/7h/EEGeWfbzLDe9jg59HlrNuEj
         eO6D+sqfGdhnMzuMC+oIZzuBCb+EZYTtO8QUnDAZcpOK/DdW0Lxzo8/mRbLeUBEfAn0b
         b11IVUSolAOnXFQUi9ZVPzxHot9W+zP6NYGLi/cbxQmiBLxA8cUsqNMIlo8Vhwwes5s8
         k0I6Vm3tZKNOM3rlexjNJKSTd7E50KD39ct5gtpDlEmIJaG6w2ORfMAvqq7NRR1NG4xG
         eoOCwVxdDrFc6Spj/Hf/jkMgNWpHgeW+BG/fwfpADH5GydccdP036nWz6L/4BYxklOFk
         KqvA==
X-Forwarded-Encrypted: i=1; AKwUvByD9tG9atLx4PsMkKgNm6moN3yX7M0bJnGQwi0TGwV7dSu7yPBZSyYF2eVxnOxBEekim2ns7NvC6KGNttc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKybc5fqJ2aJGI49LCCl6tnjwRkq1NFAL3aWfh7BCjyFUzkP5PQ
	2XUXg+fIPhUElF3ZAS6icwmPSXIT+SVPJSqHpzfk8RVuj+B3v0yC8TpQvXJH4ephhIE=
X-Gm-Gg: AYBFou1a/xCVCG1Ik19KAjn7fCZT+jDd1Xx14t9UGYtpE562aGrlQSLDAWEcaPn+von
	Ibz/4CXt19aovmrzYaL+MdmzC9Rhd53v31OHGs5pDG5D0gTvPshSfiHQ5u+oFl6spQb7B7r2r6d
	lNTksLVjXGUEQ7a9YYoZy56TuqZmna2Bvl+dfFUO7DvzfuJ7t9DBmh38iJgkJEix4wL0u6Jwtvr
	YNGCHHwtF0lMiufgwHPkI4BJ+EcjiqFJRE2rJx0cSdqGHtEhq0IYBxRVub6tqOBxng/qTQxdbR9
	k66Wo/rKKAJKz5rtaH+G6DXO1coETblF+JNlwdjdfMvVGkQaMhW7IoNTMQhhDqPXtRosTHghbPL
	8OaViQ6L8mhtTdhpZzw086B4Ch2FIlzhEmj9/THzhlOQLp+yf6CSpkBZOzR7HkleGYxLSEwtWfZ
	yTyVaEnJmM9Oa71NgHWEuRKw4TZvqcb0TcyUaTEGsYyJ9E0qbG4M8l8dWpYQPMZXQKfGA6n8UqA
	mVkclVoFne48I+MvvqlXD2viqyjzecMBICYyoYq58jRdeDhh6khyoPAUy+1P51ojQfvinHewVW6
	lDbR8bCvjxhngEBzlot8hOzsmPTQpcASqgQyf3Y=
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ac16acfdd5mr241592915e9.11.1793627821995;
        Mon, 02 Nov 2026 05:57:01 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:01 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:50 +0000
Subject: [PATCH v2 4/9] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
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
Message-Id: <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593; i=bod@kernel.org;
 h=from:subject:message-id; bh=9Su/hrp4xXNhLORySBV74mmMzNRxA4TivC+heqLtS6U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6Jalz9XQqKDvt0dR0lQ7lPSaYS37WBDsZAvqv
 MK6PK5/8WmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpQAKCRAicTuzoY3I
 Ots8D/922kQlxHfwFZkbSTpEPLuETpxaOpt/qs/eYXUxVdAL0YuRvrqkX8CdEPIJzUXNUQSnPgz
 zkdUUqKV1DZkhRSS7eKOOfqFWOB+Kq8Wt8aZQK3OuLqVcPDxQxMMVO1J2FnkSVTT4ltdBddmQbO
 5HYYigYviM4zK7kno8nQj2OLGdQ5Npm9NezE99niA1gkW4sPhfGCEkHQq8lRXtmAuc8IE1xmJhA
 JXCQ3Ir+5ynSmsuF012mfJ3Wii8qwF/xhnkR82JMLTU9GZ2drtHvHWFh/Ga7T63uXQkBf5vzzCG
 ayApNVHf23to/7jHqzW3hl0l5pwBbiQUZl22dbCsu3rSlA++zltBr91OvntFFb0mDb56FX4xKlR
 rQYjupgCsrdb8WqOvMBhXBXxmxTpvUBxxASYY0hxG2eCWyo2w9HDbGn/xg+Tg1E8eanddVxBr1Q
 9uQ15RPXNdzUdqRM4Dwo8uVtl9wtJGI5mmuCyDdb+bERSJD6FE1qmE+5MFb+ZOIfOG9xw3TaZ9x
 LhwigVpajL1zRPgaEfKnNZbyrHXQ8V+ZVbBt5IdH6XpTELd3H1k0ug/oyp1H9uUsLgJ4sC5mk3j
 SwbDWVmtDVmFX1v7m3Xa26y7dN/vegjF93ZvY/B2ajulPNizZYmaR/1Ss2OYv4mHNqhdoNdmqux
 o3a/NNgOjgdh2ow==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in silicon enabling code to generate SOF and trigger the routine which
produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27db..6a538d825f78b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -34,6 +34,7 @@
 #define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
 
 #define CSID_TOP_IRQ_STATUS		0x7C
+#define		TOP_IRQ_RDI(rdi)		BIT(8 + (rdi))
 #define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
 
 #define CSID_TOP_IRQ_MASK		0x80
@@ -58,6 +59,9 @@
 #define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
 #define		RUP_DONE_IRQ_STATUS		BIT(23)
 
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0xF0 + 0x10 * (rdi))
+#define		INFO_INPUT_SOF_IRQ		BIT(12)
+
 #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
 
@@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = INFO_INPUT_SOF_IRQ;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	val = readl(csid->base + CSID_TOP_IRQ_MASK);
+
+	if (enable)
+		val |= TOP_IRQ_RDI(rdi);
+	else
+		val &= ~TOP_IRQ_RDI(rdi);
+
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	u8 i;
@@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+			if (val & INFO_INPUT_SOF_IRQ)
+				csid_sof_event(csid, i);
+
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
 				csid_subdev_reg_update(csid, i, true);

-- 
2.56.0

