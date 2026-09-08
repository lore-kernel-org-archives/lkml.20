Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625CF390CB9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896112; cv=none; b=rBk8QRhOQvb61oD7Ise6mPkkiH6Q3rdb35GuX2QfZqwDy833pKhsdi2ocPO3sKmvVZK4gdgGkOCjqZJHtPczJABDI0l5OQHritidLPITqdMm9yjtGaZbxORT/d/o906LnnbQ7F/J5Utcl/OgBkBlL4aoyKuo5cl3JGKhL6SU1v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896112; c=relaxed/simple;
	bh=Jqnmrd4aZJv+OTC6WlMiMLbEE0xKExHY1N/n+/K+zR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJ4sHAYBMRXwfvKbPbpGOu1S4s1RAxhtqpZM8XOmM173NFrVs1Qy3lWFwqdH6NL8sMzKCbOiwlSlz0Gu9h1H7spi62/VZtV/8cKFSmcTEKpAlx1562jQEJuyaX0mD+p9o2ROmbcs+AxBsA9/0E50b+gJ288Ba9zyPv96IE64vrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IY8gPDQb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IY8gPDQb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso5495429a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896109; x=1789500909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnDhSP6bczUTSkcaT5CjAbh23zZRgnhTqPeZ+Pxp09E=;
        b=IY8gPDQbbyHGXZ3Wn49tzky7wVVUDnpm6wgZ4TIr9MP2FaVBW6nnSZDMKUu98cQFBv
         Jjw2gDUkl99G5+LGCGNMNOKim3phjL0Zabgf9N4IJpmX6oSq3Q53T2RUS29LPiqSPVuu
         XocEqQuCr+y6LORbz7aQNKN8uZdaoc5xkKaBY/3uKhmhbHnUQXmqoel9vR7wsOPb7Uph
         z09bcjFselfrJjCat/FAwVP+fDqEjLaQ1OuJ+PRiHvhGmvmNIBYNjHmnUEcKaewUVyWe
         z9gqGxidiNpdM2LBOZAOHoEaDoXc0442pvIZiWAPz2BaAluTuvz3G7jrHqvVVKhWyaP5
         PPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896109; x=1789500909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnDhSP6bczUTSkcaT5CjAbh23zZRgnhTqPeZ+Pxp09E=;
        b=oDJDS7rLuYb47WKHMvsgTOrZaLvVjgr36eaMvL0t7GNaYXuYkhogTxDt1OJTySsKT3
         dJi0BQ2G983vwevII+YaHa9lwK64TFx7NoRJ9eNVCOdEaSqPR3Sg6pvqeZUb73aNATe3
         /d+vCd4UfXY2Nq0i/2U5tqbL+8r9/2PlsVUoYZUUuHYEMOVyXAbwwHwYYAf2iuHhaYcd
         gwSx/Mqxx2q0htMO8bLf0i0zac4N//tDj8dt+QL9SK0/jBbxlmfX40f/vJHo/L7xpPGH
         Vsti03fCGILtQKODfLFKvHJDMPFdHFUe3FcyOB58igDS/VN8EKtvqsBsR5rklmAKvyLY
         UbCw==
X-Forwarded-Encrypted: i=1; AKwUvBzvcVM1OW2cfDa1KjRJ1F0+h7/ZPbn5+Us3Q80htMZ0uboz0qCykXj7ydYYWmkQT0eo73Lh3uB6wTnxsLo=@vger.kernel.org
X-Gm-Message-State: AFuF++k7wX9RdiuviOnspybQ2Wmr2dj7RNpiNKGYpismHOFn47rGPLm9
	SNlyrCmuQ5lphqtN1L4DgnqOI6pXTK0X2NFP/F6i8e6xrD3IKtS5Jg5v
X-Gm-Gg: AYBFou2vkz8mnaUythuV2Nn4n4n9nIu+ZVhqVO39kRLrvbmcDse8mKVo209sYE2ZU8O
	ejvu++mBfKcz99vmBrBuBZKvi3hlLK82qDUdSJ8BCJCofYDSJkyk2pk455XgHm87MdvxjHCtbaL
	EZyLmRjIKqrWpUizD2XAsWnV9OgHHS4e4aI0yA7jz8c4VgljwolD1uuB0U3ak44Mh6TQRNdiLPJ
	GBO6N1MNTajysvTZuEfLDwqs8A8+JUWEhny+2oQgIwMyqemb/d+hgoEv+TzYOCURUI0COpk+LPM
	4mRk02sHX9r2ZD9vA7/s6uAxPRSFb+YXscnCa+eI0KuiGivVrNTFXphTf8/DBTQDoablk0t4Aas
	Wc+dGCbKOyEgS6zve4oGw/S+Ke46K4XwQDz552ViUXdkOAxZ10W1qZYWB/+SJN/KuBF43XhnDRY
	we58sSKbn/eSfUBB1MMR4DkZR0Da+VAoAhQpWhWU15zlrOxgOizc/dvYsUk/jGRil8MiQfdA==
X-Received: by 2002:a17:90a:1189:b0:39b:2c55:365 with SMTP id 98e67ed59e1d1-39b2c55287dmr26428765a91.12.1788896109392;
        Tue, 08 Sep 2026 12:35:09 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:4b36:fe93:5f92:db19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm27319660a91.3.2026.09.08.12.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:35:08 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: hch@lst.de,
	sagi@grimberg.me
Cc: kch@nvidia.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com
Subject: [PATCH] nvmet: validate device_path before enabling namespace
Date: Wed,  9 Sep 2026 01:04:52 +0530
Message-ID: <20260908193452.53347-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

When buffered_io is enabled, nvmet_bdev_ns_enable() returns -ENOTBLK
without checking whether device_path is configured. nvmet_ns_enable()
then falls back to nvmet_file_ns_enable(), which passes the NULL
device_path to filp_open() and causes a NULL pointer dereference.

Validate device_path before attempting to enable to namespace and
return -EINVAL when it has not been configured.

Fixes: 6f6d604b4ef8 ("nvmet: allow bdev in buffered_io mode")
Reported-by: syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6c46a179b56c651c4c96
Tested-by: syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/nvme/target/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index d74c01c98f19..336013139ef6 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -591,6 +591,11 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
 	if (ns->enabled)
 		goto out_unlock;
 
+	if (!ns->device_path) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	ret = nvmet_bdev_ns_enable(ns);
 	if (ret == -ENOTBLK)
 		ret = nvmet_file_ns_enable(ns);
-- 
2.43.0

