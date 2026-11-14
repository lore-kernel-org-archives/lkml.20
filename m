Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679064;
	b=D1OOmOyp7G+uji5HpZfh016nDrOOphG+y0dAkddsPodncdXyrmqVkwetNxMnShelK1a8
	 /tMevWoYuZHAGNLCk4TkNY2A8BdrfrErVai1cKvaHxzEKBKL7PRV3tCG8Sh53Y3Esuwei
	 6D699uhwmRYyUxLl2EWN5apoK8cWv1dYCjHFbNgzq67nHmsBdpZnVNzzI1zcKW6n+aPcd
	 iWp/HL7KwHapxGrqo1rVlR3sIiOclCXI79tl9/RkyrImBeJzAvpu2m4ttVMe883F/9yd5
	 Sr3evlX40Emf17Kn6j8PoFn8ekgfiJtyNM8dZeVRuVscYAGvRQq3YlHVHr2jF5+K/hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
	b=YnCYSJ2LEmzeaMzhk0jfIEvuk92XIWHz8BRbi8Sd2TDTItZaAIrTvGYPDNByuGodJXrj
	 ArW2R5kJj8EEbDELXeZ+JfJuzcbDLjUy42NKzfP+sFm0DSAe9MWAHiNpe5E1b4UWAYP9K
	 xmyUqwquqdH/E63vk3YpQJy/9mrWTOX2fhTzGOjautBvn+sA7HfFKV6yBpGycwbJXDxYy
	 nRKP1CLRWYGk61qZb6g5vQH0UunlThfawX8/AiQ/MavKuF1NItdmIxM6mZXM7JXoJ1QKi
	 O82RYxlz3TukXuyCSNYJ1uVv9evOZKYpC/2g1U3EDObShunPe/oy+fPmnPJZNyI52og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVY0MyVu;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3390C606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3390C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVY0MyVu
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1309927a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679062; x=1795283862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
        b=uVY0MyVuZmhOAAyRx9i6zCyN6goxVQeRCc9doxD5EIBEIl0RlS7avzF6/amyzR1sOR
         0k09UfZHtYRq//Ob8WDfQVipRBc36fUU/+KpAFrin/WmvQVOqVOa2KQZeKXVD65Nec0M
         czKKAj7PNb+6nkUBh6IIQIqp2RDw87Gv75E8zGIceoOe2KhcGcM+y/rfakUgbCq6Kd3e
         VwzY5msviQm1yWZS6Uf1wpJb/EksOrCft1HrMr48QhaWR4FqKyx/nqao+rig8Fy2adZT
         ApwOovPWpfc73F5yUGDsS6Ip950ezI9b4lCf0kX4bVeYYXbThhQcaNoch7WGKH2zUTwc
         wv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679062; x=1795283862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
        b=KrzfAPJnZhciZQmenSXGXl7lNHcI9OtrfdG9WN/BiWT4on3/bLCcAXQsY8DasQkQzE
         O8uBUXioSqoy9Dy/tk2Oy6gibOSLwavuiRRFoJdka7uKEPHW3qpQLlt9xpFIFvHpTs91
         BBkFfH6t9Fu4UU/xcwxmRApfQl+wjfq7b3InGK7MGxYxZTFdadlMR0hAGRDEgi38jVfo
         y9F28rVen6VLtQyIQrnopjsFizcdLhy4eQCL8OUpw9n7r4Euh3Ylayoqx5QtEQg6VGDj
         sOMF3+Xv9w2pak4mmdNT0AQ/XKh/E1dXNgGDO+soyLMI8RsG+GU1D2cWJFMGOZLfIBns
         jb0A==
X-Forwarded-Encrypted: i=1; AL+hErEQ+e2KCk3dWB+3O4g9Gh6M+BYfA/4BcopfBlynk1EFyZuZc5HDTgoihFqT5XoZpfJAp/pnWuslkQyvVO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cdoEF36bw5xQ8BU7YuivOIxoRf2FFO9r+YiKPsjWSRvYw5M9Y
	ZwSs5ifqfrJU4swjUCQkAyQnDTyNZVtnxnGzVg7oD86vHiI83kBOfjmhkENAwyt01YY=
X-Gm-Gg: AYBFou0myz7SDEKXe7y78P027aXOB9+qvyKS5UtQiaVWzCRulK/rl7fhZmihNrBuTTy
	5CwTyzMiBauvudpEucktPz/NlggYnfzLBWdUIy4WatBAxf7VxA16GcsbtQrS9by+AnH/xK3J86z
	mSTqtddPYQK4UQ/nbaoDqqyUABzVGWJPknbTpvvWQKM90DeWDE/msvgfGf3ibAshvdDTebhPoz/
	QlzZpbFQTv2MXvU2HLur/S8+D7jVCivIRkBXG52k9s1/bOBD/Lru888leaH+5qpPZMJ7MCvSDKL
	9CCimebg0l87HjFquCDrOMEFDPrPsJVkTgch7ol/OsIusSy1rABP+H2t2ds7l2R8CmTtn36wxdn
	HY0xktRGR8QR5OK7jRqqrWkp0MUu2koM4Zl3y6o/3moTGlENSm+OXwSDg7nsXzdKdF/8rm5Aisz
	IeBrRo13XcR2tn8J3iHKH529bKLmOWSDgHyus3aYtptOm0BmtsB0hEZ8W2fqxzn+4LC8zWqXKda
	1eFxIY70bnOyQePiVbKpg46HREmRcAS3gXCkYzQyveiJhhd5PQOYmtQ/YQIj4k5ttLKuKnsDZjT
	VuPa3t3lukGd1pyoCrnrvNw2iVfC
X-Received: by 2002:a17:90b:35c8:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b1b05ea8cfmr5861211a91.0.1794679062608;
        Sat, 14 Nov 2026 09:57:42 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:57:42 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 7/7] platform/x86: thinkpad_acpi: Reconcile EC level on resume
Date: Sun, 15 Nov 2026 01:48:14 +0800
Message-ID: <20261114174814.62153-8-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware does not always restore the keyboard backlight level across
sleep: after hibernation from auto mode the EC comes back with the
backlight off, without emitting a notification.  The cached level and a
possibly still-active auto trigger then desynchronize from the hardware
until the next user action.

Check the EC level on resume on auto-mode machines and route it through
the regular notification path, which also deactivates the auto trigger
if the firmware left auto mode.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index f11e61417..802e0d53b 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5395,13 +5395,22 @@ static void kbdlight_suspend(void)
 	led_classdev_suspend(led_cdev);
 }
 
+static void kbdlight_notify_change(void);
+
 static void kbdlight_resume(void)
 {
 	if (!tp_features.kbdlight)
 		return;
 
-	if (tp_features.kbdlight_auto)
+	if (tp_features.kbdlight_auto) {
+		/*
+		 * The firmware may not restore auto mode: after hibernation
+		 * from level 3 it comes back with the backlight off.  Check
+		 * the EC level and reconcile.
+		 */
+		kbdlight_notify_change();
 		return;
+	}
 
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
-- 
2.56.1

