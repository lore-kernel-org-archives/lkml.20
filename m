Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F322E62A9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917456; cv=none; b=YepkosD5jMe9nuhUiSTBGH5T74Q9wY21nTmtQ+dKaQ73xhdtFmt6uqI9PJWjfKNcK/rwlzshk88t/Karl9rQ4j0K7VT2o7KgF6l5zZfUuS3YJPL+UUtHhZrLHLIPhYLKxZIGCl6MRW4M+wiC6apmlStlF6c2RTB0RdDBXN6iG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917456; c=relaxed/simple;
	bh=7wMkTNUERnaBjBTCO5sTnBvLOxumYwX+e0q8caYes/g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=u5OFTaZ8vxE6l8I9XD4ZAnqBs4w/78PXbbviflLGXmdNASlLqwaI6tk1VNnxhqIijcFoXZMb2mpDygB22qlzdW0HXnSmFB55KYp6q88rNjTWuHf5SRSGrswCYsz5NVXhnqBA1R6nDrukWTnQ3ydIcL6ts+u93CUpA7v/eCwj744=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMLXxVe6; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMLXxVe6"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a451915d8aso4868166b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788917453; x=1789522253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=95z6ZToa6ULbmEQJKG2ytEvJnP27Yp1f1HfgeEMdNVo=;
        b=XMLXxVe6q0b20dUefFNbKdDIgVW9fF2gF1+ndPzqVkcZwCXG/N/k52XN4Mq5tDW6iq
         aAOtgfgXP7kqpGKAGm9tTFE3WD+GociL5EcyKPjLz7q5jJFC7R/pAfZZsztsUYpOpNFC
         6BeoVccT75zQK1c560jnzwxIqWT706FThT3kAxkeGaCCFSjcjVjJ5jpkWhobIM4lbWg1
         GXQNlxDC3qklynQTwldoYuWOsytq8beyeGG/SKfNQLH6k6p6DidFqXSQpVziRP3P3DGK
         GFhaK8x7ARdkQ4r74lRRkOpw38rpxp69Ad2s0HriZmqagcuC2sc4DpspvGeLjj+rZzQ8
         jRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788917453; x=1789522253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=95z6ZToa6ULbmEQJKG2ytEvJnP27Yp1f1HfgeEMdNVo=;
        b=FrtJIuwtNhpKPE528uo0CvNkhZCNCIIPdW+8SyNvndXQF79hb7ZufYFH6PfhSQzjdn
         VDCyI60AYtbRo2qXRwy5bguuZv7RAcxEa4ZvyQzdUMox7yjdjqHRAMAXdkOnfntNAZk7
         2JLlAFeWuO9fH/x9CbLxHDeJJAgVRbWfY9Feh//EQSDSR8R5ZtbIMUq22RKVuvdjdaaw
         e08RDmC0+T2smfsy3uYLwhxvANgYfw3YKN+wFfnV3u6m5jwpYzR6ZbB2zphzEVTzNDLx
         BOEnnwjvKq/Qq8OoSUnS7ZOzGKnxa4PH9hgwIRbdAxGy7KzmOFGIPIjFIlO3wJJK71lf
         GIWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzknNgv+7xE+gQguL3O0ABMyOvslACa9g7PrmM+zsQ1KDHTRKewuYByrqUpcQt4PIGHKgUozwDpxDjwtqo=@vger.kernel.org
X-Gm-Message-State: AFuF++maPFX4n1jJDPXgasccokG3rmd81UOpsFzamIOHlZ+iwlvVzJUa
	S6zql1dpFrFm5Brim6+QsnLBphhUmHHijqHE1kTNSKTVzshd7GWS6NQh
X-Gm-Gg: AYBFou1/taH6dbbgzm36Mn/lCIrnfwRj7juVClt5fkECNDqNORtIUvLvwkwMN7xJlRs
	RcozQeL4DZo1JQbJdEQXNs0mkJkFxmxvGR0vofyJqekKtInOn+yPQYJCy8G1UtXp6aeEAWUFgMU
	U7VpFsabzFH6gLxiygCrv4ZNcu3FaF8w6YVUk/iCeFTLrdXlJCSp0qheXqtmEOukTH5f++FDRrf
	b+1w+J8CPk4/ZKObwglxVw3yZHo2wZ5OBhLiIxKxNNrCBwSP5YWPWXepRuIJLtQ5A6gdA8LoB0J
	VJfLgRQHD8LwaJY59b1y41VEsaJIdXCdcdJWI2exl8IpbLMnw5MbK+61kb14xz6hkTks/K9EkKY
	AhllSRzLyo8rugkwB6zE4yObG/OWVgQmfvcN2JCVFXsYk0nAKsiEJONyfJc+A0xL5kGsiZHfaIb
	/FYHmxA4yBp+FWnnpyZxl+5rPFmb+zICOotRwJYbeOFh2kfKMou3hfMznhaxYvnmj25tpbYlOOy
	hb7NRNhBGK4EeJCz8nDDO+gWQ==
X-Received: by 2002:a05:6808:d4c:b0:4ab:230c:5faa with SMTP id 5614622812f47-4b9645205bdmr19640115b6e.18.1788917453364;
        Tue, 08 Sep 2026 18:30:53 -0700 (PDT)
Received: from david-hassan-Inspiron-15-3567 ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971c98e07sm14177197b6e.18.2026.09.08.18.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:30:52 -0700 (PDT)
From: Fahmy Hassan <fahmymohammed@gmail.com>
To: bhelgaas@google.com,
	fahmymohammed@gmail.com,
	kees@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] PCI: cpqphp: Check pci_hp_add_bridge() return value
Date: Tue,  8 Sep 2026 19:30:28 -0600
Message-ID: <20260909013028.508870-1-fahmymohammed@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpqhp_configure_device() calls pci_hp_add_bridge() without checking
its return value. If pci_hp_add_bridge() fails (e.g. no bus number
is available for the hot-added bridge), dev->subordinate is left
unset, so the subsequent pci_bus_add_devices(child) call is
correctly skipped -- but the failure itself goes completely
unreported, making such problems very hard to diagnose in the field.

Log an error via the driver's existing err() macro when
pci_hp_add_bridge() fails, and remove the now-resolved TODO entry.

Signed-off-by: Fahmy Hassan <fahmymohammed@gmail.com>
---
 drivers/pci/hotplug/cpqphp_pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/cpqphp_pci.c b/drivers/pci/hotplug/cpqphp_pci.c
index 81c58b1ec200..34803f36ba65 100644
--- a/drivers/pci/hotplug/cpqphp_pci.c
+++ b/drivers/pci/hotplug/cpqphp_pci.c
@@ -100,7 +100,9 @@ int cpqhp_configure_device(struct controller *ctrl, struct pci_func *func)
 	}
 
 	if (func->pci_dev->hdr_type == PCI_HEADER_TYPE_BRIDGE) {
-		pci_hp_add_bridge(func->pci_dev);
+		if (pci_hp_add_bridge(func->pci_dev))
+			err("bus/device/function %x/%x/%x: pci_hp_add_bridge() failed\n",
+			    func->bus, func->device, func->function);
 		child = func->pci_dev->subordinate;
 		if (child)
 			pci_bus_add_devices(child);
-- 
2.53.0

