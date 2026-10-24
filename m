Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802827;
	b=HE3NfWERtrNdwjsoYiTKMqvMwJIuueyfcJ6B6yrWcwxgnVTwdwdLnpUyP/bgAsm3WWDb
	 4NutfV4UKdQMaY3NjsEWPNmpfXmnmtuI9afQNj6kqYOp1nsq6zxHyBCpq71It1ePyY8g9
	 svqHfJghpDWt526iMfpS998nQOQICh3DHLIf6lK1W4l+w6jhOWpJLrehqYqDKpbvp469P
	 gycqunkGziLB6/Jj0EkB8fd7G52W4Rtt5iD2g5Vnz1DAOFyN8JJ0fS4SDlH77ahsENitR
	 9oTL4EaP/Qn8G6YMP8vD74SpGjT7Yc44GVxl1P4Eh0lWlJsfgWMGXMmkM8w+2yFZ18w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lIlggBRSukW3Eourub+df0H4h3HbI9eon2VHccaEj1U=;
	b=VK+mXl6IHzQCYfRyIZMgXM/64nyaylaJvoPBtmb4e5uS3pd8g6OEYuB5/BI3c9l5FJ3y
	 CCST9nQgmG277aYFMSIPNAdwydHFV7mudpMVH4TGzqYRauLE5AwPpR+8JLg1b+rqvui+H
	 Xm/NTvmbEOVYrzEsTCGIgdjiCVECLE1Eqrw3Hp32AU0GURtugGrVd2cS5QJK9w2pTd56l
	 bW+MJSQpzSshmSDStiLDbs+0Bu7w65QkNZZ66tUKieF/Ygzm2LBwZPof88+D4YRzjFi4C
	 8NOuE3aeOdmY2ratyJzTAW9UstR9ma7mRI8wOO8T9h/LQ7m9RzgfClQANxp7Lhfxzxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jj1StOy7;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8941606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8941606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jj1StOy7
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab395abf79so13651217b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792802826; x=1793407626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lIlggBRSukW3Eourub+df0H4h3HbI9eon2VHccaEj1U=;
        b=jj1StOy7FQ4u9BEF3SnWHw4dHH51SZB36ZdDNqdiY8kXsuBT8yZju44vUgJvOkCYeN
         UOipoz+3/DTQhJ8/ZfRpXPQQi7RbsVV0ZTENWJBCW2HAr49HO/6N+Rn/83Zxx7RWpALv
         T054fQuQ1NSjCIvQtx5AZMWXxVVbHUcwpm+MdlrUwocFF4jsqz0RUlBTlw/VcKrFM8Rx
         AUU14id+OQc60J0bnIYyPCzpwJiv/u2BZd+IhupH89/kFmwmm68zElEUJdbLYcPnSvYK
         sUa9Q5cdHxgHtAQ2QHSXUyCIM+yoD4Qe0C3oIh1twRjtstE/o+fTUB5EAhbG0BTRgYp4
         v2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802826; x=1793407626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIlggBRSukW3Eourub+df0H4h3HbI9eon2VHccaEj1U=;
        b=FUzokolKMdsaM6Y9ANUIXi8aD6yieIgh940nJ8VJR94+Ah1MBHm91CF/h0XB6i81ED
         u6OJ4szlxvIQY0XnbUK96PolPVY+dhv/h+B/UUWr/Rmhusdemtmml+UeZFFQiTsBi3kt
         ADArfmm2TbSJF6JBuBuEWuMy20DhAiqZqDMuJLa9TR8FaaKahTCqQyLxjoYwlpXvVfye
         TkjTUR29g0J4jBtOcTInRMnHrrlJptbl593pFTJ3IJmkVeGgig6CqptXrctpXclLLdBI
         Zgp5mMF5qfuE2rGTqw20PsI1ylvDiYyswdYIOFLOWRvN9srNHuIQsIz0Yl3VL6fTQmUD
         9/Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzoBhrh5zGWSLpQQNzut4O+CijIrVIotgL8Am6t/cWSySn7XFqPF/6Xu4s9qUv+qj766EC3r+8qRorqXog=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtH9+V+44st5VXE6tLQIQwqsiH6JDgCxAUb1waWvtijtV3YZkB
	bDxoFQWYyZQ6vZf2ZENtlqKoeDgf5a41mZA8e48Odogof3ZtjoP58DBcMapKF+3cwok=
