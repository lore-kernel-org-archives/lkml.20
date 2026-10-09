Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5AE45198D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560105; cv=none; b=oKF2OnGmBbijBZIbkHJVMfYSV+az+rKGO5hwZR+X3XnIJcalsH6GHyxLemgLaLqhLH26vzVMmKh/3k88AohBqaewaYIXGxAzeu0d5opI17WV7OTxh8vtzx8QFrof/6FwRLvPExJIrosJgomJcnINpvmTKopRXyCeFFysVheWMa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560105; c=relaxed/simple;
	bh=+a4U5HVQU3WHYme+hfgT/b23Mzz+n4cGICyxVX0NuVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ma93R+mWK7BDiZSwx9vB3/FFLK0qOAh33ewedHf+N9Qr4fESBExNBaOs9hRBB0nb2I9CMU4qmEXZZP6WbKflq5PLMW+tsCOn6xrgH6VfDPWMmf1og7vZRKnP13EPAyxT2F5xlH313q8t9OU4hmFIiUvqybk8z3GSfaBjBykGfKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBllLKp0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBllLKp0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso59673245e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560101; x=1792164901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qvjdjY3J1vFVxGuXAsjXq1vqS+6oUh2fRBwQDdkJWw=;
        b=tBllLKp0ZXDWvy/T2Qu6+s4NyQyX5SfQOwqjuw+R09pUa22oL9vSctkgLDEg5asUCQ
         Am81CKyJB+tZGwnkXAJrdiZOcSfnVwx626dZg1B6aQv1ZQtDfpiu8EEVhbsUPmkxB9uY
         0qKiVMtf+yxSvN3Ihax6DNJcowubxwYWp40lOyeFQqWMS50+Lpm923LiLP8fAtShWo6G
         /U5ehTcxa0ZWTFdiwQyplcFpZq3j4w7n6PRGHCbPmHdzVMAYseYW+RN/0M+8qWUG88qQ
         7vo6W/3joHo0qFz8mIjxyPSXC3g9mNmIfTLbOhT0oRMiZ3Kyu293h9x2D+mZfOqwaePh
         Yo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560101; x=1792164901;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qvjdjY3J1vFVxGuXAsjXq1vqS+6oUh2fRBwQDdkJWw=;
        b=FslYUVG6vN8bPnZaBKdWa5aq/m5paWj1WZBLF7i3X/Fd9elMfxs2Qvc0qCRth5Thsl
         /404fW3PhSKYzNSgzRBYXSlThTtgSZEwa/fGr4NTb16m/yXmDG9hRwitnmOuBIETAmIj
         Bc+S92PlMhKMzbw03A6RFJrpyAIpyfZPWfManOBOfDXzJ+8zruZG2lUY/nq1qb/brjrN
         Yi27o16Y+r9b6gPtkaSUfZQ/PetaM5BXb42fNDUT7SxhEHY9BaM3ORitXaG2MdEPJ0Ij
         4hdMpKxgZm9pa5by0y3TxoVPYv12e9/umJdsjIIi9uMyqPfn+ajr3KR907ftatVCe0Gt
         td5w==
X-Forwarded-Encrypted: i=1; AKwUvByIKk+YkFZcGkTRL9NrW4IHYUCoxcs6wvC43oQxMTeOSoS8cZpXpcHu6WDBMNM/Rnp6bhZm92zrY4adCd0=@vger.kernel.org
X-Gm-Message-State: AFuF++l7aSwTt9+6ZnYkmebTvP2AnvAV3ejsDJoVMFtuiXaZv1H69Z3Q
	2sns8qunFGI47376msYOIkiI/mYGYCyD42SYgjHwuSC/QrprxQfebv+nIIReTX/eNz8=
X-Gm-Gg: AYBFou0Xmd/qeCA0u+iCy+r+EUNmqDXYhH05brQpFzbb7nfCrWbzWH7j+kJrLT7kgc+
	RL7AfsvF2ukCAAnbMAmJG/7DuG3zGZw13uMbh2K+zPuNUaSPMw07JRu9BEd4bZX13a9ufdm9Nz+
	T6XrY+wTFHQEneEpWHt5U3oKU3xIQIBzR5NxoxIBygXD05sNt5b8E/CeKcJFLNgZMSUCbP1oG+5
	Cdth4/Ly9U+oDQkMhq9UGlUAtS6f0ZNSyW3cIfIOI0+UKANaImCwwKVVy/UdbSTV1JwNuXGaCAh
	YB50xSYUTuCGzXunZpMr92GAFhOlrim7GuB8Ji8gG7hogSnIbIc9UlcFD7Hx+VrATENvR4e+zW9
	E4vqxShnoe9shR8wUmTdEKiF+xAynriPEu0m2xQkXMafuCvIXJyfkeAYdrsqt+hkuaFUqBDgD+P
	fgbB8DP1fkKQ8Dlw6u/LGp18d4rro+SrGKeWNQbi7g9Wjzq2t6x+JEB0i+BG5YLfQpihSZw41g7
	O0DsvOUTgeIxktBcB3wL3umzde9hX+YMy/CjiCueppVQPDS6r9h9wJk1g==
