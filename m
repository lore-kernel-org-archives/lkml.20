Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C33CB57B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791697526; cv=none; b=kHOA5pdcQaBEkRFXTIOI9VEo3isPVIowr8tF4q6KAqGD1Idrq/KBCApHJzNmb1baNTmkJ5fAkhNi9tWHsuBBc8UQwSsh4rWB4MWptNV/8q2vmgdoND6bqW3QZbl8IMxxVF2xlDis6f6NprhNf+JtCWmkD2AF56/CK/jbWkTyVXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791697526; c=relaxed/simple;
	bh=cwdjm+qGqXqoq4C2oRIh5rJbqUVvPrBpnDTCDO+on5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGGf5qYgW18dy+0YhzMDbaBCD5TsVXcvyhCDzENX5gRqLNpVWoI3EN1mNltpV1Ima0SnlNO6RXDpvU6Qw/qoSo2C8+KMAHE+1hduGVPD1RgfB3DlyDAHZNYD+pUsz9qdi+fAXxz0QgWeduoICyz8GKpEO20aBEIT++/CZR/iyjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIi8xZeg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIi8xZeg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e87c66e556so3065745ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791697524; x=1792302324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYbDo/zUvFvs+Is128rbwFgaN3wZJhNxTKIxQmY6kWQ=;
        b=mIi8xZego4z1b0FYoZ0P7hiKpnuW4PlcsANdRSE2Jz5PGn5zhiLpgquCXOXpfTVlwF
         0qU966pn1E5K5B4qXM0IeeNnBnKrVBwiEc4FUNeFkhhTxBafPPRmJmAOVjh+5Kwj4mMF
         oGIt58W6jkvaP6OCU2DGFxitzYdVOYL7iytYbamHERQ/KEZyS5viWblPwt1t3ThKjN0e
         ZJ8aKB7hoObSxWVWymfNiwaR8criWbrQeHyzT6DBbnMwWstJ/YSaaSXYmf+rE7k6Vn8R
         BB9MXZw6QY1J3sJ5p7X0JRABXDhUSNPkM5OPPsFFfbrS9cM84sPGQ7xIXMqApIxz+gKZ
         I3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791697524; x=1792302324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYbDo/zUvFvs+Is128rbwFgaN3wZJhNxTKIxQmY6kWQ=;
        b=0IOxSt8dUDHY+DsVnQZbB/N1YPeZuS/7vKQst3uWKtYE5L2229ut7wToYk1GooVpDI
         +NcTb8uG1Lg34NuIwUALZmw5ZBvsQbJeF0i+96HtEdh0XjIuSDjB+TfaTAohupnxMKhs
         cEhT90rUEJKn3gvtVO4Cc37Ovd6Px2wRtQMhr2tSHWkvDTh9qq0KteE7dFgZhktNAOt6
         N3oCzHlW9mceZYvRLgge/Uf9C5iS+KYgUWt2TddKyrrRyy9rm0sIFFiDf8WPGzPQD2pt
         9zZvJinSwBBTdMmFWdGCKuDTMGcs+xZo24m3O4we13sxNBd5yTujQJHQvz44hO9KVL/d
         KSOw==
X-Forwarded-Encrypted: i=1; AKwUvBzfIeu8nit8oI0I+fUzZ7ad6Rgqi4ouhcGgC9waEksIg0Ezl8t0PVV5M8IAc9VV4hejTEKu/p0lntBOdgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDkWYcuEAPlNH9yS45ar1JCTQplwZKbbaaA2xbBco6ACWqpcvl
	ZjGrck0SCGo3RHe7jwqCASkEq38NCi29LKbsjJoc+bPXrCBf6kpkAvO7
