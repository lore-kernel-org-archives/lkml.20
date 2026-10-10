Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4452E32572F;
	Sat, 10 Oct 2026 22:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791671158; cv=none; b=kj9S9djrpeyfUu+PSESjbRHFzzyfcz7noYXYSDofRSHAIysTOoDIWP0rGFMikLQCknrADQqmQbWbUwGPif/fcpyZXIyqq2UKyNAdvqCMHY/2DRh4AvcHympCU6XK280ubawha/k9bYRzrt4efbSif6qBooqFvfJjV+tt5bTrHoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791671158; c=relaxed/simple;
	bh=pAYVB5PeFpW8HxPDnj2XeIgyKvCaV1s9djzOblgFM7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E6DMrICKDmnJc+xiOyR8cmcE6ITWwU43FuX3s6lWtc/1zHGPZ8CU39fC9KzdcCkJg/rgBSwdGA6MMZ9oyE8JRwjktkOOj99Mz0tPqlTJBCyUeOR+LETmtalZ081C9TcJqKBzezCIYgfGvsdGvW77aPmZTxnG/wye9S+h6LuMtcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=aPEhDzx6; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="aPEhDzx6"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F2FA880DA3;
	Sun, 11 Oct 2026 00:25:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31JMfF3VuXNw; Sun, 11 Oct 2026 00:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791671153; bh=pAYVB5PeFpW8HxPDnj2XeIgyKvCaV1s9djzOblgFM7w=;
	h=From:To:Cc:Subject:Date;
	b=aPEhDzx6HMNNagQF3HzKiJX+N4lpS+9ExmrtYHplXFAztWVtYRhsEmXqe8SNhSpsm
	 tiENmFAdM09bf0H2mT+kAZO+jMJ1NApPgtZ73LvddDvhMH3NbsDdWgt35ZkKhCw654
	 E55RBvTSHwByKEri20lkIqeyCV4rL4mXXPAyOJ+gE8vLRVMS41Q+L+3BZVhWj4KEOA
	 7z1D72EPkYxYgg+H27BbkJVLswJv2tvghsBB2E0lhkpS+IgXoy0bqpvBDpkgyt+S4O
	 QaMZfJ0AjiQSJPuTRDD7CNM89SMFxqft50RMiV0/QJfqUwuXbKeCTuagv5Fg0XZGed
	 ybHCodjh/EJwQ==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: seq: Wait for one RCU grace period when deleting all ports
Date: Sun, 11 Oct 2026 01:25:40 +0300
Message-ID: <20261010222543.1470723-1-aliamemis@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the port list was converted to RCU, snd_seq_delete_all_ports()
calls synchronize_rcu() once per port under register_mutex. Closing a
client with 254 ports now takes about 1.6s and every other client
open or close waits for it.

Unlink all ports first, wait for a single grace period and then free
them.

Fixes: 4c252fbc06d6 ("ALSA: seq: Use RCU for the client port list")
Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>
---
Tested in QEMU on v7.3 with lockdep and KASAN.  Closing a client
with 254 ports went from ~1.6s to ~0.02s, and a second client doing
open/close in a loop no longer stalls.  Closing the client while other
clients send to and query its ports ran 100 rounds without reports.

 sound/core/seq/seq_ports.c | 41 +++++++++++++++++++++++++-------------
 sound/core/seq/seq_ports.h |  1 +
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index eb67eb0ee..b582d0344 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -248,17 +248,9 @@ static void clear_subscriber_list(struct snd_seq_client *client,
 }
 
 /* delete port data */
-static int port_delete(struct snd_seq_client *client,
-		       struct snd_seq_client_port *port)
+static void port_free(struct snd_seq_client *client,
+		      struct snd_seq_client_port *port)
 {
-	/* set closing flag and wait for all port access are gone */
-	port->closing = 1;
-	/* the port has already been unlinked from the client's port list;
-	 * wait for a grace period so that RCU readers still traversing the
-	 * list can no longer take a new use_lock reference, then drain the
-	 * outstanding references before freeing
-	 */
-	synchronize_rcu();
 	snd_use_lock_sync(&port->use_lock);
 
 	/* clear subscribers info */
@@ -272,6 +264,20 @@ static int port_delete(struct snd_seq_client *client,
 	snd_BUG_ON(port->c_dest.count != 0);
 
 	kfree(port);
+}
+
+static int port_delete(struct snd_seq_client *client,
+		       struct snd_seq_client_port *port)
+{
+	/* set closing flag and wait for all port access are gone */
+	port->closing = 1;
+	/* the port has already been unlinked from the client's port list;
+	 * wait for a grace period so that RCU readers still traversing the
+	 * list can no longer take a new use_lock reference, then drain the
+	 * outstanding references before freeing
+	 */
+	synchronize_rcu();
+	port_free(client, port);
 	return 0;
 }
 
@@ -302,18 +308,25 @@ int snd_seq_delete_port(struct snd_seq_client *client, int port)
 int snd_seq_delete_all_ports(struct snd_seq_client *client)
 {
 	struct snd_seq_client_port *port, *tmp;
+	LIST_HEAD(deleted);
 
-	/* unlink and delete each port; port_delete() waits for an RCU grace
-	 * period before draining the port, so concurrent lockless readers can
-	 * no longer take a new use_lock reference on it
+	/* unlink all ports first and wait for a single RCU grace period
+	 * before draining and freeing them, so concurrent lockless readers
+	 * can no longer take a new use_lock reference on any of them
 	 */
 	guard(mutex)(&client->ports_mutex);
 	list_for_each_entry_safe(port, tmp, &client->ports_list_head, list) {
 		list_del_rcu(&port->list);
 		client->num_ports--;
+		port->closing = 1;
+		list_add_tail(&port->delete_list, &deleted);
 		snd_seq_system_client_ev_port_exit(port->addr.client, port->addr.port);
-		port_delete(client, port);
 	}
+	if (list_empty(&deleted))
+		return 0;
+	synchronize_rcu();
+	list_for_each_entry_safe(port, tmp, &deleted, delete_list)
+		port_free(client, port);
 	return 0;
 }
 
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index 12ad86bf1..ef1787d6c 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -49,6 +49,7 @@ struct snd_seq_client_port {
 	struct module *owner;		/* owner of this port */
 	char name[64];			/* port name */	
 	struct list_head list;		/* port list */
+	struct list_head delete_list;	/* used by snd_seq_delete_all_ports() */
 	snd_use_lock_t use_lock;
 
 	/* subscribers */
-- 
2.55.0

