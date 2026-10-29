Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267738;
	b=JZBYQqEQYDElluFqieT3+z0w5sCb1/Fq0UyuZDyeUp1c75z1Cdp7VKwOgWpjhD4Pn570
	 bkusnTgsEoQVGIDBi7/vIWsoNkBiTVPhg2gTAJkDNzAXIvdLrd7ItyDfOkgQ3sWGam/GM
	 zEy5MJ9a1Z1IQnarqwzVLwwz9PFax3b3pjEBfayOBnj670tZ2Dx5254x9Kofoyl3yTSFB
	 v8VVPjEHvraGfGVQ7XNv5rXfhkapaJuZ1huWU5qdrRmG9Ed8wyXjAG3f3QMIpaQbrvw+Z
	 qbqKJXKav99xqkRHt7lkJaBxd/+i7oNwiT8l9gAfCer+ecqvOjfR6TMiGNA+XCRiVmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
	b=K9EZiaSvTtTwRVS4NFQM2BNbEsILGUE1/KvApDI4jtF22qsfIO+2V9aybBVD8/0QEbpA
	 u9YpcJCrgJ6KMF3D1f/V1b/ZhpPRFtghD3XSCX8+HiJEB3ybf/EuqyUfsY+BfbYP8tpHd
	 YgGnjzGzJtST+fVL7tNHu2bK6U81pp4bwkYu5prLdE8//pRFDR/Co2tUZ2w545sP1yEJw
	 6CA1NQlPObAYwveB+uY43FKiXxtttF/fNnfb4H0MA+jtgt/j6z3nvYY4Bsq62E5HtNqc7
	 W44AGJTHJLsZyBFVBVtHGBK21mMfYn1P8l06s1zSt9AC/aqF/8kAZfTpVNeKx+i9x7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AOsYttvM;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E105A60A5BC6
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E105A60A5BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AOsYttvM
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so12037295e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267736; x=1793872536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
        b=AOsYttvMzASirckNj31yHygQfa8Hzj5ULE/Grk8bspdy+doWgCRd8DGxEmbofrw4La
         yPfp3cavNNm57NDb5FNWXJKOQB/BxAyIt1onF5QZ9G+fXYo/cx1su2CWU6AiNrCHIPl+
         fY0UOs1ZwMRbzeImWj0ryR4ST6F2Bs5PiJuvENV9GyXTkTzE+RA2DaOhobp5QPnl9PIZ
         YrV0+yUCrT5aoAvQm3o8Hmt3GSON7Y9JY4uD4Xy6zoMb0OKHfTcx7y4vc0jq39wwyptZ
         Bhlk5Mk59465RSLgaUSvbAWE1bzd0Z7yrVtMu8lEMVQcWjYVLJNi1GYvxEuVjcirUqbx
         LRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267736; x=1793872536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
        b=e33Aja3DcURZZkX0kbrPzuUc/+E5etK284KEhDioQuYzqE3YuwKtCnCb+YigvWwzUq
         btNWzTm7lcXniP6cpO4GUqB0P/2eTGL2Yt+8V7LhXEgoltyJXmyZFAhDXNcy3j0VMSOw
         7u9Kdn3a3WkXpEQOoezjnZzOzdhJaZ5ZrIOBeVe5Dknh+bGQxocWo8Hs+N19ZMtt+pP4
         jz+EP1X/y6hG0+MHJaz/s2qwDXu0sugrGgXA8Y7NnEZC+t6TIXkXXk0TyP4K/Fulm/Pf
         nx0nlw+Ho6OKlafxx5lkYM2k5OMlGyQPSWwUR0Acz5YktVbWSFCIonl7FudoEcE5DYGX
         /SlA==
X-Forwarded-Encrypted: i=1; AKwUvByUP3zqZqTsKWmDpRH1SqNBcWBAv0+aFb2SKlxr9ccihGtJQE4PE5bazVXxTYTgPlog5Wi5tYb8QToDGlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6VlBLpMt+YnWJU/xT3pHE+2ZkgUPxTpqmT/m8a/bj+ac/gMrh
	tRWKsgtRqCOtxBrkqtDHBNQi7CA22YWB+VDzL1AS9TLRANN51dZpsdg/svrnSuu1l1g=
