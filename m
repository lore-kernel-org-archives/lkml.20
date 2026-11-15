Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727186;
	b=johFGtcgmDuAvneleya+WkaOfHZB2lfu9FrsTr+2psvfKfWSuiuTJjqT3C2JPBPe2G8n
	 /eRaD4Zsb8AgDv1liW1cAzhsgAK9vSAq1eGHfbabANmwkcFFO0Kp27jcdDqHJsVm4yqC6
	 K2eOa/0/3rFczWxM6bDMMoWy53XmWKQkMS7ac4aGcssnwT5K15Ki1nhCfqg+mpCQczyht
	 ihtcFwONkAWTHRkLw8giajJIkxkR+RVzWWR2P9cm1BuiNFeAIWL5TFKMorSivnabDx/rA
	 AaPt1lYSpuqIdQBFQClNc/kddS+/36Ramnwl5YmTfPeac0jjER+6bfZl2mFwOPmxOog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zAy+2tfRvtTehCJ0q+J+a30RAb0TsAI0p7oefFRsmAo=;
	b=AuYdK7nFLSJueDXSMdTLGgOOhgL9dsRFEr+D08PKmdh/n9HUr11Bs2C0qTkaMe/lsJdG
	 WujSOtzioWf7riVSwZOFkc7M5ueMZKAuJpo06p+utbtjkWCfdnqPPoYfzay7F7Xndzdx8
	 vcldNWch5IDNHs+3qKSCmZ1MMgjhTy2pgyWAsLuq3bbpApC6OQBzJsBiZ2mK0QVAO5cIX
	 +Yk1PQ8bNOGoY7Gtuff2LCwwp4JV+HZfQ3y+8K1+hYZKgtHbHjcEaxK+hDWbTKMSIwBae
	 4TFCFq2O4ej6gdmr97HNDkecapA/mu3sw7Wr+2/Wm6vlRZqcaZHctUaRDSzL+tJlZ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRpjmk3n;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72807606A8B1
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72807606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRpjmk3n
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71aed54d4c5so64439eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727185; x=1795331985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAy+2tfRvtTehCJ0q+J+a30RAb0TsAI0p7oefFRsmAo=;
        b=zRpjmk3nu6KU3OeTu9Y/9TNQULkJywoEkcO/jCfYyezVOF/MwUFS3CY8EsOdj1uE13
         co9br8t/leLffNqDJmvzTBe9yRnr8QF1il36Wo1IgSlZJNVOdbaC11e5BJEUwMenWtMq
         KJNwRg2K4jqBInXVCZQcu4oV2zvJ4axzj+8cTvrpPxuzdNE6R4OUpNyK6LNbnmFhAKUt
         Vi8kU5ur2Kve8T+D/mxSLx3FvdoyseeRjBJEPhye8T/1nSmgAEpfINhp862EW4DTvjZZ
         mYdQ7b0/TT43XOtCbphAZw0JKlPBwy/G0muvcMUAAdma57NLM7YKl03Ar96nh9r6bizU
         deqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727185; x=1795331985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAy+2tfRvtTehCJ0q+J+a30RAb0TsAI0p7oefFRsmAo=;
        b=JRmPipQ60YSxKiF0OizamsrMcYrqw0KJdAFaHK8OUNA2JfKdorZLHczi/mLWxQUXnS
         cqUV/w3z/dz8jvCI8Bl1499Sk9R16I9DtVryc0MwbRziTj2GeymyQfCXudXC3sss0b7z
         QvfVrxeZ2RitWncsVn48w6jEiQtaPrDG5HrN1sr6aJcYWFsNGUZMUT+0Y1mdgSlZTmtP
         R1i4lHdOhlOt3WbxNjd5YX7HwuaTk1phD/5+sHW/7QxZx0cAXLS+gvUyMi2aDWBwE0wI
         1aX78UoCRQQxxVgw81TbvzkmzBfVAXFA3WtE4v073U0UqoSna9zwKzQhtQU5AaKbi/96
         53BQ==
X-Forwarded-Encrypted: i=1; AL+hErHBXeuF8JlpEHXFR5JNlQw/dR/j/dBe7zcp6teNFmfLRVTycnzEzoWG+atlxGJLFcFERWWOfBTzkwZ5nRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jhWiJWutDYIwGvA64Yz2OySQD1RHZd0sDRB1VnyMLhb6GMnYO
	OLrt2kCG4ZH46nP48t7Lzgn0wFnZE940rQS45ipIbFYIBBKF8Q53/Tjv
