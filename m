Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47E3BE620
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791310954; cv=none; b=IoaCO519GAqDrNgInj8P2+rm74yoFDkzuYj347pWkwPlvio7ri7sYcglPzztMYi4qKmo8ztzSqK9TR51lsQbdPip10srQqa6psOHsW387JKt11iJoJ69cAM3KfowauUW/nLMnwIVnaGS1j33MJw1j5zgOPaPfg0ecCZoyawSTo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791310954; c=relaxed/simple;
	bh=H8J1CklssDADFFZdBTqNwxpVpzjyPSY4+oJpjCcF14A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOeCLiVRsieweqv3YbQ96n2jXsG5koJcy19lY74WX/sxLcPGOwdbGWvd7rMM1o0eGApFYyr9tfG1b+GFaDtnlPFPJd4fD9qNr1EVMunBH0JSehvsgmUd7IUlZt221db2Lrv9b9Om1oA4AL84AxX7rjnnr7TPklEYI56dY248WNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOIKPrXJ; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOIKPrXJ"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe625404so381562f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791310950; x=1791915750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGsHqVq1QkKngOHYMVcs5wy6reH2MQ+l7ksKX7wcIx0=;
        b=tOIKPrXJ6yvnYJWZhBmnVO4BOTNOWflzEzIH0XLTWS6eCaNd+2QB5NdB00WKTcDwbK
         QWvHzNYpiKCXL9fDRaWW+kqfOYGvDiJXyVMjJbst5viLCfjnK9+cAUMi6kC4Ws3f4Igx
         ugjZARv0q0ctZqab9aOb+e3gaBIFq4q7gDhbpz93U3Y9EMEHdKIiSyERs+3z60Cu4/SY
         JbX/LktZbOAeteiPexPMLIWblkc7ldYnkfJrbX7lxkvzAh4Danft3vXF7t8lho02iJ+S
         NZiGaPZBg0697pTOnjcDhliOyq1MEVPah1vh7EwzD3EeQ8a56Jl64DKUmiVKlGpVuwX1
         9hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791310950; x=1791915750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGsHqVq1QkKngOHYMVcs5wy6reH2MQ+l7ksKX7wcIx0=;
        b=OAUaWk2b3Lo20BDbzzxA9Ri9csZ6UJZELNKNWX1ETSXGeaydo2LKDdGa7JY5XBhOB9
         2OF12E5h2PIUlbxgUf83FvdOgJ6ywvrPRY/aQO4xQDPpsBcl4qK6umsubhFZQ3GS5T8y
         ybp99XKVRRn2H0QzcQEv8ZFvep0eDS0VFJULUEaPYHR/+O6Om/n5JnuQDL1LjxiJMWkN
         1+9A8WNGmaUhKajYkuipKtMiVkF6BPyrTcwt35d+VaMLcMBIukclZqGFZYu1YtjnBT/7
         CGabRj20Zmc8MZGQVVaUfXHKjJ/HEe5/K2f2KbID8igP7M+WpWU5WKSsM5n+MCQ2J/AS
         B5LA==
X-Forwarded-Encrypted: i=1; AKwUvBw51RqeY8LzDz0e/DSImnUNH8t3SwXkeV5+HeqQrxHeh6D0dIYb9UwOOein+c77/syy+gu8luB8HzidfTs=@vger.kernel.org
X-Gm-Message-State: AFuF++kf1Q+TxiAjByAnyA2WAxC6Bd4MOP4A8T3jMOhkWgs3UqA/7Loh
	M0kFOQUpr+lBnd1EJa1qrI0zHPFrlI74v7FCAVX3UvS98Snf11mtmLSEQZvcsdbSLhC3WQ==
X-Gm-Gg: AYBFou2maN101FBAky2Tdi3FecKY7TuAO8/z4MsKFPfU/60G3Dzzeoo7wkedehqI7o+
	rEdpVSLke/83fOT7LlxWDBFB2FK8ysXGeY62Rcc1Tp+lszLAiSIlIQ52krM5z7gf2tIa6p5MD49
	4yK4K7teX0KIE5ezug1RDO4VjQ35h4aBN4ZNOMLRqYWxQBJAeLwFGCVu5KiPAVZw7IXm9kbySCc
	7h2XhUXvEl2E3KnH/y9WwVdhRmUf9DV2VbxC+vqbQYOYTMuJU2kUFBSPI/J6shfr9yhHaILdpza
	g+ku/yGRKW/+Q6iXfviw2Vpg50yGH5n7Vct4NOKXE9Db7WxDI62DyuFM7iBdFk1EribgSG3ACGQ
	UVKo69pRKgdc5z1Lwm0dYUdLQJ0NqY4UIdTMQAfG/2a94SK6zDQmdt5aGcSVF//2uW7cw6uXsDi
	g0knmjr8GsysgEGm9Km7NDHggoJ7Zffpt0hxYOeCosGovyYSh31ULAUg==
X-Received: by 2002:a05:600c:601:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a02744cc57mr169819305e9.0.1791310950211;
        Tue, 06 Oct 2026 11:22:30 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:4701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2eeb6sm989093f8f.43.2026.10.06.11.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:22:29 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Tue, 06 Oct 2026 19:21:25 +0100
Subject: [PATCH net v2 1/2] netconsole: finish enabling the target before
 releasing RTNL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-netcons-fixes-v2-1-ca652d55fd4a@gmail.com>
References: <20261006-netcons-fixes-v2-0-ca652d55fd4a@gmail.com>
In-Reply-To: <20261006-netcons-fixes-v2-0-ca652d55fd4a@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

netcons_netpoll_setup() publishes nt->np.dev inside __netpoll_setup(),
then releases the RTNL and waits for an RCU grace period before
returning. Only after that does its caller store STATE_ENABLED:

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
index b358e5c36735..1fb846ad07d1 100644
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
 
@@ -1067,7 +1069,6 @@ static ssize_t enabled_store(struct config_item *item,
 			goto out_unlock;
 		}
 
-		nt->state = STATE_ENABLED;
 		pr_info("network logging started\n");
 	} else {	/* false */
 		/* We need to disable the netconsole before cleaning it up
@@ -2669,8 +2670,6 @@ static struct netconsole_target *alloc_param_target(char *target_config,
 			 * otherwise, keep the target in the list, but disabled.
 			 */
 			goto fail;
-	} else {
-		nt->state = STATE_ENABLED;
 	}
 	populate_configfs_item(nt, cmdline_count);
 

-- 
2.55.0

