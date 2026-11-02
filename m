Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627827;
	b=lowhIub+xNZcl+q1dr1t0fjtPVUz8j6rGtmyRHruj41CTIxBZVX5R3Ou1tbi2lEV9rBc
	 SDyjgYlpQS0WwheEw6PGR8Fvok7ryVA1ccqgLF1rsNX354lcCGo0hf8PwaKe0j1PYq3yL
	 VUqNomG7TY6gZI/j+xt8T6L9fl4NPYfm0Ucwye3qTe8SFTxOA2I2ID6b3D43pHRz/6hK2
	 JSrbRuleFKpc+eDP5nAWa2zW5E8bTJpZIg2NFXcV0v6Tx6dYxrEBEcbpsyohL4znLunw6
	 qRMFvoYmh20ZbGIv+B8vom0BBIiGdbDuWWS1O34YrJnpTlfScybqeT14MJE7/RjN91Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
	b=48zxalIALnDN4ajgsDEB8U/YbEeyi44TGH3dnPkmSotTyZgPSKS8Z1NMTgESkmrOSzoW
	 P4wHH8gfT5kJzBmX1X8/ezih1LhQ71ZGe1ijlwpf9Uwa7lHkg15KwmHLnIKJohcUTukk7
	 7HStdBMhdywfO/UrEcXoTTI8T7hC1G1En/AA09PfmWTUr7l2uQloNZsDZrvJS6Sy2TZO0
	 qr0B7cbH7CZsBBjVPC9kqTjH5AXbE2EBW3I0kdCrKBVch7RY5L+5waMBuFkq/Px9rwlck
	 UVDebM+JV7j77rz06zLKgMiPOsG/R7Log6+TS+oab4T4nZER8+twMO8JijshBHsIVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aEzKUd0L;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F4C60A3832
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F4C60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aEzKUd0L
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so20298045e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627824; x=1794232624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
        b=aEzKUd0LLcWYh4KCjvmLuI3NSY4fNBIhjgSk0m+PfrEDsLXnvKZeT1nz0kpDeGS+L2
         z7u52793lfb7BoCPCcgOf7t/H+JZTAQ/il2OzjrYK6SVhbp/DJWIrvBgrebrtoxbYmes
         Bp9gPypSx7B/Yyb4WAgnh9MHLhw9PeD1YeWqHNbfKosBdIUl2++m/8xjxQKd8EwcSrz+
         5KUfaYvLqcx61z6GpqSFYAPNCSXQl1QNVFaJI7zwJkQw7E8e/+jVGwz4rr1OLt9CThy7
         U39VNOe00BPS/drx2UYDMz4gycZq/4c83k3ij+7hZSoD0bMZLQLnROF/QD1wbWNsdUKd
         hFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627824; x=1794232624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
        b=uLqKXciYDQDOtjj16Fii2lPCnG6WxiBCk7vBiGJAOBJ+Gmt+4u4YM12sC6lPOBam09
         IJLLoGSReDaAqkCBy4KjkNCGwv2mUcL93qJue32uWMRJkehOFtxIm+iXsU704rcvgohI
         0hJQaEvHcZ6s2OOnk/eX6YtozNJiqpmpvR7dqedae1L4lzs3LwY70JWwl+pt4UWSgUzx
         jGvhlwB7850phl6I+FpRhQ+CrDhkfbe71Wr23C9b9/v+v3ljLysO6UlLR5Zh5TMHC+Fz
         GPF1rYjWsuOlO49dhww0mfqEaSy7OZrgeWZ2+/r/ki7BSFpjy24ZBV6ojl7xFDSt5IBH
         Rmdw==
X-Forwarded-Encrypted: i=1; AKwUvBy9Mzaag6OYo+Fery2eo02i4POIGKKEqKLZPZmdaXEl8oc8h7scJRth/ZwEUA+jryDL3qdoVZ4p70qrW98=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyey3rZDI9UgfCL41hxNDQ6+NjOOn26QJfkuz2nvAe/uDdPk1O
	Jlr/6wwjLpIcryHmGFPi8snlC12WTpq8uBIcFeTdM1liB1WzKWQ8T0VSc1DR2npH8x4=
