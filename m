Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606764;
	b=edM/ZXIHUZRZYT23+DmLiit9WzFxdJMn3OD5mkYFQJj/YROXalPe2sqlk3yxAOZJxttE
	 U2aTVPo8ijUHs2aiGuK5dZWBvYDHbuHlxvPk6oQBE11tsvRSL7K3lqNZHgfMtmsVRxbod
	 Bdru0o5Bg4eA6d/AZb5iEqrFNT5u4aIXGSD8uaj85kVQ90xN7ZmqvOYZplcFUdOwctcga
	 ODWTvxIw32DVKdBnkWCAo+SchqG9IfYHjkLAdWqpcxw2NODp12bjUHnwhOQ0EJJxbwyvg
	 g+8o12OzJeXw1zLH0ne60EhgyR2cBhcw8HJbKGkh/OmNpcw0YZaGcBvbZgxoQBAX1Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606764;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=HdrnOwiWT60Q5tvd9IC7DNDznjzaCDtJtCQo1a1WQ7A=;
	b=Z/g6ImgYxMq96CWNTqigjRqYQBjUPwbn2gj9/6bHFTtaaV3StocMK2ZHIfYBbdDat6L/
	 G/kbIeXHss85sXtIIXhkUKrggCLBSbs0V4fbJlki2/vf7RAn0YqjV2D1kdmyVrLYUwfyu
	 +ZsKfw+fJiQ0VEYtiLrurPl0yV0FZaTD+tFEr0MelycH3Iz0vfoKKzb7Xk6jasF9C5s/I
	 3jIskVktRJjXsNCtzaxD5CWGMynPUF4cFPS8+QyK1NVYy7zR/FTQiQeoQkiZXAbgqfhwi
	 jQSapbpMRba7qZ+xgEdonDK1dfJDBQoEjzVTeuv+e3Wy8zxuILHxDG7aRZmuQC83yGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b="i2EiVo/q";
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45A606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E45A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=i2EiVo/q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HdrnOwiWT60Q5tvd9IC7DNDznjzaCDtJtCQo1a1WQ7A=;
  b=i2EiVo/qUstYAAT0GgH0IXBo0btmB69zStZ2DX02774VCng5Rs2rXKeP
   UnTMVgAzW5uqKNiyk1iXPKyITIX4rPhTJICnDuaUkySpLb9dSbdEhFc8R
   T5O/CagiaRfQu2hoI3ki7GBRfKlcxuH8qXgiaUVPT++y9GZStGwZjC5wP
   Q=;
X-CSE-ConnectionGUID: jhbsLQ8JQ+ObdIgkiMknug==
X-CSE-MsgGUID: bYq+ttHhTOmDcaHmen3KEw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,191,1787004000"; 
   d="scan'208";a="303274502"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 09:05:59 +0100
Date: Mon, 2 Nov 2026 09:05:59 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Maria Sheikh <mariasheikh812@gmail.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: fix non-kernel-doc comment in
 errors.h
In-Reply-To: <20261102022903.5312-1-mariasheikh812@gmail.com>
Message-ID: <5ff5dc97-5a27-c68c-a4b2-959081941084@inria.fr>
References: <20261102022903.5312-1-mariasheikh812@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 2 Nov 2026, Maria Sheikh wrote:

> The comment above enum dim_errors_t starts with "/**" but it is not in
> kernel-doc format, which scripts/kernel-doc -none reports as a warning.
> Use a regular comment instead.
>
> Found using scripts/kernel-doc -none
>
> Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
> ---
>  drivers/staging/most/dim2/errors.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/most/dim2/errors.h b/drivers/staging/most/dim2/errors.h
> index d707daaac3b6..af909560aa93 100644
> --- a/drivers/staging/most/dim2/errors.h
> +++ b/drivers/staging/most/dim2/errors.h
> @@ -9,7 +9,7 @@
>  #ifndef _MOST_DIM_ERRORS_H
>  #define _MOST_DIM_ERRORS_H
>
> -/**
> +/*
>   * MOST DIM errors.
>   */

If it's going to be a regular comment it doesn't need to be on three
lines.

Maybe it could be made into a kerneldoc comment?

julia

>  enum dim_errors_t {
> --
> 2.53.0
>
>
>
