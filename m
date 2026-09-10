Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299FC387346
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010491; cv=none; b=eVSDrM8lHl9U3pMRbr7WqB+2POh/Ro+V/QW06w0AS9anW0WEFt4X2Q7pv/axrD4Bhv4S05d6AR9DpGHaCSFpli0pvUDKTYCV5kW5Z9aSBksSQ2IYbwExdIMSKoRBcfm96GfhC8wTudnUVyiPNMNPh93WU41/0DaiAabwU6Vb1bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010491; c=relaxed/simple;
	bh=fUw52Q8KyFVDA140W88rVTkiznLG/tQsbaNZPy244T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBKNMn4HdJLvehnM+qklVWWaglKIJz+9ZoloDZLdqYniExFlcxNB7gkpDQzjykyBhtcqFONUxJ1rGpy2tJhaelL2apbYze29d78UyMuho2sHWZTAX0IjQhthTve0U0ZEADF3hAR+bwKJV5YBGCGneajcVRumIqkRF1b3ZTat/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GA6qKRz+; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GA6qKRz+"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6bf73b4fbedso7429eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010489; x=1789615289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Op8qEawLmjCmD3fm/ve6G52a6gnFB0iRG70Dt9TzKTY=;
        b=GA6qKRz+JSRfhOCMtQfN5atgBMlSjV20HOsOONkNtZ9oqA4isKBxidqJ8oN/qe5gPk
         h+9iQtHhEzPXonbCI9+67Epd7m6UCVuoQsTrLNqEVcJ9F3ep00tYdqhWQk4t0pD6fnpQ
         suoCknUB/qarOGBYhJsUWl6HKWfySgMnAvCiHYsjlgR69+3guZwuNJUV1adiLvXryx9S
         ApCXmDbtPgLXXBExpuPfIEqZhkt+6i0C/OZFtSe6I8q5woTJEQJGch/B4wdycA1ORP/T
         DcACPyeFfe5VfYwooxbij4MT0Y0BppwQMx6PPV9ytSJYofI6ONVewJNon9IzYQV20UI/
         6Zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010489; x=1789615289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Op8qEawLmjCmD3fm/ve6G52a6gnFB0iRG70Dt9TzKTY=;
        b=sAdEJwxUKAJvWXPL4nI88FZu73LcrVkDhtxfxwiRJC3RcWOxxDEcbN1FMuTnHqHNZr
         jnTMGPT23ug7zHQmkLiszHTG801AldztyHl3KL1xuwgJLdjsqB7SXmi4exl9V59HNcbK
         DxUCdjHvcQXBoPzU9bW69LF75gLopzGhoQlRAQbuzDphUyMIRK2AMc0Z0gmzaor73Ggp
         onQkKZftCNX1+4caJsKsiqdn70gT2TSTnDWUQQOToMcD9WAMWl3o16dPM/IpdFZ/CX+e
         I7EodMn1PLEcoGXFRyDO32FmtjDI+YBzhRJ+eWjpMVQkLBQUWUwVOS98WXPwS5FvY6Je
         F1qg==
X-Forwarded-Encrypted: i=1; AKwUvBzBFNg1x/i9Ag8lHpqMIFzeoK/U+AoUp9mux7b5idQpLxQDRbwk0T1hb/JZY4O4vAVfrrM5r5D0NTLO31c=@vger.kernel.org
X-Gm-Message-State: AFuF++nfOom9PZQdA7P2tldgR9ro9v6Wmx8lCYL8uO15GSQHzxfE5QEQ
	IZHrelh2i/DwOPXR5t3NLBR1iyy9HGhHKIRimbBPDwGvwUUbWJyYnQGz
X-Gm-Gg: AYBFou2R5EF1Pe4q8+VqSWuaC1hkchl2RvJOEEzvbpoevzZSQP6TizYcTUoEq6zaLYE
	fOmadtV1DW8iEYb2/fImPvUyrs66kwjDi7i02LDcuvHptN045yPgcrhMPWNyC6ySdV6bewGuTeU
	1AsHaV4Ry5iLF+KlxeDU7R0FDoKsJSiQ3axIpX7k/GL8QRyyDhO/d8hVKVlXMJttBP8b4Qc2pmo
	yAhX0DYYN9IKC/tjwCdlX1j3tXPdMQ0UJwXiHcAmkKFkkhWVDdjyehAYRpCarFfxNKX9fhqtsIm
	GM1j8FDfbZVANRUYHJ9c9GpWUQ1Mk7XANrg9kUJq9vkwmw6dIT5qRZ/iZDvJFmpWD+VSvTB4mhE
	z2T7IATAZgVWlbtz+tLgxZkgKHvH6xcT4Ic+a4R981+nQyrA/jc+gq8UWL02Rp8rfakCQBqa76H
	Lm8cA1KIWINQNzhPkb8bs4DL3PP148mKoQx/u0Q3Pg3BHtBkoZkvdUrXYQKIRNkyZy4rN/wCfbQ
	Pdz66pZBtH1x3gQmZnAIF4wYeJykS7JB5jvpYMMGr6fwdiqe75FSpxZn5kfJoLkYw==
X-Received: by 2002:a05:6830:368b:b0:7e9:d593:896f with SMTP id 46e09a7af769-7fb79dd122bmr20984742a34.1.1789010488832;
        Wed, 09 Sep 2026 20:21:28 -0700 (PDT)
Received: from localhost ([76.187.192.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da9a49sm19758315a34.13.2026.09.09.20.21.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:21:28 -0700 (PDT)
From: Andrei Aldea <andrei1998@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/15] HID: hid-oxp: fix default M1 and M2 key mappings
Date: Wed,  9 Sep 2026 22:21:01 -0500
Message-ID: <20260910032115.28669-2-andrei1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910032115.28669-1-andrei1998@gmail.com>
References: <20260910032115.28669-1-andrei1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default button map intends to assign F15 and F16 to M1 and M2, but
the selected mapping table indexes resolve to F16 and F17. Use indexes
47 and 48 so the programmed usages match the existing comments.

Assisted-by: LLM
Fixes: e4c850a6e750 ("HID: hid-oxp: Add Button Mapping Interface")
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
---
 drivers/hid/hid-oxp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index d2ded6b..3f2be80 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -607,9 +607,9 @@ static void oxp_set_defaults_bmap_2(struct oxp_bmap_page_2 *bmap)
 	bmap->btn_dright.button_idx = BUTTON_DRIGHT;
 	bmap->btn_dright.mapping_idx = 15;
 	bmap->btn_m1.button_idx = BUTTON_M1;
-	bmap->btn_m1.mapping_idx = 48; /* KEY_F15 */
+	bmap->btn_m1.mapping_idx = 47; /* KEY_F15 */
 	bmap->btn_m2.button_idx = BUTTON_M2;
-	bmap->btn_m2.mapping_idx = 49; /* KEY_F16 */
+	bmap->btn_m2.mapping_idx = 48; /* KEY_F16 */
 }
 
 static void oxp_page_fill_data(char *buf, const struct oxp_button_idx *buttons,
