Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE783A8753
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462980; cv=none; b=YqNCpTvyNJzyDt/Qjlj5qxUWolojS8gN/UDTCAEhbO69S5CXRuF60JoRfvEAj0Nb9K+2zRN9z2KpCACKcG5h7AUfM5NFiH/uvQO6oKVLgmeQX+ElJFXi5qd7VtT3QjSSb1HKWxvgKmOsEg2PpeI378y9fcWev9Lddn1vKRvghb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462980; c=relaxed/simple;
	bh=m9YQCnZ4wuu+r3kwEyUolM5dCU8c97GRk7G81aGdFR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pEL+jQUiJzbzmbF3XWxOTrNzpDi8cUGalcckCo5xTFy/ilzkLH+21VJBeH/ny4kF6VCnaGXqdu/xIymkWkYmMmo/qJjbIQEuy08vyCx/mrLb4qBegMcW0/7MNKjPMCCz199IMHgehl1i7JKbDKEs6f09gezwvYWCGapXAfXRtXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKqV/k7u; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKqV/k7u"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so341357166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462976; x=1790067776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=;
        b=kKqV/k7uJEeSyZTnhKaXCxXp7QeU2mYEu+6D7Q244jXM9CJASVLdYF1/E9yIp/eJpD
         spGig9UQYIKNYaUlTPJGzWd0qxmVvD8E6AMJ0xfLffN5+v/LD1sW35YeTiRTYsiHD1Qb
         tPFmmRBTWWSJiyyPoRIAS5/Ty2zoOwU6GqAmzoWuYT6D1emwhsnv4PO6LL5zuEgv/VDr
         +5U+emCeBfh2S1ROyHxxjeRphcEPJUVHoTc3K9s+OqGswr3f/lbGR+D8L8cT7KqyRWGi
         2n/ABsAblWdjCJsx8hQ66STSUhx628cLwRRvvbpyACzcVFa6q9R7lYb1Wluw7Yln5Z5x
         uQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462976; x=1790067776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=;
        b=GUt7MH30RaxFInUD5iut+U34vtXYR2AcUXTxUWLjI9T+TfSG+MKwZ4MJbgA8w30NMH
         Sfo00JpBj0izHTd1S3+X0qBj8kCpGqaNaxFqjVXkNSKcO2PhHVYoTstqe03bfGxXVTek
         /OpsSKcaUfrPjiexntnAUkMVRPXyj0WDJgeKHQS/a/iG5tEPNRyrtySe9cEfhNJ+gBpE
         +P1ppPagsLWs2/dZKOa6T8T7y8V/4z2WNUQXaezgDLdschWXqvcRkzIbZtStzDPp5MLw
         O4Wu7aqCjFG/TzY3/irw+X0MkibwjY03OQ9Oto14+Wsgsoa3PG3qsNFpol5JURb7Z0GY
         FU+g==
X-Forwarded-Encrypted: i=1; AKwUvByQe3uCEzJwZjx5GSCDf1dB/4OJhGLQn+fKuhERbsr9LrUi4Lxkf6gDCAbYXgKfKtxirbwpNBTRTCjOlDc=@vger.kernel.org
X-Gm-Message-State: AFuF++lpuovJI135Dkol45qiH9jn1o81lHU7NmrQHwq79IWncdZeiEI6
	lHvWnOzxBa5tCC6th4TfhUBhbAYlTYCCHSf/sIIVLUkzyubPsK/iH88M
X-Gm-Gg: AYBFou2G3BazE8BVo6/sNR23kJS+HTYX343hw9Duv4RNy0NYoMKtxXdbE0LhL55z6a8
	/T5MXmlf8vNkXjDas1Em/kELf2WOqQf/8+7JwyvAwh1h0ErUUWvpr7QnVrtaIe0cjgNaxUO/DNs
	kp1wtxtF94gPTyDO7tLCl73PMNkrLFWNU5y9bbdgEuR+tVf/xHUCO+mtd/dHtZDOfxPFwNW5x+Z
	3c/vl301kaZAouXGyTIoirvD3145uCG6tDfP6CBxGW97QMSDru+NvQZLtKygOy/+9oV+pHGJRTz
	iuUYRQOeM2qguiGUQ7U4jLO7Q9Tw8f+DhwxlG7/2y3O5VeaooriLZ4X8YR/6KFs33TFJdFSXQDT
	ACD9jiUpNfHqBxzv9EsGK0DDKUbDnFhc/i7eJNL9eumyX9AUJ8ooHEYRYJW8CskDleaues3Z7LD
	/pHi5qkcSwkZKJo78jEEmNF/Q5SxwZ+/5G9HOZ1Zin71vy1OLhmQdYajYUKJsA4A8nfkOSoYA9Z
	ml1Xcd96cJ6ub0n/Yp6qaftUEktVxveeOhH61ud5HCnpbJXXtCJhoHsYI7C3oZhCYuqR7geue0q
	z4N9VIQNNlU1kwk84BrB3PKw+Bvonm/HrTdkVgFmRlFw4HjZKquvi0bHIFBCb0Q+uHleDqd+/Ge
	MW3exAVJWY68KJq1ebO8Yy685AVVnsalcSfOxSRtyK5wnp8dqeXOLLtGWwxGiA/W8sU+SuteHrz
	0nWgcSrZwdkr7Mo0h1EWSIcjkC9G1uragwiIvHYx44D/r2ajmNpL4J/Y7wlH3ByNhAsjgUDqu9v
	5ZBC977A/M=
X-Received: by 2002:a17:907:720d:b0:c26:1649:47b4 with SMTP id a640c23a62f3a-c29b87180e1mr401204766b.42.1789462976048;
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/6] usb: xhci-mtk: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:19 +0000
Message-ID: <20260915090223.1346-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The disable_pm label in xhci_mtk_probe() and xhci_mtk_remove() both call
pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Fixes: 04284eb74e0c ("usb: xhci-mtk: add support runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/host/xhci-mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 60af5fe29bd4..eb483a267bf6 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -700,6 +700,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 disable_pm:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	return ret;
 }
 
@@ -731,6 +732,7 @@ static void xhci_mtk_remove(struct platform_device *pdev)
 	regulator_bulk_disable(BULK_VREGS_NUM, mtk->supplies);
 
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 }
-- 
2.47.3

