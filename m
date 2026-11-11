Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399881;
	b=PYczMgjKxvMDHV/5Q+PxnIeLnY2J3v21pCfhEro6PCjOVo6REGcknoniG8GGYW8wuiN/
	 ATP0CbUL1hnEMFLI47+CL+ArNw5RnSm7abGLJdGiL6Xx7XWcojkzZPtkdswhO/5mdqPhk
	 ZWTMcrgVm4oc/gDbUEPdOD8VdldKN/E+arXb7tJi2dRZ4+UKXkXkkBs+LudI3Ar1p117p
	 MxQWirrlnwRGey99M8vugUhimIhvzw9DCQaFs9lRzGz6VrnQbuUu+DnJ16iWtqmhoJPbF
	 WCXXswMyvwUcS9Q7gOfh4D8rhUE4qhisxumk5NRmrsUayvXg7KBU3a8pn/drc8YbLew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DdzABbJ3RgjxW/78ek3zCU0rPzdDrV/VzN4+B24AkVE=;
	b=oH51CCHRvBc/hHjAFXvds3uwKP8o5IIQYKHYQ2XYiDL5xCFVZT/0DzNoaYY3Fj5fWSre
	 85nBXVrKvxBhDXGK+bZ9yaLTAdYzmqARPAOJ9hfU6PelLbwXd0vQrhezVpvQ7qIDRNdtd
	 /4mHb3K9WAxIBmYYbPJbq6kxOKoYsZoir9z0F9kJtMN4a896eDwSKdk/GRRPqOqMooh5b
	 tXqnjKzRq+qFfoMr/YyWwYMSOr8vwe5W5DmXg7VLjQsR5VAw3FCn3jSYgE0X6mLhA62/X
	 KezTSaFXf8puioDjwIXrTVBsCliFhUNcTkvd+I4M53iJO9vhcfWP4IgtqEDId7TI+BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alVT57eR;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CCC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CCC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alVT57eR
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c08c7adadso2587150d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399880; x=1795004680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdzABbJ3RgjxW/78ek3zCU0rPzdDrV/VzN4+B24AkVE=;
        b=alVT57eRRL6E2px45UvVQ5T5CIGC/a21x4+yb+XK4/5un2R19jNsbDZsIdfIdW+pUc
         Qarbx5jjwe9uCps/Te/UGrxdMvSk/8ow4Fm54lcIsPZ5Y34AtasIahOUWMhu6EjOIuvE
         szZAVW00vQHGK78ASKqr2f1JGFzJJ3M1rlVZa3GxF83wFgULdyHiXRVKC7wn8ZZonzrp
         5FitUDVZfrMpPfTy1bl0xUPfhD43uk++AQWFpPjkDA4MSOc658NqCu2nBmWo78SK1MsD
         yhHJipZtzOWkxa09CVCsZmKjGImKWf6Fd+WfJAuUKRj/5Eua4uaWM4eSf4BN0YC60NC+
         SQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399880; x=1795004680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdzABbJ3RgjxW/78ek3zCU0rPzdDrV/VzN4+B24AkVE=;
        b=xZgpR0TvA8diFjelfYqWrPhVMgSB0ps0zjilWuanYkUB4ySvqsIhFwBv+C2RmQKfKj
         cMFbYsWCOmniyXIYsxasB4IIegw6/Q6Moe3gU2+6kd6zAstCQjMDzjkvpNn8/BfP0Wlz
         UwJ80z6jJCTnFyy07PEuC/tQWzRvJBwaYqlyfc5GmmqRdiUa0GMBtV2N0N+SInPSbmrH
         /hxopYmrzAjDA7fGP1eByfY8S/oxx5IOBOKsa16FGj/47YZJdzYfFWO8xiwGasgMz9k3
         q72zRKdwTFRinFbwn9D+EyPskBugWkdSdQFSFnTNljUwk1ffXdqHPOBXW5rBl11RK3ZT
         rc/w==
X-Forwarded-Encrypted: i=1; AL+hErEI+ioWbwfvHu9FC0YgTlHDs4XCxKKLkjkUGGhuf0nOQejTH01da9HKsGl0rvgyKBsAhfgrnktpXUv5jik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q5bzpgtLdgAeHNNfmD+0vd3OrBxc5Qk1le/j05rYlRrH4KwFP
	gXn2ouVuMras/QSZni06DS3Ic8w//0XT+nCGnFI+LvQs2AOVIfOKtiq/
X-Gm-Gg: AYBFou3Iva2+xlLB0Hyj52pfdpiKhCxoZV2ongjzpZT059MM17lLcpGpDX0+yYs/DLe
	EXZ2XLtIFnCu+1iPBHemzX7b3JaQITdTTeFS7tZVMJkg2aEL/89CPSRcsIcD6QC+wBWa3Nky5er
	Z+eqHKEnf81ReMLQscZMK3NxG6CWBkO6OYk768Np3kRESH3mxvRhuadSB4rLbn7PBJhEkdrDrM4
	BrS1C2dwIIdbBqwsHHKw/P2OVm8jvDwWl0Y9zUEIkpkzLEH+MlZgmboHohM7GGjlM2cjXAqT0nG
	wTUJcAKD2ZFEWaYu9QJvDhykQSj33jdxkAVBeqBpVDw/Juv5MU+Mq5NUzQSBRpdHBJA4aocS7GO
	4LeOH4JaTxfE4lMr2qEfw+n6sHr2dcIQ7mqoa38qeEcr2miakRX2lvZZXjytR+VX2U5UacagQZN
	p0mNGld7YEjV7iEGE9djoc+nuxEp1mUh8ulz3RFot/MGf5MkpAaPxUKe+j0Z+1evtNZaN0dvUNK
	wd36TcLfwak7nYjJX7Xy5tdowvhPbUAG8zvTW3zV+udnUyzYFqkapGLnB5zrpYEGS5kVaD7JpNR
	zGgI6k0LYgWbO39uc5OgNe9q+Wad/7RmYj/JbZ8ZTMekEHTu1X0oF2ysI4n0Bcj+bdGLKLZIVn9
	WLjMAEuh0
