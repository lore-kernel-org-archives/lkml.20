Received: from mail-pz2-f16.google.com (mail-pz2-f16.google.com [74.125.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575094457A9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248955; cv=none; b=h9Mlf7grjILGxZf3FA8V0XPWHVtLj27IKgG5Ez9VduF8PxpkTEZVqrTnWsmwhk9YP03sIfXUX7Zi19QygHfwNMFDbjjrMGbtItGBRWTpdIHH/S9g8McHAt9lxlYIucQJ0gxMY30oOtBueOuwOs2YJQy0boP0ajd3zgMAIQi21p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248955; c=relaxed/simple;
	bh=BfVg1c/eJXh5ALcTlcd7kVDGGA98KOhj6+MnEzGGN+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anjoX2J5gZoNuynJCYEqJR2CjENbgIPW6YPq9gPRISQojyWTsnoeo76NsAtYwlgWJzPT4fR0w/u2MToygSFUiJWMqPRWZ+SKv65VVi8s6KZ6ciDvyxjfA2LskHyQpzrmIxnBd6DJNfRCnh/P8BYdjs+9naqPP5sSBuwiPjAbL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEsYKDAo; arc=none smtp.client-ip=74.125.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEsYKDAo"
Received: by mail-pz2-f16.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so849031a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248953; x=1790853753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PB2AbPNDtuoPmQm1r7uEfjoRlCCHln+KQryPky75kA=;
        b=IEsYKDAokd5GavmL+VtxlxvGrLcNG1y/uEGip/E8ZsQ9ttesqKVZ76TFlT2WzDpRPf
         j/RE8vXvx1CQfN4SA+TqDFFn/TCEETyxMSBN5V2HYSMwMpBCM/ypvK3yepKw0IreZ7Bm
         mYaWqpfmhffjlqnHrEM+VBjGrmi7aw/6sRHAYkmjqMueqccJ+wpgHk5krWJr9m1Z983O
         8PA1xmb//wMJXtmRrfvBEZvOOhWZ8MJ1BdO6IFBAMvO8oNPOFN6I7/P7DgdyH1pQMZ9e
         X0txfc0BXBfjJkR+R0KQNuz64CEL41IxO2v1myLvWiY8ST6Ialh9BoXqiAsnsm7OAyla
         OLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248953; x=1790853753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2PB2AbPNDtuoPmQm1r7uEfjoRlCCHln+KQryPky75kA=;
        b=gCP1vYCPsTaTfeCWtbd9JBeme0wn5Hbn5BJ6W5SBrheaeyMs7ETexbI+7iJRzMAHHs
         NuOd++RiKww9uTYrxcWBDw3biXCr4rl7D0dDZRnSn+6e2mRCrpYFwWpb3pmU5rUz57Ts
         GI519kFDocTLRCjl+Be43YMFX6CfVq0HQ/UUtHRSSjk+4htA8vKLWtCqLg94MbwB/6qj
         42TC4sWiDMeeBna5xupfpWwtcaPUMJSbwkzKjfQQ6SbzG3oH2jbLmVbxnZrW8cdGOtFA
         E7yUinAzAVL2tMjwuddbtye0KA1eyNsaDdpgkSmUpKdApsYyNlRSnX+DE1sumPkPZrKF
         +aAg==
X-Forwarded-Encrypted: i=1; AKwUvByh3cBwDhQOLnVYovxdZIXX5dYOYSKNa9+u1UVDRV6dYgfzzwMdkGe+ZrTWBjAzTm8MbtmAnHzMaMbls3w=@vger.kernel.org
X-Gm-Message-State: AFuF++lXDxzFhY67SVAbenAKpgJVCU4mwBfifugWkQngs4t4bDM7DNi1
	iCSgb7ekef23wZRE++xC1fE0GIWu9jLDDI94hFai+2vgVbYv+d5eLk6x
X-Gm-Gg: AYBFou2CiC/zPJn8ylKR69uhtXHZGCbGYkLdDd99Vl2q9qg5v91Ng1nxAGSZL9tIbV0
	59F8XJkJdEA4BwIQUCXSnxNRo32wZ0CCVwPP0sdAq/yTAQcjR6znhlEoxR84LJIRj8BGPWBV9pQ
	Q76q7KNfQuQELELtRYfpjjtEZplupbAWjZH+9bZNUo/GHc+hUOEZ+nEWU/TA9vvof35BOtSVk4n
	sorlUhkVNMAhTSHvwJKQSn8jtH2zoQxK97+Ste5wqhPHf3ql8IBgTsVW3xk3LfWhOHZ6pTAp2BL
	xsw2ziAZLD7sFa9GAijV/1VKn1UQf16NoyhqS5wF7ByFDe8igiVSJy2xVnDuQ8+VcvCo7JoTdKV
	A0bxTsarM1AEUK+SUxP8fhIbftAbEfXJmr3lRYTFTAzgAGkH46uyMtjjBisRWxQpgabgHxZIeo+
	F5J+lb9EWp22UztkDxqh9uS2KYR/1uXpXXhN1Qqb6IbXpEiTTGZVy4iQ==
X-Received: by 2002:a05:6a20:a103:b0:3dd:a195:fa18 with SMTP id adf61e73a8af0-3de0e96b06amr1996310637.61.1790248947877;
        Thu, 24 Sep 2026 04:22:27 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm2569713a12.9.2026.09.24.04.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:22:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	kees@kernel.org,
	lgs201920130244@gmail.com,
	avorontsov@ru.mvista.com,
	linux-tegra@vger.kernel.org,
	jckuo@nvidia.com,
	eeodqql09@gmail.com,
	stern@rowland.harvard.edu,
	davidm@egauge.net
Subject: [PATCH 2/3] usb: xhci: tegra: release padctl node reference after probe
Date: Thu, 24 Sep 2026 19:21:55 +0800
Message-ID: <20260924112156.1564208-3-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112156.1564208-1-lgs201920130244@gmail.com>
References: <20260924112156.1564208-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_xusb_probe() obtains np with of_parse_phandle(), but the successful
path returns without the matching of_node_put(). The probe error path
already releases the reference through the put_padctl label.

Release np before returning from a successful probe so the node reference
is balanced once it is no longer needed.

Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/host/xhci-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 6f235d1e117e..93e794b3343a 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1951,6 +1951,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		pm_runtime_enable(tegra->dev);
 	}
 
+	of_node_put(np);
 	return 0;
 
 remove_usb3:
-- 
2.43.0

