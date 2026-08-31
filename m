Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE34511232
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188497; cv=none; b=WOlphl0OwRHXkdvLgfQFNwBoOYezF/MN8iSb4m5QiI0WFxc2LnPWLgRZK1qOMPnoJNmNvG1RPG433lhum643HM40TMCmJ66rgFL4HvsRmrZeNVg2cwUl+XNnfIjimCn1wdhTiR8NHLu5aismMZlcO329OOdYoDq2fWcSqnTAs6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188497; c=relaxed/simple;
	bh=AwUDP68RkPTKs/sWGiLsWofO7104qmzQWC4MZDd8HSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKv3RNZDTYkU1RwjVCY5ngvhxgWbpsH7UhrQBszr5v+3V9Lo0OM4joxEj6xvpNJfCRpeQDLCK5NbpHyVg0t3f0ByI8ngbe6jiFVILlvHjnKo0Q6/thUvgHja2LPHyR7juo2yhyuoKoiQGx+wbPOcfdXf/uaTcw4wNYfXFgAPXJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ALbr9/u1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ALbr9/u1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so36085735e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788188494; x=1788793294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pHOcMp9dkRo10nnmPGdV66Hz9iz0wppg/2ta0c9+nrI=;
        b=ALbr9/u1DXvp+fd5srbn4WBA3gQxqdsDjC8h8aGRvDKxHYpgcAJR8uWV7OSg8C2Yk4
         qWodtcYuE6RJ0eC6BppTl6tbpGKG75LkW9PzDsn0WW3tC14IEbDZIdW1UQ6fbQrgsQ+G
         s4et6hoGvGKM0582EoEoOy8OW5zzhB0SyfflUfxzQJ18aR/iY/2kluwqH0/DQ1HvQwD7
         qEW+LpgeARZoyJ7NWrNEQVrHAKhtU6pmqlZ98GZ6x0Fp9JwdCgLgZZb0+bozsgxZ67cj
         jrJKAF1dIhmNxHogSJafW8Z16bpY3P7u1LQ2QxuPZ3kLYBneHB0ZjXWNvK6NEPnun5HV
         4s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188494; x=1788793294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHOcMp9dkRo10nnmPGdV66Hz9iz0wppg/2ta0c9+nrI=;
        b=JzAc3hKSvsWRD0i+jnJFQFX2a4IfaV6e6gZEtENHLrhvL2N7KMHyYXwqWGEXo0Oegp
         i8neC/QATTmx1ioaDfmyFOf2pKZIFQgDuvOzRi9NNCuXtjvn/ogzAPgLmLW3zAk5llih
         Lz92tEnB12qDhWjqMjvF1MfEIwBjvfdtCULmi+bqAc40LQmTZq6IJ49w0EJ7zmsKZmaE
         dNiOHsvt1P4WLvRbn+WDAcvbPQslLFxwbdLlZntIaaOWIru+rAsAs5z7fio3BIvAqun3
         37MB7gzhvCs8icrw8XhpQwN5g/vWcD+jwIepIR/qirB3uFxVG4VwyU5ISoaz7QDTaikp
         y4Lw==
X-Forwarded-Encrypted: i=1; AHgh+RqOT+Q9LykbSH77hvQ4Q7WmrmDna1HYmE2g6qhXwV18To/VwefMs5cWmQhozFIC/RFd1qyhbVfmbZEkp+M=@vger.kernel.org
X-Gm-Message-State: AFuF++n5r1vg9QkCWdzlRcu3CHJc3GtdqIJ6mmRVVA5/TUd7xIVrMGJV
	HpOQ1OAiWfWHIQjzkdSvorUbmZCdPYmlF9Lb86EKJ6Y0dIvod7BzBsq13r/R7p26pQaCxeK4DRj
	zi4IJoAs=
X-Gm-Gg: AR+sD12Kvjjw8EEcgbguMkHU9EWlKYalUw6rpnqH1lI8HouwdlEGJDJFoHD0oSdw/zJ
	EtMhhi8qw2UiOj5HlvbVqdBTe5FbV4CLdWc8gARxJS3LBvfXcq7pW3rN8xoMm53z+aKdUb3CDS2
	uRC1sdnAVjCsUj/S2fXtPKks2/+Hft0kzlg1TSzqEvji+IB5xBW41/lgQEzairKF7qU8qQbLEFJ
	GKeEeD4y6FAZU119JwyXAZ1WHC1pKtHiPyFPEDGb+APpo+bjQ6usZV/kEBsLVyUDvOkfAfCuPeQ
	Osovaj/OecoQgPukLU92vjJ49beqPfMfdRwzMbe0Ks9bwPnkMWIdRbQ50YOvyZiclo9WE98neS0
	Cz/Sl9hHVnkUaBhzAfgy6NhJOISV0GoJJyc+BsQrxDHPO1f08oCPW8VCW8pF00hngjEYgXClS05
	OUL75FYEmvV5Gcc9ODwHksa6e/QXBvi6+M8VKAa6+cqOl7nPArOgG3LHpeiU1Lfw==
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr411669485e9.1.1788188494345;
        Mon, 31 Aug 2026 08:01:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2e9d9fcsm219896405e9.1.2026.08.31.08.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:01:33 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:01:31 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v2 1/2] printk/nbcon: Flush nbcon_irq_work in
 nbcon_free()
Message-ID: <apWXS74ckfSIrH5m@pathway.suse.cz>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
 <20260828140218.232439-2-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828140218.232439-2-john.ogness@linutronix.de>

On Fri 2026-08-28 16:08:08, John Ogness wrote:
> Ensure any pending nbcon_irq_work is flushed before allowing the
> console to be recycled.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  kernel/printk/nbcon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index a5921a84a80ed..218b1922a58de 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1849,6 +1849,8 @@ void nbcon_free(struct console *con)
>  			printk_kthreads_running = false;
>  	}
>  
> +	irq_work_sync(&con->irq_work);

The irq_work work tries to wake up the printk kthread which
has been destroyed above. 

IMHO, we should move this up above

	if (printk_kthreads_running) {
		nbcon_kthread_stop(con);

Note that nbcon_free() is called when @con is not longer in
the console_list and after synchronize_srcu(). So that nobody
should queue this irq_work anymore.

Best Regards,
Petr

> +
>  	nbcon_state_set(con, &state);
>  
>  	/* Boot consoles share global printk buffers. */
> -- 
> 2.47.3
