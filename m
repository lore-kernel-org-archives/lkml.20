Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CD5429CEE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462981; cv=none; b=Nb3Lqo7tfk+1uC0OJ853+L6HbnZdfuKcxJc+hgWa3Y029b5tHMNdtOD0Q9hKGa89wrQHGzH9JRq1fZNWxmO+Q0SXegt5Ji9LtdSC64GemrPkkXXtsgAhK539gPQ+WqTALQV7e1nIOt77XiyWTWRPDgFGpBT6phY1dbj5SQlIekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462981; c=relaxed/simple;
	bh=ZI01giqCOg4r2BC/31Ii/Jx+mxfuzQ3xbAm6e2K6C8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCkCg+KUbWa9AMFCQjFxe6nTMHYuccA4OyXK/dTZ2a/SztKBaS0lL4EyFvojt6hsiYmW+kUrVd8vfVr3WezF38HuNx9Z9FhWBq/bQLrHzVvZQhCiC6tV1Yq6L2lg8MQS6RfPJgrD9LDVcGjMP9UY09HRhgNWzCA2P6gIczI7Inw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8jYbAq/; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8jYbAq/"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso572324966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462977; x=1790067777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=;
        b=H8jYbAq/k24Q6j1MuXjRsZ9lDK81mFluOzrjRTNB6BOrSQOKLSomPRo9KhNfQFGZP9
         637gAhVJ66x6oFv/Y/rtIFEJBkOagQjIPdMiZ/IzOlInEtQ5jbaeTC7mK+fFWuAXCe0B
         OBF5KHyrL0Sr7bLezopx0wtPTMTp9XTk3JSwHxccLtnQSLDdQYY0Wes0ktYgIJ3g6a0w
         fDtjTPeFMeqhVuCTYm/uNrY48lb5VVlMlgNjjgRvzWGB4WfkzyuscgR/DqqUitovnhwO
         Yr8WhscD9oA3gWOXZGLDRkBYaEAUGZYUmsICqqBjePOkwCO5p4Pe15ADWhrBtFrGYENc
         GUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462977; x=1790067777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=;
        b=VbUg5wKglwS0tvXsJnt8h0vCrOUnx8mP0Gt/Wa23Prf0FVdf87KKtrZ+FWmc1KWQ1L
         BSqxaTRRsf9amCZQ+6Lb5N8tCBklVHt+Xpjz7rn+kiMP1ULirT6IBqMHiYBxDrYGQByk
         L4MrO8mGAq1O+4ZJJO5rf83EU/mANKF2J0JlloDtt6M6EpJCe5iOuwuTF9ZXAOB24tml
         ZZfUH2ttBQ8oUEGvLDkuG2IRIo8Aa6XrwS5a/sRREOSWikKgBKJK855YQKfMah6zfZ/V
         2+FJ5KICIkyLZee9VOIAplYlG9BiraDJQosaQSnsaUScIJfJilzn7KffKsV2Bk3Ejtqm
         abcQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2n1yRR2VsofPsMjB1ULSpKWeNcH3BzzIxJlnqZGXJ30Uy1Rtcy63Fne5xE82XfpClnukrSLcsWVbr8EE=@vger.kernel.org
X-Gm-Message-State: AFuF++lJWMNDW6fYgxb4FKWki48klc9NAQ63wOeXPCpGiCt6k1XDupxa
	IQ23HrvZQ+GQQzjuezAK48wzjRKVdIavsxr4y/u4zf6wr2AaZlA5fjo1
X-Gm-Gg: AYBFou0088P8gD+IZPoixP1pHkH8VVSu7r20ySJW/wHWvX8wiCwkYui9w6khZLQN6Sk
	ZMDYpreyMOADLIhDxp3GAjdFZeIa5ervMD9kwEd1P3EQ9Olq5Kq8214dT/qLIiaWD0R1ONy2G0Y
	0UKj72A37uKiXkV17podQKxeeoA1Yv3BF6Y2EfXH3+Cir7EdpY/MUdgQ3tT+o1B9bJ/k9sfJ2PN
	pBn45+/vnXI/ZSX3Yu3rmoKCTuz3EC3hJ5ifTwE0NCiYEMJ2icR2CwK/EbxNklG81rY0TrsuUiw
	OVSDV++AD/RyLRcIkfNf4hvlmQgsE4t2NSTMnj9fl0HL94P3oups5nakym2WxDj6RZIVNsavUkb
	ECE5zYLVptRLaN4H3gykoXxP5JtodsEPwx17oeMfVDGPqvVXEz7z4TUb00MSpcIGs3/oGIziFoi
	V0i/lsLGG45tUOL99C+6IKJadnsX2Fyw4BhyaMTqxt1lR5OG000BBGOaJtRid7VJ9buqhFw1SDq
	w2jtmqVlFynGwIsO8kSWrHzO10/i/E0D6SYeZqWnPxh3SZFGZ037Y05hIjMshRTMbpniT+JZKm/
	i+GcUBobElAzqc3zX0gGt7GGelrXHkWE4/dPdwPJqGY1bZBGXK9ACv8BbecOOK0saLIppTE2jSn
	XbHMa/h+29ckL66HP8HJqB5CVdeptDoGcWEqij/Q2sJ6Az5Wn8YSAnYfpcIg1GxLN7omI5dUsb4
	BaWdQLm3/eC0OrX/ippVQvOVN4EE4GJmeVJ0uT1X5Ks6lkAt9N6C3Go3NMEgx31hzt5cIB1On3K
	DSxQF7x60s=
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id a640c23a62f3a-c29b839a057mr853572666b.2.1789462976636;
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
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
Subject: [PATCH 3/6] usb: xhci: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:20 +0000
Message-ID: <20260915090223.1346-4-joshua.crofts1@gmail.com>
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

The disable_runtime label in xhci_plat_probe() and xhci_plat_remove() both
call pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: b0c69b4bace3 ("usb: host: plat: Enable xHCI plat runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..29e743d6868e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -388,6 +388,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 disable_runtime:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return ret;
 }
@@ -461,6 +462,7 @@ void xhci_plat_remove(struct platform_device *dev)
 	usb_put_hcd(hcd);
 
 	pm_runtime_disable(&dev->dev);
+	pm_runtime_dont_use_autosuspend(&dev->dev);
 	pm_runtime_put_noidle(&dev->dev);
 	pm_runtime_set_suspended(&dev->dev);
 }
-- 
2.47.3

