Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C1A3A3809
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156676; cv=none; b=vAj/wx1Aupyfwu2C2YR8EMcI4WKyrWm0vA/I0ApBmpRQZ3EZ11cGywgWZJ1YC475tZowkRR4Gg0E/aCsydxxDk0wKDTT0SoKdhOCTnYy0cTVW0gYEoP7mGlkuIBdQkHkMHX4BD+10JIk7z/W2JvRkalS4Rwyw73hNxUBqn321Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156676; c=relaxed/simple;
	bh=dU9hy7OQjqEoRycQvnYqwAL+gjlFdfNRteBCt/LfeHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B4ZJGAAMRMjU6q8gtL5vawoM91ShU07+BUHcM+dlcOO5csKkSq+idfMqHkyrIoxG3uKu6jTXvkpe0dd6JA4UwPM3H64rJ9W/WFNm22iEgGvJMTK15dMCaTCkVF6UlQaSovn/lk2ZnJpHfxYpDOIX2Fpy0eRc0jSSdacd5iM/u4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEQJZ9el; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEQJZ9el"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so377954a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156675; x=1790761475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=;
        b=jEQJZ9elEHS7e6O2hgLR+q5QdgP2InP34z84U1LkOagDOzTmmW5Q9O7yjfOhSoR77c
         J7FFz/LHLPz0de6vDNN6wtFWrQNIgmydwcIO+P/ZHYTnWwKk9pczXu5RVgQx8JqV+7c/
         hKdKRLUsffv/pJ/84ufCYJ92hEW/s3S2eXpIrPzBI3zgFcVfjQy+ysuY9PDjQQLJQifT
         EYP2nkVGbtWROhwDKxfiv+Tn0fphbH6k9l0FrwHqSDLoQ/uPWtekJMq92r68cVZhOOeJ
         44Rg0B5fYjOOOtwJtHgdUbCbrakZVaYkjBzvCHNzxZNnZJTu1Oy2k+cFDF5bJpOIB03J
         dmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156675; x=1790761475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=;
        b=OKIHwnLLRXG8FtqSsoqVnZiVV6P3XNoY/NM4y6I0KWHWTXBZLU5MYQYiFiz3QPvvTn
         d470ShmEt/YygGqZ3NGhwHru7CkXGKz9WodN0natNl8x8ENvwmBWPu38NoEiCURbTdli
         U7pW/QMSLic3cBcel3Uli3WxmDQkLET85VuNU2Zmf7xszk6V0q3n5QcXxBSOvDuot1az
         tFHjoU5yXd929lnqAYw0zsiTdOgc9GQq3Rak6r0qFvMQPGPzxqisMjwB3KhFOZgPwzVY
         b4XTghGnczKtsBWg1QpLLCGNPme+GlkU2318usz5AS3MIyRvZJTOQJuOfbupObvePcmj
         rXrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBfi4gBGNTwxtis7+38cf6cQUjoHaFAjVxzSiX8ILnqKUI/p4OOd6DOuenqOCWfUNb110eeh0mGYaJt2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kAE+pUcMTod7+Vp8QL2sHJxBeQFB7TmRSuizYIah6N9N2gEXYn
	ngatqleqpT2AesgoYB5w4zNj8b42CIabRWpHsdEA6pCxa+c1TEH20nTJ
X-Gm-Gg: AYBFou26anHbGs7vM81eA8QtYbwW+JEuN2mRWg8r1dzWHoJdV1iUnxYXy+wou+pONlW
	3dfScEKQHrHF216RUl337XmPDnwjObYd7faQ9CJY4sVJC3AHmgzzNw7MyjXw/0n/GJkfCXtoEMC
	8bA0r2a1c3EJesthbg9Pdvr+CPcTPV22IzqckTm3R32u6Ae0SA2/d8UYspcMweIyFy3kc0dkbjp
	noqENpmgbH7VH6Q2j+6JM7P8KG2NBjkCyl6XUq1LSkoAUeVN8t82jjKBFkr2oBS8Br0eiWt7oSy
	GEC+wTQnMya9pmQTssy5vLvE214P5qC4EetC4EPxbig1ipAU5gZKbQIwcsWnVjYAJPfVp25FrBZ
	CiNYnaIHgeCGc8EHvFGvbTKSpWjh23pHb2lA4B1l35Y17DXz80gCwnTcq69t2Hh75oYZvl3FyIV
	0C3hLw4CuxflpvuhVGEVJOEW9HCHD2IKisj32X8p6OXiRhzmmRT/pmpd4rIY7wsVps7YHm2vFVi
	2u1ndgueBnGG0fHgA==
X-Received: by 2002:a17:90b:4c88:b0:3a0:3d1c:2dc2 with SMTP id 98e67ed59e1d1-3a07e6df035mr1828489a91.66.1790156674636;
        Wed, 23 Sep 2026 02:44:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:da14:10b4:9b00:211e:3d68:8776:5ca0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c741sm7874725ad.80.2026.09.23.02.44.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 02:44:34 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org,
	Frank.Li@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: milbeaut-hdmac: Fix deadlock with the channel IRQ handler
Date: Wed, 23 Sep 2026 17:44:26 +0800
Message-ID: <20260923094426.67872-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

milbeaut_hdmac_interrupt() is a hardirq handler and takes mc->vc.lock with a
plain spin_lock() for the whole time it runs.  interrupts are disabled locally
in that context, so the handler itself is fine.

milbeaut_hdmac_chan_config(), milbeaut_hdmac_chan_pause() and
milbeaut_hdmac_chan_resume() are called from process context and take the same
lock with a plain spin_lock() as well, so interrupts stay enabled while the
lock is held.

If a channel interrupt is delivered on the CPU that is inside one of those
critical sections, milbeaut_hdmac_interrupt() spins on a lock that the
interrupted code is holding and can never release, and the CPU hangs.

Take mc->vc.lock with spin_lock_irqsave() in those three functions, as
milbeaut_hdmac_issue_pending() and the other process context users of this
lock already do.

Fixes: 6c3214e698e4 ("dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/dma/milbeaut-hdmac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -214,10 +214,11 @@ milbeaut_hdmac_chan_config(struct dma_chan *chan, stru
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	mc->cfg = *cfg;
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
@@ -226,13 +227,14 @@ static int milbeaut_hdmac_chan_pause(struct dma_chan *
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
 	val |= MLB_HDMAC_PB;
 	writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
@@ -241,13 +243,14 @@ static int milbeaut_hdmac_chan_resume(struct dma_chan 
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
 	val &= ~MLB_HDMAC_PB;
 	writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
-- 
2.43.0

