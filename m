Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC10A516174
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683639; cv=none; b=N9mO6V239pvBsP5wZ3CSeGZjANDxTy8P/tPihZJ/GPpc8FdUyHc2mzzUfGW4i/UrpyLRvI6F7KlPHncFIg5MprvP6FwVjdsKTn5425T5PzNG7MArJHgpaZDXFPVA0r55FZ2QMYW2Tgq2yNKLRHUAHYQOP+vVVzwAbA+ehOL4VlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683639; c=relaxed/simple;
	bh=FO6KPsbEMhNK2EpeHmPo45eDho9nSZrC2QpvC73yT74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0F8tyDwHbVio8IlXM/vivUoHDbD2cClG3Mlt3N6saDBhdlvyHLHa7gq7zlj9pphLHNXGR1LKC9VDa3w5lRua3gfLZog3hmwamjI23s+yLeURagt2A6LqCgcat7lCjkrHdRrb4GiMHJNdUR+zpREtyxq753MqMiQfPBEi/6Kal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IltMAGzH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IltMAGzH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so31147715e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683636; x=1791288436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8qpKATp2hz0UhSPYDGTVC3oQqSaMphYiC0564dT9Jk=;
        b=IltMAGzH2dss9W3OVCD5k9MhVT3Cvp7+8tKrGXSMnbXLYFbW9Eg5tRSylSSvXZyXmn
         d0EcMky9CpuCLyPdTA7IQI8XCuyGH3AMHci6aFwtWDVKeEEPLQ+qmtqwAP8OGyii1+dJ
         UKzCGIYn51hUhC3Wy2qVhJC1ohfRjYWTVbeanhuU2/5cQYMP+Rkvy7aAXOIRqrEzla5w
         VreFepctiXrODALedbxcjk6o8lekk3WKS7arxMtUlGF0aMBN9cgl4QGIUUIcqZ2d2FwB
         3t0VRc26DG/Go5IMAAQD3FQEneq+sW5eJ6gZbDtQcpJJxOwNgyz3Amilqgu6T//UB+NO
         aJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683636; x=1791288436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8qpKATp2hz0UhSPYDGTVC3oQqSaMphYiC0564dT9Jk=;
        b=cQT1+6xcMFzJAREqdZe4E3ue5Phu7pEtVXleZOkHP56yaLW/YPxVLRCj4y3WbhPKJF
         JA6+nRLwH7cFnRyCJq3g5ozb2Vhe9i9XQ4T5/da5twqJayPjzNKnfPFre6EuNmuFr1ua
         1mjXOWUDMpv1trqMPQCkO3TOsGQQLDmt1FYlnfMlxuhIKSHX9pawtmAz0zzQJr4v2sJq
         2kW13aCPz9Y6Wiu4YU2ddlUa/AnLnTn3RQjoLwrk1VDXfddM2O4SAebYGzaefUXNRX0C
         cFrY7gjk21A31yPVuXboQwVctIESTfleI7TnNUvsymFJ7cYyRbCRqJCUXLpdHBsidsDg
         GamA==
X-Forwarded-Encrypted: i=1; AKwUvBw38uPy+ASRIh6lrfX0RZE8Qr8HHMEAnRL5NTkWOKEFT43HiUTV/ZTp3wy95pXHeHjYFfDrJqAyUYEw0wE=@vger.kernel.org
X-Gm-Message-State: AFuF++lHOULdVyBTbVtMlpH77a8g2dBKpbotrQJoG9BMyaNDCiziae5/
	v0miix9V71xX6NeqxbGsOBMNQVifNlvqWp3PtEe21It/araORlrYut7rXoFHm5nk6Ag=
X-Gm-Gg: AYBFou1QdrB4C1Z1UhUN6Sq6PdoFfxzk2NuJ8oEMsIP7l/saG0p83u+ge+F6RegbNfw
	3hyhAZWQtS2QLeRqgA98rIgSIY2Zj23EKzGgJmuUmBh7TXUGwF3F13xaC9k+KGmJ41yYwRpFgKM
	Ea5A7Gy7r1RBFc2cZz6LJ4K9yxOaDBqT3Tg1SxZLoG+T06pE21qvYZIj9xZoBBbEFG8OfbU35WV
	/kb1wMbD/PHSI01zu5khiXuw3qDnphcmyW+NbScq7SiC4qOuIs03Twqt7kxluc9jz5o+wkCiyJa
	20/saXAbfupeHVtNS0pxDgcivMzId7xaMuUqCVd6FX2ef6bLqsOPv7Ap+yA3UbvMw1dOkjwOnBu
	r7NG92IjAKngvl/1Tp7VSdNpaT6Ked0iZDOErgowhDFHfl0TKltPV+CIINMR+TsVtHwd7Y5/Onn
	+x4fO++hITa0bY+PsKOj07hGtMPh9+S4jvwjnRjMozd/UjAPAnmVinQDEgiZsf7rqdpzq4INoa5
	B1BBc4=
X-Received: by 2002:a05:600c:3b9b:b0:4a0:149:d894 with SMTP id 5b1f17b1804b1-4a001708718mr143741875e9.26.1790683635729;
        Tue, 29 Sep 2026 05:07:15 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c10c656sm111155305e9.2.2026.09.29.05.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:07:15 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 07/16] printk: Ensure consistent name and devname when updating preferred console
Date: Tue, 29 Sep 2026 14:05:37 +0200
Message-ID: <20260929120546.328616-8-pmladek@suse.com>
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

Make sure that add_or_update_preferred_console() updates the right entry.
It is a paranoid check which prevents a potential misuse of the API in
the future.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b8c348e305eb..0fafc579bdd3 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2561,6 +2561,8 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   1. Either @name and valid @idx OR @devname and @idx=-1 are allowed.
  *
+ *   2. Only matching entries can be updated.
+ *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
  *	match_devname_and_update_preferred_console().
@@ -2581,10 +2583,7 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!name && !devname)
 		return -EINVAL;
 
-	if (!pc->name[0] && !pc->devname[0])
-		is_new_entry = true;
-
-	if (is_new_entry && devname) {
+	if (devname) {
 		/*
 		 * A valid console name and index will get assigned when
 		 * a matching device gets registered.
@@ -2600,11 +2599,18 @@ static int add_or_update_preferred_console(unsigned int i,
 			return -EINVAL;
 		}
 
-		strscpy(pc->devname, devname);
-		pc->index = idx;
+		if (!pc->devname[0]) {
+			is_new_entry = true;
+			strscpy(pc->devname, devname);
+			pc->index = idx;
+		} else if (strcmp(pc->devname, devname) != 0) {
+			pr_err("Updating a preferred console with an invalid devname: %s vs. %s\n",
+			       pc->devname, devname);
+			return -EINVAL;
+		}
 	}
 
-	if (is_new_entry && name) {
+	if (name) {
 		/* A console name must be defined with a valid index. */
 		if (idx < 0) {
 			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
@@ -2612,8 +2618,15 @@ static int add_or_update_preferred_console(unsigned int i,
 			return -EINVAL;
 		}
 
-		strscpy(pc->name, name);
-		pc->index = idx;
+		if (!pc->name[0]) {
+			is_new_entry = true;
+			strscpy(pc->name, name);
+			pc->index = idx;
+		} else if (strcmp(pc->name, name) != 0 || pc->index != idx) {
+			pr_err("Updating a preferred console with an invalid name or index: %s%d vs. %s%d\n",
+			       pc->name, pc->index, name, idx);
+			return -EINVAL;
+		}
 	}
 
 	/*
-- 
2.55.0

