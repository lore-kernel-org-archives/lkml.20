Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282304;
	b=DfxD6xUCzj5M2viN9IaY9Qwhm3TExYSPDtej4vl8wPvEwPs0K9kEVoHglQlLN4Un3Y7/
	 ZmBCaZ8skLZjvbxoIvBv/mBt65FhlKk/ChDlL4AzgjDcmfBiuV1Sk62m4KnLomCq9ysM4
	 bcadtE8XIKOLSu+p4DqLq8D+u/5smlTg3rH3qb4uqC502wBC8K6GA23jpK0cLgGEBDAUq
	 vVJ+cMMExgTlqtYbaNgQJqUMcXXr4bQOOeFznRg4YPJEZuLAcAXqcV/QhTNHCY9gh5xfl
	 vDy1miHdxO2MMe3PUaMndL0mFDGYl8+/UjNdZwuRHaM/5/znj8b/MGs3lLLmuvikQpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282304;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=GIxtkUZ+wbQDw+rHcc7x4Xr52quuFJNB2ujYLKtFJJY=;
	b=4EBqsn7TWkF1HxjB/DKF4MEDewlmUv78ZoVgsrwO4hYCLOyNIPyc+6PvVricEwexOL+E
	 1eXD/9XlHjNASKt869UNS1bkMpUPpZ+ZLLT8nt0ZzW2PzvIeiBIELBs2wjHuLaBuwLjCh
	 GRJe3GK3qnFFlQZ8wOiOQPhlmGIX4I+g3yf39ZjsX+UvG5nF7kjtMBx7hIETQf+wzwlm2
	 K2j8ZKulmpQZRzhRLvAN7JCCL+MupTt0PYlhSETY+gBKeUekogyrZ3oZJ8g/u5McEsu5t
	 a+a4bhVkM17K/2AbpY3aOPJgSs1yZWdf50gSXFTWDsfIrt0PFM6Mo/u/+WVljq5CZJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CE606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5CE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4fb73e868aaso3545396b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282303; x=1793887103;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GIxtkUZ+wbQDw+rHcc7x4Xr52quuFJNB2ujYLKtFJJY=;
        b=l9Xrd+qBDA1UyKScvEI6cy5GhXN1We9ZJQ2Qcrl6//mlydaKtMCZxscbaof864yGj5
         oeU0jWxt7Z5Lft6U1JlOWKA9Wdf8+k99i8ZyOyzsEWe42UUZXUw1qvnLAbwcm643cHMf
         qzpDtBXq7aUkafv8Y3ZM4XZhvaYKPePXCZPzxRFmg/vQWKQFMl65jYqurIp1B+qCd1FE
         pOHSvfd27Zc5So0uj4JxHVpcVGPRo8KYhdACiUWla0K+d0MOu2yIDrCwfFcMDVy8uWSM
         7I4ISXWNkpKtjwK9lsCPM1pMj6OkIaiHML09aKiQKNX4puzf+pQNIGVr7YQB3+MwoIIx
         aAKg==
X-Forwarded-Encrypted: i=1; AKwUvBxh8+gU3YLZFfPQtqegHgEsKDA4E6JLelgvw0KTxD5ToueK/DtaA5vzyO57lLxfgcu7EAe6XGek08tPdUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIviV1fJMj8hkWfF39H1cIULT6nP/+hRgcz4icskxC+O9heGROr
	2ULYijpio0CTBowmcJsOlMvzPKq4qmGxArRYGa36qHxPbN7Y+4um7inhWNHBdubs5IcvR1FO91T
	0hZ68MKRJTbv4eMs74l84kFR+3ukm49/HLCGMukX17261/XEgovL6S+cOx9s=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2216:b0:561:fa43:1b17 with SMTP id
 5614622812f47-5638369103cmr3663572b6e.42.1793282303251; Thu, 29 Oct 2026
 06:58:23 -0700 (PDT)
