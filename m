Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDED36C9CC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442258; cv=none; b=sKWkHqHHXF7vuXebQ42eCqnTc9D4KVXDpZbOQl1rewbKutU2fSxDPxuNk7q29Kuxq8/D1+kAMjEmulGKSWNiPw2+eQ769dfTf6z3oYFamAcEBlnP5gV2d9SJos9mgB3aASNsCjJPbEhCgXjVsAXp7I7AC+u5S5TjmxYN2pz2DdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442258; c=relaxed/simple;
	bh=8H1tE7kX+1hniox/qQtg6VCg6K/2rhyL9dzTo1kJOP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P61pIsEwqED+NN881CZBVSemoXafw28ayX3aKwvNgBc2asSsE/CH5LGToLGBXK/bL5uAxo+HlJCnTv2LV1kInOh4ibZPTpITI0c9uQ25+czMS2rEn78CgTtr+WG43j6GyQg0Jlp2fvQA6a+8d+OCI1bV4xvd8s7pT/4ic24xZ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQ4Ioktn; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQ4Ioktn"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-14373bcbfe5so64465c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442255; x=1791047055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2a0TErf0VpMx6Yy4Itc0oKQ0YVBvbY7xMiK4NUKXIng=;
        b=mQ4Ioktnr5MvQOSa4gOvFBP+sJwb5xEx8Tybw6PIQE2HppLlq1bsi/tnuUsSOJDJH4
         6mweriv95xHvTWOSy52mtee+3di6YOpzut0EFqTcjS6SZcYJ9UlAAZELA+vLZQPGsDgn
         7Nz2l8qhFysEUaA2geahmL//Epr4V1Bwq8g7OADu8yUSvlExH3eR9l8T4PG9KYRI9UC7
         j8HgiVg2JNLMMuY9DbGNNmH1e++QGKOZ9h4BrbHyvm8zARXTSA3jxa8dYAF7vrk7dN0k
         cUqXoAYR8Sbe6n8fm1wbkEm5k8t5Zm1C5E6F00v4udkmjqNM3rcpqdEYVzldYaLgEs+V
         EtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442255; x=1791047055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2a0TErf0VpMx6Yy4Itc0oKQ0YVBvbY7xMiK4NUKXIng=;
        b=xkbMkVKjAJNKaBZin4km4K0xwtv+Tljj1nYeb0+mjucr0dioLGXzQ9acQ+LZVt4xPg
         NNYyLcBMA0jYNgqeKoHkEttivBL9ZyEZerdarS+TuWa8u+dJnZuUxWdW4cjwyZSwe1PN
         B8LjzFmD2z2jYCklMgvogICbU8npfuVPIG7nUxFloFsTMEOCLC4VUkbb6dlXQAXu7xFh
         762l4AJiNFHczklviuLO18hJ4T2XlEIb9v4LEWS5s+GRbwyZbwJ7yuXkyDnThj8+BkMK
         A/x6iuVsKZ/Ka/qs5hB7VyBuKcsvbBBnm3mNMXh7bLx+rwd7gN9ez2Btg8hwwBtp9POx
         VJAA==
X-Forwarded-Encrypted: i=1; AKwUvByqiZSbBA5tly94XWFjRC+FAuurmCSq3zRGxAGo4eVYY5it165I82U+N75n3c71muVB2OT5xNQPNAKIn/4=@vger.kernel.org
X-Gm-Message-State: AFuF++m2yOHw06IGm1rUIBuN7vl/dpHQAGou+raSQ5DPeAWn7qsuDMsC
	CJblx/ty+ZA/Vrhc+ZV/S8GdYJIaJS7iqncc9t3PTNivHG9RqJzDnLtt
X-Gm-Gg: AYBFou1MJqB8PvBtaGvoiItXlWySxZc11HfYrJHNwOTrACZdVGKWyydR01R4hXclGxZ
	d3vYzomXtI4Kk7rnvXkVl/X9N3Q/r3qzl49LKCCcIyxAJup5A9F9vtZU7a0EFogJvU0NsVYejCr
	YUbHfVK/boseKokojBiJxbUwV+FRwAdRS+p6KhrEIhB6TmQHki4WJRQO/zaxANmlilAAH0zAceH
	sOvz7HkQEUahbioBdFUhF+Lp9uGqezXh/GPqkuaAOUNG2XGm4THi5JdbViIeCsy7L5YnzOwrg+E
	yOceCeQNS1rNQSHF7ozQIFrbAmyiktlzIsYccC6dPa0wj6vrWSe+D3wQ5Vnie2vvdF5H2E55aWT
	/823sTdDhhbsTvjPGgAiKHbfQ8v1UU8mozLYgH/BfkDZYBvahsLurN0g4DTeJnUANt7tSwGlZEL
	3syYy0XptttSFGpgAMkOe1tqhzYmf3FOb0u3ULJzFfeUGfG9RyoBTi9VimjxFaktRfkBFEraeQq
	7Dt8DCL66BnSiddULti+mQ2ELehUajPLToI6nFMLuwC0KanqcEz3gavN5AolC03w1Lq1Q==
