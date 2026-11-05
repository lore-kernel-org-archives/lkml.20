Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890712;
	b=GrqmTme9vIvbk8/QjmgUPn3LW4HTeujV/osrhU8fFhWnTQvr81MAktStJFNwFepenbes
	 zY+19WDcLTo0plTJl2LIvGELVWx9UbLv2mDB5Ec+AcOhHYBVkYfK5vOk/+l5uWufNL4g0
	 greBiJx0wgqxoD/Ig1SEwLftNr5L97aHpyApuxaAnMEWe22M6u0M31rF+aVLbH8Jm9YPe
	 X5GlY5HkClsJGap91WMf2slz688MGQewUbamz8nsMZ9wZNv1It6tyeilRlEyNFW49AQfP
	 R/1B2eSNq6ASuIuynMO0NnBylPFalOXHvQVh1xLvuyX3yAN8yUnrzjJ9l2uuQgCuqgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wNn/hkKgF7gP2pmTvef/IRMHIXPvMFLFwDwyb0gIb98=;
	b=bA6nrlwfXpJxskDtTmkU1AVr5+8Jk2pVmtsW9LJ4xncgSWQEZod3KC+7vRNQM11zoVyU
	 Es6KLWQ2MO3Ulq/o1S36TkZlL01lwhAJboFrP9OaaxeZRIrsEhMHSsXVQAuOEkOL1MPLl
	 98TL3iwZLRsqcsXWSMeUYqmwvnqxExO7DNRE+z4a9Vk7qBdzO/GM/Y+IlA48qFz/bnJka
	 Ehm40i2sXkOe3ahCF0SVe4JKgsbiXqtnCDUzl6ZuEIc51H8tIGTcH6Lrr4NKvab2dgqyY
	 IHVVDTYGUwynT3RHIK9mIL0l8rYOn+98dy1RprOcvyqU7bT9MVukF/P8ZppN9cfDDTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Nq1po80d;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E84C60A261B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E84C60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Nq1po80d
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f269e335eso227269285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890711; x=1794495511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNn/hkKgF7gP2pmTvef/IRMHIXPvMFLFwDwyb0gIb98=;
        b=Nq1po80dyupX4JQj4k/xAoj82bE2yLjgGXQE+czDMGSX9aBQgZYdGN+E0F0IPd2L/y
         B6M7IWWYd8MhGBgNj4frEEhRRqTI09RcE0LzwXn1g8uXyi4OoJTwq2ajnXiui+4lXkG5
         5XDzoTGyvQn+axkl2TceoWbl95VSfE/lTRmPkTz3TJX/imfYcDhqguz/QA69Z3P6y4YZ
         Hxzxu/CZhHSeNAf099S4k6R3d3vHiSrrdH5IPSMhl/envFqUM5CqpGcip9TinX1jDgk4
         2J9yYQ+hHchQhZCUaF/g5/W377SbP+/lF2Z/ZigdVZmn7ug07Gzjo0e6jHolSXbCksUv
         B+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890711; x=1794495511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNn/hkKgF7gP2pmTvef/IRMHIXPvMFLFwDwyb0gIb98=;
        b=z7wCYCk3pPx9ubffL0mMxwBLGqMC6SJOkOoCmTkz1Xiw761Mrai9wjIimtXuZeTDpy
         B+YAItEyRpS3Idlyer+l5eL4B3W5bjso0YL6139ONqWnSppXNaCG1UmzdP9fp4cqn4N/
         vuT3haL7vw9Q7HBO0KZ2bRWE/onKLXJPTDWyqavTbl8LEBeXIFzEZif9Dq6DVb/CUfoy
         sXdBzUdwq4sD5Iaw6zN7DG5weuyOgOSg8f9QemezWZrd8yINIfXFjTvZbKXTaHLhhkg8
         WvqP+jVWWQNc1JY+6dEebPd3nizsXYMB0tpzmewjYVWR+/FY6W2YvXS7tl2BSyLrqI2i
         0OMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzatxT1QrS7Pdon4AzfKOQxCn4q7SqdO8pRNVmmcIsOhbgJZJqi7YbkkgwfmiObUP/spIrjglMYs8z5udI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XbcP9N2pDVY7S4Jcv8ZJsfRjqjzHijjG7AyBwDqkTQiSR3Bh1
	SmWqfMkPLZDeb8dK4NnfDPdjo/lZIYQNSM8mLb2nfPF6GlW7x0O5Rond1vk+NcZ3xGo=
