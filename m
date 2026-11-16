Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826390;
	b=pAuyB/bP32PJrTouK8rlOISygQiQ2Y+rcgkTpdbJqUp2JJ/Ho607xSKs1To/n07m2PTg
	 Af+7TEVgvE/Nje4Yt5P8UkvRidZ6GM8hI//KmHdFmX0J9L0IIbTA1qNENIkLZOU42kVLD
	 AklWCD1/MILAnoho8V/DuZLtOEESeuoFPHHHzyFVsTic4Pe8puNXd+vs5kcZ2LxCRQwur
	 qLSBplKP49UgiIZXU3KuzqKiJXoyH2sFVsQ/Yd3Thgj7S/wpTjRluClXdGdqOnVTT2aB9
	 ljI2893WKCFmmvQbq9fuEyRUoJ1Vz+By/LXwpHr0a6TJ318rEVttENN3s8qhlsEu2Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
	b=grKhcFEHXPwZ9AFK/U2U4ZHr6SwkqYXS+jPCdko9/17L/czeRyKLx30Gu1zMr+MU79x1
	 Xug8+A9TsAT22pLkH9lklxae8pzwA6puWQ6QNBBSn0EzAVDBNbyWwGaxTU5Uav9vZMj0I
	 GUZDfvyjpC7oZG+RQMZTZrRFTj3v7S8hWdRsTqlRo80vGXYWVvtpzGGDIoCgsRPP7Dd63
	 F2ium/K93NXsrhKDeUNMvPZL0N7qYObMrvZQ4hcWPkpUDjOFv/eHfsz7yomMtFjMqGLaa
	 05WDYxjo/lZ3KGsWgjAyuQhLtFNMPNnHrcrDhLRE5FhqJH7AXq+BL992nS8T2HRxqFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uF3d0HFY;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82468606A8AF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82468606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uF3d0HFY
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8451a619da7so2827801a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826389; x=1795431189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
        b=uF3d0HFYUTmJUh5kgskypMm2Ak3E/pN05uZNT7oQ+q8AcsWOviUYcar4iAFxio3LRl
         W83h6YZyUt62Bejbm9gVitEJwl2mx3K01IeTqbJMCQATfVKgZAZT2Aw2IdBiZFwCTjTx
         exOF+gY+7p5OXk3V5aRqLR/Emo56toAYbG88Aox6O1ONkFNT6SkBwNAgV3fqQ+BmXbrX
         umlqmR8SpnerjC5JzNybWH0tBr+M9JB7CO39K49WCzefoJyGyYnF3XR72NdVQk14K9mE
         cgWuEPsQXPrcJK483oSrTkJuEbnltKu1b+NyTNkLQMJXMpPa63XBuhTBl2wFnvzzhSEm
         Jk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826389; x=1795431189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5hHzWFY8QOCU0RYZOwwYvawpWnrIbJa8B0acXUTVWs=;
        b=vqBh3t9m3p+c/gS8pIcPLLQatjVgv7Ailx2Nh73McF06Ct6JEjG0Y6Se4orM4sSBNv
         JDmPdarOl9UEZ3aioYzZsSPJ/WKV60+Z9jOWdDj/uAuIasH2WU7N1B+CnG+OlWrXjrpV
         pl7OC+lcUYs/mG9+jA/XMZ3Go2kuj7qz0kBjC5a4qsq0qBTJuX4H4aZ/vfI2aHTXFuGB
         Yl1m6e2CsTpbtJ1rZNDrPEvO5QizLOglfG+HfSjW8rihmkH2W7AvZRdstMqESg2zOYmq
         wDDtmIsFWMAN2axO4U1hATbDD5tkW/JAVofYwyIbq4Ved8eI3LogZop6UslFhjyXN4br
         zz0Q==
X-Forwarded-Encrypted: i=1; AL+hErEN2POm6ZOiqTIWohfi+c/iWQ4GTlKAb/tChosI8KDndLGStdf3cd0qEToK1BhIzSi/q/isv2ZW0/9wfmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iy5D8rdMBaOFxL7wx2Sj9PV1c7Qr2VBw6nWqIv036gQDG+AvE
	f4UEfXl5GtojrKxYWnMp76INCE6m5U6DlJ7iTedSni5BVPp92wmd813Y