X-Received: by 2002:a53:d7d2:0:b0:67c:11e0:565e with SMTP id 956f58d0204a3-67c67fe2c73mr940727d50.31.1794399880211;
        Wed, 11 Nov 2026 04:24:40 -0800 (PST)
Received: from fedora ([187.120.157.132])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c2ef4sm4379780d50.9.2026.11.11.04.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:24:39 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: trintaeoitogc@gmail.com
Cc: axboe@kernel.dk,
	bvanassche@acm.org,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
Subject: Re: [PATCH] nbd: fix circular lock dependency
Date: Wed, 11 Nov 2026 09:24:26 -0300
Message-ID: <20261111122426.225742-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261111101919.215767-1-trintaeoitogc@gmail.com>
References: <20261111101919.215767-1-trintaeoitogc@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guilherme Giacomo Simoes <trintaeoitogc@gmail.com> wrote:
> > Additionally, reclassifying the socket in nbd_get_socket() happens
> > before it is known whether NBD will use the socket. If
> > nbd_genl_reconnect_sock_cb() does not find a dead connection, or if
> > nbd_add_socket() fails, the socket is returned to user space with the
> > NBD lock class. While this only affects lockdep and while the
> > nbd_add_socket() error paths already behave this way, it is another
> > reason to only reclassify a socket once it is really being used.
> current the nbd_reclassify_socket() is called just below nbd_get_socket() call
> inside nbd_add_socket():
> ```
>  	sock = nbd_get_socket(nbd, arg, &err);
>  	if (!sock)
>  		return err;
> 	nbd_reclassify_socket(sock);
> ```
> 
> what have exactly same effect that call at end of nbd_get_socket(). I guess
> that "reclassify a socket once it is really being used" must be done putting
> nbd_reclassify_socket at end of nbd_add_socket() (before put_socket tag).
> Maybe something like:
> ```
> static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
> 			  bool netlink)
> {
> 	struct nbd_config *config = nbd->config;
> 	struct socket *sock;
> 	struct nbd_sock **socks;
> 	struct nbd_sock *nsock;
> 	int err;
> 
> 	/* Arg will be cast to int, check it to avoid overflow */
> 	if (arg > INT_MAX)
> 		return -EINVAL;
> 
> 	if (nbd->pid) {
> 		dev_err(disk_to_dev(nbd->disk),
> 			"Cannot add socket to a running device\n");
> 		return -EBUSY;
> 	}
> 
> 	sock = nbd_get_socket(nbd, arg, &err);
> 	if (!sock)
> 		return err;
> 
> 	if (!netlink && !nbd->task_setup &&
> 	    !test_bit(NBD_RT_BOUND, &config->runtime_flags))
> 		nbd->task_setup = current;
> 
> 	if (!netlink &&
> 	    (nbd->task_setup != current ||
> 	     test_bit(NBD_RT_BOUND, &config->runtime_flags))) {
> 		dev_err(disk_to_dev(nbd->disk),
> 			"Device being setup by another task");
> 		err = -EBUSY;
> 		goto put_socket;
> 	}
> 
> 	nsock = kzalloc_obj(*nsock);
> 	if (!nsock) {
> 		err = -ENOMEM;
> 		goto put_socket;
> 	}
> 
> 	socks = krealloc(config->socks, (config->num_connections + 1) *
> 			 sizeof(struct nbd_sock *), GFP_KERNEL);
> 	if (!socks) {
> 		kfree(nsock);
> 		err = -ENOMEM;
> 		goto put_socket;
> 	}
> 
> +   nbd_reclassify_socket(sock);
> 
> 	config->socks = socks;
> 
> 	nsock->fallback_index = -1;
> 	nsock->dead = false;
> 	mutex_init(&nsock->tx_lock);
> 	nsock->sock = sock;
> 	nsock->pending = NULL;
> 	nsock->sent = 0;
> 	nsock->cookie = 0;
> 	INIT_WORK(&nsock->work, nbd_pending_cmd_work);
> 	socks[config->num_connections++] = nsock;
> 	atomic_inc(&config->live_connections);
> 
> 	return 0;
> 
> put_socket:
> 	sockfd_put(sock);
> 	return err;
> }
> ```
> 
> I don't know if this is a really good thing once that until this be executed
> the user space can got a generic lock (the same generic lock of sock here)
> before nbd_reclassify_socket() call leading to the same problem.
> Thoughts? 
> 
I back to read the nbd_genl_reconnect_sock_cb(), and now I understand what you say.
YES, nbd_get_socket() also runs for sockets that are never installed.  When
nbd_genl_reconnect_sock_cb() finds no dead connection it does:
```
	sockfd_put(sock);
	kfree(args);
	return 1; 
```

So the add line inside nbd_add_socket() that I sended previous don't make
sense.

What do you think now? We will call nbd_reclassify_socket() inside
nbd_get_socket() and call this only one time? Or is a better way call the
nbd_reclassify_socket() inside nbd_genl_reconnect_sock_cb() when we have sure
that we will use the socket?

thanks,
guilherme