X-Gm-Gg: AYBFou3/8B7xXQOsRFtH1XSluFidHll54NYM/VmcQaR3AEWgRmG3qCcrg80fKHPCbHD
	44Wh1Zf6fC35rQVgT/TSwS9CyXMzskKxtiH8pnYuCT8riHCIYhlBvuGUyQ0B8UACDrJLH56IDb1
	621YkBY6qTpnJeIvx3PXVwr1mBQHTvmDEwnn/OddjynlPMehKAeWS/zDq+tCqq9mmgg7AlQH0YT
	0uo6L5tEdB1CkMVIDQuviLgBNTHjiEp+dCYXctiFYyXzBWEODwAPBdklKyYMzXOsWyN6SuMHy4V
	zMh/Tdepv+MJZXTWLgq7L0F1Wxv0QfU+en9xJ8zT65XH0mPDU716LKPluDhvfPalwiDipt2iq+H
	JMImPQi4MexdeC3a9Zuw9lFyc/KAkAvkferGALzuEFcihviE5onZeYXM0CyL5Ck19/beidSitzD
	nbDWTrFqBXEZdmw2GUcAzXmiiaI9W2MZMIA2gkngdwx9M2V07oFp074TI/eaW6pkiTp51tWwScl
	v+KJbZCmOkqYz7ORCFHTcfrib12KqEoCqEY46fryP6O4sJENRiKDwa1ocQVaEGjx0/ozwclAGlt
	K5dTfnrWhX/gbrifYII=
X-Received: by 2002:a05:600c:c08d:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a9678c2c8cmr85135935e9.23.1793267736309;
        Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:18 +0000
Subject: [PATCH 09/14] media: qcom: camss: csid-gen2: Enable RDI SOF
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
Message-Id: <20261029-v4l2-frame-sync-v1-9-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=bod@kernel.org;
 h=from:subject:message-id; bh=JfR+fNInU7PvF5XtlHk/pVeaxutrzq9CX2WhXWJJ9WE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgMWwO/C4aCqtf/PsjoalxGqQoyPNTxDfkh4
 4jOqZA2CciJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDAAKCRAicTuzoY3I
 OrIUD/0fQ8hbmWZ4pfadaormFipAx4Wysnqa+eFVSFPwk5sTi7qo2ysaSVkxc1Lza0fTwKCZkuv
 nbPam0WishR4FxP6BynfKq/xKBgVrQAGVy/Qdo2P7DB6TFIx7gvf99oPMdBSjUjVUOE2azkD0U8
 gS45TQinNzBWPWvWs9ohMFsyPL0kcQH36u2/VZg9Aw+T1FVcvDeP9pn/lAakvkol/kGkaUY6TLg
 XUcoQWMUhoJq8m/QcdYk8TZ8Qn62RNem4YpM4aKV33iX3csHKK4Qzocu4I+ZC/AqflzxaoEXTJq
 pr3w/EMDZtuO+VvnhQ3EOO0wD+4aSi45Mmf2ZJCKHX0C3qR718q+KmBVWGdb1mq8OvZfuIeEobG
 hVOTG++tGjzxzpfRUW4HfHxGKT3xLdzZQkU0ODyxVe95M3ZbUfUXTgaCyvjHLqsFvKZXObHcw1A
 Rc0BfwhmrP6sF8q3ZLnlIRfObFGWRqirX1vS+O09KbuRv15iz0+zpBnsi8stGhLLDwykYWKaBpj
 MGxRTRiIrbQOCjX7GyCfxD6UftlSaVMD6M9krvVyHkNBVvHkMcyCzxB0wWXn1bpZDEnYoPYO/8E
 v2EnPSZkOtHevwKnycsYxHvEgj9fiz5a1od9vqRZY4Oe9foGFSe91VLfioFfVNwvM7014F0EVHM
 7ejthoyFufZYCTg==
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

