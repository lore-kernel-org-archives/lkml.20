Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012582;
	b=BVqRVU75BFzRywcZRZKoJ1udEY3JBXfXnNb//pTXNbU7Zf5V1cyYSAGEn9VQzdm7KWYb
	 WDIzKfoY7lt67WdEA3KGG+DM4KAjKxXxq21Fnh574Z8DwKSiTHO25q/9oDItjEpvGan3t
	 lhXNse19T/b8Hz49shxq8mf5Fur82W2UX6qY1j3laExCLGiozO/MxqYHUueGWbd/QZrkB
	 TgYf8AiDYzALTTA0BWKSTcKbthz2ROYg3nJK/OaxJlraZYMfKjynZTr4FBxnD+PQUbAso
	 CpcjG02LhOY19K2kx0K960Y5+Fl6pvzuxDmKvhlUAOZ4SEfjsV5UDqR12DnCOxAq1gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W6UdDeYYycrdIuoZVPp14+bHtZX/0C9MDOpCvhR20kI=;
	b=2pvtHvhtspbzpW2Atm/VNDtXThfqku8URpQjCmZwJkO2Q8nXzDCQrW8+/UoEm5YxhZ9W
	 6JClLsTfHN795Tfpx+DJ8Xpwm7lFd3efAC9iek29wd7mw6MWUUJg0dLItfmKTscL6kYnn
	 bWHw0pDnG1cm70zhgPsDw32xV5WtNKtHcBthX3SMJ1acxq5jLcXz6stGeEoDrPTVuz6n5
	 VM/cnelrAXVCa5Z/iSLpIABSQimUsOVQfPG8ZUbTi4ItQyebNaxRzffbeb3voV8/MGZgC
	 BILYfiu+HPFJpbtQYM71N/aXWklQUmMZnCmgqk33XAUmoWm2fkvextIifnLaFULrk5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=wvkgMr+D;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFAA606F9DA
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFAA606F9DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=wvkgMr+D
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so2091497c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794012580; x=1794617380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6UdDeYYycrdIuoZVPp14+bHtZX/0C9MDOpCvhR20kI=;
        b=wvkgMr+DOsdWJAbuLDkMmSnYwrYhaqLv2hfnZYukNU0o/7U6gxC/sJqVya/bKHJ+Gm
         fwVDaVQuKmb6tHuCifIkUDvKHLih7iwRHTckVgmtz//ErXvk7XFXbXUPiu0iZD387gM8
         brP/JawGJ/y+BFlhAKK9qV4OYVFDkTRW9buxmsyQHkmBZZtMyz+cjdGFr51ixGdBvm79
         IpvO2zg08hW2hPsFz+VF5vi0ZtRfFUvK2MabZm01tNxio+0mf29b125yuJplJuviO4k8
         ZsYh0ijQ3j9i+yF68TfbOgb5xdZxVQRLffl5npOaVBZferkOTd1k8AbX+wEsQqzkEwWI
         Zfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012580; x=1794617380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W6UdDeYYycrdIuoZVPp14+bHtZX/0C9MDOpCvhR20kI=;
        b=k+v19DHSy9QPjQ9X04Fqy34DRehSsN4U7YpYD7n6v8a+/5YE4X9AMGH6a/lbfbrrnf
         kkMCbRKsL9Z99WDELpXurGU/dnotteS2WgNPFR2fv29lDLZe1WVrgsgHErNhzk9mOZZw
         KpmjiD+JLf4x38x0CSZ8S66z9mKsmh2gg0kv3/VbOh+5TRwmc51hG9/vE7tQCbYH770g
         u0lNS2Pe6H62rsAO8+21q+0gR3q9mzKWuTwsFAyGSaIzvq/LyWjHnxROxTX8mO3mrBnh
         MtTAyktzDLFQ8MvKZS9OKWknp6BtpgMa2NjnWNfYkdIAH2opaH+m0ADQRIMGaEmU+pGw
         YU3g==
