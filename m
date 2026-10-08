Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D3384CC6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446369; cv=none; b=iLEEOHlhsrXDVS6LKrpVDIwWQG92KeOEaBw1RqTqAQZ7zq/8FYPsO+Pe34YvPmbb3Gu9i5Vxj/Ls51O8uOMIoHBYXeFBkXhazlILkc/gsOZbiqhIYhdKxGUDhCRahlQ1LSrZS335c/uUMZsH862ARmMNH/7c/7nLKow6AmbZ+ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446369; c=relaxed/simple;
	bh=AWL8mMpQKmff1DsncviJAonzybts9adjUgMrMor50fc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ix4l/wdEgZHcyPtThHqTiMzTnABe0zk8WyaVTbFYgxokbbZwPF7neEcS4bn5W4AKnFvSOFG/ug0dQ1dj9Pu1HHKx0L4KJPMq+mwENelCAblkB9wvBFdmzk0NXnveY8c8J26p/JdeIxP+8k/auCJgwqR7SlbrOq+SvOKjqJ7YSq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myYFxo8Y; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myYFxo8Y"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so22761175e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791446365; x=1792051165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vmAh+vcbexseRduWOn8zX0LgrmcKFTh1yMPBWzDpwU=;
        b=myYFxo8YwApyI9dLGpRDdg3UTg3hxGqiV6FaRGBbUHJPac8cgoi58yVnfkc7BMpN9w
         8Sk2+ZxN7mIQ+74iTnPH6lEch+jp0lcHlpvWiy+0PGXorpI9NfQ78OdC5Ifv1Uims0tW
         jz3gRVKX4z38s5Xl7Dix/igNvlvgEjmVTuCm9zILYpJ/qV8H8lMfJB5er0t8RU4uEnBz
         IxZck8lVTVrSFg8x2atT6fAC07UvrSCbZZ8fClg9dvck3OP0Koc2Zm74Ry3lFQ6D4b7S
         fxwnbVkZWk1yrtFeKeozcP2g107MznH2e6bfLQrwxWO6XpbK9I4a7yAFpWvgUt8wkvc1
         NtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791446365; x=1792051165;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vmAh+vcbexseRduWOn8zX0LgrmcKFTh1yMPBWzDpwU=;
        b=RZXyEfLVsCypAcKWI4/u4IKRLtA9daj6DGaa/L8WwyuyakI2v9P39zYihhMt6W3kG8
         90qmkddfp4IEap9t3tJBKIsPL5YrKv37/huT6m/LvG952z9uFm7BvJIG96EBrFhHmW1c
         FR/Tqj6Cy8UnEzRAWc9Yfp2uG4WmDA6YB9y5TkjJmVnTdRl8OtFUq8Djws8V4yiMbW5Z
         xWNqUE6Wgds+03ljOg/g9WRFPQp5CJeQvkWaFV9aXCIZVKVt1QvAuOGfLmanv0ptH+/c
         b3WEZfGgNfKD3Do9xsce8iw/YeUNCThEWRUhZrT4Ghhgh0QpyfbZbCek4sXovhMkfV1M
         Tc5g==
X-Forwarded-Encrypted: i=1; AKwUvBwduhSchcR9YsXiFDabbvbO0diIdXTfFOCONzlj27eHMv5pfJAdDoZ0YeS+V1v8w42BnrcXoaNSgGwQ/ww=@vger.kernel.org
X-Gm-Message-State: AFuF++lSVPi1274ckSMsz3t7XfU48+vZEOY0LXLbxPvSPdKNIR/Kp+G+
	1hmuX79Qta1fnqGhISTclB3r6V3Uh6BschK3F/yYHDX4TPyAn9tyb4L4ArVlxzwA
X-Gm-Gg: AYBFou1DSlV3JCJqmiXAGlg4ikD+oUjXueP4tBwie0LWDBu3RnsTZBILZFeGH/y1pwj
	QjwVOcJqMzVug+m1pPoua5NPbfJ6Q+JFYMzFwq/t38df0w9eQt+X+kKTxJ25UmxfsMxrTLc6M8q
	e/fi+ZOOFzkV0YWLr6ym6RAtYRWXq/nHUqe8G/sK+ffKjHaYK98gFalbQm+UgURljplTfwqhibb
	hzvrBVqxr7IFgNzaHcUgFcyVzWEMrLnDfOaj5VGPaXU4t2c7/pd6eceREF0DgEFwCMixwQIPtY3
	xN+y1ncdSfS7EplWZvBGoptJcYrr8B7Z9mRq0+SySKdhuXjDJZ71UqjM5xGbEYhzTBV18li27sT
	kAJth4g+aQpaKpXXnrnkKWPlKYGaLi71EwmPn5GWUp/pVON5wDrTEJDYenibvvtOleVuLOEW+hg
	tgQ5zro0GyFXxwzRNI5lTZqapFhkUy8YMuy3j9UlKhtzd9mqqqwm7TkStLuCeJ4A02D16wTruG/
	Qa8IKnTxqe8sHYn0PWhdns2AATIxlC+G7Y=
X-Received: by 2002:a05:600c:19d0:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18045373dmr75400935e9.22.1791446365444;
        Thu, 08 Oct 2026 00:59:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d13a01sm10869262f8f.29.2026.10.08.00.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:59:24 -0700 (PDT)
Date: Thu, 8 Oct 2026 08:59:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>
Cc: w@1wt.eu, linux@weissschuh.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tools/nolibc: Add dirfd()
Message-ID: <20261008085923.4f141f4a@pumpkin>
In-Reply-To: <20261007052914.888956-2-daniel@thingy.jp>
References: <20261007052914.888956-1-daniel@thingy.jp>
	<20261007052914.888956-2-daniel@thingy.jp>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2026 14:29:12 +0900
Daniel Palmer <daniel@thingy.jp> wrote:

> This is useful for things like fstatat() on children of a directory
> opened with opendir().
> 
> At the same time use the new internal helper to replace the two places
> that are converting the DIR pointer back into an fd.
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  tools/include/nolibc/dirent.h | 38 +++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
> index 4e02ef25e72d..d282ea8eb5d3 100644
> --- a/tools/include/nolibc/dirent.h
> +++ b/tools/include/nolibc/dirent.h
> @@ -27,6 +27,18 @@ typedef struct {
>  	char dummy[1];
>  } DIR;
>  
> +/* Internal dirfd() that does not set errno */
> +static __attribute__((unused))
> +int __nolibc_dirfd(DIR *dirp)
> +{
> +	intptr_t i = (intptr_t)dirp;
> +
> +	if (i >= 0)
> +		return -1;
> +
> +	return ~i;

Might be better to use a different name for the variable.
The two return statements look the same at a first glance.

David
