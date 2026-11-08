Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117494;
	b=MUbUJt++xuR74iAIdkcL2q37nSTKBi07V9VDuUojQ43kQrc/CAc35U/dhTX87rXoY+bl
	 CQxjUR404qlcAjdxDUvhoBbFB3LHgZd+00PEUVyBq+CoyvL3XkJ/AW8Thx/8dLwfyQv2c
	 Rz7FRZPmPGyrZZoJIp035CQp273orWMKHtA/z2tSQ5enylwa1oQe4bVVdTJNw4Uc7S3ee
	 ujGbs9SEQI4ALOmCMWhHmvapFu87W6GYN5RSsPVqJiYk5N8wgyMdtmEwWef7KkAxJ+P4d
	 0qvUKWxV0pRQztAlYcbvKySRVSlLU6k7NqySUopYSfy046QT1TEJXS/o4eD0Fmu9t3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IJn1AMk3SYqRRM9oElk7NJVUkVbpguV5f8/F8Hoavu0=;
	b=1ABcCQZrS7EYgNDf0WKAiRqMmpxhnbgRH3KJl5x6dOtbwhAjXaEHDODKL8Ox3q0+yzKF
	 RBEjS2+l6w663XDwdNhU8gKDJ1kTZEaNDsxKa3JXQL9JGS9Px2UQVvlefXnD6MR6iTRC6
	 rjwkPOcwRf8J5IneOYERw+2gVxzcUamNkU+ClFFgfs2qBeS2V/c6aIO9V7mYYUzJ2ti+l
	 2YzkDwT+Rdw5pvsdxqjfAWF5DkgsrTdFsZoL9Uvu1YSS+GykVDR6uK16WY3v6LL5DEoZv
	 pRIGPbO0+pOy3WuiQcLwHz5Xt/RtdlwhTFux/3UtL3jq6P5Y+7qUm8QJPk0wX+mjQ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O7JxI+x0;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E7F606D80A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E7F606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O7JxI+x0
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so577631eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117493; x=1794722293; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJn1AMk3SYqRRM9oElk7NJVUkVbpguV5f8/F8Hoavu0=;
        b=O7JxI+x0qDO25SqmddFu2SvxIZxCk1I8uX2KySLYAzcN+dud2mvQ/Nj0Wb8QNaPdrS
         BcuaKSt3nFELUixlFAGVCIUPhxd4TFduwOp0qOpwzfHXtjN0NbivmdfBWSUmdk0jyiYm
         U97RW8W80j2bHND3Bx7qyzfceGOhwgN38DCmbr2HVPi0wjtpN6f9NymxGx0nTgTA16g4
         FsY0Vln8L2bGooYdHCc+FHcOmnRukGXprSdUVktXSVsSTgveYkt7eYb8wzYvREXk7yp7
         UcWTgC/hZhaBkcUHSajMSqRA60hvgi2jM5P4KWemsw3HycUmASrpw5U5juJBuK3dcunq
         vCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117493; x=1794722293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJn1AMk3SYqRRM9oElk7NJVUkVbpguV5f8/F8Hoavu0=;
        b=Gf9pOgIdW2pj7lN4RWd2fknnMU6WrfhAkJmMEpuVxUv6/gA5nGqvntD4f+Udxc2Lb0
         6065A4k0D4pMqZqo5eQk34WPK2/HgQjQCOU0yk6ZFVS3P+fyqW9Ru01jNkWPnpmi8H15
         5bEkIw8KWmACkCVwy9gW+QOftvv6Y0wRCEx4/X8Y33BmqkJ3DpVH9FekpQq2YqVqv5OL
         08zoS+s/677WKhM/f7uV4qV+rSdgxVxD5GIfEdZtOEkOpVJqESYfbb/3tiokiYQL4ejl
         AYtXCNcBNNyK80crFGeFLsn7RAjbrWYIsDEkgPi44Mrd/cZigVjplVjmbrI4f3WKgJrl
         pXfg==
