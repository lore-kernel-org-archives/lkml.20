Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A148592A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818882; cv=none; b=um4Y1l2en8mrhXnO3lgt2uJRZHxge2mSoJ3gNRoJZYPsTE35+6P3BgEQT44ZEcgxXgWvsCeGr0dIVbJBvlShaEO9+zm7+0eJ8gWr+kIqQjxIBtFxT8LmmcUAuI9iHYrfEtx38k2k3AY0J/DyYcgi2vIsq4VSOQgXtJkQiJOQfTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818882; c=relaxed/simple;
	bh=PcK8N3BxOxk67bO+mZZK3Y+/zdG2dUvb7AKovVOVUy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKDF8fQ58QktJECvj+dhfmQFQ7YDAyoCSZRz1z2PYbFs9pIu1i4m289zrcdUsbDM68l1L3tZe8prBvqLxTxNZuGQ5/UpxezIHsdIfTt59hwyJNojZ4IFqHCab0KumTasUzekMEpNFt31ENfG2wHW9Mqt6Ogpm8xSGsbSkOsXK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsORNgXx; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsORNgXx"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so123430a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789818878; x=1790423678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=akwQw+wJq7zH43Cu7tG4CkD0sq1rzb82/u77w44ntGo=;
        b=CsORNgXxC+pUdH23lE0Cq11Pf9123avrQL+GJq8qA4NnHYLkTM6BOQAW0PogELwK65
         Wlk8F794kQcpRcER5G9v26Q3qVciTWvi9RsFrNIU3Bw1QnyMWgx4fWEcQRzAxesNSkTg
         KrhSFRZKgWL2ffGpxREbkr9Rd8ssUJNLembglW5r742W9RKuj9fTm+kLFdDfklwEsIBv
         u0yLn2PDyBf7MMpHtil0/ioL1jRMgqdBB1dHWO70zbPkoddnvUu3Z/hF7GlYuHjwfcBd
         eDBFe+t2NY1UrOrhMCc+BXd/dGy8TlBDQYV/iGeHLEbmEz0IwJZtABjVinHIjZfvxYtG
         QiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789818878; x=1790423678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akwQw+wJq7zH43Cu7tG4CkD0sq1rzb82/u77w44ntGo=;
        b=mwE0tabBkuXgFoWqfO+hseXkrvQCv3vDTM+RmwvmCf7zeNjbHQuq6KXNqzOEjJVwzB
         qQkb9GqczRaf5MUHoPcAUPNAunqxBSyfbZenPFkE3rAc+uXobj65dPR5sT6+dE59OTFu
         jKEFIZKyhfW3ny1Wxsu9X4Jvyr9Ysddo+JbgU5E8a4ezOlMJ1kEWv5IfQB4nd9BYn8XZ
         2gToTS0CBZfOfmcWlyMHqxoS7QToi93vQiWoe4UaxSxJFlfRW7JPXBCZCqDFog7IeUqt
         AmqME9QiLkV5lMphYgb04rL9ZObUpayyN0ZIadPlQ11nMpfmxFS2BCBxigKsewtdRHuW
         EEoQ==
X-Forwarded-Encrypted: i=1; AKwUvByO3rsQE/ntZq7JRaU4bCGfqqCpj2JwuG1sG7MvKab0l1DDyo/3MHPo1Uf1cOclk9B0/6/DM6X+SREx0lQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgrCwnRcfRcLfkqbiMaEN0C1ADaqth4dm9RcuMFoJKM0i2Pn3H
	9+dFx7LSNRJ1o0SnPhx2b6pi4etX0ZsHRGtY6XQMooTV/MzEmaVIY7zA
