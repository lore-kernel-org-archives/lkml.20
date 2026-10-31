Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431963;
	b=DbsemPbvjIVHXcd0E86n4IBu6QCdmVeK5hupKusVUwvppM6wXECC8vK0vMlTOBL7FhL4
	 xHgue5BVwEqng4hAcy+z7OWhEO83DOVX8KcBToIz5IS0nq8gq/mS5Oe41lhJLghYj6jkF
	 r9AgweUoyzsdwRfFuQ9yp/B8Yqzf7rCZwND52jTf97iRO4YEY2P6dnOT1MpFtwPAVeQ0F
	 4uZKdhwDO0nAyKGg8iN9K0FukmQz4L7VrVT7f3o8IVb1qjTpR9ENwVwPINHxlKfvVSJbW
	 Fa7VccOkg0E3ChLmdI2yYliUYiU6lktEEayCHnhbrudy1twYOH2qZeAzPPkBeYYAAqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M6Kw+2ZkPNmmmVtdjl+hjlT9G0MDLpS6DZPqvvJBmbk=;
	b=4DMUKulkMzCkzQ2u84eRHusqfqi5uLPObp9eO5dlw4wmNMgeLXFcVqRFQSaToXRbzYZW
	 qoqG9LP/KnQ7f5S6uyuLKZ0g+szx6eRJ+bPA8xzKophJl8MIII859DWGKUwUJ73jKJWOU
	 ySzgkV+dR/zYWjccmfK4E8iOelIRyEwDwQuWY16ckKxGVtESD22GuqkBsrLxOwZYQnafy
	 VRgWyOR0HgqZsCFq3wPHtwTrJ5URy7gh48sn33ybqyyapYeKIBnWTTorzZVaT5sVFYHWs
	 94uj0yY7+sOh+0oS+okD9JKSyfkQo6dnNXEpSqFrhuGK2wkegtN6F4R5gpy0uiPmBeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwyZXJZm;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D781606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D781606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwyZXJZm
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so617968a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793431962; x=1794036762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6Kw+2ZkPNmmmVtdjl+hjlT9G0MDLpS6DZPqvvJBmbk=;
        b=rwyZXJZmIKzk6f+J4wV1wvSZJN+xIl1EYMTKp7Za9DOH4LuoQYIJTb3Y1DQmFRWj5h
         hr84Ma2NqAMZm2fbN/7/4LfjCI6qVBUhts7EZb9EFCrdQnZ4gnE4lh7LcYqFl6NQrWkt
         wh9Bp1d4GQOnt+6oBGvQOxg+Mg9zedLpzbBRKqpFB7f3o+f4pZXX/uTpXqb/olOnXQTD
         W9oc6YMLWTrA0Ka2B9qZ8Nxc5T6kBKIjp+xD97CQKvOFroPY7dXyKHboTsxnHRNZ/Y6F
         iTRdJhag4Rzgoo4iNYznxvfpvckHfdllpOTL7b7X2RHJjnwjW2z9nP2/XOT9F5CffoQ4
         8ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431962; x=1794036762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6Kw+2ZkPNmmmVtdjl+hjlT9G0MDLpS6DZPqvvJBmbk=;
        b=eZ1CM7yBJMBDCp+PvaQqZfX+y+vay5kAfLJNOp0nCUu3nN7wyz3AqGxW43WRoh3zIT
         pZYNOdrtTqejRT6bG46SlK3gcASw5a6JkfrrnVY6kP5MavCA2HMBDoEVyuW2AQ3R2tST
         zbRuFBpySDKvE4jrL3oV0vZgFQu9gYNveAkJUybZ0UPnRcP1IBTsRuMMmglEnCBgZWuV
         ccWCprpOyCN1ubv7YZGt2h799zlyfroHjIrkhYaHmGHYtu4PYyF5z2rvZWGVnB8qCfid
         z1Y9wnGkZVqePqEVr2d5pcPYIoA0+rebCUJMqIEfG1buR0aUmSZkhhvBSkhh1ZKoKote
         PsYA==
X-Forwarded-Encrypted: i=1; AKwUvBwP2mNqFA5dhfLeF6DugZrXR19xnWE9oskJsz/VXm0P9hKYxGFSpXlAdsHLqa9UxNeup0nC3r1v7OhOWWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTrEA0BjGROzz3ZIlJKUm6Zs5t3xj2n5vgVS0Z2fka5VKqhFnI
	BAxVW1RUhgpieonwWTTC0j0A179vhpoEG9bxNDdcbzW22z5MrkZNBgps
