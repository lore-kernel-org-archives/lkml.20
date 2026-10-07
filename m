Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7403C49A3B9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370194; cv=none; b=J07TFXqt7hKrZ6ofOcyGAhgA+yAODskyP1HefcFFGlBhOoO0FEItVUdA8FIUOGfdoRjIbOuNo0rWYsXoN8xbC86gMSPIicQlPEhC5s+Y+Ig7pVMqDChNlJWr9ch+OQW9f40qzTVzN8EgIJjzbVjFpRKeOC6C07grrq0PwH7021E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370194; c=relaxed/simple;
	bh=5B1H9FA7mZy/gFbNTlCD7iwhPS8Ucq4yIS3VU3Z7Aio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCbhhsuZ13wrK4pYu87pZ2a9fbyj/SLyBKt0Zv2pKhy8+rzNAPImBf9OjlHoFTc2sHx2+R93jKjHDolZ23L5iBihPZTKga0ovNqVqRUa9WMNjRs/Lp5NHoML0+rUNZQFydi46Ut1ygxbKrAxlSgUbl8Klie4ihgUFZWWrOOvX6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0j51NyW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0j51NyW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso344665a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370144; x=1791974944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KiCqXelSwhsxxAotTgryiWxi3hHYLhT7SYQdblGbV2w=;
        b=c0j51NyWhYmorxAQgLeZpQkP+VcLuPyGrSVEj7bgiQffm4hAGeaMwrbEKM1b4P4TGm
         V8aI3FZcm8geNnVCaf2OVjwkn4hIeChMxEGtwCiyifLuHFeK4mkE9/x+CwsnOdsAlkpi
         OOGjQltEfUjlRuEIZ0JbFn3zrNx7XiaU8eJy0EkuvlA56UN5vC9F29rC3rWyxkkHkTGX
         Z1IKez4gXQdvYzyEtxz2L3OBqKeqwwHKbmsXTxWylR/K7sYhinW/+dX5JE1aXUXFkqwl
         3vGWLbfs/GyZYAx7/hUZ51rQJ/AxSUagV+d6tybrLqoLoL4D03TJYSu5nO5geibG5Oon
         oAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370144; x=1791974944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KiCqXelSwhsxxAotTgryiWxi3hHYLhT7SYQdblGbV2w=;
        b=2tbxYJzBS62uGO8D16wsTvXjaIgzsvZ3CDvthkpANQdzU6RBdUQRDow5IsfzT4rWq2
         xbLnYJcINxspr3iykxEbYmTKqAQU/1rEFUWvZZIdsgCvvR/zg27om8+bdb9VV0HZfnPt
         r7mEWo5AJHr/NaMM9WItCq5LTEuU6h/ABDm0vabQHfpAvArAPjEbBS3aosXEVCpmT8DO
         JwsCtHnJiF2tt6TYsjlVHpqnPmkjTD8skgYHydSxR9/mc0xSFX6zSXG8Sjqw8yNx6jYH
         khaFF9na3x04YW0qrmRf95GGoF6iQhNYGeSSlUfbaglPlenfLHWNstrpx6Uzdacj0ILE
         ySKg==
X-Forwarded-Encrypted: i=1; AKwUvBwl4V1h9IN6iGO6Gt7iXMv6UuDTWHZMgGzgADIh0zkYzRHVlEXvGtFN7N9yWIJN7jP7Xt7/nzv0aEmvZrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiJ4bvuh8anEIo10uZiVZnXYr77HqNIdbeZ9VzjZna/EEOUh3d
	jjNcriBbuTxAAiVpLAwj7FKLO7onK7idyt5aVWs/EqZPPPPg3Yks0UcJ
X-Gm-Gg: AYBFou11pHfDZOIexxjRzHGQO+tXCw/+p2kiiook0s65F7eOfikqYfq5oQaG6/x/VYD
	ze0MyOzuTLm8LIUiEsTJFhsdrqhpQN8MRlSPzmsr8i1al7muJ6lXvX9HdnqhbrV14OErjEdvvwE
	vU82V3RW513e2X42SPtp+04y5CTr4sIIPG7lbEgGoJE90PbqHzIDUZcc3wvPoGzMzxvgjltYoEg
	EqodPxK6s6m+Gytxwd2jMC/1m2mKugbpSK6Wy5FTsGC3p+48T8HAgunICMh/LHm7dnYOr0UH3x2
	DGKB9wQTYrgA3pWc3oLwocm3r01lER5oRVl0AR+eDFncTkzlxEhqjtwzGL0XtYnL8sKhn1doIX7
	IC3L2sf1I4TPj2zzDKkcpXQa1vAWODEUlgfyaPFMlQNNQg6DrhtmGU2hpvxUisYZTv5Q1pPDsrE
	fUkSKV2w7R8HLJXMtu2/EgzYQsaWx+TDfZbF9NxXfKzVlKBIEjgzjmjHNoLFTrM7sAhHkWPitTu
	O3QiwyQdoEgMVgS203zbCPJdge7YxtxcT151F0Tn9rANxyu8xN5x7QCwwqZSvAR2VGdkjzgyIQD
	Z1/+nnGsl/fszA==
X-Received: by 2002:a17:90b:3c04:b0:3a0:a83d:dd0c with SMTP id 98e67ed59e1d1-3a8a08514e6mr1600840a91.17.1791370143411;
        Wed, 07 Oct 2026 03:49:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm9119961a91.12.2026.10.07.03.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:49:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] PCI: tegra194: propagate REFCLK select GPIO errors
Date: Wed,  7 Oct 2026 17:48:47 +0700
Message-ID: <20261007104847.507776-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007104847.507776-1-phucduc.bui@gmail.com>
References: <20261007104847.507776-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when the optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

The current code treats GPIO lookup errors as if the GPIO were not
present.

Check the return value and propagate errors from the REFCLK select GPIO
lookup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 767e11216196..5ebe01f72833 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1207,18 +1207,9 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
 	pcie->pex_refclk_sel_gpiod = devm_gpiod_get_optional(pcie->dev,
 							     "nvidia,refclk-select",
 							     GPIOD_OUT_HIGH);
-	if (IS_ERR(pcie->pex_refclk_sel_gpiod)) {
-		int err = PTR_ERR(pcie->pex_refclk_sel_gpiod);
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, pcie->dev,
-			   dev_fmt("Failed to get REFCLK select GPIOs: %d\n"),
-			   err);
-		pcie->pex_refclk_sel_gpiod = NULL;
-	}
+	if (IS_ERR(pcie->pex_refclk_sel_gpiod))
+		return dev_err_probe(pcie->dev, PTR_ERR(pcie->pex_refclk_sel_gpiod),
+				     "Failed to get REFCLK select GPIOs\n");
 
 	return 0;
 }
-- 
2.43.0

