Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892192;
	b=ZthKh1zRg1pbeX9UvX0vdMhut3CkQ8shrfQmhEEJcX+muWyZmk0lOwbepETBQVSkTMHa
	 jQlLK/ll2+kWnL6G4O/fxaF0w/hutXO0WMZbCrZrPB1knBpSSoAHvK0j0V3KydHsDUDLE
	 z8wd+f8Hq0uE8b9YX+zkjARC+eNwWewWlqZ+v1HUAUR4UsPGhzFMxew9vAVSTwqra//el
	 Pp6HX2/qqKtaS2XCVYWduMUtkAkfBSz4nyzv52ZSaOWsCQ2otwLadXJ/WaUEVE67tI0vT
	 6vIJja/tTgSRN8+m5+VzWiQ8cg8xYcpalaHyq5bEmMy+DUUn/Fl8Dd3VExpUvTH0ZaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7nibMrCIpte7jH5Y8CAGvaqEIBCNW+oSZWFZBxDYXLE=;
	b=PxHigFb03iY9gdXLhHWSy+LtuYJ/G1Z4c/g8atrsf0x8catQUzDup7gLWucRvf1AwIlw
	 ppYo4wGDzd06zXPn0Vfi3MqcGUvcxbLOVmpKgPqkDHkcUhLWkT79ZOHu65ndUK+Bln/ks
	 g9xH68o4Cf1EtwEGnN4RykJjF5JFOvM54lA0APz4a1zKCnklGHi/DjpkES4t++VOtV4Nu
	 QzJmllft7hXffQsK//dBW7i5X3zD6ZwFdzD4guOEMeTPCiYKXwU2Pd/DKgerr4xWjrI3M
	 Z1p/FTi3bokb2vbdQ6jaBlGWsKJCEb4gq1c1xVP1bEe9NVXGNCqLY3Nqg96ELXZBroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=SJ3S7ddg;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EF9606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3EF9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=SJ3S7ddg
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac4855401so726791e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892191; x=1794496991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nibMrCIpte7jH5Y8CAGvaqEIBCNW+oSZWFZBxDYXLE=;
        b=SJ3S7ddgIFwcbq2m1gWe6fuoQBo3baFdlZbqSrTU9Y8NlYbFHnEgcwtRaBQ5FaH7dP
         nf+pKjYp4aXGXKYlTOgo5hwgPi81b7zknbaKXjIv8wgWcuzJhD6WFKh+w0B2JWNoCm3u
         72C9GZWXfK+3af73KJHj+BoZbFzjqbsprhQHFDevbn8/X352+HXe/HFtslDEqPAqV/Il
         EOdh0eNZRkjwbfgaCF2MqQ9lFklGtQ+mJhQvFw02Ohc5DCtZZSE4/JEfor1vVY9tiRkF
         QPo9Rpc3pQogSYPWM2zODkVR6Gma8eHYwbBrBoC67Yo1tP5py4IRhK3GY1hXhxBL7XI+
         YVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892191; x=1794496991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nibMrCIpte7jH5Y8CAGvaqEIBCNW+oSZWFZBxDYXLE=;
        b=g9v2rxlqCXHJ6ojKBumdpxcchVE208gD8jGvsESX7U7HS24ht+3/37th8pXgfz4G+9
         xH8QiQoYx5QBRa9sOxieQ6u26nVNPod6xI4YW7Jt0L+MzUWwUTyKDrs2LjpMmDioesCC
         Jhk1lD+JfRzCvvsPDEE1Kd5hK+NI4QadttFRNZq1RkalM39FuQKrnD67BdOGOOr21N8T
         yQZ5MBxQeoAFhFxYb22Cw3I5EsToaWttIsuMGSR21PbfXqFkpnyinCJxqbljQg31gN09
         ZwIfdTx6x/3t+nZH3A01lP3PNJI/nDhDswBjNGK3z51YpVmazMyeLLxb9KJ24K9VeF66
         7fOw==
X-Forwarded-Encrypted: i=1; AKwUvBwzozRUJerSz/tKrFZgQO6o2/9vlyfrHMe0P9/v9wK5I6BjdVR74VOx0w2xlKaqUtSKqkzNn7pKM5s/J3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zz2RzkS/fFKTTLgc2cYsKXZFuuS3VuZYEsSz5P2XviLMJps1G
	8v22tDSrl2pUaDQz/SBHMPIkuU3lClzptpSZNVgjStnjVylMOmFwFecFEfCU1ZDX7hk=
X-Gm-Gg: AYBFou1rIKQI9BDYH+y76XD2mVGGhrCCd9/gHzMJ+7upucOHwlRpBsB8zGKdmtzU5E4
	UQ1XzQk6GdwGKPdot1VQTOFR+YW/hemawGJ4lJK513Vc4NGjDVkZjR+QUlvhC3RbjTQ6kw4K+c0
	E/AKtsItkVpm1qt1mOfBpULfw3QnOV0tITo79BMWEw7xHz7PTvaRFkkn6bIzAFsnvCKTJUa533a
	Y8qZP1e3VeSP0mApE+/RW2Sr8cMY97JzohdcbI7cI2Hcta8dSoic1JMNR7miD3ZjY/qLlSWVEyp
	ZK9TWPmRIfQLHDRUukCyks7Rxboi+SQRO4SvrqbM72afzUZbxlVyiXlxL5ht3JxXmPnZLNylaEY
	CuJJuFrGScVpAN/tzUtdOLlgSWA95VSpUaR6hk0+p0Kyo/D4z7fZwayF4/2nhqHt+FUNSxV7xaL
	QeItg26uhjBjN5B9wFAWWf83aIc1QZfbiVEL0qN7L8k/ux/DTfwEVTdIalgjR6sQTBoa89N2T/5
	fPvjNwzwwmZx/+51BYN7m4AbyD4+G4A/eG22H9r4pI+f3zSC7+r2+FGo/0eNmMps4vAuuMhbSHK
	HH9CcCKBOlWgbT9KdY2qwlTb/vvvLg==
