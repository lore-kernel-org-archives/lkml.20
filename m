Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5659549B219
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962604; cv=none; b=WnfhARZH2gzreAwJ/W8d6PHObXBM1YwBeBCGVZvGQZuDXuBJgVDz1EYcQ+yM/T+jq+1jUuRkQ4F5SY7mcQY8JTQ//ZSI5kYFL3Nyxb3VAmsv9sfcf0NgL/5cZ1IBPH4oLThegRDJvPFjViZbf4aFLYAlrfQ6YOKouRkF0tgivs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962604; c=relaxed/simple;
	bh=O6bQmveyBapZrsTbTRgn6yMmYaOs7Qm/ZnNsDdveNGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kn+odOlqWyLo57bQ3s1ECYNCt8lUawYnA+grhp7Behw4vB0EJoQXCmD9/iOuHvBIetAaxIZKG2WefzqyxX5X+GOhnLxJLhI0XK40GS+OXR5WRoJPxaIvtrPWHLYc7SzegVkkyVs9Lb/rI/6XYgOfIFsK6p6pu7iVZLIbUz6JeXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbD+2fqC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbD+2fqC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c411d6615so2673746f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962597; x=1792567397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbM6G/cfBuexLxJw6Bstl+WC8ZXf72ew5u9fh5toXB8=;
        b=QbD+2fqC0b2rzeihat7sKallGttcHj4OrGgmv4ScquGCawheYmzQmhziTPfJ5ZRzq0
         fETQLSWVlRSdzIiEFhkYPPByKgeL9XYlkVegGRwYmdpLrqqWnWP6WHL2Bgt1b6L364Uz
         +JPMcnoZtJfaGCt4L2FEWTgePjH7zf6Ak/nec4UDBC1t8LIxfNyskaz1JyKlWm0Z0Fo6
         qn+3tZWS/gkGaOfg65twZQuX3720QVrtDSIYaPuPy1YxdS24rRJlJAn/pjuT9lTMPrCH
         j7wrfc07ucKahQfw5X9FRMLjPYLdXPLW8D8XBYMqBibBldF8Dc5+UD9gLQl9bqblDMzl
         8kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962597; x=1792567397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbM6G/cfBuexLxJw6Bstl+WC8ZXf72ew5u9fh5toXB8=;
        b=IXpLsIOBoUt0rAvS9FjPSsAgRucv79mRn6XcCUzfNR8UKbrT9bHOAWiCCKmHQKkQMj
         CkKTmm5ip4ZTkP4y85JOHHlQjwYMl9OmGYepKapYR6XuCuiA1nBHgNVOrowMVIghUoWE
         06gCqeCTwanWcjKifJ+AkwY5ligC/mk6VumpL3py8YHGMyso6wy6iA7YvyXlGCvg8BBA
         q+me9Z74SxwgnKuG/vNb2Uxan+gQCmcTQhAzNKVL/35n9YwH8KOB/MW8kGu8/dSskIJh
         lqhUA4muamjFrBWLVBdXKM1tzb3cvf5y7opffIvSkxFPnb6WpWwHWn4Jv8SoG9RaJpqJ
         D88w==
X-Forwarded-Encrypted: i=1; AKwUvBziM5cW3/+TIuuirZPJbXKQQ0K4U+K3tdx6oKdC8hxenSmoeb20Xno0faORumjXisaLoe+Z/Ytcgt1Mv1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLSD58RahlOniRcN0XX8f1y/IqlW09P8YDI9Qo8sOAfsqz1+VG
	6ozETqVm5ZHQ6a0JNa+odGjCP2KAg652L92m34csYXIYsf6yLJ9WPQfV
X-Gm-Gg: AYBFou2n5M2hxL3txOCHu4AuveHdJ4NcQOYyuNAx55yFr5AVMl1flD4MwplGl4I5XqB
	1IdOMRitUbiQ3SZIbAfvByItAf0SRM7jCiuOBtMdoR9WbcClVLR+FN9daVWr56jfLnXGl6qiFR6
	+0CVvajZ+NTOBmupifgbAP67kmr/2tHxc6pU1eTZkXtLE/1M59kOpiVFFebQ4hU3Qvy7Jl+0ORj
	lJ1eoXD4grIFkZsshAtZ32WO+VqY5+K6PZZZTRwYJGs8T6j4Tn2J3VYzYn1R/EQPl0LmXEy6VbP
	WRwojYC1GPwPWDcViEROZcjibRF7SALb1TXa2v/BayMly7bRAUgc7XaSQQWP3g481Wo0QhkadY3
	WKOa5btfqIWpcj0Bg1PwQbE6/IhYmxY9rFC36eZkB5xxQBy6WOVW2FE5hwgl48LFvW/U8ZFwsoA
	MJrETOzo8Su5VwaUQNjSgayxSpAXEd5N05OQ0MgvwD3nBQP9VII/d1zMNd1zJq/PGO1RW6rdm2N
	uHwOjvHoz2KrC3UVPw34R8ona65kvop6Oaek/a3d8nHEMIwtKUB5ngelFUUl6JlqXeStu0vhelS
	e1cRZxtRRt1Llg52IJstGLPmG8+2JacB5pT1XatcfYeR5TL056PCHNRAGqcsZA==
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a18e4a003cmr296042805e9.11.1791962597174;
        Wed, 14 Oct 2026 00:23:17 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:16 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Wed, 14 Oct 2026 08:21:02 +0100
Message-ID: <20261014072109.1759502-23-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the generic DWC3 platform integration to enable clocks and release
resets. ZX279128S is an always-on networking gateway SoC without
system low-power sleep/suspend states, and the suspend clock is an APB
clock gating input handled alongside core clocks, making the generic
platform glue sufficient.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/usb/dwc3/Kconfig             | 2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a4..dd0f6d25dd 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -207,7 +207,7 @@ config USB_DWC3_GENERIC_PLAT
 	default USB_DWC3
 	help
 	  Support USB3 functionality in simple SoC integrations.
-	  Currently supports SpacemiT DWC USB3. Platforms using
+	  Currently supports SpacemiT and ZTE zx279128s DWC USB3. Platforms using
 	  dwc3-of-simple can easily switch to dwc3-generic by flattening
 	  the dwc3 child node in the device tree.
 	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb0..aa838cf067 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "zte,zx279128s-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.55.0

