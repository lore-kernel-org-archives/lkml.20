Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D003EEAD0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521818; cv=none; b=ocKDLohbNeQEtq3sf83OkAy+ZdIT/+NcfRj0mtB7wST6TKWU50C6KOj0XQa30RyK1spgOQ/D6Pk+nIMqBPcL4yu/H0D3UDLad0mVP/dcZQelA8taDbquSTgvK7sf6VzoaqoOfV2cKSnTsFeCRHJmRBSEc3oxUKSm0E5n6kur8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521818; c=relaxed/simple;
	bh=1V1PGNnMiVJlvQ+2h23UkWjskInlsqTJRbSJ0k9QFEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjsKk+Y59ytjYxBb90DXojmp8xq1R4El+dyxN/Vqhb6wfxtYEnw8TGTPTFhAyXGIUvmAGcpHSMW3uEQSHFL4FlaujsrbaDgH9YeVuwON/+JaVggpcu5u01bUxQi6zaFlf67XxMShtHLGE49r6l7sHUQ9bYdyOxq3T4RgkiL7vTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ea1JLyxj; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ea1JLyxj"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso774405a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521816; x=1789126616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ERgD93A5qmrkOabxCTstekFkXdOEhiGFqiDK0U4F1eA=;
        b=ea1JLyxj9cWA9kI9IjmN/O5WvSjhh5aOHQENDMCnghoVSxGDSeD2f5mwpv7Uv2RiJy
         CF1DDazoOqUlIbO0X8apxyqwge2spNOUjYDnI8DzCLG90zRMbxFCr3/VHB2GNvllsgtA
         N04nt7ZvKkRFFh+xQZ6xAVF5+Iih83EsjPb/CKIr7VGArF2YjO5ePkpBYKH2H99/iQaE
         QoL2iYdNR95uJw/pYUdb6a6tG814tPQy6X7RFOsMjHjHjeaoZgPle0Pyrp8oC18Gz/7+
         HkB9xoSaLO54LYCGw0lEVCSAxwriRPGasIAa2553Tru6le5xzT2EKfGQGOL6+ZM21jdW
         7emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521816; x=1789126616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERgD93A5qmrkOabxCTstekFkXdOEhiGFqiDK0U4F1eA=;
        b=AB8UgQz6wh02nFMh5zwtnYDPOp0xFfGq/yULRz+vHdCGXE815YloJCitBBHkYjUbOb
         q0oWD4jiUr8mZxNhxSU90zcrwCxn0w2SCRaARPh2s8ekxYD/HSznqrDRJDFS+F/M5vNh
         EOd+8mpiUIXrTSmrnnCEseCpgft91it3JqpbMMp3ELTmlX1rcxltcZo6gCXlHoucWy4z
         aWHTX2FMUGE9yFR+F1148TYFRJDk5tn64IUv5v747r0oFsCTG9oAyyTkuXo5MslvzxlX
         QJUu15CkhttrVHzUhCTRe1y/LeShYhPCSsp+heG4g8FRG1V6SZU7eIg8bCHyq5oCv547
         X26Q==
X-Gm-Message-State: AFuF++ma1HTn6DNDRgzB19xGwV9C4+snu8mqZGdx5RXYeklXynQxy+xs
	LX7pOe96hr5HGWkEOeiivdkYyX2t8ULQka9+v0aVfYeZKIssEE434tuOW8sgoE2mBMY=
X-Gm-Gg: AYBFou2aYTSyR4qcFwZ8IG/6aCHz6XpxkridVmcNnas8zD1dyoQvWFz8n4AjWTGpCGA
	cV9H7zPFppbvyIqaJ8Wa9C8jpKWlKRSuu+xPZtYsWQBYcs+RkYotWpv+XgZrE27LI4GAfZx3P/c
	bzu8gIdqPPmNkZomZFtMwZaEdlflSe0X188yZNuN0OIdioEvtOrIQOli5HYYpkEFsa2gcwdiRed
	wz3wFlVehqTpO71gSFlJYIXOPsdf0sylhCS25udh286xHHUPy33ojNi2Z7mV/belRlK5QRZISVv
	wo9hOvr+jiSoGBBrexbS0djvSRdsWJxoZgcAWBIe3ndyK33+M5fFHWonhzYL9xQgslv6Owe1d/0
	fARHMqI0/iICQhpZk0oweLMkGuysjdohB+a9sqeugjMxf7rBgs0AC0kr4sHK3VsPntDbfDBsTQm
	TXBB6lq9+qHlrLOkLD8cH1rNNqs8nulKKIhI907fNNzviu2U2j7r1OCgDkLc7fd35tq8Oi9Oy7G
	GPHRzx9n92VyfA=
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr8584204a91.18.1788521815937;
        Fri, 04 Sep 2026 04:36:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm6221194eec.13.2026.09.04.04.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:36:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Subject: [PATCH] platform: x86: fix typos in comments
Date: Fri,  4 Sep 2026 17:06:49 +0530
Message-ID: <20260904113650.18527-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1661f070c571..bfb292e727c4 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -7069,7 +7069,7 @@ static bool software_mute_active;
 static int software_mute_orig_mode;
 
 /*
- * Used to syncronize writers to TP_EC_AUDIO and
+ * Used to synchronize writers to TP_EC_AUDIO and
  * TP_NVRAM_ADDR_MIXER, as we need to do read-modify-write
  */
 static struct mutex volume_mutex;
@@ -7262,7 +7262,7 @@ static int volume_set_software_mute(bool startup)
 
 	/*
 	 * In software mute mode, the standard codec controls take
-	 * precendence, so we unmute the ThinkPad HW switch at
+	 * precedence, so we unmute the ThinkPad HW switch at
 	 * startup.  Just on case there are SAUM-capable ThinkPads
 	 * with level controls, set max HW volume as well.
 	 */
@@ -7981,7 +7981,7 @@ TPACPI_HANDLE(fanw, ec, "FANW",	/* E531 */
 	   );			/* all others */
 
 /*
- * Unitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
+ * Uninitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
  * HFSP register at boot, so it contains 0x07 but the Thinkpad could
  * be in auto mode (0x80).
  *
-- 
2.48.1

