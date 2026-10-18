Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FF6415B8B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792352923; cv=none; b=BA3UqDFWin/o/C0YMFEHwktp/SHrfbpj5kr7sGzfnWni7ewQ2MsyYsVB+UOtrKGZrfa16vhynYlYpoyouY+8g2XK7UTT2qc+MOzf0sGM73qOd/ydK7zepMmM5HZCEMlLFEhcgYIFkpzQuMd6Z9nmYpU1j9lcbRaQKPpi3pSIdJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792352923; c=relaxed/simple;
	bh=z8+NKlZVaJg0D1viDndIi21e6QYlTGrfLeaOwjDv2Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s8H7qXQMUU2okjtCsL/xfSWWHdhRqK5ec8D0cjP79uo7Mu9cspv4lcC/UA79OhZkffVY0SywonkCqRrZjcwo0zoVQXSxZxsg/pGWxhcNgsICZWnX0J7ClTIg6S0AgQQIdt1DLJuF15+17eOa4nNab7QR9gFSGKRrGxhyaH3M9Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETKAfiMW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETKAfiMW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so7993595e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792352920; x=1792957720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nT4NId0U2jiAqaCcS2HDGNFvu8HoNbnVXS9R3IhMNjk=;
        b=ETKAfiMWGZMMjK7jvf+EaLF1zybUc4XOoUGXkkdzOT+59t/NrkQf6gawa07DV3ZO3I
         titJE0Pr86WP9hXNUrXseD5dRyKG/JCU2T2Auzz/SdVKR11XM+Rtqeqse7uVZ441dMWW
         2nO7O1Pv/jQF3jd5uyj73CIq3I7VmG9Uje8TcM+mDAYhpZ4Y+Mz0S6CDfOrCnFLT1wzb
         WEwWqAiZM7DGBXwiyrnfa1zqwgDFgo/+muOr7p3zy8hkfm55HmSTagkrYGealGz7Xmh3
         eCjWOKR4BZBk3KZnVlDN90n8H+I5rDwXnTa6laULzLc6pXGM7j2izhEefpar7jW0tfXn
         Iaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792352920; x=1792957720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nT4NId0U2jiAqaCcS2HDGNFvu8HoNbnVXS9R3IhMNjk=;
        b=NM94CtY99fnzuUKbQ0wTU3as1inw/G9jfWMdHfALKlloMP32WF/V+GQhgvKf/Za9Ar
         RkWZs51yy9tMCBohymZ1cr6yNW9Ut/a1tpui/fnuR/2DGi+RXED1DSQGE6K26BMS0eff
         /wX2yrp+7IpNYCDWUE/3VQZy04tUXlvM+teqT5BqC4xwKuqyCmifiC0IlONBCuhV0bSA
         gYgyQchkkMtfpPsgFHsmWvovFC1NCEk3WL6Z4BT4YS1i1iLBZt5nd0dPg2RpZeP/hO6Q
         I3CAEMJgyfwDS9RXCh2SioqqqeUJQRFHswRTedGO/v6nN4/a9TZEfwQ6oDINux/lC7vq
         jlwA==
X-Forwarded-Encrypted: i=1; AKwUvBzubaPFJzC6yYScZDhzXISAiBzgAcC1d1D4dfLZGocnERVmd+inPqaFwkrXOg0/ATsRbcq9uv7QpzXGIW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL77j4zMo6GYJ8mz2zeDaQaB8+R1qhQwn6rFec8BotI5r1j2Hof
	PQPbGn3QgvUhotwkN2s3TXPwYJdS9EzkUXyJqMjle4+JT67VVE9k3RrD
