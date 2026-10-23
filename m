Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783345;
	b=uqvecV3XiuX3QHSwHKrm8WNhud3GSCp13bEKTo2eEbE47QLP+1qE85oaAgIuIbSKCqyL
	 vYTxyer+2GDlLH0jmpGf0j1yRcTQ7tBriiCb33UqwF62ZrG+LSDQ88CthwqjRXsPLdMMI
	 Xf4prqQxPltIs3tWx1B45nuGZpnGWyHMUXyLcJI8nnTQKlJdsIR211z5IFUrpgzjSyCGE
	 D4zW7i4npQiTSQAmURDHBseu0A570uBbRC0FDBeWlQrH+fPPARPYwB/jHP8rksi9IKZc9
	 wAsv3vkAzmVlzK6idWKO+pAfIn1TYN1nog/4/fN8sFabvTVDDgfgiCY7xQ1MSAmUMww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ziCcW6Nw+6VJzNQIJUH4e2sx0xcfbPPXXhObGwJmYIE=;
	b=VojLqDnAjM/QnRDQe6nnh2GHtS77qr51cE6YxlOaf0yZUHkMVKX2AyvW/ANcMJ/y3CfL
	 /A1+LLRierSFvMcshFf7kyi9SPT8wVItlBcjVaQWoAC0mc3An+Jvl8zkXKOymejUtjKwc
	 VdskVVbfLQNh7zDz16odnH3Oqilyv/EzYU+EmZqrDySzRKJvRVzVXndS0usRg7LwDzsue
	 20MRh+iFJKqYONezJjwoyoT9z7J/Wrxa7F2/AJQKnxVrKVfeMTPDFCJLyrRFDNxB0MYM0
	 ugMEVa2hiBEzuoQTVlRTFqLf7K2CFjWFOh0TR/KglWah332eDeaehDDyBDhesIf5FRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dFZlO4tc;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4DC606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dFZlO4tc
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e613f813b0so1585075ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792783345; x=1793388145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ziCcW6Nw+6VJzNQIJUH4e2sx0xcfbPPXXhObGwJmYIE=;
        b=dFZlO4tcgBxqWa6ww2l+eiCqhN/zMVe5ihPqyeOhd6DaK86oIhkuSt/xxs8M8CBogj
         9FveXdESZpwj5dPUYOEtgIKN44SIg3EUqiHXHsRM2NBHc5i7pqYwMwOuiUlnVvwfJEok
         oKvvYxlfmTVe4/hw2K/ttbeNywY3bGvGAN1qoCMBcvCpo+grAFABGqHX/04UpnZp55NS
         +PBFpd/4d8BwlwkERe4W70xrmFHRBeWRT0lJduSMePZfUx1DxicfByHbMlHPFabBKf3z
         uKLyAyOlnxPIsYNcpzLQhhyQcAqy0xYs8zXzYQBpi+au3wiRIWpwC5L9oWUYrfs1b/AO
         Gb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783345; x=1793388145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziCcW6Nw+6VJzNQIJUH4e2sx0xcfbPPXXhObGwJmYIE=;
        b=gbUFUpiTS6dzD5VVBzuA7lqVvenUp/9Oj93bIMjzNWht822GK3Pr5RKKQDuSF5XLMf
         NsDepwFIUpIWCJVTlKouyjb0j6WRL2C/nidClxuAaj50ArglXcaGtmvp59QVG2wDOUXa
         Zvxf6d0juv7dXfyaTyAgci0acWLzHT2xz83dO8Qqnq5nxJLiIdTX6BcbBWcfyh6aYff9
         vCeI2gBDwxqLvry76bTFjn9RdCJ4j4dkEgw7nmQlSDNlC2s3aBWno62Ny+pkqazbevE7
         tQDs7WCnYU0M3yc6PA9z0KNDGoi9cafvs7E3KSRHXhLC789nn1BYwSSLNwbXISdJh8R6
         7jTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRK+xDR3uNyHTvhNTtadRcnnguBf2LthWa0pI2YaS/jleQKJBpPl/5Y4qFRtGUk7DRavY9Tc2fpjgTTwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVWjJPJhrxNxHV0kFX8SoJj5U2XllYiZX2/gT6j54toXbyM1yN
	q0OhwsAsARsnn/QZ2h7Whb5dT9wsoRe6qnYJO3x/nJUu8PJ0bhkyFCvHVlr8zKoFdpkw2QCu
