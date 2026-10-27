Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120298;
	b=ejACqJe1MGJbwN6msH3HIFFHKOjqtoayQhVw178sQN2p52dDaHc6nfDwnURLmx3T09dh
	 4JRpLJQasF9mDOJGJlHPsLCYPSmvj/DjSIw+tBsVsQYRFb8sH/Q7Tv3KeUz2zJB7auhOY
	 8xZvob10DhgCrb5wdvMCExin/rOWo+4RO1s4BXrMfvM+VavzFdi6C0VWrsnrLmptLgxl9
	 UEFfe7nHEEKGVlyUQTlllzSwlIHfUzA+7s4r+jUnzueUh1B4SOa1kfMUZL3YEP54yd3zG
	 dwBjwPCl89q0p43UibAbu5tfaCB1ll9dwvmlN4WD7V71MWXP67De9KgIOPafJLdh6zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120298;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4HZrdyTUt9cxjGyieqbvhXg5TOQ8ZDNN4OBh3cV/DXc=;
	b=Q838MlADcnWIgLsFiaFHy838Irogbi0vO2q4qfYIF8SXe+lhjh6JJ59I4TWBG7HnJNFh
	 z0pbbkpY9+L8uW86rmC/nZg8KDP45wNJfP5AklRHl7jRKUABYCPKR4gis0sq2B3x/DD/K
	 Jex3tXqTEZrl4Byms0BRsUdT7SSHB0gIhCmPQZ05WOXTFD7BeLaQ76y3bhSXsTI6MLTfK
	 D28fCf0C20JW995peK++LKYw0iUTx5I7RrCIHUNshN0rTBh6cX3qGpDY68QFo0NjnKsdE
	 CgJaWXdtovxF+cVGaH/WG0sKiTCCQr0BWsp+dOTWepwREqKP8MPgDQbIesqo/dcySTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zkWoRe5F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3B2606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zkWoRe5F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5848D1F01825;
	Tue, 27 Oct 2026 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793120297;
	bh=4HZrdyTUt9cxjGyieqbvhXg5TOQ8ZDNN4OBh3cV/DXc=;
	h=From:To:Cc:Subject:Date;
	b=zkWoRe5FZVmU7dx6LbLRCbGGOyRfjD01P4W8Wn8ZLVlayR4IfMjUQYMFYzvodBv4n
	 5XhI2CbY9NjdJ0AN34V8wBgkHBP0ESxRUeu+9URVPCOaOLkOhfVVvYljBGoo3btDfw
	 L5LbxqWoipqNuIa3QY11wNTuR6PcWJ4WwUosFL5g=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com
Cc: linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] misc: vmw_vmci: wait for callbacks in event unsubscribe
Date: Tue, 27 Oct 2026 17:58:16 +0100
Message-ID: <2026102715-escapable-quaintly-8530@gregkh>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=LPauz0w2+p6bvgXBZb4pMyv0u0Bm3jVO/zNVX2zLaN4=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPbqjXKfwv3qSkKj+pdM/b0y/W9QdbC2qFN0m9Pum2J IDBZNr9jlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIzFcMC84mixqfcn2QwcrC z/1kXWn+jfIvHgzzPUp/lVfs93xTfPamrn71I4HSnX2KAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

event_deliver() calls the callbacks of the subscribers inside an RCU read
side critical section. vmci_event_unsubscribe() used to call
synchronize_rcu() before it freed the subscription. This did more than
to protect the struct vmci_subscription: when the function returned, no
callback was running any more, and its callers rely on that.

vmci_transport_free_resources() unsubscribes from
VMCI_EVENT_QP_PEER_DETACH and frees the struct vmci_transport, which is
the callback data, a few lines later:

  CPU0                                CPU1
  event_deliver()
    rcu_read_lock()
    vmci_transport_peer_detach_cb()
                                      vmci_event_unsubscribe()
                                        list_del_rcu(&s->node)
                                        kvfree_rcu_mightsleep(s)
                                      kfree(transport)
      spin_lock_bh(&trans->lock)

The event is sent when the peer of the queue pair detaches, so the other
end of a vsock connection chooses the time. vmci_transport_exit() and
vmci_guest_remove_device() unsubscribe callbacks which are gone with
their module.

kvfree_rcu_mightsleep() only waits for a grace period if it cannot
allocate memory. Bring the synchronize_rcu() back. The cleanup work of
the vmci transport now waits for one grace period per socket again.

Fixes: 6da3f33770e0 ("misc: vmw_vmci: Switch to kvfree_rcu() API")
Cc: stable <stable@kernel.org>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>
Cc: Vishnu Dasa <vishnu.dasa@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/vmw_vmci/vmci_event.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/vmw_vmci/vmci_event.c b/drivers/misc/vmw_vmci/vmci_event.c
index c3ef3b98c432..57d3a63678ac 100644
--- a/drivers/misc/vmw_vmci/vmci_event.c
+++ b/drivers/misc/vmw_vmci/vmci_event.c
@@ -213,7 +213,12 @@ int vmci_event_unsubscribe(u32 sub_id)
 	if (!s)
 		return VMCI_ERROR_NOT_FOUND;
 
-	kvfree_rcu_mightsleep(s);
+	/*
+	 * Wait for event_deliver(): the caller is going to free what the
+	 * callback works on.
+	 */
+	synchronize_rcu();
+	kfree(s);
 
 	return VMCI_SUCCESS;
 }
-- 
2.56.0

