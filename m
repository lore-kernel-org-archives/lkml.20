Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307062;
	b=3UiU6zrnve/uC7xjxqi45Gtec1k/PUQu1uqqm6zfEnNVdn6GPYBsWgus+Jv19PF1ONWM
	 r/6P5mRdZ5tCZZLIegOJr+RfhF1TPdRD7t8Nyenwtrb/AaFKNwhYz7kkEUnFC2nD3LPcy
	 jweO0L+IG6R27xF9isrEkCDPagsR9h8DNwVKIs9wNhDNloytrunrQhtBcacpD4HwLT2fn
	 zvQaVWclhkJkfgZJ/FCfwyXcxWt0W/qMVO/UDssyg9qoMLby7GCSbhL8QlTLSl2HoBOcd
	 EpRmL1Wejh8Mk8wInQby3wQjenkzr8nAiUolFUGTDJBkS3yicV2E+LGTb7J/DXIyJUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=UWfUyS5pNdj6oGPmU6Tego6EBeTteaLYVvaKra+iOlw=;
	b=GnCW/CjmQV6ZbnbXlyQJ+Jb6OnDkrXWfUzc+FSbBDJ+3kSay2VIVnlKaUQzXniXfWk6M
	 nYKm2x8DxS/QTRsqsjbHPXT+Rv5dvhKFLm4EN6V53I9WceP7f8i42TgVMQeIXkqiARafn
	 fySRjxVhEa1z8M3+z6FD2bj5SpVtiNbV80dujxh9ssSJdfAMDXOy+CduBd8md+lVrxmrE
	 Ho2iY/P9ivMN5LeckRe2t1pCbolG83YxdsPEwphRNnbnP3qGtMa8BLIUMl7y/VLvSJd9i
	 UUzah7GCdbzsvO4Ovu/vWJxCjzOwu5ImMb9I7xQXD/4ICGWpx5v0+OrZrI+oN+3kfuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMXrt5F0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE24606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE24606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMXrt5F0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so14202275e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307060; x=1794911860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWfUyS5pNdj6oGPmU6Tego6EBeTteaLYVvaKra+iOlw=;
        b=sMXrt5F0qVWXeoWNYGKl9tNuxKHgK49EsgCbR47Fb6TJIYHmUahrGXrsOpg85q2+1O
         g1CqV8TYrU98E8sTMPAcF15bnvDTmNwr2uJDapMlHEAqEouUUMopU8ocuwQn+vvTPOZa
         u8Ota0bb+WC4oJefzbjxGqHQtpN+9VkUXCkhDpmnygB8+HUHLf/Lh+TIfDc4ZeUR6JiL
         27Z0FcnWj7c6G+iPF0cf+0lNvRceyi5LxbU7bOwcpJ/+NUvUDLsczKmTX4/YXoZF2jvC
         fTladr7vVtdb2jKtSvdON+BuFmo3U6j7CLHx/QBCsbkG7mFZHmkMIb41MnjFi107Tkcv
         D0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307060; x=1794911860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UWfUyS5pNdj6oGPmU6Tego6EBeTteaLYVvaKra+iOlw=;
        b=HMdTZxXtC32xCDXu79oivg/z9wsN9As7l7pRtE1FVuLeJSSlSP3ud53J5zjEVlM3o8
         1HakqPFUT3lGPyuUF7l2TgUJWBXrecm3EppgpfZSkgmm/3N+SxFvEDo5UMlZtoGEiIe6
         sFFpfGVsuE8xKEE420uPghbIUxa4iJ4TdSuY1m/nbigVoMcHkMb3F1rhT66PiPcJQuXz
         3zP7WfCPReKAP6d5ZC/35Wd7ul685tCivlMTIQMMmwKIaXgYG4FwmIblom/vMMbayM3V
         jGi+U2Ab/C1rzilsOMA/YN9wx0bkjPSMs/aJCVuywHfm8lVQOQEM6bkSLmNZuSrUtYeK
         Atmw==
X-Forwarded-Encrypted: i=1; AL+hErG5clQiONDcELkdORbsimI6MSIzNEoxhSuR6m0WFBjYBsM+jXRZgTSACpO7lzVqhCYyw8XbNOkkSX5PWBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EjtDzbAYz7uDLJsDouyMUyVstL3+GBGiA7vlWlYlpDb6pzvZw
	fSNq7Nmy6PEArepM6UXkQKKZeRj2wbkwVDn+c144Kxh8CG79sSIQHNbM
