Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD855C1AC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958745; cv=none; b=n/C6Qka4TxEsegb0IqBuhBFioAxFFPlwKZlQxZSG+lPhE4v+M+WdjNKQAU41T+3KK/cqGzqFNXqKkPloQIp2RDMGOuO/yKeJjN6EMe3fyvVSJdvmpOsgzswI9boAAUeEpWZ4ryOgbR+G6KiKaJE4YlwW7nPt58qSDj9Ke/cqjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958745; c=relaxed/simple;
	bh=USnoT3hH/D4Z2P0IIDu1mlw/u6U3rEXT3E1Rlc7udYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URFSbPgnuzWcWQ+dW56JPl1MYgv96bGrRrqTA/ohvyObaRNXL2yPaxpig9nSzbHfHR6w+2ZRVtP9kCletGdUqmNrYQujyEXSGdf+mqlU3qIBb/f1bsVXfHfMrLYj17C6BHgal951gv3u+fOHBgvkHNOSfXJHTU7SpDMkC173Goo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJTFLOgg; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJTFLOgg"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53024149d40so28142861cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958739; x=1789563539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GITBy/+Z9DbHL563jv/EXEtgk9s5rq6PvccVk/UfC6A=;
        b=TJTFLOggo4OojjFoMjYu9CxWgmsUUjH3Xd5NGrpj/Oa3swNpvdLh9jrZkvLyzI8QPt
         HrADijzhlQnjyIVpJ8fSr73BOLcRzYAcZI5LCf+Ujf7z0T/hdsRAfSpN5A3x74um/Wxz
         w2x2xAsVhqWVt9UShHbWDEm80fEMC5uG7nWM+DKGv/qc8bkXlQWUmgSz93jdUCcFiuL8
         /zalafazKFQ9phpbIDk8G2E80ksrVY0hAl7baq6P2LMFHcD9cgYUxGaU71cxyBs/h/Lc
         odp7UZhq4i6oCCqflPvevW5ZdnGqT6HzPufhwPxRZ0iRFsp/h5ObK2fu4XOTTaLi4OJ0
         3WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958739; x=1789563539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GITBy/+Z9DbHL563jv/EXEtgk9s5rq6PvccVk/UfC6A=;
        b=bgQLF+oBGEo/LDFirUSWPu1T39QQYxfnShlGJ75WxK/yP2536+zwhtADmoFvhbIVxZ
         R68r01Q4oZVDF15hL9Wa806lu2FmZMaqks89o6oKJh6r/OPqWYpQWpLsqSRTQ0JkvmS4
         8Z98WJqtWUocpvB74pe0432vtnf27X0ODlzg2ABouBzscdjRWWE5dSb19DRvHlPusqxH
         /k18NBgKDPkK/gr2z4emNTSp/Y8DMAhIZ/TgXMkXN0U9b4oSSl4cHjPfuCHBmaM8DXh0
         YqC4RFppmBmrln5slLdxG0kiF4LdPIXkLRSzHZA/7cDJb8Ljh9+lMgkb2ceKkrV1fljK
         iG4g==
X-Forwarded-Encrypted: i=1; AKwUvBxAw6yaYFu3etlu+fupYyN9ra70ghHgywPAJrWul3vZQ//Hn4LcwNHe+VLRS5/zYW9V3vugm2W7n6lqdyw=@vger.kernel.org
X-Gm-Message-State: AFuF++lwLbzn2cO2vS8olntJc6oV9w2BmQSf9MI/MS9aHXJwHZhYRVPK
	N6g4zfhP6vK/icyC+wu+VsZKLzTT2IVZxCWx6Aexf2Si8lp2YU71VAYJ
X-Gm-Gg: AYBFou1ZNEsj3oFhFaVtE+G3NsEMcToCZc3kUlLM0ohusGpjUN9XHXGMLDuQz2PSClL
	inofRB7X5Fgikotou9VjLzWrG9wLev9ifISi+WsG69X0ibyWSd1dBxFqrVhGAe7hRFyNiwHYMrS
	LNiNVZs7y27sVqroYAz8hxeWeC5HViHcqHh38/IEnRPlbzOn4flf4WXA3rCjaEfJ/l8N5KkHcYv
	jlgT2Gp4xz+7vV3/Hysqt9VSPAnhEyv+H8T9cngvFaLGuDY7HxO6is/9PWkNCsZS+YyYdfIJo6j
	DXJHuyiDXkIzkOEeybuN2uC7zqvKN0RcX2VdzSqRvz8n440dlROw9GAKinpU+IRHynV8sI+Zmyr
	5DraOmR7zw31bIxcxDXLjWNI6AGUW3WXORbHO1ePN27sW+0Dsvku2qFrlYn9wNm16y6I+D34Fc2
	K+YoZ7DhuTkgm40iLzHwTAiUJE7siVTI4qiQuMkxJsV1VqZfH5jzMVb7JpHfzpBsyJSAfKzb1Ua
	McOgT/2sRHr35OF1p8I522SHvGuiobpQ0W+HFWHhhxsJLNiKQ==
X-Received: by 2002:a05:622a:1dcb:b0:530:aa4a:993a with SMTP id d75a77b69052e-530aa4a9cc4mr32587241cf.41.1788958736195;
        Wed, 09 Sep 2026 05:58:56 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a803:6c49:659c:692c:9416:2f0d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53080ce82aesm82437691cf.31.2026.09.09.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:58:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] usb: xhci-pci: Put PWRON_POLARITY on a defined state
Date: Wed,  9 Sep 2026 09:58:42 -0300
Message-ID: <20260909125842.528340-3-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909125842.528340-1-festevam@gmail.com>
References: <20260909125842.528340-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, TUSB73X0_PWRON_POLARITY is set when the "ti,pwron-active-high"
is present.

However, when "ti,pwron-active-high" is absent, its status could have been
set previously by a bootloader or by a previous running kernel.

To make the state of PWRON_POLARITY deterministic, always write it
when the "ti,pwron-active-high" is present.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 75aa679f7d79..833c55c3213a 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -684,10 +684,16 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dma_set_max_seg_size(&dev->dev, UINT_MAX);
 
 	if (dev->vendor == PCI_VENDOR_ID_TI &&
-	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0)
+	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0) {
+		u32 pwron_polarity = 0;
+
 		if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
-			pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
-						       TUSB73X0_PWRON_POLARITY);
+			pwron_polarity = TUSB73X0_PWRON_POLARITY;
+
+		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL,
+					       TUSB73X0_PWRON_POLARITY,
+					       pwron_polarity);
+	}
 
 	return 0;
 
-- 
2.43.0

