Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D482744F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130004; cv=none; b=uqRUvdnpeXEl1zliBc4CWuunqhorxKpuSj8fk5/ANe2/OSnOg8isJyIMh55NBd/d+7Gvzp3H/pEF7MEE6E4Nbl0elYSD2OhnGKmXTdKdfOOCvHmffBhrPzt+AXLJMJEA+g3ylW35ew5F9QMZlRWnGJCz0biYyM3pNDgEzx47Lz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130004; c=relaxed/simple;
	bh=RYEvLF9yW7LNBWAkSdNa2U/lQe3026MEqVhKRa6xStk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mt4bbIo7guVI+j9kAHq2G2qn+25vp/cNvHtih0bEdwUYK9pxI2iPeTGtrXF1FvxrWYQtRMEyAk/6TZbBrqNbwZaEcSXaWWmMf/+XKhq9YiqW3zi4FXFWXHOObb2jghl9SLeQN0eD6EzWWzr6J03Ftts8rvk7aOOljMZtnhs0dOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCgiR/ET; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCgiR/ET"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86b90133ae8so281040b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130002; x=1790734802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieg2P/Lax1Eakf07DndW01SMJ/nBQVYMTevnVB+sbhI=;
        b=UCgiR/ETM4nMrq7fmAHTr+NNC5JdCgHEgNr1rGY8eZBidGxOhww4UdSoSlLv3w7DKA
         uoElI0/UajVmz48GZhgR6LZlD/UII5hFiFo5KElRLjSprBU7EquAHHKcGJ5FgnFLBjpn
         Ppuy7fQ3rEBpfmCOlp/lBt03b5YtOroBQcl84EWYgmJayFLmMgvtxa73ZuCTAcQYIV+i
         wMF9HCZBvU2lgZqKJTVMI4ZmsVjSefo3RvlOjxt0f8iIVkwztLcWdQlJHDXMBnf8kgBV
         1qnzpQTdMNUPSYyaNzX9ZolBVinDiS/ofxECeYM+TDHoHnmAQCIrvUJbVwZIlgrYo/Xr
         WAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130002; x=1790734802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieg2P/Lax1Eakf07DndW01SMJ/nBQVYMTevnVB+sbhI=;
        b=0+m0I04NDkqYHCbFOrm3jpFS3F2cGYuUKF1viO6O3jJhJGs6VpXLFAY87CgLCGClU1
         sMn50koOJHFEhtiafR8DvvvOrZPo6RhB2fF++ynEGK/r3GonK7EQCcLEg41z6GJA9I/o
         AuMiqyNfLLafxaFYe9tCpyen65T05mYCHVU1aQtOqCHsZZ0+F4CiHouLUVtWlPt76Bh4
         GOF5J7W9yE8rp29LMJMIBKNBVqAybY6xylQ5srAGuCzUpY/+IATL5sDFdhj9d+jbhdZV
         sFczqOMjPKZ5kt9zjs08V2Qe5zERLOSa7j7mDFC9mzl7L6lYnT11EWQ3FBVsjS0+u2IC
         x1/A==
X-Forwarded-Encrypted: i=1; AKwUvBzauArBbShvxjdNLhFc0T15xuW6PKPYbMwz2AUP1QuyJC68stse823we33HY4/gdBjCW0Bt5r4RSzm4Cps=@vger.kernel.org
X-Gm-Message-State: AFuF++mqRLjDzDtmIHS6L0KwH+ND85q7sPTQlRmrA5YaBFSvny/hWAeR
	SU76ePG22amQneksqEruXn8iFR0UXAndcq75204mhyqqtL73DAnrvAqF
X-Gm-Gg: AYBFou27yIfVfotUn1KI7qFfSiH2HNZn1jVlX67A/6mAwaZAm3qgKV9T1tUnjNE5wjT
	5W4MYbR6LoVXXtbVJceCMz0C1Jb3gDbrMcR4NewBTZfGsSByXAoIsbQlkE94XoP4tcu4IsIA1um
	g5AkM2fvlWFHpwHd6mV2OSYRyL+Nd04MLtaAXLh1c7MirnAzCsWQGR7W77U7kBT08a4FYDF/3/U
	o5T1OK67yqu8RrmWfw3xQ4wK+S6XQY/RWkBUDf4Wx+9lFQJSdhS07NFVYd9MPD/Ys5hUOTDm/Ve
	EXekogzY6d0xFo3WnH8TW6209b5ueCB+uZS9kqXjzB848RMwHXLu1EYp2t9C/YUTaGSCwt9Jm/7
	Eco1Z1fR4bXviJ38I80mERcVapy+k/8if/rYR4f4hrGkfQqmhaPhz+MGuertzgO8Z0r5dF/jW/y
	4/Z/BAd467ipEnEyXaAh1735CHckUxzc/5poWc/7utc0QJOd0biANjzmSRbaEqVjRYqMUHScbVN
	QI54/DBVJzkbu57Hkb6KY+FTt3r+bJCrKA=
X-Received: by 2002:a05:6a00:4c99:b0:874:705d:f63f with SMTP id d2e1a72fcca58-87d1c1c839bmr1274917b3a.33.1790130002435;
        Tue, 22 Sep 2026 19:20:02 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fe8sm502924b3a.51.2026.09.22.19.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:20:01 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 1/8] net: dsa: motorcomm: Remove YT921X_PORT_MASK_* macros
Date: Wed, 23 Sep 2026 10:19:33 +0800
Message-ID: <20260923021945.2203368-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923021945.2203368-1-mmyangfl@gmail.com>
References: <20260923021945.2203368-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove YT921X_PORT_MASK_* macros since they are only thin wrappers
around BIT() and GENMASK() and are not used in other places (plain BIT()
and GENMASK() are used there). No functional change.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/chip.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 8b0ac5fc8c8b..825e0bfcff86 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -108,46 +108,41 @@ struct yt921x_info {
 	u16 external_mask;
 };
 
-#define YT921X_PORT_MASK_INTn(port)	BIT(port)
-#define YT921X_PORT_MASK_INT0_n(n)	GENMASK((n) - 1, 0)
-#define YT921X_PORT_MASK_EXT0		BIT(8)
-#define YT921X_PORT_MASK_EXT1		BIT(9)
-
 static const struct yt921x_info yt921x_infos[] = {
 	{
 		"YT9215SC", YT9215_MAJOR, 1, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9215S", YT9215_MAJOR, 2, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9215RB", YT9215_MAJOR, 3, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9214NB", YT9215_MAJOR, 3, 2,
-		YT921X_PORT_MASK_INTn(1) | YT921X_PORT_MASK_INTn(3),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		BIT(1) | BIT(3),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9213NB", YT9215_MAJOR, 3, 3,
-		YT921X_PORT_MASK_INTn(1) | YT921X_PORT_MASK_INTn(3),
-		YT921X_PORT_MASK_EXT1,
+		BIT(1) | BIT(3),
+		BIT(9),
 	},
 	{
 		"YT9218N", YT9218_MAJOR, 0, 0,
-		YT921X_PORT_MASK_INT0_n(8),
+		GENMASK(7, 0),
 		0,
 	},
 	{
 		"YT9218MB", YT9218_MAJOR, 1, 0,
-		YT921X_PORT_MASK_INT0_n(8),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(7, 0),
+		BIT(8) | BIT(9),
 	},
 	{}
 };
-- 
2.53.0

