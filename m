Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5D3D6461
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627416; cv=none; b=r8TEpBxKqO6d5KfznUZx9uRBeHuPxoPkr6YDGAm7bXxW+wHIWoSKbqB8B0tM7hNUlx8+88j2Nvlnv1YUtXTnL80eVVImJ1f+MGMNPpAFe6YxwwX00Usz/DLIf93i5G/FzMnFHPV40b/hvs8U4ulnUJYaNazJ6nCBl+hmNP5VUxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627416; c=relaxed/simple;
	bh=vmMrai/SZHWfjpubrhmvNZYZ2tmXfd2uKqkrZBhCMj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMpL5TVFB2I0AbJaQttpQEfwBTpnm9fdBiQzZ54tlqVOfp+sz6gchTEFFGfShOqZak86Gy+4HJdtX/Y7x/r6akCLOyTGEgSG0TYmZ0wxKrKo3VyrIn6LQzqIwczf9H5KwTWCx8KzXHLcfhO/RA40YUSXp+iwMmFgvP39r+jascg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImA1fi7n; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImA1fi7n"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d870d54so283618f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627410; x=1792232210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyaHXbmIQ7chKBwYcW/anldepruSkhnw3Mp3qDjouh8=;
        b=ImA1fi7n+XdMirxe3q9Ap09ai0W6LTkCdufJd177sCP2TTuohTbROPxc3ZqxHOFEXo
         A5oW6diohPBDWJpvhDWgLC4cg6MvJZjHZ4RopxLJUQ9T6FDSUlJkQ0knHhydUpwaP4Rg
         7u7k/an51Oy0udCazGGS8vryd2nu/wJNzWkbdO+J6W9Y4/EdQTj+SoCw0dbQRZHcFmep
         udCjDF1CY7uQlOxMBU9/b2mjwVa2Fjk3waikbmVKpPnprDS/loIr/o4czEfpZpvSn6xF
         Gb7zfuvvL+2YQfDzrqHoS/zkmkBw1lzfBDosofWm5lF1OLdIgJEOJF/6ydpWsitciLNM
         ElJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627410; x=1792232210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yyaHXbmIQ7chKBwYcW/anldepruSkhnw3Mp3qDjouh8=;
        b=XY6w3gJ0rGm4jBuUFzaqurvboLYvTfhW45JkCjDKpYoD5QS75i1kPEZidowkHcbZUZ
         zUQqTPKweR8cYvm5dNxlA/+6BhFoHx5zXxuxEPPBHtRPK7FEhJbSTkxOdGC8+ByIuKVP
         F4LY9qiK2aNdjc71mtnHYYLOFulzEdKeKSp7fWnipRvyI+rqppOCFvoDH1Q+DEgxTvTf
         SpvpxTiQB9grbao5FOip7Mm2M64wPRequaZLdVnxL16lQ1Os1K1zqp5Vl+Rin9G7pYN4
         +2g6j4hk0jcpq4pH+X3kLA0DODrVj2mNcoyIISqP8EFobk+CfXhV/WB1V+ctoxN+eM8f
         P4EQ==
X-Forwarded-Encrypted: i=1; AKwUvByLD2+JgGGTnn+3RAmklrygkunRWAGFpZ9Vf9cTVMTyVU4kf0p2cyXkuYobKASp78uUgQnp4Os+Ym14x9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWBsOJJdKIeeNWQ79CuMq4eywKhJAfXzEDoaN0P58MPRm/Et6W
	L/I71v120rUOR6Bmsr0yhIbxpbA0uXG/jOqimY6tuSEPEKPTjMd4Uh5b
X-Gm-Gg: AYBFou0bmDUZF4PBuhitmFyexFBpZQTxhBEqoJSMtg/RpkVs/hU2kO6MwZXXE5Khdf1
	ZJDGgjdIl+Wz/w1MasCmG9Bo7y87Rtu8iftZxp1wVDfSZ/e9AUfB13aPPWjKMjatkFif1XyW2oO
	viy15tbMDnq+rEtuLGZPrOkxKNbnKmWS2+KMz8Gxr8wmwOdQhS1pPzbyjxqQy5nLaQ0x+pn2Tpj
	WxCiDrgu62iv4wSDYPObULDZhg9cYg0bjxZb3hf1brxsoVMKkWLe6iKSHePuh9UnnTuCmGsEw+L
	y/BSGxoojjWY1uohWg9lQoScsTcYH27WlprvHyyR9N+hZzpA8yyjcdlIMpzfMiZaVEF0TYfM9k+
	yr1BbFE8r6hHW767CX8NUJc7v03evaVQDBesPgffq2PEaMyme2ZRaXM511ffBohXdGMGkIg90+N
	qpzTsSzEmrH51g1v5j1hdKWjOeC/XPOd4t1qt9H1KXxtSroeMIuFl5VlqOVMU=
X-Received: by 2002:a05:6000:2f89:b0:488:89ed:4430 with SMTP id ffacd0b85a97d-48dbacdfc52mr8738925f8f.33.1791627410079;
        Sat, 10 Oct 2026 03:16:50 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c38f4sm9417856f8f.27.2026.10.10.03.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:16:49 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	luke@ljones.dev,
	denis.benato@linux.dev,
	benato.denis96@gmail.com,
	corentin.chary@gmail.com,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartu Alev <bartualev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/5] platform/x86: asus-wmi: fix TUF keyboard power state shutdown naming
Date: Sat, 10 Oct 2026 13:15:58 +0300
Message-ID: <20261010101601.888709-3-bartualev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010101601.888709-1-bartualev@gmail.com>
References: <20261010101601.888709-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fourth state flag of kbd_rgb_state_index is named "keyboard" and has
long been treated as having no effect.  In hardware the flag, BIT(7) of
the payload sent to the TUF RGB state device, gates whether the keyboard
backlight stays lit while the machine powers off: with the bit set the
keyboard lights up white during the ACPI S5 sequence, with the bit clear
the machine powers off dark.  Verified by A/B testing both values on a
TUF Gaming A15 (FA507NV).

Rename the fourth field and its index entry from "keyboard" to
"shutdown".  The write format is unchanged, the value is still
positional, and the diff is two variable names and one string, so it
backports cleanly.

Fixes: 61f64515299e ("platform/x86: asus-wmi: Implement TUF laptop keyboard power states")
Cc: stable@vger.kernel.org
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 5adf7a289f82..5cc71bfac841 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1119,10 +1119,10 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	u32 flags, cmd, boot, awake, sleep, keyboard;
+	u32 flags, cmd, boot, awake, sleep, shutdown;
 	int err;
 
-	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboard) != 5)
+	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &shutdown) != 5)
 		return -EINVAL;
 
 	if (cmd)
@@ -1135,7 +1135,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 		flags |= BIT(3);
 	if (sleep)
 		flags |= BIT(5);
-	if (keyboard)
+	if (shutdown)
 		flags |= BIT(7);
 
 	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
@@ -1149,7 +1149,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 static DEVICE_ATTR_WO(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
-			     "cmd boot awake sleep keyboard");
+			     "cmd boot awake sleep shutdown");
 
 static struct attribute *kbd_rgb_state_attrs[] = {
 	&dev_attr_kbd_rgb_state.attr,
-- 
2.56.0