X-Gm-Gg: AYBFou3WOUPHjzowrdglUoycH4ZR+M6MZZHGdeImmpvwYcLYRR7hy+Yvi+Q487del1M
	2psqxkb9ksJkbYpe5r94E+fXgJ+3ysP4/imE4+bvorGqwk5CMi2EV37yM7VWd0MyLgu8R8ln0ZC
	gEQXE3F1dllKeIBz2R3YLhqO/RPp2JinzsZ81uenP/ryVP9Vrn2IqODpueVLr+KcsEZWMnAhQVS
	E9qKS1HZAVscl6oz1I6Xg6fGA+3wdbmiT4EOy9uRGwk1LvkFqG+Lp2MgLllNuDt3acJHv2gjmbQ
	qBLNeKEKECrtje8bL48dH+dRgb/eyu8LOxXMTa+c2p5FWNMkovcpnIbZK2Gfrs6gYd/GT0XwJsZ
	IC0O6OfR6PVexUU97gJurlLwP4FSOSLrvZkfvjP5SYGgbSWY+RJEA+5oo4yK47fWJBw+/vTw49E
	lJydNU6Wc0HqsQNWOGkamxpjxU6JIoVTD4hRdqOD3pDSvYCp6JHvESCFQdffscRl083lQ8HRrjl
	B+JgqGGaCzIq+gUe91hs2TkW7pfLkw8kZTL4A5Tgvw2PFgvVvwgSKoui6ntV5Ntwqx2l5SMc0UF
	GsY=
X-Received: by 2002:a05:600c:4f10:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4ba023410d8mr40201335e9.16.1794307060048;
        Tue, 10 Nov 2026 02:37:40 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::25dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm90643975e9.5.2026.11.10.02.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:37:39 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 10 Nov 2026 11:37:38 +0100
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Alan Maguire <almagui@kernel.org>,
	x86@kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 04/13] kprobes: Maintain an rbtree of registered probes
Message-ID: <avLz8k0gdZwYTeA5@krava>
References: <20261109194916.1089703-1-jolsa@kernel.org>
 <20261109195517.1090787-1-jolsa@kernel.org>
 <undine-1794298339502831052-1b6960b8f9b38e7d@undined.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <undine-1794298339502831052-1b6960b8f9b38e7d@undined.local>

On Tue, Nov 10, 2026 at 08:12:19AM +0000, Masami Hiramatsu (Google) wrote:
> On Mon,  9 Nov 2026 20:55:17 +0100, Jiri Olsa <jolsa@kernel.org> wrote:
> > Add an address-ordered rbtree for registered probes. Keep it synchronized
> > with the hash table when probes are added, removed, or replaced by
> > aggregator probes.
> 
> Could you tell me why don't you use hlist (get_kprobe) instead?
> I would NOT like 2 different lists which is basically doing the
> same thing.

The speedup comes from finding the first relevant kprobe, then iterating
over the remaining probes in address order. The hash table supports
exact-address lookups, but it doesn’t provide that ordering.

I agree that maintaining both indexes is less convenient. What do you think
about centralizing their updates as in the change below? untested

jirka


---
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 371ecc7d5b54..7868d8610b5f 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -435,6 +435,30 @@ static void kprobe_tree_replace(struct kprobe *old, struct kprobe *new)
 	RB_CLEAR_NODE(&old->rb_node);
 }
 
