Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07428337107
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792313424; cv=none; b=RsmQ7MpDRDqB7+fxKwFWbRc6Ui5fx5naC+JHWLjk5aM1soKRp9o8ynF+PupXQ2Ez0eatplVr3NNIw5OrDNzPhw0aFDMbGQ1mrqSiTrSZoHx0eEJnjf90G4dyQA9CQRGtV6ZEhlmj17VWAyvnPhbTN2flDhdV7XPDuk62Iwd0fzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792313424; c=relaxed/simple;
	bh=+f2w5tSysfWdjOMGNQyyeCgTvy5N0XJDSICe0CScJPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYAQK/YWSCIwzGs8+b9QH81vMYbMQmxjGFMud7HSg5W+lEGyukU7cd35kOVFS12k6sZ49yYst16HYphcAcdvSqTk4Ikow8vMTui9yqBgLC3rDblqDfzjkAv804Uu+Xp2I/AAUyKzfUye9xwS388qrzo1vXf5OCLl/VRDN9uTiMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5fQXl3F; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5fQXl3F"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so3032011eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792313422; x=1792918222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1foRyEVgNVxrvVtoWJyDr59yXaxgx8M7G4qkdLHX8oI=;
        b=F5fQXl3FJnk4kM8iq37Fq1HQYJVR9Fp8v7i84DRxtsbo0In8D6XXBjtkyzg4o8+CM8
         voUtwkZA27aqC/KOxMcMh/GksHbeTdSqzcChQq1DV7bsHwwa3OywprxkGcVXT6HufKz6
         4kDzQ5e7sYjM/JkwxGQ0u3G0EfK8Pl8RPi1c7WVqQUQ9irDbAdn0Vzwc8E+AUHzeldcw
         UZWWVLLhyBRhqJgEt8Gtf2UBWPdjo/MvBH+LfrIvCQBppM0Y/O+Q+p7FIKqOuTGeCej2
         eUJzHP9rXnQ3k4Jdrvy45xWZybZJ0Rmf29m5/rA2+CiooY1gElgRNMF7Oep9vbblPWis
         /mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792313422; x=1792918222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1foRyEVgNVxrvVtoWJyDr59yXaxgx8M7G4qkdLHX8oI=;
        b=kAhoQ/q5RyOr8MZWY7+nhbmkHQ48chD9MlfXGqK4Hu5UBYtsoA4Nq9vaLzp3mFXNAA
         G+cJLvHsMOHSS/ayko+CrqyymX+kIn8Cuwgr3R7M7ysxkMWYm/S9cEI5IOwCN0qpkW0e
         TPWdVFxqZKh7Pjw80am8UAKplctyFVlPHM3/7LAkgNa7HldzyoMFXe4siZKYG+fdoZjf
         umD6KqAeDYyJpkHKUNuTgyoqLcRG3Sw8Q377h3X3str9AC+/O5n1dGxZfhCd9dIdenPx
         XMLDOQhApYAuLFYl6rqQyVKCtvyhvcZGk+N4zDZluYwpnnIrE0/qszriCkjnr3xhFJJ2
         PfUw==
X-Forwarded-Encrypted: i=1; AKwUvByRBxx+6MI8i1tIOEmSqLH+XFShzBggVfRTusSLF/BomXd92///NadK96lF6asWe1wqze6A8efITCl0iGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQz1JxyMyTfOTQLWlh5rtOkgioQhu8IB2K6DzMC9S5dNZUAbIz
	7/fTyOq1gV0vA0JQdRJ6zndILrp+RZQesNyj2bbP1sBE7vJmbHxi7YdM
X-Gm-Gg: AYBFou19kxJcfv3UjgP4rHEGR7WB0dfKkK/JgnlJZU18LMJoAgJMZaSrFpYtoz00Kn0
	0/jIJg80isTBvw2RQJRnR8KqlJjaW3xSHBkpB/+ZzfkhVLxXZEHEsrOFFzE88GgE/J2dHdgHAMf
	lQ5S0ubfKFbgxP+VJxL9ofSL1Pls6et76C60WNg8ur8jHFYdW9on3wCuEyIlTezC8pDZ4p3yllI
	GL6jDte71fDY9pmZOs0vT16zq9l9HTDXWVHwabt54ZeyBqMEcrvM5JkXkFwFINIWGh8dWsvBzYS
	vN9weTT99Exw/LUHVuuJunwVonjDJm+Vda3PYloGr+sbBIyvI65vwKyUdGNp7JJUFBSvcnT+5Ev
	RvMglBhaPSVh1F5xOpj1UmRvAznaNzVJnBNexAS1i40EsUwk48L+ljBn2waxKqYMb6BiVoHVCZh
	sFLocLzZplyAmIOGEULce6hss8Am6/8sDZ2BGr0isHwqifjl/MpqUO7KVY6A/q5vyJo14OD4ewB
	IZanw==
X-Received: by 2002:a05:701b:2608:b0:182:9071:3249 with SMTP id a92af1059eb24-185131076f4mr6206897c88.30.1792313421875;
        Sun, 18 Oct 2026 01:50:21 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:1e01:b34a:8bb9:ed8b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ca95700sm19342455c88.23.2026.10.18.01.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 01:50:21 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	dtwlin@gmail.com,
	vireshk@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v5] staging: greybus: use %pe in error messages
Date: Sun, 18 Oct 2026 14:19:25 +0530
Message-ID: <20261018084925.11793-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Use %pe to print the error pointer directly and display its
error name.

Keep PTR_ERR() calls when the numeric error value is needed
for returning the error code.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
v5:
- Drop arche-apb-ctrl.c and arche-platform.c changes because the
  files were removed.
- keep only the uart.c change, as the fw-core.c changes are already
  present in staging/staging-next.

v4:
- Return error codes directly instead of storing them in ret,
  as suggested by Julia Lawall.
- Remove the unused ret variable.

v3:
- Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.

v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index d47f00751e7a..74c9898c0eed 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -956,7 +956,7 @@ static int gb_tty_init(void)
 	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
 					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
-		pr_err("Can not allocate tty driver\n");
+		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
 		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
-- 
2.43.0

