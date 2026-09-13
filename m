Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44857238C36
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339682; cv=none; b=dS6dIL/vl+4bhFj7FCFN9phePGjbfoiYvbTb+GnR4FBKp8NuciqdWPzQgZ4cRFrKHMC4/5qBmN5RvvWkhG2kMXmWqqe2FmEQobN+eF8TI8U0XA1z2yMqotBQscsHH0Uy8JIebaKiRhGVPjPkKiZjEhxJzf7lg2m/5+ee9m/2taY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339682; c=relaxed/simple;
	bh=9J39yLspIUiCYmkRfCmgGYZzHHZzoDfXyhWpklU8k7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jobQltnWoPJzfrAAd0fNesUAEFwqYODdp2nNWiiT+IHRdhzWaWp+LTAW6W8LFHZHpSne92mABeI4E5BaG/X5LoSKCrqGJod7GuYMOnbXHtFc1Drd/uwyfKYoalMOyTMZuBEEV2KOvYPpyFCCO7iGN6INbbdHaHiwWj+UREhZqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ks7XTwvA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ks7XTwvA"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db479a55b6so1289775ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339680; x=1789944480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cZzu5pVka5ryTQQ2XqwnuE4e7coV/qer385o6D3Dpg=;
        b=ks7XTwvAgA5Z0/Np9WrEqrt8eBlcMkKJEOsLySUYM7X8VDMTQ2V6W8JK6VTFUti9hf
         +zy1Dy1S1w42ZuHf/NDyFGvx+xVzq2W/dBkQXUYN4SOYbbLVHsJDpBRd0JSweEsn6Ias
         TKqv7K/hyfiGMVLKmDD5qRWIfPbl07GfVjkHMUdAvM41s4WfSdMnNLQYGV72j9QpwHOg
         vCMx/N128Dai3Xh+hCkSp8zgouu4Y0zJFeYhgxzDb+BZdnm0b9qvwg2bYyrLiXKCmyC9
         nQ5CIhEpbk2/kJj1BhlIMUCGZB155SaqnsKIn9pbmcIoHC56l1gvSVksDICXuoC/4fF+
         X7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339680; x=1789944480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cZzu5pVka5ryTQQ2XqwnuE4e7coV/qer385o6D3Dpg=;
        b=gnQqmcNI/+MHvi4SLA3IaOvw20jD8uGEaaLTxyk7FfgsHSExE80sxS9BA1hRNTZ77l
         7+Bqy9Yt+bkGDDGVAMJp0QnRPKTogBhE4GXQUnreQHVGTDwblaErMZ5Q3/sQY1RdmbOu
         WMtMGeOxOEaa8IzZRNcwgWyrA6TEbP/Fmjxd7Th5gYtjwPlu6NtZykpzlbZCBa2lzYKK
         SdWRDuICxkfQCs+k/qk53fecQxdlOmykzf4xj9ZAui7qrvxKvPkTeFLjzP4J+QO7j7sC
         9rDhP7/C6v87abRrqbFKhQwkiZTNmR95BAqHMEa9Mrf6euMH/3gCl0khAl7a46dhS+xZ
         68Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzQlufVxClo7ySfjuxBzDlPCFExDkhxGJUwsB4b4yEC9LcRcfi5tQbJor5W5h9MOI3xvxZx+2Bz3bTVWJg=@vger.kernel.org
X-Gm-Message-State: AFuF++kMX5v5qoeW56nUX913Id2ED/Qddenel+zAJmj75nMr6hDYG3s2
	+Q2UDD4WJQ++oAEzdbR+QeD7HSbZTDbutxtc9Kkz5MH5CevTIESKiYqMLvmsAMbHXmk=
X-Gm-Gg: AYBFou2pMxryYJZ5U+lKk2QajynGecIPTP6XpapxgWiDzbKYtZ0lU59wjmjfUBadWRq
	VivV0MKnO5FUEWlPeYpnbpeVqUxTVBFkSgZvddU+kVYmxB49Q9tfN0S5Aguid7G7tPffZGxSs2q
	99m18I9KdCbpSd9apH2TcZk1ZCahVzxEBH92M89o/dHqDyE8MJXxQOZzhenE+GOVuNSwSoZi/A9
	R2S4RdGwJ3cEp54S6RXf/kEQQlELyW48FmeSYpjCA+MxbmHfovYFLT5i19JYr4tFkXxM6apR621
	vbI2PsClwRqjfQosMGVanB6at/e0or1+fCOE7Q+JHqRFEYjxRBVIwlN9TdX+GmeGheOUlRliQge
	Mu/TnLHM0q9t1LAquW5NR91AJNWMOMlIsIiAeVfJoVuXGbtUGealVS1MV9UuSsYEE4a2CVjmD4D
	J2I3eAHrTbKMkoToh1FT+I+E6TEDjaHlYh0TYUlqYce8v4wmillgC56Hl07eI8JnjEM5Cj/ND4m
	P8gSZ6+wCDKZTpKkJQRwJrmOrEdrNb6QflIH0LII52MsTWpC5umEKtjHxxWJR5ChtjaIt9fenM3
	qMIyYG6OtBGDDaA/leBT
X-Received: by 2002:a17:903:2987:b0:2d6:f09a:da1f with SMTP id d9443c01a7336-2dd2a72c2d3mr184202545ad.4.1789339680400;
        Sun, 13 Sep 2026 15:48:00 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm21992705eec.6.2026.09.13.15.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:47:59 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: ikepanhc@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode key
Date: Mon, 14 Sep 2026 04:17:53 +0530
Message-ID: <20260913224753.30281-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The F9 "Mode" key emits WMI fn-key event 0x46, which the keymap does not
cover, so it reaches userspace as KEY_UNKNOWN and cannot be remapped from
there. Under Windows it opens a performance profile chooser, so it belongs
in the keymap as a user-assignable key. Map it to KEY_PROG4.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW. No other key on this
machine emits 0x46, and pressing the Mode key leaves platform_profile
unchanged.

KEY_PROG4 per Hans's note on the 0x3d key, that a key opening a settings
dialog under Windows should get a free KEY_PROG#:
https://lore.kernel.org/platform-driver-x86/35969669-48b6-469e-9cd2-26929fb33e5f@redhat.com/

 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524..6fa72a3 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1360,6 +1360,8 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
 	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
 	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
+	/* Mode (performance profile chooser) */
+	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
 	/* shift + prtsc */
 	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
 	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },

base-commit: 22098763a10d9c13