X-Gm-Gg: AYBFou3W+CN8ECoEVk067eNpo/EX4o6eFacXeOtVu8ru2+wexPruCYM9BdRPyZJRtIy
	GEJ3XcbjT6u+jFFOHwyCzvbmTv6t4Ul2/p6FFQhXnQxRKSyAaRCaRIDqrEbgEOVkF2qgZIQO0Bm
	h4tQe/WMpoHgoLWGKnbiP4H6884voN/A7y0G5bnLcE0HzAkhP96p+qrGa8DahuiYxM7BEk0Y4KO
	Z2DPDRPU3BnCR+EM7n+dij8ZVkV4gd+VmLN3v+3SgO9j2yHcS6CsqCUDEjM7burxKI0QOttYTwJ
	/iamST7zjm4Nh/+zmQUXNIakUWrJhaA3yhpjs53aNDLkYXB2jQBsEfdF7vwRU93k+zvMnwK1Ss0
	5RR6PnIjcracQAnJgVQ5z/ZfenZG5r30rNL1tfzuYAfi4+I3sZy6PnJ/4pzuJkeqIuCihGVLNNx
	wo0WIfNqBFyZB1LyJE6NGtVA52lryN/YgiMfDOMT0iw08JiLEi4efbQWWYJijZ9Rwl9RKGBq3k4
	Er7u7VrVBXNh0XmRZy9mAh3O5yLkqf/UXHIRELYHm9WlEycjCO1bz2vMl5PmAm6pBZHFPrIF9Pc
	HcfQYXUngA0lIX6X9XsJ
X-Received: by 2002:a17:90b:35c3:b0:3a0:2503:854d with SMTP id 98e67ed59e1d1-3a025038c48mr2051455a91.18.1789818877974;
        Sat, 19 Sep 2026 04:54:37 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4bc0d2sm4231535a91.12.2026.09.19.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:54:37 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: lee@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: MGMT: fix mesh_tx leak on hci_cmd_sync_queue() failure
Date: Sat, 19 Sep 2026 11:54:36 +0000
Message-ID: <20260919115436.3998954-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mesh_send() only queues mesh_send_sync() when no transmission is already
in progress:

	sending = hci_dev_test_flag(hdev, HCI_MESH_SENDING);
	mesh_tx = mgmt_mesh_add(sk, hdev, send, len);

	if (!mesh_tx)
		err = -ENOMEM;
	else if (!sending)
		err = hci_cmd_sync_queue(hdev, mesh_send_sync, mesh_tx,
					 mesh_send_start_complete);

so the only way to reach the error path with a live mesh_tx is for that
hci_cmd_sync_queue() call to fail, which can only happen when sending is
false. The cleanup, however, is guarded the other way round:

	if (mesh_tx) {
		if (sending)
			mgmt_mesh_remove(mesh_tx);
	}

With mesh_tx non-NULL the inner condition is therefore always false, and
mgmt_mesh_remove() is never reached: the entry stays on
hdev->mesh_pending even though the command has been failed back to
userspace with MGMT_STATUS_FAILED. It is only released when the socket
is closed or the controller goes away, and until then it counts against
the MESH_HANDLES_MAX budget enforced by send_count(), so repeated
failures eventually make MGMT_OP_MESH_SEND return MGMT_STATUS_BUSY.

Conversely, when sending is true err is left at 0 and the success branch
runs, so the guard never protects anything either.

Drop the inner condition and remove the entry whenever one was added.

Fixes: b338d91703fa ("Bluetooth: Implement support for Mesh")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
This is the remaining half of
https://lore.kernel.org/all/20260919112517.3871992-1-benquike@gmail.com/
("[PATCH v3] Bluetooth: MGMT: Fix mesh_tx Use-After-Free and leak in
mesh_send()"), which I am withdrawing.

That patch bundled this leak together with a fix for the mesh_tx
use-after-free, and was written against mainline, so it neither applied
to bluetooth-next nor was still needed: 71af682ba469 ("Bluetooth: mgmt:
Dequeue pending mesh_send_sync entries on cancel") already fixed the
use-after-free, and did it better than I had - dequeuing the pending
mesh_send_sync entry at the point of the free rather than locking
around the dereference. Only the leak was left, so this is just that,
rebased onto bluetooth-next.

Found by code inspection while investigating the use-after-free. I have
not reproduced the leak on its own; hci_cmd_sync_queue() only fails on
-ENOMEM or when the controller is going down, which I did not manage to
induce reliably. Compile tested only.

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 9d3de5a..8991aa8 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -2543,10 +2543,8 @@ static int mesh_send(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_MESH_SEND,
 				      MGMT_STATUS_FAILED);
 
-		if (mesh_tx) {
-			if (sending)
-				mgmt_mesh_remove(mesh_tx);
-		}
+		if (mesh_tx)
+			mgmt_mesh_remove(mesh_tx);
 	} else {
 		hci_dev_set_flag(hdev, HCI_MESH_SENDING);
 
