Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F82A4D0A02
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350897; cv=none; b=A1n3gFjEjojAWmxCT0A4h6HMZXA/11u13ENNvbe0SbtepcRXMStO2PNUMpxyCQoRzdJ8DfG/OVLFSj6Xkd087llzdryIhTGymREpb5MfcDyZBzrv14lIVsedMylcBWholEfYHwBYkXjcZ6g39IJQ96CMdSCYXGkvAEfp1wT1+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350897; c=relaxed/simple;
	bh=3R6CO7ae6XgFsFygK7xExQ3Bpgoz6R34BruMnh6urg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa5wTo6E05KzmNaWZoBiiaZ4gyPzWGq8AGCVoAFuvK+vO+OEQTeiaxO3H9XtGKWY2DDJZlLu87khXlCoKil7H4sDiYgOQZgjeHZAEHbPlDhKe2Or8bA3C3GSGpwG42aNo17RriElBLhNCYuMFWRYlsyN6LD1nr1yLdgW1ToqSxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jm4JXdeX; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jm4JXdeX"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so589442f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790350889; x=1790955689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+5FVubCF+Zu5SZLI3VcWmoWT2YqUlyln8LNS2KK86o=;
        b=Jm4JXdeXXacQBmCIref6ErV+1cb0X8oc12UIr5d6SWYaFHyHLBw/JwVhexrU9pXKi7
         Wwy+lC5VN4l5MNM0RSXKvetGSrSm/Me+IZRKBkxG27VywRWyhoQSv9jEmYFF6puIVMiy
         6/IQdG/fvjOK2GhPNzYIyI8dUcJIo+6E7tXmbgdaHjeMpAlYdF9mSI5QVT5GW2k3zJDC
         7TriBu4pFwCjpAWyEsyniVgjk83/05ErIG8RYk1rpu8fZs/6SwQ0gR+PCMZlBlb8Axlx
         rJ36pnxXT+IRj3pFOsNMsgSXC/XmkrzYhZ7dKRQdvZ3tohH2D7HS235q2rAIJmk9HKug
         X6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350889; x=1790955689;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+5FVubCF+Zu5SZLI3VcWmoWT2YqUlyln8LNS2KK86o=;
        b=g1+MVFYhQELPRp6JzdSArLzaWGyT5tRo1aqe5qnDpAziO0jZ2RkzYighAkGT3zPKvF
         WYnj7f/cX5drHn5yvuEmBq41oT+5heZGy12wW82dzW4qJg3sT2rZVH3RglMBta5OZPa7
         50fjv7Q3a/gR7MNSpcHq/ZttV/bjHCMwIXed5R9WbJsLgrrTNn8KxbGfjk7J85Qa+GlK
         2YbuxutrVAWQw3zWKU4MsXK2VjsOdMumIo4TT3PIFZWlZAXqy3VWsM2D4FFWVY0fDaa4
         0d1zuwNPg3WWiwrVoRA8UhuQUMbdsRaEsCgjcDTw9NdaKTI3KEC0Ep3RB/VfeYHpezLv
         f9IA==
X-Forwarded-Encrypted: i=1; AKwUvBwLFwSXHGx4t8mq2OW0m1qHd6wzRFbywrqcdJS6Giak0impTnJbyOySHqJccbsuMIbo0BLpFb2Jpec+eFU=@vger.kernel.org
X-Gm-Message-State: AFuF++mEKxGoCyYxjqwBnxO/yybPQkbfwPTscJ1m0kvWrEAGIyPQLinM
	Q9nOdMLQx5QMPn+Yp8ZcmBKSqocwliikkeANxbyQfuIr8vuOiGEfQmFCNo0wfO58LEs=
X-Gm-Gg: AYBFou0q2GRrhPErIyadCCzEX7DklIMNnMGCa/M5YXii7CfIkIAqp5OUjtwRymzO9dt
	YUOM2bJH7jU5mruyIvFk1ffoPPjWa0ncQScZFdgkqIlh1In8Vz1Nwd8E+CxPDZpkKJdFMvxv2dE
	x7dfCpzaSTGNW7eBUTcH7Czg4UBA53HITVYwN9lbujzJ8q41mOY9cKtBhXxJItcetxPuesW86iW
	AOHru1tAKsEWve0WQe6BynkAGlXmfxHQvVClmZvbLIWslmJrFYDcS9sZJClRQGEe+VJDzbEEEFx
	daWv8ctwgzYXz4aI4S3CrG+/lLgmsyQKPs3yReHJq6Pm23vJEBZEtRf9Vqo+brdDzEjk/Spc+fd
	WJGIxs30V66wdpm9wqBR1UOdTt8U5UWEytbWxUTRHPXK89TaWVf9ngytLdLaU+uODxJq0ro6FSo
	8CQuNwBweQ+m4KxCaz6mLbZYhVFEWpmGOGqmDXjEsnQ1Y6uSxoSPXDYLkE98gL8YaVv5IWs1zd
X-Received: by 2002:a05:6000:1888:b0:487:2777:6354 with SMTP id ffacd0b85a97d-488717166dfmr14312566f8f.48.1790350888733;
        Fri, 25 Sep 2026 08:41:28 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a2acb4dsm8108936f8f.0.2026.09.25.08.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:41:28 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:41:26 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Fushuai Wang <wangfushuai@baidu.com>, Kees Cook <kees@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>, linux-serial@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] braille: nbcon: Allow using a serial driver
 converted to nbcon API as a Braille console
Message-ID: <araWJhKdVZnfCQcg@pathway.suse.cz>
References: <20260922072558.98854-1-pmladek@suse.com>
 <87ik3tiim7.fsf@jogness.linutronix.de>
 <araAvkIB5XatHPNk@pathway.suse.cz>
 <87a4p5iejg.fsf@jogness.linutronix.de>
 <araJ-EBntyqOGPkT@pathway.suse.cz>
 <877bk9id6f.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bk9id6f.fsf@jogness.linutronix.de>

On Fri 2026-09-25 17:11:44, John Ogness wrote:
> On 2026-09-25, Petr Mladek <pmladek@suse.com> wrote:
> >> > This shows that braille_write() is called form printk() even when
> >> > braille_co is not in console_list. It is called via vt_console_print()
> >> > because the graphical console driver (ttyX) is registered.
> >> 
> >> But isn't that a bug? I thought Braille consoles were not supposed to be
> >> handled by printk(). Even in this new series you added that exact
> >> comment.
> >
> > I believe that it is not a bug. I understand it the way that the
> > Braille device should show everything that is shown on the virtual
> > terminal. It should show the printk() messages when they are
> > printed there by the related console driver.
> >
> > It is just that printk() is only one source of messages shown
> > on the terminal. The vt code maintains what is displayed.
> 
> But how do you register "the terminal" so that printk messages appear
> there?

I used on the command line:

	console=brl,ttyS0,115200 console=tty0

The serial console driver is not in console_list. But it shows
all printk() messages because tty0 is in console_list and
the messages are shown there.

Best Regards,
Petr
