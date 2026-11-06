Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949975;
	b=FVheB6DqJwgUK9nBulQcuIvbZfZX/Pin4j180dC48xDYCmy5I3/Fs0YvubwUqkhOWGXU
	 noSeVPEcW/myRmDUIWwn/948MiiLYeX/8IinLk4RfuLcex9E6RMnXYh1PTV+hfQUBYazc
	 YT3Cu/mFlE2icmu+TeLPd9VHuEN4kPXrpUtxZMMlenHjcmWQdcay/yJUxPD2/ta1ybM6V
	 q5hAO/enpmuCxu8ICoAzZOQ/sEps7hMFiXfrE8/RN9N3CI5Qk/AllhGlnL27Fv1MkxaBT
	 2XSb44fMEvZ1MNUHIhd2MUA53WrTLAaCR74YxRklZaYHD+mPlsk2PvnDEFLB7zwuOWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HtJkfenG8lvFVEaE6QRe6qjgr1soq+sJRZ57WrAL0YE=;
	b=16+MrjrpulzL8LcISuuNcHFzPjvYFqOIjNPvRNFcXRVcgjlIvgwELIQxu1v9yiCrOmUU
	 G9VKFOioEa5DeD10o/HpCS38hKVaXpEjL5rak3QcKMiLNGvMZlgyrOBMz33Z2oOH43OiU
	 AahdarJwf9zwkfnHEsEGe/ZSvp8ASUE1JBGMuje7vPaJJlgCweqkUVwd6boa22nQ66a1A
	 sZiGGalqDR52N+w+oHPISpfAwRFGqzHXA4kXGuzHXE6VlRGBFLPHNQTre9LNplNlHAObE
	 xcpWeXng3wiL+HoTyVksU/+9W4CVyH8sMrckeztxJopRt25bQ+avfuVD1q9Oz0G5jjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmb9c61q;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182E7606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 182E7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmb9c61q
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso136491a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949974; x=1794554774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtJkfenG8lvFVEaE6QRe6qjgr1soq+sJRZ57WrAL0YE=;
        b=nmb9c61qzXEgGvlgzwcJ/PwxYR1fZX/IynQhLVwOBco8DAhpuncz+xKDdrOBc94Mwt
         VVBoqeIErKjj/mgyanew6pk8us7e3/dyEYcWFU6QUcPvCj8ZnZDN3iOs8dPhvstU9YVg
         T/GBGB3RuBmWGfGv93MpaZWaR9yaDRTMhWNeler0YDpv0ZVwGGr/AgZQn6U5BXWahQDY
         uTd3WtwqBUrxzYMhOExJYXNouB0sLQkvV+bxBuQ8H/ry1KTwQXokYBC3IU/Pr/ydRRFy
         7WKaFACHmYdLbz4tXpA+5ZBBnhWdGVFQBg9NcHxKSLuGpZxnhtUqYcjJgrZ5jXrQ+m32
         //mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949974; x=1794554774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtJkfenG8lvFVEaE6QRe6qjgr1soq+sJRZ57WrAL0YE=;
        b=YC+pS8jzAKXseK1eH5KfI9ewWOWu1QF/bpjvcPXXWNVQ5MP3NTYBXHwEX4o9C74Rrm
         VvsQBnfQMaWpkPwz1S08CW8rJJ8/EIa3U2CmNbX4FhJF/L+acyaNYOumBIV5XFo1fZ7n
         r6RQaZk0AhdcaSF2DEqkAFaXChaqO5uvtPjCpBSyEttpTphqa+mHAgNAlnRr5zyxwzIt
         9VJu+TnUsiMC49cYBc4tbBLv0DN+LTbsURmFeipbu0+PHrlmrmPsHr90VLvXBz+ncfwq
         vxVNZePlqYh/deV3HRggUVUPPfLjWgTHg1vHKJ9A0DeY6LEGuLk1NJcXdMdjCTd8GZGS
         DIEg==
X-Forwarded-Encrypted: i=1; AL+hErGjzjoJin7Dgvoe/CAF0BqdENgCBcHKroABLnIVJtP45tN7dJWF5TMBIu5RKCSIs9q+cqiYdFfUOD+1Fmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TpdkY0xanu9Ffak6OGI8yIoqxjZsaa1sBQq04cjFvX/zvAx7C
	iAxPZ13djVxjgxp6yUAHeRnBfxi8AGSsseVtDnvTdbQjOMKCpxP4WxLQ
X-Gm-Gg: AYBFou06h/OwNWz8IH5iXq+n1uvyc2PZfSsoNjtT66uEoGKUJcFveEwkCh+LQPxUBkW
	CMoCZF/DsPUIVU80jUR7FTDiMI/dpAVdWrSBjZp9G+rI0remPglucWbC+C7b+mJu+O3XsVMC7bP
	9a092bKEV8A5OrZDVZSjhOFmh0LwBqKnLhPm4+2gS9twpbGtz6qSPjF9Vb8oufhPr3lHSwv5gEx
	NurC3GG+X5nCxU3fScP4SEekzWnQzyZS2rfqbdHwIpQhU/8ePpUfF+3QpFVQmtA/cUEU7whpqTA
	my4oLAoZuyaU4w2pQCCWynOWan1JGLw2e0qj7ZjZAgIE4A0gg7VohkpcTsWVCA6kYabcvyU+HgZ
	mdrOWGmWLQjs9xIWhexqCbe7tiiqlv06oK5W255fpFMvoKimLHj0hY6WvWQ/lcoNccZiZEYs3EV
	y/xiw5MMNofDa+TMWI13jTAcd63AzirU0bcoOY5phWnycJOtZpbSB+cULsKs7D0A4PV7QCLG52X
	SHeO+GlX1VuU4cF6mtbsj28EWy+HO+9zF6TMyMCdybzubMUdtSCzHEkjMC3ICo2DIBcgHgVb59t
	P1/IoQ5HUwrmjIzUTof3C8GpgQDQjxTTpHEkEzTE1XBo6FTyYLbsKtJ9QISO47C0v21nTw/ZqA=
	=
X-Received: by 2002:a17:90b:2649:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3b0db723881mr1592667a91.60.1793949974260;
        Thu, 05 Nov 2026 23:26:14 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d89976sm2633715ad.66.2026.11.05.23.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:26:14 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dmaengine: pl08x: Release the reset before reading registers
Date: Fri,  6 Nov 2026 15:25:58 +0800
Message-ID: <20261106072602.77560-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106072602.77560-1-mmyangfl@gmail.com>
References: <20261106072602.77560-1-mmyangfl@gmail.com>
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

amba_read_periphid() happens to release the reset. A node that carries
arm,primecell-periphid never reaches it. Take the reset shared and
release it ourselves.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/dma/amba-pl08x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 543c2eb8cfa8..9f5e4f5fb877 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -75,6 +75,7 @@
 #include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/amba/pl080.h>
@@ -2695,6 +2696,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	struct pl08x_driver_data *pl08x;
 	struct vendor_data *vd = id->data;
 	struct device_node *np = adev->dev.of_node;
+	struct reset_control *rst;
 	u32 tsfr_size;
 	int ret = 0;
 	int i;
@@ -2725,6 +2727,13 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		goto out_no_ioremap;
 	}
 
+	/* Release the reset before reading registers */
+	rst = devm_reset_control_get_optional_shared_deasserted(&adev->dev, NULL);
+	if (IS_ERR(rst)) {
+		ret = PTR_ERR(rst);
+		goto out_no_platdata;
+	}
+
 	if (vd->ftdmac020) {
 		u32 val;
 
-- 
2.53.0

