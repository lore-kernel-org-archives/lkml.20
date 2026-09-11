Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC438C42B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169752; cv=none; b=J9AcrDogkmgjRKVVm+cQ/DhnhNvILh0evTvUXkKuMs64rucaP5nOHcch/dkS9rWRjFBDD9JxJhR8ubHy5m11exQj7faKY6rTDEi4sh7sLAS3VoeeuuKSTJ3L49uy0wHQfZAWMAD/4H+C1Iusa88kkkmH1t3TvzLQ1PLMxD/riQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169752; c=relaxed/simple;
	bh=gm8FLDFOd5PNU/XMYySl5EipqTgCJEpfIrzqK402/WE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AoVYxYgJIHLws9Ynnj9wJDUuoyLCDPbcuAkkUnvrryZgeOQ9tKCwTL0xKm5n8Y0oONB9eU34fTA+rr6mcRkf6XKqrclEutmGxloEpyKP3j39tFpAVOwxRm74OidljZZXAA6JU32Vy651HgPpF/xq9L4pGoUuFBHlJBPaysz/lEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=agyq7Aao; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="agyq7Aao"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-66fb2fa79f2so1141046d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169750; x=1789774550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2fm0ws0RI4s9RoRTTFvcpWCb6oGc74Nxq3EnwLBIAc=;
        b=IUiUNolarJZDnuqL181XfF24rOvGEIudAcYyagiHUT+l6OgY2t7pefnL1arsCdBK8q
         5dqRfk19Kj1HT308cJyVmoNj2Cc7e4kOylCxzDK91W+uo3qq0eJPs/scV5KeeIq+wEJM
         qgsH27JSWp3lM188wNJ1gm+5vt1NZRq5wjJkASgmz/pNRLLq1irqg/HujX/tyqxxHRaW
         wtMuddH0K0LfNmYfMvz84QPYVxAzX2/QX9wSIAqNjGxx+SWnMpnpllZuC1hOVx8jaRJN
         0rBAg7vqsG+RvCj7e7KhkOxNkBKsbgbjNaxhKZf9jNvADJ3QBxoAz5BZ0iF+k9WnRzKx
         674g==
X-Forwarded-Encrypted: i=1; AKwUvBy9yLLOwfGQ+FKmLygKIN+s6pMdgMGI1DEeCv88uECSCzc60B1sutAC7rTLX5ieigWQOaWR91z5d7O4LyM=@vger.kernel.org
X-Gm-Message-State: AFuF++n9Ca+YXGlTyltj+5+JGgJ25IRcAk2Kwmx3QYl1edmG5Ua6riIk
	Itt0/x2hDKz+BkhHRfhKVZTc28dYHJZBB7+ZQqCqiTj4IBYIXD9B3qeZfaTy/Mn4hhye+ZoCfgi
	ukyKp5IumijJ+DXKJhH+YGB7wMdAIyh5DQkH3TkWDQWp//qM2vUeWJUT1RyYklUxWia9+StwHei
	N0LLD79jjCtnC3hXtTaNSTu/kEtxLmnPYQ5TwmnW5CBtALYjms3BfuHaQDTTbK/hpSboT7XTSTM
	buIWyr857FjsXeT46k6
X-Gm-Gg: AYBFou05GVKKzbQdOMTdBouNRsYP3LqjW4hpc2Ph67ke5JV/AuUmmyDMEFHUYxi+dPa
	rJqmaWy3or2Cenw0HbIdf6fTz690jzTRWLK2w93NSFI4aeGhuW23OfdCr3EqwZ6UwQvCVZ5XLR2
	fQyNCEN4P1VzoKxlMQhRvBaVuP4+Y17ItdIF89SpwXqAtg+oakT0GNY9LLL5ltKXHqRUMWFEu19
	cHRMvsAcG3ZmGyDEeiq1ByOQk1pxPaogOh6VJkRar4Ngkp5XcSoMrnTAuJ97c/CFNiPwU0J/Ga8
	cGTKHKCFvfKpf7lVwfZu/CFmMBatM4SuHbaIeRby7FfCpKlE8yx0Kf0k8wWDFNT3buhrmCCCmCs
	KjfrVd3WW2s8SZseP7GXPj/Ae27aiArjVK0q9DtyOqxWtE1AxEcgFFx3IpfIIyUE0+2juJVVks5
	UqxmLkve6ymJlqh8syPUDDP4Xi0fXVRQBj7wLW
X-Received: by 2002:a05:690e:1c0a:b0:66f:c1bc:4089 with SMTP id 956f58d0204a3-67135acb514mr80987d50.76.1789169749931;
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67125b7d75asm134565d50.2.2026.09.11.16.35.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so329415685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169748; x=1789774548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2fm0ws0RI4s9RoRTTFvcpWCb6oGc74Nxq3EnwLBIAc=;
        b=agyq7AaoAhnxpaxQe5nJqFpQRS/b4NutoFP+BL7ljaM9Fbm2gvkxGafMrARpQorFt5
         JEZv0NhnNw5ohiu2xz39LO4nxm+lHg3+zEEEMDmg/kKZBm5uA6jRTLwnDszPhcbPGxj9
         sFqobIOK58AELPbOzAaBqtCJlbbfCRaJt0HLA=
X-Forwarded-Encrypted: i=1; AKwUvByKIryfPGkw3G65qfylRiwSKK4mOscQo/zEeMEDMUBFGmPEOoLWmYQRblZ3IIrCD0CvdOsa98o8ZCK09wU=@vger.kernel.org
X-Received: by 2002:a05:620a:2982:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93a038b94d6mr83404885a.33.1789169748381;
        Fri, 11 Sep 2026 16:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2982:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93a038b94d6mr83401085a.33.1789169747922;
        Fri, 11 Sep 2026 16:35:47 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:47 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/13] PCI: brcmstb: Remove redundant const specifier for struct fields
Date: Fri, 11 Sep 2026 19:35:26 -0400
Message-Id: <20260911233541.1650895-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

All of the variables using this particular structure are declared as const.
There is no reason to declare its individual fields as being const.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8a0c353d2abf..89aaa19d508a 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -288,9 +288,9 @@ struct inbound_win {
 
 struct pcie_cfg_data {
 	const int *offsets;
-	const enum pcie_soc_base soc_base;
-	const bool has_phy;
-	const u32 quirks;
+	enum pcie_soc_base soc_base;
+	bool has_phy;
+	u32 quirks;
 	u8 num_inbound_wins;
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
-- 
2.34.1

