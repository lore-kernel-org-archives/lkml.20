Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD7541E5F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705472; cv=none; b=sv+me7EchSd6U+r+o6otZbqFjcN7mYBNXEQWQc/HFHkZ+P8ZqvVKG1QaC03OqqYT5M6Uq2uW8NNhhQCRjr9fDXG0WDzBg15u+91WTjn1I5NR0+0UAEj3OAwkxdVdqoaSZem/zdAk0m3VLf7S5NQE/MqyeAeS8N1tdhGSnCCDA/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705472; c=relaxed/simple;
	bh=bFC+TshhTmM0v4253iAy7r1VYxcLXC8treYolVAgLgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bTk1bjTV2XKmh2XPPH8c5NqkAEs6Ch1TK1aESIpAKUPnd5rMo4vBBvPxQFeV4IfzLp1vx9x6LEVL3RDStaoFQ3YYN6wNVJGziZtf8BWNkxfVbxGEOGgVQy6Jxyz3q8cnVB+qttaziqBKvTn6sTDfSB9wqP2gfC6ryixxUVxhenE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2QO3N/y; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2QO3N/y"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so1935062a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790705470; x=1791310270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Civ9zmYjZCgx8nR3DY84Bu2yh9FlAvluUU+pFA8atcM=;
        b=r2QO3N/yy1gTU4TdtEND5KbMyxGJaaa0GqoLLmfW2PJYZO9FiqOjXHKNeioo/SEya9
         69YO68PyWk0FV2blPUiLJFmO6tDGKTxN9YnVnxtaQ4JvQTRnadn8BhHRJJ9RiUrdQea4
         69TSf9aLC0Xc8o9vt5tJOnK4lmJCFG6ILmO3xarxX172BR43Kuk8Rb188/oXYz8arUDb
         xW/u+E88awQYcahT4aVnyiAWbBWzJ90LZ8ZiOYLJOx8v2dV2niffUHSVmLyPM3Siip7U
         IKX1FCl5iL/nMSfORbJPxzS6APRi+1JCopuQaAZDFSG9S9wYAFTLGxfY9mEVfWluStkJ
         kYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790705470; x=1791310270;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Civ9zmYjZCgx8nR3DY84Bu2yh9FlAvluUU+pFA8atcM=;
        b=wdzq/uR5oP6TWh59+w2pQAYq6LX5R3c23L705sN+c2uX8BUhfQVrvNFA75jjP/SXn0
         N9Y/jLlXjFbul8V4E0oEmltSdqjkVXVpgck21QBnu/dCAysc0tPrftkQUubYA/lw4880
         sCpzGb54Hf6qHUy6LtEEx3KtFs2xdsGIPoENDojThu28EQ30GF2i3Bk1A/qPSBl82P5t
         hVsatvxFE9sl8FInphhqBUBWxykXS7Jir8m6cDAW5QPMVgXxNSZVdnMTXJ+kUUL/oOU2
         2vggyeWNxf5AUw/zgpkSSMRf2YllVHjLSIPR/RB8bM9K+t2ySTz9c2wMeKvRNX8TVH62
         1KCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn2vLC61gmrX/R/TT5FUVZ38KRNXUcPMkW7542MxesGZvEICYC0T9NTuYlFSwf1og4p6mXrHZZr2Liebs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqKz2Pb65sk9C9IEbx5+I3LydPhb5rO0Q3LfNsMt6KTALSpkfa
	CqjtJ+OWP59QYNpynWZjptd9mcgLyaPXqa8YNdun8HIbn1ZbalsbuU8r
X-Gm-Gg: AYBFou3dpHXaf/fl8ikHfOh/OcfLgc0Mj81qpQS1pGDya2v3FJ9Wn5v23xTEdAdkFUN
	0MtnfakJxB66oxFPGC3yvdQr/86u7GcT24v9hNWRSfwhKmyvw3F0xhSu8JvbZkGBaf0d7aEHBNo
	NCoQ3zyJf5bYJKCYsbc8O32VI8LB+srkiNKgAsHZBuQ2qh4r3udAzs4Xibhp+M1OWbuX/uuze6g
	juRe9HgrH2mC9RBLUbeOKPSU8nMXdfEHpbnWs3mYB8rAviyzCrqmSCGHyJHmW7y9W9inUt2hgAL
	Je/ZCJBWCX2tJyglDf5sixt0EagU/44OnzlyZmwhfXvVbXzX/apClrTsQTFl6zi9pMbhHC2J3QS
	qJq6gI80Y/PXwBeC+Dt1V2torEUWVf/XjpC+DlxM9rn5EVw53yQuzwpBNj+k2dA9IxTLUaXF49t
	yYjSgUGJ/ZUrDBfYkWQHQJKjKkDqFjvg4nT+24VdhO6TvkKrFLznyBfFhVXrPhIRhHDkOJGqfQj
	+yQPuS+cy0nntukh1LG9wWoedKthCI1gttxz7j9VPSZLJ9tQGe7z4fu4BJC8a8m
X-Received: by 2002:a17:90b:4b87:b0:3a0:c13d:8b2b with SMTP id 98e67ed59e1d1-3a4bfedd2fcmr109934a91.33.1790705470160;
        Tue, 29 Sep 2026 11:11:10 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1910sm6914590a91.14.2026.09.29.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:11:09 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	bhelgaas@google.com
Cc: linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH 1/1] PCI/ACPI: Remove Hyper-V special case in pcibios_root_bridge_prepare()
Date: Tue, 29 Sep 2026 11:10:56 -0700
Message-Id: <20260929181056.4746-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcibios_root_bridge_prepare() currently has code to handle Hyper-V
guest root bridges with the sysdata parent field set to NULL. While
this special case existed when commit 7d40c0f70d92 ("arm64: PCI:
Support root bridge preparation for Hyper-V") was accepted, more
recent commit 8d21732475c6 ("PCI: hv: Propagate coherence from VMbus
device to PCI device") always sets the sysdata parent field to a
non-NULL value.

No harm is caused by leaving the special case in place, even
though it is no longer needed. But in the interest of overall
code cleanliness, remove it.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
This patch does not just do a revert of 7d40c0f70d92 because
an intervening commit moved the code to a new source code
file.

 drivers/pci/pci-acpi.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 42d545edd7fa..452a90317c58 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1572,17 +1572,7 @@ int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
 		return 0;
 
 	cfg = bridge->bus->sysdata;
-
-	/*
-	 * On Hyper-V there is no corresponding ACPI device for a root bridge,
-	 * therefore ->parent is set as NULL by the driver. And set 'adev' as
-	 * NULL in this case because there is no proper ACPI device.
-	 */
-	if (!cfg->parent)
-		adev = NULL;
-	else
-		adev = to_acpi_device(cfg->parent);
-
+	adev = to_acpi_device(cfg->parent);
 	bus_dev = &bridge->bus->dev;
 
 	ACPI_COMPANION_SET(&bridge->dev, adev);
-- 
2.25.1