X-Gm-Gg: AYBFou3szCG882aI0Rw91cKrKpt+zf0MZ8hPGbyGLSroUUe7EqskQ/0SiaUoW0y2VXt
	BM6eUlo+0I9n3MLzJ6Ek5zv//C7js/kSg8JqpCjjpdQToHIxlxwezFxnpY3Ez4811WdPInMwZil
	5O1kwRJbURiQG0MjPRfRpzVhy/c0sSSbI80Y2rhiqWxNjkYzvNsm3NkW2JvM+XN2Gb7lDGpMHZ9
	Z7CA3PcI4tLMxCfBTjjfQUWFZVyrgm9wnTTJ1XuA/5auZWHooNXvMzKdzvxG/SU4GzwXTdURQj2
	FVjl23GUfml88LTuHugnVEyQEDajW2VygDLIUHukb208T+6gb1pU6DBTp+og+XJvf8M8GS1Qnk1
	OI2EuTHldFUszktvjOuRExID5MlYvnwTR6JUU6gYJWtpSgKik0aQTUr6JbOA+sbnKcglRkqOgNG
	yLGVaMp3G6QgMB9iagFwGz/DmAiNeMj6QOPXHGcALWWbR0Zm2tAPzOioueZ+IChv5z9y2YCOQ/x
	EMVHrXxMPBmgG0YzdrsaC197Xta16pW/ec=
X-Received: by 2002:a05:600d:8488:20b0:4a1:e3e2:93e0 with SMTP id 5b1f17b1804b1-4a1e3e2967dmr30105055e9.32.1792352920294;
        Sun, 18 Oct 2026 12:48:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d1bcsm18886835f8f.54.2026.10.18.12.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:48:39 -0700 (PDT)
Date: Sun, 18 Oct 2026 20:48:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Haoran Wang <haoranwangsec@gmail.com>, jasowangio@gmail.com,
 kvm@vger.kernel.org, virtualization@lists.linux.dev,
 netdev@vger.kernel.org, eperezma@redhat.com, linux-kernel@vger.kernel.org,
 security@kernel.org
Subject: Re: [BUG] vhost/vringh: __get_user without access_ok leaks kernel
 memory via vDPA passthrough
Message-ID: <20261018204838.4080b238@pumpkin>
In-Reply-To: <20261018152358-mutt-send-email-mst@kernel.org>
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com>
	<20261018152358-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 15:24:41 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Oct 15, 2026 at 03:23:45PM +0800, Haoran Wang wrote:
> > I'd like to report an issue in drivers/vhost/vringh.c:1216 (function
> > getu16_iotlb), found via static analysis of Linux 7.0.11 and verified
> > against the 7.2.10 source tree. I have reproduced the leak on an
> > unmodified 7.2.10 kernel.  
> 
> 
> This should fix it I think? Can you confirm pls?
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/vhost/vringh.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> index 9066f9f12ba1..4b097170bd36 100644
> --- a/drivers/vhost/vringh.c
> +++ b/drivers/vhost/vringh.c
> @@ -1213,7 +1213,11 @@ static inline int getu16_iotlb(const struct vringh *vrh,
>  		return ret;
>  
>  	if (vrh->use_va) {
> -		ret = __get_user(tmp, (__virtio16 __user *)ivec.iov.iovec[0].iov_base);
> +		__virtio16 __user *uaddr = ivec.iov.iovec[0].iov_base;
> +
> +		if (!access_ok(uaddr, sizeof(*p)))
> +			return -EFAULT;
> +		ret = __get_user(tmp, uaddr);

Can't that be a normal get_user() call?

David

>  		if (ret)
>  			return ret;
>  	} else {
> @@ -1251,7 +1255,11 @@ static inline int putu16_iotlb(const struct vringh *vrh,
>  	tmp = cpu_to_vringh16(vrh, val);
>  
>  	if (vrh->use_va) {
> -		ret = __put_user(tmp, (__virtio16 __user *)ivec.iov.iovec[0].iov_base);
> +		__virtio16 __user *uaddr = ivec.iov.iovec[0].iov_base;
> +
> +		if (!access_ok(uaddr, sizeof(*p)))
> +			return -EFAULT;
> +		ret = __put_user(tmp, uaddr);
>  		if (ret)
>  			return ret;
>  	} else {
> 
> 

