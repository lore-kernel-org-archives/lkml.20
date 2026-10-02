Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BC374A12
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935776; cv=none; b=GOXEPSNDkCvrOwm3zmsVaRK5U9iwBglbCQpYMgEuvZKvDnZdAy8Iq5COAS09vgnaa5Aa1UagYXcND4g+U9R/u4Zf7YQY+68jsj3ZQr5U+C8Qdk778h6+peTs8IQwJFmMshuX9X02eXPL7hjPhgEyctJ75mTn3mRhjrIm7pkoLEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935776; c=relaxed/simple;
	bh=Rpcyir0pucMYwxwpWT3J9PaLulRi5dtQNJE0Rr4sZxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STIu7WHwqcbPGv9y2IxksZWL5Z746NoY/XUtYoSUl48oJ45MJ4oR5gTrdPzshFFow6tXvea+2ce/jafP2QilV2bFw2A/35a8hv3T+jefZHMuVjmrRegpfDOLe0ls/KQJuJ8YSrtEBTeHN/uYS63iNcdFsMgpeKOW8aO4sMRDkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBKryzqF; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBKryzqF"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19319854so4177748a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935773; x=1791540573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OaHZhhfoGTOQXtD+qa+qVp4d/gsPVtdPnGCiXPLugxM=;
        b=EBKryzqFqcfR5/P4sFDZ2d4sqtg89IR9iUAd+eCHQc+GQdaRaLm0h3CvomdR8Ui+KK
         qtdwnOhp9vgaspoisjuY4rJr4wSyMgDX6TjC8kLz7XAsUPWXAI4B7sXsajJR1x9ayU0b
         TwvBGyZfTSrXPWO9X6yLctO1yWBhY7yHhWd6JHdmIFxdzA4qW8WImgLfqLCS7YKinL/i
         bZSu/rHGLRJxx+/UN9rNWflb6D0w1JfpYekadgoz20WChKzmpsk5+u2O06CDMwIpX8UK
         AM0iFXg53SeI2tdHxJc6ta0F5+YnitnNzUYsL6QXcCBnefRpRqI1v+DfmHWNk/dWeZFI
         zJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935773; x=1791540573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OaHZhhfoGTOQXtD+qa+qVp4d/gsPVtdPnGCiXPLugxM=;
        b=KGK5htMisZe9sbBqyNvkEoYUodRR97l+Kf+iCDfh0B9eTOPWa8Ox6F35zbcFwoHP+D
         v5j+8RfAohQf79n3yp23CRbmPzSUPSX9yxxDvJ4TYfLC9tKnoNjk0TXLtUbeOL51TWGw
         KEziKbwEMmyrtGVcKFJi0P743ZZDc9UvDYLkYHtVlgGooceNDdR6aw5n99Ss+U478nOp
         hHxT3TYq0rJSW04N+wciq+FO0OVK9hZnLzDusHZxqh6xBqHu9VVnST2thU+erWVMcE2p
         lsWj5YMyUSrzmf+/zyjb2thqXm1ojUHSZtpzclhpCan930jf8Mn2dA8FABl7FJ9w4DEi
         2XiA==
X-Gm-Message-State: AFq9FYLJirNIAvbS5wSxwSWvRLdFNhVNVmLV2/dXntSfKe3uYP9AAKV2
	3qzWDvTvUYU0F8Vg6+eDLc9ujxurEvdb5rj6Jg3/1vn5IRMvv8U6fZHv
X-Gm-Gg: AYBFou0l31CHHZDD5Nu+DJn6xgJsr8UPx9i4UCOGukpg3JIiEOrhgyc3PIPkSFhCWdO
	o2CTeUYwoSaj50Ud0rsZX7PuxEMKf0+vpau472pYBtt929N2xeY8qUrYScDH6dStvCV5k9MV3fQ
	2Ti0FYXIMh5/bSuugYjdjzMzqThvuOj3iPqwchNGOlGNuoVvwRsZ+TKwOXG1d5fmOjudQ0V92pY
	i2TuGNSRcYETXq3Ndjka3TGUYb3jIceTyi9qWSY2D1kIbuQskXyJRXnzYp76gcjMUW5d9yaYT26
	J0/+Uz5PUVD9bQjaCgx69nry/aM7oOCcKab1WY+TCFbzP0Qsx9XPL8vBwEW581YvPDjYkFDbkwZ
	3e52EDHl4JJ4Irq27EDoJcd8M9X7EkMiJzImkrWzTLadhuXcQn0hxDPa4h9R9Rdd+whTL9VIQu5
	uXt6QHgJWZazWC2fLeAfW/b1MZLHR0cqWarwUWyBLgo1pFXJ31zKWIOCyk3aJ5I23MXo88pg==
X-Received: by 2002:a05:6402:5113:b0:6aa:985c:7bae with SMTP id 4fb4d7f45d1cf-6af9e2e13d3mr1400063a12.20.1790935772569;
        Fri, 02 Oct 2026 03:09:32 -0700 (PDT)
Received: from Ubuntu-24.04 ([62.171.228.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9d889452sm753687a12.14.2026.10.02.03.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:09:32 -0700 (PDT)
From: Alexander Kochetkov <al.kochet@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Siarhei Volkau <lis8215@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Alexander Kochetkov <al.kochet@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "Input: matrix_keypad - force switch rows to input mode"
Date: Fri,  2 Oct 2026 13:09:35 +0300
Message-ID: <20261002100935.449473-1-al.kochet@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 01c84b03d80aab9f04c4e3e1f9085f4202ff7c29.

The commit makes every scan call gpiod_direction_input() on the row
GPIOs. On pin controllers where GPIO input and interrupt are separate
pinmux functions this switches the row pins out of interrupt mode, and
enable_row_irqs() does not switch them back: it only unmasks the
interrupts. Row interrupts then never arrive and the keypad stops
working. Seen with a matrix keypad on an Allwinner A64 board (PINE
A64-LTS); it works again with the commit reverted.

The workaround is not needed on Ingenic either: the author of the
reverted commit re-tested all available JZ47xx SoCs and they all report
the live pin state in interrupt mode, see the thread in Link.

Fixes: 01c84b03d80a ("Input: matrix_keypad - force switch rows to input mode")
Link: https://lore.kernel.org/all/4130C026-2A83-408B-836A-ECA044491C47@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
---
The same three-line removal has been in use on Allwinner A64 hardware on
top of v6.12.33; this version is rebased onto v7.3-rc5 and build-tested
(arm64, CONFIG_KEYBOARD_MATRIX=m).

Siarhei, Paul: you both agreed to the revert in the thread above, please
reply with your Acked-by/Tested-by if you would like it recorded.

 drivers/input/keyboard/matrix_keypad.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 8863b741d1a3..cda2888b2e56 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -134,9 +134,6 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 	memset(new_state, 0, sizeof(new_state));
 
-	for (row = 0; row < keypad->num_row_gpios; row++)
-		gpiod_direction_input(keypad->row_gpios[row]);
-
 	/* assert each column and read the row status out */
 	for (col = 0; col < keypad->num_col_gpios; col++) {
 

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0