X-Received: by 2002:a05:600c:3144:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a18e4b0347mr42708135e9.19.1791560100886;
        Fri, 09 Oct 2026 08:35:00 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:8516:411c:ea75:bb84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e30a7sm4597713f8f.12.2026.10.09.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:35:00 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 0/7] HID: asus: ASUS Zenbook Duo keyboard support
Date: Fri,  9 Oct 2026 17:34:27 +0200
Message-ID: <20261009153459.124752-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the detachable USB/Bluetooth keyboard of the ASUS
Zenbook Duo line (UX8406MA, UX8406CA, UX8407AA): hotkeys, keyboard
backlight and the platform profile key, over both transports.

This patchset is a collective effort, gathered here:

  https://github.com/NeroReflex/asusctl/issues/25

v1 was applied to hid.git#for-7.2/asus and dropped again because of a
clang warning. This version fixes that, addresses the review comments
on v1 (Sashiko, Nathan Chancellor, kernel test robot) and the problems
found while testing it on a UX8407AA against 7.3, docked and over
Bluetooth: hotkeys, keyboard backlight, Fn+F profile cycling, and the
touchpad staying with hid-multitouch.

Rebecca Mara Müller posted an independent patch for the UX8407AA
keyboard in August [1]. This series follows it in using
HID_CONNECT_HIDINPUT_FORCE and in binding the USB IDs by group, and
carries her re-sent handshake as the last patch.

Changes in v2:
- Rebase onto hid.git#for-7.4/asus; QUIRK_ZENBOOK_DUO_KEYBOARD moves to
  BIT(16) as BIT(15) is taken now.
- Fold the USB descriptor offsets and the padding removal into the
  descriptor fixup patch; fix the padding removal, which read past the
  end of the descriptor and could write past the end of the new one,
  and move the whole remainder of the descriptor instead of 12 bytes,
  as the Zenbook Duo collection does not end there (Sashiko).
- End the fixup's branch chain with a plain else so clang does not warn
  that rsize_orig may be uninitialized (kernel test robot, Nathan).
- Drop the MyASUS key mapping, which is upstream as KEY_PROG1 now and
  matches asus-nb-wmi (Sashiko).
- Use HID_CONNECT_HIDINPUT_FORCE on the vendor interface instead of
  injecting a fake keyboard collection into its descriptor (Sashiko
  flagged the malformed padding item).
- Cycle the platform profile from the driver's worker instead of the
  HID event callback, consume the event, and only build the call when
  ACPI_PLATFORM_PROFILE is reachable; v1 did not link on architectures
  without ACPI (Sashiko).
- New: cap feature report writes at the declared report length; the
  Zenbook Duo does not answer the 64 byte writes the driver sends for
  the backlight since 7.3.
- Bind the USB IDs to HID_GROUP_GENERIC so hid-multitouch keeps the
  touchpad interfaces, and leave Fn-lock out, see that patch.
- New: re-send the handshake after probe (from Rebecca's patch).
- Use the "HID: asus:" subject prefix, write commit messages for every
  patch, and fix the Signed-off-by chains.

Not covered: Fn-lock (see patch 6). On the UX8407AA the screen swap key
sends a Super+P chord by itself; the 0x9c mapping is for the UX8406MA.

v1: https://lore.kernel.org/r/20260513163248.16483-1-p.pisati@gmail.com
[1] https://lore.kernel.org/r/20260811125548.1975748-1-rebecca.mara@posteo.de

Joshua Leivenzon (4):
  HID: asus: Fix up Zenbook Duo report descriptors
  HID: asus: Add missing Zenbook Duo hotkeys
  HID: asus: Force hid-input to bind to the Zenbook Duo hotkey interface
  HID: asus: Cycle the platform profile from the Zenbook Duo profile key

Luke Jones (1):
  HID: asus: add prod-id, quirk for Zenbook Duo keyboard

Paolo Pisati (1):
  HID: asus: Do not send feature reports larger than declared

Rebecca Mara Müller (1):
  HID: asus: Re-send the Zenbook Duo keyboard handshake after probe

 drivers/hid/hid-asus.c | 178 +++++++++++++++++++++++++++++++++++++----
 drivers/hid/hid-ids.h  |   6 ++
 2 files changed, 169 insertions(+), 15 deletions(-)


base-commit: 8099f9da59f1c338bf88e25b7aa2a7fdf840879c
-- 
2.43.0

