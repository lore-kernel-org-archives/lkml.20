Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96554303C97
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791942255; cv=none; b=SCnFsrsaihnjVgZAetzBOnmngQa/K1gCs78Vt6ab5TUhcK2WPfG1BxEsmGtLV6XQ9UA7maa8f8UIrDswsWOCv8v2KiYBpgYNoE8Oc1JtvuzZnLGMMS3lsrjyPkiSQ1jIMSya3A0Q/iYts1vabVY6udBOJGPcyzFUJgKl6tYKbh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791942255; c=relaxed/simple;
	bh=pZLuHo5ZWjv39EmAfep7f0DI3I6NdzNmEzWVgKx/rls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt/G4dANXMIs7p88391GmZ57dcH4WK1+gaUw1iYCGuC19Iampurno++Iv0MkRKLfl54g8tHCWQr0H/wMFEHE++4syiuxIli5IuCbJOUyS0SJn7qesCK+6vrHguE7hodsLcEBdH81aykCCymtub4g4hIwlUzuBZEURhCID1X0RPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=YnlnT+1W; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="YnlnT+1W"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5339381b46eso37667531cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1791942253; x=1792547053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dlj6aFpIYGfY0eqR7kOi/l3Gq5Y654XQkcpULmP78WM=;
        b=YnlnT+1Wse1DNw0UWj7Az98eLhrWNU/FkP/YXNMM6fJS40pA3hT2Arwlb6k773I2xC
         W4d4y6xahZUYLnwgpOl/QApnO5DWnQZbBAGxyQkQ30MwpHGqfTAZcCYckjrGNef/z2dc
         6M6xJOSY21skbNu/app3XdsttlsisgUfAm0pqy0Bqjq1TfhZBRnPagYQhDLLG5mzv48O
         DsxZqlTTtIPwTIAslF8Xa8MrI0Klk5VoGQ6LO+pDYelkVoHGf5lY7XC1lANDwSWRmimF
         XVYHpuU3/Y513Ixp6Jz8NMr1rBeWUna+7PTVUEB7vHIrR5yetHV3k4Gf3ISOw1ByMKIn
         YNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791942253; x=1792547053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dlj6aFpIYGfY0eqR7kOi/l3Gq5Y654XQkcpULmP78WM=;
        b=KrvqFJwF/2JNQpcz33ZBiwNZFhEfzPYcIvq0hnERTgHhn6rRZosxPAF9D7h42xWrTH
         Y67XoFbaH7c9vQagk60xR9KdwjAQJ4f1aasAF76lPeENIeeGGRw2i17QE25tEBhjaqhv
         VOvCL/JlHeMdGm0FVtS72TMeGjC4ycCjZrKFYCNvPGhYvUYdvyZ9HQJCNyNF9JzgA5m+
         rgb/fzp+ZWwM0O8WU3kHbfFjaiAp9J4rZbtTGUbE4TRPGoLFTdsj2IdgBbmz2cx+wQdK
         CfOzjZQxxBk8OaE/uMHN0MyBzLRfvvSui/j6lXykvGQjLh/06rdJPV1d4C6ayEIDzR3j
         sC5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/D5nOknlcuhsflT5D3hTUpjKa+C21BEg1JQWJbkWTiwolQJWcQs+7UWYkjIbewgB7pu9aEcQ1PNVcDo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgDG7qx010j9OWdacH1Tl45J1YjoJJ5ySndWhb/SL/+vMzCZzr
	24c+c0a27n0/cHBqTYkkh9i3cP0Fp76F+oPMlScOfE0LnErI3wZL6ULcE8220V7Tor0=