X-Gm-Gg: AYBFou2jA1gwwrT7DeJ44CMbIE1lJZ3tYn/E9CukYkQtTgQ1UiuFwtdjtD6SBb2+7fP
	L9qrUqjyBJKEz6NfK7qgqXpkMyPVIWahqA0kUEidNU8avgY+nAp2QycaRu9xxEty9vvS56RWXSc
	2TUki9dzod9l6WQi+2YbjZBgZysIu2Cft1AcTt/RqUML2iLSpbf8S/DNv3BoIWKGqeG0gFOfFGE
	DrJXtWyIaUEKPnle/oR1AwzRhL9itpIQR4eM/yQE6nkXWczleW1joneNRH9U9itUAZcIlLI42IT
	5ipeWfTvS+wx6Bg8xBPr1qc9zyMP2MsalLu8ATH2gt8AITMMDLCwSALL208DUjwL6yj9DVG2x0b
	7oNnHgAcnMSNwKmR+wvIg+v0UidWcBgNC13nEcIaF/IrgUGsWmx7jzyw70iGBKi3eXyofi3gmvU
	nS6DWyWQ20LsUhzqb5SzUci5zilen0IW3RJwQUGtB2vMi6cizHoaiqi7FePDfAROGf7D9DKnscO
	KYVgiuHOKNb6l9MOMyQXfdJSyQxOfQHobXw7sslc5xfP5wiOzdze/zbMewCU5jyx5ojzypB9lzH
	c9rmTiGtEgz3ux10YVfDwJ4hq8pJORYS7Gp0lJtbyjEUpygWW94StSs1uEALpMp0ac1+XoMeBSJ
	Zylspf/9q2/Asx0GvOMzCRxpOwNPtAwh6iz0K3LmYdtWdSNzlB8I/zatpNia2uSACl336RJgCMI
	8zmcvkgL03y0uToTzN1mNqWzuPtjabYCAWZz04lanWR8PgJqXRU0A=
X-Received: by 2002:a05:6820:c0d9:20b0:71a:e7c1:d1bb with SMTP id 006d021491bc7-71ae7c1dd38mr505443eaf.71.1794727185421;
        Sat, 14 Nov 2026 23:19:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:37 -0700
Subject: [PATCH v7 04/10] dmaengine: dw: extract hardware-LLP residue
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-4-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

Move the hardware-LLP residue calculation into
dwc_get_hard_llp_desc_residue() so it can be reused independently of
completion handling.

Keep the scanner's LLP snapshot, descriptor updates and early returns
unchanged. The helper reports whether it found the current descriptor,
including when that descriptor has zero residue, rather than using the
residue value as a completion indication.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: extract the calculation without changing scanner behavior]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 58 +++++++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 2d69fab06601..5a1caca7ad68 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -267,6 +267,38 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
+static bool dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
+				       struct dw_desc *desc, dma_addr_t llp)
+{
+	struct dw_desc *child;
+
+	/* Initial residue value */
+	desc->residue = desc->total_len;
+
+	/* Check first descriptors addr */
+	if (desc->txd.phys == DWC_LLP_LOC(llp))
+		return true;
+
+	/* Check first descriptors llp */
+	if (lli_read(desc, llp) == llp) {
+		/* This one is currently in progress */
+		desc->residue -= dwc_get_sent(dwc);
+		return true;
+	}
+
+	desc->residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, desc_node) {
+		if (lli_read(child, llp) == llp) {
+			/* Currently in progress */
+			desc->residue -= dwc_get_sent(dwc);
+			return true;
+		}
+		desc->residue -= child->len;
+	}
+
+	return false;
+}
+
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	dma_addr_t llp;
@@ -354,34 +386,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "%s: llp=%pad\n", __func__, &llp);
 
 	list_for_each_entry_safe(desc, _desc, &dwc->active_list, desc_node) {
-		/* Initial residue value */
-		desc->residue = desc->total_len;
-
-		/* Check first descriptors addr */
-		if (desc->txd.phys == DWC_LLP_LOC(llp)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-
-		/* Check first descriptors llp */
-		if (lli_read(desc, llp) == llp) {
-			/* This one is currently in progress */
-			desc->residue -= dwc_get_sent(dwc);
+		if (dwc_get_hard_llp_desc_residue(dwc, desc, llp)) {
 			spin_unlock_irqrestore(&dwc->lock, flags);
 			return;
 		}
-
-		desc->residue -= desc->len;
-		list_for_each_entry(child, &desc->tx_list, desc_node) {
-			if (lli_read(child, llp) == llp) {
-				/* Currently in progress */
-				desc->residue -= dwc_get_sent(dwc);
-				spin_unlock_irqrestore(&dwc->lock, flags);
-				return;
-			}
-			desc->residue -= child->len;
-		}
-
 	}
 
 	/* Residue describes source reads; only RAW.XFER completes a transfer. */

-- 
2.53.0

