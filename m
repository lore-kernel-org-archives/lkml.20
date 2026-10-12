Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5668147DD6A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824436; cv=none; b=lQq3WimVStq7E9UiTWl7HK3rsA+XBXMZZvCyzZK6lksRrJIpPmgzGdCJJ9nW+f4rv+2JfXc3ifqtf/XwXRJQncBrY9G33Hsn5fwpyn4LCu9PsxMZV4xPyqTBbAXZTgspcWZ3sv7aoIgvbSOtihBwZa8G2HmhV6OvJ5Nj1o1zKxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824436; c=relaxed/simple;
	bh=NChA0uA8/+eZNHQkSxbcV+2zHzjxRFg/wQPl/jusgJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDjUFiJDO8HZ2bIUD3a68tGPK8fKLSsvvSj/rpXQJbaWW0Sg+g4L4rWrZ72TBpOmKCDj0GtFo69VrJMyi4aPJYEsSbKh4j/hU2EN5uiH5PM6Oj+GWnMKvgckZNN1ahMiSPwe6/GFmrePn2ULqDslqsh1tomoS8ZypCqyKQqu52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMlPXFlY; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMlPXFlY"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1419d3416ceso2845510c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791824434; x=1792429234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4g8PCfH1fFoEZObwV6RdWowws5NfT3FAx6q9WXCp5o=;
        b=eMlPXFlYfslBsJ0HqXYJjcZHD2RdclMhzVbuqmbk+Qv27w9rRgBmtf0dp7Ino7OGAu
         XPKgVi1YBJjY3yUAxiFe4tSkGf8m463VWJnoWh9OS2KTcOf3dQU9kAUUiLoUFVIm8NGM
         u/GG9+ugBloRsuyOG/EUI94XZvtvjxJ186ZvmtRRdWNE9n1iydmqMUFgOrEBFG6cDXUe
         qj7KdDa5rozNx33BM56KEn8rnBhDOHXmwOixEx7qKzPjgZ0NRGpbW6u0ZtkN/hJiNlJL
         TJkSmgQol5ZMcf3rAZbZvynDC8ShCl9OQTFeQ9fghVhqWT5DoV7JU6vnoHPi5+RX9upO
         UtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824434; x=1792429234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4g8PCfH1fFoEZObwV6RdWowws5NfT3FAx6q9WXCp5o=;
        b=uvR5a6V6szl3ftgpelk9Aj93I6Y3i9qK80mwHeyWBjd9bvgIBPmfWrq7I7P/6lMsQM
         jllPJ+TN2emSWUJviQKhwkkAHYbCY3FkJUZifsdzRTL8X71E9CLWQf86x93v2VjIwiB4
         1Gt10z/JjIgWD4fcRlFUd11yZhBpP5HAy2f4MzadHnQRo1c/xISn25T5hetPsApvLm0r
         8KXbsDCXjvuhRLqXDJ5DQloqNDFbxHeHQj7WaA0AJS7J63TmTfxd1XBw2lzdKEQ/D6VX
         xs8RBoJCIjKkCzWy1cGmZ4BIzCh0qnEtyDanLITJkA4bYpOrXUVlXfZmZul2yPo+evR+
         7Rrg==
X-Forwarded-Encrypted: i=1; AKwUvBzp1d1wpk+1tEhN7Vh7aaqRDrlGHv2Lg62RcImeFPEZbFPU6jqJcdTf1J/kaR2/xihyaIx6My0NqMffAYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUwCj3oOE90JznOsPm+rhgRR9FTyIntWROFDDMjo6AOlG7UE8H
	Qi3OAkwF6aVE5X01ZhkZzW+C8Qfb7pdQDw1OSyyPT5UL/Lvc7kGRyq7d
X-Gm-Gg: AYBFou3hn/+T1oOTH9H1TtPJCCPYEkqFvo/iKajZJjlbfw03aN2TYj4U4F7rwQS+jqX
	VDAK+m9ueF0N6ojR8HqicsVKCFlc7yn67K3+j8NvTsFjypqBoAw2GoVzERz+rQzAhL3d2vq88fW
	K8zGDYIQQ5hl149/QRfkwsd+fAKDa8Dym3TL5/8RZqwPQVjT5sf+rmTV+XxYxGd7w1R2eOkzhEs
	CoCvnW4kc6G8a/gSl1P5Z5+5yzwWXs5WP2pgM0N6ogN29AB1o5rt3B185rZNoQqJYzNOInV108U
	iO3SAiyxNwACRqXRsjDU6IKIIHYBNfatayhtES14iUOPbOvJwQv+tF2Jnp0Sm1W6C+7mLKfTnPp
	AQP4bCjOIlwfDT0GwTdXVGiS31U/lQSrQSL48Zd/7vMkrscd4RYjCfO0P+3aSsVCxRidYed7uIy
	CoxMAL4HI7sjo9C3Bh7Zx6RqjDqhwBLUBU2h509ZMPl93Nw+KMa3rtGMh3WqyPfF9vqYcuJFPJb
	TQP8yc=
X-Received: by 2002:a05:701b:230c:b0:14f:5cd:f286 with SMTP id a92af1059eb24-16a6203dc73mr15566611c88.34.1791824432780;
        Mon, 12 Oct 2026 10:00:32 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:c154:b925:c82b:b0a0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm31171142c88.19.2026.10.12.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:00:32 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH] staging: greybus: replace PTR_ERR() with %pe in error messages
Date: Mon, 12 Oct 2026 22:30:13 +0530
Message-ID: <20261012170014.68898-1-pavankumaryalagada@gmail.com>
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
 drivers/staging/greybus/fw-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 2016a74f137f..7053afa9ab3e 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
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

