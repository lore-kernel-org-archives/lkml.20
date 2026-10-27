Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113105;
	b=EAmVt8pjFbPho5NMvtioTpLXS2V6+yMHzmEGDek5X5nlxtnw8okQKaShxqptPyVWqpG7
	 JA9A+21KagDk/ZKLMxYjcC45570gJqsaNE3gZa2EGHyK9COBX2V9kjRg05GPhMesmUJ8x
	 /lZdbKDsh0jY3mTFl9ZdcPb1CNmPCL88Qhh0IJ75q10LShLu1WgOg8eJRHAgeiLnhMKDv
	 jQ22iFZJydGAenuEuXc0pgJtrsAQMYkEf3jFAzThmebUsKy4zal4P+ALHP6HRqRzNcq/c
	 FodEnmOHR3Pq5M/DAMoU+L4p1Ugxj2xvdiXYG1Pq5gDUlqGbdFzIXvSFgID2QlX71Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113105;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lMhu7PGO0b196RgpK7BEjpqe/VjuGYLbYvkFX79m9DE=;
	b=jhhO+B8t92isegF4MvSwKJgHp23vY85bwE6452Z9fTpg/lhTbeAX9YKUNKVm7VyBYB4m
	 0zKFDMQ3AMvR8n4ngHPpXU2QIGpBRPunoCVuTONSAh51TdRTA+hblKZUd9V1D6C3J8NUg
	 ANJsQAfwDrTpPsjKFXP7uGCAsXibuohUHO9n/PgcBRJYaNxpqUFF6XemzD7m581wTI1vh
	 g4f619wqwKNl6PgO+mcwzJeocB/JQX9o4gnR9G3CegB4fRyEzk+9EIv5vUrLmVm1P68+7
	 hmvXsmITqLohPQ1hThKDPrm7CcNmvUFI2kD7+Frmt03inZ3cfgpDIIslpGYQXltbgDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CKwUedfW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBED60A383E;
	Tue, 27 Oct 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CKwUedfW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0031F01829;
	Tue, 27 Oct 2026 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113104;
	bh=lMhu7PGO0b196RgpK7BEjpqe/VjuGYLbYvkFX79m9DE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CKwUedfW9H4dufvQ5iZEMgaLWPMa6Cs6TwLl9d2rZkpb8rgYdpv2yNnkxToi7gitn
	 TONlF1xixyQvtNYI9qa5uZO4Fp5YUjtVCzyue/SAp5OGSjVLOC4x5lhG88NtFOKXuq
	 vbx07djGOg/2roPWzBfHDhFkGPQZQgQSsJ1n+CvU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:51 +0100
Subject: [PATCH 11/19] usb: typec: tcpm: don't wait for the VDM discovery
 work
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-usb-v1-11-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=yMNxdMS8g4eM9u3HCdDP3g1cp1DiTVhunJc31Z3xg+I=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr9PZy1mWiXJEaS27Ionm/bPJwdvJgqtPODC0HTg6
 Imp9UGbO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi/zkZ5rv1Nh+Q2jujZ8eC
 /9Xcsdu/2/uGrWZYMKHgUd9D6V6u+zHZEQvOKx81nVh1BAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

mod_vdm_discovery_cancel_delayed_work() calls kthread_cancel_work_sync()
with port->lock held, and tcpm_vdm_discovery_work() starts by taking
that lock.  This is fine as long as the caller runs on the kthread
worker of the port, like the work.  But tcpm_reset_port() is also
reached from tcpm_tcpc_reset(), which tcpci_irq() calls from its
interrupt thread.  If the work is running, it waits for the lock while
the holder of the lock waits for the work.

Use a flag instead, protected by port->lock, which is set when the work
is scheduled and cleared when it is cancelled.  The work returns at once
if the flag is not set.

tcpm_unregister_port() calls tcpm_reset_port() after it has destroyed
the worker.  Commit 98d00deb6ae4 ("usb: typec: tcpm: fix use-after-free
of the kthread worker on port unregister") put a test of port->wq in
front of the cancel for that case.  Nothing is cancelled any more, so
the test goes.

Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs")
Cc: stable <stable@kernel.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..600e820a7b93 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -542,6 +542,7 @@ struct tcpm_port {
 	struct kthread_work enable_frs;
 	struct hrtimer vdm_discovery_timer;
 	struct kthread_work vdm_discovery_work;
+	bool vdm_discovery_armed;
 	bool state_machine_running;
 	/* Set to true when VDM State Machine has following actions. */
 	bool vdm_sm_running;
@@ -1768,15 +1769,20 @@ static void mod_enable_frs_delayed_work(struct tcpm_port *port, unsigned int del
 	}
 }
 
+/*
+ * Called with port->lock held, which the work takes, and not only from the
+ * worker: the work cannot be waited for.  It does nothing unless it is armed.
+ */
 static void mod_vdm_discovery_cancel_delayed_work(struct tcpm_port *port)
 {
 	hrtimer_cancel(&port->vdm_discovery_timer);
-	if (port->wq)
-		kthread_cancel_work_sync(&port->vdm_discovery_work);
+	port->vdm_discovery_armed = false;
 }
 
 static void mod_vdm_discovery_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
 {
+	port->vdm_discovery_armed = true;
+
 	if (delay_ms) {
 		hrtimer_start(&port->vdm_discovery_timer, ms_to_ktime(delay_ms), HRTIMER_MODE_REL);
 	} else {
@@ -7295,6 +7301,10 @@ static void tcpm_vdm_discovery_work(struct kthread_work *work)
 
 	mutex_lock(&port->lock);
 
+	if (!port->vdm_discovery_armed)
+		goto unlock;
+	port->vdm_discovery_armed = false;
+
 	tcpm_log_force(port, "%s state [%s]", __func__,
 		       vdm_discovery_state_strings[port->vdm_discovery_state]);
 

-- 
2.56.0

