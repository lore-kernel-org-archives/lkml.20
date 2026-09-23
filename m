Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A58D47F3C9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157283; cv=none; b=sdAEvRXZF/7R6vu4IVF6kKZqqgs6kVkmPk/FxauSJ5vja4Q+85dqXB8rpDe/BFN4S8z6sEcRRIJ0/Fu8uPllf6+4I5gYe5huzWmt9LFawiwfMvATP4UvB8mAsa8NinVwEO09X4jX9a+wNbZkRl9z+Fwk1JM9oh5Hqm6w5JMoxxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157283; c=relaxed/simple;
	bh=+HYS3dvKzoXKXK40VmtMXbgr0IQRMY8SAmPFPgXydIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3ai08m4tPV2vDMw377kzFpwpRQWi1R4zt/VA5lVy+MGUGOVRhexjsHxiQBuJAJrKMwRoeNfJv5n3OWefgi99LV0DZt3pDrtiDWjHePipEOpQa5Ajt0/c7k/VjJRn/kiNUHrAbd3CsNoSe5z6IEJuC6XuvgXDJJqf53bTz5POUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=WUBJPao1; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="WUBJPao1"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso351254a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790157280; x=1790762080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcjbznsDNqQjucWemj8GXAQz8O/NVaZRIfNms8EzTJY=;
        b=WUBJPao1nKCo6+v6kyemAzTI9rLczPqkO1XFflfuRQBEx37DSl7CId9ytkFjc5pMei
         sdUvomRgPXuj/sIQT4AkMD/O+4N6GrkqvMVQ2EDlj57PVMGE4CD8Jn4pk0FA7DGFTb9j
         fTCnlsdJiXzTkSlB6vpdAjbCypz/5RuHvoEJH/zVZJUtgmsP3/t4Y6MbZdHSZmLRvSFF
         W0Gylz09fUihZkUk6EP5OlAz6HEc8LJ8meMHrLocHSTdIPWUtDXQGKrtkK1WFHVyxBfW
         ZwJA1ekPG8q1kdzcyzxbKK/nR//MxJFPw28isSuKObJAFVR0ofL1fsZXhoDkUc29FI7n
         7I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157280; x=1790762080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcjbznsDNqQjucWemj8GXAQz8O/NVaZRIfNms8EzTJY=;
        b=lxvioY+xmYm9/ya9/HYagjelCjUj4ToqpZUQ9sN4qWk9SS2k9VQ6qxGe20vZ24JYFX
         SvwFxYZxVy+I3j9+gZa4S5G4Pb3VKdsF403LfsMPbPl99sSoUmxK+9qCCGjLtV1JoAPL
         A4l6WGAnu7lMX8vtbII3rgrLCGlBJtv7q5ANFgv1wFXncKwxw88rFajbpCpD4jhhtkn8
         Sme4fHrNOc2wrjra1KbNvd0vch1CeTmM/brgk+ReK73EEzzQUdcPftKMhyJB7TkKWfRj
         vF867itguroLmHSfYevx4RgVgvUqNY8n6uW9tWWzXNxqsSUSrE2JbN0yCAnF6lNDsN8V
         6udA==
X-Forwarded-Encrypted: i=1; AKwUvByKEsGxl4Aja2hYWM+zj+6Xx8R/VBR5zuFU2OMI+MgnpP4j5nGBgUSTxumCAUvq6EWlmsLMhUo1frXGVng=@vger.kernel.org
X-Gm-Message-State: AFuF++ndOnJwc5+Am7y/+W6YennIlXi3IZayE38Pn5ck3+sDHi9/wRb+
	8BsMYsttJE7E96zZkjhga1Rj1eSuX+3nAKaqYhEmw4nytfa8BtK6GWUF+MAKf01XXhrJ
X-Gm-Gg: AYBFou3GK+IXXFNGkzQNpfttOXKStIqEnOWwfkUdebC9eN1V0DVR6o1a0eBOEkV6wwT
	dS2boOmhT4/KaUp5NzUByVToDZ0UD6nbqmkON/Yutcqqs+yxh4/IsIQ7iKsJ0gE+D9riWDI7pUg
	dc6+YoEqxeK3NBoMsQ440j1ivx3lQrAJNJpAYxd2LO+s8YIgH+139SKOc14ETfpg1qlNqCTfFN2
	1aZdpl9NMrtvk2pu5cFKkyzDtJPRfY8tyHZNS9UCwsBSmsSvFhyv7ZAr1C+ZwArbV6BOHL9d0tk
	ajdc4bP6s66x8bYB1jGohVAGj8Qf1m327fcaJNOuFflkPq9KDRpzKdfdK2scZ1X2G/Po/xV/4wn
	f0DpDl1/FCxQTzGWK5fhsmp6KuOg/kuDMqEfbRCEMh834DMTwPRuu7a5F1ZZaUuOxQAgwuF8LVt
	X0NVn4U/mQLNyyUlKbVKiGv3rCX1frpico6WQ0Rddo9zB4xG4Z+mxg33tkIVFwWQxjeylxBK2pi
	/EsRMFreoC8HRjzGUdRdiIpIW5SAg==
