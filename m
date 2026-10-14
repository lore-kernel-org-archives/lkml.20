Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8074CE662
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017718; cv=none; b=fZqRFsIXszwxtaemER9ouGxH2uS+dX9+9liX9I8DiQIUmo0A9mqeYNioGo981si258HZ+UnxYOM1YP1yvQce5s5+AdhxCtQY2QbbmRtFkal/5P9V3bYjTzKzsiaCtFskVx6DtoH1wfyeB86J517Mi9FOjkmvivMJ5NeWdpM5pbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017718; c=relaxed/simple;
	bh=ki2ArKXM+5oyaB/oO6XYXhgQRk+2JAxST2ZQm4gkydQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ArWVsZQbaP0+OXWvRJ7SLWZaf0MhFxnsIUyzD5dJwTGktoH51ziL7k7SLyhrl/LFbRO9sUjhFPj0hC7GXaw2DMt1K9z7otIcefGfPT97GFDFNupjJ/bVOuT2HS2qGsy+NEs0aSHEx5IMSC7bzrJdNRhWnxlXoChPac8ftikQRN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=simpleble.org; spf=pass smtp.mailfrom=californiaopensource.com; dkim=pass (2048-bit key) header.d=simpleble.org header.i=@simpleble.org header.b=pbnhsuPS; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simpleble.org header.i=@simpleble.org header.b="pbnhsuPS"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so2487503eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1792017714; x=1792622514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UycZ1PF4EQx1eN6YOc20RflCJPkeKntRi3SIYHfDNwg=;
        b=pbnhsuPSVQzp3AGRFix5cW1N40kcPrTUMRX0gvrNDj4RnQJv5ndlzREogmOQapOkck
         /jGCfD5AIawC3bH68c9LnOJ03u096KrH/tQldhVXhbHNU1RM0dRMwvIlJZ93LfFbuaF5
         OnTO7F/MdOHxqDBP4QsZewcebKkuN4sieJgAlAkKKnFdwvQ+knnYQJKPnyiNhOvP0s0h
         Ar3ap7xkK21QAg5NNWfEg+1ypjNfwD0idXtEPiePGBfGSpU7wQ7qPr+CtF7xwG9k3tOJ
         xBAvecEpObFhw0QfSqAaCTA8jZZE3YcLswfD2p24AJyfrOADKLekU5VgrPirb8UirIqL
         h/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017714; x=1792622514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UycZ1PF4EQx1eN6YOc20RflCJPkeKntRi3SIYHfDNwg=;
        b=fL9DZ6O4ldnrHo/B2m2rf5rmj+r/SMgELSupPt57xYNziS4xXLFvy+bc/1ICpfJ/Gv
         7fI2wDoaZ+UU2TZnm2ruGhsOvVeln2WP/7PqCuW3VCxtmFNCT+kcI7r3oFYCH9el86Nv
         JjQg3MKh0qMqA2puryLGqYL8jwjwc2o3wYncbISrED3B3tK13eIL3KQ2/DADonbmbqzj
         ZFS9WpzmnxBW5WdUy8pKx8IeiNUMUHLXGPBJXS1smtia+3EWi6U119c8c4bqOr+1QKj1
         T76/BtlDOd0RcG1xsY90S7xD5Nbs4xaF7LG768LvUF2lnJAvpXYodnZB8evFReWj6Dhx
         hirw==
X-Forwarded-Encrypted: i=1; AKwUvBxa7ug8vDgQpu8UnQ6QjqQn5JG6JteLwvJVzLVU5n/pdw4TqT2sMo9pQYECg85gtUBq9Ttz12APBwFRpaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjsVtJOIZRAh2sqx8ZnWPJJTXSTjQVrihRVeynm4ksEKTdskf4
	gB3/lpBSeZbj7kqiEoRg1gR24WcCxKOnkzSJZXPr6JWmuOJIyfAqEYYqHsAwOCVN3g7duvmbJea
	dpdO0IFw=