+static void add_kprobe(struct kprobe *p)
+{
+	lockdep_assert_held(&kprobe_mutex);
+	INIT_HLIST_NODE(&p->hlist);
+	hlist_add_head_rcu(&p->hlist,
+			   &kprobe_table[hash_ptr(p->addr, KPROBE_HASH_BITS)]);
+	kprobe_tree_insert(p);
+}
+
+static void remove_kprobe(struct kprobe *p)
+{
+	lockdep_assert_held(&kprobe_mutex);
+	hlist_del_init_rcu(&p->hlist);
+	kprobe_tree_erase(p);
+}
+
+static void replace_kprobe(struct kprobe *old, struct kprobe *new)
+{
+	lockdep_assert_held(&kprobe_mutex);
+	INIT_HLIST_NODE(&new->hlist);
+	hlist_replace_rcu(&old->hlist, &new->hlist);
+	kprobe_tree_replace(old, new);
+}
+
 struct kprobe *kprobe_iter_start(struct kprobe_iter *iter, unsigned long start,
 				 unsigned long end)
 {
@@ -751,8 +775,7 @@ static void do_unoptimize_kprobes(struct list_head *unopt_list,
 			 * for synchronization, these probes are reclaimed.
 			 * (reclaiming is done by do_free_cleaned_kprobes().)
 			 */
-			hlist_del_init_rcu(&op->kp.hlist);
-			kprobe_tree_erase(&op->kp);
+			remove_kprobe(&op->kp);
 		} else {
 			/*
 			 * Keep on cooling_list until the quiescence period
@@ -831,8 +854,7 @@ static void optprobe_finalize_generation(struct optprobe_generation *gen)
 			 * Unhash it now and move to cur_gen's freeing list so
 			 * it will be reclaimed after the next quiescence period.
 			 */
-			hlist_del_init_rcu(&op->kp.hlist);
-			kprobe_tree_erase(&op->kp);
+			remove_kprobe(&op->kp);
 			list_move(&op->list, &optprobe_gens[optprobe_cur_gen].freeing_list);
 			kick_kprobe_optimizer();
 		} else {
@@ -1116,8 +1138,7 @@ static void unoptimize_kprobe(struct kprobe *p, bool force)
 				if (kprobe_unused(&op->kp)) {
 					if (!kprobe_gone(&op->kp))
 						arch_disarm_kprobe(&op->kp);
-					hlist_del_init_rcu(&op->kp.hlist);
-					kprobe_tree_erase(&op->kp);
+					remove_kprobe(&op->kp);
 					list_move(&op->list, &cur->freeing_list);
 				} else {
 					list_move(&op->list, &cur->cooling_list);
@@ -1132,8 +1153,7 @@ static void unoptimize_kprobe(struct kprobe *p, bool force)
 				 */
 				if (!kprobe_gone(&op->kp))
 					arch_disarm_kprobe(&op->kp);
-				hlist_del_init_rcu(&op->kp.hlist);
-				kprobe_tree_erase(&op->kp);
+				remove_kprobe(&op->kp);
 				list_move(&op->list, &cur->freeing_list);
 				kick_kprobe_optimizer();
 			}
@@ -1188,8 +1208,7 @@ static void kill_optimized_kprobe(struct kprobe *p)
 	if (!list_empty(&op->list)) {
 		if (kprobe_unused(p)) {
 			if (optprobe_queued_unopt(op) || optprobe_queued_cooling(op)) {
-				hlist_del_init_rcu(&op->kp.hlist);
-				kprobe_tree_erase(&op->kp);
+				remove_kprobe(&op->kp);
 				list_move(&op->list,
 					  &optprobe_gens[optprobe_cur_gen].freeing_list);
 				kick_kprobe_optimizer();
@@ -1709,11 +1728,9 @@ static void init_aggr_kprobe(struct kprobe *ap, struct kprobe *p)
 		ap->post_handler = aggr_post_handler;
 
 	INIT_LIST_HEAD(&ap->list);
-	INIT_HLIST_NODE(&ap->hlist);
 
 	list_add_rcu(&p->list, &ap->list);
-	hlist_replace_rcu(&p->hlist, &ap->hlist);
-	kprobe_tree_replace(p, ap);
+	replace_kprobe(p, ap);
 }
 
 /*
@@ -2052,16 +2069,12 @@ static int __register_kprobe(struct kprobe *p)
 			return ret;
 	}
 
-	INIT_HLIST_NODE(&p->hlist);
-	hlist_add_head_rcu(&p->hlist,
-		       &kprobe_table[hash_ptr(p->addr, KPROBE_HASH_BITS)]);
-	kprobe_tree_insert(p);
+	add_kprobe(p);
 
 	if (!kprobes_all_disarmed && !kprobe_disabled(p)) {
 		ret = arm_kprobe(p);
 		if (ret) {
-			hlist_del_rcu(&p->hlist);
-			kprobe_tree_erase(p);
+			remove_kprobe(p);
 			synchronize_rcu();
 		}
 	}
@@ -2191,8 +2204,7 @@ static int __unregister_kprobe_top(struct kprobe *p)
 		 * !disarmed could be happen if the probe is under delayed
 		 * unoptimizing.
 		 */
-		hlist_del_rcu(&ap->hlist);
-		kprobe_tree_erase(ap);
+		remove_kprobe(ap);
 		return 0;
 	}
 

