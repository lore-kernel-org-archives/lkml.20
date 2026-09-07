Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4392517BC4;
	Mon,  7 Sep 2026 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799375; cv=none; b=X30uxAe9TANOyOmT/71Uf8iLpIFpf/gk9Z5I0jBaX5MPFmyjNB5kZ9LhgNbkFx8uHYrxHnzodJX9Ci+pPfZcuKYRT0NNXCNxbtieVywuFtXbDZGtQGeipg1VQGQQOoE2O6C2Zjm0tPRHHD3kbQoM3FsCTOhcpuqMJt3NR3KpqzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799375; c=relaxed/simple;
	bh=fLxREjCW+hIAs+EEHTgczv9agQLNMAmRcCQotmOb0FA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G52XJ1w0qVv307xmmAhlsd5F90+5aJTNZo232GoF6+SIF14x9BhajVa2Cjw+6CoG0geGt4I/cyJxNtIJPJHg8Gphrye0nmyrMLnYO8MVVLUyNx9BGv4Ll+XM2qo/lZRtSUsR2V6qNt/VWhaXo4DOkqMUihJlQBxks1MRTJokJ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=m0uZl4VL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="m0uZl4VL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 037E5408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788799370; bh=L7OW1ofSJOtG+PUDpHwGnt/QuaqtnCse4MytWP0ziPo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m0uZl4VLrH73x289PDgat/CifLFek797rrEjO6mtJozCJLhZsQhGP7Ung0os+pv2x
	 Gm47dqOPd9wGB35XentyfKyMf/xwJDRjxFVlUQQ7S48isdQVJ9EYK9ztYHS1tjUB58
	 dlEM6G97yu2IciA/zM85rnj6cQtLt75b5keqKRJqN81GSBJD61/zqBPDyb4Q0EFH2h
	 m+supVUNc33rp51TEP3LZ3qsPhxgxlFxHl9P4xVVVkAeYUcOr7MolkaRFBikAIgHZl
	 oW28/oiwtg3O1wEZ3aGDBSuXHfwtdprHCceFTTvJgnLtq4IqPTZ8kdNSIMXaXKEsnn
	 1wP5iqtU/Av2w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 037E5408FF;
	Mon,  7 Sep 2026 16:42:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: porting.rst: add bracket
In-Reply-To: <20260902145428.704582-3-manuelebnerli@mailbox.org>
References: <20260902145428.704582-3-manuelebnerli@mailbox.org>
Date: Mon, 07 Sep 2026 10:42:49 -0600
Message-ID: <87h5k1ovw6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Add missing '(' to function in prose.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/filesystems/porting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
> index 60880eb0c..810657082 100644
> --- a/Documentation/filesystems/porting.rst
> +++ b/Documentation/filesystems/porting.rst
> @@ -673,7 +673,7 @@ watch out, since that shortcut is no longer valid.
>  they used to - they just take it exclusive.  However, ->lookup() may be
>  called with parent locked shared.  Its instances must not
>  
> -	* use d_instantiate) and d_rehash() separately - use d_add() or
> +	* use d_instantiate() and d_rehash() separately - use d_add() or
>  	  d_splice_alias() instead.
>  	* use d_rehash() alone - call d_add(new_dentry, NULL) instead.
>  	* in the unlikely case when (read-only) access to filesystem

Applied, thanks.

jon
