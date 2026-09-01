Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734044A0F0E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289492; cv=none; b=mib/JmCTdc1DB0LH98YqGvXIbDsuSCiVLFsQ4f/FuC9DirOL1jql7o9Ej0yOBb1j7zNCkyeAPdo7vk29Ri161j4pnut1LfAtwBGPn/zzoc/7cnAKg0pXraxThRPVEU4S6wJN9rRnaNA2klACUaY+hvh8UjqLvjnxFXWsjZMDI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289492; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Np2ECd8zAQQ7TSE2rSFAYWuNeg/rHRtHVmCLbJN5+AKqFwo1CBjMOSUas/msgE10yAHM+268Oy1A7LXhPOLNzv3o4hWybsFumSPflgeDpGSQ3Hox+1ak+XqWJxFMPXGUDEiWsu3kRoX8rrLAGevNzLuEKU/5+JFCrb/VPvvQMOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XA2Qxap8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XA2Qxap8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49557167508so1407095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289488; x=1788894288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=XA2Qxap8lp9eMLlFDXMHRYbohfJwxvynQ9UuW+5EI5uSTdu6hg0rZ+yNA/b9b5PVIY
         2FqsEFS3ynWifjtN0dOO7BbtAe1j5+guT5iUkOlKnXASFElpMbYDu65XMnT9co0Vnh2s
         qSHsQKV6UIP6MGPyAfeZw48Du4CfMdM98y0kTl5SLqEUUz5rl4o0tB9UNYFNgJumeKjQ
         /BdYGL8Hgd1f82RQIbmnk446n2t4MPc70fvl691g1bqEraYpAXmKgopHez3bQcmjzYjI
         1W7EsOAlBIMYofxKjV9A7IJHsrX3k8XY6YAfX8TR2HWox99IJJNsZxrbODXPbl4O+1Qb
         cqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289488; x=1788894288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=dAvfBiJmCx0VbiPY3/bw4qQPURj4hRedC70ef6igSEFNpAC0WpcPRVSco4dGreVJ4i
         DKszRBGG4XbAsJtzpBF1lE7z+jlh0SeV2kL4/fb3GVD8bJzeLscdErvBwCxDiGRnJjaU
         m3ptayWhr2RTyH/BrWEw57DOeJxv/E6+3pZumzDh0awSLfGPzi2AJ809hR+Fs+bjNjWS
         ndSDX6RQxMgwuI+WuEK3R7IkAGkUD2XE25X2tXYIGhVgQY1b8udXnGCpanPj+rCosIJi
         iBMs7DThVVQLexxY7ljPyqvCXPodMm5RNahVYBhjz7QXvqKJz4cJ5hdbjRo8b1bRjPbq
         WGeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXb0eyUZhed9Gr0ebKOolv/zCkw9h/2pGZBZelZzbYQix7XKBQ/7raJtx1Jc9d7xr9aYs6UNe7fNXMn3M=@vger.kernel.org
X-Gm-Message-State: AFuF++licFE3d1u9saKzA5DCGFrnBubHUy/vYmWFw53FNwy6DZnWHero
	8qEjDzL5rmdHe1O2Sz1GGMBw3zKS+qBz6d3oIEzuIPL0ym5jsybHthXZ
X-Gm-Gg: AR+sD10a7rlhSb/FBz8442vYDmS/yaIc8vxw0eYOJYu5Hc4n7/FNLqYiFSJpe06SBQm
	kG/aquXIxPKewOZ3kd5Jmj7zAnQ/Dkke04NmSF8blharLC6Agz1g1/5WzehvGZeZiDM8XPV6DXF
	0UCO77nwhQPQTpumgWa00HY2++pWVnVxhU88Sg4QjpGQcRniNZwi0sbrq2/0ahUSRKBiYQHo2aU
	ruULa0NQ+IPLHNweY8spN/vAj9jpJERQB4sYHhwJn2wW+zYfqrQR5CF/mOtIJDMVVpUCttiy2Ag
	hC8n4bbE85LrYDBQ0XxJa0vvPfd+eXCuJvQFWhh4JawPo2jgysuiDKLrufuCqEY5Y2WLweoN+Wn
	NQvSiZgi+1Poj77ndpKqFLxqmmjfN0tv0ik6bU7/Vi1I/J+8oKM6Owd0Gtq6bNwJF0ShNbPsiMZ
	HFYzUvldmtyMUbnpqmYIKt2QuJgG8FHxZzFRYJsSUeG70Wacz+e5d9jejvr+bPkYNyFXpNmu+4n
	6mpeUCUSBcM8RHsCwW5oNtH1m3vNnLpV0HDykWc6g==
X-Received: by 2002:a05:600c:4747:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49cdc57bf3emr158663635e9.5.1788289488556;
        Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Tue,  1 Sep 2026 21:04:26 +0200
Message-ID: <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0

