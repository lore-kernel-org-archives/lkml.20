Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637778;
	b=Hcf4zdG7F0A5QW0GT/V2RKc6GlWqsTwWVYjKr8U+PioLrLEMrAT0wG9uy34w0JLInK9M
	 honFByh/ZwjBVL1rqcyxC5DRJzDbGBJMRZme0oe3yePM2BG38BkKoKIszumRTxukZmYpC
	 tReK6AyabfL9IlVcBSgD77wlcqInE9ec+WX26nQ+qBtUxRJVLJoeUQcC+R0uzRjNlKBhX
	 SVy9dblt0whxj95cKE6HQ0UEvvBTILsUlHh+VGbofolqt2R4KXiIuX7m8HdIaHMSO/xcg
	 dK+ZHBxS+NZWPhSrBFjsZr+nYtlPAHz3RwTw1aAMpftGOPHpiqXufkRsF4pMGqXkLvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mlBezjdELFCtMxn9x7yttaCF4buMcCnnIvVu8VTskyY=;
	b=XC7+ttl8OJZbXP7VQDlSyNVex0G1IXHRg9cYxS/iRF+oW7lWzi5QpCNEJLPg7mK8EroJ
	 n+mVDTEsPKjtEjZNbGHc+gWI5vkzJT0ucOkFLcy7LmXI3lOBpeNGcKxkb5HaezdguCsYd
	 o5UDttC9Ea/SX85vcdWlQ3fKQkmPRMu99ksRDl6L8o9jmQ0FIl+VSSq+LBiCIIvx2nV0h
	 fn45UOGiqw5UthTtAfC8O0gqv2g6+5ovYmdqJS8O+bet76cZTXH+0aM3XfUEQNRYWXtAM
	 sAHNOldFATVrn5EgM3Hb2mL1bXehLDZZ+NBqawUJJqbiQRL3rB/dGasntRjNm/87uNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8GM62o2;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F0E606A883
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22F0E606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8GM62o2
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9eb579c0eso9562345ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637777; x=1795242577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlBezjdELFCtMxn9x7yttaCF4buMcCnnIvVu8VTskyY=;
        b=B8GM62o2l2x9KWesi/jbdGINqM1XgJ4O01CNaOQviynn3PJ9DLVUaFqwoVBZ80u58b
         l6neX7qaQioVthR2Adzrmaqjh0vmHPOSm62XfOEivwYNFC8VrJ9oDyfJGCRv1C8nVHnp
         NevFtg5U4E7S3XwvD+rrR4v5K7LTjdp1CAFct6wEFwPS063aMAigAasjS5L3pDJS2qfT
         ZIijZhwQv4ryNrM9iXZSafDdJXqAQq+FUxYHg9rYQdlN+xO8w274nBKEyw4EHdSMgmVG
         +7OmmN/0aKNpfzaTMC0Dm/u+EqLxXmgxivXcVSp1XqniREEQEykg5tI43+mwkGgXUY1+
         3CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637777; x=1795242577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlBezjdELFCtMxn9x7yttaCF4buMcCnnIvVu8VTskyY=;
        b=bsyCZNLm+Xs1cAU3tMxtOg0KqHdrUdQ5zQ33jeLnn+TJqJNQIN94w/KyJ5ZwP9qR7c
         DwH4qoBRAkZcz3umPHoFDbfZOREY1Mn1i9AmUryIWroQBpGSSeLCe6yZ4RZC9urIIDyt
         WPEuQanwN6jA5xFNEZRf0UmcgfFDtRJAjiTCDF6ddx5DMOfuCTvvwPfh89N5kyWqf8Hm
         /chTygIq1r6WAEwwQvrtzcw1J7anREmrs6frJGuZnhrJjsE5rulrhMX03T9C4ONKoDVx
         iQSAtS9oV19IUQEvLkkSPMIXxpSNT3BvexaEO3nto45NVkfIuEQcU3g2dpEN5JSWrMC8
         8O6Q==