X-Gm-Gg: AYBFou0hk52AvIQUxmoxSVdN5qEwddHd9QF6KftNo01WKAKUupDMnyAaihf29NqPUQZ
	oJTQO2LhlwXmzg8+g4ltNTwUxRLyZQmycLWRMoKL/K3m70+OatHowsFsfPAx6X2iWsuRiGRUAJL
	seISU80jir39LDTEOC1cgmfpX6Occ7vgCFbvnVKueUrtXM+xNrHF9AFjAY8d45UCy2Ycmv1BbtK
	64rmlgK8glS7nRJckJkcm44Wkp1JNpcLifVdypUeuwNXQ8RsEpCsHFv7Yv5PRV4+4F2TvSpBpOb
	wiCBgAU9x/GQe09uLn3iepuT1mGau/BaEc9A0zg51hsmAP0247fKGoCvwVBFb6RXdiXRYVhGX2X
	zpboV9I08ohokoyKiPyrAfnBLNJNg5Q4Oe2alhF09BE3hZAir543Ax7w3OtMquBAPmoZBTLSOyM
	uPonkFpcxHRGglIzoKW0XkDjR9CIWL5yW0+S4XT9f7Brgy7MaG3HoBv65BzDHwMmm6vivD208FK
	0a0I5c5AnhgJ480wxa0fOszmshJ6W+6wlq5Vc3cHi9iTFc=
X-Received: by 2002:a05:690e:4390:b0:677:c605:b736 with SMTP id 956f58d0204a3-67a453d1aefmr496932d50.43.1792802824783;
        Fri, 23 Oct 2026 17:47:04 -0700 (PDT)
Received: from WillzDenali.lan ([2600:1702:7a80:3c5e::dff])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a461a715bsm349627d50.6.2026.10.23.17.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:47:04 -0700 (PDT)
From: Brandon Williams <turbine.bmw@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Brandon Williams <turbine.bmw@gmail.com>
Subject: [PATCH] Bluetooth: hci_sync: Reprogram the resolving list when a peer's IRK changes
Date: Fri, 23 Oct 2026 20:46:49 -0400
Message-ID: <20261024004649.56724-1-turbine.bmw@gmail.com>
X-Mailer: git-send-email 2.56.0
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

hci_le_add_resolve_list_sync() skips a device whose identity address is
already in the controller's resolving list without comparing the IRK.
The programmed IRK can be stale: hci_add_irk() updates a known device's
IRK in place, and an unpaired device can stay programmed, since
hci_update_passive_scan_sync() only disables scanning when no device
needs it, so hci_update_accept_list_sync() does not run to remove it.

When a bonded device pairs again under the same identity address with a
new IRK, for example because it generates a new IRK for each bond, or
with none, the stale entry stays. The controller then cannot resolve the
device's new RPAs, or keeps expecting RPAs from it, so with the accept
list filter policy its advertisements are dropped and background
reconnection fails until the adapter is powered off and on, which clears
the resolving list.

Remove the entry when the IRK differs or is gone, ignoring errors as
hci_le_del_accept_list_sync() does, and program the new IRK if there is
one. Copy the IRK and compare it with the entry under hdev->lock first,
as either can be replaced or freed while the removal waits for the
controller.

Fixes: 0eee35bdfa3b ("Bluetooth: Update resolving list when updating whitelist")
Assisted-by: LLM sparse
Signed-off-by: Brandon Williams <turbine.bmw@gmail.com>
---

