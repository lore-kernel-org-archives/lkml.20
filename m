Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD946AF2A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807109; cv=none; b=YYx91dmHYmG1QzLFnMTCMlM3fwihrhKB3JBLQZUmnEsrhLckQYmhtvoirJQ42pMZ38yqPX2ub0jckqcTg3mzw+pToeQBrhEWgxMfduBDGdWEyRf9a+voP2JbkZGS10y4lZxInMOBwOMncoB9wFY3LEr/+wmRoCiddQuA6WGxBzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807109; c=relaxed/simple;
	bh=rJRyqsVFQ5O/gwaiMQNwRrhpcjKtpLZTgSfCzqO+3p0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ugwjYcX9M0qYVeK98acZa3hTy953McfMlDdUUzlV0BilNfbW3VmSJcFp62Fs/PzcqoZT8mgFdy7MN7/XsxdQFO00eBmePxMaVuslIyMiGJeS8lkMEDJvVarzX1RNBvF6cQLCqf8F88GEVvkMEJj2eyXZCEvPHkAH+t7q0tgL4Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3Apgy63; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3Apgy63"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so849689a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791807106; x=1792411906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OV6YDNYPeiFdz/Nxte2QGUp1Bj1LDwNwasKSm/sFXFo=;
        b=b3Apgy63FWMLwVPmHN3wh9f4xzAM3GdDB41jXVjjSPnyDpvq8kxFe5G8PKoB9pNgjg
         FU42D1aBCglELYWhmFByaurhcZRfkJgL/uPvu9zMCV8e1bsUwY2BLblrbNnvkXK/8H/E
         1+4dahN1WxCjexnvTU40+oD+EZxkErHT9ic96Y22ExRC/OWA0zz8pOrgtH+6GMhxsy1j
         zHmfKsCVcmiINLV3kNZMHRY1MLSc37ZaFPiTEqQxDcRPTZjIlnPbFUd5inNJliDT3zPW
         w8Fpk5ilfdtu63IAiG/zBdWbO1AEFqx9D+ThYM5buU/ip7BhDl3xS1L6ve2zv3K6pljc
         CIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807106; x=1792411906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OV6YDNYPeiFdz/Nxte2QGUp1Bj1LDwNwasKSm/sFXFo=;
        b=i8gSpd0l5FPq61ZoPWoBDbaLlFXpVM6z4R7OqRewmn6Nu9XcYrZbbBUYsXXlmCfYE6
         bknj0ppH2DztoJFftnMhqN3frRQ4TaCpDI1zqTZwCCYu0CAFWeMmmzAiY++R3geMmZD6
         lO4WfmzgqCwW0K+LRBa5apM4Vk/MY9WN0qegwcCpMRQ9paC21gLxmCL1LGRsgabP2NiD
         FrUrD9ZziSnJUAEeMpmbWsA3kuDUt+ehldf1aYUkoG1dsnZ0Znj50qwkzMrpEmrnw8j0
         RQbUu04VZ4/AlAABObABr7jwvj4jjbjAsdeMQwNdciLOD9AoTVTlOOiWE53pw43iGbvI
         +7+A==
X-Forwarded-Encrypted: i=1; AKwUvBylC70ayD7QMqvi5MpVOx4rBqYMky3JPlEbrh9ATeQ9Nz0Om8jSXQMKjnqifWUfn0uhCPQLKb+4l7GExw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/oHjCVnvIt4B+/EoPK5hNWSnhT3gafjUnmmfZz9BQPYmCUB2X
	Scd09MpUdKkdNhjtALfc0tPC4R4adb3WHwm81viuOogtxyd2Kv7af7v3
X-Gm-Gg: AYBFou0WUbeB97bNA7z8+Pb0zhPZJ8f9b3UcpOF27VFZeH4nIZrCw3cV7Alvd+dMv7x
	6QcGyAKG3ZMLjfoKeohwBvUsSSeBOpcQDa3NYOlkgOFc2xu/fSiZsP8VLYNdBKIVkBQj+dx9yDC
	7GlsawxpI/HgvEORh1Oq0KseDWAUIuFIVGvzZi9sVxx3eJLx+zCuWu6rdumNOTNT60JDtqq+4IG
	GRMXJtB07Zn9+Gtwae4fcCe2JNIEkkvLrNAoSpzbT9h8ZGHCCHZ3LezNlRW4Edm5Ft84i9Qd1Nc
	XVT0BsAQ7DIpCc8Ln1JW7TOKkdIXuv/vYIcDjsmCIKkt3WdZnDb5tqZLVPYoXkK0GDtwQb0a8/M
	F4+lRi0kavx0R9aZuxxEtr3pUdTgq+maPeh4MKXblAkkorknXEwc35DqkFOw49ZpYQ0fKYbZhIz
	FHvK1wa48YXkRaKonFWwgSmABGZpnfZ8JBxkEkKMjiD2KtlDc7kVMKgZdnKc/GzuERx7JIC8ljq
	9NDDxH9atROuAuGsDLJB4FsPbF4g8Yn/sHr/Gp1
X-Received: by 2002:a17:90b:2d0b:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ab3af7177amr7138783a91.47.1791807106338;
        Mon, 12 Oct 2026 05:11:46 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:102b:51cf:2018:b37:8e19:d019])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm16255591a91.13.2026.10.12.05.11.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 05:11:35 -0700 (PDT)
From: Aryan Arora <aryanarora.w1@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Girault <david.girault@qorvo.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com,
	Aryan Arora <aryanarora.w1@gmail.com>
Subject: [PATCH] mac802154: Cancel scan work synchronously during hardware teardown
Date: Mon, 12 Oct 2026 17:39:34 +0530
Message-ID: <20261012120934.64632-1-aryanarora.w1@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Scan cleanup uses cancel_delayed_work(), which does not wait for a
running scan worker. The worker can requeue itself after cancellation,
leaving an active delayed-work timer when the PHY allocation is freed.

Cancel scan work synchronously before destroying the workqueue.

Fixes: 57588c71177f ("mac802154: Handle passive scanning")
Reported-by: syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=19cbce4cc656ecd4febc
Tested-by: syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com
Signed-off-by: Aryan Arora <aryanarora.w1@gmail.com>
---
syzbot reproduced no crash on 7.3-rc7 with the PIB teardown patch [1]
applied (base 08fa34e14e2d).
Test log: https://syzkaller.appspot.com/x/bisect.txt?x=128c8f15580000

[1] https://lore.kernel.org/all/20260627235805.17310-1-alhouseenyousef@gmail.com/#t

 net/mac802154/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac802154/main.c b/net/mac802154/main.c
index ea1efef3572a..5a2ab501244b 100644
--- a/net/mac802154/main.c
+++ b/net/mac802154/main.c
@@ -283,6 +283,8 @@ void ieee802154_unregister_hw(struct ieee802154_hw *hw)
 
 	rtnl_unlock();
 
+	cancel_delayed_work_sync(&local->scan_work);
+
 	destroy_workqueue(local->mac_wq);
 	destroy_workqueue(local->workqueue);
 	wpan_phy_unregister(local->phy);
