Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794078944;
	b=RyqeM5LZu14/MvqTj2JNeV5cxEucH4MMMiJKmKUSXZdKDNGcY/8/5Ouf2G3vP/QRfFZR
	 c7fj1XGHAkcf6j6BJ37xwP6En+mAAxyk1eZRyH1A4DfHKNieq4R1ZU2BtHTjkoiK1mqm9
	 0ZJjsMZ1b9RwEApj67dMBJR2/QN0np6T7krOW1pzrJb7DgMoAvGdrwf/83SPO1uYODz0g
	 B6GGJMXsPYMaIZffFyDwaiTz8VuKUhHvyEZn8dh7BZaDqndoSm0i3ZN4XqaOeImFjI5DE
	 SXSHxVEB0XXbvOrPSuDp+xbZF6ilFNIpk5N+Vkwu7yLdokvVKDiXOx/PyTfBnhkOnYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078944;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=dANJam8Ebp1fZTTzcaVCbIUGi2/NK53aJnR23QUOpNA=;
	b=H1GL3M0Xwv/7J5J6NsnzSlNOO0kIFrAvYjvssmpmdRVaPdaV/pSzwFsAwqrq224AP+fe
	 Aom+9Ujw6BMKrHoRKJ5wW6g21yQQEnGXBbSAHAnJ1wkgLVIyKVp0FDCKZNb5ws9sPu5Fz
	 S7CJAOBZTv7AcHb7GVZSvDM93Eq4/PHhEMOMG5TSuHCXeYMmkrgpab2z8gLQKFlgdReSL
	 Cn1HcBCmww/kc7Qflw7y+m6jsR6o3+zxb6o1jTaqU8gsB7qNp0zzyz3yw5E76IWg3UEgG
	 CUJydcBwXYOZT/qF9Z5jQ4vJ3QQPK8yH2YT2ZQTpbEFMZSaiGl60yWUSNuunVrTeQ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NMxsjaxg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05D2606A326;
	Sat,  7 Nov 2026 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NMxsjaxg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074161F008A1;
	Sat,  7 Nov 2026 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794078943;
	bh=dANJam8Ebp1fZTTzcaVCbIUGi2/NK53aJnR23QUOpNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NMxsjaxgm2F3XgQFiGijuGc8vsU98g6iiZIGNKEugs8nw4MMi+2lMhZTeB9dRBa2w
	 xJjaM7r8SQ8V9k1s8/7iJHNlyipYJVENmPYwJk8XAJy1Yx2XjSYUumCy81Rv6XHMH5
	 Zdb4MeP2F534IITBH8hslysf7zzMd07OU423ULlI=
Date: Sat, 7 Nov 2026 14:15:40 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: aleszlucero@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: fix race condition and log macro in
 ethernet-rgmii.c
Message-ID: <2026110701-editor-surprise-fa14@gregkh>
References: <20261107-octeon-rgmii-fixes-v1-1-3cd7734fd2ee@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261107-octeon-rgmii-fixes-v1-1-3cd7734fd2ee@gmail.com>

On Sat, Nov 07, 2026 at 09:52:10AM -0600, Oscar Alejandro Sánchez Lucero via B4 Relay wrote:
> From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> 
> Fix a race condition in cvm_oct_check_preamble_errors() by moving the
> read assignment of priv->link_info inside the global_register_lock
> protected critical section. This prevents unsynchronized read-accesses
> concurring with status mutations from concurrent polling contexts.
> 
> Additionally, modernize the message output by replacing the obsolete
> printk_ratelimited() call with netdev_notice_ratelimited().
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> ---
>  drivers/staging/octeon/ethernet-rgmii.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

How did you find and test all of these patches?

And why did you send 17 of them all at once, not in a series at all?
How are we to know what order to apply them in?

I've dropped them all now, please fix and resend properly.

thanks,

greg k-h
