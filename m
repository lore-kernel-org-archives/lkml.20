Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990A24A3D2C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306648; cv=none; b=M+nsQyJMrgO1Zbt8YaOmaRF388dOBoA6VLzq0LXfoWyoHRR1DGRIBPS7hi6G7n859DBaknJnHDHt5nclc8wndWTvvVJC96LI37FSjBmKyQAzs/jhZxZPOdj0qdCtn2eZEa/hJeKUm6qCoWJ9x4Z7qy3mqWazJ3WnwxH7OlXcQNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306648; c=relaxed/simple;
	bh=lJrAgLEquvUX1E4IKZjAcGvvkK1qqPcK3iaWEt+L6gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jccHNArj+Gyr3JAz0bS1IhgMhPEfrWTWa/7NlosZyZZoCKl2ALOfMnyaGSzWl19yVkw4I37UKMK1ABuJP49psr8eVQglutViTnm3ibo4A4fjI3jubktIyLvxnplsrEAInthdSDVPbkZx7JeB0CHqVHS8YriQ1sbzqv+fuAgKBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Ac+zni6z; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Ac+zni6z"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5338f65913dso34337291cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306645; x=1791911445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEopBC3xbTUKixAlJNKMf+PRWcHDGBdCeI5RXcAMmts=;
        b=Ac+zni6zBUldJuAa63L02dkyFeVgeiPovruR2uI1QtDEYgn4k856gIsQSKq8ncYDlD
         Z00UtTz+CmjAnG4j4r5gqsAvX8lU6YU7eigMVF05srJypxcPDR295xvbDeJGmxKlJppV
         ZbJtxwJQ/HLXTl0ZpVIg1rJtOmTBSjg+9tv6m4exZ4cyBiYdXLEVNc2szsb0erQtxeUC
         BREibI0y9stUNp7c4/r9lwzX5yxn+0WV785j1WCyFQHQMKoUxuhuKFRQUSYHUNJfpz+X
         63mrQhxxcMZJlDU3yL6kf2Gz8FUbPxhcJ/1z6fyYzPhdFqW0vL8AMXJRfnfyFotpEyB4
         o5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306645; x=1791911445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEopBC3xbTUKixAlJNKMf+PRWcHDGBdCeI5RXcAMmts=;
        b=JXBG0QdHYYQ5JkKAN7EJa87BcJEorIM/Ybb1wp9kR8TZZ5qgoPWbbGDgnfI8//jLsk
         wJYlvrxndbHJVaixiO9FptIopHwcEIKYHQFl4APtPzv9dsndnwp3aUyloQBtsb5E/cHd
         j61qZNuHmsaL9MpJbAUO3lq5S1WouwICcVwZvcHdVGO3mGPvOcYK0rcUQoZlGYCIEUEW
         mhZ8uE8dNr0P3NxyzFrpjhnYt+V5oDnCal0ihIAIydFUZb2Rvrea0tmlsJ+lG1Vt6nXD
         IwLytdeYrTHYlRbX/fnc0iJe0CmMqNwUhJKxYoLNlmV3PYXmqmihiOqJaAoX0CAQNqPY
         BM2g==
X-Forwarded-Encrypted: i=1; AKwUvBzXgS3qmpVHUA7jQ7n894YqbSL7OR9ny1fv8gFwCy5/dgNPapzu8urbk2MFiSlvbEQkA1rItIddz4e9OXo=@vger.kernel.org
X-Gm-Message-State: AFuF++kC+bTB8P3lxD4t0R8VKtleIoRAg7+uQyvsDlyc1kIRNxO8SAG/
	ls39qXnu1VM7+VKhNltg7jRF1NzLklMz0Llc/qdGYfjJj/at2snWJznzRvXUh9Cvjl4R7l9NFb7
	5kuah
