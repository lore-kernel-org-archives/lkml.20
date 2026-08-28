Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F1746A5F9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924073; cv=none; b=aHP40lN2vjdzS17bMlvhi2g3pNVjmhc1tO788AL6unSpQvP9l890B7OAMLEkXIbjYGyxdM8QTcvEg3FpCFkuqak3m6e7MAUDW0BcfrUhPoVy6IG14Tm47UGKsBezWjqPIqwOchZkQLB2yL6t5WYYYYuTAMFJlWwti8X1WAKkSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924073; c=relaxed/simple;
	bh=qFN2XnM6V2IPavLLlBnMkvWTqalYRbyegliU3SYBQI0=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=N4duowR2AnectYF+HUIQSBlXY1kaBJMmYvNG4mzTvvqiyVy050t5dJCVXiZczZ6rIuXQqa9kHGEMUEvz+UfUovf4PX2l5woBIB//rOqax1RP1eqS/THANaDUdfSn4ILiulhrKTaXrFeb8VACXtGue8GzX4P0vkQUCApeOHRTRGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RnyQZpK+; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CnOHOibE; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RnyQZpK+";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CnOHOibE"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787924048; bh=YwVwVVSAXa/h2FPIAlHyg1v
	AEAK/zfz91s9d96tZNJ8=; b=RnyQZpK+eE1Nx9e3W9NjNQ03OUPDCnqFQ8vtyLtsXTpqePxMAo
	89BgyWY0HcpJUJBwIr9skzWZruIBrObo9t20vKREvoOCKmUN1dfvk4R09GZRTzfSe7UweYMLQus
	GLtt9B/TxwYA88Dp5duCbj5TIQl8xbDcOFMQy32AnqZNndxCe3GBTNYiHxV6Ea4rTQc7XhJxiGC
	9lvjDl8xD4i8DMgRXz8gWPDjR5zbSSa2PXboyfG+9K0EZ+iH59xCLOhRNCKRH5r474XV1M7tLxQ
	ttD2ilY1p9OkQLwVId/kz/M/o+SvBo0KvIQOuNZf0VoqD0or46a5Pv+Xt2BiiuYHd5g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787924048; bh=YwVwVVSAXa/h2FPIAlHyg1v
	AEAK/zfz91s9d96tZNJ8=; b=CnOHOibE9Va37PyN7pGMkjWX4IXNvjMiLGTm74Nf3rXXpmJES8
	1R5n1SS2AqZvMTk43thtWqQ3TwydvhbGQJDg==;
Date: Fri, 28 Aug 2026 14:34:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: cui.tao@linux.dev
CC: brauner@kernel.org, containers@vger.kernel.org, cuitao@kylinos.cn,
 cyphar@cyphar.com, jack@suse.cz, kees@kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_userns=3A_don=27t_clear_the_?=
 =?US-ASCII?Q?install_target_map_on_map=5Fwrite=28=29_failure?=
In-Reply-To: <20260828091659.358700-3-cui.tao@linux.dev>
Message-ID: <7E70CD3E-80E1-4F1F-BE9C-36CC1F21AE81@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 28 August 2026 10:16:59 BST, Tao Cui <cui.tao@linux.dev> wrote:
>From: Tao Cui <cuitao@kylinos.cn>
>
>At the out: label of map_write() the destination map is also cleared
>(map->forward = NULL; map->reverse = NULL; map->nr_extents = 0)
>whenever the write failed and the extent arrays had to be freed.
>
>However, the destination map is written by the successful install
>block above, which has no failure exit; every error path reaches
>out: without having touched it.  A second write to a mapped
>namespace is also rejected with -EPERM before any parsing happens,
>so the clearing can never roll back a previously installed map
>either.
>
>The three assignments just zero an already-zero map.  Remove them.
>

Thinking about NAKing, but I have comments.

>Signed-off-by: Tao Cui <cuitao@kylinos.cn>
>---
> kernel/user_namespace.c | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
>index e9e04ce167df..cef5e71779f6 100644
>--- a/kernel/user_namespace.c
>+++ b/kernel/user_namespace.c
>@@ -1104,9 +1104,6 @@ static ssize_t map_write(struct file *file, const char __user *buf,
> 	if (ret < 0 && new_map.nr_extents > UID_GID_MAP_MAX_BASE_EXTENTS) {
> 		kfree(new_map.forward);
> 		kfree(new_map.reverse);
>-		map->forward = NULL;
>-		map->reverse = NULL;
>-		map->nr_extents = 0;

Yup, that's dead code, and I would add a tag here, but the thing is, this
code is a defensive pattern, so if some bloke decided "hmmmm let's add a
failure path", then that would be stupid if this code was gone.

If I was the maintainer, I wouldn't take it.


> 	}
> 
> 	mutex_unlock(&userns_state_mutex);
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
