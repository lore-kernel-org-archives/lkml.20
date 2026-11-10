Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333246;
	b=u7KlV87YtsVJNThGv/t081m4/GpbBP94lVE0HUwsM2XN5kMVcXlq/04rgDQfDvR/RbVv
	 tolZ/iNX/ELIZyi/I6SeOo29iQPLDXQhFqLyOq9FGPp1/4ab78fCyD5v9N3fLuIMdsfIl
	 QExhlaFB8BgWDKlhtwS/oAFxkykkF43BVvhr6Ng6Ip4Srzs8+Mx7MhF4KZMns2hUDpupT
	 F+Ut1IXsMxwZTXI1aolLY0H4uuMPUi0pwbFnJmJuhQhSbeb2ne8q9WePTOwDfb1/nBdG+
	 VUPzkriFoGQtR53dCTCYWTagmQVcZ8CLb3sCFpcrXzUj8wc4+sHbgQSHIkLCfqTSeEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EWyUegrb38WBeDiaL/HzG3HTGpRVVOl2V2uFzvvGvWE=;
	b=J0VpnCKND29s2F7PJP1NH4hzwn+reVAv3dwLFHQ8BBKz92dbANbXtWETLH8M1S7F+uJt
	 p6Lmzg4QWy9jLPUngc5PS5HJ34LLuH12RxadJV2wu3a1yVuaAJP5T8rvzBHEkGRwHedpb
	 hI55LNaAox4hgn8hDrivB1iVpvehs71g2+kVmiryixLwO5iTQ+xDMTfEVBTFzqG6TFaY5
	 k0WT2Yyc75GXf+URXbpW3kvbtmIfvZ0KP0mLB4WnOBDb3ztVWm2s1bVkAnuwl8U43lO69
	 RurOWSiwxn/2WCo3DJaIH79AcVP0iVrFsz7Fc7W04I+4KKzyOS8/UBJ0Ua9S5H+ADgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=MMzEiEXv;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D78606A222
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D78606A222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=MMzEiEXv
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37000e7234bso4260078eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794333242; x=1794938042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWyUegrb38WBeDiaL/HzG3HTGpRVVOl2V2uFzvvGvWE=;
        b=MMzEiEXvFOif7JcyED/VTrHGWAmrz9sVbe2WvjhdzoUO06U9CnL9Z4HXaF94yk4AFO
         EkVh+Qo3VL9XZrinppLR8Q6yIMdYa8PmKRg7Emkkpbh1d0Z/JoR5rNW9hUTMtOzza8tr
         zP7lfFDfShQl8QLZMfsrjAbiXcbj12PVGdaGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333242; x=1794938042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWyUegrb38WBeDiaL/HzG3HTGpRVVOl2V2uFzvvGvWE=;
        b=Wrq6hyltIggZtnE9DYVNf490JJ5NwjZJmgtFaYkfkg94oO/JtqmhV7wPZyYeckE0jG
         mfuBxpmDUJT/JYxgofoy2LxxhN6ezrrSWKcYLqYHQpgXTWcdCYw2ls3sjnt24rv8sVDp
         mpvB27mwU1M7EaBMU1WWl7itO9tyROe/LYVWw5zauJQVVFUnm5rsT0iG22TrQSyseapT
         muhmkB501TYlEVUZThr5e0VZowC1feMtZj45oxVZGXHuYtO/97lCCKH4Gv9V6ACIC8Vf
         86T5PwZ/r2bcvE0uzxu6+VbauvGzp01VcZkhRU9w6XtTUR4GKkUd3akLj2drHFrZ0Nwx
         dw5Q==
X-Forwarded-Encrypted: i=1; AL+hErGQSP9lxwKcvD0qPhMozzL6ezak7CN4RbICGxhh/4svCGLCQ1cCNTZEVlaDQrMf6SIlvZVULb6GfP4Hv5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tHfriZk+fbNcYpbICruXcsfbMVOxbXSCNYzqFztZIutv1O2gr
	rm4K2MGuTXtiF3UebPdqzZJLJ/K0qV0Ci3qaB7vblh5DOlIhdNc57jwABZYO/4vPDTo=
X-Gm-Gg: AYBFou0iv6dbiT2h0PnkZR+nZMo3fnlAdiGKAYHNUnFkcM6dFXlML6ZMArL/9kPikuX
	+ohV1FPSdr73YzqP9/UwvTdYif654X2B92nzTGZOHP8Re85fBx5Lpma5TzqVYJCTUqFuto0Kxtp
	7BhL1zxEaYn4SXUkEy9SdmqTS+5EyEX9JNibYSC1NMP4+F662pCAxmkvytP2IsRviNrAnUWxwft
	kBEBfHV/q3nWVFbc4cEM5nuOyNXLgEPwHBVQDSPpUhtks9Oe9jEb3s/j5l4lQMPgf0PqmCRLTPm
	q2OLH5Wy72WoQQxmXx5R3QVLA78lmygACCR8IObb6yo8qMl27Im8JwXZPEk1OczLvxQ0GXtfUx0
	ybcInchIuDAVxVxqMAg9tnSiloScrQoftQEp0TFrsw+0I+9luAnvyN0uhva3mdaRd83f4NMflEk
	UMQsk3m/QgLoYWmOKwG5XDQhiNDvnWPq1LiM6imSjtm3BETlyKxUHxamfejd7Fhlo/rRs15m8i7
	m2wOForTP+e/urp4k2agd/JTnudCfLtI2amQtUr/k+2xlHc7V0cmWgHv3qPvAnwv32E6XMScsCa
	T5NGmvg1QiRBeEPhg+c5cvJw5rEr17WdifyA/lk+zqlGsn/N0wd8dPwjKHRKZoHM7fPjybFFR9t
	1cilkdUDr/bqgQWCsIhALYlLNA6VhRypKj7ne98eWuAfE5oR9QVVdT4067RvhIKmv