X-Gm-Gg: AYBFou3Kl2Cfi4O0gYFlMrnVF4K2PZBEuRGX3XtZjrPr7Jb527JJ4J66/vtxLcwlZ3o
	hrBmB/vISWZ3QU82fvwx11yGYJaxE1Xw6DwoK94k0B2dUNpGDzYw1ZO4fsIM5gi7tylann2lfFC
	cC2gv5Zlt/nkbNTgob2MeVE+TDZyPvK3SQd7SZw1JzF+GjUWile2/50BV51aH4+uV1UpfwsKWRD
	DR1fWzk35Y0FZZP8DDv5kcBIypTvEQ4524EpO+xj2OqRvcZ4AarfF6C3rVutBRDYE7WG2VJ0Nvr
	5a+UJx26jiTKxX1JXGijiQM/FddrSGFV+a6gs1gwvR0kNttiECq5uVHizvhBNfelt0ht3S2pqps
	0T8mNNuD7CVHaBPyTi+nbP0WQTvUjb4xQJUgTBggb3dHENvG1DLobQszHY9w5A7gArZhuAlJo1L
	Jh47e9becEfORJossM9l2pjGLsCRbdlHhITSyZHVrNjYcPVs+yQTD6988wNrb5PRMFouWv/m/tO
	hMBTRlk0B07UcE=
X-Received: by 2002:a05:622a:260b:b0:535:1a6:6e97 with SMTP id d75a77b69052e-53511e4f2b1mr179084311cf.29.1791306645443;
        Tue, 06 Oct 2026 10:10:45 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b682dfsm118638636d6.19.2026.10.06.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:10:44 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 06 Oct 2026 17:10:19 +0000
Subject: [PATCH net-next 4/9] net: skbuff: don't BUG() when skb_copy_bits()
 fails in copy helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-skbuff-bug-on-v1-4-1b4434c5357c@toxicpanda.com>
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, Mina Almasry <almasrymina@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791306633; l=2507;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=lJrAgLEquvUX1E4IKZjAcGvvkK1qqPcK3iaWEt+L6gc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIrGd86UTYv0RDVXyeMVh/bQeikE0Xjv0WEtGohvRz8l5EXeQu4E8VR8/976okyGMMjweBIN7wr
 9+jwQsxUplgQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

skb_copy(), skb_copy_expand() and skb_try_coalesce() all BUG() if
skb_copy_bits() fails.  skb_copy_bits() only fails when the skb's
lengths don't add up, which is a bug somewhere else, usually in a
driver building the skb.

Each of these functions already has a failure return its callers handle:

 - skb_copy() and skb_copy_expand() free the new skb and return NULL,
   as they do when the allocation fails.
 - skb_try_coalesce() returns false and the caller keeps the skbs
   separate.  Copy into the tailroom before skb_put() so that @to is
   untouched on failure.

Warn once and take those returns.

__pskb_pull_tail() has the same BUG_ON(), but several of its callers
can't otherwise fail and don't check its return, so it's left for a
separate change that fixes them first.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 405d27e9bc9d..6cd7135e0dce 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2201,7 +2201,11 @@ struct sk_buff *skb_copy(const struct sk_buff *skb, gfp_t gfp_mask)
 	/* Set the tail pointer and length */
 	skb_put(n, skb->len);
 
-	BUG_ON(skb_copy_bits(skb, -headerlen, n->head, headerlen + skb->len));
+	if (WARN_ON_ONCE(skb_copy_bits(skb, -headerlen, n->head,
+				       headerlen + skb->len))) {
+		kfree_skb(n);
+		return NULL;
+	}
 
 	skb_copy_header(n, skb);
 	return n;
@@ -2541,8 +2545,12 @@ struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
 		head_copy_off = newheadroom - head_copy_len;
 
 	/* Copy the linear header and data. */
-	BUG_ON(skb_copy_bits(skb, -head_copy_len, n->head + head_copy_off,
-			     skb->len + head_copy_len));
+	if (WARN_ON_ONCE(skb_copy_bits(skb, -head_copy_len,
+				       n->head + head_copy_off,
+				       skb->len + head_copy_len))) {
+		kfree_skb(n);
+		return NULL;
+	}
 
 	skb_copy_header(n, skb);
 
@@ -6229,8 +6237,13 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		return false;
 
 	if (len <= skb_tailroom(to) && skb_frags_readable(from)) {
-		if (len)
-			BUG_ON(skb_copy_bits(from, 0, skb_put(to, len), len));
+		if (len) {
+			if (WARN_ON_ONCE(skb_copy_bits(from, 0,
+						       skb_tail_pointer(to),
+						       len)))
+				return false;
+			skb_put(to, len);
+		}
 		*delta_truesize = 0;
 		return true;
 	}

-- 
2.55.0

