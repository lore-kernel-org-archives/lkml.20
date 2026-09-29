Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B40450B409
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683615; cv=none; b=mZN6U5kXr/rqAvkFhm94SxXH4xRbnBz8Ofn8DhFe5jjeIXRZrDUoL3JL5EvHi2ajimlvH09PN3+84jQyexpWWXxBn+5lFPgEocW+x5hC5mIJd+BaDcv8MPmSsIFwICerbNrjwfpLOPddTAIiIlyRXkfx7L7lXrJFcvF+S+tUOxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683615; c=relaxed/simple;
	bh=cw6K1bJVM4FTepdHnMr8XGawd7FdftBhQBJ9hvJGySU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yik02CTODE2K6J0B/3+pQqYCV7DrDKtvjqZ1PVC8NmGy6siPK7jgxmCcYwohOXocR86VQaXZry7Y0sjApSiK8YA4YdeZyV7GK4xiG/isJ0lnIxitQRCWRFYhfxjMuDN8XcZB0jmDDmVZlGyPFV9AfVb374QKc9AgCJ4cXgErKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fl02s1S7; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fl02s1S7"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so2408001f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683612; x=1791288412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I71aWBR8pNwM1aU/v2ChTsdEQp7VD/GMMaXRQDtGhpo=;
        b=fl02s1S7o4PSrL6fgz+D7CeUPQG6GjQasZf5n/DRSZ2m2R2u2AB5W01TnxQnNKsWQD
         ScIafK6+H59ryuaYznZbyh0kRZ1R0LsGoLXR3/6uPSe2ftb+k7D0E8ciGBM53gZEFMqq
         8HJ+NtdCeZ31VveX3/v0+NjojBbRUsnaN+1dFvQxsxu+PxnzVlpRPPKC4pvRNJEimWRG
         06C063hU6k+P76IHqUYs+41VWgcBnPocwb+XJo8e9NY0+e9uVKM7W2EwSo15zGLTHmnz
         n44poshUUMBGsBXKSrjBtokqlKsjLQi8Z5Ayk3PopRoHsNCwqszzKVSFScy0O3YU7H2w
         VV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683612; x=1791288412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I71aWBR8pNwM1aU/v2ChTsdEQp7VD/GMMaXRQDtGhpo=;
        b=EIFapNIyvoJFUjaGiGjTsuh0r+I/COnMwwbmTdV/oqSy0PdNZvHL55aBi1K51fza9e
         NzwbYJnutwdAcN/rfTOnVwl9tLJkCuh2oFwoQ+FSQhPW+foquLz+kKEbp3kNj7/olNXp
         E/zCZzJgg8+NUxgzta11MkeoOE+rI0/Ys3gK7owPTixZFIWugQ77dQbDzyfpc8fPitor
         5ZYswTOrWOuWbNt3qAORFadmLFbVVhQIllomG54h5Mz43Qdi5V3fySbpKYrhZAtUR5Gu
         DNNryhGYe7icTp7S4X29cSZGGjE2oE+9/xSyDd4kiMbEWYxu4/XpSg7nzHEiA2GrXjEF
         kyDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4ARAb/EtquEWJNY+VYwz++HxCTt6OksEBxOm+MV3LccGKN5+IQI7dAbjH6fxq8CSHtvbnehrgm4xrgqU=@vger.kernel.org
X-Gm-Message-State: AFuF++m2GnIbylrtS0t4fGkDt2s2+q960WJfjz1gQSPD2tq36ypVtz4u
	bhjuz8JWSefCWKaQmSRh52kWurtrE3GO0WbmMonayJWWBpPBmCinI/EhhQpDeA36cQWEUaLjArL
	cx5RVzZg=
X-Gm-Gg: AYBFou1K9lg76hj0VbPWsgaV17b3O2VyCjnzNUF95xdqupwOcaFx2PJP0UEkCxWVVLr
	7UcOra0tZzU/yKvRGUVzpJWz8JTrVFGXzShA9i7Pl7gbz6VCe51pQOkT8hyWVSkq364YWdoCD3m
	iusTLbnLzFoAP7w9g32HxbSlsfdRJeaUG+iERdscqHEk5DSCibznFb3xIx1wBp4XkhGm/3MnCvQ
	f+sgvuyd09yerpBj9q8gw9B83jg0GjKFHxQw083H5XczY9iI5BcMps3kBKpxxWC22dGoyg+2+jy
	ZdhEH5s3UDmeS4o5uFtDIXzDyTK678D9awmMkT4SZDRItPVX64qvOnnXD7q7UHIYaLZGOJVWhDD
	48aku43DAcEfm3eI0xQj3YS8gVgqhBHWlqvn9VEDiTWU72wAM/Xhv9L4DyKGQJfq9QadgSecuez
	FgrH5+mHiQxepilNyjW3kkWdD0FbuI1kie9jRqUhIl9/0kbazkWhutHVhwekNAYQ931FtaYeBeh
	iOK0m4=
X-Received: by 2002:a05:600c:4704:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49fe66ee908mr260895685e9.23.1790683612272;
        Tue, 29 Sep 2026 05:06:52 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm85143285e9.14.2026.09.29.05.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:06:51 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 05/16] printk: Prefer the console either via name or devname exclusively
Date: Tue, 29 Sep 2026 14:05:35 +0200
Message-ID: <20260929120546.328616-6-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929120546.328616-1-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 7640f1a44eba0cc1a4 ("printk:
Add match_devname_and_update_preferred_console()") added the possibility
to prefer a console driver via device name. The name of the console driver
gets assigned when the device gets initialized and it triers whether
it is eligible for a console.

The above mentioned commit ensures that __add_preferred_console() is called
at least with name or devname value. But it does not check whether
both are defined which is a non-sense.

Add the check and do not fail quietly. Also shuffle the code a bit
to make it ready for adding more checks.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 174aee533a53..0199c918ef03 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2557,7 +2557,13 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  * The function adds or updates an entry in preferred_consoles[] array. Also
  * it updates some global variables which are used to make the right decisions
- * in register_console().
+ * in register_console(). Finally, it enforces some rules:
+ *
+ *   1. Either @name OR @devname are allowed. [*]
+ *
+ *  [*] A valid @name and @idx will get assigned for a devname later when
+ *	@devname matches during the device initialization, see
+ *	match_devname_and_update_preferred_console().
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2587,11 +2593,23 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!pc->name[0] && !pc->devname[0])
 		is_new_entry = true;
 
-	if (is_new_entry) {
-		if (devname)
-			strscpy(pc->devname, devname);
-		if (name)
-			strscpy(pc->name, name);
+	if (is_new_entry && devname) {
+		/*
+		 * A valid console name and index will get assigned when
+		 * a matching device gets registered.
+		 */
+		if (name) {
+			pr_err("Adding a preferred console devname with a hard-coded console name: %s, %s\n",
+			       devname, name);
+			return -EINVAL;
+		}
+
+		strscpy(pc->devname, devname);
+		pc->index = idx;
+	}
+
+	if (is_new_entry && name) {
+		strscpy(pc->name, name);
 		pc->index = idx;
 	}
 
-- 
2.55.0

