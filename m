Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8027444A3FE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393346; cv=none; b=BjNDrcggdA0judhAc+ro+mU1+Qrh+v6FvLys43ua8aGiWkqcU6sCGc5taRPIefngZGT7AZNdiusCSeEELwyigZtqDFKDc2c7ewtf+ML9mg4f+25+oMAXrRFBEDwZXWEHENcqvy3wRU9UnhbimdmXLesM7VhwGP1JwpvbkTfeJcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393346; c=relaxed/simple;
	bh=o3r5KTDUMd2Ryp8djVBpnOvccaOXRkX1yt8Yfbuf284=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZCTv24QVG+yp6Xk4AXXOfwC0Nzvm/oQH0WFVKne/sWc2bQX/eJmFjwke6g+WWCSlOvuvP5VmscoD7lHRAXvvjs0LayodQA40VEAJ1spJaPAYsXXEMDB284R34Bw+w2HMMuNjPVWgOUnJTw4nHWLK4ZGqFnPYZqbPM7AzMmfMuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjwW/+1p; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjwW/+1p"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d81eso2404065ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393343; x=1789998143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=szMMrZ57zR+vj+A4cF4lARsCWhq/BFFfWh68VaeaZGQ=;
        b=LjwW/+1p/fVerC0w+2NPDuNa2JsBxOLIgz0an3e7d2BYSr4SItnL6NWMuXE+AIdu+E
         CfpxXoEPTwqYNxWIDeaezklNiGFNRuSWYrXoiurqWeB+XF0bfZBKIILBeCCxP+uKFaBN
         24+YfwK0vlxwwVZOFCaDzJg+rEnEJA/fFB5byPIekKPnlqHhYqiZwraz1jylmh66OP41
         iNkFRXuVtIY9wCMb7tfJKbDvJdSg0OqwEspa5Sj54PpN74PhhQ/t5deAlJEDhi8xBtwo
         DBtmZhBW8efS4fvXg3KoODhIn/xYcI7dDDDT2aaL6CEpvgR0sQubl3Mop4zsiDKaz2pI
         TzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393343; x=1789998143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szMMrZ57zR+vj+A4cF4lARsCWhq/BFFfWh68VaeaZGQ=;
        b=pvDrFSUoe2IdyingzeFvsrmZydLDth9a0IGP1S1GxHyX5bKZaYY0WAKqtn6WlDqShN
         SZ6SkAcMq+A/MP4iutB+uxhpeaAlOHFwgQN2vxXoiYIJwUXzGlb8YFJVXeXJS42gWoIX
         mmm3tWAjnrAAX/wXZmtgpN4OjOvTHdFm3YV94ecDIbEzpdYG8aM6A0Fo2AIRdfqs4i4l
         j5j12W8kfnH1eyQtJY42JZuv2Qbh/Qn7/Pmf74y7OhIAdb4QN70sq7vWC8didNVInPVw
         tkmDUEvYxD7CybL0NOve47blsEKfntBAJ5P3SNHbWen2PTkwAMCiZNSKKsQINX5cC6zo
         CPjw==
X-Forwarded-Encrypted: i=1; AKwUvBztpb7RRxWQqeow5YIFIkDXOZ+itlQTQtYqxGHxY+QHjinMbhWHr0ShEDi6nhXKbSCsat8ES//jsoKbBKY=@vger.kernel.org
X-Gm-Message-State: AFuF++nTji3H5TT16G/mUxPP4mP4NDdiB7L4P4jR7CZMehlRzn9hX9kM
	9tOFcpGGhAtuI4u0y3khYseHqIfF1lN8epKKbySC64fCTNJM7X2AHrjE
X-Gm-Gg: AYBFou0Im7eanRzhvCUz0nTUOejJLG00yFxQzD/NkWb5DotR3zP3lA2BysjxG17oar1
	PGSnFXqbfnKslctZMXruak4kBzeH/AIN54xPut7ReM0Ks0m1j8a1PQLpb4MRaweNfQP5NtpHFXk
	feds08lVW8NHJvLaOnsg6ZL069Z/MxVayh1331uB3aJcMDWG90oRiFF3DXotD9kRhpbNqumlTm5
	QbIT9E68+z8hP1N4qazNYCnwPEGdS+owZ+74CVI9zOcyDJ6HPkxOEDWH7Yteuvgb6G8o69tFDjQ
	StJY5teyX5yKXzXknvK3xYvvzWrRvv1V+6vae/g8/AU84KVkevoN6ySacChdLgnLN2mQ9/2gmAp
	ntOdekEcRyQrJyQ+SloeHRkTb8iUVA6GxpPMnEBIpNLL4wDQLUiV9doZEksNF0V7yXbTif5mjV6
	+zFQSAsy8Hu6wiqpZoBg3ZlSx2fFJLRAE1zraQmr5MB4CXWeqWXbw/z89SEUupqYdjCRhdUl0MN
	OpNzxw8Vu4wIhbdPXO6TLQzcJGOhtT4XPyZi1zDEMcmmblUj/wXCb7n/7ykj4wvVol4UboSgXXW
	GdsBggPqvv4Ua1nAp5dD
X-Received: by 2002:a17:903:240c:b0:2d8:f4d4:7044 with SMTP id d9443c01a7336-2dd6c7ca8a6mr35987125ad.3.1789393342816;
        Mon, 14 Sep 2026 06:42:22 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfef639sm48914155ad.71.2026.09.14.06.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:22 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: ikepanhc@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: [PATCH v2] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode key
Date: Mon, 14 Sep 2026 19:12:16 +0530
Message-ID: <20260914134216.1295740-1-navonjohnlukose@gmail.com>
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
there. Under Windows it opens a performance profile chooser. The Fn+Q
button already cycles platform_profile through
ideapad_check_special_buttons(), so map 0x46 to KEY_PROG4 as a
user-assignable key rather than cycling the profile a second way.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
v2: reword the entry comment and explain why 0x46 is not routed through
platform_profile_cycle() (Hans).

https://lore.kernel.org/platform-driver-x86/2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org/

Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW.

Measured with dyndbg on ideapad-laptop.c and a kprobe on
platform_profile_cycle():

  Mode key (plain F9), 2 presses:
      WMI fn-key event: 0x46, twice
      no platform_profile change

  Fn+Q, 2 presses:
      platform_profile_cycle() twice, called from ideapad_acpi_notify()
      no WMI fn-key event

 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524..35c13d9 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1360,6 +1360,8 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
 	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
 	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
+	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile */
+	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
 	/* shift + prtsc */
 	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
 	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
-- 
2.55.0

