Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507088;
	b=C632AIS6GYJsHCHlE/ydoL9046A+SoHBN4O18rKJ/vJ7JhnkxgcYVp4W1k4mv3tuIfxC
	 DJGhOzEWUeQKJVZaoFs9Ot/L23cIfdJMfT+lCgxKSJzLclBKh2HPiwhSAXyAzh0Nm2mv0
	 GAGVf5h2QGts1OGGU1+BBNXNx9zARvQKUjwMnPAn7rNS9kxbESfn39bht4Zqd9T9sUNr2
	 gFtP1v3Y4myzXWjOXLrIZP+dJVPC99gvpCI/iJeEHtlhvVK+h91RU1p87In3mUhdVAe+i
	 ONr6UVkxz/3XUAZMGqkHLAxH9mRmTNk7F0Tk5v4aR2Ho/QE2mXqWNo3AxqsyeQ1TlVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2gkhFUEZhZL3R13P9KqCeOSqB0UlsNfQup+MwcWDhUw=;
	b=BghvsGtt0Wgr+OPWaFRwioAr1AlL+Oy4QufCq38Otr1QQ10W0ndF64pGAyBbsIBQJ+mv
	 FcexqRo5hljMQbYjzRlZmsHHYokMW+G3/0l2nYJ8XqMhamGLmQqE8WjJmJF+9vFj+iZUX
	 02pZ+m1VK8WMxWRoaE9Q0P1lKteRDqLg2TjWzg6pLDXrM6R6GzYMhSiF1r5CWbGzvFqn9
	 yxBSqMNCUmuY9WXwk1p2XtmERrZ6STQstbowYiZfdpihHkwsTy6+NWx4xEUD4wlJEBrCP
	 3sgek1guxYnvjoGr7jPOWkqofJUptbkTLAgeFgYs1BrPtu+pgMPv0pamuXqCS6/Sd/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlPF3Srp;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04175606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04175606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlPF3Srp
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f6295304dso146690eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794507087; x=1795111887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gkhFUEZhZL3R13P9KqCeOSqB0UlsNfQup+MwcWDhUw=;
        b=VlPF3SrpMuhL4dauhSEeZQot8mXX4O4FbXY6Pp73CAsEyX7JANKhHwFqxavpWq1D8j
         dXH7T43sZgKgenXAlJeuVNekRPpHy8b3/jgXE/EB0LqJuIVEU7vd4ANcaqtPcVzRZk8M
         j1KtSjM06xCfyrcslXg3skcKAPeEpKBPW0fHV2iR3Lthq1plavgzaIzCxFkrJ5zirBKv
         N+M6U6AaiZSUL2NRk3ZwFV0yVbAxcHUNEcfh53cYIi4Npn/2PfwIquSZGkvxppYidahW
         k2cnn6eB8SXkyoO8HCM4f0Bh6dPckiBwhAezM1yOM5EPnZ1xi30M03SJqrYuNGtr7Miu
         3wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507087; x=1795111887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gkhFUEZhZL3R13P9KqCeOSqB0UlsNfQup+MwcWDhUw=;
        b=0qo94DTemFkxdkVFSCQDSUeDK3k7sBcMgZLn9z4k8gci9paTll/9X4qEewMqpi4CDv
         NFbiXkL6ie4CCz0rv05r3Eu+P7icB9P7D0MYumN4vOS6wj+M3RcXlLhejaAYzhs5m9gu
         7tf0YXN1+DoJhAA/4oct3Zgwp2xilc3BR0E+yS7dJ57Ny01KvGtwdDrZ8LmZdQfYE4jE
         Eycb4lUqWwmbjo7nyz+nn/XDRz/a5e8SnMuo4pbZTEajroQzUFNUkMlVimhka4g9t7jf
         VQ34nWCj0BzfHnrysOISSQU9I01Yob4BHXaJfLCcHHq8bBHMQxtPYr9RsYrtf2CC5sDn
         +gjg==