Date: Thu, 29 Oct 2026 06:58:23 -0700
In-Reply-To: <auNQ-oZRMUcbXynG@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae350ff.9f6421ad.f5e74.00c5.GAE@google.com>
Subject: Re: [PATCH] KEYS: key_garbage_collector(): process in chunks
From: syzbot <syzbot+c15de43f1e7fffbb7b9b@syzkaller.appspotmail.com>
To: jarkko@kernel.org
Cc: jarkko@kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> key_garbage_collector() has a design that is not resistant enough for
> workqueue lockups. The duration scales up relative to the number of items
> in the serial tree, which causes a reoccuring theme of being guilty of
> causing workqueue lockups.
>
> Resolve the problem by processing in chunks:
>
> 1. Declare a static variable key_gc_work, which owns the garbage collection
>    in-flight state, and key_schedule_gc_work() for re-scheduling the work.
> 2. Define KEY_GC_CHUNK_SIZE, set to 1024 keys, as the bound for the number
>    of items scanned and destroyed.
> 3. Define KEY_GC_DESTROYING to mark resume to destruction without repeating
>    the RCU grace period. Drain the graveyard before advancing key-type
>    reaping.
> 4. Define KEY_GC_REAP_REQUESTED for preserving full-pass requests across
>    the continuations.
>
> keygcbench results without the patch:
>
> unused:   min=3016.754 avg=11859.097 max=28667.645 var=141391574.712
> expired:  min=0.015 avg=12758.165 max=21516.237 var=85158284.646
> combined: min=0.015 avg=12308.631 max=28667.645 var=113477010.596
>
> keygcbench results with the patch:
>
> unused:   min=0.225 avg=13.991 max=853.100 var=858.700
> expired:  min=0.016 avg=30.442 max=2791.695 var=14187.539
> combined: min=0.016 avg=19.249 max=2791.695 var=5177.436
>
> Tests were with QEMU/KVM hosted by AMD 4650U (Zen 2) CPU.
>
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd-test.git/tree/package/keygcbench
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> #syz test

This crash does not have a reproducer. I cannot test it.