X-Gm-Gg: AYBFou0TZGIuNfeoZSp4/eXVTz+bVDjeEIGtt0kZbY3ShlSREIbVadXWm6iDuTHqFUE
	DN4Ebc09hHI+UjjJQdnv9HK1ncEvem+tiO3J2S4XJYZY6JRyJDNHUv5OlJzymaVArXyKQWpqOEf
	pNgAljG4LkwqPo3td5AhvSqcYVznG65hAQZ6hpzweuieU7j9DxbJupGqb3Cke9jrJb8V7E7NUfg
	hE2J+MdLQ9BiTSSUEZWO3tmD62H4/x5AKq/oKY0PgaTrU4djVOQYurMwUtAjWoM48BDJb3P8wCB
	8vqtwjrx5Ci5MJTkYAnRWnNLAVTBNL026tLqOPnXVw6dQ0mRHlcFqOX+Y1CkvXUVneVAenUYGAg
	kH4bFeCxzmM+LzEPZJbnXj0vM0cbn26CY/ODOkncFs7CzvQJifkQED99cliaW82OXiM/kUmL7SO
	j7Xrw+SNfLXuSTBWvSd++sS5Tcg/8g/PjpBzo5mO3QxjqJ3Y1uQmMuI2DaMlnFB1lXct6n5nzKZ
	RkPeZqU2Brxp+GcyPiBme+Fpi4N91FFGXPxsttRwxx9fTjthY9Ln+c8uKCrRwy1aBS7gzeVP1l8
	xdw=
X-Received: by 2002:a17:90b:1647:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3adeb694368mr116319a91.40.1792783344585;
        Fri, 23 Oct 2026 12:22:24 -0700 (PDT)
Received: from 192.168.1.7 ([2409:8a1e:2330:4ef0:20e4:738f:8d42:88af])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacbf5fsm174163a91.6.2026.10.23.12.22.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 12:22:20 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmet: use the enabled transport when disabling a port
Date: Sat, 24 Oct 2026 03:18:51 +0800
Message-Id: <20261023191851.5316-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

nvmet_disable_port() looks up the transport from the current
disc_addr.trtype, while nvmet_enable_port() records the transport in
port->tr_ops.  If trtype is changed while a port is being enabled, the
port can be removed through a different transport, passing the private
data of the original transport to the wrong ->remove_port().

The same mismatch is reachable with loop and RDMA: loop add_port()
leaves port->priv NULL, and RDMA remove_port() dereferences it.

Use port->tr_ops for removal and serialize trtype changes with
nvmet_config_sem in nvmet_addr_trtype_store(), so the transport that
added the port is also the one that removes it.

Fixes: 8f000cac6e7a ("nvmet-rdma: add a NVMe over Fabrics RDMA target driver")
Reported-by: syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
Link: https://lore.kernel.org/all/6acbc835.a150a118.27e199.003c.GAE@google.com/T/
Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>
---
 drivers/nvme/target/configfs.c | 16 ++++++++++++----
 drivers/nvme/target/core.c     |  8 +++++---
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index b03b5d1c2dc3..955f2b127970 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -387,10 +387,15 @@ static ssize_t nvmet_addr_trtype_store(struct config_item *item,
 		const char *page, size_t count)
 {
 	struct nvmet_port *port = to_nvmet_port(item);
+	ssize_t ret = count;
 	int i;
 
-	if (nvmet_is_port_enabled(port, __func__))
-		return -EACCES;
+	down_write(&nvmet_config_sem);
+
+	if (nvmet_is_port_enabled(port, __func__)) {
+		ret = -EACCES;
+		goto out;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(nvmet_transport); i++) {
 		if (sysfs_streq(page, nvmet_transport[i].name))
@@ -398,7 +403,8 @@ static ssize_t nvmet_addr_trtype_store(struct config_item *item,
 	}
 
 	pr_err("Invalid value '%s' for trtype\n", page);
-	return -EINVAL;
+	ret = -EINVAL;
+	goto out;
 
 found:
 	memset(&port->disc_addr.tsas, 0, NVMF_TSAS_SIZE);
@@ -407,7 +413,9 @@ static ssize_t nvmet_addr_trtype_store(struct config_item *item,
 		nvmet_port_init_tsas_rdma(port);
 	else if (port->disc_addr.trtype == NVMF_TRTYPE_TCP)
 		nvmet_port_init_tsas_tcp(port, NVMF_TCP_SECTYPE_NONE);
-	return count;
+out:
+	up_write(&nvmet_config_sem);
+	return ret;
 }
 
 CONFIGFS_ATTR(nvmet_, addr_trtype);
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 07a74c2e1f58..5aaeeffc9ba2 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -393,11 +393,13 @@ void nvmet_disable_port(struct nvmet_port *port)
 
 	lockdep_assert_held(&nvmet_config_sem);
 
-	port->enabled = false;
-	port->tr_ops = NULL;
+	if (!port->enabled)
+		return;
 
-	ops = nvmet_transports[port->disc_addr.trtype];
+	ops = port->tr_ops;
+	port->enabled = false;
 	ops->remove_port(port);
+	port->tr_ops = NULL;
 	module_put(ops->owner);
 }
 

base-commit: 864c07de0c7dcbca58b61625dfa2e461ae63b242
-- 
2.39.5 (Apple Git-154)

