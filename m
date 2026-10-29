Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252727;
	b=C3TrdTIuDHQLgRWYiux9iCmdXCTH/ui33jK8a2NiLnhDwDteKbmRL2HSyGrlvhwhhY8T
	 TLrKe5cnReUE4ewA+gzuZSP+k0WX37WeWUDfr0Y/nQlvHaoNAlfsIYdphZOGS6AD/xqka
	 k9Zofuc5NGb2W3nwE7Q/5YqEtUhzeUxL/X9g+jBvH8o/EMiJ8047a1wxNz/6aDNbAcbMf
	 XdSSFozk/KUYda/A3XFBlwYn6JZDEgY6RiOZ0juWA2WXtXMqv+dSXITjNcoC9rFb3KKZ4
	 8gYFXx/JkhVC1sVfdTRv3OHeBHNUItfJ1z8B7dkXbGLSEhu1IEU3XcRny9bAAUjvBOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=adSYFoYAePHJdbuRdaHU8dMgoKI+1ZI1I5xA5eoT1QA=;
	b=le1iTlbXTv4iDfcBvB0FjSLegksMehavHZFXBGgyxHgpldbvAcbG9aP8F6ZmxBpFRulf
	 hoFm9uCwFFLvQX/Q3K5ayHKZpsh5h82KrRzGwqAyjxHOpfRiJtXWYdlRnAY3nJFveM1tI
	 0EIVZLkhKHHqxZs9fLEd9/faRKMPjGbBmqsI2Fqqq+/WzZ33l91WI+GdVnx6PiXWcpKLX
	 Qm38eYD670PTDDlfe3yOSHgAJ3qCNZ7Oz6eUBS1V1MQIfgAcOdtS6LDKnfQs7oWRJy81f
	 qv0bCf1gQCU9UJaxeJYGycd4/I79P6O/BJM9MAYQzyfcGoviHGrS8eWwmuzbElStCLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Jg96Hof;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5A4606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC5A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Jg96Hof
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a18fc7a38so3573757eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252726; x=1793857526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=adSYFoYAePHJdbuRdaHU8dMgoKI+1ZI1I5xA5eoT1QA=;
        b=0Jg96Hofm475on7M+bD3y2loejPit6r7Nm73lNMFr8CtE8Yx3nWrfC0xh6dhkIs5hU
         LKQwBIH/y4FLOj90dfz2buYbax+izjBJLxZ0iZmY0Iu6hpLYr/ELKHXlryxBGJXhKgYs
         zfoDgfSt0++gOk/BZJOk4p17ywb16bghajH3DiVauI0Rbs5cAIeDXtH06leTZbEBesqB
         fCXHdDm2v5VutKkOrA62H6R/uVPqkjgl0Cz5bhedxZLO89F6YHnoCLMhZQ5Qh2KGFkcC
         1q75Ow/s0DpKNzGVAVUpSrozSG4uWq/NSDLa9Zj2IELvT8oiznN1FH+/jRSU9j2FUkux
         k9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252726; x=1793857526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adSYFoYAePHJdbuRdaHU8dMgoKI+1ZI1I5xA5eoT1QA=;
        b=eoYQeAM2bkUkypTxnMmO3xSAbdnafu8OZx7rdbef+99AsEIvaahe8IQmXdQ5VFM3D3
         hCj8sXzP9l/+KsImK+zHrj5M8D3zR/Wh2pbDVrb6dM2dU80Wsfso+iq/Qa9XCOk1qLWk
         HB6WoRPr05A0vDnP+KZNGA433G1fLgevhohtJon+BtCtwKaPtAEZoKDMbB5NoOFxxFa+
         9SbdjnoH7HD1K5hCmA81GIyjkdqgNXQF3doqwwYg3rdfSdiKGD26EQfyaPxxJKn4IeYZ
         ARMtglf65L7Zz7F4/0AzP6WtuNP9ROxLZj4owTwuJX9Sn7pu4ErZyajizGqRqz+XIV8i
         jWmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfHVUNydXj0/45RV8Qiawyfo3FicDjLnLUWFSXdwZknnxCliohr40yRT7SjvihUHu6eC+4x+PZWdZaHlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp48i7lXUnxrUn5wGhsU6+cTIqSclFcy8Ap2a3/VGmhn8jubrA
	B8YYo6G1e6HGC94ZIz4mLKJL/MJTGJNM0lCmgviSkfBic79rRyZj3MlI