X-Received: by 2002:a05:701b:4590:20b0:147:d430:7322 with SMTP id a92af1059eb24-147d4307565mr2525626c88.1.1790442254385;
        Sat, 26 Sep 2026 10:04:14 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm13343905c88.0.2026.09.26.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:04:13 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Gustavo Padovan <padovan@profusion.mobi>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] Bluetooth: hci_core: Serialize ACL scheduling with channel deletion
Date: Sun, 27 Sep 2026 01:04:02 +0800
Message-ID: <68cec17b5d5b42639671fbfdc8761940d6c9476b.1790407061.git.nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790407061.git.nicoyip.dev@gmail.com>
References: <cover.1790407061.git.nicoyip.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hci_chan_sent() selects a channel under RCU but drops the read lock before
accessing chan->conn and returning the channel. The ACL and LE schedulers
then use its packet queue and update its transmit counters without any
protection against channel deletion.

After TX selects a channel and releases RCU, a disconnect command timeout
on the separate request workqueue can run hci_conn_failed() and
l2cap_conn_del(). hci_chan_del() can then unlink the channel, complete
synchronize_rcu(), purge its queue and free it before TX resumes. This
causes use-after-free both in hci_chan_sent() and in its callers.

KASAN reported:

  BUG: KASAN: slab-use-after-free in hci_chan_sent+0x892/0x9b0
  Workqueue: hci0 hci_tx_work
  Call Trace:
   hci_chan_sent+0x892/0x9b0
   hci_tx_work+0x5e6/0xb70
  Allocated by task 91:
   hci_chan_create+0xe3/0x350
   l2cap_conn_add.part.0+0x12/0xa30
   l2cap_chan_connect+0x110d/0x1b60
   l2cap_sock_connect+0x310/0x530
  Freed by task 99:
   hci_chan_del+0x11f/0x170
   l2cap_conn_del+0x4f1/0x800
   l2cap_connect_cfm+0x88c/0xd30
   hci_conn_failed+0x150/0x250
   hci_abort_conn_sync+0x3e3/0x800
   hci_cmd_sync_run+0x7e/0xc0
   hci_abort_conn+0x105/0x1f0
   disconnect_sync+0x157/0x290
   hci_cmd_sync_work+0x13c/0x290

Hold the existing device mutex across channel selection and transmission
in both schedulers to serialize them with channel teardown. Keep timeout
handling outside the critical sections because hci_link_tx_to() acquires
the same mutex. This also permits the transmit path to sleep, unlike
extending the RCU read-side critical section across packet submission.

Fixes: 3eff45eaf817 ("Bluetooth: convert tx_task to workqueue")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/bluetooth/hci_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index d183efaf9063..24b46ccd4da2 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3659,6 +3659,8 @@ static void hci_sched_acl_pkt(struct hci_dev *hdev)
 
 	__check_timeout(hdev, cnt, ACL_LINK);
 
+	hci_dev_lock(hdev);
+
 	while (hdev->acl_cnt &&
 	       (chan = hci_chan_sent(hdev, ACL_LINK, &quote))) {
 		u32 priority = (skb_peek(&chan->data_q))->priority;
@@ -3690,6 +3692,8 @@ static void hci_sched_acl_pkt(struct hci_dev *hdev)
 
 	if (cnt != hdev->acl_cnt)
 		hci_prio_recalculate(hdev, ACL_LINK);
+
+	hci_dev_unlock(hdev);
 }
 
 static void hci_sched_acl(struct hci_dev *hdev)
@@ -3718,6 +3722,8 @@ static void hci_sched_le(struct hci_dev *hdev)
 
 	__check_timeout(hdev, *cnt, LE_LINK);
 
+	hci_dev_lock(hdev);
+
 	tmp = *cnt;
 	while (*cnt && (chan = hci_chan_sent(hdev, LE_LINK, &quote))) {
 		u32 priority = (skb_peek(&chan->data_q))->priority;
@@ -3746,6 +3752,8 @@ static void hci_sched_le(struct hci_dev *hdev)
 
 	if (*cnt != tmp)
 		hci_prio_recalculate(hdev, LE_LINK);
+
+	hci_dev_unlock(hdev);
 }
 
 /* Schedule iso */
-- 
2.43.0

