Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890698;
	b=FtCnznQOEGbyUHKYrYOOo+yEdxendcYfI2GPet53dw6VTbl/T8cp3nA82Bn4hFiQ7AeZ
	 zRliwJ+T8red/6xgTOuXCwB3FLWpMgPacpzJowUlNARqZw8SzLAXxUrinus7yxYasAC2g
	 l7nCP2rymfT/s1ShdXCZ8LXVEibJQ2Pn2faVaFl01+MMRDwV+o5TLGj4SD/7hndvdaFik
	 l1VnBAHiZ93UPGZiUmEIvrzEkRhvkpd0dgY/E2U7wQL+ENVwhRjVRhkOvhraR92r9zVqL
	 KH4EZm84Ma3bu3U4dsTAAvX7yjvhpC8+7nkS4ZLUE8gzjYYXCW+qW5Zy4Ic8joj0ZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=N2Sw5k2zoAbf8kMPvXvGclCJzMguKEAbJOTPyXxLomU=;
	b=BZSnWlXdecGLFivIaDRIcgE0f4CWKPyHYieHMEW+OiyPJ2JF5f+6AO45Z3JPrXpDaCgv
	 12xlfxOt6mEnHKPccA35F9JMEmGEfKZWuo6yb6AVyMt5Dua3LutXdpdmfzwMmMNUct4+4
	 J+TxlAIoI6jQIjI+351aPX8Nv5PQP5WuXYqEru08rvVsdmm2ruvwQ0wkm/Nhcm+oc63oG
	 hZV2CV4ZdJbwvh8n+cHvjETXQeUj3izlcBKevK/uGc1BKsU+XVNk7s39HmqfOnd3/X4e4
	 CO2FBAlYk7uP0ZM23g2UmVwG5qvz6QnKMd2UXGl0kGBh48/jNYk/3utXVyJLfNjlNlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cUkzH9nV;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1F606D836
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D1F606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cUkzH9nV
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-85a5455bd3cso1064152a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890697; x=1794495497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2Sw5k2zoAbf8kMPvXvGclCJzMguKEAbJOTPyXxLomU=;
        b=cUkzH9nVh0CF0EBc9T+AQdS/3nNNE6tdOjn75GHN2koVLh7GoGrvjOCRGW84jf5iG+
         tudm86E1OSWUU9hFQM8ERCHMpPCjRJW5zt7zicSb2Qaik59an2iIiYEUuhUIxx6gUIcq
         fgDB2256saUYE8DA+t8neyNawnRIubLkTdTFfDpADRGhJjll0JihxKpK32ukAqFy6knj
         CDTy1vVK1k7SvpSWeZhpO+O5VsaQA5zK2RdS8g89/5V7Pz8ABLK4HExdXygsiWvZ6Zow
         aecMyIdRLoWmmZwyR7IuOxXz7xwnBLarTfKFsaGXcET9jvHrHsItDqufw/VLeeDA2Ax7
         Mt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890697; x=1794495497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2Sw5k2zoAbf8kMPvXvGclCJzMguKEAbJOTPyXxLomU=;
        b=Wh7B1cS+n2bauMMLiovaZN1lo+OxQWtRMtTtnFs+bSDLOirME63d/dZztCIO2fYvU1
         EV7VQoXBJv766fRbNMpTeZJzTnBlxVqap4n4a5rlsYgFXWFA0LVX8aoWaLZtD/qeYdde
         pbU1V0TmsvE8jvw+W4EdGVKmbAhL/z8ghctZOB+jnTKsnQkNb0+9f4YiaMClLJBUcnxK
         04eilZ2yFJctw6Uad6igLY0tgDv2TI0H4e6lOa7+UMX0HBe5pr/o7pQ3g3i+ApLOCgJ8
         /WHi3B2zbAKpZO59TmtlJAlgds3H1WmJpzLSi7zBx1jlp8Hdf6AFbimmRWV69SE32Yzh
         diQA==
X-Forwarded-Encrypted: i=1; AKwUvBwDMhvW3LuYLj778qgYutOdZ+nPgM0W7Y5jLMOSno7K7SM+ohivqBcTQONa4UOL+4uHf5n3xCkdji2YL9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j6mpnAK93fKzu1JZA6G/uxfgzj0nYeHYf1euReAZDQ1gtfM/K
	IDONhlVYf4Sr5cUTdTObddEmFy1731o2KacAmU6KrkyAJyKMZD5Br/ZyQyE66UZfj5E=