X-Forwarded-Encrypted: i=1; AKwUvBz9kPaKnt+HimAINzjjEYEsKM1HZuF14BhJlUeFWNeBg/ZrTJSjdkN3U9rrA0BIQnPuawLUz/N0E1uRFBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ONtduMt5nwGH1H9bEOM4yUk91Zf51zCK4ENiVePQj2PA3blCE
	F7pC2mo2+qN2p/0EA2xYXnyZIT/LTxeaeLivvz02zd4XSLiGA2bWgVjDa9RLK8Dq13RKoe5ROyq
	m9SFUcDDBQaLp9ToAZ0E4M9cu6w==
X-Received: from dlbrx22.prod.google.com ([2002:a05:7022:1716:b0:143:7311:4b88])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4302:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b39fe9e1famr1103103c88.24.1794117492902;
 Sat, 07 Nov 2026 21:58:12 -0800 (PST)
Date: Sun,  8 Nov 2026 05:58:06 +0000
In-Reply-To: <20261108055809.2122934-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261108055809.2122934-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108055809.2122934-4-almasrymina@google.com>
Subject: [PATCH net-next v2 3/6] net: guard memory provider RX queue open and
 close on unregister
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

When a memory provider RX queue is leased to a virtual netdev,
netif_mp_open_rxq() and netif_mp_close_rxq() redirect through
rxq->lease and lock the physical backing netdev directly rather than via
netdev_get_by_index_lock(). This raises two issues during netdev
unregistration:

1. In __netif_mp_open_rxq(), the physical backing netdev may already be
   in NETREG_UNREGISTERING (after dev_shutdown() and
   dev_memory_provider_uninstall() have run on it, before cascaded
   unregistration of the virtual leasee tears down the lease). Reject
   opening an RX queue if dev->reg_state != NETREG_REGISTERED.
2. In __netif_mp_close_rxq(), when the physical backing netdev
   unregisters before the virtual leasee, dev_memory_provider_uninstall()
   on the physical netdev does not uninstall the virtual queues, so
   phys_rxq->mp_params remains populated until the virtual leasee's
   netif_rxq_cleanup_unlease() or socket teardown runs. At that point
   the physical netdev has already gone through dev_shutdown() and must
   not call netdev_rx_queue_reconfig(). When dev->reg_state >
   NETREG_REGISTERED, clear rxq->mp_params and return 0.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/netdev_rx_queue.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
index a7261fedd5e76..85ae5abf16b8e 100644
--- a/net/core/netdev_rx_queue.c
+++ b/net/core/netdev_rx_queue.c
@@ -193,6 +193,14 @@ static int __netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
 	struct netdev_rx_queue *rxq;
 	int ret;
 
+	/* A leased physical dev is locked via rxq->lease rather than
+	 * netdev_get_by_index_lock(), so check reg_state under its lock.
+	 */
+	if (dev->reg_state != NETREG_REGISTERED) {
+		NL_SET_ERR_MSG(extack, "Device is being unregistered");
+		return -ENODEV;
+	}
+
 	if (!qops)
 		return -EOPNOTSUPP;
 
@@ -284,12 +292,13 @@ static int __netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
 
 	rxq = __netif_get_rx_queue(dev, rxq_idx);
 
-	/* Callers holding a netdev ref may get here after we already
-	 * went thru shutdown via dev_memory_provider_uninstall().
+	/* Callers holding a netdev ref or tearing down a queue lease may get
+	 * here after dev already went through shutdown.
 	 */
-	if (dev->reg_state > NETREG_REGISTERED &&
-	    !rxq->mp_params.mp_ops)
+	if (dev->reg_state > NETREG_REGISTERED) {
+		memset(&rxq->mp_params, 0, sizeof(rxq->mp_params));
 		return 0;
+	}
 
 	if (WARN_ON_ONCE(rxq->mp_params.mp_ops != old_p->mp_ops ||
 			 rxq->mp_params.mp_priv != old_p->mp_priv))
-- 
2.56.0.455.g6c5a503b38-goog