Notes:
    Found on a Surface Pro 11 (X1E80100, WCN7850) with a Surface Slim Pen 2,
    which distributes a new IRK each time it is paired. After the pen was
    paired again, the HCI trace showed no LE Add Device To Resolving List
    (LE Set Privacy Mode for its address still succeeded), and its
    advertisements were not reported until the adapter was powered off and
    on.
    
    This applies on top of 2a464ab1c5ac ("Bluetooth: hci_sync: Protect
    resolving-list lookups"): the lookup stays under hdev->lock and the
    comparison is done there too. The IRK is copied under rcu_read_lock(),
    as 4b76fa362110 does in hci_le_set_privacy_mode_sync(); before this
    patch irk->val was read after the RCU read section had ended.
    
    Choices a reviewer may ask about:
    - The entry is removed only when the IRK differs, not on every call:
      this runs for each device in the accept list on every passive scan
      update, so removing and adding it unconditionally would cost two
      more commands per device each time.
    - Errors from the Remove are ignored: hci_cc_le_del_from_resolv_list()
      only drops the entry from hdev->le_resolv_list on success, so after a
      failure the old entry is still listed and the next update tries
      again.
    - Fixes names 0eee35bdfa3b, which started adding devices to the
      resolving list along with the accept list and skipped one that was
      already listed. That code moved to hci_sync.c in e8907f76544f
      ("Bluetooth: hci_sync: Make use of hci_cmd_sync_queue set 3"), so
      this patch applies from there on.
    
    Testing:
    - Two new mgmt-tester tests, sent to this list as "[PATCH BlueZ]
      mgmt-tester: Add LL Privacy tests for a device's changed IRK", where
      the device gets a new IRK or loses its IRK while in the resolving
      list. On bluetooth-next 47d4d9f67e92 under QEMU (arm64, TCG) with
      KASAN, PROVE_LOCKING, PROVE_RCU and DEBUG_ATOMIC_SLEEP: without this
      patch both time out (10/10 runs); with it the LL Privacy tests pass
      290/290 over 10 runs, the full mgmt-tester run passes 516 of 517
      ("Set powered on - Blocked by rfkill" skips itself, as the test kernel
      has no /dev/rfkill), and there are no KASAN, lockdep or RCU reports.
    - Hardware, backported to 7.3 (WCN7850), replayed over the management
      socket with bluetoothd stopped: Load IRKs with a made-up IRK, Add
      Device and Set Device Flags; then the real IRK, no IRK, and the real
      IRK again, each followed by Set Device Flags. The controller got Add
      (made-up IRK); Remove, Add (real IRK) and Set Privacy Mode; Remove
      only; Add (real IRK) and Set Privacy Mode. The pen then reconnected
      with its advertisement reported as Resolved Random.
    - sparse and W=1 are clean for hci_sync.o; checkpatch --strict is clean.
    
    This is not a security issue: the effect is that a re-paired device
    cannot reconnect in the background.
    
    Tool use: the patch, its changelog and the BlueZ tests were written
    with an AI coding assistant (Claude Code, Claude Opus 5.5) in a longer
    session that I directed: working out from btmon traces why the pen did
    not reconnect after pairing again, writing the fix and the tests, and
    running the emulator and hardware tests above. A separate AI review of
    the patch found the IRK lifetime across the blocking command, the
    no-IRK case and the error handling, which are fixed here.
    I ran into this issue with my own hardware and ran the hardware test
    above myself. I have read the patch and the tests, and I understand why
    the IRK is compared under hdev->lock and why the stale entry is removed
    before the new one is added.

 net/bluetooth/hci_sync.c | 41 ++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 9d71ce96bd8e..44d992956c8c 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -2514,8 +2514,9 @@ static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
 {
 	struct hci_cp_le_add_to_resolv_list cp;
 	struct smp_irk *irk;
+	struct bdaddr_list_with_irk *entry;
 	struct hci_conn_params *p;
-	bool exists;
+	bool has_irk, programmed, stale;
 
 	if (!ll_privacy_capable(hdev))
 		return 0;
@@ -2533,21 +2534,45 @@ static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
 	} else if (!(params->flags & HCI_CONN_FLAG_ADDRESS_RESOLUTION))
 		return 0;
 
+	/* Copy the IRK and compare it with the programmed one now, as both
+	 * can be replaced or freed while waiting for the controller below.
+	 */
+	hci_dev_lock(hdev);
+
+	rcu_read_lock();
 	irk = hci_find_irk_by_addr(hdev, &params->addr, params->addr_type);
-	if (!irk)
-		return 0;
+	has_irk = irk;
+	if (has_irk)
+		memcpy(cp.peer_irk, irk->val, sizeof(cp.peer_irk));
+	rcu_read_unlock();
 
 	/* Check if the IK has _not_ been programmed yet. */
-	hci_dev_lock(hdev);
-	exists = hci_bdaddr_list_lookup_with_irk(
-		&hdev->le_resolv_list, &params->addr, params->addr_type);
+	entry = hci_bdaddr_list_lookup_with_irk(&hdev->le_resolv_list,
+						&params->addr,
+						params->addr_type);
+	programmed = entry;
+	stale = entry && (!has_irk || memcmp(entry->peer_irk, cp.peer_irk,
+					     sizeof(cp.peer_irk)));
+
 	hci_dev_unlock(hdev);
-	if (exists)
+
+	if (programmed && !stale)
+		return 0;
+
+	/* The device paired again with a new IRK, or without one, under the
+	 * same identity address. Remove the entry, or the controller keeps
+	 * resolving with the old IRK and the device cannot reconnect. Ignore
+	 * errors as hci_le_del_accept_list_sync() does.
+	 */
+	if (stale)
+		hci_le_del_resolve_list_sync(hdev, &params->addr,
+					     params->addr_type);
+
+	if (!has_irk)
 		return 0;
 
 	cp.bdaddr_type = params->addr_type;
 	bacpy(&cp.bdaddr, &params->addr);
-	memcpy(cp.peer_irk, irk->val, 16);
 
 	/* Default privacy mode is always Network */
 	params->privacy_mode = HCI_NETWORK_PRIVACY;

base-commit: 47d4d9f67e92d56ef3965f2727f9c98a5a611368
-- 
2.56.0

