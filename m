Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ACE39E6F8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897820; cv=none; b=cjiJyKCs58jVCmGTthHB5+9ZTBB0kWtiVecnHWOG90/ECygCK2TbkbwJbFmIzRQ5DS387AZgqOiFQVs0ds8+JYZfbd3BaCqHa795PJL3jBQP8CyvV8FZ7JmQp12A/5/m3er+9h4knKcmdRWs4XkMj+9FVGR+nAEtGzS32GJaMaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897820; c=relaxed/simple;
	bh=BhOybF4SM988jmElaY651UMA0ZJ4hoNXScR86uq4YCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTjdyGd5If/ValAeTZtk2q9Xqsn6tjdoUnW243hHdoHO3qwkVGf2nnSFTt1LQTA3YoY0kTvAOPq08q+tTZBi1RtQUBD6/gAsohC4e5iKTJmpbFGJlrY4CNyxMy13zujAPKCciWCKjGrylAPmqzjfChxYk7+WQPTzcs2Uujd/Vc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIqcmaAi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIqcmaAi"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso29269345e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788897817; x=1789502617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k+Uf/HpFf4jiz8FoMkzGSbgKYbbCXOaImYMY1I/Mejc=;
        b=kIqcmaAiLXPtztrnc8o8G2NuJ2hMOXDX3MD5aQcaXfV32V8pd5/SVnbH/7Wysr9max
         xcAgB5hDA4xfkDU3+EKKu+upsbYb/Nblk5/xQuo1/yeiIaRGZrLe6KaxqDbiHyP8EO4O
         1yzzM7foC1ejhhO+WU4HI1uOETLDeTKT5l0PMa/9Tgj7CzG0lg2u4eqlG/pPo28kdQ72
         S663tmt3wqV/Ojm7F3K1Vf5+6JORquhsY8DtDbZDXYaf4769Ip/3/Cmsq1Vj0r8Vkfgt
         oaVVWMTxZ4nDpbsMbxCc05BDiynbSS3wPeBsckB950rxgw99rnqotJ/MrGsDXo1iknp3
         u6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788897817; x=1789502617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+Uf/HpFf4jiz8FoMkzGSbgKYbbCXOaImYMY1I/Mejc=;
        b=Bj0ka6DO0JfiYRrQfc3MWy0s+s3KmT5Nc/TAXgtdXiyMiKwP0ffa6eItEpzD8L0cf2
         kHmuDEplmm9egR5FeCQ+kc2CwCfr9koZ9S0RZ2f4QxNlioDBpFBa7kaaSvsKJohCAIfv
         lin1Lp4wFLVaWHkYI1gICojqTPCBf4m6n+1h6zJ8hckURL0dEAILjTyUA+5KzpPwMA4I
         2b0IwsSHItfdzBf//noXk+bzbRVwNVmag/UfYto0gpaHbIS7YUm9vgnYDNDuFhwwper6
         r3tXapnKPo7yuYCsViibhqoOGioYRoNST+wx4rB3RiWDjwz3ZIVnsAG8OWyoZz2X+bZu
         z6CA==
X-Forwarded-Encrypted: i=1; AKwUvBxbnkRnzqhr4k54oBxcd4+T11WHZKNITXXwyxSPvpjL2ANmaQAGbd8CGFwr3RpkE7QTIl9mFyVwu9RcECA=@vger.kernel.org
X-Gm-Message-State: AFuF++m7JzjUVItG+u9GSA01M4b+6uQ1veRRYQovBGCP+tK/urEiO7y6
	b4Hv3HDv8kGxz5AwtPCk7bFDOUreTS7NOCa2HJBa8EhXK6rpQxPRt71c
X-Gm-Gg: AYBFou1OXCUbp8jUadZrDULO5BEWxHMUx0+UGSPLFnh7r+1XYnvhXXgl+vpeZCXDZlz
	KJ9vbCZ2Nr/3M4HtU2/jIF2YlUOJLVQWAH3ohVUke2b17UouGDGIfkAYe8tZMzvarEUyFqI4pkD
	H3WgIe7DM7s8fHqmzmV8pQ00z9fjenfOO0UbTXY369kWgeMfCMBbcObsS835RKRjG4urqaVo8Oi
	fCTbozUj27dnPMLk0tkGNIWnDUXdoLOOSzIeO7S43MOyAHwsK1hlMCBs6DM1LUQqGhcWebfB1+j
	LOPmLxL1r/b5NLDT4PJ/gUov5Ef2Ze6Xms/OVOhxAQHyIa6ur2CKV/Z4wdVYSkhXvyZj8ZhbGjo
	3IfCPnZskduJeJpj0yelBtMWMoXs4Z+9UjmdTGQEKSdKB98OJUxTbfu+5WOcaGHF56yZXvpIS3I
	KfdkBr/RLQHK+zgi1W4JVQCjHnfFmAmsAGQ45gESGOfniICERp7BT/zEf4qE0uKRaknG6TPDuI0
	J3k4+2A3/JE8bs/7rNlmeh0geIR3Kss9X23ACxUhAx8
X-Received: by 2002:a05:600c:154f:b0:49c:fc6e:8cb5 with SMTP id 5b1f17b1804b1-49cfc6e8ee3mr317855475e9.25.1788897817212;
        Tue, 08 Sep 2026 13:03:37 -0700 (PDT)
Received: from arch.home ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm32503702f8f.17.2026.09.08.13.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:03:36 -0700 (PDT)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	nic_swsd@realtek.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH net-next] r8169: use str_enabled_disabled() helper
Date: Tue,  8 Sep 2026 22:03:08 +0200
Message-ID: <20260908200309.533537-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded ternary condition (? "enabled" : "disabled")
with the str_enabled_disabled() helper from <linux/string_choices.h>
to improve code readability and maintain uniform string representation.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index 5415ff62a286..360df5284042 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -30,6 +30,7 @@
 #include <linux/prefetch.h>
 #include <linux/ipv6.h>
 #include <linux/unaligned.h>
+#include <linux/string_choices.h>
 #include <net/ip6_checksum.h>
 #include <net/netdev_queues.h>
 
@@ -6225,7 +6226,7 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	if (tp->dash_type != RTL_DASH_NONE) {
 		netdev_info(dev, "DASH %s\n",
-			    tp->dash_enabled ? "enabled" : "disabled");
+			    str_enabled_disabled(tp->dash_enabled));
 		rtl8168_driver_start(tp);
 	}
 

base-commit: ab217fbb9b2169ce677b09a66558d5c3adcfbb76
-- 
2.55.0

