Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113490;
	b=Va0AdFP0lR420fHDJwYYkNdljzhzzAmN+WC3rkdvAsNd5u/puatguNtUWIaX0DGGVsgQ
	 Nzlzw+/+hWD940gDF9taKUBwYqmV7YEZ7AHFBcpO4bL2K4jKADbOSXhpixHOa+9S+FHi9
	 yVUvlORZvV/KuioLWZsgGc238VjRoIb85mztPTwEgjkXqr60sATOthaWi/EzkVD3uqT9C
	 HzdkAEBf70hNTxL/HZm5roWvr9/FaaxIUWo/h0Y5TSQkKISlNaZ03lGKsNTNzHu6JmmlE
	 bN3Cdqss4ERS16fB6XSqsymsxhIJOMClF0q9nWftZuLBkpA8XT5hesMQl+pfXed/5Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=idHmBdkYB+pGsb4ciFoRZd8OmfSYmN5C47UdDtDs8Ag=;
	b=KAp+5XPDHoNdS/4K1/apgbOkTVx2ruNGosz1nyK5YOSouYaQyx7XkfUgT8uaGTC6NKTc
	 MaJ7kt51oNswN6739o46ezf2eGGImlZVvjQzUUBGQiR1OINI/YUImaH7+aj9a5kzKUgDa
	 Ga2WOHnlmzeVZT9bV99PPJxunZiWKjzqtPWql48AO5RYXm7cz8YzrZ1YWQ2X7eXGb4SP8
	 d6zpqRpq3FjIvM8z+GLuvyjCv6Ghu3eNnB0l5JMxA9Vn3fhj3MbLY3GYGXTZhw0xNxoZh
	 nztpeuTxcEICh0BN4ixX5o3GP2q1RpSCh0lA08MVNIbVQkfJdeYeBpiA1sHhAE03lbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPJeWiS1;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4706606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4706606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPJeWiS1
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6ddf6877d33so273eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113489; x=1793718289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idHmBdkYB+pGsb4ciFoRZd8OmfSYmN5C47UdDtDs8Ag=;
        b=wPJeWiS1MqHh+MC1Qy4nsxftqxqYus959w86RlVdZQnsO5f5oh1Py4MCQS/18WhtEd
         0MyW9N/02eePu25tCo/xRE/CKd78CcLihtAzPuMGwG5GTLd2t5bpA3h11IW/lPy3mIok
         AqBcOAXdYKTnTQkFd6jmRfHcFBFnAYfyz1gl6d0E7WYXm5n/xunyXalOQ6FYQS98UWnO
         aT0ZHLIpjdUJyZiH1YGBU6YQqFiS+j1LkfpeG9eec/AXG4PX0J0CTwIFJOdgCHcRozvm
         eoHb0vjgdD4ez2rpVTE4jYD1L0OJhJeHM8XY5ixHC5hFR/zlYMlD8GO7fImsjk/R69ez
         bONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113489; x=1793718289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idHmBdkYB+pGsb4ciFoRZd8OmfSYmN5C47UdDtDs8Ag=;
        b=Tv86eU4E2E8XPu+ZSuQWo1zbouBUvxtWVvECiRQGaH5rEA9MitU5kkakisvwdLLAFO
         /O9zWj5HE9ixtuFzoxBcYuLnAbi0apn9hX1FefjetzP0MWsr8397aUHGtyjI0DiZPHkA
         tbJ5M1InhAPi114GfCQ0g7vX/jyAiZz5AXK5T5cWBznDVJgLLtU6GswS8wO9vTlMutOf
         9sEdsmzl9i+I+/ViWxzFrTqLDJ4DMtBSEd5c074/kCX6cqcyQr51ILx2zwesM9LGram8
         P4LOD70d02qm9RG2ge9UGQ81OfR+PszsRrV6YB+TVwryKDtHzUYU5VnBrwm0stag9unj
         4d6Q==
X-Forwarded-Encrypted: i=1; AKwUvByUG/S2KOJOIORBgfXyLDy4xNQUlT1n5DB1WWDbGXOwq+ncLnVudK6bLNjBelKxq0CTOs1io1sRhV8bRV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+BiCBh/PinnvCcZNZjxSuSuwSc402U36no21tofLdxqxScOYN
	Ri7MIVIs87z23YWoSZRie2K+h8TZkP0SWPQFug24ZcQK0vxYwI8EmN5I