X-Gm-Gg: AYBFou2TlKPiwlFLLVLVQkeAfbXQQrAwjaQzwo/cQN7LFtHxdh68bmkSu8vDzxn1A5S
	zXHjT4344KYByE7vnRDUUYoX23EAf44yaWkkLRnuia/zzGnLlYRKRtEXciymT66OJX8d9S6IyVU
	mHElFzrh91DNesZuTRltIe3f6zX0HMFeWMPTQsA56DWlmABC3k43FaVMCKvRa8k+V6JwSa/C9/L
	GtqBEkG4Dh0aCRWHi3jGuL+NAXFlfIcaG5DNDUS+osT8p5uUg3SpcHseG6toKk6btTI/v+qsGyk
	i2X8yWIWkdlFgQ0bTIh4LNqjLb/FhsHCq9DxzisOKUusr1h/IgktrdWds6DaTjTrEglqCblPk3Q
	w5i1ZHgf8JF2Zd+SBvqCaOLNplgS+kgDhAJVXRB8WyprkJpou3G8jjTx9ZfNSiu02Sm/KKJb1/R
	q48OZIaXG+RlcEhq/LI7pQOy+auGYBDHopC324sVGnt2I2IDjYw8aA7RZOXmZYAnY2M3YFoPmlu
	3Y/hZdBE6mJ5Njy/2BbBn8bl+0puF65IjcboXsV/Ov8zT9wHw7VWuUDbMYLuLjBtP1HgAT9eRrZ
	Z7SNcJ772b7+wqKfqSmQI6Pi//bgOfQthexKC/YO
X-Received: by 2002:a05:7300:229a:b0:359:2f0b:bee3 with SMTP id 5a478bee46e88-3592f0bbfb3mr17164410eec.32.1792017713551;
        Wed, 14 Oct 2026 15:41:53 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca329d9sm60022688eec.5.2026.10.14.15.41.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 15:41:53 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH] Bluetooth: hci_event: Clear explicit connect state on LE connection
Date: Wed, 14 Oct 2026 15:41:45 -0700
Message-ID: <20261014224145.10801-1-kevin@simpleble.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 6cd29ec6ae5e ("Bluetooth: hci_sync: Wait for proper events
when connecting LE"), create_le_conn_complete() only runs once the LE
Connection Complete event has been handled, and le_conn_complete_evt()
has already removed the connection parameters from pend_le_conns by
then. hci_connect_le_scan_cleanup() looks the parameters up in
pend_le_conns, so after a successful connection it no longer clears
explicit_connect, nor deletes the parameters that were only created for
the explicit connect.

The parameters of every device connected through an explicit connect,
such as an L2CAP or ATT connect or MGMT Pair Device, are thus left with
explicit_connect set. MGMT Remove Device for all devices then keeps
them as HCI_AUTO_CONN_EXPLICIT instead of freeing them, and if the
device was set to auto-connect and is disconnected, they also stay on
pend_le_conns: the kernel keeps scanning for the device and connects to
it as soon as it advertises, although no one asked for it any more.

Do the cleanup in le_conn_complete_evt() instead, where the explicit
connect request is fulfilled: clear explicit_connect, delete the
parameters if they only existed for it, and put report parameters back
on pend_le_reports. Auto-connect parameters are added back to
pend_le_conns on disconnection, as before.

Fixes: 6cd29ec6ae5e ("Bluetooth: hci_sync: Wait for proper events when connecting LE")
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kevin Dewald <kevin@simpleble.org>
---
Reproduced in test-functional on bluetooth-next: after connecting with
Bearer.LE1.Connect and disconnecting, the debugfs device_list of the
central still has the peer with auto_connect 5 (HCI_AUTO_CONN_EXPLICIT),
also after MGMT Remove Device for all devices. With this patch, the
explicit parameters are gone once connected, and only disabled
parameters remain.

This also fixes a test-functional failure seen in CI: when
test_bass_past_transport_acquire runs right before test_bearer_le_connect
on the same hosts, the peer survives the Remove Device of the next
bluetoothd, and the kernel connects to it as soon as the next test
advertises at the same address. test_bearer_le_connect fails 5 out of 5
times in that order without this patch, and passes 5 out of 5 times with
it. The kernel testers and the rest of test-functional pass with it.

A tester case for the device_list check can be sent as well if wanted.

 net/bluetooth/hci_event.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 1f80f2cf6b..dede0b686c 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -6041,6 +6041,28 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 			hci_conn_put(params->conn);
 			params->conn = NULL;
 		}
+
+		/* An explicit connect request is complete once connected, so
+		 * clean it up here: hci_connect_le_scan_cleanup() no longer
+		 * finds the params since they have just been removed from
+		 * pend_le_conns.
+		 */
+		if (params->explicit_connect) {
+			params->explicit_connect = false;
+
+			switch (params->auto_connect) {
+			case HCI_AUTO_CONN_EXPLICIT:
+				hci_conn_params_del(hdev, &conn->dst,
+						    conn->dst_type);
+				break;
+			case HCI_AUTO_CONN_REPORT:
+				hci_pend_le_list_add(params,
+						     &hdev->pend_le_reports);
+				break;
+			default:
+				break;
+			}
+		}
 	}
 
 	/* If we are central and have subrate parameters stored, queue a

base-commit: 397464709a204da9b8dc3b01d6ea42539d951cd2
-- 
2.53.0

