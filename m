Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC78447F2C3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843517; cv=none; b=tM00uRVO3LhcHMMN48jeHuHp4EPStHZDmYRXgmxwx4j41ynf8yzCIgOM8F8CZNHvfEbwFOhvar7vL2qSe6GgPhjnB157dyEiGCteUk1VWmzhajzkT6RzUp6Nuykin9ejGfp5Qyrnjc7RggqwhnzYmfKbyH9MIKzVZpyQIl/EmWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843517; c=relaxed/simple;
	bh=TS8uJOxY0VqqIlMJUo9bqOEciSpsr3A5gB1Tj/EyK2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Arq6DvBpUKLpmwXUiUtjOF+VX+Np8d7X6tJAD0sF/mrslDUOHnKiziTYRP9xrv18YyzpPVI4c2evXLZzB3kfrxDwGq7UkZaL/ufihJ+jZN5m8wC12nUghfSfiZu14DrC6EGqZxGCWQxdwhaTUQr27TjHpOrmNif4q8a0riiIIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3IsbMW8; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3IsbMW8"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4563ac048f4so113556fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843515; x=1788448315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmdIKvxkFSGNeSljb2NxmA94mTGO/+oX2AMXwxdIcUM=;
        b=F3IsbMW82AWwTL6Ogw7yy3cMqU1FarlbaDJqCntwBRZPrS2nrWEMCHDBZ409RBXS50
         vHry3QRzxVfsjR5+mKywBY+inKv3cyFkVTHPOQbJa9UjZnMucHt7NKVybUyNPpcEKwvU
         RrxuKT9oDS5m8G6flKN5PcvJYUY2YzltsvpMcOKP5H03aCj6Oboza4vcTctlhcy0oFix
         mkqbv178fEg9bCnaKam7fSqrjGAogjP3wVPaDCTveUQV2j+OpUNCY3TbtpWjEo4F6vO+
         lmHBeXurxDpyQdQmbYT3rZ7zaVoexkZX/UPPefzSnHBd9tpCjlpf6Kszk542SvhB0ueK
         0yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843515; x=1788448315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmdIKvxkFSGNeSljb2NxmA94mTGO/+oX2AMXwxdIcUM=;
        b=ftRQdX840ZmWL+W7DkkpKtw5y9L0/ZV28oBmhuX+FBgjs+kPe2ppS6kVMc11S+u+F4
         /JrK/cyAEIhhMxdevfdCYxK0MW4QSsb9N60KXXYLlUSv2q65kUCdL7qSGru8PsPphsmS
         0mWuiXHSNQi7mT6HEUSYnw0nNk/eVWm16f0o+e+s7eqAxDgLzuI8PTGhf1MYia4gb5iP
         NywOqbP4HBGkgqTIRxtdUf99Ev6O25LvvjOlmYpnH27KtHUrj4yRXqPb6khyEU/g8VSl
         c4BvBparZWHuZMOPtT3reLjHPKf+OQRMGUBmZeBOdaMrGSwlo5iMDZu/byc5c4xn5uuI
         3Jdg==
X-Forwarded-Encrypted: i=1; AHgh+RrJ+WwijOoUfTmI+DcE2kPu5CBAN9sLxTGrH/UT8EbY3hI4Dy93eJf6lRH/admGxwoZWZ3TTjt+u7K4+qU=@vger.kernel.org
X-Gm-Message-State: AFuF++kSmMROt44jSSnLsi8TtY8cYsuSopn99xvBRQ0x47WBXefddS/I
	x7QqJcBeg02JZHM5957zn/GLB3ZQCtWNn6TbMRTSYvGivfGRH08JoYE3
X-Gm-Gg: AR+sD13pupDHeKPPaxDK0NUMj33W6PcdHzIWJJGkFdLxKHcR3ivsPjhYJrz9PeXq9KM
	fx0LXUg62kWlIuiClKgkQXGdHlnGYbnxmry7LccOmNvyJztfavSPu4w+gDLTKMCrF5bIT8UYtmq
	AfCeyVoM1LR/pQFRADqYO6bCUEyhrKGOygfPLuB/y9RnDJNyGHQ/l34h8QKue7AkQHZx2QhhHEj
	SH0elruy4+hkuqJWscUILi+MGx2ZSxSxmi2E+4pdntYhXzBjakry2HYKN+oVgJ5d1TXa9lLwv6C
	xPjb8I9GMW4VWF3o3U3wj8a2vSRYD95eXBsIwezevb0asUWvTkZx1bBV4SGEC1jUfhWxDaxjzDx
	u8bprlw4AhsK6vpWx0QXrjcqpQx1bJXzoAor/oftMe6rDXshhwF1zyEvBZGedTyZQbSU2rDeZuJ
	oCXHJqzAoN5iCNDI2sQ1bHwDfN55vVwF0T3mJ63DR8UtdenbG4PDafPAa1EfLQjyyGCjkNyJ+AO
	Sq7vo2uhjA2rg9QMsYzy+xEyWoYv01gdn0=
X-Received: by 2002:a05:6820:829:b0:6b1:b771:bc43 with SMTP id 006d021491bc7-6b1b771bccfmr4253535eaf.23.1787843514529;
        Thu, 27 Aug 2026 08:11:54 -0700 (PDT)
Received: from archlinux ([2409:40d5:415:fb30:8fb3:a7e9:62b3:e2c9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f47d8csm17142074c88.8.2026.08.27.08.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:11:54 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>,
	Otoniel Matute <otonielgrang@users.noreply.github.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D40 thermal profile support
Date: Thu, 27 Aug 2026 20:40:18 +0530
Message-ID: <20260827151018.25991-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN Slim 16t-an000 (board ID: 8D40) uses the existing
OMEN v1 WMI interface but does not use the standard EC thermal
profile parameters.

Furthermore, it is the closest sibling of board 8D41 and 8D42,
which are already included in the table with
omen_v1_no_ec_board_params.

Add the DMI board name to hp_wmi_feature_boards[] and map it to
omen_v1_no_ec_board_params.

This enables the existing board-specific handling for 8D40,
including platform profile and fan control support.

Link: https://github.com/CachyOS/kernel-patches/issues/157

Tested-by: Otoniel Matute <otonielgrang@users.noreply.github.com>
Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6ecc033e5af3..fba6d202672a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -323,6 +323,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D40") },
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
-- 
2.55.0

