Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB982EEE60
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858255; cv=none; b=ZJtQhgKafD2b4sUXTBJNoPbV3AW+8rtkS9QMTYD9/P+y9GflRyrM0yUtEsn0pPQuMtfz23zyn+W9ck53Tw2+y6etGtRZwQeWaPL73fDL9svF/yEB9myAikGrghK6fXo+UrqoSllqnLAHkSX10gT1yq8d4aSuY1yBYBvov3/W2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858255; c=relaxed/simple;
	bh=MoMGSPOqTr4M6F5ZHRoW8h+LRARnD0C9eFYVg3JWUMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKgPtionr7C/UXZGMVcXOMAhWvlq1h54x7YYQFCRL0R7Np9hZghIu7Ki6Z5m+46GGo6YWchpiNQ+mC7JnAOBnCNrIudiUZQiWnRjLGaC4xA1opUDiA0wJiMZCrxf5h8olxujIksCrdxJEpXB6j5x8jqlMbXui0KY8XGOOfFSooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQQiTAur; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQQiTAur"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so1747450eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791858253; x=1792463053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mt3JmLLgHj7BPLHepcEaqLDPCG5DVuA7mfVobinE+s=;
        b=bQQiTAurmW6qfFeCFKtj5AJkfdaUV1Ju72l7OacAXTdbZm6wecwL4NPaERY9dKyQLN
         z03E5CoorlyxyPxdlfWjw+tHiNCffZpeUB18cE7KzfDnJBHMiCWZL/RwXCFSpzI45QlZ
         GnxSKG5SP711taV2LutStUUVRdx/Aem+AZb/RjbnxObzqliDH7bhWdOLTnzjDuBvldAp
         DkYMZ6W2UXtjFWcbyrQJeO8MwoRtPqG6Zf4nJgQzSx13NE4FHMRadP5dIXCFwujtIQb8
         cw1RAdOrF+XIjqoqOn2qbq6CEMfC+Yu4vMcgIm1/WeSSPBnKmFHK/64nhQ9zKxRwgKSv
         g3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791858253; x=1792463053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mt3JmLLgHj7BPLHepcEaqLDPCG5DVuA7mfVobinE+s=;
        b=sH8tomfa/JEJDqeLl9BY74b4OYSYIlXdYHQvqLbYtH2daWSGmGD+UlbL/8x7UIi675
         krlcCI8nL9YypDm/9HcE5g9kXKGct0AjhGtfVuBtzyvBKgnTdh6pGk+XDZbZAUxGxQoe
         t/F/EYiKMyLAh8FnrezE6Zwd2VBgXxTnflGs6V+ewhWswnfaS6i8eIaM+y9k1v6SUltW
         h2Nmbt2PJbtp9SqRwYmGOzPBj3X5ScVeYTt2HJkSrDyf7ryMD06uXn9JRfxl+dcl7gJC
         HA1spevNDK6uZueXnJmdIP8oAH37lH8xUQ9ZjVeAx2fME1Iz1BnbObg708eNtPlO/EZU
         o98A==
X-Forwarded-Encrypted: i=1; AKwUvBwMLd0+c1uqEVUgoAeQ1qFXWcPOZOmkL5V0Krvm6Zn4yJjq8gFNXdeO78uorqzPoeWFHKMbinpCdkDSnIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBmXRLZM4tGeWNarTK2cywZ0hsFCGz+xl3p4kCo92YwjWcT03s
	aL0GDO2/KsfH628QSUPkHy21V0SwDOSnU0EXFEikDEBd7Xk4tYu0NtyG
X-Gm-Gg: AYBFou2pfiehX45O4ZEgDi4yU0C8T0XGolMgGvHSPvAp/Y6oY+YAk+nXyn/aK/CnkZf
	5MJM0a5OAHL7BfigUc0CujNub3i2fRxfQSrfYgmv3P4u/EfocsWFeUAkUvjOJExnRkxEAi7gtI1
	u1PNZihhEU0KIq111VBY4sBLkP5yDArnjrB+4wCrYHMOKsitnGuln8nbD6ShXAEo5rlHYils10n
	wQSs0P9p8UUu+kHj+qQkgfTULLLLL8Av8ce2xukHYDl8M67d83WuniFK00okR0pCLa+SyO7qoaO
	MREV4xhnthO2Lo5b1/VcTFK311zynM/7LAj6nTvjsaU8/DJlSQrJM7OZNI2pikHXOuXai0JJfpA
	/Nkugs5W8ErPSTGhe+QNzeQnH9XL9ETDEb6189loO1QpGOEluzkUhK7513BLvM9VEWerCTKNw12
	BcZVw3kZQvqqNocVodGAHqXwRxTPygS5X1TH0TWLlu2szpxSv3OZ0RO+YkPvlSX1W/xiA4whJ2j
	zJdzA==
X-Received: by 2002:a05:693c:620f:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-3537dfc7ddbmr19496412eec.7.1791858253173;
        Mon, 12 Oct 2026 19:24:13 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:d39e:c181:5646:33b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm34777638eec.29.2026.10.12.19.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:24:12 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	gservice341@gmail.com,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error messages
Date: Tue, 13 Oct 2026 07:54:02 +0530
Message-ID: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Use %pe to print error pointers directly and display their
error names.

Keep the other PTR_ERR() call because its return value is
needed for ret.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/fw-core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 2016a74f137f..78321be80013 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			if (IS_ERR(connection)) {
 				ret = PTR_ERR(connection);
 				dev_err(&bundle->dev,
-					"failed to create management connection (%d)\n",
-					ret);
+					"failed to create management connection (%pe)\n",
+					connection);
 				goto err_destroy_connections;
 			}
 
@@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->download_connection = connection;
 			}
@@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->spi_connection = connection;
 			}
@@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->cap_connection = connection;
 			}
-- 
2.43.0