X-Forwarded-Encrypted: i=1; AL+hErE1069fq8NCMLaCiRZ4+9S3hncaYnXzja2LHnkj3pi9W3yLETnPE1IoonwEJObRdynvnYukxVosPmbmX4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xI6nrsjFBcZI49lhttMW0p80Zg5KnbmE+AzmJKKXEQrTEhJOK
	v7QQE4I2U5gxucEhH2ySr4un1q0jAaqzYy6Hf6Mb9iX6ZNc7r5xxGxj6
X-Gm-Gg: AYBFou3NVA22T+sR8YNtWdfONX7b+4htCdiXZyM9xMybjtvyeqQYQznbb7/ZP2b3TEL
	Om+eKSIWgO6t02XSGxHk4VranA9exRBkvExQW8n77roR4J00BQeesUCTc/FQ9+vkHFbd+Q6NnzQ
	3f9T4DuxVzz0ayZnrgNXa/pslYTQ58uISSa8Q6txI56p6qwqJyvjzjEETRFcXXkjXxLANhULDV2
	075iiKZ/GZwN1+bqVKgjm2WIymP2FBm9QmwZFJhIj1spOYrJ//T4ZHm3vwo/KuijWykpfa4VJZM
	t1uEv6bDeIe/eQ1WY1mXbkK4NZSd5tUNShasqCXg0PB46cZtxzsUWknUy9sKfYcpPuysle/8cYx
	iD2QPOo51JQlzXQ8/WnrI0BGI65/44I9vzuV7HEF2vIaW6njb6OkNYHnSi0b+06kfStuNhu8Ro2
	/X6ThVGizg1mE93aRM2waFUklhRnbDdZIxCqNwZB4CpmCbgROeRJZEmv4fQ28SeEoITEfZb78zf
	US9ONuyCKq/mIkc2mm/1cmjV1dwcgxLsMalUZbK3o78k76b+ZAs953MP8mzoZbpsIva47/kn94U
	T2uOEtij+DQ+IYz6QlYxcM7Y05NM99JRJTbRGiFvnA==
X-Received: by 2002:a05:7300:d0a3:b0:367:185e:867a with SMTP id 5a478bee46e88-37687212a27mr6162231eec.38.1794507086925;
        Thu, 12 Nov 2026 10:11:26 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm215678eec.4.2026.11.12.10.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:11:26 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH v2 2/2] Revert "EDAC/i5000: Mark as BROKEN"
Date: Thu, 12 Nov 2026 10:11:21 -0800
Message-ID: <20261112181121.565824-3-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112181121.565824-1-andrew.luebke@gmail.com>
References: <20261112181121.565824-1-andrew.luebke@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 7556419180a3 ("EDAC/i5000: Mark as BROKEN").

The driver was marked BROKEN, instead of taking the slot loop fix,
because nobody had the hardware to check it with single- and dual-ranked
DIMMs [1]. With the previous patch it loads on an HP xw8400 (5000X) with
all eight slots populated, reports single- and dual-ranked FB-DIMMs with
the right size at the right branch, channel and slot, and stays clean
under KASAN and UBSAN bounds checking.

Two-channel boards (5000V/5000Z) and error reporting are not tested.

Add myself as a reviewer for the driver, as I have the hardware to test
future patches.

[1] https://lore.kernel.org/all/YyxpbRkuLPIcW1Om@zn.tnic/

Assisted-by: LLM
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
---
v2: add myself as a reviewer in MAINTAINERS (Boris)

 MAINTAINERS          | 1 +
 drivers/edac/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..e1aa80d5bda3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9702,6 +9702,7 @@ S:	Orphan
 F:	drivers/edac/i3200_edac.c
 
 EDAC-I5000
+R:	Andrew Luebke <andrew.luebke@gmail.com>
 L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/edac/i5000_edac.c
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 4c70729b0d3a..63f263c4263d 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -218,7 +218,6 @@ config EDAC_I82860
 config EDAC_I5000
 	tristate "Intel Greencreek/Blackford chipset"
 	depends on X86 && PCI
-	depends on BROKEN
 	help
 	  Support for error detection and correction the Intel
 	  Greekcreek/Blackford chipsets.
-- 
2.47.3