X-Gm-Gg: AYBFou2Qt28laBv7NAIWOsG82HiUcRg8tlNtVptNEO4puVpXVqWROuspR7KvSPvg95B
	nqQ176D9elUs47k2LWYKDwbJq3ysT8+XAxhRix/6GZYlkxIzyyoQDjcMIKZE5DdeO2TAMczrCT3
	z67pFB9bCRc6s2tydMAatN1Ch9+ER0PDSNHMX1cqSU/TBm2D1u0745tnYCRljO8lIIXVBf8zwfj
	jE4/+vNkJMVzBhH5SWe1BgDDr+ie2E0i3WwEu6/abZ/yy9KKG3qpPsd8HC6jvnLDUYwSTt09XB9
	u+RcWDaoh/cz9+OZvpnFi1YtlVcs0G1y7gAZ/KYpX6klNbqm9sRpMZuj82wMu7JvH+gmLbDPx4S
	J52ndFar30ksmpIAp2/m10IOO3wsX9hGKLYYFEox+xH3AILFBAZMENuQs4Y3sdk0pe1kLj002FS
	p7LkMkeAulm9FbMgmZNUtfBL+JN8kh0Q3b76iUxlhLr24MhHxDlCzxJCSBfUZF2nDHLGbnMp2ry
	uV++2fgzOnBQKJ36AVdNAG05vaie6WDlMQrxuTEZfN6cVL/wAKKI/8F/ZT5/xnYmE+qU9EcvGIi
	wEJoyJLN5fj3fxrmPw5P63xVRYOi0o25vhFov1uEgEWciA==
X-Received: by 2002:a17:90b:4a4a:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3ae897d313cmr3466248a91.48.1793431961896;
        Sat, 31 Oct 2026 00:32:41 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae841dd1b9sm6691486a91.0.2026.10.31.00.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:32:41 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 2/3] Bluetooth: hci_core: Hold the request lock for the power-on update
Date: Sat, 31 Oct 2026 15:32:23 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com>
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

When the controller is already up in the HCI_AUTO_OFF window, for
example after set_public_address() or set_external_config() queued
hdev->power_on, hci_power_on() runs hci_powered_update_sync() directly.
The update registers the SMP channels and sends HCI commands through
__hci_cmd_sync() and its variants, which require hdev->req_lock. Commit
cf75ad8b41d2 ("Bluetooth: hci_sync: Convert MGMT_SET_POWERED") dropped
the request lock that this path held around the update.

hdev->power_on runs on hdev->req_workqueue, which orders it with the
other request works, but not with request lock users in process context
such as the HCIDEVRESET ioctl or an rfkill block. Such a user can close
the controller after the HCI_UP test or while the update runs, and the
update then registers the SMP channels again after hci_dev_close_sync()
unregistered them:

  hdev->power_on                  HCIDEVRESET ioctl
  test HCI_UP
  clear HCI_AUTO_OFF
                                  hci_req_sync_lock()
                                  hci_dev_close_sync()
                                    smp_unregister()
  hci_powered_update_sync()
    smp_register()
    send HCI commands

Take the request lock again before testing that the controller is up,
as hci_power_on_sync() runs the same update with the lock held when
management powers on the controller through the cmd_sync queue.

Fixes: cf75ad8b41d2 ("Bluetooth: hci_sync: Convert MGMT_SET_POWERED")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Assisted-by: LLM

 net/bluetooth/hci_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 2a29cfdee9728..55bad385e78c4 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1006,14 +1006,17 @@ static void hci_power_on(struct work_struct *work)
 
 	BT_DBG("%s", hdev->name);
 
+	hci_req_sync_lock(hdev);
 	if (test_bit(HCI_UP, &hdev->flags) &&
 	    hci_dev_test_flag(hdev, HCI_MGMT) &&
 	    hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF)) {
 		cancel_delayed_work(&hdev->power_off);
 		err = hci_powered_update_sync(hdev);
+		hci_req_sync_unlock(hdev);
 		mgmt_power_on(hdev, err);
 		return;
 	}
+	hci_req_sync_unlock(hdev);
 
 	err = hci_dev_do_open(hdev);
 	if (err < 0) {