X-Forwarded-Encrypted: i=1; AL+hErGsgLwgljj+Egx1krp2TK0G8OmQ866s4D9lSsa0aVlrKUrn06l5w/dSS3fQPm8C5Hwo7iaKcXCH+cVj34c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y0xwzBij/0D373PltGRCT1XtLL9tknTw8PzlVI2tP+AK2fPkX
	H6XvaRClIrO15Jc343J16U+hxA0+KJWeBqG3Qv9F84udcAF27eXBTZBf
X-Gm-Gg: AYBFou1RevN2befhDMHqi+DwX4RbmKm8RcfBdn/8B69dMDM5UiwKGw2TGiQMAoCN3au
	P8i1KtjbG7ONQeLVCBXe81MSTDEnt4ISsqRraQ70PXdKZttN8vvEFTqwCQGGkFJje+k2UjUpmTn
	0t2Eg8H5+waA1wzZnfn8TrG34/FFr20gw6MCZMQtr1AUZAouOGa3DFqUJQlhIBminZZrB1t5Pkg
	YC8iTdWSmsIHmOS0W2nbt5mi9pWuIqsrSD8kqHhqYxoqCDago1lGnNpMQPC7Cnq7KkXChZw+Bwl
	fuo/TFA4X6bbSh+G8Kb6P9KEB0iQvH9JOCShzKFHUfPDXRF43cp90jd9XKniJt9cXRL+/Y/TgGU
	OvkJxiES3A1MMOpO128J+HIRX3wmHN2tGHokfatHe47+Kkd3Yn5ZzR9lMqLU7NKE7h0JP39r/5a
	wVBwCrPdNEL6izXWW0vWlQsDcpgTNIzyNEzHrMF3tem7LO9Unv0sbtty5AvTQwWRvUYVXvjM4r2
	ZYvi5P93UE3l2gfP065H35UnrkHFWPK9dQM5qMNu7RO/rnKd+9z+dttc9MBo7J8+4vcnIBAH7tb
	PVGnE5mP9W0YIDigyxxG874MJZgoK+3vgpgWYIV+J/zVuXdQzM5rxAir3gi7Ucc1j2hc8+uaIDK
	Xj2sj85/AEkV+d86/hxiy42caGsCiSmV/VSrTNTawyCBVMga5IuzIPywFc+td9jzSM+W3uDRJDj
	OqOt2SJ8/neq3YPfmmMdKtdlk3
X-Received: by 2002:a17:902:ec8d:b0:2ed:1b26:2be7 with SMTP id d9443c01a7336-2ee0dc06bf0mr49299195ad.46.1794637777551;
        Fri, 13 Nov 2026 22:29:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm18382465ad.0.2026.11.13.22.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:29:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: dell-laptop: Don't use an unread keyboard state at init
Date: Fri, 13 Nov 2026 22:29:26 -0800
Message-ID: <7d253bc056c2d6f68992d0d046affef331c57830.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
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

kbd_init_info() ignores the return value of kbd_get_state(). If the
call fails, the uninitialized state on the stack is used to set
kbd_previous_level and kbd_previous_mode_bit, which are later sent to
the BIOS when triggers are enabled or the backlight is turned back on.

Return the error instead. kbd_get_info() has already filled in
kbd_info at that point, so clear it as well: level control through
kbd_get_state() cannot work, and kbd_init() then still registers the
LED if at least two keyboard backlight tokens are available, which
works without it.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index bee347e1d60c..171728d63c81 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -1455,7 +1455,12 @@ static inline int kbd_init_info(void)
 	    dell_smbios_find_token(KBD_LED_AC_TOKEN))
 		kbd_timeout_ac_supported = true;
 
-	kbd_get_state(&state);
+	ret = kbd_get_state(&state);
+	if (ret) {
+		/* Leave level control to the SMBIOS tokens, if there are any */
+		memset(&kbd_info, 0, sizeof(kbd_info));
+		return ret;
+	}
 
 	/* NOTE: timeout value is stored in 6 bits so max value is 63 */
 	if (kbd_info.seconds > 63)
-- 
2.56.0

