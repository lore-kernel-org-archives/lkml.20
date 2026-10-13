Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BC3AFD07
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877597; cv=none; b=LSUPnrH7Zq1+9+Mt0WORPxg0tUphfolGz5TF+d0t9IxmGGl4HT/Gaz+la5bk9fQw+52dV9a2R6k6+Vudas7TNdb4AFrvTEmxWIW2asC/La1VnbPsKDXWQLGVknNq/2d+h9l433wpX5oAkwlLJuruOPuvivItwEz40M53S/fv3Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877597; c=relaxed/simple;
	bh=9QX4kqkvidwzuY8xcIKwrbEmXYMGZ796NnK3r+ozrhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVRozkTdPWM5NAWsC5A9TkAMx+cC0s7IKsUWyIfF+MWKfqa905gTKRRk5C93XWv/jT/4N2XbrtKlK0QKmXgJfYguf6Oc5nI5Cp5XeSrYGPpP1DdZUQk/WTCX0O0/rjcBVIkAmtW1J9uTyg1ZH5QRrBwsBlVHRNLz77WYWXa+A0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFDJp9Ry; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFDJp9Ry"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8884761745cso319703b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877594; x=1792482394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYtvZLNjrHnFaz8zy1ctOMbEeK8TK4DS4HnanjJBXOk=;
        b=dFDJp9Ry7StAoi6JfcvCnMf9VbasAvAxccW/9bw4iFANO79eILt0q9LlyWINsN9NpU
         MwawyADrgXM2p3OKJZiKmFiB9pAgU3u4dW969vpLzK2pVLpdEd+09wVPePuUetOdAbk2
         BHX0XBsM4hugOOnB3KrxtfuG3SAhAIUANT6CN0Rk5wd3FyJBGO7yDbOaF10TPjQx4Unj
         FW+kzkeJ5EKajO3BYtzp0yXW8oIl/m7ZiNsxbxhaS2CdmnXjXth19B++0RpFafxvQ10a
         BO6UXqW0azbqkoFXOeqj4mj2109eqxKo4OXK6pr0mumjmqq7fCBaVqmL959otKTXShup
         muPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877594; x=1792482394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYtvZLNjrHnFaz8zy1ctOMbEeK8TK4DS4HnanjJBXOk=;
        b=IXhrP10AYfXd+hOsAP7DPmHbzRndSUpDtFYFfqWfyeiJuKb70auKi7ZjtJBOq025HE
         N3crzX9JsyS8iYs2zYuJNAwQxiRuG1UfFB5op/T3mk4DHEVNx/RNIONlJLCepvGgZa/7
         YtokcVG4NAuXzPS5k45K9u6owlH/aLPurnxCtl8GF9lno295zEMIq5FdHUzAHQh8Bidx
         BXx87scg94Bk9k0ni8C3x4CWP554C62YFAJmGhHh/P9OLO+S7QmSO7yN0x7oAdssRBty
         lkNNlrHPoWv4jGkbl5n5fvKtsd6tpyz/5rtv2d6HD6ldYFv8vqX1BiUmZqWSPASm7tjx
         l2Bg==
X-Forwarded-Encrypted: i=1; AKwUvBx3TKyFf2xWmbTs5WpLXNo16sf3HpJ/fpMHv8AWgz7spVi5LAm4jezHlpG62MyAIdQswpmoq17RDMaxClc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiCIM7MSfHzDJTt0lDnzlwZ96rpXnWaHi04WKoNf1VAs3yJpCo
	brh6WmZg7wrbeleLLBC7geFbABWi5Ib+518n5i62gRSpU8hxe36AutXz
X-Gm-Gg: AYBFou2ipSxss8BB8NvUUNZGIrQQfhs4gAI20HAxhBHyhhDkQ0a3rDPgdD8N7xeFkDU
	XMrQlvu5WgrEwT9WRpeYgztmcpFT9CZ89hDnYfKWdVvAa0r1f2Ti3rT3KfdvsJrGAI01fwm5LeL
	uK6qMs1wE8YFkUdgVGUAmyMblv0UAorTG7dkjG0PSFR1O83g0IKEH/IFbfOnIBjLLE09D9R7yqW
	AcamewwyePkOw7wm3JioJeoMkAUMznsQWD250B7LLyOJAZ4Vx3ZvZYzq+JYKpitimlTz8jDltBT
	esAEN78+5HEN8JztTedJkifXPz0ncA9wcXFQO0+RK4GI6SQLLFeOqHbdBZKGyYML7f+77TON/rq
	33PGBzI+ncyZFg57SJ9hvFG5d24mXEioJyxrvE74tBF7McetbjSUbS1U3jLnt0qYIP7+ktEg07F
	sqa2iaInFd+V8i6NNJdzL/joh0AOvVD70lcRmxFmCaQWhJTW/1hsYVuVbFFOz8DqktvNl6twybG
	IQxfgyLE31J/0GSUj+XC3CC+MNWLDSRF5XwoLHWRiNQxN5B1O2B3tz8KaOLNw==
