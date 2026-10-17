Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424221C2AA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198083; cv=none; b=nzt4TZkD2d0WI7nYIKO0xB7Sb/8S9VBjxbdpY1nifeledoMZUCHjkubcYR/K4icW02uDEGksTX43UN90kWjkQoXx4FviErQMUbyLmM3VLyWO922fhShTZN4dJtiZ3rw2v4p/vr4s1fzJrHFC9hbwdd29N+af1rEQPvzQBKJTQ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198083; c=relaxed/simple;
	bh=uQd8KTXKI3I23lJLW91Lf0V1sEGZ4f5qzE8kZvjuFEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CvN1FiEH8z9VdR6GbZDaeRFfv0wa4FfI33zJzFRpoIHRHuHu2eAnzAMZNNok+BiZot9zg4KZjv5kh1flEV/tZ4sbm42xEymY++K2PKK2tQ72ZoRyIG1MzqDWgAH7bwXbO24OQOKP2JGiSgcjBjoAViqknEJgInLdlZD7147dwdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmNSQZVo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmNSQZVo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3075645ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792198081; x=1792802881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7WQxeka8iJk8UZewm7aIuKt31IFYG3pfmjyCh4csfw=;
        b=SmNSQZVoosamiKeLUV/h8v7m/O/OIxtO0zRgZ6ZskISST0fImL9RVmm9ozzn3wXr6n
         8lhhqkT2ygOd4Xo/pUdpB1YkeBonMmMv6b4jAyCih02cmfgCasjyrA/gsCFoDiWlBymX
         97a3Uvxs+YoFPpPM4rDFxE5BmOebxVSzFRe4OcqVFiWYBPDuixXUtakw8OBs3ZXXt7eG
         vtxuu44x/uyMuMcx6Lvrt6orzkG7huYTbhWZlzPphcjkvEKGb0o6nqKGQRzrZ3fBsTF/
         n3gNRfUGYa3X0j+ZnQwY5IjB/hPgjcBas8UWXptpkbuYDb/1C1TRvDcfT9CPREOkNMoq
         8hUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792198081; x=1792802881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7WQxeka8iJk8UZewm7aIuKt31IFYG3pfmjyCh4csfw=;
        b=UefxgvSoDXpZP/0o7J53MWUinUrLYXOtUunY8UN23AKE2Cw1hOBj/o+QcVMITUHnpw
         zsPVyBoLuLCf78pAy46FxetLtjQMi1Fq8McXN9QStwII5mERD7HJkHS46ZEEzLElq6KK
         oZ9jmS6CpXwy3jOqlushBUe2yC3xvMyPUXye2O5COrDD/4w2oeFxTqJemcQMOKv6wB6L
         l0sMr52+XstPNfWliL8Yha8lSUJzIFnIFX8pYNP6qf87v3N4F8H4xy7bw/1wi7wkNJrO
         UXhR/AfZe5xGUySgl689eIKgWnhj4PwiY35Mk//rYwbZzniv/UcB+a1ncZFiV5fkOWxj
         bnJw==
X-Forwarded-Encrypted: i=1; AKwUvBz3ip3P0fGJ78jNLOh+VcHBpOcHXjjzKcELdvlxU/2o8fPdhbxIgSNAJWFSCtxttjMfC7pGB151rtljdMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ+bUcjqbOMs6qfNzt+1nxBVNmQX5czfivwqSS0kE3PSGJEpgq
	M6FHD57Thfa975NesLcf/2uvaLzRXXwJ+Mt7fHeNzXVRiZ/AAVvXtWAM
X-Gm-Gg: AYBFou03XPC3NlX4c16gtkAYRH7SRABdzSDQIzhIBDIa6n86ddL07SdqZnfz9JhEMug
	/V4kxvASSC65TdS1vRLERBBNFAuT5Mzwjw/ELhfZouYDTtcuAqsUBkucthALkmm4VNscjpkz9X0
	MuvouYsFmYMWtUnzJsSAf6U+IIbAMYlvQ1n3+e9rpF/u8YUH53cWAU53AYPupcJjIV6kbU10GzV
	/VLa2kBOM+jrR67vEMHgr33nL1ycYHfNuZLrHe1BXp05+PFspm6IJ5eSlalhFi/4fGYJxUR29Gm
	B/0VqCFH3hRCbOnl5zv93rk5LQciYcYdvpXqJlzhdlsqJwHWRM/yXJcBzoy86AXBCCG4hgM7QtP
	MeY/GI43+EnFNlXF1QAN2R376O0xGo4ILSTixXzB0bR8ATNAw8rxdiKee879sB3n0tYPLrQ1qL1
	s4pUC8wUdTIb+5DycK2nGRentGh2Cp73BlZowqfBDShce+S98q42e4/yba/BaCi3p41XQADAaD9
	7DJ1PXWBvipuIQlj95+f4tjNpaWCmgQdy8U4yzLlMamlUHCmZuW4dD7B7rR4d+qwOnqTS9Z3XXc
	9racQNQb8JO0t+iecado71ocy8xI8SP+I210pUiPmm1fvh4h
X-Received: by 2002:a17:90b:5112:b0:3ac:9e5e:d19c with SMTP id 98e67ed59e1d1-3acef134c23mr1427783a91.17.1792198081562;
        Fri, 16 Oct 2026 17:48:01 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b16c2asm2604171a91.2.2026.10.16.17.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:47:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: mfd@lists.linux.dev
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-omap@vger.kernel.org (open list:OMAP2+ SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] mfd: twl-core: Embed the twl_client array in twl_private
Date: Fri, 16 Oct 2026 17:47:58 -0700
Message-ID: <20261017004758.1256875-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At most four I2C slave addresses are ever used (TWL4030 class), so
there is no need to allocate the twl_client array separately. Embed a
fixed array of TWL_MAX_SLAVES entries in struct twl_private and drop the
extra devm_kcalloc() and its error handling.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: use a static array
 v3: Capitalize Allocate.
 v2: don't use twl_get_num_slaves().
 drivers/mfd/twl-core.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index f86df356d658..4f70d49ed2f0 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -153,13 +153,15 @@ struct twl_mapping {
 	unsigned char base;	/* base address */
 };
 
+#define TWL_MAX_SLAVES	4
+
 struct twl_private {
 	bool ready; /* The core driver is ready to be used */
 	u32 twl_idcode; /* TWL IDCODE Register value */
 	unsigned int twl_id;
 
 	struct twl_mapping *twl_map;
-	struct twl_client *twl_modules;
+	struct twl_client twl_modules[TWL_MAX_SLAVES];
 };
 
 static struct twl_private *twl_priv;
@@ -788,15 +790,6 @@ twl_probe(struct i2c_client *client)
 	}
 
 	num_slaves = twl_get_num_slaves();
-	twl_priv->twl_modules = devm_kcalloc(&client->dev,
-					 num_slaves,
-					 sizeof(struct twl_client),
-					 GFP_KERNEL);
-	if (!twl_priv->twl_modules) {
-		status = -ENOMEM;
-		goto out;
-	}
-
 	for (i = 0; i < num_slaves; i++) {
 		struct twl_client *twl = &twl_priv->twl_modules[i];
 
-- 
2.56.0