X-Gm-Gg: AYBFou2S29BbfOqs6jAmXFqrmFqGkJU4i3En6XHfsay5886rFDmGxlCCZS4i31bi9T3
	QzLbu93uyOMC/6XLOLWBTiTDeujBrn9uAPM+TpGjYmIBQsdiZu0eWjt6mFZqC/GaK+PQc4Rnijd
	XMtySxwoRAy2gnt8oRmzKDv0UvtTY4p6JnMJdKjH80zpcvYsbIQtv9rSRzxIpf9Q+2LWd9rYU5G
	yCeyUfdmmlXpx6RvKsbuAuwOjbnQHyBPlBL1bDGf0VE1wmpxUbmFYnTTIOjKDblfp3Qhyr/glVW
	yNGe0IBXHeQFrzSrjDQQCc/9KHU3T8w7mnn0Kki4YlhpB6H6T7WklINJ9VuDo/c25Fj4yl/5LPL
	qZ8TR5ASHex0lK/+ppmV3/Dzn36h0qc/OtcT/6WlcRy9mCfMTF1g+RG10UGnyc1YYpg+EJe8Vv7
	SD1DoObPE7JXrDAY7DoNRapkUebKi0w68EvFGysKm3Ab5O/r2YuzgrjHCf+wSlzh86+3d36KzE4
	qNz8MGFE1Du4YLDXCRnit7GU0ev7+KxEY0qX2nI2oJmVNo2gZDQa4eGZXt/YBZiaMsoiBBOTM+H
	Hhjn63DWd83KwKrB+A==
X-Received: by 2002:a05:6820:1625:b0:6b4:117e:545 with SMTP id 006d021491bc7-71269638a81mr1504369eaf.13.1793113488681;
        Tue, 27 Oct 2026 08:04:48 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.180])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71278c864b0sm2824416eaf.9.2026.10.27.08.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:04:47 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>
Cc: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] cifs: fix UAF read of server->hostname in cifs_get_spnego_key()
Date: Tue, 27 Oct 2026 23:04:38 +0800
Message-ID: <20261027150438.943354-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

cifs_get_spnego_key() reads server->hostname without holding
server->srv_lock (fs/smb/client/cifs_spnego.c):

    const char *hostname = server->hostname;
    ...
    desc_len = ... + strlen(hostname) + ...
    ...
    dp += sprintf(dp, "ver=0x%x;host=%s;", ..., hostname);

while the DFS failover path frees and replaces the hostname under
srv_lock (__reconnect_target_locked(), fs/smb/client/connect.c):

    spin_lock(&server->srv_lock);
    kfree(server->hostname);
    server->hostname = hostname;
    spin_unlock(&server->srv_lock);

The read side runs on the kerberos auth path without the lock, so the
strlen() and the sprintf() can race with the free.

Take a stable copy of the hostname under srv_lock at function entry,
before any use.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 93d5cb517db3 ("cifs: Add support for failover in cifs_reconnect()")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 fs/smb/client/cifs_spnego.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/smb/client/cifs_spnego.c b/fs/smb/client/cifs_spnego.c
index 44c4072756804..488ddf6df138d 100644
--- a/fs/smb/client/cifs_spnego.c
+++ b/fs/smb/client/cifs_spnego.c
@@ -105,7 +105,15 @@ cifs_get_spnego_key(struct cifs_ses *sesInfo,
 	char *description, *dp;
 	size_t desc_len;
 	struct key *spnego_key;
-	const char *hostname = server->hostname;
+	char hostname[CIFS_NI_MAXHOST + 1];
+
+	/* hostname is replaced under srv_lock by the DFS failover path
+	 * (kfree + new assignment); take a stable copy while holding the
+	 * lock so strlen()/sprintf() below cannot race with the free.
+	 */
+	spin_lock(&server->srv_lock);
+	strscpy(hostname, server->hostname, sizeof(hostname));
+	spin_unlock(&server->srv_lock);
 
 	/* length of fields (with semicolons): ver=0xyz ip4=ipaddress
 	   host=hostname sec=mechanism uid=0xFF user=username */
-- 
2.43.7
