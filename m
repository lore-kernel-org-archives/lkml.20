Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20D054CF54
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111726; cv=none; b=PXbjjCI6odxIAT5q8wBDXQugkmv/Pk/1tgYCJR/UeqzwgydQO0OdB0nwoYjg0g/Sg9UVmJSp0wDZEh2TDrjJ4okSqXrR6s4IWCzvQuaIAoFUkceDKiQdO6A27X7+s4HHF6DxBrrcoD/ErXyvU9TecFacIIUv3b6yb2X2lt6yRGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111726; c=relaxed/simple;
	bh=FawpcmzmmxnlHtD+GQiWKEP83HvtT9DOy1bIw2fjfys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H5xh0/T9FkgiGEdr0pyohEBXjawUOXPGtrIqbV/vkgwzwrPT9taoit/L/yzjqXVeWCZ2WVcpdzVJKRuSFU9g7PH2JnG1v+rnuzgjHAp9Lt+JTKcvWDwkQRDfMUnfkcQz9HOd9jphctwdfWggeC85xouKnYqU3BLYV2dnoe8un0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMGTiOjc; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMGTiOjc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so270435f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111700; x=1790716500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flTePN2NkB0ZSxOdRerLk62XoVAGJA6/fEuIjEkWcNw=;
        b=YMGTiOjcct/we335Q+eOhlsVlmPv828ezilxLXox4g2vVGhwZed1qMJaSTIgyPmWRm
         Hnru/qhYl7xxirDkVmRBCS9COy8r4nZVe0/QyvQ8oq/Tba4slwHUEqFmqgozKLZzsmdG
         DuZLXem5cglEzU6bhB9eu2UN6UBMb/nizdateQVDV/Z4uk/r4R9FIFYQ4qSXpdP8CZHQ
         l09RhrSDAH/eluzqve+Zh40HBAFOVif0crvOWA0a0tEg5ofiTbtzo4P0wUUtlxPUvJKf
         gZLr2CaPs+HjGO5pwoyNXZQK7IvRWUGKZF2nsk+1IUsP1b6a4o/9NfT5JnzGa+Mkv1Kg
         +yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111700; x=1790716500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flTePN2NkB0ZSxOdRerLk62XoVAGJA6/fEuIjEkWcNw=;
        b=pRIdfPuwEav7vBEJrNFv+qXa25TdLR7olvYoL3w578/+Hlw4tJdgvKEhotQzS/8wbQ
         V+ehSsxK6Wz74niUkoex1nrjNn4RhHIPkhTjP3ljrYD0RQux3LSWDdyIwtTLcKtsjBOf
         qMxKada1k0JZWhkiRSGUGoZkFbbWGssh+ONKkMV+YrDXgirpVrr3XdhjZ6E5hyOnrXT8
         M5KkfDvAqxJ/8yVtWuvYqCjAtcGmn+D5VE03ZPKaw/L+EfAYtW+wfmJo4JJFlu51pH51
         gQMyeminri+iBFYtEEM5ytjSNnfER5g4CC0rJ0L6uFfnQqnKMeTWbQ2TJ54M0Cu3I0T3
         9sLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFWeDY5D7ISgC9+7X2PO2vF/ZYhMRGe6SL8/r/l3IulNZRlTMdKldsdfnRnIc7v3Gf1rQBbslsSa8co2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++moZ2xW7LAThA/cQkSkwXiyIZXF8XLhXetDdSzNrdaLjBkSLyHh
	WXmrsrEvfNcMZJJUz1S8GCsu+Jy9VxSWJYLIxI9YM4XGNybSBecpYkKV
X-Gm-Gg: AYBFou16rsN4GWAWneNUE+U+sgKcpYKn0WLqOexmjbyv8CWAA6EzZWqJ3bbxBwi+Eb3
	NC0rJB5nCQ4w2pP93dAOa26h7tzpglDE+GyR+VH2wYCaStQ/hdu22CHi+TC70D4T5X/+c3IGD3m
	cq/fik376XsUpmzCj2Zl6tWAt749xNJH5r9gDNzzrlVRKoG5ZPO1KYqfYjB0vbmtz628R4xCKP+
	LoVdmQBO8V1yYuR4faPE26ZsRsCx8N4txmOwlgnhU/O9HR2QvEwL8U40nJ2Xv1BPVZZYbi2fvwU
	rRvz2at1w8XuS7rQansPjM2K21kcqw+6coMDMHu6Spau9aFJpbySTY2R7OKzc7fQ8dkJxxiO7cM
	mvEhH457UEb7RGQl9Ou9NCD8Lqxdo9OzptHJKyWRa0YsuBbrcD2AY/4WG3XqLimhs4gn3ImNArC
	621JoJR4LWSTMtagnL/HHLiAHQyuYgnwkr2OStAGoLw++OBnbu/zDs+RolZtmFR9ArPI3csWTOE
	aWtSXAKKyWAT7N7fEKQ8bDgb+2CYQ==
X-Received: by 2002:a5d:5846:0:b0:485:af9d:cd1f with SMTP id ffacd0b85a97d-488670b509fmr990235f8f.51.1790111699834;
        Tue, 22 Sep 2026 14:14:59 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:7168:5af1:a975:cf85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm1221672f8f.2.2026.09.22.14.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:14:59 -0700 (PDT)
From: Christian Melendez <chrismelnu@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Melendez <chrismelnu@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: add missing entry for b53.rst
Date: Tue, 22 Sep 2026 23:14:39 +0200
Message-Id: <20260922211439.369917-2-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922211439.369917-1-chrismelnu@gmail.com>
References: <CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com>
 <20260922211439.369917-1-chrismelnu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/networking/dsa/b53.rst is not covered by the BROADCOM
B53/SF2 ETHERNET SWITCH DRIVER entry.

Signed-off-by: Christian Melendez <chrismelnu@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..a1bf40c70a5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5143,6 +5143,7 @@ L:	netdev@vger.kernel.org
 L:	openwrt-devel@lists.openwrt.org (subscribers-only)
 S:	Supported
 F:	Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
+F:	Documentation/networking/dsa/b53.rst
 F:	drivers/net/dsa/b53/*
 F:	drivers/net/dsa/bcm_sf2*
 F:	include/linux/dsa/brcm.h
-- 
2.34.1

