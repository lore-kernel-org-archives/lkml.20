Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611195;
	b=Io2upWtc+OQQQ4Y+KJn7d5KtVlsP1VBq42qvMDbZKIRDYVi3vVZsEP0y3vKberWh1mGK
	 nXqAwCbd0VLaOFT5htY5xMuf4AT7z63pIR7ueb5N0/yzLBzSslEfl7DwwC1hmawi6H6C4
	 Uqz4y+URC5cmcfzivli7XmvUyjusD1xjN6wRo3TkDaTT0pfZ5/LG3jwR/rVjSNjoHGYLW
	 b/U8BlZkGJnQTybwwwuxkErqbG4+1gSkBwKk+Z2AKEk0hqaRO82ApCo7CROeYy9MtpiW/
	 +vCXUZgGnmVq7sGRay8Cj4I0tLKg07cNFiKUu2R/vXsva65PHkF29YMUPLLQsqAeTzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+yZBUb0y0aJXtsvRM5IV1QM8j0O/2H7zq2msJp4QzHk=;
	b=DFo23m2klIW4Zh8ktlQX/ZvfugYS78z4G5fdaphDbjS3hWmVKY5RFeryhsm389Sq0qIk
	 V/q7tnIMkykHNJx2lCIoRwz0uxH3+Rf6d+87xIk/Ljqp8ZDvDdp+nW2hMjA/LqzNcdFcl
	 23g6q+kVmffye6yMGFwfOD0+BZcTYX00g4pi5ourihXSVe3LUMjc2JBdxoSU5rBypBvVr
	 9He8H0zlgtUNtLeu21cywAw+EXDk37GXBWkKJ6WKF2HqZ6gozuxXkNwebJO4ZlcQpvhr0
	 zSkqj3V1Wel99QQLJxipaRp8OcAiwGYuR0k9hQpzVhFWWFhL1II3ZZKo66Jiusr9F7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VrOkhrXC;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53423606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53423606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VrOkhrXC
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b2f59de176so2474571b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794611195; x=1795215995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yZBUb0y0aJXtsvRM5IV1QM8j0O/2H7zq2msJp4QzHk=;
        b=VrOkhrXC77H0umI4DTwF7JUWQ/krcKt5S0DY6D2pGu6jLl8pQR/+4smtqwe0pYpFwW
         TYLcVkvfkepUs0APzVMHRp0N5kQkKLKrDY18wqAoH33av/qyUBcYkGzFzSFla1XFZY41
         6A4+Teedu7g+cB9Ywm+XF3l72fC9KkOSBDFiDLLUGfQ/2tN84v9byqMCUgOYpqJ/FT/P
         t2mLjm4LeYBkd9fGQCm3i60wf5KOMq9/QN/eTstINGbRAqvGqFVhQphok9WgxOeIYX0x
         0AcfXhuES82VESKnvZa4iWEdL5uTGkZPA9NA9FHbgem+z+RInBo/b1pWo8hI0PtkhwIC
         2F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794611195; x=1795215995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yZBUb0y0aJXtsvRM5IV1QM8j0O/2H7zq2msJp4QzHk=;
        b=CuU+TdWPOzfEZjyUVUz2TmGSeJydnvhY1QxcVZuCHczijjD1tmRsloPTO+6gA+TIM6
         +ts5ErZikIu41id26wdpaPqp2KkIgS+hRmzWhEHdDHtMHF9Z9kAt7rtjS/2GgwfW7rrI
         zWjuf79VLnw1CuyNoK/CjhS0HoL/4mlQHdM+CP0VkeELb3M8g6nx552Ev8TlLv+y5LYU
         /QiyjvZQqOe2ltLqHdJNoSQY4LjNuhLh+ngxcTBRWYKnsUvPaAQbCK/2UT8ZishXZrBV
         r77croTPFCbm9HMhWcfa+RxQ7QzzIv8sxMCAlFI0QuldFtGLsPB6VNLYLYrF2EGQ2T7H
         wPFg==
X-Forwarded-Encrypted: i=1; AL+hErH5IRTF2T0XQQgoQ5WiDD0AhbhWHLnykmmwGSB01poKAiAS6rjOPy5FQVJssZUQmxddcVIzgU2jgAfya6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cWf0OQCfbpxL/DvQD7VQH7D1I7bPuT1Kk9uCJht14I66cqNdO
	B9tWGLf2o5+gi9pVUc8KWUjm5iSrSifSVZPM1e7qzKHv69N4RHtl3XkA
