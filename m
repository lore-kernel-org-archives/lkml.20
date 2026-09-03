Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7F224234
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788394872; cv=none; b=hzKjGhvhA51/q1Siemp4REkOkXSbsdYYl5z0LewDfFV9kwiOj0M8Syaj+zWQVdDIS4GFiMihNfHDXxS+Vf4OZq17kDLP53QHg0/8UnY7SLbk1m6YV+sbnV9kyxoNF0H9586BhpBkVaVoWwiHFd8dhfxD+LSTqX9ZID/ivKrI4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788394872; c=relaxed/simple;
	bh=mjFAKiXB7ZAxn25FoteH1IzY/8IF7hq0XuQIZiUcbvI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iA2RGr486HgzQZRi8HPkcd0tUr1ZmrCMnpj0UZRKs/UvMCKKnE7o5zjtxxY35DNo64Q9ejRmFO4eOdMXzuV3Drjf8oLGsFj3r8mqjSUY55iSucYOSzuupRRb7T3ii0QCZrNmtXB7wXwW2sDHpOAuYIqSIOxOl4iTou2YVPlptHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/77lARf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/77lARf"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e067e908so1493437f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788394869; x=1788999669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4p+kVOqrl9TNdjQ0Ytm/XdNA1rDd6yPAPDCtXX/9+oM=;
        b=R/77lARfp+Sb4OkbWjeEDxOY/ycfah7we/aWQIz9auOmNaMqkLIqhsxAD1lsT9AMRE
         D3mpscDv7Z0WMVZlg4HIq2xgT95HjiCbA1/6cPuqQh6gr/i42zPBngLivr35NaRu4poz
         6MKBJAq/ZnOOqG07h6xNfPBroFVeyY26x2JyA+JO4D1fbppwwofGEKOHHB5jsoSZkvuT
         1C+aeg4ZAvlZGTt4WwWu0jKHMqAHEpc8D9SiOb3zbWLXE4ISpP52Q4oK6hgPYe8rSZyP
         xttsit+Ee+w7eSPeGCdP0zDYmO/hdHQIxUrjoT36kfkFibMi4bPdJ2KI5sLOTNz2Q6jZ
         EgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788394869; x=1788999669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4p+kVOqrl9TNdjQ0Ytm/XdNA1rDd6yPAPDCtXX/9+oM=;
        b=kS4vASShFHeddVDNVnRxNKvr0jyiThy5stXAYAtxpRCU2LMp12xiiA1GobSZLquHib
         JJT/D7gpUnosNYZIAMBo0NaHtwBNba6zp70X9zdkj0qLv7qAv0CQPAf8icEv4gbtlZ2q
         CCeVRr5XX4LvUKKs+P3FG+1LJoaUg5X0ZnC7HqEfTlpkRQYGZCVl8tnPMNaWr6sg6+mZ
         vp53kGRAG1I1eZdZ1FFrdkDz6kT9W3tjZSFucK7xwliIGZts/NSeQp6hTMzf2VfyZ9DS
         1yARDK6R+Si/RkSBMN2zZazfAzZce80WkypjQPnFCJYWPJR6HWZ6mJV5kxF+SIHegbqS
         bJEw==
X-Forwarded-Encrypted: i=1; AKwUvBwEz7QlW1jEwegZ5+5vtyv1b5781pFdorAdnieULp9WZpZhkhCPhxCzKz/mhyRRMeszkgAJR0LD0WvFQKk=@vger.kernel.org
X-Gm-Message-State: AFuF++lQq8aOdx136y/1J+0UJdfpEgmjrV+KGAl8k+z2ktn1N540rcgM
	1BVJe06Z/nAYI34O0I0K/OX5Pvnw+JX/9I96MH5xkEh9DMfHnkxQbNhR