X-Received: by 2002:a05:7022:e1c:b0:150:c9c5:1ca1 with SMTP id a92af1059eb24-1b3b5fe3b41mr6356459c88.18.1794333241526;
        Tue, 10 Nov 2026 09:54:01 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm11875452c88.5.2026.11.10.09.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:01 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/1] Bluetooth: hci_sync: drop adv instances the controller cannot carry
Date: Tue, 10 Nov 2026 23:23:34 +0530
Message-Id: <20261110175334.676816-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110175334.676816-1-piyus@iiitd.ac.in>
References: <20261110175334.676816-1-piyus@iiitd.ac.in>
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

An advertising instance stores up to HCI_MAX_EXT_AD_LENGTH (251) bytes
in adv_info. How much of that is accepted when the instance is added is
decided by max_adv_len(), which depends on a feature bit in the
controller's LE Extended Advertising support:

  ext_adv_capable(dev) ? HCI_MAX_EXT_AD_LENGTH : HCI_MAX_AD_LENGTH

ext_adv_capable() reads hdev->le_features[1], which is re-read from the
controller on every bring-up, while the instance list is only freed in
hci_release_dev(). Instances therefore outlive a power cycle, and an
instance added while the controller reported LE Extended Advertising
can be far larger than the capability now allows.

hci_update_adv_data_sync() picks the writing path by that same bit.
Without it the legacy path runs, and hci_set_adv_data_sync() writes
into struct hci_cp_le_set_adv_data, whose data[] is HCI_MAX_AD_LENGTH
(31) bytes on the stack, while eir_create_adv_data() copies
adv->adv_data_len bytes into it. A controller that reports the feature
on one bring-up and not on the next overflows that buffer. This can
happen when, for example, a USB dongle answers LE Read Local Features
differently after a reset. scan_rsp_len has the same problem against
hci_cp_le_set_scan_rsp_data.

  BUG: KASAN: stack-out-of-bounds in eir_create_adv_data+0x2ab/0x440
  Write of size 220 at addr ffffc90006b679c1 by task syz-executor

  BUG: KASAN: stack-out-of-bounds in eir_create_scan_rsp+0x119/0x1a0
  Write of size 220 at addr ffffc90006ca79c1 by task syz-executor

Both are reached from HCIDEVUP by way of hci_powered_update_adv_sync()
re-arming a stored instance.

Bounding the copy in eir.c would leave the instance registered and
unusable, to be retried on every bring-up. Unregister it instead, once
the features have been re-read and before anything is scheduled, and
report it with MGMT_EV_ADVERTISING_REMOVED. Userspace can add the
instance again at a size this controller will accept. Dropping the
instances before the list_empty() test below also lets the default
instance be set up.

The removal is under hci_dev_lock() because
hci_schedule_adv_instance_sync() sends commands, which cannot be done
with the lock held.

Fixes: 112b5090c219 ("Bluetooth: MGMT: Fix always using HCI_MAX_AD_LENGTH")
Cc: stable@vger.kernel.org
Co-developed-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/bluetooth/hci_sync.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 9213e3ef9f26..ee8b1cd9dee5 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3608,6 +3608,34 @@ static int hci_powered_update_adv_sync(struct hci_dev *hdev)
 	if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED))
 		return 0;
 
+	/* An instance's data was accepted against max_adv_len() as it was
+	 * when the instance was added, and that is a branch on a controller
+	 * feature which has just been re-read. Anything too large for the
+	 * current capability can no longer be rendered: drop it and tell
+	 * userspace, so it can add the instance again at a size this
+	 * controller will take.
+	 *
+	 * This is safe as long as there is no command send while the lock is
+	 * held.
+	 */
+	hci_dev_lock(hdev);
+
+	list_for_each_entry_safe(adv, tmp, &hdev->adv_instances, list) {
+		u8 instance = adv->instance;
+
+		if (adv->adv_data_len <= max_adv_len(hdev) &&
+		    adv->scan_rsp_len <= max_adv_len(hdev))
+			continue;
+
+		bt_dev_warn(hdev, "instance %u too large for this controller",
+			    instance);
+
+		if (!hci_remove_adv_instance(hdev, instance))
+			mgmt_advertising_removed(NULL, hdev, instance);
+	}
+
+	hci_dev_unlock(hdev);
+
 	/* If RPA Resolution has not been enable yet it means the
 	 * resolving list is empty and we should attempt to program the
 	 * local IRK in order to support using own_addr_type
-- 
2.34.1

