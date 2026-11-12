Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492853;
	b=b+jZiboV8dsvnJ8CEorralKrzk9yiks01cSOdC4QuQ5Mr8P8IsWLdOpNZeg0iCjNTuFg
	 IPyK8DBcr0MZSJhtjrOm7UYWRK9TlglaRESUPVDSo7xNgVz9qT0Z+bEupAdnOT4bBBjpX
	 a2LfAnGdqnIRJH1LzTpvZ8GTxcFaxyHgGq0vdkBv1AdaevJoN3e/Dkul7e4Iyiud5QfoT
	 8HAc4cyxSKe4PZukEaryHyxqxDD9B2RzLwBLxJTiWzNkHL7KAKZcEg8WiazTkJws5dmyO
	 a3TAteYagyJbP7PIGw0OwI4qBK4mhgnfhrWq6cTxOFPIA2vM/Qq1hDz6g7YkAp0F2ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492853;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4zxWTrc6W0S4kY6XxXSoPARJ/LzyYdm9uxXTWXtxR/s=;
	b=RJGgvo7ZvduA67AAHJCEDNRdMjeerklRO4daKWqczmfn1dTf4CZu2gyBpXzEKgytSy39
	 FVEwbR0zZLOHcEm53Ap0iDMgVACcewxFVRuRlqwEKwovcQfQelqeYO+5LZgsRGo7ZOScv
	 +afxDkA/7YcYW0c3n8IdV4LJL9qg0VhutAmg1R4AsXhEPKXVvAy7IfLPqI59KBSctoGL8
	 8StbcvsZdzwjJeAG0ktmK3MBfUFJTlR7aV40Dy6wBxP39kThl+VJAYvZ7rQdCsN+PQ+7m
	 3EG+Fajks5Y0vZe/NaO0JUmUwbTfqXPfLCalEijow+sJrGhDrgN8Igdk62v+Zoptmxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFMDqzvK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D73606A321;
	Thu, 12 Nov 2026 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFMDqzvK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5C41F00A05;
	Thu, 12 Nov 2026 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492852;
	bh=4zxWTrc6W0S4kY6XxXSoPARJ/LzyYdm9uxXTWXtxR/s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=oFMDqzvKyJYhVaW5CKrC096Aa/DneOH/BontTwXZbxw32cwBqY4zKFoZ7xfLhvVTr
	 vIyBmIUc/BcSe7OP+yckF1QGt+/A4FSzfrU5l33lp2r0v3YzGqxvLJSX10PYBYX5ue
	 uQNv+3g6AXonbUr55a7csLZWKEILNfqcYmoHFAtFmY0PfKuReU3phke+dZ9PF0Jadr
	 V63qpWTKH2n6cBzv7P+HSNbwZZ1+6mwYZtdyU4Lx+y3nQhurmkUgMy9CcQAkHjxYnj
	 M5ENffPFl2/GeHqoJbxGAJtgdF0APZY/wXtBMHRIx0kvpLEoIhvH1vSXOcmLobokB4
	 x6SqVIJQCULIw==
Message-ID: <72684fa2-57d9-4e92-8bff-9213a27215b8@kernel.org>
Date: Thu, 12 Nov 2026 15:14:09 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 3/3] media: em28xx: fix refcount underflow in
 em28xx_free_v4l2()
To: Nguyen Duy Nhat Anh <neganhat@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
References: <20261022194618.14170-1-neganhat@gmail.com>
 <20261022194901.14302-1-neganhat@gmail.com>
 <20261022194901.14302-3-neganhat@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20261022194901.14302-3-neganhat@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2026 21:49, Nguyen Duy Nhat Anh wrote:
> em28xx_free_v4l2() is registered as the v4l2_dev release callback, invoked
> when v4l2_dev's reference count drops to zero.
> 
> Calling v4l2_device_unregister() from inside this callback causes an extra
> call to v4l2_device_put() on a zero reference count, triggering a refcount_t
> underflow (0 -> -1) and a kernel BUG in lib/refcount.c.

Huh? v4l2_device_unregister doesn't call v4l2_device_put AFAICS.

This doesn't sounds right.

Regards,

	Hans

> 
> Fix this by removing v4l2_device_unregister() from em28xx_free_v4l2() and
> calling it in em28xx_v4l2_fini() during teardown instead.
> 
> Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
> Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> index d653341ffd16..45b62655ca3b 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2332,7 +2332,6 @@ static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
>  	struct em28xx *dev = v4l2->dev;
>  
>  	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
> -	v4l2_device_unregister(v4l2_dev);
>  	dev->v4l2 = NULL;
>  	kfree(v4l2);
>  	kref_put(&dev->ref, em28xx_free_device);
> @@ -2462,7 +2461,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
>  	 * The em28xx_free_v4l2() release callback will be invoked once all
>  	 * userspace file handles to the video device nodes are closed.
>  	 */
> -	v4l2_device_put(&v4l2->v4l2_dev);
> +	v4l2_device_unregister(&v4l2->v4l2_dev);
>  
>  	return 0;
>  }

