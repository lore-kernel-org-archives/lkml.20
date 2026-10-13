Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146D1533587
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904741; cv=none; b=nLzy/0kPt7FrNQGus6ztoQ9zDAn5LG5TCLdw4P0RysAwGMigeLnSOhMdVz5ky2yK9XIK6HApOIIc84NXwijZMOpl2ZuwZOYbB/tIomXgwXrrE+WScAKuqMgG9MGAFdqG9eYHXXGIQWKhd+ufdMyOOKNhC1cpzeQAUPyPOwPEOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904741; c=relaxed/simple;
	bh=EJuFy6L3EkZV1tpyDKJILiQXCdLlUGrHISXxXNCJCj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WkJvAmM8jwExI2fT6xjlkXabBsWDXR12y5YIfhM1q2fkECRqsf3We/g3oR5hjTv+ZZSZF72VpgYoCBquZTft6llLJffSPArG16CyMciL8rguUfAJZORBMVIGgzquNHDrAeXosBVWfObSS8nU73umHF8rOnvOhP4WSfUAXrjECeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBqkM4uH; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBqkM4uH"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so1271493a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904739; x=1792509539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BUb4KLNzv8UvtcG3rPoNWcIBZsIhzqKZtTn6CJci/w=;
        b=QBqkM4uHsvQgrj9/6cYDerrB8NBEnI0qgI7bs/Khtfyk6lltrQfVovtKXD1Har+3N9
         aCLgz8dhODBjl2hKiPfgq8AJHDvAUHtZLi7NNTp3pmCyXtZsMs8VJYtqFSsSxiZg9c8Z
         6moc2j2+BBykheJ9lVO5JJ3p+UjDmYmu2M3vZyF8z4kis1ru1pXEVDAKf7f38/10ptdw
         ijhZLjIUttQvpEGKfJUITvneHeH6C9A8kWF41KV+gdcvvVhYv3bJC0eQJPeowFj59Yov
         AfWOVyqCD5GqbTudhBG9IjVDFp/dz1ZVIVrtJzE/Ww7071QyyzSLYxnejfqdXALqHOCn
         M6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904739; x=1792509539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BUb4KLNzv8UvtcG3rPoNWcIBZsIhzqKZtTn6CJci/w=;
        b=mJbfot8zEMM31xoEkUtwmIYaoW/fy+eRAhDYiIq8niTZjgHbPT1e9btO8aaNuyNeWJ
         Uf0sg11NWTtRBw1cajrPqTCQBsgUDPWH5M5XSBBQ27dNw1OPii5Sav69sZzvb/FXG3Q+
         5M9gB+gAQsvnufRAOcgEJNGhMxOeAcxKSntbxgvRI764Rlv6xFw7bpB5QiQDSyyPYU6R
         mKvK4eVcj2BHBIjtnNWtJTi/SWybmidddY1DoUFXvbpBFioUIu5kcgFAJoYLYbdRCj2t
         xmHd9YBaWTmmmCCezydIfwZkukY9fcLQujF8NxSG52OwtKhDZeqcZxj1pZHVmSx78fx+
         NkZA==
X-Forwarded-Encrypted: i=1; AKwUvBwqp9PBdLt4+2GUJ+oHGu1oAcNVhR42TJziAJ7uQtGEHk1GL4KzBgSUes+MS0yN912qYn0LnDCc5Qrhf+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtTwQe1F6CXdPHLxK4FaFS0Dr7drc+OkxBBht+unaJTazFCX4d
	HElo67Z/rHjpVTwSwNTbcrATfCs/TIN/AxeUZMBJ+h55RFvq9N2s9jR2
X-Gm-Gg: AYBFou3A+kV74kvwD4z6fi8q4sW2iOwKPdB8eXYUzxmo60fieMt319TIW9vptKUJ+Ap
	WahwaUlbt8ltkZL+Dyv+XE8QabobApwBAb+VQdrKbnGFAJ/kjfjsU3XxmuVn2ogX8QxobtTQXZL
	IrsNLvYU5FjaeLPUCsO8vfSCCj5WVek2BN1L4mr/ba3Ow0NgT/yKTShq4e/EUa3auyM8WFCsUNk
	iwQ5AQLmmJoQYOXdzMm9g+q3ckL1uZI9cBfu67T9qiFnK9qVud2P4+m2xbaxZ5pCiGL2zQQJvGM
	txYwrCIPWKWREXFIPZqqUhw/kawuGr8OrV5xEL43C+K+KfZKXGNAgkYkM+bK7LgP2SFoE0qWDx+
	rMMn+LfgADd090w+7q0x0QR82iCCtYpZlWb+VU5YpJZ2MsLPuqM1bs7StmAhOMQjdxoJgtC0nT0
	Uf7bp8swA9kNad5WuzmKNnK9i+VMtnSM7Ewz6BJML56TkbWnFLEDj5UYf2hFqNcufpPzQQWTOMu
	8Jt1jF87LpYzesvyiypjfVuPR5X
X-Received: by 2002:a05:6a20:3d82:b0:3e1:c716:3a00 with SMTP id adf61e73a8af0-3e1c7163de7mr1785092637.53.1791904739466;
        Tue, 13 Oct 2026 08:18:59 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:59 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 11/35] clk: mediatek: return 0 instead of r in __mtk_clk_simple_probe()
Date: Wed, 14 Oct 2026 00:17:10 +0900
Message-ID: <20261013151734.3177690-12-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the successful path of __mtk_clk_simple_probe(), r is always 0.
"return r" is meaningless and confusing, so use "return 0" instead.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Newly introduced in v2.
---
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 0b10a4b14a6e..11741cc6ccc7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -592,7 +592,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->need_runtime_pm)
 		pm_runtime_put(&pdev->dev);
 
-	return r;
+	return 0;
 
 unregister_clks:
 	if (mcd->clks)
-- 
2.56.0