X-Gm-Gg: AYBFou1lzd4kDWZjKNJp7y/As/k+yDF2pBWxniMYNb29SofCaOPWqLnkRKGqr4iR/Ai
	x77eBE+pTrth00r8o5ZyJ1mKyyQOt19IWZj88XjNgoBo8aFWvaNsq/bLoX8XJX5jgCvfN6frE3/
	QKy0oVl3wpCtQHXRD+OzEVXyIEoSAjbQ7dyOrKElRt8flZoYH+jyjPUkpS0ibvL+AP8pAvZwmAi
	tO7RmezVbQPXUfLUEMX6lB6QK/x5CYy/K0R50zbvdMnPlkvDowTM/cGV5jb+gz8MhNYjv/OiL3n
	kk87eTsmIUraI4cgYZYq3HOSN6AH5wVVcukpp/zcMLr/qFIxsZ2CNJKtK8cFCOA3E/g1MBgKMJY
	CxeeXVWyujCm1sl9OSttx6/+WrVj5Y9JSEP2BkbwbXdAteZ+YtfgpAuCUJlUzaLHnmHcB1lqyiM
	JH8QJTPeJh9IqppD55GI75YaA3DmeCs3E+kSwMvxma/yFHN3fMqV+KCWrh4x1vqCswzL27D1+T8
	lB8rH50CbTDcxykx3z9fsPgmatHESdrDfEwsosV
X-Received: by 2002:ac8:5743:0:b0:533:90df:fda3 with SMTP id d75a77b69052e-535fc8a0915mr24634181cf.50.1791942252446;
        Tue, 13 Oct 2026 18:44:12 -0700 (PDT)
Received: from boomzilla (dynamic-acs-24-101-237-49.zoominternet.net. [24.101.237.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7d9sm40377936d6.47.2026.10.13.18.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 18:44:12 -0700 (PDT)
From: Karlos Abel <kabel@voidship.net>
To: dmitry.torokhov@gmail.com,
	mpearson-lenovo@squebb.ca,
	hmh@hmh.eng.br
Cc: derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Sync initial switch states
Date: Tue, 13 Oct 2026 21:44:09 -0400
Message-ID: <20261014014409.14579-1-kabel@voidship.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <98c68af25f9fc08500eb818a6d77d0d7@gmail.com>
References: <98c68af25f9fc08500eb818a6d77d0d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hotkey_init() reports the initial switch states before registering the
input device, but does not terminate the packet with input_sync(). Since
input event buffers are allocated before registration, these events can
remain queued until a later SYN_REPORT.

On a ThinkPad, a userspace LED update and SYN_REPORT delivered the initial
SW_RFKILL_ALL=1 event to the rfkill input handler after registration. This
undid a software radio block that had already been applied.

Call input_sync() after reporting the initial switch states to flush the
packet before input handlers attach. This requires the input-core fix to
accept EV_SYN events before registration.

Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
Cc: stable@vger.kernel.org
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/98c68af25f9fc08500eb818a6d77d0d7@gmail.com
Assisted-by: LLM
Signed-off-by: Karlos Abel <kabel@voidship.net>
---
This is the companion driver change requested in the linked discussion.
It depends on Dmitry's "Input: always accept EV_SYN in input_event()":
https://lore.kernel.org/r/asx50uz6iafsyAd5@google.com
The prerequisite patch ID is included below.

Validation on 3857c2fe5449 plus that core patch:
- KUnit/UML: all six input tests pass with lockdep enabled. The two
  regression tests fail with either the core change or the pre-registration
  sync removed, and with both removed.
- The tests model the driver's event sequence with a virtual input device;
  they do not execute hotkey_init() or operate real radios.
- The actual ThinkPad driver object builds without warnings with W=1,
  configured both built-in and as a module (x86-64/GCC).
- No new physical-hardware run of this pair yet.

AI assistance covered the change, message, and regression validation.

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1661f070c..ea8679398 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -3497,6 +3497,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		input_report_switch(tpacpi_inputdev,
 				    SW_TABLET_MODE, tabletsw_state);
 	}
+	input_sync(tpacpi_inputdev);
 
 	/* Do not issue duplicate brightness change events to
 	 * userspace. tpacpi_detect_brightness_capabilities() must have

base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
prerequisite-patch-id: f8539bd5b5201ef9795823552ba68a73b7dd6298
-- 
2.56.0

