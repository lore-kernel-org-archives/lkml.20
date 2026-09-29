Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2B3AFD0B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670473; cv=none; b=HWCofFSXlSex8Gpwe5LC5t9PBsGnXO31KXvvbQ4v2elPqhdYx1NWPWxr0yo/oZ3EfUJM97vZFzop4MV4YgXGSXjJ86r5AjIkp2BlZPm1zeLjrOn8wI1QAFhrpqSSqlR3Q191YuKlZWnNzfTMWCJ1YCo1ewQHp4mjJuv2mSOnk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670473; c=relaxed/simple;
	bh=4jQ1eZTG5rKiiiDSguf4Mp36fK8Z5+lW5cHeq8EWc58=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=lcgh4Eh4Wky8MsXKWnbp9UKgNQ2SHskubNc1FjnOwRP8aHDtRBYC/dqitN3zfG1kkJyFztSTo1raekNtAzbeC38QQaAzOlMIflKxTp7g7lYBOjjHEvmN5G49e8MaiamY18yiTH9WcBVPptfWmks9Oip8HcackYythA7Eja3whp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 68T8RnWM084549
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:27:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 68T8RnJW084545
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:27:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <f982152f-ff51-4d31-a17c-bd0d562c1414@I-love.SAKURA.ne.jp>
Date: Tue, 29 Sep 2026 17:27:48 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v1.1] can: j1939: cancel pending address claim timers on rx
 release
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: LKML <linux-kernel@vger.kernel.org>
References: <30036c14-ea5f-49ef-b3c1-fe00d1babbf9@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <30036c14-ea5f-49ef-b3c1-fe00d1babbf9@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav212.rs.sakura.ne.jp

syzbot is reporting "struct j1939_ecu" refcount leak, for

  j1939_ecu_get(ecu);
  priv->ents[ecu->addr] = ecu;

in j1939_ecu_map_locked() from j1939_ecu_timer_handler() can succeed
even after

  priv->ents[ecu->addr] = NULL;
  j1939_ecu_put(ecu);

in j1939_ecu_unmap_locked() from j1939_ecu_unmap_all() from
__j1939_rx_release() from j1939_netdev_stop() has completed.

  unregister_netdevice: waiting for vxcan1 to become free. Usage count = 3
  ref_tracker: netdev@ffff8880710f0700 has 1/2 users at
       __netdev_tracker_alloc include/linux/netdevice.h:4496 [inline]
       netdev_hold include/linux/netdevice.h:4525 [inline]
       j1939_ecu_create_locked+0x1c9/0x400 net/can/j1939/bus.c:159
       j1939_local_ecu_get+0xeb/0x220 net/can/j1939/bus.c:293
       j1939_sk_bind+0x70a/0xc60 net/can/j1939/socket.c:529
       __sys_bind_socket net/socket.c:1920 [inline]
       __sys_bind+0x2e3/0x410 net/socket.c:1951
       __do_sys_bind net/socket.c:1956 [inline]
       __se_sys_bind net/socket.c:1954 [inline]
       __x64_sys_bind+0x7a/0x90 net/socket.c:1954
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

  ref_tracker: netdev@ffff8880710f0700 has 1/2 users at
       __netdev_tracker_alloc include/linux/netdevice.h:4496 [inline]
       netdev_hold include/linux/netdevice.h:4525 [inline]
       j1939_priv_create net/can/j1939/main.c:140 [inline]
       j1939_netdev_start+0x387/0xb20 net/can/j1939/main.c:268
       j1939_sk_bind+0x946/0xc60 net/can/j1939/socket.c:506
       __sys_bind_socket net/socket.c:1920 [inline]
       __sys_bind+0x2e3/0x410 net/socket.c:1951
       __do_sys_bind net/socket.c:1956 [inline]
       __se_sys_bind net/socket.c:1954 [inline]
       __x64_sys_bind+0x7a/0x90 net/socket.c:1954
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fix this race condition by calling j1939_ecu_timer_cancel() before calling
j1939_ecu_unmap_all() from __j1939_rx_release() from j1939_netdev_stop().
Calling j1939_ecu_timer_cancel() here is safe without holding priv->lock
because the CAN RX path has already been unregistered via
j1939_can_rx_unregister() followed by synchronize_rcu(), meaning
no concurrent network events can mutate the priv->ecus list.

Reported-by: syzbot+e2af46126e0644cbebdd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e2af46126e0644cbebdd
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928193312.553632-1-mkl%40pengutronix.de # [PATCH net 06/22]
Assisted-by: Gemini-Pro gpt-6-astra opus-5-5
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Changes in v1.1:
  Call synchronize_rcu() after j1939_can_rx_unregister().

 net/can/j1939/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/can/j1939/main.c b/net/can/j1939/main.c
index 5e5e6c228f22..8706680e2458 100644
--- a/net/can/j1939/main.c
+++ b/net/can/j1939/main.c
@@ -212,8 +212,23 @@ static void __j1939_rx_release(struct kref *kref)
 {
 	struct j1939_priv *priv = container_of(kref, struct j1939_priv,
 					       rx_kref);
+	struct j1939_ecu *ecu, *tmp;
 
 	j1939_can_rx_unregister(priv);
+
+	/* can_rx_unregister() uses call_rcu() internally and is asynchronous.
+	 * We must wait for an RCU grace period to ensure that any in-flight
+	 * j1939_can_recv() instances on other CPUs have fully completed
+	 * before we safely traverse the priv->ecus list without locks.
+	 */
+	synchronize_rcu();
+	/* Cancel all pending address claim timers before unmapping the ECUs.
+	 * This prevents an orphaned timer from re-mapping an ECU after the
+	 * rx path has been completely torn down.
+	 */
+	list_for_each_entry_safe(ecu, tmp, &priv->ecus, list)
+		j1939_ecu_timer_cancel(ecu);
+
 	j1939_ecu_unmap_all(priv);
 	j1939_priv_set(priv->ndev, NULL);
 	mutex_unlock(&j1939_netdev_lock);
-- 
2.52.0