X-Gm-Gg: AYBFou09F9YOiOry1RaW0sgFaLk5ONMouWI+//qYkEG3kL57vMBtj4sH//96ulWHwuL
	Ngo1v+j8D5jt+b5Tu+NutFWYRnLLYJKEqg8Og9Ghc+D/ueoCR64R4juYB9RluVgkAUIxe8QT9H7
	cqGkA4M+/5YVGlBrxEWPMIveOy0IqYrtuEKufeYjzXDZaUgkudj2RI7Ahw6Uei/EOlC9fE+Y+K/
	XsMWOiOpV1/1ASiOf80XJCeKzohftik9Ori5Al49lAYj5Q/mbj12xfDZBoz8g888bQKn/wh1Vrw
	uT2IDNdXuT4Q+e7pC7wdgDAwYizsthIZVOys2c14ff/yPNyVnBr8An+1jbsoYO+peOdMaxDZ98Y
	QA9vEJ+dRhmS37eo9/cS/TPoNMvlS1SUDkSHx7rDzqanOtRtvt15GoTp8eY9PIVQEUacUWarEgC
	4iIR6wiwdExqxRz6sBmMfpYgP7bMCGzqZE+OofulZqDqhXtjoacI8nNRgZqCV+uYjP4Azv62ivy
	49wODloOPfOeiiskz3Yaz4jjbYIt3Ofm4jcMfYpZ+Ui0EwZxj3nGAD25Rgwvi4wcHKxz7D1b90O
	7UlHS0BR8f9vNHZsqx7Ac3mcBJUXSzuSog==
X-Received: by 2002:a05:6a21:a106:b0:3e2:21c0:3dff with SMTP id adf61e73a8af0-3f7a8de8800mr3452800637.65.1794611194624;
        Fri, 13 Nov 2026 15:06:34 -0800 (PST)
Received: from user ([2405:201:c052:b00b:57da:89f:77c9:e916])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm1653308b3a.36.2026.11.13.15.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:06:33 -0800 (PST)
Date: Sat, 14 Nov 2026 04:36:19 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: trondmy@kernel.org, anna@kernel.org
Cc: skinsbursky@parallels.com, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com
Subject: Re: [PATCH] NFS: Destroy callback transports on initialization
 failure
Message-ID: <aveX66UdPwMrs49E@user>
References: <20261108210452.84550-1-pavankumaryalagada@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108210452.84550-1-pavankumaryalagada@gmail.com>

On Mon, Nov 09, 2026 at 02:34:52AM +0530, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> During NFSv4 callback initialization, the IPv4 listener is created
> successfully, but the IPv6 listener fails to start. The error path
> returns without cleaning up the IPv4 listener. As a result, the
> transport remains attached to serv->sv_permsocks, causing svc_destroy()
> to trigger a warning.
> 
> Call svc_xprt_destroy_all() when IPv6 listener creation fails to
> close any transports that were already created. This ensures all
> transports are cleaned up before the service is destroyed.
> 
> Reported-by: syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/6aee17c4.8be4ead1.3b45e1.0199.GAE@google.com/T/
> Fixes: c946556b8749 ("NFS: move per-net callback thread initialization to nfs_callback_up_net()")
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---
> Note: Tested by syzbot using the reproducer. The kernel built successfully,
> and the original WARNING was no longer reproduced.
> ---
>  fs/nfs/callback.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/nfs/callback.c b/fs/nfs/callback.c
> index bc282b744f34..29134e2c56cd 100644
> --- a/fs/nfs/callback.c
> +++ b/fs/nfs/callback.c
> @@ -61,9 +61,11 @@ static int nfs4_callback_up_net(struct svc_serv *serv, struct net *net)
>  		dprintk("NFS: Callback listener port = %u (af %u, net %x)\n",
>  			nn->nfs_callback_tcpport6, PF_INET6, net->ns.inum);
>  	} else if (ret != -EAFNOSUPPORT)
> -		goto out_err;
> +		goto out_destroy_xprts;
>  	return 0;
>  
> +out_destroy_xprts:
> +	svc_xprt_destroy_all(serv, net, false);

Hi,

Could you please review this when you have a moment?

Thanks,
Pavan

>  out_err:
>  	return (ret) ? ret : -ENOMEM;
>  }
> -- 
> 2.43.0
> 
