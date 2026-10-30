Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334237;
	b=HiC4k1MjNEm+UnaOfDaRVclb/cKOL2WczOU8LhZsiDAWhHQuFvBsgvSF1pQUqKl0gx2z
	 75X/lp3TqBBU0TjwHHfzFPMtupJ9CKxToh54joLvJ2G5X6EwyNKt+06bdoydSyHa5dwsL
	 IuX2Zcl+FRoy6hpRfG3SY9bhGYlw82Q+R7Ttos+eBWIOJ/S59sVbO/duT+WeFsfYtOoLk
	 +T90nxCFwqeObxbTo/iS/SQv07727tTkwX0gL7pjrfq+ij5xhEu8935Jxpq5b7tdMP0Wm
	 FCtVwMR9gjB3zfABUCRMbf7qpu/IYFbZkQuRjNIzuf772nKQj6Gi5Bz8BmNbYdBZW1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RfmKHAdchvYOHXCySZuZqltZmMbPaWi+EET0Jg95xlI=;
	b=1q/UksrmAv9V88ExaJ/DCnDKXQ0e9s352zHzsPGiDDh6JQMALbp2AHkz+UVOfl8233nW
	 rZDaU4Lp/ykaKAlF7n5HGp+wFWW6UEieEti+hRUCmPrdogoaHmPuJIwvtimuHnU1DOPpu
	 utIs5Cw/ktA7mMho3LlKIonh3CjA9uZfxEaEceYpQFN9iHmzIESaE5acMUiv4W2rQV8qu
	 4QZK4ZOWKKGSftAUM5FUmezY1EU+RtNxyOAq8q/JSj/LJ39lgCd+YQRX3RJBBokNnwGfn
	 OTuxuP6IgVlEzB4MRxMrwcqQVl6crw6Vee6hFh1vozY4QIyKbbxMJoCtl7a37X+qZsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Uf43vrHO;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5394606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5394606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Uf43vrHO
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4a451915d8aso215384b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334235; x=1793939035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfmKHAdchvYOHXCySZuZqltZmMbPaWi+EET0Jg95xlI=;
        b=Uf43vrHOpujmfbCf1JhLmSAnNn73CszTnAWFJtS6hZr9W9yuEmdD9OIfRZwBaMGkjM
         obaGsFNR6Pd9PtDvAWv4w81adS4+S+e48LAaI523Tc2ks7O8N1PO+d8T9IIYkrNRaLQL
         EsUnd5Z0a74CNQgYgB7XffH+WLTPilsfRa41I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334235; x=1793939035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfmKHAdchvYOHXCySZuZqltZmMbPaWi+EET0Jg95xlI=;
        b=n3My7AFdI81IPwsgRLyo888nx5adA6pDlUJQHiP+/xT4ArfFQstDgLSF4ouei4hVyR
         tau9Ls2BRAzzH4fbXIRJPU7dL5kIDpa6ZgfAvf8D+B3ohSD3Thf6uHKPeHCEJCPDrcVt
         1+XPwPuoExaWVyXKcmewQ6U2F3EoX9MK68gT2HyMz82t7lblFQEUsqQAXMzskB38faak
         W5XCpE7xj4cx2De8/CFCdv0q4M2JCfd882zG7gHJtqQQGuH+DYnL1nGuKqgYU0lP5tEC
         Oue/HRsOxvXYA0rKoATco23LKelpdljs7ZvxS0ntwHDiXRT8Cj7Vk5KlUnpP5GUUeN+1
         /7Zw==
X-Forwarded-Encrypted: i=1; AKwUvBy+YR5N6J3CM7HYqA/5T55+/7e96VXDPm51uYX6R7ysU73yu2k7CBKpWghXC/LxN2mrtHj3zfRczk3KjPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeAYwviUfWhEd71Vo6SI3VNwrYK+3XhbqjUMPmNkvOniB8cwf3
	G1RTEnarRZjC+QAuWzZRT6QeycMIqR6M2kBP9OprRYxaxrLZG8QxN1M055Ynao1u/AIy88T+U8z
	k2s437QI=
X-Gm-Gg: AYBFou0FQYOktx47HoZKjzkUvJ7Re6T6KRkVsEImW/uZqj48I2oSqHCO9KOT/QKaYhE
	ZGgrFeyzXnunlfyY2/PDgeUhxBeA3ZBbppRiaNZkRHDqXWFvmR/ZqlWcLZSl35jKzpJFN6URI24
	kRX75qt0HEfDJtxQTbQechKEHj7WG5l5VerP96g7UwenBdrhWyxUCWO+Ch9A7/I986EaJ4Skp+u
	nY5CjTw9agj6WSF0zEdnO9lSrnE1DF9gLu1KtEE68pmD/neqCpg4FKtBI/Ln3JBslVcpYFhJkpn
	tXIwmeRPjvpfdCEZHAHrVhpcFSUHT8zPl9i7hwhOAx2OBhOMbCvy6mZdbQ/inZ/GeE03O1GlG48
	lDifdsmhQgwsu9gE31CxK50lNqrHn7l8yHHhQqZO/kd6Ma/pnmu3S0WOpc8epF/whnu+8q8f/yT
	VZsRFKSDmB6lxAwNQYXQ6r25c1p+6suB1o5PHYUjra1bkRtXr1SDVO1KUu+pj+THps/RfPVdlwC
	0R8Day5ZVHt5jtxs5fnq7VDudR3B+zFdNAweEirHa6YgHyBHh5ebRifYkzCeqKemmfU+8JtvYCv
	j5bi9CNhjm7FQZTJAUqTxaZHVX22/ENE7p1ji+S8Cq0HFM74+8pp/qE5tXmbmp8o0JAouGAzs4b
	XC3SFUvnyexPk5JrkCtluzNxv7JDFYfypy/0OOT7iZ2EMynIZqXM=
X-Received: by 2002:a05:6808:6508:b0:4e7:851c:23f5 with SMTP id 5614622812f47-5640de97eacmr799218b6e.59.1793334235579;
        Thu, 29 Oct 2026 21:23:55 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm783863b6e.2.2026.10.29.21.23.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:23:55 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] xfrm: serialize SA activation with state deletion
Date: Thu, 29 Oct 2026 21:23:53 -0700
Message-ID: <20261030042353.74606-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

xfrm_add_sa() publishes a newly constructed state and arms its lifetime
timer before marking it VALID. The final VOID-to-VALID test and store
are not serialized with state deletion. If hard expiry deletes the state
between the test and the store, the store resurrects the unlinked state.

An input lookup which found the state before it was removed can then add
it to the per-CPU cache after deletion has removed the cache entries.
Once the remaining references are dropped, the cache points to freed
memory.

Take x->lock around the conditional transition, with bottom halves
disabled as in xfrm_state_delete(). This preserves DEAD if expiry won
the race. The same protection covers UPDSA when it installs a replacement
for an ACQ state.

Fixes: cc01572e2fb0 ("xfrm: Add SA to hardware at the end of xfrm_state_construct()")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/xfrm/xfrm_user.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index a2587c7e796b..b47e5952f619 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -1068,8 +1068,10 @@ static int xfrm_add_sa(struct sk_buff *skb, struct nlmsghdr *nlh,
 		goto out;
 	}
 
+	spin_lock_bh(&x->lock);
 	if (x->km.state == XFRM_STATE_VOID)
 		x->km.state = XFRM_STATE_VALID;
+	spin_unlock_bh(&x->lock);
 
 	c.seq = nlh->nlmsg_seq;
 	c.portid = nlh->nlmsg_pid;

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
