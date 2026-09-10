Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC13B776D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015523; cv=none; b=hUo4MgI6G+ZnEF4S3W3wioDmo8Ow4h54p73RRcOxw47NG+sC8Qei58UG7M8BCPuZF/1QN9RnkhVDtuis8ntKMRUPEyaOj1T2v0twxi9NQ6u3l9Q2tvKsNN9+fnSHTj4CzQOevmyPHFv0wure5y3mdqV+P5YEPHwiY+Uzr/cFOd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015523; c=relaxed/simple;
	bh=641/hAQ3PQ7EATgNp7+c16jNxnhK3Q/BjlKPdFMsvys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpUyV8gYkR+rzf4GFXf/sUGzw0TaUdIay7DE8iZs/EpRoBzgwFbG4iu3lUHc4MQfGamUB/QmEnKwDP1IJaiPsyztIIdC3d5ymwPfDl4CGfSpMiwzh0+oHAh8UWLcwEGweXe33m7NdLPahDYeP2HcjpYdaDDFv9FhQBW5vG2JX/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtMo+DDa; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtMo+DDa"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c5so572262b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015520; x=1789620320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsQHftUl3QWGyxTvNBlAfPqa3Ul/K9RQ61lU4+ghrd0=;
        b=rtMo+DDadpTU3bnib53DglY803p98uG2u4i2Sx1yECg32bUo7F5r0aFLogMRFz/mhu
         cWD3dhHCViWRwAxHUtEGzOpk/b2wsYc8MoxqrpiU36MKFwHg2djPjhJzFjtGiuR2iNSc
         nDX8MiEAxTSdzguodSob898ZRiIY9Obspv/PO8AB9uoGKJ54D2H4+K8Ezanl46BhhnsP
         pyGPam8D6VTCfmfXB1ruNUhVJKk3gcOOZX6aMM0AHkf/FPOMQOPk1H9hLcGHeDix7riL
         t4Igipw5mvOiZHEHjeUFNK+i9/m2pcldlmE1gBooMyeCUS+l4RAsnOEk1BAabFER+Ixl
         0I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015520; x=1789620320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsQHftUl3QWGyxTvNBlAfPqa3Ul/K9RQ61lU4+ghrd0=;
        b=WYLUzBVDZ2Hf2g07hqnjzYguZZtOmMuiISH4a0Vk2YNwZbGJ3aZqXjMM9D/RuwBX0m
         1o00B/NWACOoB/ZtHJ+aleTkjPdf8CXfjNeMX3kr40GPGuxRPrZSDjo8MY9Ee5Po1ecH
         7Y15pnqelpx7hYePFXcdXciYZrP3tr7jUo6ZPuvItjxscgcPWDjuiKM+kbjxwUfb1Bvp
         E1Ju0v41HJLRfgc0WoiafhkZRi8j+EahX3qG7TehQNWma/zOOchkbNU2s+dKIdJg6RAK
         +qcCDc5iJ8o3He9jjL0Rm9pFd5GtXetsw2kWEXHP8dLzskkr+8Y4CY28MDxLOWqE1IIP
         BMfw==
X-Forwarded-Encrypted: i=1; AKwUvBz1fvu1rCm6cSMtOemvILdZg0bQ23U3tvzPYXofv4sCrKVptOxuILc+Tm9YmdllwpNkIQ/faSDxuIxpL8g=@vger.kernel.org
X-Gm-Message-State: AFuF++kL6uGqu2vxP2cQzSZcd0ClNu3zB8kE+sG6WEDrRySy7WWHrijS
	d4h20H2kvYx9Dmc9sUAMFQkjZjtuRv8i9J2AmBtdU9Xw4KG5wYWKePKA
X-Gm-Gg: AYBFou1QNT+RWE5yZAOBamxkLIgeRnh1Mn71qGZ9haf9hagb9gyvxuveL9IbBocLfVc
	dVQd6bw1ujdVc1Ltaa1L1DbLlzvYfoVm3zsQqKpQsg1Q1ntITvYJ/0VCBed6g2oE3vibmD7Mlix
	yx/zQ3XSMK2xghwWpTFX1Irr0zRCBgGZ44TwSHG1LRQqWKcS+ApvbVzInWtwXkAQBZxRxaKpzCn
	kuP9sIE7nt/NpfBw9NNbo82s8Cyi+yZ+x27FDkqlvVQi8mFYOYFyUZ5z+Tq0MK0r8cNHtvPR3Mz
	uK01x1A1U0qH/BAlGo9Lw7gW+xZOtcZfE7UezSSZuT6sx1DN5CGlVGx2JHnD0A05fVsDskxT8oP
	+JVKaMKTDMOot1GpQKoP47hqzoDwDZ3CSZv5qES/XYWov98T8q0aH8NZ84GL71ogSIVqVX/9dMr
	y+irGHU7Lbt9ndYWSB4LG38p8fx8EZHYQVc659ttRqIkiCj3Z4w3ktqpyu737JUAKF3FtbIwJLG
	Bso+lFTTro9HvPNz3JAUpG2xA==
X-Received: by 2002:a05:6300:85:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dacbeed903mr8921235637.14.1789015519940;
        Wed, 09 Sep 2026 21:45:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] platform/x86: panasonic-laptop: Fix typo in the file history comment
Date: Thu, 10 Sep 2026 10:14:41 +0530
Message-ID: <ffc97dd04a02c81d433d031581d9a17c703bcbb3.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve" in the v0.4 entry.  Comment only, no
functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/panasonic-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 19d194ff37ca..a3597344edef 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -107,7 +107,7 @@
  *
  *	Jul.25, 2004	Hiroshi Miura <miura@da-cha.org>
  *		- v0.4  first post version
- *		        add function to retrive SIFR
+ *		        add function to retrieve SIFR
  *
  *	Jul.24, 2004	Hiroshi Miura <miura@da-cha.org>
  *		- v0.3  get proper status of hotkey
-- 
2.48.1

