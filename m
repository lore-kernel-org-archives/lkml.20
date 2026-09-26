Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C4379C37
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439941; cv=none; b=Z1N5eCSBNQSBApessb54cdOPzvgfnpdhN+jlkzUbZRScxQlR0Tbya1ZQWCCxLi2bX6FdjkREjnkqmfChbpdaFRvLoagNhUpdosyfttC/IG07BHN8wSEu7LLKr0x2jwMA9HbMzSGu+QApY47k+GG9ksVoD210RjrL/WhkcjqP6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439941; c=relaxed/simple;
	bh=V3ZllMYRxRSz7OEVR6Ox4snTCmgHokWNBNQgaorQTw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pqp044MWFDuA7yiI02pEQqdmav60vq1kHRt6LmIx/yYT5cFRbpW/BjgLv3DWVCmnZqmR3cKoDVSHvy4zUSJegJNSfjZkxJHKoEjf2Ag9syG4w+zZCXq2CeEeMLLCpcODNHGxAT2FzWqtcPF972yi/XmegpwY7Z4/PTZJQo35saY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohRqhuNx; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohRqhuNx"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5332cd97dc9so2912921cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439932; x=1791044732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ClV361TQ2pqfwGMdnIThGuqNSY7+Osp+o669BRRfF4M=;
        b=ohRqhuNx2uKib7NyKetJWS0X9Mru7IRACtvkkrLFY5nvOZ6FXBpbkuHm7yd+ghcf9Z
         0jXttxo2mVSJv55omaK4x26tf/LfQ/DHYUek8x5H2YG4N/q1rY6Jyzy1iwsTuv4CXl6H
         JltEKRckjJYhYs1D7XG0BqCmBN6RWQzZgmheJu3Zvel2BASBU6ObXZlrEbg8zHgCjAUU
         +PIIMlNXyBtb7+jGyFt0+PAKJfNRrg2YXL01IlmyzEhv0yWdAjSFRVHnwzbevsdwczYR
         Jz3ZDxgh8oy7LOkxEzOPK+QPm60kk/lbAcpa3e4N1Ps50pL5CY/mDs6NPGoYJxFbe4Y2
         6dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439932; x=1791044732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClV361TQ2pqfwGMdnIThGuqNSY7+Osp+o669BRRfF4M=;
        b=Z5OC2BA7ne9JyHUJ17D6e7ivxq6r1NPFGmi0KKXZyMY797Gcka7o+bhfmUa4hCCEai
         3JerrWrAcUTTYtwU3MuHa3sVsuonxRGRmxuW6LCd1dbuhWdOYHdCsAL0SYVIUkXGpVUK
         fi6LApTN1gougHe90o9OiONRfbcKWRYlHVcP9vmpe5Ym4Oltypyju8y3+jKb9AnnKEqY
         r1UVZftCY2xRidZHCLIlbrfnz4cBMaZpv/YaUC+kWJD9XD7Cf14qj6k70JXc4FCbyDbN
         194ihDUqPj7QnKktRcJEkd1BDYaWFHlm5gOXIfFGtgpgiSZ9PvxaPLGhP10bR8fCY4Db
         RDww==
X-Forwarded-Encrypted: i=1; AKwUvByK+Vknir6JCwiOXNzhKRlNxAAiAJy6gQ5t+8kSwH3wqUvrIfBUlFL7RK7KJH4JAibwCWty2uL7YN+FuDc=@vger.kernel.org
X-Gm-Message-State: AFuF++k1lbU5xprkU/xrV7NZu8WC/uNpJiwYMkVBDgq0f92gWPtiGSAL
	O60tQMNhuggdo1v4pH6fH73P9WRrKyvlDfemVwAlZigE9q+FZ+Vf4ytf