X-Gm-Gg: AYBFou3/IUlwvuc+HEvXIUCpNAFYxb5I885Jkjm1qA1UYD5cCRWu/AiP9fHvCF6UaqO
	izuBNByRb7Sn0UOcc8PUwKNM6ys0eMXz70xKgV9TB+qu2rFtBwzSaz92rQ2PrAhMkeV7Hyj76uX
	WmPUxl9kbhhuyTQmPYWrt6o3pfGxNJorHhrr5ciecX0ErZgpHslT1+soDGlDwoYoHeGT8K1luO/
	t3sqc7cWI6HWyzCVaa37X7F/ON9UFWZTf2Fa2dAWD+8MuiY9nsoQkoV92BN5W2A3nQNCluuY/aG
	pYXJcbtxf9hKmPx24u13JUPQg+PLyXaYtUX6160Oe3obByVjvk/dzK8CfgX6/AMGUzAJtM47hMy
	7VXY3FU4tP+tj6GRAmfaqdUI54Eh1AodoiPU1e40FMMEIKQX/7DSXCk923WP+o6lzig7i4iZclL
	Kh7b3eBovchlbLwGylsmMZPwzD22emcHdtwDkzO26ulppCMFlyfd0OscDUIJQDDLXWTErWblaAp
	7Yvpm2wwU10j7A6qbeAv1WYttxcE29NxKlquQpbHcQMKuJwOhHDHfxXbz840Itducs6XSVIban1
	kh5gZGdHBUsNhSc2gMsNKO/N4M0UiD9gG6cTy/5W6b5vExGcvcfsiHfMTvYXwMOxdvk0LyVoqjp
	5Nr//4RrTjaNvqy1SRcgmoOQfXSsv9bOsDs1E4Tg/d4Bk3k5HQduq90pJaReBtW6DboqAtPYrlN
	0xRHhB21VqezLpb09HNPUz9gdF9qleN8QKezmRxnhdwcS3PFuW1FU=
X-Received: by 2002:a05:6830:4125:b0:862:c685:84b9 with SMTP id 46e09a7af769-862c685a077mr2638283a34.10.1794826389152;
        Mon, 16 Nov 2026 02:53:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862b08b8b5bsm5555546a34.5.2026.11.16.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 03:52:32 -0700
Subject: [PATCH v8 4/6] dmaengine: dw: extract hardware-LLP residue
 calculation
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
Message-Id: <20261116-submit-dw-dma-synchronize-v1-v8-4-4a82d64fcd1a@gmail.com>
References: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
In-Reply-To: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

From: Serge Semin <fancer.lancer@gmail.com>

Move the hardware-LLP residue calculation into
dwc_get_hard_llp_desc_residue() so it can be reused independently of
completion handling.

Keep the scanner's LLP snapshot, descriptor updates and early returns
unchanged. Only one transaction is active, so the helper updates its
cached residue directly without reporting a completion indication.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: extract the calculation for the single active virt-dma transaction]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 982a4b9bd678..504b6ddeccd4 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -214,6 +214,30 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
+static void dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
+					  struct dw_desc *desc, dma_addr_t llp)
+{
+	struct dw_desc *child;
+
+	desc->residue = desc->total_len;
+	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
+		return;
+
+	if (lli_read(desc, llp) == llp) {
+		desc->residue -= dwc_get_sent(dwc);
+		return;
+	}
+
+	desc->residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, vd.node) {
+		if (lli_read(child, llp) == llp) {
+			desc->residue -= dwc_get_sent(dwc);
+			return;
+		}
+		desc->residue -= child->len;
+	}
+}
+
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	struct dw_desc *desc;
@@ -270,23 +294,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (!desc || test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags))
 		return;
 
-	desc->residue = desc->total_len;
-	if (desc->vd.tx.phys == DWC_LLP_LOC(llp))
-		return;
-
-	if (lli_read(desc, llp) == llp) {
-		desc->residue -= dwc_get_sent(dwc);
-		return;
-	}
-
-	desc->residue -= desc->len;
-	list_for_each_entry(child, &desc->tx_list, vd.node) {
-		if (lli_read(child, llp) == llp) {
-			desc->residue -= dwc_get_sent(dwc);
-			return;
-		}
-		desc->residue -= child->len;
-	}
+	dwc_get_hard_llp_desc_residue(dwc, desc, llp);
 }
 
 static inline void dwc_dump_lli(struct dw_dma_chan *dwc, struct dw_desc *desc)

-- 
2.53.0