X-Gm-Gg: AYBFou367qJ0dWnzQysWadprLC8ugEYxQ/ugifDYL9zVhMNpNrNiwRmMqZpSi005SmR
	o812yYcM7q3E0kyb+NbN72EAh+9FMQv0DEOl5SoSGjbwsGIvuGAq5pktzZUTFXHq81Mj8+AtLJ7
	ckbko25KeYr1ozWl/6y/fxHVovuXvFTvHKNxo1H+uNPGWd6heALKW/q/9FKtDXgUSYX0lNjxki2
	+KMn6Gx9oUAZLEtoIywuw1YvsmxdWMSwaJ/arcIq/Ln78VIIS56xZY/2piI0O0MuJApE00aVae5
	1tlmw9JHOAXlnFaFO+ellBsxePKFTLiA8ywKRhB1MS6ZV8IXQcF7GoHlIlkdCAsbSfYmc7GwZC9
	vjPbExFMKagwsgKtHAyhKgdmUb/eF2xVFq+aJAypMeiY+YWGDGltV9ZMB21K2DQSACjh+BplDdN
	SlmhKAvgSlAhgtG6M3/4r0cnbgIpEZ5yZNCjIxDVqWwyxQuTZXJJi7l1vcat1pZJl5MbZb6WETh
	tVAz0mlym/y7mVSZBNgMca9POXzuZReM+9Yanv7PQXld/di9wkuEDryxtdEYt64L8VJWe2T6XSD
	G62xZzV8pB8Q3cCAiIYioUSJGkglxEehozx4INliiSDNCSBcGblD3ghLSrD8p/4uQ1LicocQged
	jx/Ho
X-Received: by 2002:a05:6000:22c8:b0:484:4779:bcdb with SMTP id ffacd0b85a97d-48488deb822mr15780139f8f.6.1788394868328;
        Wed, 02 Sep 2026 17:21:08 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a1c2-c401-11b2-c123-0d12-6c0f.310.pool.telefonica.de. [2a02:3100:a1c2:c401:11b2:c123:d12:6c0f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm9709743f8f.28.2026.09.02.17.21.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Sep 2026 17:21:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs_pin: publish pins with RCU list helpers
Date: Thu,  3 Sep 2026 02:21:00 +0200
Message-Id: <20260903002100.34822-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pin_insert() initializes a pin before adding it under pin_lock.  The kill
paths read the list heads under RCU without taking that lock.  Plain hlist
insertion does not publish the earlier initialization to those readers.

KCSAN weak-memory checking reported acct_on() callback initialization
racing with pin_kill() after the superblock-list publication.  The
corresponding LKMM model permits the stale read with plain publication;
the RCU release/acquire pair forbids it.

Use the RCU hlist add and dereference helpers for both pin lists.

Fixes: 2798d4ce6160 ("acct: get rid of acct_lock for acct->count")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Reviewer notes:

Tested on arm64 (Raspberry Pi 400, Cortex-A72) at cf72cbb39da8 with clang,
strict KCSAN, and weak-memory modeling.  Concurrent acct(path) and
read-only remounts produced one __arm64_sys_acct()/pin_kill() report in
the baseline.  Disassembly identified both accesses as pin->kill and the
write as modeled past pin_insert().

With this patch, the report was absent at five times the baseline
exposure, while unrelated control races continued to fire.  The LKMM
plain-publication test is "Sometimes"; its RCU counterpart is "Never".

This demonstrates modeled reordering, not an observed crash.  Plain KCSAN
also found no report in about 400,000 acct() cycles.

 fs/fs_pin.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- a/fs/fs_pin.c
+++ b/fs/fs_pin.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/fs.h>
+#include <linux/rculist.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include "internal.h"
@@ -22,8 +23,8 @@
 void pin_insert(struct fs_pin *pin, struct vfsmount *m)
 {
 	spin_lock(&pin_lock);
-	hlist_add_head(&pin->s_list, &m->mnt_sb->s_pins);
-	hlist_add_head(&pin->m_list, &real_mount(m)->mnt_pins);
+	hlist_add_head_rcu(&pin->s_list, &m->mnt_sb->s_pins);
+	hlist_add_head_rcu(&pin->m_list, &real_mount(m)->mnt_pins);
 	spin_unlock(&pin_lock);
 }

@@ -73,7 +74,7 @@
 	while (1) {
 		struct hlist_node *p;
 		rcu_read_lock();
-		p = READ_ONCE(m->mnt_pins.first);
+		p = rcu_dereference(hlist_first_rcu(&m->mnt_pins));
 		if (!p) {
 			rcu_read_unlock();
 			break;
@@ -87,7 +88,7 @@
 	while (1) {
 		struct hlist_node *q;
 		rcu_read_lock();
-		q = READ_ONCE(p->first);
+		q = rcu_dereference(hlist_first_rcu(p));
 		if (!q) {
 			rcu_read_unlock();
 			break;
