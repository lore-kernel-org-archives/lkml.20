Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2043BDC2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888040; cv=none; b=QpwjRyEXManMQb5LofMse6vjPaeniOBcVyzpvDqqdINGZGJhdocFexMhLZq3o6Ji3wDD7wK8FKwS1ehwqZz7snKZLYNp1CZdKhlF5HouXikQXJiwzXDg0YH7tfrsZpR7iK8waP4RsNT224lo40r1t/ZOR2ztrC9sdzoJ89ES3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888040; c=relaxed/simple;
	bh=wNq8OCW5DDjfghpOmb/RQMgU7aAnMknzkZTzLIjJOH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZLJRkYTpQMclCWJyvFlGox71SmyUZIS5WI/0v/LRGyDl+GL7POSX6PbIzYe8iUp/yrH9SRiJYpi8HcveiX8ef0IeqIk9COkjbQA+u/Ury1kvxRXzq9H042NeQdjZtSLJaPvxkiUunz3ujoMV++T3j0b/mIzFy1pZdAA82dEcGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSrDUPPF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSrDUPPF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so21230425e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888037; x=1792492837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k61/sCIWgJWFdXTCqSl5VQGLQJqZ8KGaN5eUIZ8iPhg=;
        b=VSrDUPPF2Mol1cxwpP5ZdlEIPxN3UyELurT2yPYenMqNFNuolu3fbZnKTXBr5gVfst
         l905ZVzQOcgHB8O3r330waKHIX+0QLNGU5897c+6WB0myx1S96mQ79K5mONPxxprUQ+S
         JIAz3LDsp+/7cEcaLaRbYUAosJGcO48Sp2CiGkvhJCv33C1JObPzGzDdzjDE8OBZru/a
         hhwCTEmqQh4OKxz4Ko/CHyEl4WrQcoNrhjoQhc8dle12bDzKNC4LdC8Tdlxw9Es25Hg3
         OVKVZJRa8QS/zRyMbGY2/HBfgfvT6PdNMYOWZhO8oLGksLL4acAYzMXodtXzihXAajL2
         ZX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888037; x=1792492837;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k61/sCIWgJWFdXTCqSl5VQGLQJqZ8KGaN5eUIZ8iPhg=;
        b=Qq8CT+N9oQhrz+AHbC02/VdyTxX0hb6sIYptUHW0/TUIm9/NdZXaMaR+R4hJ72cTQG
         zjItVa8/AHaQmIRv6aKPRupYzKo0YhJB8615G0En0U+BUK2Rv/m662ED8HtTve93mVYc
         NfSLps8iyyoV6Paw0Hl0titbAiR7El7ZeAG19XfDqzzcls7re16wckfNYbLKMEkh82r2
         6epEXPxYzLSlScN+BlVl3mzTKg5U7SfhM51eo8jm6AY3iaboqa1VmUMmKDHjYNJGkwrI
         nbWEn3JY7jnxN/vuzOH7IsOFmWY5GxMYEhN3sScY1bGyYkBujH8xYvHd7Iehw/haPkQ7
         gVyw==
X-Forwarded-Encrypted: i=1; AKwUvBzC+6XUX+X4KxlOK9fCnscvES4kBskCt9lHPaxj4Wdaaa5INphq4s4VQlYE/8AY/xUCVljfI1Z0qrrfHyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL62v49KF0Jka7/mAZrBB5z5wyB7WQ32aBGXUWkEJVLzfuN/qmG
	KVkUT+DUvOLABFrVt5MAHfd13KIF9a6y/PeHUviluSL0qmJ3TFq5gS43LDGrbxr0
