Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438103;
	b=WLJVTdt/sZ4Lfgx7eecb+VVu+ayLyxMDK/OkuGy+rCmuU8pC0rc3xThhSkeU3CCNtGtW
	 5GObU7+bCXk+0ib1O7pU6EY4PwhBMcLIJw7dXeCzJvlPpUKhTXZ197aZ6wxTstgQmrNjv
	 0ATBBtv2/0MmiUjHtcWoAquv/5S59yWZ+4Nj9hqHB+ZOpy4YryknFSifXZG1TQOPw681+
	 XUPuUVBzCBeeS6Nld99opNYryytDtsGhKECidINt7oRqu5CNeGZDVxQNlkLiGg09jFnYo
	 38lIrhEXIfSqH51NPS6vxXOLLmZOJJ/chXu6xZNamTyf3fW1mI7ZyCdQNWmtaMh0Keg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
	b=gKJq2l0mMyIXkXqvumdmj2MvOkMcj6RMEWm5xr3/ZWFVziPjtk/9OTkn0O9tHKAvklEf
	 wgrSvd2zUP7hUI+ZIiBTd2aPhMQJw+K9/TNUBeyB3cY6jfNGNpOOWCeOnHUYwpELzuWt1
	 QPWPYsYCSr9P9BxHaqQ8WAa2SYpyr/s9BwsRMxRvwim6BaMR9uxT03pII6bdhvVszYYEn
	 zAWBz7Ha1nc5emwbLGGQZA54lmuwKdjhCwhCJRYJ1xBylmMWqE3DaU3mkgIjyI8LnwA3E
	 ZBA6JMnPRASx3RkWdRozekIf6DAcp/FJJoEKcF8lwZ0OHKDVPKpZvU/u2cqjGq2drvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQMN+EXc;
	arc=none smtp.remote-ip=74.125.225.73
Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30829606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30829606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQMN+EXc
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-490ca655ba2so1676539f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794438101; x=1795042901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
        b=HQMN+EXchlp4xbB8rF7Pnhq5g3JiXeEDSFSEP0fBPwP0YzTauuIlfszcErHxeIsqW3
         MuKG422qmxlKr/spOL6wWrxqiB2S3Waay/nHqfQSCfYpQAF9JTo2IoJk+IfN6aGgFdLp
         ql/vlnC1a69YhJWurBaDDynrC3hNOtdQ1yZrGpzI0/Lah3dINozucyAOMb0JkX6AOS1L
         C0aU5/rl8dSG6oDzwjUNLuPBM8Oec2bA/GyksTjki9+nQXx0THaY351VKHkFz+kXbme2
         Jadh3OnGIokbBQoMOm4vVgSC3aNuQj46gfUgIMBu7/8Mvk/BZ4ScOv09WVofy+Ci0eua
         rtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794438101; x=1795042901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
        b=rCapb+b/JDsC7TtriqZA5D3ndoFierjshoK9w6T7BeplWBWO0Bz5Mexj6DwuNLUFV+
         o7hS5uP/CYi9TLMabgg/8UVNYl5eKnvWvK1KkOPyVpp/E0CdYPAy1VRLRrhBwk4bm8HM
         MZppnltl4yHMZTf+1pdkLwFrG+CWG+OSESmJqwMmGZTODSQRJT5QpEYNaI/yNWpTfb3/
         V2TVr+edswEAFulIwJFct/oJglnn2BNlpCjqXmarAzAOcQRAxggtuUTaEbT/MhENqGc/
         2PP8phptT3qbxXBayq8vfyiYw5gMqTn1BghSQI9elEAbAOZbukJd6rOKz6tUzY6pRQpK
         fJ9g==
X-Forwarded-Encrypted: i=1; AL+hErGgYSUN2Ms5EJ1jRDTYL/3cs7RWM6ds3403vSSsGaoGIDmpJlE4WNo37101/f5SfYJ8FDxgLZ0V6nhKu18=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f/tlUIrK/Y++OUCIwv29jW+xbeoFNdM/ztgYbn1cYQv0YS26I
	KJH4KohcPsBBpEaxX1ZvYNz/1vEvBzMTd1vrBFsqUzAEvylIdD6hEECr
