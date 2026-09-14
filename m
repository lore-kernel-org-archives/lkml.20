Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEEE3E5A30
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370958; cv=none; b=E9mWJRQCuc5u5SELzyFJimay9MlDPgE2KU3E/Un95THmLRb9p1J7rOmQS4RknH7Sv6I3MzBoVVDygASpDAAneoVqpUMdZbW+9w6rikubKh5GyuIrmudCYX9FHRWaynLObkErtugRm5fGXdWo2XSSlFX7MXLHSloPxT8IWkoLguc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370958; c=relaxed/simple;
	bh=PMrTYt044OfF3pY6fLcQIplcKVJDKCIn9Rne/SIU1Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRgQnKPmXqQY7ZcC40wL7P9ldDp5ZaEfJQKnaZPFMiXO0kOvTKYhZbv0eHxAVAId/EFgxv+f/qrWpWC/N/FU+6NXRn0HWy61YRw/FbueisTJgaJBY1eodTSvR6icxF8zGdkh/boiqAXR4Q0EFCVPmwnZ2kpMK1d97oowmRNkBAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhtvZ6cA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhtvZ6cA"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1220250a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370956; x=1789975756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=;
        b=OhtvZ6cA8HlICKsueQfBz4aS1QtNwnuts55w3r3k58B62OpOGmeOPnflTogoVI5MDU
         YxdLBEay8qJtNStBhHRaYREZgY92TGnZDI2/lz6J81LHEFpqVYJCa5wcsaMEzL1sQX4R
         lYwisNCQxCmmAyoE1NqnGJk33lcDOSjkfzl3WlJNKrw/OX6skKEfImLAJeiEnuDAqvrd
         FKZk66LMBC+nKg8A2EFRvMm8GdrCrwdI7S03e7WzyK8fWjTt9T/D1VbNs5EY2Q3prHvX
         geAGy2bKxkLz0gK4A304fnrdhUawdUV6asgTfQTzc76jiBBAtX9Ih+HLyNa3a5Sq1pKB
         bohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370956; x=1789975756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=;
        b=rhgKRMuWtWkUygrRxa159Wc1QMmDGgHESTLB5sJbRvXYB5O0hcpAeF9CubfbjQGYCt
         cOGYhAJqqau2Dxjp0fTouseRxXl44qgwsZ6ARWD1FqE4hxT75VyxLD5aMALRfa7Rb/ky
         350x4/ms6bvx308jDMbbHKeRbbQGIU2xj4IP+NVGIuVHW0PhIUhqqvjhSZRLiOP33eSd
         qIPt8OOeY4+OoRcRNh0ntEc3+vDo02T6c7p0THorJ2sCWih8mBEJScdpru0T7C7Zk29s
         ly0PtAQEVJTKdCV3gW89mHKXGZTTTH8m5blBqpWxAWGseW147KcyPvOzs7830HHJM6aD
         zw1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIMw5HuCq36cmbfuiaGhHtsX0p8OCRrFAWqUiSlBr0uLfveWB3D2FrbyBmOGxiONto8KF1L2Lj2rwSrb8=@vger.kernel.org
X-Gm-Message-State: AFuF++nCyvZuR+r1ZT6iORsEFnMest7maaasldITf2nx/G9dDiY7Sw/8
	clVVPB3Wngtmw+R+cam+SXQ+F2oSfH0rEobmG+WmQud33MKvOE6rQFik
X-Gm-Gg: AYBFou3M6+zBRKaOwOa6b1miRXaoREayDqqwbtkGik7WZ7/+YdmVESXh9e92tEXCu6q
	uj9Sy74XnREfPicN2MGRUolicJtya+MWfXrNgsUXmFE9wVP+FuGtEosqxceO6A7sx4nWNSUzpDm
	/t6aSF2xmO2K9Esa0OKlurjl7b1xopWGn3Mbj0yQY+r4I8RtqzMCiM/5xq193oCp3O9IyRln+/G
	W9kTGWSREKtT5mQLzOz7ZhmN5pPGP3PfHammCJcXISjb0/Zx3TyJ1iNou1po3UuJT83liMQn2yz
	OAO3mZVIyzoDhfYGzwNuAU/doleBTT3+j0oRqVekyu4gdbFY3B6cJyuBqwAf55ut8DvFBSbd8tt
	5+aiVP7xo8IRe2zEgz2B/5ipU+NZkkPT8A85KyTYejVtGIJ6/Ppi54ipY2DcSUE/93M8txFbkoz
	ynY1N09lwoZ2R9WEDttdyOhXNXFtOMyidsmkNIdhAbpO8VAis+bXBmHHs9VhY7S8zk1GrPu2x6f
	J8pvbEVMjdIxBcqOYLxpVNBSeSdeOOGlM3oamPUVNBLNCRkktH1ul/3tDkqWfHQyLqp+INvbXJC
	fykpARKVuk7TJDA=
X-Received: by 2002:a17:90b:2885:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39dec0849e5mr3489837a91.18.1789370955702;
        Mon, 14 Sep 2026 00:29:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:15 -0700 (PDT)
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
Subject: [PATCH v2 04/13] ASoC: mediatek: mt8189: Validate MCK ID
Date: Mon, 14 Sep 2026 14:28:33 +0700
Message-ID: <20260914072842.24420-5-phucduc.bui@gmail.com>
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

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 8f6241d47a65..69aa3715c19e 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0

