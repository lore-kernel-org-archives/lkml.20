Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776087;
	b=rMOl9QbfuBoHaeMoD6tKVyQoppg9XHywTJeTgwBGDLBNeY9EKyIcT+qSff1fXi5wjVHA
	 ZhF5FQdTQAxsCBqLUmFs6T8/INm3oJczMixG0U07kpeTOJp7uBhSeP4fvo6b6pBdKy+Hi
	 RJ/RXzNk7XEI6Kp+BpWLDjk3kkBch7GiFLeonAPnQWYXU0/gf0w5akLEzT5B4Cv+FZdCe
	 k3gYGpOCqT5OX47ozN4Gd14baPEnbz9uy2w+E+835TKF3eCnqRsmZcAGhqezH+n31u9Z8
	 dhXH6dwOlyo3jjELFKIDG+cbeodtnIvoMeocfqC9gqKVRR+hFGqAyUc/d0XsanG2BvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6ClDD9nTGI8hAvNqlaRIKaFnhjgHLTyJoI/75ad2iX8=;
	b=gGzjVx+S49RlztF2cnURiwhjduvEFtFOCaqbGPgAdW8B/D2G5bP/M90ML/oiLZrbEPlc
	 2vRahZuVIbXJc29SiZhx/xHTk3uEWjss4AqlUapXfUBOZzpo/BXHsLfkH7Ym/mjpf91Ex
	 FGD15OvnWA4YP1vW7aTMgMhpgOIDXlyEyyILDNNqrqiszyhS8GH2GYvjyjivaaXK00cXX
	 WkpHct6weYve294wLgYmS47i1VOGCA+LL+RbfH7lF5ehx7EqG3RVL6oka6152v/blRdLr
	 GxlILc2LBI7Z3PkGbwHqolH4T5HfFqvOCZpgHj5vdB9Gs7lm/0IJSUX25EzQhpGGsWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjyVrJEz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758E5606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 758E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjyVrJEz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso6765775e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794776085; x=1795380885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ClDD9nTGI8hAvNqlaRIKaFnhjgHLTyJoI/75ad2iX8=;
        b=EjyVrJEzFNkDD46WNnL0gi3OzH8k7BOw17Yf3imQIMoTvBHzP1HoVjHg9lFlrX0Ftl
         UVfT6DYn6kkh2FRYuHV3iQYhJM2GJ7jk4IjqGgZ17iyAocxQ4AtPIeZvYBMLhJruD76b
         kAj0RA35yWsF5WgGEUiDepFRHcP0a7zBHenVSwNOe4dzrUtzW2wxz9elIE9KWJgSMcKW
         SDWcKafy9Woe1WHwgKeinxT5pDv+pj6MVFfKB3BxP/ls76PGSYeh30Tg2ouUq+TgR6PW
         5leot3ekyGK6cxLOve5IkagHWd3YHUW1JJaIeaJtRIVR0pHGh17SNRx5uPlVXJbzcQwr
         CqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776085; x=1795380885;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ClDD9nTGI8hAvNqlaRIKaFnhjgHLTyJoI/75ad2iX8=;
        b=27sLDDeJ2J437gxWDgVHIlamxNhDEyWEH12/LpJBdStm/5CCmF+ubKTkELc/Xq+YRu
         En4uylRS0QyCpmU0jbwHekyhV4td7TUuJTBxSt0/deohEULuz2rKiCz3UNxsIXBgcE9n
         Om47wM+N+tpdzf7FdQyRNgNtBn+NtGPZihh7Shf7dEeWNdjta91Iy5w+oPtY9szME7lc
         1BXlU483kXp31ZSysC83XmS8dejdFNkA6nC28yL6bvNMcbI7BCHo69eM6vIRb7oVYDc9
         ngPevOsOa1tyMiZnT7ufNGnM/0jtQW8a09prOrbyw+8Qr1xebDvR+D6WhFEoYCfvmwpX
         0pEQ==
