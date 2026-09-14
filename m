Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3660D3AA500
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370953; cv=none; b=qzrBAIbDUNE7LPiiPW/0fKYinAdQcf3n+bcdlJugerDikPh6O5Il45yOwz/1Hjw/Y3HeS8UwQxXygZXg5OZmLved20JM0oJ4x3OMHDUeY3W27X5VL7MerI51hHI2bV/VEs1qew0VyvgZFH0o0oTOlWfxARA8cr2xp66U2tC2E5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370953; c=relaxed/simple;
	bh=BAoT/932YSIrHskc09yxSfBLfT+jJ1FbZ080fdYmqB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH6GmlhshaTsaDTxWFT69l5Cb6I9ktd27ePdieQo2TA/riTZUaplWn6Wot3IteOxOq0hEiBA/4Fan4Dp5+YWkpmidVIH6Sra7A6tcoIrC5VfjYnZpACJIkNc9HwnxL89ewpMdXpSyLOeJhYoi5whh1lbE166iwd0tGXbPnWr0nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llZ4h7dE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llZ4h7dE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1835196a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370951; x=1789975751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=;
        b=llZ4h7dEYVZb0mjLVx1MV+rbxsryGMetvH6167nBqdYOrf1KdbiQapFNY8Z4IzpGsP
         BmC5rb5eElRXjdhRcLV6pbKce6wmUKzQ0SMb7fUKwLbMEnWnI9cQ7/rwXDoeZ5lor809
         W1qeTQRFV6yt7n00dqDbMOfb/gt2FueEAO8yS9gTODNz6TfddGANxO0vWTb2jxKYSciD
         zS6u0Pu0ILn6AAju0/uXLY8MFkKrNgBxXhIIJO2zcA3Z8gBDKlVJbm2omVnZyj4sTZWk
         gmAGQ3UcouVuXnj779fNdeIc4o3zUGzmScTbVLzPjoUwa6+SKKZJs4lIREG8lpxGqili
         zWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370951; x=1789975751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=;
        b=H63PtnQL7VXwNYN7WRnY3o4bFW8+wuhL45Ny1drRQ/dqsmmuONibaz70nK3i4h07Lh
         S4g3jJfQE7ApGLy+yZU5IVBXHv8VqaIEN1hiLPHI+4cGnAZ5LrESy0oP1axDh/Wxk/Le
         7KMvZbtFbdin+fN7PJlddV1Qi76x+tKVA976SY+fEKlCwACZKeR2aE0RQXpTKXxK7TRu
         CTtPNbJ4xn52dScNCp54QDZWnHwDV5lgkxtPUqU7NOIpe0xFsbA5lZY343YZU7dV+J9+
         Spph4MgLBNBjAY/Oy6enJadot6uK6TRcWCy7lKMPHaQnKg3MifCkYfuSWNPrShLTybEe
         0S2g==
X-Forwarded-Encrypted: i=1; AKwUvBzLIEBCqDDxW8CM2F17YnzG3SwOKEykVmVMkDzrjwUlC3x+sgCJJOO/aA0kZKVCakBphYuBSymTHjg/6Kg=@vger.kernel.org
X-Gm-Message-State: AFuF++kehrKFrdUYHRGIALLQdXuGptLpBqS+lt5imwXa72hNhfmJNdfd
	qrEvq65PlMfKLDa1wIlFZbjRZjJSIrsHFGWZxZnkSz1QaXf3xKwkVR4N
X-Gm-Gg: AYBFou2WMkWYuYpHiaRpFFcy9NHs+tqVeY1T89y/eCrrmvdtRWb1kNaHpWZFl8sz/oI
	k9FJpnQp3n8Ivir7VT0wR3vdT8Fw7uqtozu92ptSuOXDMmap4C8NH0emri34ddJY2kIMVQsGrKy
	ksI4/nUuXPa/YGOcxzsKdHxGzYv+JfRsPUUKTPVmU4IlF0mqDoWserPxkQeMs3de1W23u9MRRJs
	XMfBvJPNxz/TGppcpHEDFd+12QNznodvXPv7uZLNX359c42pyeSX6/qwFeCzDjqjFr67G+wRy55
	33W2yycbG8J8FxQ9GivUekFv27sNhmdApJ8TZs6vMScCvhUxq7OBUXZUSQHQyW7BydDWy+5jKJB
	KZNYBnWMHs2tDVlU5L4Or9IzeQxO4+ePiZNFoGAdSfgcIX4I0EaabuzKP9QssSUNZCfVTCHEiyy
	PjXG6bH46nYvGpskJP9XuOW+2zD/HOFUFzsMrD54um9HzwuD9N4Fo0WemMXAOCCZ04BPahtXRBO
	4lRnBFLT0yBArR0HHFmFibYCCaLg3w8ZcFXogb2ynT4s71Q+f1WiPbUqlbQSbRMvagh8Y3yKV0J
	4XWZPeqMHhuTWdo=
X-Received: by 2002:a17:90a:e188:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39dec05885emr3025082a91.12.1789370951458;
        Mon, 14 Sep 2026 00:29:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 03/13] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Mon, 14 Sep 2026 14:28:32 +0700
Message-ID: <20260914072842.24420-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index aaf4f7921363..8f6241d47a65 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_disable_m_sel_clk;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_disable_m_sel_clk;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_disable_div_clk;
 
 	return 0;
+
+err_disable_div_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_disable_m_sel_clk:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

