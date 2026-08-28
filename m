Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2CE448CF5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917557; cv=none; b=W8VL0XmED6btyZjHkisTx2JeKLiAjgJwwjYPYhPQ0c3fY9+fyZ2AqF2XqoZaitZ9HahGLXA+HQXWgNcnBshhk8z6qO9H1dERmxbB79DXMUP0e+FeOHqzzb5nnGVGVpYZdpYrHW4Ur2FjlnG8fg13sYNlsonqETPywZpO9ulNSc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917557; c=relaxed/simple;
	bh=B9BcTrSnhpoKIgMPBxvBt4/qH6+xooh+t31XYwRc630=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=O8JrAONGELjvbLB3lDWicFuTT7s8GB/Fm6ZEvVnblTRs4V7YMuOftF/1eLUaC0E5mYhtaXHhPjtutreQBEDgyKN7+mfXZdzZfmQshgiXh8BDF0dD6cYJ6O/5QmMWLuj81MYUE63Fsq6gjjeWLUP3W2lRDeSLfcwv2mHsO8XuwcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=J1m4rBIT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JikmehID; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="J1m4rBIT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JikmehID"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787917531; bh=/lpw6ntCrshkS74QTsCEIMk
	tD67ZCxEcMVHEe5dGpAw=; b=J1m4rBITVftfEXCRt2s+cSImLY+4I4wQwiIcHKeqMzpRXFXwXe
	N6FJULlxi9TKuJKcRvAhZbVsEDpuE/lLTpd6Pi0n9okX4h0SEhq3hXwGzaK0xQCafOgWEEHZv+X
	9M8zb9u0pwcVcdhEzm82nwz84MtBKxk82MNDxH0gtTbSrZzfVrOD59zlx638y9VY9/ImCPMO5ni
	GgXUXhvCaWhirDweQa5hViurrchRuw0MKvtTboFVmaAHWybQDGbdey38f5961Kk0FewIVFb79En
	blK9cPRA84++bfGf0NVWQTZAeaCNHcSzcRiN0wg0wyN8wyYEeZODWZ47ZiQCby91fLg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787917531; bh=/lpw6ntCrshkS74QTsCEIMk
	tD67ZCxEcMVHEe5dGpAw=; b=JikmehIDQZUotIMx4oFH4Xp+9bJQ+nLxyieK1USxJfRX8IoyoN
	44EayVDSB1nysAlCmCYhHIVKa18G6A6kkWDQ==;
Date: Fri, 28 Aug 2026 12:45:32 +0100
From: Bradley Morgan <brads@mainlining.org>
To: cui.tao@linux.dev
CC: brauner@kernel.org, containers@vger.kernel.org, cuitao@kylinos.cn,
 cyphar@cyphar.com, jack@suse.cz, kees@kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_userns=3A_remove_dead_key=5F?=
 =?US-ASCII?Q?put=28=29_on_the_create=5Fuser=5Fns=28=29_error_path?=
In-Reply-To: <20260828091659.358700-2-cui.tao@linux.dev>
Message-ID: <8183F79B-615C-4A04-8FAB-C3384AD2F77F@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 28 August 2026 10:16:58 BST, Tao Cui <cui.tao@linux.dev> wrote:
>From: Tao Cui <cuitao@kylinos.cn>
>
>create_user_ns() jumps to fail_keyring when setup_userns_sysctls()
>fails.  At that point ns was freshly allocated with
>kmem_cache_zalloc() and ns->persistent_keyring_register is only ever
>assigned later, lazily, from key_get_persistent()
>(security/keys/persistent.c).  The key_put() therefore always
>receives NULL.
>
>Remove the dead call.
>

Agreed,

Reviewed-by: Bradley Morgan <brads@mainlining.org>

>Signed-off-by: Tao Cui <cuitao@kylinos.cn>
>---
> kernel/user_namespace.c | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
>index 0bed462e9b2a..e9e04ce167df 100644
>--- a/kernel/user_namespace.c
>+++ b/kernel/user_namespace.c
>@@ -162,9 +162,6 @@ int create_user_ns(struct cred *new)
> 	ns_tree_add(ns);
> 	return 0;
> fail_keyring:
>-#ifdef CONFIG_PERSISTENT_KEYRINGS
>-	key_put(ns->persistent_keyring_register);
>-#endif
> 	ns_common_free(ns);
> fail_free:
> 	kmem_cache_free(user_ns_cachep, ns);
>


--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
