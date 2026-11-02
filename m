Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649306;
	b=hx5AZsC4tzpmo+FKzT90izVi563I35UtkMwNPuP1de7x4ddHec+iWCIaG+wpWNrBsqe6
	 7e6ZR7fO4BiUGwKt1ydsOdYPd+5pKeDvTplEUW9ewMB1AHdgMu+Nde44+quWnm/CbL1GW
	 UfldHCYtSf1WXO4JCxL8rLXaYNLjs72+1Xpi1zKCV4m9jAm+vvKZVyHE4UyFvTTLhe5EO
	 rvbVp5zD4ZiUg41ObUrRqd3gNbTREOVoXVK0U6wOaKwE58DyURPwlxjhq0wcONHZk4If+
	 N2qpXafhInNt8LhFt3ymEclT7NR7NKHe7YnjqtZsRoMu10QI7bIBg1GqSDLu9GoeNnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1xDwSEG6VK1NnrwFAzTuvmGkyH9sGfRAJBwxtJWmaDI=;
	b=uUuTVDr5YZO+jZe1z8Bw0axDcBobhCYOhGsmjBqxc6U1xKBdaE0dzaeDrdPHVPyZzOuE
	 tjf/4RcuLmJUnKL1TKfQg7q9lX68OCkKNoBXiy01mKoqKe0Xz5CfhKhCR1HmGA1AD40/R
	 yfe8sbAMCZeh7Eij+L61253+GQMKtxkAQNBJFiX7k6v70qha6qIAX4HV+n/yVx26eJ6WQ
	 oRUuuKYJqrVO+waQl+W1DnpHTJw1nHxMNLpQEOMQjprVGAa1YD0FbB+k+N/88xBFP0GuI
	 E647Tf7WKsmVbN/lApkn6XLbc6aqS2eUmpUmYrl3ghVG1SXOHi1nMTDcKUcFyqzEY2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjILj0Y6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA11606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA11606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjILj0Y6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4af52002471so6948785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649305; x=1794254105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xDwSEG6VK1NnrwFAzTuvmGkyH9sGfRAJBwxtJWmaDI=;
        b=GjILj0Y64bZZ3tcRYoxsJ/1tq4TMb1TrD0hYCGQo/N/adeAZjcfFWSu1PPzEazgZn8
         ONatlkbgOQb2QBRULQlka5g+JjAqAcD4DbUqV4xz776S1DHoOQW88h6T/1VKYceUrnQj
         uDGR1Jz6enTPVANkxtZ4r+IFfrxspabWr9+cpJo0BMMQbF/E32kilgl3HiQ7FBIWaRx8
         we/gd8YQ1x7CCzsoeYaTYzxOoOCQRyp/v48GPU33R6W/nT/2fNPf/mpQeOWWWtIrQgO3
         2gj5BBzlwBeB8l3RadJeDAHuNfUv0pp/gqTUkLlj69NwQrC8Lt0WTDN0XA4Dsirdimy/
         tC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649305; x=1794254105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xDwSEG6VK1NnrwFAzTuvmGkyH9sGfRAJBwxtJWmaDI=;
        b=pL0acL7nTq0xXK5KBdDJhoqWGC1/9+iAWaV/sSz9pFWIdTLSwl6CY+RSC3uPrpGdIj
         +BcMuMIcAOHjMN8NZmMf9Wq+jmL9iAx5s0qdJOPuap56Sui9k3TBnWGV8LYN6Fyo+krs
         DuZd/9pkuNbwHMP0kq4SkR8XQGxq0WNQtsR2IOJDWaHyCA9uNTQ+J+iGjQMCRZI16F+T
         C8uQmc8IWqXfRYTilUVuBeW1k3KajOCsCCgve1zCpAdwYKmzgNpYS+ez0DmhNSSt6Xhy
         VR+9UBgCQOphnue+UWIsbNgtofdZxCQiHv6PpvLO9Z6fplVoePvnxoAV/KRNCDtzNv4f
         5mhw==
X-Forwarded-Encrypted: i=1; AKwUvBy90RpF4KfgfXfrjV5sYEnyEKSIl0mreqOZXLJqVre593AUCGQnVBFVukaXO5TL61XIdAhOw2CJNLNc3Gs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8d77ydUEbPq4DRLCY9h/U37IthcpcyQwESSkqmLQhF/72JvHt
	msd0FDQTUyBaPqLz5JidA45MWHg30g/+1ftCilt2mxfMNBj0wr0J2pg7u8wlRz5i