X-Gm-Gg: AYBFou3lzPEurIEAG8atbt99v3OC4lwyvbbG2bqdglnQouuSQBAscHUIZRJyCbq+kyB
	O8J+YzfaA1Xr5HUxZqWQoxOnGCdhLlBeiUm4bsQ3NkQacNw3kk6hPJeA2CVU44YUnnBHQtbU83/
	Rk5PGuoqINl+OsGtOpxQnQZgqs0Xz0R1RvZ8zU0xeyt7eI2Ak8DiS+li6BOX6Zc28WrlToLd6zk
	I/6a2SeLVBtt8mC4Q+9z1tmQtqIdMs5FWhgtZWG2bIPUM4frPuVt+egNsRLkut/GQVi8XL1jSYo
	GVViG6ZE0O/I+iBAiasXcjjpGMhqq6tuEbB9PRMf2e7elLdJ2I5gAxcJXRkXffIlfuV181mM6uN
	DJAhfKFPUsF5pU7iCNLmf/oJN9qR2FJkSVF8kKjvxBZxOzTFhLLLCN9LdmSoSbV9N3J8/3QOH9W
	tJt0vxwPd9bQfiafKKccnzl9590olZ+iUbkF3vqFFySKRh9NGIzXH61CzRZaX7xn4DSzrn8IXoT
	YiDYbUcpOG9nBa2sTOiuQAk+2pQUDit/SErYVIRuqPWp+28C9dfqBQCl/9pwd1NWz6WiDvx17fA
	yRxoOHKXn1f+OJvDQRyjuip6/w==
X-Received: by 2002:a05:693c:638e:20b0:369:9eea:cd25 with SMTP id 5a478bee46e88-36a204065cbmr6483826eec.7.1793252725624;
        Wed, 28 Oct 2026 22:45:25 -0700 (PDT)
Received: from lion.. ([166.1.190.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bddb7sm12294142eec.3.2026.10.28.22.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:45:25 -0700 (PDT)
From: Zhiyu Zhang <zhiyuzhang999@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Cen Zhang <cenzhang@linux.microsoft.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org,
	Tong Liu <lyutoon@gmail.com>,
	Qi Tang <tpluszz77@gmail.com>
Subject: [PATCH] watch_queue: keep info_id separate from rcu_head
Date: Thu, 29 Oct 2026 01:41:36 -0400
Message-Id: <20261029054136.1174216-1-zhiyuzhang999@gmail.com>
X-Mailer: git-send-email 2.34.1
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

struct watch overlays info_id with rcu_head. A notification poster reads
info_id under rcu_read_lock(), but a concurrent final put can enqueue the
watch with call_rcu(). Enqueueing the callback writes rcu_head before the
grace period has elapsed, so it can corrupt info_id while the object
remains legally visible to the reader.

__post_watch_notification() then merges that value into the notification
info word without masking it. Pointer bits can corrupt WATCH_INFO_LENGTH
and make post_one_notification() copy beyond the posting task's stack
record.

Give info_id storage separate from rcu_head so RCU enqueueing cannot modify
it. Place it after the kref, which uses existing tail padding on x86-64.
Mask info_id with WATCH_INFO_ID at the point of use as an additional
invariant check.

An unprivileged shell and keyctl reproducer was run for 30 seconds in QEMU.
The vulnerable baseline produced malformed notification lengths, while this
change completed with 288631 key notifications and no malformed record.

Fixes: c73be61cede5 ("pipe: Add general notification queue support")
Reported-by: Tong Liu <lyutoon@gmail.com>
Reported-by: Qi Tang <tpluszz77@gmail.com>
Reported-by: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Closes: https://lore.kernel.org/lkml/CALf2hKveij_sHgANY9Aktm1dPa4wfKjKNkHyp9yPbjORWFXagA@mail.gmail.com/
Link: https://lore.kernel.org/netdev/CALf2hKvp0NPVLwr=a3+jUHtPohxbra8gox+aYAfWathJnn-J+Q@mail.gmail.com/
Signed-off-by: Zhiyu Zhang <zhiyuzhang999@gmail.com>
---
 include/linux/watch_queue.h | 6 ++----
 kernel/watch_queue.c        | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
index 429c7b6afead..b87e1babb5f0 100644
--- a/include/linux/watch_queue.h
+++ b/include/linux/watch_queue.h
@@ -52,10 +52,7 @@ struct watch_queue {
  * Representation of a watch on an object.
  */
 struct watch {
-	union {
-		struct rcu_head	rcu;
-		u32		info_id;	/* ID to be OR'd in to info field */
-	};
+	struct rcu_head		rcu;
 	struct watch_queue __rcu *queue;	/* Queue to post events to */
 	struct hlist_node	queue_node;	/* Link in queue->watches */
 	struct watch_list __rcu	*watch_list;
@@ -64,6 +61,7 @@ struct watch {
 	void			*private;	/* Private data for the watched object */
 	u64			id;		/* Internal identifier */
 	struct kref		usage;		/* Object usage count */
+	u32			info_id;	/* ID to be OR'd in to info field */
 };
 
 /*
diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 932a88ac1f39..453dcf613205 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -212,7 +212,7 @@ void __post_watch_notification(struct watch_list *wlist,
 		if (watch->id != id)
 			continue;
 		n->info &= ~WATCH_INFO_ID;
-		n->info |= watch->info_id;
+		n->info |= watch->info_id & WATCH_INFO_ID;
 
 		wqueue = rcu_dereference(watch->queue);
 		wf = rcu_dereference(wqueue->filter);
-- 
2.34.1

