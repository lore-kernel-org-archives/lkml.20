Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEFE3368B7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386099; cv=none; b=uuIpn+L7sMp4TdXXaAsofE2Cpt9wD3cnV07y96J3cbXRViGK8hwSBvHKe9tJjEZitF4dPsmShJx1ajZIeDfNse8D4QjvqoVvSnsytiqh1lbCK+a2qAhO8RelnICv2A2w55ptXu93Mznbh8LpEuxSX2MeLmGWpkimMUXdF48FJPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386099; c=relaxed/simple;
	bh=TsKEM23vrGNZP59nClNAGbEF4QPHeuq9r9xlzWpsDi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEdMcjysWD9LZczPhuxgwOkFDqvmRLDsawkZPBe6y41QT/QRv5RMYP8unFyQMaLfpaywW/CSDpt8kXuBNyenGQ74y1FHo8t0mIhFAVC3gvZPHRi2wf2BfyNGmTZi+gDjpSBX71nVUgrXmEMtTHp4cU6eBZOzIoDHhdsIaXgUyOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmRIuzEj; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmRIuzEj"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4923c9429so705194b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386096; x=1790990896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKazThAjDvEancv5DllE0t7hYEI/Pi0fz1aTpnksd5Y=;
        b=mmRIuzEjQ4ofmZmP4vOP7quIcZdDsgsU/UezqAP7IRD2UtAx/csfEruLphAHn5bEqc
         UTmfm6akgi1FKnKpoGWbL3su8Jxftbs1jtcaeKkKBudZGzc5faaZoyGXJ3pgOL2coin3
         22E0RJ5IExUlgOJZHW6O4+p+GWGQxkMTVqKnstRGrQcOJVuPzu8NC39xElfMkUMcILb0
         qVli6r7EHZeIjgxhxt9qAC5tBDmU05+G+vqdmz3C12Ms/X47OSh6JgBWd2quIWSO03R5
         PAp7B4OhYNqMisXRt9/VsuLqT8UQ4H1daarAwSHdlsMD1fcqhYco3Yyc9TPzPhvVuUtB
         UuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386096; x=1790990896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKazThAjDvEancv5DllE0t7hYEI/Pi0fz1aTpnksd5Y=;
        b=1BxdcPSMOyTyWkX58kJwNLSs/nlqFlEEVoRrPCD81r7QODPHtkDxaaep5GKuBSfSgT
         W/9T4xhNSUB4Pd+gukcOPJBTSzCzM2jgHw2UXS2KoVH9jTBDKBdrWgSL2e91SUxGdaLr
         ZSOAnJcObDtnBb7odA7XV2bhx/SnOE/u2BMEfLQLL98XooppsBN5grfkq7nn6ODMTUah
         ApV9HlKu9J9tZ4Dnv513nYimtbPkZuEkG9ij2hoQ6qaeHXoKdycjzhqCkUeAlfOw1Fvv
         Dfpw4frIrMMoN+ZS1pLNEhhPcTP5KzHiHezsQifn0JO9WidSPT8Q7p05auFduh28VAFT
         M3oA==
X-Forwarded-Encrypted: i=1; AKwUvBwouq39VtgOBFHhHqGZdqQ/crzSlfpikf0LJA4hKEzUUhSPDDSf46xZiXgAf+MLgexjfwMu1kUP2jUfz4U=@vger.kernel.org
X-Gm-Message-State: AFuF++mUsgdpG8Gw9tqlMK4V4rWlDzpLzi8ZZsMYGzBVMJ7mlrJWds1m
	5iBsA8+c9v/n2bgtAmnWDdXfZhWISHrCR/rZjTp0i4gpxBdwUcH4TtV4
X-Gm-Gg: AYBFou1EP2a8AHiVlin16BldOBrpt/QX+gzsNk1f4OqKrqjAjZBtFM8A1lxvBmHT/a/
	8GVd7odafYAGhdDaiVJloxlAEPpPeld4arZP0KoJD/2uUIs8x7TBpwjSQ0nTHKZdnJx6XetcdLF
	4VHo4ovWZeJGjNCubwb176xaIr1n2mhGthZFZ5exaa8YRDzjymT4BfKQCG1mlw9DApdvHG/VDvC
	yKtcKOlyYElCbLcbDh5MlZLNblHT6zNAiSyrhEStRngii+tlFzekBY6zGnIpdWfi78FA+4flwi5
	1Ep0Gx9MWeC9/PsZqwcpCJE1CBnN3qa5U16oEzGXyM1NAWyBDYvIcUHSeCb09cVuQaA5+q2mWYM
	9ZAlysN2VSYeypumiKfJgl4hB5hAKMil5Z42NAW+4MQcDVfOEsP05+PlMpCieO/9GBnmcnwG6LD
	n+M7iBrVVyZlPeW0lzlHKjUU7Mq2ZLcraNBE+QHAKRLzIdRQu5rwaaPoIoMtKNw/ipGD5z
X-Received: by 2002:a05:6808:13d3:b0:4c0:12f3:6007 with SMTP id 5614622812f47-4d72892496fmr9250533b6e.4.1790386095748;
        Fri, 25 Sep 2026 18:28:15 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbfc14afcfsm3569233b6e.18.2026.09.25.18.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:14 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 25 Sep 2026 18:27:58 -0700
Subject: [PATCH net-next 3/4] net: psp: drop psp assoc clear in sk_clone()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-psp-defeat-v1-3-9f0b430107aa@gmail.com>
References: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
In-Reply-To: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

Unwind the change from commit 1d2929d0850f ("net: psp: do not inherit
the Rx association on clone"), now that assoc state cannot exist on
listen sockets.

With commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between
ehash and lhash2."), and the change in this series restricting PSP assoc
operations to established sockets, this state should be unreachable.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/core/sock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 2948dffcc3e1..d7ddd365abeb 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2496,7 +2496,7 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 	RCU_INIT_POINTER(newsk->sk_bpf_storage, NULL);
 #endif
 #if IS_ENABLED(CONFIG_INET_PSP)
-	RCU_INIT_POINTER(newsk->psp_assoc, NULL);
+	DEBUG_NET_WARN_ON_ONCE(rcu_access_pointer(sk->psp_assoc));
 #endif
 
 	/* SANITY */

-- 
2.52.0

