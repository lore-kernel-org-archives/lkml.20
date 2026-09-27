Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CAF41DEC9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531929; cv=none; b=Or53U+7LNJFCwwx6oZc3gjMSs9VUUUvtwa1prQ0eT/4yURHgobO9595TGjnA3qIJxukGkYMVe+JZV6oCR7q7/RYkJFfdszGV1zoclOfrAymtRb4BVJHlZfTgJQS+t8PSbmjSEwvAs7ysIX7ZI5w3khJYnJm0eJxkuCt8nyumWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531929; c=relaxed/simple;
	bh=zS6CsMifRo7Y+93FevFU/x5sVefk8DP6M/APkxquCjs=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=ByBQSAYKbMn1rDadTlph00I1eZB/cHgiyZHfXxH0TVFumHxnVP7blnvh0SeveBm0geHCRpFyTGGX83QpMbWiSEtkY+DGLHWA9Sg0TUtr8Gq+QglMb63QcVj99u73urKEJLZesyn0KAChsKapVnchdK85IP2s8SFoGQ138dS0Ag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=N8T4eBLd; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XgFpz+8O; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="N8T4eBLd";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XgFpz+8O"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790531920; bh=7tZh29+XtORnnHdPjkFoVfZ
	ABSiJvgcRl960NDIgoCw=; b=N8T4eBLdhO7nFXSDvE6iiHlw8wpUXy/XC6+kSOawtR1ZjI4HC0
	svVERHKmevM5usHczIB3So1bHMzH/aDotZLminxLP0g2TsDxn9R4UW8Xr2lN4jwPplxUBXTyTti
	mkd/2ywozriM2hywSbztBs1ydmfxmaD4uEsu0dS0RknWY8ubOkksU8bsxezdQMrfsRp7dq939Jo
	pjHUy5t6IqIZ5gMqI0Rm41YtLdGJL21CTPwTb159ZNAnfR14DZurp6QBK4eo8ENQH+OIHK4+Pxh
	rY9hTIQJ0KypMVmNZ3nA1y3umpIq6LmxCIv5bV8UZIP/XZwNnrZ+gnBm0UYsNnjURQw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790531920; bh=7tZh29+XtORnnHdPjkFoVfZ
	ABSiJvgcRl960NDIgoCw=; b=XgFpz+8OXx+sJ/QwcJsc45YkLQj8EUagaSvB1cj8f82PHpW55M
	3XAiFLAkd3OP7wkTvP+5OTYlJC1155Yr02Dw==;
Date: Sun, 27 Sep 2026 18:58:39 +0100
From: Bradley Morgan <brads@mainlining.org>
To: cui.tao@linux.dev
CC: Liam.Howlett@oracle.com, akpm@linux-foundation.org, brauner@kernel.org,
 cuitao@kylinos.cn, jack@suse.cz, legion@kernel.org,
 linux-kernel@vger.kernel.org, mge@meta.com, ptikhomirov@virtuozzo.com
Subject: Re: [PATCH] fork: fix active reference underflow on unshare() failure
In-Reply-To: <20260927095450.3017586-1-cui.tao@linux.dev>
Message-ID: <59245E44-CC27-4FE4-A5DC-15791314FE3B@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 27 September 2026 10:54:50 BST, Tao Cui <cui.tao@linux.dev> wrote:
>From: Tao Cui <cuitao@kylinos.cn>
>
>When set_cred_ucounts() fails in ksys_unshare() the new nsproxy is
>released with put_nsproxy().  But the nsproxy has not been installed
>at this point; it is only marked as active once
>switch_task_namespaces() installs it, which happens after all failure
>points.  Dropping the last reference therefore deactivates it and
>puts the active reference of every namespace it points to: for
>namespaces created by this unshare() call the active count underflows
>to -1, and for namespaces carried over from the caller a live active
>reference of the still-running task is dropped, which makes them
>disappear from nsfs file handles and listns and causes a cascading
>underflow at task exit.
>
>Use nsproxy_free() on this error path, which drops the regular
>references without touching the active ones, like the setns() failure
>paths already do; see commit cefd55bd2159 ("nsproxy: fix
>free_nsproxy() and simplify create_new_namespaces()").
>
>Fixes: a98621a0f187a ("unshare: fix nsproxy leak in ksys_unshare() on set_cred_ucounts() failure")
>Link: https://lore.kernel.org/r/20251118064552.936962-1-ptikhomirov@virtuozzo.com
>Link: https://lore.kernel.org/r/20260213193959.2556730-1-mge@meta.com

Reviewed-by: Bradley Morgan <brads@mainlining.org>

Tested-by: Bradley Morgan <brads@mainlining.org> # Power10

Splat:

WARNING: kernel/nscommon.c:171 at __ns_ref_active_put (VFS_WARN_ON_ONCE, active < 0)
  NIP:  __ns_ref_active_put+0x11c
  LR:   nsproxy_ns_active_put+0x30
  Call Trace: deactivate_nsproxy+0x24 <- ksys_unshare+0x528
followed by a second WARNING at put_mnt_ns (ns_common.h:78)




>Signed-off-by: Tao Cui <cuitao@kylinos.cn>
>---
> include/linux/nsproxy.h | 1 +
> kernel/fork.c           | 2 +-
> kernel/nsproxy.c        | 2 +-
> 3 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/include/linux/nsproxy.h b/include/linux/nsproxy.h
>index 5a67648721c7d..dc2447f5f0924 100644
>--- a/include/linux/nsproxy.h
>+++ b/include/linux/nsproxy.h
>@@ -100,6 +100,7 @@ void exit_cred_namespaces(struct task_struct *tsk);
> void switch_task_namespaces(struct task_struct *tsk, struct nsproxy
> *new);
> int exec_task_namespaces(void);
> void deactivate_nsproxy(struct nsproxy *ns);
>+void nsproxy_free(struct nsproxy *ns);
> int unshare_nsproxy_namespaces(unsigned long, struct nsproxy **,
> 	struct cred *, struct fs_struct *);
> int __init nsproxy_cache_init(void);
>diff --git a/kernel/fork.c b/kernel/fork.c
>index d458d85d7a656..11e16554daa61 100644
>--- a/kernel/fork.c
>+++ b/kernel/fork.c
>@@ -3324,7 +3324,7 @@ int ksys_unshare(unsigned long unshare_flags)
> 
> bad_unshare_cleanup_nsproxy:
> 	if (new_nsproxy)
>-		put_nsproxy(new_nsproxy);
>+		nsproxy_free(new_nsproxy);
> bad_unshare_cleanup_cred:
> 	if (new_cred)
> 		put_cred(new_cred);
>diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
>index 0f1b208d8eeff..454427b09ed97 100644
>--- a/kernel/nsproxy.c
>+++ b/kernel/nsproxy.c
>@@ -61,7 +61,7 @@ static inline struct nsproxy *create_nsproxy(void)
> 	return nsproxy;
> }
> 
>-static inline void nsproxy_free(struct nsproxy *ns)
>+void nsproxy_free(struct nsproxy *ns)
> {
> 	put_mnt_ns(ns->mnt_ns);
> 	put_uts_ns(ns->uts_ns);
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