X-Forwarded-Encrypted: i=1; AL+hErE3Jg71wuenmQph243ePmhcwWmf7yHxwXC/qTjox//znMtIYSy0smecW8Tt6scfUdv8Lw3Pf2QXXcDW60E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7UdwDH4Oq6KRA07m4Xrg9MXVTH+xE7TMgCNZRWjD+YGyRwiMN
	MkDF0D2+U0VD5i030LByEHdtjFKkxlV5v3Emq1K+NXxET4laC0cCqjEB
X-Gm-Gg: AYBFou1o20pM9AvGhe/DNC4qeZ+M/8dlomw623s1VWbKeUHwh1ct3nnN9dVmBP+r8o5
	gqhvUXDr/c8MmREUKKjvilRjyMdEYxN+WCXNDHscLNz7OJblA1WiUa7D84LEhu8huB6iKteQMG7
	Yuixh8G6zJ/h188HnQ+kW5G7BzsWPlX7CbeJRGnszZ64HI1YcumXWraxkC7M7S/m0/f6T6xctek
	HLNowUdO0pqloDrOdhaOVgN2suA+Uo/FDUQ13ZqI0qfDfJiQkkEe2hnIOD8jAMvMgmAtptYU6op
	SbQeUEzT1iKbo8DVx8lfo3Osezh7nSEWb7UfXEHPsPsNtocrw9VlsvJWckjsD3FJrHHkGMGRUeo
	GZ6yhU79XyeaQ4ZEPpsDBbmbfBYtXYJER/WpLEwwUnTmpJ8MbO8utwHGRiRecTacSg2636Wl7nb
	FcHEJdpwWUU9HwlBAPietgQBGuluP/jhyHDpF9Q1ZZkVF8t2jTn3D7PDNJ1sur6bdXhNl/ONTJ6
	fVaoA1uMKxOZgqPmN/Lncs+bV6XMdHKVKepMZvDeiUZMPy2ZR9hWYGwigOtHOMPc9Fat3rKvAvI
	n2cz6Dp8Aht930m4yoV9kkCkC0Trrj4uEmSK4++9AlhJh6dQn3688cz6uBR9RVH/KqT7R7Pl2qK
	dQUJJSPOU
X-Received: by 2002:a05:600c:4504:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb559f044amr178097035e9.2.1794776084425;
        Sun, 15 Nov 2026 12:54:44 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm251713855e9.11.2026.11.15.12.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:54:44 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Diogo Ivo <diogo.ivo@siemens.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: intel_oc_wdt: Add INTC109C ACPI ID
Date: Sun, 15 Nov 2026 20:54:08 +0000
Message-ID: <20261115205408.99849-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Lenovo laptops with an Intel Core 7 240H (Raptor Lake)
exposes its OC watchdog as 'INTC109C', leaving the device
unbound, because this ID is not present from the driver's
ACPI intel_oc_wdt_match table.

The firmware selects INTC109C or the already supported
INTC1099 from the same CWDT object's _HID method,
depending on the processor signature. Both paths share a
four-byte I/O resource at PMBS + 0x54.

Add INTC109C to the match table to use the existing implementation.

I have tested as a module on Fedora kernel 7.3.3-300.fc45.x86_64.
I did verify device binding, timeout configuration, start,
keepalive, explicit stop and magic close. Register reads
confirmed the enable and timeout fields. Expiry-triggered
reset was not tested.

AI assistance was used for development of the test harness
and 'peer-review' the patch.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/watchdog/intel_oc_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/intel_oc_wdt.c b/drivers/watchdog/intel_oc_wdt.c
index 0b012aeb1..a78fe1e5f 100644
--- a/drivers/watchdog/intel_oc_wdt.c
+++ b/drivers/watchdog/intel_oc_wdt.c
@@ -215,6 +215,7 @@ static int intel_oc_wdt_probe(struct platform_device *pdev)
 static const struct acpi_device_id intel_oc_wdt_match[] = {
 	{ "INT3F0D" },
 	{ "INTC1099" },
+	{ "INTC109C" },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, intel_oc_wdt_match);

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.56.1