X-Gm-Gg: AYBFou0FeATOsV85XhzyHSXPSJIial0LPE8A0tmBunSdOLHszurX/7N7lFUTXrMZKg6
	kTNbU4Re1gAdeiublVGtvL8jbOLRWH7vXOHlQdQyD5oBV4a8RGD1oUpAw133C7aq8rwLasfEk1g
	iH2cTtOLlR5GPQj+npm+rAALPNMMmWyl+BwiKko5aWFCsqmtC54mBFMjbp2AAguWsAO3bDjcqIj
	iN//fXEI/u1iapVVXKWl2ElzqIWwNtQp/r+XosWtlkPRsQE2JM3e6nTHp+e/i/8egSUT8U1mIKz
	DVznwkc1EroIfoHP8Q/zYg2t6H/H0628qa1q+qwN+yhL1xpuNcEobnouwUKu2cF7918D7gR/qXS
	LKOc/PC9A/aaA1gLCzfp/rNv5lajEY9aKi/UIiVWSQF+MCE9gTx63HFE715s31BL0ZRI6mjGpqS
	9I8RbNvyhcbWnhJa4htyLb24KIXyLTchA3pp0SlfMX82TxQd/xoVGwV82826PVONPgGD1NK/MA4
	TrOhope6mvwGWfcyyXb15Nlx+P3iB66F9Si6XYEVFHy6PJbJhLv6krZXDjYclFiGe7jf+5eYJuM
	12q9OQpOXnsPS1viQQ==
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr224682515e9.31.1793627824537;
        Mon, 02 Nov 2026 05:57:04 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:03 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:52 +0000
Subject: [PATCH v2 6/9] media: qcom: camss: csid-gen2: Enable RDI SOF
 tracking
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
Message-Id: <20261102-v4l2-frame-sync-v2-6-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=bod@kernel.org;
 h=from:subject:message-id; bh=JfR+fNInU7PvF5XtlHk/pVeaxutrzq9CX2WhXWJJ9WE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JamS1/LWONiOT94hoUv29jshWGdAlBEiTrUs
 cthxjtbbiaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpgAKCRAicTuzoY3I
 OoFnD/0SyrVl/h2OVTPe4RwwjfsaCtRmmwgsVZU5wOmrLbky5alPlEsooEnIGyFj2BodbCd0ADA
 ggRG5n0M+zWHA9+Z6QLUUJGP0u5XRp3ZSqSucngto4yUCOlfM50V8pn/XMsneZliQSrXUKIdf3W
 t7IkHxYq77+Ionm3lVDU9WF74fbK2t9GitNhKCS1xFJba4vZ1E+FNt0+rKWDaBY7heJelMrI6xZ
 ihxMqm8EBomr/b1ZWgKQGgVtDZsI4TGBYb488BXGY1isPXPhyNRPT2c8DqFcjGDvuIuXKxBL+ic
 AosUAa1eU42XMS/DUs0XS1DDf/Ch6rjk3Yy9wb606yNxNQI/6y2BEajd7yQDSUVPBJxkE3nHDNc
 7qvgrUYhgTgcXeWQcWI58mtxWJMokmtCGrWW58+81JG/1SNJii9Dyy/9/j0SMk01l3UMh0zkC+f
 c8ra93yXP3WrI93weV6b1Yi0VJ+Ukvw2P+md9fAZVg4we2Xe2/Zrtj10FzRWGcL/tNKqCwpXUvx
 EvpEqo48Xd+Oz9/YRP/VZvfNkDqeBo9X+HnNNXcsAfTJhy1st3+xdzP+cJkuwUH3618WEtjJVCT
 83G+YhBdHlw1KHdftZ/HcG4tSPLWiUurKf1lFxgFcnJdr0lR26DiefvTLEhfHGNEp6ihdcN3LdQ
 IcnjNXyRon/jQPQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC
'gen2' CSID. Covers SDM845, SDM670, SM6150, SM6350, SC7280, SC8280XP,
SM8250.

Tested thoroughly on sm8250 only for now. An additional patch is required
in camss.c to enable this functionality on a per-SoC basis.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8250
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aaa..a351ac4b91728 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -38,6 +38,8 @@
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)		((csid_is_lite(csid) ? 0x3C : 0x4C) \
 						 + 0x10 * (rdi))
 
+#define		RDIN_IRQ_INFO_INPUT_SOF		BIT(12)
+
 #define CSID_TOP_IRQ_STATUS	0x70
 #define		TOP_IRQ_STATUS_RESET_DONE 0
 #define CSID_TOP_IRQ_MASK	0x74
@@ -322,6 +324,16 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = RDIN_IRQ_INFO_INPUT_SOF;
+
+	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
@@ -335,6 +347,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -373,6 +386,8 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (csid->phy.en_vc & BIT(i)) {
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+			if (val & RDIN_IRQ_INFO_INPUT_SOF)
+				csid_sof_event(csid, i);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.56.0

