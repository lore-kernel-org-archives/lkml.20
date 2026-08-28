Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D683890F6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933725; cv=none; b=HqMciIl4/Km1qNWOpYi8UpBsLV2jGSXbcBTZkOv7rblO6vSe+ebwWawqHKEMU2SUNA2eVhPqpHEfzyxOSFEauDDZtd4072TPOOeKZuvYRKl/4YbQHA1LQeplOLo6B1W3x94Wv7v70/iQHrWVZqITGgwUk0TBMoHF8yCxt2D3RKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933725; c=relaxed/simple;
	bh=lqjQ+w4LmrSC2rxWGQiBGYQWVk3GIrLSHHgwOec02E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oY9/RBPn9qblwgMhjBdXkvQWN9hUAiGWrl1VyrCIxB17g7ikmT5XEUYg78yL8v4FP+RTDXr4V0zfZYBwABEIkXeU9O4xVzAqh8ClQSCRjjWm9FSzDVVvHdZ+Jl/QsLbb19FTUtD/zs7vgbCQrQ4GRMB1hhTWf03lL/C8ABeoUdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hn/rbiGr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hn/rbiGr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f633e6058so751678f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933722; x=1788538522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vflBT2anqt8KmrCKKgDiK1zs1+RPR9HYzjd6nQjWsXE=;
        b=Hn/rbiGrvxscMTiAIc+bRI8lQia1v10ozZyY6Td89t7TEPDN+g8YkGlwHRFS2w7G3k
         eD/HUJCY0OuMrk8+hYuVSTH7bnCWnvR5p+3huIb8o5EVHJAju9BwVP6vBz3jNdK3eyFz
         fOc/2FqXYB7XQFRNsf7ydG+t91Z7BpEBMkLXRknib7fdYKiXspksIMghg+wOG6eQdQjO
         /HlWMuWjTUG1x+TfBHF70V7ufLU/qHwo9/mTiPHGCDjQ3Qmx2E7XIwDoTWSBRXKHHdUF
         mSdsyxKz/f74galT4eBNUfCM9n5hBdzovXu7bZeF2NENibtJJG41IjGyL6cW6SjNa479
         BgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933722; x=1788538522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vflBT2anqt8KmrCKKgDiK1zs1+RPR9HYzjd6nQjWsXE=;
        b=nPSy5CXzkMDofB6icjWQpeR1+0hIjOxHB27e7+aKcs0cF+QTQJd2vE7XBD20HAkEPl
         sFadePa5Mw5id/BXQiAy40GQiZlELvwbGi0tebD4uCJfqmSOuwSCz9d9pml3J+xOybkr
         G56zoXnn2f/pL+MYIBZOB8jwcc2sE+HnGypb8ww/ii4/t9e3wF3qq7RszsSfAkXmYIqu
         xgMjbS5EmaeCZyEeGSzsdD8YTBqSeJLh5jUj5+JSiCzUQL4SjhBShAqyUCpEtQV8UUEg
         JJIIYeYOS4iJcOIhieZNxXG3aQ8sVNmNmdJqYQX1UEhuyzX7lflSAidZNZ5AzXlZ1b9d
         /i3w==
X-Forwarded-Encrypted: i=1; AHgh+Rr7I4oWZWC+uzJBtid7QGobC9dV19yJyQziBnsCA75aaT52JyK7KY3wRDWZ/IVkZI4yOd9+7cO4nKdO46Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lGRWHCqkKOFtKdBlRcjBDb2aC0TrO0oOVxHuuJIXDWXoVJf5m+
	AxMu8un12I9PMQZxt7m+sFwxMPLVeG2PDKYKLsNdovndJTD1NGD+yaMU
X-Gm-Gg: AR+sD101AtxSHQ5QiDo47r0NObJ+3jBHwEPAW+3m0w4eFyMFhroLs2lcX9MlGl93ubz
	hwn2A9H9Um04oP+Oi6EJVL7rfuJLCp7yi8kmvwDCaepLQlRq258MBFduZ/PKz5SovTCAeKw3972
	EmEdtB6SNESZLbWpr+pJQBE9x/9VI3FDo1AZPq9LKM8b643ECsH8HdDZ7iS1cY9rzKQYCgXisPt
	ca4jJYKt0UK+V2debDHUeiWs3eDWPIGh5QT3nBZvtFbnyeQXuZyUJ/p8ccIVRZgdv8SOedWPMC+
	4t4Nn/SxlWkv1/3KHMMF6BSGGFRgjSVIBuvYCPrG2WYB/dfsB6CUMRCzhWbQxWDEq1DE/XK5WgJ
	sB72Q4tzZ54cbQvC1vcsake6YypvgMrjCFSkHldn8SpWfqXqXSURLo8LqQKWG8uadxX8WC9IMZJ
	QiCMkIw8CZK8KAuW69/gcsj5KjF1xfhpaCcJHJDc2GvfKZRw6dQRXFqPyvOMudb83NYhVH9OmzG
	oWdEdaqWbnI/NqmnvUINwtQ3w2UxVwT0JwQPgoik6dm6OJK22zB
X-Received: by 2002:a05:6000:2589:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-482f79e0b63mr14136116f8f.14.1787933721654;
        Fri, 28 Aug 2026 09:15:21 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:21 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 09/15] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Fri, 28 Aug 2026 18:14:51 +0200
Message-ID: <2c2803b500ed244e59a98506c97eccc4f422cf7f.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bridge-specific firmware parser may have more accurate link-frequency
information than the generic ACPI hardware-ID table. Let it store link
frequencies in the per-sensor bridge data and prefer those values when
constructing the endpoint software node.

Existing bridges continue to use the hardware-ID table when no
sensor-specific frequencies are supplied.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 15 ++++++++++-----
 include/media/ipu-bridge.h           |  2 ++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 47317c423fad..5730a95767a2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+	if (sensor->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     sensor->link_freqs,
+						     sensor->nr_link_freqs);
+	else if (cfg->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac765456e..2290a92361fe 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -135,10 +135,12 @@ struct ipu_sensor {
 
 	u8 link;
 	u8 lanes;
+	u8 nr_link_freqs;
 	u32 mclkspeed;
 	u32 rotation;
 	enum v4l2_fwnode_orientation orientation;
 	const char *vcm_type;
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
 
 	struct ipu_property_names prop_names;
 	struct property_entry ep_properties[5];
-- 
2.53.0