X-Gm-Gg: AYBFou1F+cTOh47+kjU2oes1GyvbMyNvmTPG6+c+w8w0sfEngqmpeRl9MZ4Dtz0TI8T
	iYp5RK8WWPO+FNfUDkOFKgel59GeRCDK8MQOCk9vUurrlwW5RvH968UUFEUNcq2TZyPvXLFKGB0
	33Olc9S6pwF7MG7C6r2oejyvJqIbi7IDvs879il8e8tnVHGk2guiYoQM8tr8qFxAuWLL5WP1YoQ
	HKx+Obr5TtVDLdiq4f3pRxBLbRmi1C//6C73YepcVyFWOOJyLjqjhfTdm/t/MlRyJatQt3DH77P
	wFjvumkYaPs02Zktl98aFmynHlGPbYANS3NKiAvZuJjRJMxSUirkp9u3y2xF9G3PzDqyd3cjgop
	ruMQgKei61LY1wqvNkUO2hX3d1Xlkkw8MB7w8eYpy06WMNMh28shwsBIMtifxDBjkC2rk5NcChC
	hsQc9DOpa6ASuMpFtYK9DpZQmvrOZA5deDKP7yEqFG6o/TsKRnkBIbN/jB4PVBedCvj8hv3WTVO
	ySah2WZjs/m58tazAnzqRT0ivfSWXiQch+htjlMaj9cH5ROSpauW0uS8rnSxCjTsUhT03c7+s5L
	D+gF7Mpdsb1kulpQ7eQ8M9Kplhk6N3hdR4kp
X-Received: by 2002:a05:600c:64c6:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ba0937fedcmr69091665e9.22.1794438101294;
        Wed, 11 Nov 2026 15:01:41 -0800 (PST)
Received: from cachyos-x8664 ([105.98.136.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm22047415e9.9.2026.11.11.15.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:01:40 -0800 (PST)
From: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	ac100@lists.launchpad.net,
	linux-kernel@vger.kernel.org,
	Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
Subject: [PATCH] staging: nvec: kbd: bound keycode table lookups
Date: Thu, 12 Nov 2026 01:01:34 +0200
Message-ID: <20261111230134.200561-1-benazzaanis783@gmail.com>
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
Content-Transfer-Encoding: 8bit

nvec_keys_notifier() indexes code_tabs[_size][code] using values taken
directly from the embedded controller's event message without checking
them against the tables:

 - _size is a 2-bit field (0..3) from the message header, but code_tabs[]
   only has entries for NVEC_2BYTES and NVEC_3BYTES. NVEC_VAR_SIZE is
   rejected, but the reserved encoding 3 is not, so code_tabs[3] reads a
   pointer past the end of the array and then dereferences it.

 - code is msg[1] & 0x7f (0..127), but code_tab_102us[] has only 126
   entries and extcode_tab_us102[] only 110, so scancodes at or above
   those sizes read past the end of the tables.

Reject any size encoding without a table and any scancode beyond the
end of the selected table, dropping the event as is already done for
the power button.

This only matters for an EC that sends malformed or out-of-spec
events, so it is a robustness fix rather than a security issue.

The issue was found and the fix drafted with the help of an AI coding
assistant (Claude). It was compile-tested with
ARCH=arm LLVM=1 tegra_defconfig + MFD_NVEC/KEYBOARD_NVEC at W=1 with no
new warnings, and the lookup logic was exercised in a userspace harness
under AddressSanitizer for all 4 size encodings x 256 scancodes: the old
code reports a global-buffer-overflow, the new code none. It has not
been tested on real Tegra/AC100 hardware.

Fixes: 32890b983086 ("Staging: initial version of the nvec driver")
Signed-off-by: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
---
 drivers/staging/nvec/nvec_kbd.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index d2b91318f..9b976f0f5 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -28,6 +28,11 @@ enum kbd_subcmds {
 static unsigned char keycodes[ARRAY_SIZE(code_tab_102us)
 			      + ARRAY_SIZE(extcode_tab_us102)];
 
+static const unsigned int code_tab_sizes[] = {
+	ARRAY_SIZE(code_tab_102us),
+	ARRAY_SIZE(extcode_tab_us102),
+};
+
 struct nvec_keys {
 	struct input_dev *input;
 	struct notifier_block notifier;
@@ -59,8 +64,11 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 	if (event_type == NVEC_KB_EVT) {
 		int _size = (msg[0] & (3 << 5)) >> 5;
 
-/* power on/off button */
-		if (_size == NVEC_VAR_SIZE)
+		/*
+		 * NVEC_VAR_SIZE is the power on/off button; the fourth
+		 * encoding is reserved. Neither has a keycode table.
+		 */
+		if (_size >= ARRAY_SIZE(code_tabs))
 			return NOTIFY_STOP;
 
 		if (_size == NVEC_3BYTES)
@@ -69,6 +77,9 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 		code = msg[1] & 0x7f;
 		state = msg[1] & 0x80;
 
+		if (code >= code_tab_sizes[_size])
+			return NOTIFY_STOP;
+
 		if (code_tabs[_size][code] == KEY_CAPSLOCK && state)
 			nvec_kbd_toggle_led();
 
-- 
2.56.0

