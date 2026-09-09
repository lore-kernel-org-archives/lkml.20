Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D5B381EA4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935805; cv=none; b=Q74jJvaPvTp4dXK1cnXev3fI0518/XpoCoVaIU9E15MlA4aJj7NAjvb5Gj7GNl/9Ui0gH7bfsnm6B6NvbAUkw7V5VrHs8NHuVlhQT5Gu1MPnGvmUjioCJTiEx++2NUkavX4/smphDOeO3eyoooD9CXQ7dMlNLLTrGjqq1eBm2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935805; c=relaxed/simple;
	bh=sY00z5V30onLLtDgQhbdrVwQUjxmGhBs+7K7da4O+tc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=bpfQwnMREyct1H2MwdR8J3VbJB7/KhiEkXxKSrj+5XF8n+5nECj3KFrvedxMOM2ZUho79r2tYkfxI7DuvAxKxUYW4GN/c6OTRXIBIhK7Z8QirG6dRXHRroD0+J57pbrcnHVu6tlhE71MkH0l9Ra0/Ht8A26CFKDvoUXCvp7TQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so7736110eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935796; x=1789540596;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zCmscbmxkSxvsPpnPdl5tJ0oDhZsF/+axEdFvj3ZC7k=;
        b=rNLEfVYFLZnoWmLTAua3sr9YsdvdrYgeOKwJcYD/zd5xUi1eRHL9Ji9RHogFN/qfxA
         ySvn0uszEElNEeI6XX5SOKJg/A7GwlSHVJUXpB8elk97TQ3LLPWbhPbGJx0XDSs7QBwV
         QUC6gQrqQtKXksrCFuG7CSGVfL6GlSekBL3zHpxWHr93qwqOiPEiNNiYh8S6JMDGPpq2
         hCPyFxgibFG9O2uwUSnJfUOGjT0TtC8vesgf3xJHpQeQyGbJdIsyKF5jIdIkyN9KHAC4
         BVWIareeU0ctw3GAfiIXeFiAlh3LlpZ+49W6SmukozntVopF/EbV8vZ4lYbHMg5PBWNF
         0zdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHDQMFz++WcDrSDLBZqKv2LiVeR1VC66L1LNNcqR4C0/3RhsxeZeXDZxhtCkb2UNrjFjGaENqA480q2tA=@vger.kernel.org
X-Gm-Message-State: AFuF++k6v7YIesdwnwAfwJZT1F+h4EdtUsbtfoySLQskCR/Jy1j1evPN
	BVSM+kvaMrUWtPIjC8uZ5MQHBEwI8aNOkzcM0LthGI5/3aI2J48KX1+PcW1rs14RZVy5X2O79vF
	AoF98qSofqFr7zpXs8s7sN6GHg6JOmuBnOPd5njm84BEFUqqHRBvrohrs0MU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c81:b0:6b3:26b8:424 with SMTP id
 006d021491bc7-6b6fd3d69d1mr18227942eaf.26.1788935795776; Tue, 08 Sep 2026
 23:36:35 -0700 (PDT)
Date: Tue, 08 Sep 2026 23:36:35 -0700
In-Reply-To: <20260909063623.6999-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa0fe73.f81106d8.285f0a.000b.GAE@google.com>
Subject: Re: test patch
From: syzbot <syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com>
To: syedtayyabfarooq08@gmail.com
Cc: syedtayyabfarooq08@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

>
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index cdd1dfc666c4..4435cc42d1c0 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -603,6 +603,41 @@ static int gserial_wakeup_host(struct gserial *gser)
>  
>  /* TTY Driver */
>  
> +static int gs_install(struct tty_driver *driver, struct tty_struct *tty)
> +{
> +	struct gs_port *port;
> +	struct tty_port *tport;
> +	int ret;
> +
> +	mutex_lock(&ports[tty->index].lock);
> +	port = ports[tty->index].port;
> +	if (!port) {
> +		mutex_unlock(&ports[tty->index].lock);
> +		return -ENODEV;
> +	}
> +
> +	tport = tty_port_get(&port->port);
> +	mutex_unlock(&ports[tty->index].lock);
> +
> +	if (!tport)
> +		return -ENODEV;
> +
> +	ret = tty_port_install(tport, driver, tty);
> +	if (ret) {
> +		tty_port_put(tport);
> +		return ret;
> +	}
> +
> +	tty->driver_data = port;
> +
> +	return 0;
> +}
> +
> +static void gs_cleanup(struct tty_struct *tty)
> +{
> +	tty_port_put(tty->port);
> +}
> +
>  /*
>   * gs_open sets up the link between a gs_port and its associated TTY.
>   * That link is broken *only* by TTY close(), and all driver methods
> @@ -911,6 +946,8 @@ static int gs_get_icount(struct tty_struct *tty,
>  static const struct tty_operations gs_tty_ops = {
>  	.open =			gs_open,
>  	.close =		gs_close,
> +	.install =		gs_install,
> +	.cleanup =		gs_cleanup,
>  	.write =		gs_write,
>  	.put_char =		gs_put_char,
>  	.flush_chars =		gs_flush_chars,
> @@ -1203,6 +1240,18 @@ static void gs_console_exit(struct gs_port *port)
>  
>  #endif
>  
> +static void gs_port_destruct(struct tty_port *tport)
> +{
> +	struct gs_port *port = container_of(tport, struct gs_port, port);
> +
> +	kfree(port);
> +}
> +
> +static const struct tty_port_operations gs_port_ops = {
> +	.destruct = gs_port_destruct,
> +};
> +
> +
>  static int
>  gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
>  {
> @@ -1222,6 +1271,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
>  	}
>  
>  	tty_port_init(&port->port);
> +	port->port.ops = &gs_port_ops;
>  	spin_lock_init(&port->port_lock);
>  	init_waitqueue_head(&port->drain_wait);
>  	init_waitqueue_head(&port->close_wait);
> @@ -1258,8 +1308,7 @@ static void gserial_free_port(struct gs_port *port)
>  	/* wait for old opens to finish */
>  	wait_event(port->close_wait, gs_closed(port));
>  	WARN_ON(port->port_usb != NULL);
> -	tty_port_destroy(&port->port);
> -	kfree(port);
> +	tty_port_put(&port->port);
>  }
>  
>  void gserial_free_line(unsigned char port_num)