X-Received: by 2002:a05:6a00:4695:b0:89c:5165:6ea6 with SMTP id d2e1a72fcca58-89c51656f7cmr2749144b3a.3.1791877594068;
        Tue, 13 Oct 2026 00:46:34 -0700 (PDT)
Received: from localhost.localdomain ([139.159.170.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89805c75343sm4459011b3a.38.2026.10.13.00.46.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:46:33 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Christian Hopps <chopps@labn.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/3] xfrm: iptfs: run the receive callbacks before freeing the skb
Date: Tue, 13 Oct 2026 15:46:09 +0800
Message-ID: <20261013074610.17808-3-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013074610.17808-1-q.h.hack.winter@gmail.com>
References: <20261013074610.17808-1-q.h.hack.winter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPTFS consumes the outer skb itself and frees it directly on several
paths, so the receive callbacks registered for the protocol never run
for those packets and whatever they cached in the skb control buffer is
never cleaned up.  Add xfrm_input_drop(), which dispatches the receive
callback with err = -1 before freeing the skb, and use it for the
outer-skb free paths in __input_process_payload(),
iptfs_input_ordered() and the reorder-window free list of iptfs_input().

Fixes: 4b3faf610cc6 ("xfrm: iptfs: add new iptfs xfrm mode impl")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/xfrm/xfrm_inout.h |  2 ++
 net/xfrm/xfrm_input.c | 19 +++++++++++++++++++
 net/xfrm/xfrm_iptfs.c |  6 +++---
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_inout.h b/net/xfrm/xfrm_inout.h
index efc5e6b2e87b..be1f5e569ae7 100644
--- a/net/xfrm/xfrm_inout.h
+++ b/net/xfrm/xfrm_inout.h
@@ -6,6 +6,8 @@
 #ifndef XFRM_INOUT_H
 #define XFRM_INOUT_H 1
 
+void xfrm_input_drop(struct sk_buff *skb);
+
 static inline void xfrm4_extract_header(struct sk_buff *skb)
 {
 	const struct iphdr *iph = ip_hdr(skb);
diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index ddf8fd75fd20..f293d5e124d4 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -120,6 +120,25 @@ static int xfrm_rcv_cb(struct sk_buff *skb, unsigned int family, u8 protocol,
 	return ret;
 }
 
+/* Finish an skb that is freed outside of xfrm_input()'s own drop path, e.g.
+ * from IPTFS.  The receive callbacks must still run before the skb goes away.
+ */
+void xfrm_input_drop(struct sk_buff *skb)
+{
+	struct sec_path *sp = skb_sec_path(skb);
+	struct xfrm_state *x;
+
+	if (!sp || !sp->len) {
+		kfree_skb(skb);
+		return;
+	}
+
+	x = sp->xvec[sp->len - 1];
+	xfrm_rcv_cb(skb, x->props.family, x->type ? x->type->proto : 0, -1);
+	kfree_skb(skb);
+}
+EXPORT_SYMBOL(xfrm_input_drop);
+
 struct sec_path *secpath_set(struct sk_buff *skb)
 {
 	struct sec_path *sp, *tmp = skb_ext_find(skb, SKB_EXT_SEC_PATH);
diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 6920940a35b4..4b3d04e531a5 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1211,7 +1211,7 @@ static bool __input_process_payload(struct xfrm_state *x, u32 data,
 		 * either be save in ra_newskb, trimmed and sent on as an skb or
 		 * placed in defer to be freed.
 		 */
-		kfree_skb(skb);
+		xfrm_input_drop(skb);
 	}
 	return true;
 }
@@ -1298,7 +1298,7 @@ static void iptfs_input_ordered(struct xfrm_state *x, struct sk_buff *skb)
 	if (!consumed) {
 		skb = skbseq.root_skb;
 		skb_abort_seq_read(&skbseq);
-		kfree_skb(skb);
+		xfrm_input_drop(skb);
 	}
 }
 
@@ -1751,7 +1751,7 @@ static int iptfs_input(struct xfrm_state *x, struct sk_buff *skb)
 
 	list_for_each_entry_safe(skb, next, &freelist, list) {
 		skb_list_del_init(skb);
-		kfree_skb(skb);
+		xfrm_input_drop(skb);
 	}
 done:
 	/* We always have dealt with the input SKB, either we are re-using it,
-- 
2.54.0 (Apple Git-157)

