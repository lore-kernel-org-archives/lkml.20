Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE59A3932D8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199690; cv=none; b=MUAVtb1NMFTaaIdkt7TCi1w/ckjFGz+b9JEd1MFMcFaMbUXdo/zKAKcY2RbM/YoExfTMwNsi59wTBPRFNkTjA2eSc/y3EwfgI+hWEIjszhzTmUrpHr9olTpHzqSelSxhSmrWQMLQe3kimBj2rbALhi54cT9zLc7igCMj5CCg1dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199690; c=relaxed/simple;
	bh=TNScjd8kr86i+OFJyz7elzpkHsuoD5X9vwkXPg3lt+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C3shCNZ6AaS5QSVptUBtGCTuzMB+9dtNzjdpD5IJ98TDwGjiZJQwo53COzT9yHFp3Zwp/klE3o1sEldU7/JA2s5j2fUuSQ1gZkuwcF1Z0u+Dfk5w99jpO/gZybI7AS/IKsC4W1ZFI7+B3Qbk7i+1YQHMRLlK6RArqrvcpV2bBAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8OvVoZW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8OvVoZW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8687630fso27772645e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199686; x=1788804486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WB2wOYhNCQXSPlT46P6AGA0QA3CnchsnjHbaxZcMoTA=;
        b=S8OvVoZWH1xp/DKHuDGfAhpgT06wMYRJnNWUuscnUJ72jDmOmkPAXRazrjVXSQGV4B
         AkaDr+gmPNoIAJwUXIf8twSzGD8sEI4dINssobXZkkkiLPIqKHdi1NJaffyPxb3D5zTL
         Ql1LjWd5awm3JBZ5he8B6a2JKlieQpZFWoVhofS0ydmsevvC6QRlXPALwQwQPP1/uiKy
         /r0Zta9DDF+XX6tyqHD0CZk6aQvFXWQymCqAyUBJ6aNe/LNwkP1qI5n+owUhuRjWz+JX
         /QCK1redtvTkKNjqcTdyQhbA828IfyfY3czY/7HGhQ/ltHFBKl1gOQBJF5/sNRVqpGsH
         r3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199686; x=1788804486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WB2wOYhNCQXSPlT46P6AGA0QA3CnchsnjHbaxZcMoTA=;
        b=DzY+4uLbhsoOq4pReCb8kUb55NL6ebm8syrucgscca9DQFSj4OOzIW57+Wtmcd4DTP
         6rG6Wk/2bEkkaM4nBD7ss4uHg3ty/P8KuV4gLgzG+FeiZ6+ytgTX/4XKoBZ624eKOrHw
         Ps3E7Yuw9B4PTvcfsQM82crklFA5jjRXViFQbFQ2VgKKpKW1oMl3kWRTNS+VDrQKoSZl
         239oTe8qGeoOvtnFk1lkJGig6dx4QiWFEi4Tr9NaLyBd4y+Wai5ftjgegYMbgMy4Bdu+
         G1qjgWNl1vabed4FgaQobYfNIEvcfoShADXYnqwGH+L807uK5E5Qi4TS41tWMXDteoTY
         Syhw==
X-Forwarded-Encrypted: i=1; AHgh+Rrkuk69CkadEGuUF7Ir2GiJv3o/n7gfYBdcH7rk+vxS2Mi+cBpwj31F1xljEBKZY10kdLwKWSylbc7rJTw=@vger.kernel.org
X-Gm-Message-State: AFuF++mYoLvvrjVzacgj/eLiLdeHfLQgEqQlpuf9gwQJI+gnUTEYQbQm
	Ntu48jIG6UL8SwqfwNOnKmJX7KdraXSAX9MwEkJdaaK3V23DODMfqgZu
