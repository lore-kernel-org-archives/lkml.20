Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858A042A168;
	Wed, 14 Oct 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981863; cv=none; b=owY/RDAYXLHQOWh6/H0YuCBfvbsfyyOx1F1AQ6wC9w4cu/l5Ci3VwthkABYXQmsmR1vA+Zrd5lyAJRShwF/IGKCjGWyoT5pDVjfxiaJiTw1FxSDpUvNThN31s67g3b0iTxUG+vC1ISkGKVSvA4R9UOlhfmFz8hgb9kDnuTPpEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981863; c=relaxed/simple;
	bh=Y+8lYdT5+OdVkUjnsR3qkcD4ZogsVfHlnaoYqA9OEvk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=isgQzj6ljktunNggcfTSy7/rrgADdix5dJwLp9UtWzFWw1f2WmC5gjxgZsU+NE0zQ/yr49a9VfGyRMr1Y7FtRb6t+ossS6FL726Vo2WyyPGGL0K3wipZuDpWEpllfibtPp7nU3rP6YfC+sQBP+k1zakhAMszFv3YVdxInP2Iouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NLxRBhM6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NLxRBhM6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B2F3408F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791981855; bh=dDDQ868+qBOrUUnNNuEpUUOOzdxg90+O6nfQ456YILw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NLxRBhM6NSaujHE/kiGcPsUEVxu7Zwu4Ceo470JFNUXy5EWFq0JkeuvInFX8FwX8Q
	 8H2InXmDhYkAdxvmLPuTgWuOlhmqGE78x2mouFI+B46ujNNbK5El5rUBQZy1HV7cFO
	 CWVDMuuYPqr3k45tpawz3RBVUwner5JrNCgY7CQ5AxG8zPYChuTFf5PdxNcXKPBVta
	 m32TcZg7yyVOo3hTtypc7ZfQwBJa1nx+hKFxYMrNWHZuKlaDUuUpxGwyjhATkYdNNN
	 zbmj9OhPOHZAXBkBq9EUes7E6debf8LFgGWm7ffPg5Wv3+7QUAHuBSmfnB4yA9peEU
	 N51cohvaiKSFw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7B2F3408F6;
	Wed, 14 Oct 2026 12:44:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Eric Argishti <eric.argishti@outlook.com>
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Argishti
 <eric.argishti@outlook.com>
Subject: Re: [PATCH] docs: admin-guide: fix typo and punctuation
In-Reply-To: <LV8PR04MB9007F44F1F989D9D95D1A386F49D2@LV8PR04MB9007.namprd04.prod.outlook.com>
References: <LV8PR04MB9007F44F1F989D9D95D1A386F49D2@LV8PR04MB9007.namprd04.prod.outlook.com>
Date: Wed, 14 Oct 2026 06:44:14 -0600
Message-ID: <87wlrkwixt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Eric Argishti <eric.argishti@outlook.com> writes:

> There was a typo inside of the admin-guide index in the docs.
>
> Signed-off-by: Eric Argishti <eric.argishti@outlook.com>
> ---
>  Documentation/admin-guide/index.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index cd28dfe91b06..f87e9bbcc458 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -23,7 +23,7 @@ etc.
>     features
>  
>  A big part of the kernel's administrative interface is the /proc and sysfs
> -virtual filesystems; these documents describe how to interact with tem
> +virtual filesystems. These documents describe how to interact with them.

The typo fix is fine, but why do you feel the need to mess with the
sentence structure as well?

jon