X-Gm-Gg: AYBFou3PKs9Ph8nvftoAG2YtnvgXAhLwTBQbiUdUTd9VK0GAODslMP7TQE1urSyd+K8
	oHz72Zxdr47I9Jh970ghPbDK0LEyoI8NtwzFePfpyPFzfHnbDvkqqN6AJuGLdeLQ6nCY1nMoVYZ
	OVRn5ZjC9zmSrayedUBn7j+Dsaw9nhRuQVH0l9MJUzY6NSOm1KwzerUX9uQ2XE91wmtm3cjQUp5
	l7LHxjZu/zW5gajnE4RiPomEmTIwpJ+waG/7EM6offQ7Tp/FJxpAMogGeje/sL4Jg8LKfo1e+Q8
	k06PTGBsR5oSW3tqfezAUvGKZwzk2tDERGJiYr6gZGcf6Joxxrvxkx0CImrSPklKauiM/t1hnjW
	V8lDbV7g/HnpH7BueUy8uXo9rYQ+PoIOJpX7z7fCkVR1dFMAl1FxIXBAaCPHkDWXQInPBsk5V4N
	Oy+uLnCRVUO/ESyQIDfnA3MjKgt3NsWPaWSv5Q2J4sHJDlcrlh+6CVTuD+D/nnjky7iuQaKzIuG
	GB8/cZerm+YhONHQKRQzPF9feOuctCPBTTsw/WxNVx5P3jkDbYtQMa89f83vYri25MyPckg2Pz/
	rwWDv+PEjd8=
X-Received: by 2002:a05:600c:4897:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4ad5ec2d3e4mr119187675e9.1.1793649304692;
        Mon, 02 Nov 2026 11:55:04 -0800 (PST)
Received: from localhost ([2620:10d:c092:500::7:f93e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm10422775e9.1.2026.11.02.11.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:04 -0800 (PST)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Mon, 02 Nov 2026 19:54:49 +0000
Subject: [PATCH net v5 1/4] netconsole: finish enabling the target before
 releasing RTNL
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
Message-Id: <20261102-netcons-fixes-v5-1-bdada2f03563@gmail.com>
References: <20261102-netcons-fixes-v5-0-bdada2f03563@gmail.com>
In-Reply-To: <20261102-netcons-fixes-v5-0-bdada2f03563@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

netcons_netpoll_setup() publishes nt->np.dev inside __netpoll_setup(),
then releases the RTNL and waits for an RCU grace period before
returning. Only after that does its caller store STATE_ENABLED.

A NETDEV_UNREGISTER event landing in that window tears the target down
and we end up storing STATE_ENABLED with a NULL np->dev, leading to a
null-ptr-deref in netconsole_write():

  BUG: KASAN: null-ptr-deref in netconsole_write+0xb9/0x7f0
  Read of size 8 at addr 00000000000000a8 by task pr/netcon_ext0/135
   netconsole_write+0xb9/0x7f0
   nbcon_emit_next_record+0x501/0x550
   nbcon_emit_one+0x10e/0x170
   nbcon_kthread_func+0x2ff/0x3b0
   kthread+0x199/0x1e0

Store STATE_ENABLED before dropping the RTNL lock to avoid racing with
netconsole_netdev_event().

Fixes: 2382b15bcc39 ("netconsole: take care of NETDEV_UNREGISTER event")
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 267254f046de..7dde00eb8e98 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -552,13 +552,16 @@ static int netcons_netpoll_setup(struct netconsole_target *nt)
 	err = __netpoll_setup(np, ndev);
 	if (err)
 		goto put;
-	rtnl_unlock();
 
 	/* Make sure all NAPI polls which started before dev->npinfo
 	 * was visible have exited before we start calling NAPI poll.
 	 * NAPI skips locking if dev->npinfo is NULL.
+	 * Hold RTNL until enable is finished so we don't race with
+	 * netconsole_netdev_event()
 	 */
-	synchronize_rcu();
+	synchronize_net();
+	nt->state = STATE_ENABLED;
+	rtnl_unlock();
 
 	return 0;
 
@@ -589,7 +592,6 @@ static void resume_target(struct netconsole_target *nt)
 		return;
 	}
 
-	nt->state = STATE_ENABLED;
 	pr_info("network logging resumed on interface %s\n", nt->np.dev_name);
 }
 
@@ -1079,7 +1081,6 @@ static ssize_t enabled_store(struct config_item *item,
 			goto out_unlock;
 		}
 
-		nt->state = STATE_ENABLED;
 		pr_info("network logging started\n");
 	} else {	/* false */
 		/* We need to disable the netconsole before cleaning it up
@@ -2667,8 +2668,6 @@ static struct netconsole_target *alloc_param_target(char *target_config,
 			 * otherwise, keep the target in the list, but disabled.
 			 */
 			goto fail;
-	} else {
-		nt->state = STATE_ENABLED;
 	}
 	populate_configfs_item(nt, cmdline_count);
 

-- 
2.56.0