X-Gm-Gg: AYBFou2lTGSJc95DUmB9/yZzEioIZi6/5v/KGUHTL2zqWnxH25vDr3RcwxAQpf1JfdA
	BOEz2GVHx0jh8eywPcL9Bp6P6OZeb0ru6EmRq6701fAWNBTsSX/+l4U+5xhJX/iGaIPjsS202Hy
	7paFGGYLFsPD7CzUa4zQaYeRO6CTRemr9IPVnokgsGnqgISKrsGWNWbEX0qJssXZw3gspfrsL7g
	Hg+TWRT5S8pM2dxRKvaRfzVOoivrZ9rJPkLUA/Y65KIUOobHhw75pjJNmNZXIfFC98evqFF/31M
	z0gXBjm59gpl46L5JbCnZTDqgxxWCKqiqpLowcg+AiNC091IRV1W9xSZzzMaV7NRpu153ckbBJt
	n8MdZPyQxFC7hnjDPUWVUOxSdISKA9qBqwd9xqaxITXCr2fFuv1bmnNW13f502IDofdSpY803Qd
	wagjs+5EZZcAuwoMKUHDEkEQQvJ3yw9oZHXkyzj1ZoXdDZDS17e6hSGVBc8rMCbbWGpqbQz+QJ6
	3de2borYq9l2YpbtBj4KCYYmX1PNbPLMSzcCttdmx3rlfM3leSiNdMDiZWyPU34jS5qboWIKFa4
	TbpJYOmJwEGMeUgaQa56WTNZhqjsACJmcgBdqfy4J+kjHg==
X-Received: by 2002:a05:6808:4f07:b0:4e6:b6a1:5af2 with SMTP id 5614622812f47-5640dec8e9dmr14562981b6e.51.1793890696980;
        Thu, 05 Nov 2026 06:58:16 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567ab6a5270sm4310527b6e.0.2026.11.05.06.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:16 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:02 +0000
Subject: [PATCH RFC v3 11/90] keys: add key_user_range_in_use()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-11-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=2810;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=FsWxd9HeFTqWLJHWFepRnb32ZJGXZSQ+D5GxnVuPwnE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM4q50/Vtn2BVCZXSWdRPrBYhO+eUfTN4poTCTQy5zQKsnEv6M1CUaQGKBoNweOydR+a2m4acAF
 YFGWrNpZ3Rw4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The key quota record of a user is looked up by a bare kuid and does not
pin a user namespace. The record, and possibly keys that are charged to
it, can still exist after the cell that used the kuid is gone. If the
block is then lent to another cell, that cell would find them.

Add key_user_range_in_use(), so that the block allocator can ask whether a
quota record exists for any kuid in a range.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/key.h |  2 ++
 security/keys/key.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/linux/key.h b/include/linux/key.h
index 115db6e60254..0bd77fcab4db 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -461,6 +461,7 @@ extern void key_set_timeout(struct key *, unsigned);
 extern key_ref_t lookup_user_key(key_serial_t id, unsigned long flags,
 				 enum key_need_perm need_perm);
 extern void key_free_user_ns(struct user_namespace *);
+bool key_user_range_in_use(kuid_t first, kuid_t last);
 
 static inline short key_read_state(const struct key *key)
 {
@@ -521,6 +522,7 @@ extern void key_init(void);
 #define key_fsgid_changed(c)		do { } while(0)
 #define key_init()			do { } while(0)
 #define key_free_user_ns(ns)		do { } while(0)
+static inline bool key_user_range_in_use(kuid_t first, kuid_t last) { return false; }
 #define key_remove_domain(d)		do { } while(0)
 #define key_lookup(k)			NULL
 
diff --git a/security/keys/key.c b/security/keys/key.c
index 6ebb8691551f..0a6e741805d6 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -113,6 +113,44 @@ struct key_user *key_user_lookup(kuid_t uid)
 	return user;
 }
 
+#ifdef CONFIG_CELLS
+struct key_user_range {
+	kuid_t first;
+	kuid_t last;
+};
+
+static int key_user_range_cmp(const void *key, const struct rb_node *n)
+{
+	const struct key_user *user = rb_entry(n, struct key_user, node);
+	const struct key_user_range *range = key;
+
+	if (uid_lt(range->last, user->uid))
+		return -1;
+	if (uid_gt(range->first, user->uid))
+		return 1;
+	return 0;
+}
+
+/**
+ * key_user_range_in_use - is there a quota record for any uid of a range?
+ * @first: the first uid of the range
+ * @last:  the last
+ *
+ * A quota record, and so possibly a key, is keyed by a bare kuid and pins no
+ * user namespace. The id block allocator asks before it lends a block, and
+ * before it takes one back.
+ *
+ * Return: true if there is one.
+ */
+bool key_user_range_in_use(kuid_t first, kuid_t last)
+{
+	struct key_user_range range = { .first = first, .last = last };
+
+	guard(spinlock)(&key_user_lock);
+	return rb_find(&range, &key_user_tree, key_user_range_cmp);
+}
+#endif
+
 /*
  * Dispose of a user structure
  */

-- 
2.55.0