X-Received: by 2002:a05:6123:107:b0:5ce:76cf:fb2e with SMTP id 71dfb90a1353d-5ec6895c8e0mr9718425e0c.16.1793892190463;
        Thu, 05 Nov 2026 07:23:10 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8de4908sm4413311e0c.15.2026.11.05.07.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:23:09 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:54 +0000
Subject: [PATCH RFC v3 62/90] fs: let a cell set no set-id bits
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
Message-Id: <20261105-b4-cells-v3-62-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=4050;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=uGei2RogEpESKKmv/nP3/P9QyFXxqNI+laosDw1/MVg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJgeQkBfm+e1AUIUpI0YTHKRg5QtT3m8jleMm9315EAWQQ7tX8wlAjDhGVMBaPcUZxuhL9RYViZ
 zghTq45ZcVgg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A file can give a process privilege at exec, through its set-id bits or
its file capabilities. Every task of a cell has no_new_privs, so nothing
that runs in a cell can gain privilege from a file. But that is only half
of the problem.

The ids of a cell usually map to on-disk ids from 0 upwards, because that
is how container images are stored. If the root user of a cell sets the
set-uid bit on a file, the result is a set-uid root file for anybody else
who can reach that filesystem. Only directory permissions, and a nosuid
mount option that the host has to remember, stand in the way.

File capabilities cannot be written without CAP_SETFCAP, which a task of a
cell never has. That leaves the mode bits. Clear S_ISUID, and S_ISGID on
anything that is not a directory, in two places: in vfs_prepare_mode(),
for a file that a task of a cell creates, and in notify_change(), for a
mode that it sets.

The bits are cleared silently instead of failing the call, so that
unpacking an archive keeps working. setattr_prepare() does the same with
S_ISGID for a caller that is not in the group of the file.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/attr.c            |  5 +++++
 fs/namei.c           |  3 ++-
 include/linux/cell.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/fs/attr.c b/fs/attr.c
index 10cf1b3827c6..946fba92b5c8 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/cell.h>
 #include <linux/time.h>
 #include <linux/mm.h>
 #include <linux/string.h>
@@ -457,6 +458,10 @@ int notify_change(const struct mnt_idmap *idmap, struct dentry *dentry,
 		if (S_ISLNK(inode->i_mode))
 			return -EOPNOTSUPP;
 
+		/* Nothing a cell writes imparts privilege. */
+		attr->ia_mode = cell_strip_setid((attr->ia_mode & ~S_IFMT) |
+						 (inode->i_mode & S_IFMT));
+
 		/* Flag setting protected by i_rwsem */
 		if (is_sxid(attr->ia_mode))
 			inode->i_flags &= ~S_NOSEC;
diff --git a/fs/namei.c b/fs/namei.c
index 925aeb63bfa1..49995c353292 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/cell.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/wordpart.h>
@@ -4162,7 +4163,7 @@ static inline umode_t vfs_prepare_mode(const struct mnt_idmap *idmap,
 	mode &= (mask_perms & ~S_IFMT);
 	mode |= (type & S_IFMT);
 
-	return mode;
+	return cell_strip_setid(mode);
 }
 
 /**
diff --git a/include/linux/cell.h b/include/linux/cell.h
index f204c47ee783..1d0eec34acb9 100644
--- a/include/linux/cell.h
+++ b/include/linux/cell.h
@@ -256,4 +256,32 @@ struct user_namespace *cell_idmap_userns(const struct file *file);
 static inline struct user_namespace *cell_idmap_userns(const struct file *f) { return NULL; }
 #endif
 
+/* Nothing a cell writes imparts privilege: new files and new modes. */
+
+/**
+ * cell_strip_setid - take from a mode what a task of a cell may not set
+ * @mode: a file mode, file type included
+ *
+ * Nothing a cell runs can gain from a file, since every task of a cell has
+ * no_new_privs. This is the other half: nothing a cell writes can make anybody
+ * else gain. The ids of a cell commonly map to on-disk ids from 0 up, so a
+ * set-uid bit set from the inside would make a set-uid root file for whoever
+ * else looks at that filesystem.
+ *
+ * The bits are dropped, not refused, as setattr_prepare() drops S_ISGID for a
+ * caller that is not in the group of the file: unpacking an archive keeps
+ * working. On a directory S_ISGID is about inheritance and stays.
+ *
+ * Return: @mode, without S_ISUID and S_ISGID if the caller is in a cell.
+ */
+static inline umode_t cell_strip_setid(umode_t mode)
+{
+	if (likely(!(mode & (S_ISUID | S_ISGID))) || !current_cell())
+		return mode;
+	mode &= ~S_ISUID;
+	if (!S_ISDIR(mode))
+		mode &= ~S_ISGID;
+	return mode;
+}
+
 #endif /* _LINUX_CELL_H */

-- 
2.55.0