X-Gm-Gg: AYBFou2n7K1us6wFt/cleChSh1Z4dE3KBZrugHyk55eR2+gI6+z5Y/NJn+85tur5b8H
	/VhCjc6Cq1/aeaazYr/AB0vY+Ld8281CdlrVvnDoVzakg0aQ0Koyi7EGZHGQnWHB3nEqPuvhxn2
	AKjfOk77NXfzABHADJ9YC7s60TzJ86v7lP8NfHQwluCPBMyCm3mYFxY9Rfz8n9CjIgWE+wewpKc
	3CcqYciNx7LizlXZiZH5Txgc6SxRfljekEPKSl6d+qMNzXWV1otTwPb4AMgeCTuiaBHmPfVkx5F
	rrlpKqSYFmUVQn1cqhI4EuAwo3lrVyNmOY03X8lItrVsVjvzinNjMHtLDmAkyYnLPkUJoBZmhMJ
	eqJ61sZn29+J7wVy3c+n/IqxIBeG0Ia4SO/HHRW95KLY5ESTVf7UI6r6Fa/Iyi3kncm4y+6kQBK
	zjiVc3TwKxmv9U9eCBpIgdOyzkdfVNHA5E3+373+9Qd2efvPHUS0kean8QEBs91w==
X-Received: by 2002:a17:90a:5185:b0:3a0:bf71:eccf with SMTP id 98e67ed59e1d1-3ab3a9533ecmr2447914a91.14.1791697524040;
        Sat, 10 Oct 2026 22:45:24 -0700 (PDT)
Received: from DESKTOP-P1UN4LN ([2a09:bac5:d459:263c::3cf:35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab393efd88sm6669981a91.3.2026.10.10.22.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 22:45:23 -0700 (PDT)
From: lofm2605 <lofm2605@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	VU TUNG LAM <lofm2605@gmail.com>
Subject: [PATCH] ACPI: PM: Add unused power resource quirk for THUNDEROBOT 911Pro
Date: Sun, 11 Oct 2026 12:44:55 +0700
Message-ID: <20261011054455.1472-1-lofm2605@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: VU TUNG LAM <lofm2605@gmail.com>

On the THUNDEROBOT 911Pro laptop (board NLCC, BIOS TP127), the NVMe
drive in the CPU-attached M.2 slot (0000:02:00.0, behind root port
00:01.1) and the discrete NVIDIA GPU (0000:01:00.0) are inaccessible
after boot:

  nvme 0000:02:00.0: Unable to change power state from D3cold to D0, device inaccessible
  nvme 0000:02:00.0: error -ENODEV: probe failed
  snd_hda_intel 0000:01:00.1: Unable to change power state from D3cold to D0, device inaccessible

Both devices are enumerated normally and work under Windows. This is
the same symptom as on the THUNDEROBOT ZERO, a sibling Tiger Lake-H +
RTX 3060 model, which was fixed by commit cd7ef20ba8c6 ("ACPI: PM: Add
unused power resource quirk for THUNDEROBOT ZERO"). The SSDT with OEM
Table ID "TglH_Rvp" on this machine defines PXP_ power resources in the
same way, but the existing quirk only matches product names containing
"ZERO".

Add a DMI entry for the 911Pro so that its unused power resources are
left on, as is done for the ZERO.

Fixes: a1224f34d72a ("ACPI: PM: Check states of power resources during initialization")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222118
Assisted-by: LLM
Signed-off-by: LamVU <lofm2605@gmail.com>
---
Not tested: I have not been able to build and boot a kernel with this
change yet. The failure was observed with Ubuntu's 7.0.0-31-generic
kernel, which already contains cd7ef20ba8c6. I can test a patched
kernel and boot with dyndbg="file drivers/acpi/power.c +p" if needed.

 drivers/acpi/power.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
--- a/drivers/acpi/power.c
+++ b/drivers/acpi/power.c
@@ -1121,6 +1121,20 @@ static const struct dmi_system_id dmi_leave_unused_power_resources_on[] = {
 		}
 
 	},
+	{
+		/*
+		 * THUNDEROBOT 911Pro (board NLCC): same SSDT bug as the
+		 * THUNDEROBOT ZERO above. Power resource 'PXP' is turned off
+		 * as unused during initialization, which makes the NVMe drive
+		 * in the CPU-attached M.2 slot and the NVIDIA dGPU
+		 * inaccessible.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "THUNDEROBOT"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "911Pro"),
+			DMI_MATCH(DMI_BOARD_NAME, "NLCC"),
+		},
+	},
 	{}
 };
 
