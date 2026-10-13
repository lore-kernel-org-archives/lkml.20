Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C583D9DDB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883151; cv=none; b=me3WQtJliDI/7XvZXpIEFgMhQ/QbiiicE9oTs0vvCTT2HCSaJXOchG/HzHzI8d5BcwX8Ql1RO/N1NML5VggJDPy5fpbicwAEpjKBbdhiWFv5SdyC50IlaSxrtZGV0F7iQf5Cpbr+JpM6aGxMshUCaJeUyuzOHI0fgcMSodSN13A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883151; c=relaxed/simple;
	bh=cP8IeFdxUJbvzxVL94FhkpC9ulhfQWnYw/ZdjHJG40M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RsSY7UJyKVXPT+JuqME6h2b4WTyU9bMsscqGuL3GmZQvFOI8iFxVIxvpkM9SibSE02Ulr9w4KgDWaOLqec1hU0dONWxWW1SWlxLguWCp9dxJAIOsFgyboSC1TLzxagmQAqvCGrNyZil+dtmyDyNZnmEZ4j1USZUH67FvIMl/h1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKJJMuYe; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKJJMuYe"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-885cd98d226so1169276b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883149; x=1792487949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WIM0K+EJDsmmn42t1zm2SXiTTg7zUFvkgTfGvuF3T0=;
        b=IKJJMuYe06QNMN1Vwz3XfFEnOrrkx7i70IY8Hg1VYRGFly+G28VApRguoARloXaGYk
         nZoMxx/XIypVAp0kXlG2A2kgrAsfl1O/WqprXkxLeIsD3ExSDH7PGBzEZvZd8GUQoYkT
         TwTMJ0TV8JVuZ7izzceHewhzxMgVBbMv4IGSHf44+maqJp/PBcCj4H7xBPparg26dAAC
         bO5NbbOcOdGUL0RNebDmeL+jQ+yBXyetZ3vLGKI5JVyWBzA/sNFH3RzY4LwWPNOx0v8p
         nfyZwLDV2UuDPhOFCvXPae9kzkUpxV+EmvpP8RiGZop9nPCp+IlFgB3ybQZofCCT5auh
         MZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883149; x=1792487949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WIM0K+EJDsmmn42t1zm2SXiTTg7zUFvkgTfGvuF3T0=;
        b=a+D9fxUwoZFG6zHmMkUgbNU4+PzWaeMUWnqegDMStcdpLcDD4X/Unbrq5Caj/UH6jn
         6oeHuVoKAZbGeAyJr5vV/RnzzRUODlhrH4cRR0RNVRg/s2ZIgooTxO0dPVLbtTz2U9sI
         6egIwk8nEssjze58amFwZcnF4jPX8460hn3glTi3+0LbjM3O+GDSFZo0RTnkB/ihWG4z
         d/rCpPPgXyMy/4BzgR+qMEPawZyvLygZ7I7lksHTSSKxGPw7vkEqO9Qhd+Te5RzYsq9y
         LpJPqJtsSnJKPQqbz3VNpyO/qYIuK4YsZN2mkGwhhB/YS7kVTlSC74fIAE6IxTzsLQWD
         Ct0g==
X-Forwarded-Encrypted: i=1; AKwUvBz1MXvlDlhCjN89CzGNqQm51YEuDVsR2fG7Z7uMszYSyzcNZj3tJRp4SLCVqeVMD4Fs+yS1AsAi+82PYLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLib9RrlLcJyJZrz0lHR+f7sz1+Y08/UM8YW/TvFGROQG3qlx6A
	1KWwABJUaHqGRLmWk6E5b0nfoDc/ku993GVs5R1o0Tu3t3tHcWCyBKPZ
X-Gm-Gg: AYBFou3nUCX3ntbRxxUGaNN3brpoSO7WD4ghiu19EIgxD/LFltgWlmJvN5ppLsfVcqz
	tdwO+p0ln8mBedFUiDaDtD/3PslMYLHKB8ddZ0wbrIhkf7cRYi/QqeTLcK/gnB7JipVJT2nc4GP
	8Cq0tnnTfabxjUmOoI75a062GdZrsDAyCNYOThluLPM/6rZNFrL9TnBKJZOHYggYvD9CiAvUwZ1
	RyE5671bMbhlewZM1Rv98wfnlGcxZUAALxe+o6vJs8s+p4fypYf2hhhhEhB6TNuaLGshenfsYKn
	Syc2dItInDa2g9PC6AmRgvpylmrkMxw11HJT+t00YdPsexpfhiOZSh9qcKcllyqEHWl3ulPJRcM
	Pn0+4LA25R101rFjAWDj0nUSnFykkeoKtHHwaVQs0/LrmHcXHdKGdj7pT2bhJSUeijnGigkl1MN
	Nm0ZvPNLMNMhkqjWuUQT4NbgU6lLu/+s9K8rw12yXu/WiFrX/F2g7rfPveG7ZnfdK7BGg3aKIM3
	LpJqBxCkCGA4HM0KBKFXDJ9RwAO/g==
X-Received: by 2002:aa7:8892:0:b0:886:95df:c50c with SMTP id d2e1a72fcca58-897d5096429mr7333750b3a.26.1791883149366;
        Tue, 13 Oct 2026 02:19:09 -0700 (PDT)
Received: from drobotics-thinkpad-t14p-gen-1.. ([183.243.208.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c37e267csm4818608b3a.27.2026.10.13.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:19:08 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v2] dmaengine: dw-axi-dmac: demote apb_regs warning to debug
Date: Tue, 13 Oct 2026 17:18:40 +0800
Message-Id: <20261013091840.3962663-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918101414.4104604-1-shoubaineng@gmail.com>
References: <20260918101414.4104604-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dw_axi_dma_set_hw_channel() logs "apb_regs not initialized" at err
level when apb_regs is absent. However, only Intel KeemBay
("intel,kmb-axi-dma") carries apb_regs; all other supported SoCs
(snps,axi-dma-1.01a, sophgo,cv1800b, starfive,jh7110/jh8100) operate
without it. For those, reaching this path during slave/cyclic prep and
terminate is the normal no-op case, not an error, and the err log spams
dmesg on every transfer.

Demote it to dev_dbg to match the identical check in
dw_axi_dma_set_byte_halfword().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---

Changes in v2:
- Collect Reviewed-by from Frank Li. No functional changes.

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bcefaff03b5c..d829b9af5491 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -574,7 +574,7 @@ static void dw_axi_dma_set_hw_channel(struct axi_dma_chan *chan, bool set)
 	unsigned long reg_value, val;
 
 	if (!chip->apb_regs) {
-		dev_err(chip->dev, "apb_regs not initialized\n");
+		dev_dbg(chip->dev, "apb_regs not initialized\n");
 		return;
 	}
 
-- 
2.34.1