X-Gm-Gg: AYBFou0dy2lglOIe4lD/WhCqRbdPdwtOoqqyf9R99WHCzalwT03yLlcrt424y0v035C
	TqiX7hu4mPPEq9T2m2axu3RuGgX4OJ21h1lw6s3H3iqCabNne6ydtci+lMR2m3Qm0uCSE4+SK/R
	5ysSVi8IpdlBaNLNodeVt1Z7vJlQOTS5qQDMMaUsLDfIh500vWYgLTJG/K1NyEsLKP7eQrXfGLs
	Qyd7k6yMcGG9dlKWjoC4yO2TfDqmRjzn+pxBc6foRjYkC/jafSz0mdcvHyR25geHrLAdQXI9Ag0
	eQYjadO3QQSP5PYjPOzePl7T8bX7Nw/qpS+8QneXfhTRAo1sC+TqHPsWs9Glw7TqEU1xgORdfeK
	cFU12Qv5XTG2sCtcbGrvz7/MajWXdr1/2E0krAKT6qoLpqUebqUXO5umHrJCOEk911z0KMqHBdl
	SAaJVYq0qAr+wwdCuwvdpu2PoiHw1ZSIkAJk6bog/jY47GSiGBEfvFzM0Cs+qeYEtIoJHgXEtVm
	knocBlp9alKu/M2Ghy4h8KeyOnIpIa+x2fFh1gW5WbR75cTMJI+tbgmIA==
X-Received: by 2002:a05:600c:4688:b0:4a1:8d46:6228 with SMTP id 5b1f17b1804b1-4a18e4a9ba5mr251041705e9.14.1791888036739;
        Tue, 13 Oct 2026 03:40:36 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:e22b:cb88:4091:8aab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ae0c9fadsm50439075e9.4.2026.10.13.03.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:40:36 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 2/7] HID: asus: Add missing Zenbook Duo hotkeys
Date: Tue, 13 Oct 2026 12:39:59 +0200
Message-ID: <20261013104033.36079-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013104033.36079-1-p.pisati@gmail.com>
References: <20261013104033.36079-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joshua Leivenzon <hacker1024@users.sourceforge.net>

Map the Zenbook Duo "screen swap" hotkey (vendor usage 0x9c) to
KEY_F19, like the other ASUS vendor keys that have no dedicated
keycode, so that userspace can bind it.

The mappings from the ROG Ally onwards belong to devices with built-in
keyboards and can share keycodes freely. The Zenbook Duo keyboard
cannot: it is a standard USB/Bluetooth device and can be connected to
another ASUS machine handled by this driver. Document that above the
ROG Ally mappings.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
[pisati: drop the MyASUS key (0x86) mapping, 2061075360182 ("HID:
 asus: support the Zenbook A16 (UX3607OA) keyboard") maps it to
 KEY_PROG1 like asus-nb-wmi does]
Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
---
 drivers/hid/hid-asus.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 34739198d90e..242e273e4cb3 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1264,6 +1264,19 @@ static int asus_input_mapping(struct hid_device *hdev,
 		case 0xb3: asus_map_key_clear(KEY_PROG3);	break; /* Fn+Left next aura */
 		case 0x6a: asus_map_key_clear(KEY_F13);		break; /* Screenpad toggle */
 		case 0x4b: asus_map_key_clear(KEY_F14);		break; /* Arrows/Pg-Up/Dn toggle */
+		case 0x9c: asus_map_key_clear(KEY_F19);		break; /* Screen swap */
+
+		/*
+		 * Mutually exclusive section: Special keys from different devices
+		 * can bind to the same keycodes without concern, as they will never
+		 * conflict.
+		 *
+		 * Note that devices with removable keyboards that connect over a
+		 * standard interface (e.g. Zenbook Duo UX8406 with USB/Bluetooth) do
+		 * not belong in this section, as such keyboards can be connected to
+		 * another ASUS device that also uses this driver for its own keyboard.
+		 */
+		/* ROG Ally */
 		case 0xa5: asus_map_key_clear(KEY_F15);		break; /* ROG Ally left back */
 		case 0xa6: asus_map_key_clear(KEY_F16);		break; /* ROG Ally QAM button */
 		case 0xa7: asus_map_key_clear(KEY_F17);		break; /* ROG Ally ROG long-press */
-- 
2.43.0