X-Gm-Gg: AR+sD10WlvADEs8ezZM1vAsjXO71TtMqjx0aVLEvuMPwWC9yawVqXs5k1fohEXYqz7V
	gXtFKtoZIwR2BpOmVdt7Zute2rwpqaGZjP6insGsYDvRhgJyreQtPv/wpCKT8gYUhjCoU261uE6
	n3cOBeFv3S0BwPDFeYcRQhyMBVyqMI7fsD45upqNCBL5QjLvCpgevF9DS+EypW7a2w9J/4DIOJe
	/6hiD8RfV6fRMKAKHF9cHtl+XHdK2ML/WR8bkLk/Kc596nW4yVvj2lXBmI7ZTdcXwn0ud90bjuH
	XO9KzSTHXhGlc8gwTyl8O/Th4hEfZdyJnRV0aAPM7iTYlG//LO+tGH/ExEeI6cdqc68jwSAXvUG
	OyaNJWdiqGxwBH/eahcYtQFgRDRgUO1sVH1ooT05EsJch6cK04zjLJPV3qPQJWPM6wu94iL4XMX
	h1TFtun+7cnpxvS1F2KfdSdF0T24Aprxl8KR6RCxiec3fWtSdjlR7nngwEseRQvX+Foql6nS0dz
	hCa0QkqTlYszb74UtJcbhgg7il18m5/gKc6HN21BEShZAJo29lzbNtxtfFDWiSFiPsBCmvfRcKV
	TROPJKTQYyaVcFUIWG+lwx/61LzQdQYu9DBxQDj0pddA/rDrkP/9qS8LoDN85diwa5R9dSF01Ja
	+j4up
X-Received: by 2002:a05:600c:6091:b0:49c:d60c:74e0 with SMTP id 5b1f17b1804b1-49cdc44a420mr51361575e9.13.1788199685909;
        Mon, 31 Aug 2026 11:08:05 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm251817195e9.1.2026.08.31.11.08.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 11:08:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vasily Averin <vasily.averin@linux.dev>,
	Bin Lan <lanbincn@139.com>,
	XiaoHua Wang <561399680@139.com>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.1.y 6.6.y v2] netfilter: nf_tables: missing objects with no memcg accounting
Date: Mon, 31 Aug 2026 20:07:31 +0200
Message-Id: <a223903ab9e3b19f9b28ee39b338a49e3e8e6f5f.1788192676.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2026083125-bronze-stability-8fba@gregkh>
References: <2026083125-bronze-stability-8fba@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pablo Neira Ayuso <pablo@netfilter.org>

[ Upstream commit 69e687cea79fc99a17dfb0116c8644b9391b915e ]

Several ruleset objects are still not using GFP_KERNEL_ACCOUNT for
memory accounting, update them. This includes:

- catchall elements
- compat match large info area
- log prefix
- meta secctx
- numgen counters
- pipapo set backend datastructure
- tunnel private objects

Fixes: 33758c891479 ("memcg: enable accounting for nft objects")
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
[ Karl Mehltretter: The original 6.1.y and 6.6.y backports omitted the
  pipapo_realloc_mt() hunk. In these pre-refactor trees, the corresponding
  mapping-table allocation is still part of pipapo_resize() and uses
  GFP_KERNEL. A/B tests on 6.1.186 and 6.6.155 measured 524,288 additional
  charged bytes for a 32,768-element two-field set. On 6.12.107, the
  corresponding allocation was already accounted. ]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- restore Pablo's authorship, original changelog, Fixes tag and sign-off
- document the older-tree adaptation and exact A/B accounting result

v1: https://lore.kernel.org/stable/20260831043755.29692-1-kmehltretter@gmail.com/

 net/netfilter/nft_set_pipapo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nft_set_pipapo.c b/net/netfilter/nft_set_pipapo.c
index 7c8d28a031ad..8ba76eea3eb1 100644
--- a/net/netfilter/nft_set_pipapo.c
+++ b/net/netfilter/nft_set_pipapo.c
@@ -705,7 +705,7 @@ static int pipapo_resize(struct nft_pipapo_field *f, int old_rules, int rules)
 		return -ENOMEM;
 	}
 
-	new_mt = kvmalloc(rules * sizeof(*new_mt), GFP_KERNEL);
+	new_mt = kvmalloc(rules * sizeof(*new_mt), GFP_KERNEL_ACCOUNT);
 	if (!new_mt) {
 		kvfree(new_lt);
 		return -ENOMEM;
-- 
2.39.5 (Apple Git-154)