>
> v3:
> - Added new tests results made by using keygcbench.
> - Added link to keygcbench.
> v2:
> - Fixed typo in the commit message.
> - Drop the local variable gc_state.
> ---
>  security/keys/gc.c       | 151 ++++++++++++++++++++++++++-------------
>  security/keys/internal.h |   1 -
>  security/keys/key.c      |   2 +-
>  3 files changed, 102 insertions(+), 52 deletions(-)
>
> diff --git a/security/keys/gc.c b/security/keys/gc.c
> index eda445f815d4..ddf51879971c 100644
> --- a/security/keys/gc.c
> +++ b/security/keys/gc.c
> @@ -10,16 +10,27 @@
>  #include <keys/keyring-type.h>
>  #include "internal.h"
>
> -/*
> - * Delay between key revocation/expiry in seconds
> - */
> -unsigned key_gc_delay = 5 * 60;
> +#define KEY_GC_CHUNK_SIZE 1024
>
>  /*
>   * Reaper for unused keys.
>   */
>  static void key_garbage_collector(struct work_struct *work);
> -DECLARE_WORK(key_gc_work, key_garbage_collector);
> +
> +static struct {
> +	time64_t start;			/* expiry range start */
> +	time64_t end;			/* expiry range end */
> +	struct rb_node *cursor;		/* serial tree position */
> +	u8 state;			/* state flags */
> +	struct work_struct work;	/* work item */
> +} key_gc_work = {
> +	.work = __WORK_INITIALIZER(key_gc_work.work, key_garbage_collector),
> +};
> +
> +/*
> + * Delay between key revocation/expiry in seconds
> + */
> +unsigned int key_gc_delay = 5 * 60;
>
>  /*
>   * Reaper for links from keyrings to dead keys.
> @@ -34,6 +45,7 @@ static unsigned long key_gc_flags;
>  #define KEY_GC_KEY_EXPIRED	0	/* A key expired and needs unlinking */
>  #define KEY_GC_REAP_KEYTYPE	1	/* A keytype is being unregistered */
>  #define KEY_GC_REAPING_KEYTYPE	2	/* Cleared when keytype reaped */
> +#define KEY_GC_REAP_REQUESTED	3	/* Another complete pass was requested */
>
>
>  /*
> @@ -44,6 +56,20 @@ struct key_type key_type_dead = {
>  	.name = ".dead",
>  };
>
> +/*
> + * Schedule a new GC pass or re-schedule an ongoing GC pass.
> + */
> +static void key_schedule_gc_work(void)
> +{
> +	/*
> +	 * Order caller updates before setting KEY_GC_REAP_REQUESTED, given that
> +	 * set_bit() is unordered.
> +	 */
> +	smp_mb__before_atomic();
> +	set_bit(KEY_GC_REAP_REQUESTED, &key_gc_flags);
> +	schedule_work(&key_gc_work.work);
> +}
> +
>  /*
>   * Schedule a garbage collection run.
>   * - time precision isn't particularly important
> @@ -57,7 +83,7 @@ void key_schedule_gc(time64_t gc_at)
>
>  	if (gc_at <= now || test_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags)) {
>  		kdebug("IMMEDIATE");
> -		schedule_work(&key_gc_work);
> +		key_schedule_gc_work();
>  	} else if (gc_at < key_gc_next_run) {
>  		kdebug("DEFERRED");
>  		key_gc_next_run = gc_at;
> @@ -85,7 +111,7 @@ void key_set_expiry(struct key *key, time64_t expiry)
>  void key_schedule_gc_links(void)
>  {
>  	set_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags);
> -	schedule_work(&key_gc_work);
> +	key_schedule_gc_work();
>  }
>
>  /*
> @@ -119,7 +145,7 @@ void key_gc_keytype(struct key_type *ktype)
>  	set_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags);
>
>  	kdebug("schedule");
> -	schedule_work(&key_gc_work);
> +	key_schedule_gc_work();
>
>  	kdebug("sleep");
>  	wait_on_bit(&key_gc_flags, KEY_GC_REAPING_KEYTYPE,
> @@ -134,7 +160,9 @@ void key_gc_keytype(struct key_type *ktype)
>   */
>  static noinline void key_gc_unused_keys(struct list_head *keys)
>  {
> -	while (!list_empty(keys)) {
> +	unsigned int chunk = KEY_GC_CHUNK_SIZE;
> +
> +	while (!list_empty(keys) && chunk--) {
>  		struct key *key =
>  			list_entry(keys->next, struct key, graveyard_link);
>  		short state = key->state;
> @@ -178,54 +206,64 @@ static noinline void key_gc_unused_keys(struct list_head *keys)
>  static void key_garbage_collector(struct work_struct *work)
>  {
>  	static LIST_HEAD(graveyard);
> -	static u8 gc_state;		/* Internal persistent state */
> +	typeof(key_gc_work) *gc = &key_gc_work;
>  #define KEY_GC_REAP_AGAIN	0x01	/* - Need another cycle */
>  #define KEY_GC_REAPING_LINKS	0x02	/* - We need to reap links */
> +#define KEY_GC_DESTROYING	0x04	/* - We need to destroy keys */
>  #define KEY_GC_REAPING_DEAD_1	0x10	/* - We need to mark dead keys */
>  #define KEY_GC_REAPING_DEAD_2	0x20	/* - We need to reap dead key links */
>  #define KEY_GC_REAPING_DEAD_3	0x40	/* - We need to reap dead keys */
>  #define KEY_GC_FOUND_DEAD_KEY	0x80	/* - We found at least one dead key */
>
> -	struct rb_node *cursor;
> +	unsigned int chunk = KEY_GC_CHUNK_SIZE;
>  	struct key *key;
> -	time64_t new_timer, limit, expiry;
> +	time64_t expiry;
>
> -	kenter("[%lx,%x]", key_gc_flags, gc_state);
> +	kenter("[%lx,%x]", key_gc_flags, gc->state);
>
> -	limit = ktime_get_real_seconds();
> +	if (gc->state & KEY_GC_DESTROYING)
> +		goto destroy_keys;
> +	if (gc->cursor) {
> +		spin_lock(&key_serial_lock);
> +		goto continue_scanning;
> +	}
> +
> +	test_and_clear_bit(KEY_GC_REAP_REQUESTED, &key_gc_flags);
> +	gc->start = ktime_get_real_seconds();
>
>  	/* Work out what we're going to be doing in this pass */
> -	gc_state &= KEY_GC_REAPING_DEAD_1 | KEY_GC_REAPING_DEAD_2;
> -	gc_state <<= 1;
> +	gc->state &= KEY_GC_REAPING_DEAD_1 | KEY_GC_REAPING_DEAD_2;
> +	gc->state <<= 1;
>  	if (test_and_clear_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags))
> -		gc_state |= KEY_GC_REAPING_LINKS;
> +		gc->state |= KEY_GC_REAPING_LINKS;
>
>  	if (test_and_clear_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags))
> -		gc_state |= KEY_GC_REAPING_DEAD_1;
> -	kdebug("new pass %x", gc_state);
> +		gc->state |= KEY_GC_REAPING_DEAD_1;
> +	kdebug("new pass %x", gc->state);
>
> -	new_timer = TIME64_MAX;
> +	gc->end = TIME64_MAX;
>
>  	/* As only this function is permitted to remove things from the key
>  	 * serial tree, if cursor is non-NULL then it will always point to a
>  	 * valid node in the tree - even if lock got dropped.
>  	 */
>  	spin_lock(&key_serial_lock);
> -	cursor = rb_first(&key_serial_tree);
> +	gc->cursor = rb_first(&key_serial_tree);
>
>  continue_scanning:
> -	while (cursor) {
> -		key = rb_entry(cursor, struct key, serial_node);
> -		cursor = rb_next(cursor);
> +	while (gc->cursor && chunk) {
> +		key = rb_entry(gc->cursor, struct key, serial_node);
> +		gc->cursor = rb_next(gc->cursor);
> +		chunk--;
>
>  		if (!test_bit_acquire(KEY_FLAG_USER_ALIVE, &key->flags)) {
>  			/* Clobber key->user after final put seen. */
>  			goto found_unreferenced_key;
>  		}
>
> -		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
> +		if (unlikely(gc->state & KEY_GC_REAPING_DEAD_1)) {
>  			if (key->type == key_gc_dead_keytype) {
> -				gc_state |= KEY_GC_FOUND_DEAD_KEY;
> +				gc->state |= KEY_GC_FOUND_DEAD_KEY;
>  				set_bit(KEY_FLAG_DEAD, &key->flags);
>  				key->perm = 0;
>  				goto skip_dead_key;
> @@ -239,24 +277,24 @@ static void key_garbage_collector(struct work_struct *work)
>  		if (expiry != TIME64_MAX) {
>  			if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
>  				expiry += key_gc_delay;
> -			if (expiry > limit && expiry < new_timer) {
> +			if (expiry > gc->start && expiry < gc->end) {
>  				kdebug("will expire %x in %lld",
> -				       key_serial(key), key->expiry - limit);
> -				new_timer = key->expiry;
> +				       key_serial(key), key->expiry - gc->start);
> +				gc->end = key->expiry;
>  			}
>  		}
>
> -		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2))
> +		if (unlikely(gc->state & KEY_GC_REAPING_DEAD_2))
>  			if (key->type == key_gc_dead_keytype)
> -				gc_state |= KEY_GC_FOUND_DEAD_KEY;
> +				gc->state |= KEY_GC_FOUND_DEAD_KEY;
>
> -		if ((gc_state & KEY_GC_REAPING_LINKS) ||
> -		    unlikely(gc_state & KEY_GC_REAPING_DEAD_2)) {
> +		if ((gc->state & KEY_GC_REAPING_LINKS) ||
> +		    unlikely(gc->state & KEY_GC_REAPING_DEAD_2)) {
>  			if (key->type == &key_type_keyring)
>  				goto found_keyring;
>  		}
>
> -		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_3))
> +		if (unlikely(gc->state & KEY_GC_REAPING_DEAD_3))
>  			if (key->type == key_gc_dead_keytype)
>  				goto destroy_dead_key;
>
> @@ -269,7 +307,11 @@ static void key_garbage_collector(struct work_struct *work)
>  	spin_unlock(&key_serial_lock);
>
>  maybe_resched:
> -	if (cursor) {
> +	if (gc->cursor) {
> +		if (!chunk) {
> +			schedule_work(&key_gc_work.work);
> +			return;
> +		}
>  		cond_resched();
>  		spin_lock(&key_serial_lock);
>  		goto continue_scanning;
> @@ -281,12 +323,12 @@ static void key_garbage_collector(struct work_struct *work)
>  	 */
>  	kdebug("pass complete");
>
> -	if (new_timer != TIME64_MAX) {
> -		new_timer += key_gc_delay;
> -		key_schedule_gc(new_timer);
> +	if (gc->end != TIME64_MAX) {
> +		gc->end += key_gc_delay;
> +		key_schedule_gc(gc->end);
>  	}
>
> -	if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2) ||
> +	if (unlikely(gc->state & KEY_GC_REAPING_DEAD_2) ||
>  	    !list_empty(&graveyard)) {
>  		/* Make sure that all pending keyring payload destructions are
>  		 * fulfilled and that people aren't now looking at dead or
> @@ -297,33 +339,42 @@ static void key_garbage_collector(struct work_struct *work)
>  		synchronize_rcu();
>  	}
>
> +	gc->state |= KEY_GC_DESTROYING;
> +
> +destroy_keys:
>  	if (!list_empty(&graveyard)) {
>  		kdebug("gc keys");
>  		key_gc_unused_keys(&graveyard);
> +		if (!list_empty(&graveyard)) {
> +			schedule_work(&key_gc_work.work);
> +			return;
> +		}
>  	}
> +	gc->state &= ~KEY_GC_DESTROYING;
>
> -	if (unlikely(gc_state & (KEY_GC_REAPING_DEAD_1 |
> +	if (unlikely(gc->state & (KEY_GC_REAPING_DEAD_1 |
>  				 KEY_GC_REAPING_DEAD_2))) {
> -		if (!(gc_state & KEY_GC_FOUND_DEAD_KEY)) {
> +		if (!(gc->state & KEY_GC_FOUND_DEAD_KEY)) {
>  			/* No remaining dead keys: short circuit the remaining
>  			 * keytype reap cycles.
>  			 */
>  			kdebug("dead short");
> -			gc_state &= ~(KEY_GC_REAPING_DEAD_1 | KEY_GC_REAPING_DEAD_2);
> -			gc_state |= KEY_GC_REAPING_DEAD_3;
> +			gc->state &= ~(KEY_GC_REAPING_DEAD_1 | KEY_GC_REAPING_DEAD_2);
> +			gc->state |= KEY_GC_REAPING_DEAD_3;
>  		} else {
> -			gc_state |= KEY_GC_REAP_AGAIN;
> +			gc->state |= KEY_GC_REAP_AGAIN;
>  		}
>  	}
>
> -	if (unlikely(gc_state & KEY_GC_REAPING_DEAD_3)) {
> +	if (unlikely(gc->state & KEY_GC_REAPING_DEAD_3)) {
>  		kdebug("dead wake");
>  		clear_and_wake_up_bit(KEY_GC_REAPING_KEYTYPE, &key_gc_flags);
>  	}
>
> -	if (gc_state & KEY_GC_REAP_AGAIN)
> -		schedule_work(&key_gc_work);
> -	kleave(" [end %x]", gc_state);
> +	if ((gc->state & KEY_GC_REAP_AGAIN) ||
> +	    test_bit(KEY_GC_REAP_REQUESTED, &key_gc_flags))
> +		schedule_work(&key_gc_work.work);
> +	kleave(" [end %x]", gc->state);
>  	return;
>
>  	/* We found an unreferenced key - once we've removed it from the tree,
> @@ -335,7 +386,7 @@ static void key_garbage_collector(struct work_struct *work)
>  	spin_unlock(&key_serial_lock);
>
>  	list_add_tail(&key->graveyard_link, &graveyard);
> -	gc_state |= KEY_GC_REAP_AGAIN;
> +	gc->state |= KEY_GC_REAP_AGAIN;
>  	goto maybe_resched;
>
>  	/* We found a restricted keyring and need to update the restriction if
> @@ -353,7 +404,7 @@ static void key_garbage_collector(struct work_struct *work)
>  	 */
>  found_keyring:
>  	spin_unlock(&key_serial_lock);
> -	keyring_gc(key, limit);
> +	keyring_gc(key, gc->start);
>  	goto maybe_resched;
>
>  	/* We found a dead key that is still referenced.  Reset its type and
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index b7b622bc36a1..cca936f5015d 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -162,7 +162,6 @@ extern bool lookup_user_key_possessed(const struct key *key,
>  extern long join_session_keyring(const char *name);
>  extern void key_change_session_keyring(struct callback_head *twork);
>
> -extern struct work_struct key_gc_work;
>  extern unsigned key_gc_delay;
>  extern void keyring_gc(struct key *keyring, time64_t limit);
>  extern void keyring_restriction_gc(struct key *keyring,
> diff --git a/security/keys/key.c b/security/keys/key.c
> index e88548f1a704..5c2d0e3b49e6 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -670,7 +670,7 @@ void key_put(struct key *key)
>  			}
>  			/* Mark key as safe for GC after key->user done. */
>  			clear_bit_unlock(KEY_FLAG_USER_ALIVE, &key->flags);
> -			schedule_work(&key_gc_work);
> +			key_schedule_gc(0);
>  		}
>  	}
>  }
> --
> 2.47.3
