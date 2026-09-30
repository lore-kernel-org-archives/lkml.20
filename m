Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13D24C33C2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812023; cv=none; b=vC2I5k4Bu2JsKsi9j/goODfQOKkX5B5R3jjikedLDLYwryTtGiiq+y2aCUT5O7rFnJYqSHOw012lukUKA0+dVFbaNMOAIn2p8yVMrxnb+rxX+JM+l+YeZJ7MjMVLNXGgIfRE47FFBicTF2ZJWNfzL4uv93AQryFGYMgEuP56+6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812023; c=relaxed/simple;
	bh=TsKEM23vrGNZP59nClNAGbEF4QPHeuq9r9xlzWpsDi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TO600jZyLUsyUnwjuoWApBn3g7L9dhSUbijVDYZ5+KeD1aU1z5tDJQJ4FrelOPd6MeLH2PNWwNRERaKYu/f2HucaL3o3Y9N7il17FiIQhlNWms4J3vCujy6WIOR9k4swCr55oiD0EwPRwtC/91TrWjsp113wF9Q4o8oCtg1BiIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUX1kLeF; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUX1kLeF"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-81d10e0cc02so1544065a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790812019; x=1791416819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKazThAjDvEancv5DllE0t7hYEI/Pi0fz1aTpnksd5Y=;
        b=FUX1kLeFelJ/FZlVzCuvg6arDKp/L41BWts37Udf+dlXucGs0pnjVP48wCPcPfMw7D
         lENgOg67FtmVvvyxvBXyjX1yJa2+itG07uF8HBUrednPzKmaUrHOcb5/DBBQj4UsvUH+
         w0/VuHE0WSaKGLBAfm4dfPD0n9vnBo29pTtTo8xLYxr3uU2vWorffwJ0ZYGAhFwVxjTm
         j9JmFu5z4TMXDPHUYdtIuVqlcZeuk6H7Sioa+ptqm04NDlB1JqRhh6SIlUUOekUJGo5w
         tf6LUaLelZGZRQrTkqfH2Nk6EsKgeq/jfqXMP0dotfFwJIHtK+dR+ynqnWZ6FPNXXqzn
         mycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790812019; x=1791416819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKazThAjDvEancv5DllE0t7hYEI/Pi0fz1aTpnksd5Y=;
        b=Kw789qOV+0MJN5yQvHpdu4lXAyPSJQvCFOFROJgvhJgVZJaqewzZt625jtSPbk6gA0
         x0lh6w8isMKVGdb8VwSo8VFhpi3M9aKuNBP04czPgT0SrefMdaVQpTh87/DHbAlDABUr
         kl+zgAqScGILtaHx3hHxsyX7WeYWSyJJD6oKz231YOAJSaq4btFSOPZ76U9sYpJwMzfD
         J9oBKCqhkF1SUIm85/wHF5sbApcjr1tohljGoguGVA3nC8SZGyJi3QFf/fIv5wVdmVLA
         1RRECaCFfeacl0fq4eECEGZPaYk4qURPVhxxb4LkbMOe4AtUahI3Kgi1OaY6zEFfic6K
         XepQ==
X-Forwarded-Encrypted: i=1; AKwUvBwp6vtxCdJ9W+aokQTPwNb32fNc01zL955YsEkYSACqzaVDgvC+a8oORbn4UmsWYToCuq7yJfBt4mEX7yo=@vger.kernel.org
X-Gm-Message-State: AFuF++me2x3E+2cf4lBpwx7+gJmnmnyUazFj4xjOM0NBwJX/Lnf0VlzX
	cBXM53YO2D2nv0rxBe9dg4S9DDrPgSpTZ7epv7EoA7SOU/N1bvBYX2So
X-Gm-Gg: AYBFou0E6s0tkQkCQ5BgcCTZ7DpyAi8+d6x1m8VEE2R6zrRBmBR0itNMlj13npwReWI
	JCi0Z8oWZy2vxL0FK9yP9Ghc0IDlxNXYoC2s7Cyw3fy65sFVuvjDoJMTVZJej0p6kKTSbJUybIb
	zEjJUL64i9nZDYvg37HlpFWQuyiLB2TZB6EXLW5tIX63hcYoIX/j6DT8mpUhufxQ3gzPFrlZPs6
	1MX2SeK9k2nC2dq7f22muFq9Z3qANr5V2ZqqHN1sE0Lyy5QES8iUjKpGUJiV2lPqRiThRx4uFUC
	Oc2MQybEsGLTiZ2QXXhB1xI7vJGst7yed7d0UhhEHODnCADK9EfMMNt09j+Cog25ZvV7kJHkFXU
	65VLguAf8nDqOmcqgBXNZbRmkTqnJ4hT589ObUMs1QvPua0zyFXpptvEDpsygRRaHmBvR973CZk
	gDiuqk4ARkMMnI273sMgfwaZhGvnukLVgIl6C/LvWyyLia3iUvm3RoZoUZE2kNiFxdbsM=
X-Received: by 2002:a05:6830:4110:b0:806:6e79:c7ea with SMTP id 46e09a7af769-82048f1eec7mr4160685a34.6.1790812019674;
        Wed, 30 Sep 2026 16:46:59 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212ae3ed24sm1348726a34.17.2026.09.30.16.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:46:58 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 30 Sep 2026 16:46:48 -0700
Subject: [PATCH net-next v2 3/4] net: psp: drop psp assoc clear in
 sk_clone()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-psp-defeat-v2-3-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
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