X-Forwarded-Encrypted: i=1; AL+hErG/oU68PKUG9VWVu3DkRIz0tCGR3Q6Kxwv0cUKh4MCjavl9Lg+BbUwSw/5UW0gLq3uV8i/XXNacMUc0cTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+r8+c0uGKxbmstyCplB7EUDbe1kH8aajk4YvIHHbacwztEGfC
	xiP6JZ6NSM1Um4PuGid+M1wLsS4PS5UuJzuOn9X2jqD2zLGrkfkZF+Vs6R/1LHZwImA=
X-Gm-Gg: AYBFou29hkx7SULQlJ2BtFQZxnv/q4SOlnlQB/vq1kfEfEvv7z3/QaKqCaLat8kb5lq
	WczOuZeZCBsz6hrQrGwgv4sgOQlOJl8qzu8fQB/DSVkhtj6DQm1fm5Ej5iDHDnkFodAtvtvJCwT
	P5zzT2+xTgA7lhYSuhfl7W393ufT6tZfoUe1zltZUFsg1tP5VKy+ZJt+KdsqQIxLKHoCVsC+y/H
	uPJnBQsGiIcu5DW8ses2V6L/jOJX2MPdHnYeOC1yVge25y4oSmDaeDNFb1oxou1L7/EaJsFvfAW
	hweSeKbcdbRw1ZmiuN8gWf3kVoZWl5irPoEdz0i+a+QBXSrU3Xuc8Ziedbie+/UlXSlAisGTb0G
	sjYQ6Zb8UatIDR6+tDmZowbymxpibgDd1Va51+9UJjXVyugpbeYKAT8jY2ckGH/1lOL+JCSlXUj
	4UmL3Y/TGUca0WBdV3dWxcH3qxihHJfKgz33LR49cKemsN0ZSsg+xl+8OlcCsQKsz/FLS9h4gY2
	3j0Um/mg2/GnK8/Idcxre2Y00NKG4LiNrGpEOi8E4TLkazlWyx+Ld/hbQlNdXbEPMPrq5U0Ouqr
	vU4CSAsc6T5A8vU8Q4qWl7Je3W+gwKToEfzlM/ooY9/QzdLXFkwZJ448o2WqK4d+bbM5v1Y=
X-Received: by 2002:a05:7301:4605:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36f729cfab7mr5026586eec.5.1794012580134;
        Fri, 06 Nov 2026 16:49:40 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm11021294eec.4.2026.11.06.16.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:49:39 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH net v6 1/6] amt: stop receiving before amt_dev_stop() tears down its state
Date: Sat,  7 Nov 2026 00:49:30 +0000
Message-ID: <20261107004935.2627329-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107004935.2627329-1-omar@blockcast.net>
References: <20261107004935.2627329-1-omar@blockcast.net>
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

amt_dev_stop() clears amt->sk and waits in synchronize_net(), but the
socket's sk_user_data still points at the device until
udp_tunnel_sock_release() clears it afterwards, and nothing waits for
readers then. An amt_rcv() that loads the pointer after the grace period
can still be running once amt_dev_stop() has cancelled event_wq and torn
down the relay's tunnels. A gateway can then queue a received
Advertisement or Membership Query on event_wq again, and a relay can
link a new tunnel from a Request and arm its gc_wq. Either work can then
run after the device has been freed.

Clear sk_user_data before the grace period, so synchronize_net() also
waits for every amt_rcv() that can still see the device. Once it is
NULL, amt_rcv() drops the packet and amt_err_lookup() ignores the ICMP
error.

Found by code inspection; not triggered.

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 81d26ef82..3a703b79f 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3073,9 +3073,14 @@ static int amt_dev_stop(struct net_device *dev)
 	disable_delayed_work_sync(&amt->discovery_wq);
 	cancel_delayed_work_sync(&amt->secret_wq);
 
-	/* shutdown */
+	/* shutdown.  Detach the receive path as well, so that once the
+	 * grace period ends no amt_rcv() can still see the device and queue
+	 * work after the teardown below.
+	 */
 	sk = rtnl_dereference(amt->sk);
 	RCU_INIT_POINTER(amt->sk, NULL);
+	if (sk)
+		rcu_assign_sk_user_data(sk, NULL);
 	synchronize_net();
 	if (sk)
 		udp_tunnel_sock_release(sk);
-- 
2.43.0