X-Received: by 2002:a17:90b:164a:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-3a07e568a6fmr1766161a91.14.1790157279865;
        Wed, 23 Sep 2026 02:54:39 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc5f3d7sm4793862a91.16.2026.09.23.02.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:54:39 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netfilter-devel@vger.kernel.org
Cc: netdev@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	horms@verge.net.au,
	ja@ssi.bg,
	zihanx@nebusec.ai,
	pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH nf v4 2/3] ipvs: avoid stack overflow from recursive connection expiration
Date: Wed, 23 Sep 2026 09:54:14 +0000
Message-ID: <8d33e2a83fa6f2fb6419b3f34cd3ff8677684a31.1790146910.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790146910.git.zihanx@nebusec.ai>
References: <cover.1790146910.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a controlled IPVS connection expires, its controller may be expired
synchronously if it has no remaining controlled connections. A chain of
controlled connections can then recurse through ip_vs_conn_expire() and
exhaust the kernel stack during namespace cleanup.

Continue expiration with the controller after the current connection has
been fully cleaned up instead of calling ip_vs_conn_del() recursively. Keep
the expiration walk under RCU, preserve the immediate-drop timeout for a
controller with its own controller, and switch to deletion mode before the
next iteration.

This keeps controlled-connection cleanup synchronous while using one stack
frame for the whole chain. The timer callback race during connection
deletion is handled by the preceding refcount fix.

Fixes: f9200a52eedf ("ipvs: avoid expiring many connections from timer")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v4:
  - Rebase the iterative controller cleanup on the timer-callback fix.
  - Keep the controller walk synchronous and switch to deletion mode for
    the next iteration.
  - v3 Link:
    https://lore.kernel.org/all/cover.1789877273.git.zihanx@nebusec.ai/
changes in v3:
  - Handle the timer-callback race while keeping controller cleanup
    iterative and synchronous.
  - v2 Link:
    https://lore.kernel.org/all/cover.1789435989.git.zihanx@nebusec.ai/
changes in v2:
  - Replace recursive controller expiration with an iterative repeat path.
  - v1 Link:
    https://lore.kernel.org/all/cover.1789110326.git.zihanx@nebusec.ai/

 net/netfilter/ipvs/ip_vs_conn.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/net/netfilter/ipvs/ip_vs_conn.c b/net/netfilter/ipvs/ip_vs_conn.c
index 32cfc02aa2912..f85752e79ed92 100644
--- a/net/netfilter/ipvs/ip_vs_conn.c
+++ b/net/netfilter/ipvs/ip_vs_conn.c
@@ -1357,6 +1357,9 @@ static void ip_vs_conn_expire(struct timer_list *t)
 	struct ip_vs_conn *cp = timer_container_of(cp, t2, timer);
 	struct netns_ipvs *ipvs = cp->ipvs;
 
+	rcu_read_lock();
+
+repeat:
 	/*
 	 *	do I control anybody?
 	 */
@@ -1366,19 +1369,20 @@ static void ip_vs_conn_expire(struct timer_list *t)
 	/* Unlink conn if not referenced anymore */
 	if (likely(ip_vs_conn_unlink(cp, my_cb))) {
 		struct ip_vs_conn *ct = cp->control;
+		bool next = false;
 
 		/* does anybody control me? */
 		if (ct) {
-			rcu_read_lock();
 			ip_vs_control_del(cp);
 			/* Drop CTL or non-assured TPL if not used anymore */
 			if (!cp->timeout && !atomic_read(&ct->n_control) &&
 			    (!(ct->flags & IP_VS_CONN_F_TEMPLATE) ||
 			     !(ct->state & IP_VS_CTPL_S_ASSURED))) {
 				IP_VS_DBG(4, "drop controlling connection\n");
-				ip_vs_conn_del(ct);
+				if (ct->control)
+					ct->timeout = 0;
+				next = true;
 			}
-			rcu_read_unlock();
 		}
 
 		if ((cp->flags & IP_VS_CONN_F_NFCT) &&
@@ -1405,7 +1409,12 @@ static void ip_vs_conn_expire(struct timer_list *t)
 		else
 			call_rcu(&cp->rcu_head, ip_vs_conn_rcu_free);
 		atomic_dec(&ipvs->conn_count);
-		return;
+		if (next) {
+			cp = ct;
+			my_cb = false;
+			goto repeat;
+		}
+		goto out;
 	}
 
   expire_later:
@@ -1422,6 +1431,9 @@ static void ip_vs_conn_expire(struct timer_list *t)
 
 		__ip_vs_conn_put_timer(cp);
 	}
+
+out:
+	rcu_read_unlock();
 }
 
 /* Modify timer, so that it expires as soon as possible.
-- 
2.43.0

