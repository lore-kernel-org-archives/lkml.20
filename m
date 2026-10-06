Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B0B3A9870
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269968; cv=none; b=NcEjCpizAbR9YvRRh+giDrxLYEwUFLR6MnmTydg39KVCQIJhLkH8ty6wVYMas0yFgnOYMCMMCTkPEWR+QOVp8OluXmZJQaNeZgOE10dQk5Gy4DuPKlxF+++HtZvKTER9hCbCeJe2N1XLjsIvDsJPm86tTURqWIWPI8xLwNM1psw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269968; c=relaxed/simple;
	bh=undAifgYGgULG4pVNOZA/CKdRjjcTViw+ZH5/Gx3pw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nADNJedstNcZArw5ts5GOIrk1b3PREtxDMfoeydoWDQ1Ayv0lQvNMbAHX9c06SWvVPYUpgeYF/2fwTOfb9swKb5dZ3YRTSg4iOA2x3QzxBtxksL5rJsWR3m0MBl7Ggqi/X6zSxKOY0tJmOXo4dB9ySNqEF5a/iBIlNYVvf/BxuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cKfCTNgm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cKfCTNgm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso228151f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791269965; x=1791874765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBDeLfdBtAqpUIimq95gdzG8S49Dud5QUHa1eILIbX8=;
        b=cKfCTNgm/k/12YrWCAy1lR53CoN8yVrRYqL5VrJQKEm+DFBpDCiT0i+YBVln9v3u6o
         7HDtpXlvU7ENuYljoJRnKmiJC/kHqzS/tKKY522cFeWTeZwiI1LerEV/v/g5dH33R6Oy
         w2jRAcTPtEW/oXu594UxTiMa9VdK6ckZLR+2ECKKqshX+iM88r7ToBLzbNXiefR6yTIo
         bLeMnV6n5LCiPm2Z/MfiTd1EctVDtwDSPsYu9VNARF2AX3mh7y99n5qUEzErhp4WZJwH
         p8fbnelwc35THTvZGfJjecipoUv6B/cedipWjoYJxKLy15zuuuC4tw8gY1lkN+SXfc0j
         7CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269965; x=1791874765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBDeLfdBtAqpUIimq95gdzG8S49Dud5QUHa1eILIbX8=;
        b=da7sxKuac9zjrGd6qYzn1Bsmcv25hO3XSLpIwUOQ/8BF3LmCW8dO/FMaSW8kcbqGTc
         4LikLZw6xOU47TA/0YyEMuuFm63IHTegTWHEZA9VcQGE1q70yNr8U+hEyd2xrpOAItBl
         kHY0KOx1NBYtgS4eXxPQhbnAl7SdH7vAyKrZ9cLMFhOJZI+H7+KuVt6Lux0mphVF6Nc1
         DfLrbPjgkiJqd3M/s0AJ179cQeWfKjHBpWyLfaKvnLbrvm9y9gHclHzgmjxq3NrJlzlq
         CpDim37phq9XeylIlO66R2g0C1d2sNpYjd55Io8/NJpFu0ZNidE7irztULiyURMw9RG+
         kMSA==
X-Forwarded-Encrypted: i=1; AKwUvBwAZzLRzZY6U1QaCUk5odBAzLnDVPPMWc+O7nXXRe0QWOHTkn2JjZwWs1vK/ddLhxzAGDxp7i9mhTbmXac=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ//W5g7Pus0J6x9dVkdM3hjxRGVSgvmm0YQIxRqp+E8z+yqeEU
	QhuZ/BmFcPqBOD0Wm5IZfT5WUqQGXIOWSnqV8dpt3cQPFqh/P6owlIS3Yi03S55lMJM=
X-Gm-Gg: AYBFou2e8CSZJREMWEbGnjxHFvwI6QRM+QaXYv+wvM29kmvcgmk0GQW6Wr7YnkANJvl
	GY9dZZwuxm9Inyq+r3ibIDnshXj/f6qc15DHaCII30I1/U5UKPohvFKQcP8uwzLPtj2TRVS4oJk
	98ZtVf+ATkXuk0XIKDXM+HmSQdM0AY0Kg0gus8bQZv+FbMJKCqwoPQo63OYDLL01RXh3p384VMu
	oREV6U1kFvFnJD8WWkZ0Zmqp/+2n/lvOHkr7pw2WWiLZj/l2YYyDezhOhZf//Y6i/nx0EUeGi8F
	3L7h2A2I+9kSbDBd06m0ocy3+V2nlT2T9p7h2MYc0ywkPxcLu8YLpvmfpm89g7eICb197aoH9Yf
	/fy2kefigeMmqFbV9+LNfRwl02IWvaMIB26pxp2g0FXnoytHefsj7sXTyQQoStZPFldL8bf52L4
	ut+5Q/bBIImpaUxPq9IpQ3PB2VrLiD+A6MG4vfO2zWV/KygHv7ld1+VmpfIEKOFkdZTMh3YGWAy
	aYWwVwQsS0=
X-Received: by 2002:a05:6000:4541:b0:48c:58b9:f17c with SMTP id ffacd0b85a97d-48c688b826bmr2199032f8f.12.1791269964776;
        Mon, 05 Oct 2026 23:59:24 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c69afe66bsm2881119f8f.30.2026.10.05.23.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:59:24 -0700 (PDT)
Date: Tue, 6 Oct 2026 08:59:22 +0200
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] printk for 7.3-rc3
Message-ID: <asScSu72XrLswqV8@pathway.suse.cz>
References: <asSb5id17XfYBTyH@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asSb5id17XfYBTyH@pathway.suse.cz>

Hi,

it is obviously for 7.3-rc7 ;-)

Best Regards,
Petr

On Tue 2026-10-06 08:57:44, Petr Mladek wrote:
> Hi Linus,
> 
> please pull one fix from
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-rc7
> 
> ================================================================
> 
> - Allow using Braille console with a serial console driver converted
>   to NBCON API.
> 
> ================================================================
> 
> Note that Braille console is not a classic printk console. It uses
> the printk code for registration and the printk callbacks for emitting
> messages. But it is not added into console_list. Instead, it is wired
> into the VT code and shows the content displayed on the terminal.
> 
> The current solution is a kind of hack. John has started working
> on converting the Braille console driver to use the serdev API
> so that we do not have to deal with NBCON API in the VT context
> which is historically under console_lock...
> 
> We would like to get this temporary solution into 7.3 so that
> the Braille console does not stop working with the newly converted
> uart 8250 serial console driver.
> 
> ----------------------------------------------------------------
> Petr Mladek (1):
>       braille: nbcon: Allow to use a serial console with NBCON API as Braille console
> 
>  drivers/accessibility/braille/braille_console.c | 57 +++++++++++++++++-
>  drivers/tty/serial/8250/8250_port.c             |  5 +-
>  drivers/tty/serial/amba-pl011.c                 |  2 +-
>  drivers/tty/serial/imx.c                        |  2 +-
>  drivers/tty/serial/sifive.c                     |  2 +-
>  include/linux/console.h                         | 15 +++++
>  kernel/printk/nbcon.c                           | 79 +++++++++++++++++++++++++
>  7 files changed, 156 insertions(+), 6 deletions(-)
