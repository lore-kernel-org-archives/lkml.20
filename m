Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC24E2F3D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560108; cv=none; b=ncwTBDR2B4S2CPANFu+y4BHG8+Bxd64p1h7lmYRMB2LHIS/We2z3NUxwJsf4dFpS6ErQHCGr1NvN4F3YF5fHgXN1PrqxRvAMZvNZNd/8kEreMM4gcaH8+d22fj9kBLpTozgFoBGbo3D+FPRc6NFrG4BaU3q2NtV9zWfq5TTsfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560108; c=relaxed/simple;
	bh=hStT9txbDArLtuvR1yzP7JS9/fqpHpqzqM3nqIg/rgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/hjveuS65QnVpVNsZNUAI/6y0s1nbaHHP2DAfvLA7KpB/HWph7rF/RWs969dbAvRPsL+MO0kze1YlM7l4qVHIQybuWB6BSVbS8l0ZEBEV+BFnTMfK4jkEDJUDm3wO2uBvcaygk0zx0huGqU3vM+1Vvn1Uc9RawC26iJVCGRPrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Loy0Lk69; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Loy0Lk69"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4207ac26so3341311f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560104; x=1792164904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAWNbPCvMd1hI7liwUcgUaojiVnzBLeo8ySlY+LQjrI=;
        b=Loy0Lk69nvyhOyJjVoSBkJ2wFpJrUcpCsISwXQYytiixaILc5noEykXw7phcnuknYg
         1kGnckCyY4eT4CwQF1nVkBW86gnqjKJVVVAh3RQFVZQqIomLskxMG6NuRWZraRb12c+p
         72Aevu3Ece6dQLu2GUCasqfcpllituXMlOAjkAaB4QOR2QqCR5Jvv0HWf1Erkx2ltgzZ
         OxI2yx9GdZhIpG+GRow1oDr6gox+B42NiD+EZvTjpI2srPS+PDrU643GYPRYVmt6fLaq
         NDw0qbJ/oHtMU7llVZP/xvbxVvISENcKx5jkVkcuywlqpok0awCWGwthSzAkMCma1kyc
         D6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560104; x=1792164904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eAWNbPCvMd1hI7liwUcgUaojiVnzBLeo8ySlY+LQjrI=;
        b=uU+r890V29zNVtx/uH1OS8+PNwGeWxp3jgDFt/HNa7Vak1GrzJGUK0XgOw3tDzx6dv
         BUM2DAFpvBK370fcus/QkADmjV2U4NMgCnrV/gO2evbZcwsMCaKq4bPXHg9OqozSgR2R
         DfT6DryeP0T8PfRzmeQ1QOiedXBng1DlKeJTd65B2iS3x8YHPiCd06WC7NyBWeDRm7sg
         FAQWCReGyBd2RNgvoQ6wArGaDmQIBVPZSaikoxqmkcyWDDJebm7qDeQjJrNdfG3bpIpu
         hTyARH4QLbN0g/vO68pYC3j7lsSEP8y4fe8lH3hCd6X8xvR+Z5qlvJlDIxVuBYECXTNT
         +MLw==
X-Forwarded-Encrypted: i=1; AKwUvBzueKASjnJw4ylYhhoD1jAf+VVwuOHkHU9bTGmvd/+1BzpAqJ/SzfXycFRbKPYFMqZeuQ2G/5+iEIIhvkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeHZXQ0xXxX3PBhUd7buKxaw2QR8HDhHMMzmuN6lg4z5eOMyDN
	OYi9BYuhfQTA1DXG9ED5cCG4JTBL5q1XIid0Kxj84sE8nvPsSLS81OEM
X-Gm-Gg: AYBFou3HfZjD2Ref4N8vED47x09qD60Up0s54q+d3GWiVu+kYBYtQqnLxAmylYsvLhi
	loL2BfGBK1ryV9Dn26f8rDEQ+W6BdKSQLl6BdJ6kj5pUmTQ6wUjxXQpTcH/abMloTIjQu33RDWg
	tYf6vi4tmwVMB/bXB8ezP3MeiBcLiSl+kjEI8P1qAZH5kbzbrTAiEMearToKOSnaoJ6lNVrWm4a
	YS7jtm5xVoacVg4+6IO/LqIAvylJ4ahLHm++GokAx6apKPu2W+cc2d4aIt3l3swcWcz6TcdX/qD
	JbwN+18lZ8yot3Cl/VTF03ighcIBfkhxWTA5/rzyR3dLyJf2H3QpkKS8PTFf53KAP9zaxKUsKBj
	odNh4y/PqKUDZW7TaYUEAFAoakmZk4H3FcUh3ZL6PZp29c9Yu57qgfNJsNe1fhe+ldECOrUBUSQ
	F3HSFiClAVq2M6mif1KR3WbfQ3vbsTXTITE92cBig6yMcempAWl6g59RP1UfxoKKjGhhld/IhAf
	KGFnlGT/FiKwfXeZ7pAlgcb9leWkBbqiwFVBaHODlJh5K1PZJ0Ou2aohQ==
X-Received: by 2002:a05:6000:290b:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48dbace156emr3873145f8f.42.1791560103597;
        Fri, 09 Oct 2026 08:35:03 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:8516:411c:ea75:bb84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acc936sm4399484f8f.44.2026.10.09.08.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:35:03 -0700 (PDT)
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
Subject: [PATCH v2 2/7] HID: asus: Add missing Zenbook Duo hotkeys
Date: Fri,  9 Oct 2026 17:34:29 +0200
Message-ID: <20261009153459.124752-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009153459.124752-1-p.pisati@gmail.com>
References: <20261009153459.124752-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