X-Gm-Gg: AYBFou3kGfBKdk0u/MjxwMa5BthMgUWtXbpYC/zWflUBoGHutwe8xg2YcO1YDu2/t5n
	RMMDHQq9khbjWJ4wFvsIMudWXUzISqYSuLryfSqrh0rMTZ0/rocl8bj5cWpiq+ZngQlx9lewMOZ
	cm/eh+KQxoM1ACUCxqUrnPS7TgS0jAUXsX0vgs7Q3j5wgSUtXZ8QQPsGCoyXtHak7cp2DXkTS1C
	SwFlfX+YaLUxrTQXoO+mZHS7Q/J0LA+bt9ZQRosjkDYMdzy8XWqAVJbYrf6yOMt55gLFWS4bhsg
	RUIDNkJBz6TA9D70m4nvvGAGXMOkc+zHXPwp277Gg4CHnyE9TAokdyKbuLHHDVcRpAIyAXp3HOz
	uX0GRrWWEJKkfWlMNjba8UN7GE5QpnX/Sysrg93EgWqN3hFZRz1xrUt+i7YsuUwf1Rb2W0p4/Q7
	WkZ32P+yzGbsHRQAOUgoqA0TOut0NFP7j+lyUTFb3jFlWKkpnQuCUEXqvhkDjkzKgwxHEUjtskk
	57SdSiFrNMggzoxM9DGTDD0q1EsYmiqZok/CCngvMoeP7himiErn2mQ2Vppqwp2AdWXC+j5+GUa
	GCSvvAvZFzYf0jt59hatRVgpcdwFS6fm5BlSNBEv7+6msA==
X-Received: by 2002:a05:620a:414f:b0:93e:9171:b83 with SMTP id af79cd13be357-944216970c2mr3290481885a.43.1793890710900;
        Thu, 05 Nov 2026 06:58:30 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4813a6fsm480460785a.21.2026.11.05.06.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:30 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:10 +0000
Subject: [PATCH RFC v3 19/90] cgroup: add cgroup_cell_kill()
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
Message-Id: <20261105-b4-cells-v3-19-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=2413;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=lrXR3eWWfGFuCEHq20WRo32/lde2D/wq5xCJx3XPUN8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAAUw7r/Z8aogW8tutRr3DqJtm6L2omqesHEDbkUMtyrwHdgKy2KT9c65OWJjDfhJDMUxDlaDOP
 czr6ifynkYgA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Killing a cell means killing everything in its budget. Add
cgroup_cell_kill(). It does what a write to cgroup.kill does, which
includes forks that are in flight. It also reports whether the cgroup is
still populated, so that a cell is only reported dead once nothing is left
in it.

It uses the populated state of the cgroup rather than a task iterator. An
iterator skips a task that is exiting, but such a task keeps its cgroup
populated until it has been scheduled out for the last time.
cgroup_destroy_locked() uses the populated state too, and it is called
next, for the cgroups that the cell created below its budget.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cgroup.h |  1 +
 kernel/cgroup/cgroup.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index 4d9baf195f1e..57a4037671c9 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -155,6 +155,7 @@ struct cgroup *cgroup_get_from_fd(int fd);
 
 struct cgroup *cgroup_cell_budget_get(struct file *file, kuid_t *uid, kgid_t *gid);
 int cgroup_cell_chown(struct cgroup *cgrp, kuid_t uid, kgid_t gid);
+bool cgroup_cell_kill(struct cgroup *cgrp);
 int cgroup_cell_budget_put(struct cgroup *cgrp, bool handed, kuid_t uid, kgid_t gid);
 struct cgroup *cgroup_v1v2_get_from_fd(int fd);
 
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index e5e6761522eb..75f8367271aa 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -7199,6 +7199,30 @@ int cgroup_cell_chown(struct cgroup *cgrp, kuid_t uid, kgid_t gid)
 	}
 	return ret;
 }
+
+/**
+ * cgroup_cell_kill - kill everything in a cgroup and below
+ * @cgrp: the cgroup
+ *
+ * As a write to cgroup.kill. It closes against forks in flight by kill_seq.
+ *
+ * Return: whether the cgroup is still populated, as cgroup.events has it. A
+ * task counts until it has been switched out for the last time, see
+ * cgroup_task_dead(). That is longer than a task iterator shows it, and it is
+ * what cgroup_destroy_locked() goes by.
+ */
+bool cgroup_cell_kill(struct cgroup *cgrp)
+{
+	bool busy = false;
+
+	cgroup_lock();
+	if (!cgroup_is_dead(cgrp)) {
+		cgroup_kill(cgrp);
+		busy = cgroup_is_populated(cgrp);
+	}
+	cgroup_unlock();
+	return busy;
+}
 #endif /* CONFIG_CELLS */
 
 /**

-- 
2.55.0

