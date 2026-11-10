Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342296;
	b=qd1YSPa0BGDqqJtQvNPtd7lTGKhclTv+XI0BLqz1L95ffG92DSqFjpZhh7deQYfL18X4
	 ortiKCn3GVP5vrBW4lffP5HYKHGCcFTXz9otzLj70Yi8P4HP8eJ7EZ0bnnau6mD4M6yXA
	 7RC58vxHDM2niQ2Pi4v+JMIvdKoaEswNq3hdsZjZVuZ41m+652eirQNdCk8EV+5HtJmDu
	 7l7rgw2/iv4uM9zKnVs0DQHwv00qvTmh3kqz6lttPXS5L6eUT8/rJyq05ytHjfUh9manl
	 qySVcZnLowBzPV6Tndp0VBr+zVMFtS+LBqCMq+HVZ0/g9oSZjDuqph8iXa6UnMnlaeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=y7c4fIL4gSW8PDO5l2OSFy/lYS99kdWGNxYQCXw1evE=;
	b=fPfWUTDb+Jr0E+F0RKjS1ZMn7o/ArnkdLPm7PAhZSmL10FNFKNWAUrdP5yr1ryDBmCQA
	 OzKWlrRMi+KFq2n3Z6J7wZBP0syDL2GuokdOOF/P/aHqAPJuMJ5kHDvtHdlbdnWQtKoai
	 ths5cj8sup2gnqE21N6tHK+WdGtt+fF9wHMJlE3FtiV0TaVLtxQ+COy5y+n1nR3xP/gF6
	 zKmycJV4/YrYG3gLDTUAYpoYIit6E8UCI0j0YKPF45Y3E6HM8dNMjS1icV5uBgAXWTNpr
	 Mc3FwdgBLfrPxcpJ8RlnfV9DfVMM4NXD4QU1CAf1OQHo+tICdpMaze43M9a33aGWemg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b="cEvuAr/u";
	arc=none smtp.remote-ip=84.16.66.170
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DEB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=cEvuAr/u
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jPJ6W07JXzDNK;
	Tue, 10 Nov 2026 21:24:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794342290;
	bh=y7c4fIL4gSW8PDO5l2OSFy/lYS99kdWGNxYQCXw1evE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cEvuAr/u4j+a5dAhjK61qDNq3NYBOZpXuGQdJlK9/7NnFOlfy2syQI7y3lmGtOcvD
	 grDj3mnqzSgc5JJcWgKgD3ThJezBuVcHyfiX99wT7DJiRrVpuJP+xKvlpv1HwjH8mM
	 7d3WeRBIvcv6dMkrIJCttc9sO35/gGmflDCY1+24=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jPJ6T6K20znbp;
	Tue, 10 Nov 2026 21:24:49 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 4/6] landlock: Mediate CAP_SYS_ADMIN for the admin memory reserve
Date: Tue, 10 Nov 2026 21:24:32 +0100
Message-ID: <20261110202436.2408244-5-mic@digikod.net>
In-Reply-To: <20261110202436.2408244-1-mic@digikod.net>
References: <20261110202436.2408244-1-mic@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

With vm.overcommit_memory set to 2, __vm_enough_memory() keeps the
vm.admin_reserve_kbytes reserve for callers whose LSMs all agree that
they hold CAP_SYS_ADMIN.  cap_vm_enough_memory() checks it with
cap_capable(), so a process in a domain that denies CAP_SYS_ADMIN could
still use this reserve, which is meant to let an administrator recover
from memory exhaustion.

Add a Landlock vm_enough_memory hook that withholds the reserve when the
domain denies CAP_SYS_ADMIN.  Like commoncap and SELinux, do not audit
this check: it only selects a limit, it runs for every accounted
mapping, and withholding the reserve can only make an allocation fail
with -ENOMEM.  As with the previous hooks, LSMs implement their own
policy in this hook: SELinux already checks CAP_SYS_ADMIN in its own
vm_enough_memory hook, so making commoncap call security_capable() would
make SELinux check it twice.

Cc: Günther Noack <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <serge@hallyn.com>
Reported-by: Ada Smith <adasmithgt@gmail.com>
Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 security/landlock/cap.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/security/landlock/cap.c b/security/landlock/cap.c
index c89e8d76db8c..c9a900888f3b 100644
--- a/security/landlock/cap.c
+++ b/security/landlock/cap.c
@@ -140,10 +140,32 @@ static int hook_mmap_addr(unsigned long addr)
 	return check_cap(current_cred(), CAP_SYS_RAWIO, CAP_OPT_NONE);
 }
 
+/**
+ * hook_vm_enough_memory - Restrict the admin memory reserve
+ *
+ * @mm: Address space being charged (unused).
+ * @pages: Number of pages being charged (unused).
+ *
+ * cap_vm_enough_memory() lets CAP_SYS_ADMIN use the vm.admin_reserve_kbytes
+ * reserve, but calls cap_capable() directly, which skips hook_capable().  Check
+ * the same capability against the domain.  commoncap runs first, so this only
+ * sees tasks that commoncap let use the reserve.  Like commoncap, do not log
+ * denials: this only selects a memory limit.
+ *
+ * Return: 0 if the domain does not withhold the reserve, -EPERM if
+ * CAP_SYS_ADMIN use is denied.  An error does not fail the allocation by
+ * itself, but without the reserve, the allocation may fail with -ENOMEM.
+ */
+static int hook_vm_enough_memory(struct mm_struct *mm, long pages)
+{
+	return check_cap(current_cred(), CAP_SYS_ADMIN, CAP_OPT_NOAUDIT);
+}
+
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capable, hook_capable),
 	LSM_HOOK_INIT(capset, hook_capset),
 	LSM_HOOK_INIT(mmap_addr, hook_mmap_addr),
+	LSM_HOOK_INIT(vm_enough_memory, hook_vm_enough_memory),
 };
 
 __init void landlock_add_cap_hooks(void)
-- 
2.56.0