X-Gm-Gg: AYBFou38ee1cLn+nWFyo0aTgNHpd14h4RcItk4p0vZlW9Yohmz9r6RdsT15Yqfya49t
	waBWgRiUrLyjc0xcVvTkMZcjBL0UbD1tWvkMa2jzA4FPAhV1mppLaVOgboP1xWRQ93JOmUylgsu
	UF5TGtZoQXLvp6k0LBOIZSClwGTR3DcRsAHYZExGXThVYLSRvO1zQVjA3ieyyoWZEleIM2F5WCf
	4cXnF1CsfZ4zTQoDUW4ahnw8Tu6ROfxCXluZHVqXbb96SnDZNrM7h83M9duoxOXFksSjDZH9D/l
	Vr0z0zyp3VgI7Ang1TygYqdT+7sPIJ32o/dJWdmTYdfdWIFJJ7hCosPMMY5+paa60CUIJkG2jOU
	5QACom5p2/urkMl5pp8u2TRqejGpRSK4HlYs6HaiHZjqOCghIjaguO5DUR8jVqry9otyIrtCVdr
	liTZ/7MIyGEXAwEWmUVIOga80NHiKgqCRns+Xr/BoNnRFgrydnEMjwHJVcy2J7t/17onHQVxON1
	zahh9OSBaXIB7t9WuDyY96AFC1L2V3v/4reBehfYQxil7oi
X-Received: by 2002:ac8:5f88:0:b0:533:2985:eae with SMTP id d75a77b69052e-53329851318mr33634181cf.31.1790439931933;
        Sat, 26 Sep 2026 09:25:31 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332238bdfasm20896291cf.18.2026.09.26.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:31 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: fix typos in comments
Date: Sat, 26 Sep 2026 12:25:28 -0400
Message-ID: <20260926162528.25365-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments found by codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1225b01ed14d..ee831e6b8fbe 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2108,7 +2108,7 @@ static int hotkey_mask_set(u32 mask)
 	}
 
 	/*
-	 * We *must* make an inconditional call to hotkey_mask_get to
+	 * We *must* make an unconditional call to hotkey_mask_get to
 	 * refresh hotkey_acpi_mask and update hotkey_user_mask
 	 *
 	 * Take the opportunity to also log when we cannot _enable_
@@ -3770,7 +3770,7 @@ static bool hotkey_notify_dockevent(const u32 hkey, bool *send_acpi_ev)
 		return true;
 
 	/*
-	 * Deliberately ignore attaching and detaching the keybord cover to avoid
+	 * Deliberately ignore attaching and detaching the keyboard cover to avoid
 	 * duplicates from intel-vbtn, which already emits SW_TABLET_MODE events
 	 * to userspace.
 	 *
@@ -4047,7 +4047,7 @@ static void hotkey_resume(void)
 	hotkey_wakeup_hotunplug_complete_notify_change();
 	hotkey_poll_setup_safe(false);
 
-	/* restore previous mode of adapive keyboard of X1 Carbon */
+	/* restore previous mode of adaptive keyboard of X1 Carbon */
 	if (tp_features.has_adaptive_kbd) {
 		if (!acpi_evalf(hkey_handle, NULL, "STRW", "vd",
 					adaptive_keyboard_prev_mode)) {
@@ -7131,7 +7131,7 @@ static bool software_mute_active;
 static int software_mute_orig_mode;
 
 /*
- * Used to syncronize writers to TP_EC_AUDIO and
+ * Used to synchronize writers to TP_EC_AUDIO and
  * TP_NVRAM_ADDR_MIXER, as we need to do read-modify-write
  */
 static struct mutex volume_mutex;
@@ -7324,7 +7324,7 @@ static int volume_set_software_mute(bool startup)
 
 	/*
 	 * In software mute mode, the standard codec controls take
-	 * precendence, so we unmute the ThinkPad HW switch at
+	 * precedence, so we unmute the ThinkPad HW switch at
 	 * startup.  Just on case there are SAUM-capable ThinkPads
 	 * with level controls, set max HW volume as well.
 	 */
@@ -8043,7 +8043,7 @@ TPACPI_HANDLE(fanw, ec, "FANW",	/* E531 */
 	   );			/* all others */
 
 /*
- * Unitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
+ * Uninitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
  * HFSP register at boot, so it contains 0x07 but the Thinkpad could
  * be in auto mode (0x80).
  *
@@ -10623,7 +10623,7 @@ static int dytc_profile_set(struct device *dev,
 			 * To get back to balanced mode we need to issue a reset command.
 			 * Note we still need to disable CQL mode before hand and re-enable
 			 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
-			 * stuck at 0 for aprox. 30 minutes.
+			 * stuck at 0 for approx. 30 minutes.
 			 */
 			err = dytc_cql_command(DYTC_CMD_RESET, &output);
 			if (err)
@@ -11685,7 +11685,7 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 static struct proc_dir_entry *proc_dir;
 
 /*
- * Module and infrastructure proble, init and exit handling
+ * Module and infrastructure probe, init and exit handling
  */
 
 static bool force_load;
-- 
2.53.0

