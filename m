Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7C40B360
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963234; cv=none; b=oOZzUuUYzzeJ/2zhGc5laIhhGJkdgI1gPhdcbT1gY48IoNyFwU82+7+NF0+cfl9Z82ueeFLGSpNF89fmhQK6F8wil6UA4ttidFrtZpsNbUQcf2d4Of9FpwkzzrW/GjDHePM9gEiR8m8PyOaRop8MIfFR0a7fpGIcp68ZP42DvAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963234; c=relaxed/simple;
	bh=lE3MeAVapX0L2VkiGh4B6y21c1Qq3Ms4qgsanYU0oyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JQk3cQgC3pIoC750g76tv9U9uLjTKbuSV33Mp8yrDJtgjY3AHgcA/5cB5t96cazRItWFrgOViHf2NzHA1u/UALrcCrUSuAbwlkzcV4SbjiCunZGmanh0iB4S835HQLx9oc7nerGFF8MefkSH2s+hEQhyB4nwDHDwgCFSfERrDbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pQL6lHa9; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qwy35DRk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pQL6lHa9";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qwy35DRk"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790963210; bh=bYzMc0WRoZQCK2HF9QZHjBX
	HzwONGbLq7KZGgwO2Jqw=; b=pQL6lHa9aRKXprl+ujERXvWSsh/YXEGwm3el/F+dJTevOM17yJ
	UqfQM28bG+dozOPy1p9v+9PU5T3hJjFlXPE0OB7hlQBJTmhGMvCxjptbeqetuq3og9Qxo1zSkMe
	m3vt9BhA4tY9vn0bXt6MDUEbLorxQ6VrF4Nkx6xksdGXNPp+E+M57PNB2Iuz6XfvRM+rZ0KgofE
	gg4eYZhT1jGiVKGFdOFUHOopXeolJWFmPjrS3I7jwX5+Z7qvkAAT9/mDIrIMOtn6ITocD3D9Itq
	AjgrgjJb4I+FIgC9IaA741Ii/LsstY+If1boEIoYRIji16kL7grLJ6MLii62IP4J6JQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790963210; bh=bYzMc0WRoZQCK2HF9QZHjBX
	HzwONGbLq7KZGgwO2Jqw=; b=qwy35DRkIxY2/wd0WF92/K8slpiKDEGxU2TXfVJqFv+aUumpH1
	RK2oXhCK/x4g97JlFRdMRoguvSiPo38EGCCg==;
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org
Cc: blum@kernel.org, tglx@linutronix.de, dianders@chromium.org, linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: [PATCH] watchdog/perf: reject empty config before the raw event parse
Date: Fri, 2 Oct 2026 17:50:00 +0000
Message-ID: <20261002175000.1-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Date: Fri, 2 Oct 2026 17:39:13 +0000
Subject: [PATCH] watchdog/perf: reject empty config before the raw event parse

Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
manual NUL-termination") replaced strscpy(buf, str, sizeof(buf)) plus a
manual buf[len] = 0 with strscpy(buf, str, len). strscpy() writes
nothing at all when the count is zero, so on a comma directly after
the "r" prefix, nmi_watchdog=r,1 for example, len is 0, buf stays
uninitialized, and kstrtoull() parses whatever stack garbage is there.

The old code was safe here by accident, strscpy() filled the whole
buffer before buf[len] = 0 overwrote the comma position, so a zero
length just produced an empty string and a clean parse failure.

Treat an empty config the same as an overlong one and return early.

Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove manual NUL-termination")
Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/watchdog_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index cf05775a96d3..cca0485ba28c 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -301,7 +301,7 @@ void __init hardlockup_config_perf_event(const char *str)
 	} else {
 		unsigned int len = comma - str;
 
-		if (len > sizeof(buf))
+		if (!len || len > sizeof(buf))
 			return;
 
 		strscpy(buf, str, len);
-- 
2.53.0

