Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14923B0587
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621589; cv=none; b=tKOj4oSnzmvKgtFOWsbucf5hVRBHyXnN44Xe/g8rixMciFZi3wrr+aEndga1QaWXcyI/0BmNM9Wpiecd6v4l0ko/Z20ZxZiqu9oyj0NqH9Atyho3WY0Z+UEUXnm6Othbs+TrfwtnV7VSmeOiIPeGlgWUKzUpjC0Ucd3Eziq6AEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621589; c=relaxed/simple;
	bh=XSN8hnZDdEF8E7qEmVyNQTNlDKZ5mQTQiUCfNpNTAbM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S30C3qmyrGQ3kzxc1veGyN+scNkdZeATLmtIXYq/tHOhCorrgfe79V2j41z5qeQNq7p7b6sYZc3WJUAaUXw1xiUgJeaet1q3NqrT5I7nmX9S3UJhCF4k0oTX+sT6w+ML2zaOjfZ7RTfq5sylC6S/oSdeT1y4ZXdcRZomzEaWN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bfQsIvD1; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bfQsIvD1"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so2078854c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791621581; x=1792226381; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wl16BeDJDT/ZGI/NUaqDwRoHBVe8EzXOdli6uHqLZw=;
        b=bfQsIvD1Jqh+qhTce/tP3PH04cKs28Iuui1mKGOm/VP3NLcmsM95JB/vXhGv1oguHl
         mkHDW/UvsRDwl4K1slWHVSQD/PkeDEKiuEqBBG+C/UxzXa5dTqzMUuCI2PsT9yJyNsiD
         wVeVogENzNP3xxJK6prMzOqDegZq/wlm5pOpSkr66OYjLWvufhWC139Ns6NDBPvPnuMW
         htL6dG0EOXNiQ64rhAhmqOMhz3m7On/Z0+OaSXk0RJGeN3Hohn3W8pbjy+Ub0x1ReQQS
         Qlsy2AdkB2ncIXzp0AztmlzX9lZBG8Ci9yEqjfRfiK2eh0Ib+GjUGQMFgLaNKhxQwn6T
         az0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621581; x=1792226381;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wl16BeDJDT/ZGI/NUaqDwRoHBVe8EzXOdli6uHqLZw=;
        b=R07SSPEPAqEciLo1zl2xurcB7f4CDkZThP/RGRCu4XygryqbgsGNe165S49LhGYl+w
         aNVzO5hiFKUVBjA86gdIqK+t0V8Qt815YFmIunrHNWQhIpOs+hq1L8yrr/ZwcXS5ubFS
         wfMP/6Ladlt4G3phkQ2kUO03tMxVFOXM/1mgRT79XgKHA3AuKaOP0zwXZeoTcy2Vj9jN
         lAcNT5TMMSM4NoadxfbmkEjB1hV5XUAWcGqeaxoxIOxftsgarw1RYKHCrtWBPN/Rco/x
         2fc7TIlt5XchEILTSZ5HnHWp/dkYBzDaAcH73GdQLN1eCTKVTThQfnBhgs09kqIWmPU9
         b8Ig==
X-Forwarded-Encrypted: i=1; AKwUvBw+hZb/aZbVRL3/vkbA+uVSkAZgdAqaBidk3/EURCYvBI6+Di1bDVWyiFt0BCpUJcE/I4jiMqhYTwwmi6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9JIs0zrByESp56cumZnTVwYuH8TpXV5O5thux7cAOaPYwv49e
	4IjmHhjmN7mm2IlQ46RAQOKjGrSsMmUbMyesTy6477N/WhjFiL3r/1GMguwAuUD3kz3nU7XEcz2
	7nn7vTF+y8H2fLhEryafIv0oAdQ==
X-Received: from dleg5.prod.google.com ([2002:a05:701b:4305:b0:164:3999:d7c8])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:e805:b0:148:2f17:3e75 with SMTP id a92af1059eb24-16a61695579mr6045623c88.12.1791621581028;
 Sat, 10 Oct 2026 01:39:41 -0700 (PDT)
Date: Sat, 10 Oct 2026 08:38:46 +0000
In-Reply-To: <20261010083935.3274178-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261010083935.3274178-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261010083935.3274178-6-almasrymina@google.com>
Subject: [PATCH net-next v1 5/6] net: skbuff: use skb_frag_ref() in skb_try_coalesce()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Ayush Sawal <ayush.sawal@chelsio.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>, 
	Michael Grzeschik <mgr@kernel.org>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=" <u.kleine-koenig@baylibre.com>, Petr Machata <petrm@nvidia.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Jakub Raczynski <j.raczynski@samsung.com>
Content-Type: text/plain; charset="UTF-8"

skb_pp_frag_ref() was introduced solely to work around skb_frag_ref()
ignoring skb->pp_recycle and incrementing the non-pp backing refcount.
Now that skb_frag_ref() handles both pp_recycle=1 and pp_recycle=0
symmetrically, call skb_frag_ref() directly in skb_try_coalesce() and
remove skb_pp_frag_ref().

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/skbuff.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index f03ce8d5ae585..554af794bd7cd 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1078,37 +1078,6 @@ static bool skb_pp_recycle(struct sk_buff *skb, void *data)
 	return napi_pp_put_page(page_to_netmem(virt_to_page(data)));
 }
 
-/**
- * skb_pp_frag_ref() - Increase fragment references of a page pool aware skb
- * @skb:	page pool aware skb
- *
- * Increase the fragment reference count (pp_ref_count) of a skb. This is
- * intended to gain fragment references only for page pool aware skbs,
- * i.e. when skb->pp_recycle is true, and not for fragments in a
- * non-pp-recycling skb. It has a fallback to increase references on normal
- * pages, as page pool aware skbs may also have normal page fragments.
- */
-static int skb_pp_frag_ref(struct sk_buff *skb)
-{
-	struct skb_shared_info *shinfo;
-	netmem_ref head_netmem;
-	int i;
-
-	if (!skb->pp_recycle)
-		return -EINVAL;
-
-	shinfo = skb_shinfo(skb);
-
-	for (i = 0; i < shinfo->nr_frags; i++) {
-		head_netmem = netmem_compound_head(shinfo->frags[i].netmem);
-		if (likely(netmem_is_pp(head_netmem)))
-			page_pool_ref_netmem(head_netmem);
-		else
-			page_ref_inc(netmem_to_page(head_netmem));
-	}
-	return 0;
-}
-
 static void skb_kfree_head(void *head)
 {
 	kfree(head);
@@ -6295,10 +6264,8 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 	/* if the skb is not cloned this does nothing
 	 * since we set nr_frags to 0.
 	 */
-	if (skb_pp_frag_ref(from)) {
-		for (i = 0; i < from_shinfo->nr_frags; i++)
-			get_netmem(skb_frag_netmem(&from_shinfo->frags[i]));
-	}
+	for (i = 0; i < from_shinfo->nr_frags; i++)
+		skb_frag_ref(from, i);
 
 	to->truesize += delta;
 	to->len += len;
-- 
2.56.0.385.gd3acb90ef8-goog

