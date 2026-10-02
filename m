Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B71425895
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926065; cv=none; b=aeVzUb4N1tLus3bkPxeyUHFFGmu90KM1YzSM7OGo2AHlhB8IHVD2E18Raf2BHRATjWQC2mJppv251NphO5og9OoST4B+VeRSuv2d76cXnvA0BzeHCjb5UbP17dx25gbTk6T+SjbcdHUuHoL0tO0XF9qyrmVmwCPJ1Oqf0KMDZI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926065; c=relaxed/simple;
	bh=vFn9KjKsMYiAr1ZmjI3CN9vbnCY4NFPwuUVqfyJJ0J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFL0UjTP3clHVSt6xjWtCvLFb3MAe4+D5Yfw6wtceq9CkXk90pBpmQAmCkJ4rF6v7+XF5w2vRnRjbO6n4P33pcgTQaZbukrVGPdWO1kRfpKAkvhczlUTPq9Cr0NludRbI0GxGTeb1/vSwu3cFd4nPHD7LCThyoPyhUhbLsD/UAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eXT1IPgm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eXT1IPgm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so4252595e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790926059; x=1791530859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71zvz099KWIJK9SNeemZUNmD6UFsAC9SZckopHPDOTA=;
        b=eXT1IPgm3ZquEJPCD41j6+rHlnnVP+LNwo5JRIxszOcDKyjmZWTAz46lsPsO6JcGOw
         yZy8GkFxMlrpjJ2v3SqaX5vrO3uX+/IOQ3H3b2pQ2jmcHkenF4/QcAA+B5UtqyWD6Xdg
         +AEVVgAsc+Z7pnUudEg+2M2En+ZVZAtwnWXNWGfwoTr3QDV2WRgzfPnSzzUGWEIFrA4o
         mLYsiAivANr01DVTrCnOf60op5Kx88i43v6X8CiMWaCDtvIb1ak6eTxOGg9bhwjudM5t
         1jPaPZjvQeAydEun+6IS3J9mjkJc/wnKRhK4GwgPHWapcoTRAnr0lXiR4eylELIIq+bM
         3jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926059; x=1791530859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71zvz099KWIJK9SNeemZUNmD6UFsAC9SZckopHPDOTA=;
        b=VL8iFTdsTMKOFj/2cU6X2cMTVnZJ4ctTr9RF2OrLs8YWgSxqYj0jXMzMPB0aipKQsl
         grxLmjK5c7p5DP4ZG5MSYSfn9lEmZaKs6MiAuQvQdCPxpEnKrwSQJVTIGB2YynbmMKWQ
         xdvM9mCrw5UbOiiuy6Xb1G107eSl5YcXo0pNyYo1H2+Chwp0YzTOXMXeAspowm8SFYiE
         iBNeqqKJgV1NYxyrbDwQuVSONozzG96qnADH6Yw33eao7oj2BG7ROOFIaeB7xMRwns/g
         fHUoLQjVuYzH88yQwzIs7QYgJ86UlO3tFRUZMlBJS+d1nNN3+RXcCK3KiM7WUjn3TRur
         RdzA==
X-Forwarded-Encrypted: i=1; AKwUvBw2oTsB2nFjMOCKPdc0EoP5E782Jq89qJ9bbKAJqWgIhWpwGyJKHqrbh2aHiLPMp2waipSdjaFS8SkCTK8=@vger.kernel.org
X-Gm-Message-State: AFuF++k+jO5HGfDIbvhLj6PSXF4j+iUvHBDLWkDoesnrRh+vg3R5Nwvy
	Rlq/YkSJ0TVWvUimAVffmIYerD7G0+BMykvU6bSjYVkDD8fvck2Mgt5d1FkOk0u3s+s=
X-Gm-Gg: AYBFou3vpeMarz254L+jE4Iu+X71I95dITVl00y1Jr9+SDG9AwT4z+QQ9ndkwH5jjkg
	wEJblcoyug+LVqmlq0NZxttTDbUnaT9/A9+2uCnuoXZUrBEa43mdm4vp1netLQT7R0Wbrb1rqh0
	Cn0yHifcYiD4/fyPYkJfTOkAoDC921gI1nJrKI3MnhVvAf4sg3MfBwh9jlADYiADVKsWiY+dFsA
	TfPVoOQD0XJpk3wjEERgwuJmEgGpvGhuQtT59gd6n0q4sNUFa4dYsEqtstusrTTvXURmF3emkoy
	/rQ7NcbAKFnJuW0w5oe3ZV4xXmP6ZeV8TSU/d5D13T163z9OrpK42O2Bk8nIXaBEMflYVItqi6f
	XVE7tokvAkQBVbmZIkcHQK2pvWdyDVJCmwAQbuwsrqFxvrHBiMtdEQfDP6L0RlzaJKGAXGOm5J8
	vbNkyXEBVqMW69l4tEGzGVWJf3JiAdzdbgRx3j7OxUhP6RIieRCrhI31lKh+/9GbCe2e2NsDAX
X-Received: by 2002:a05:600c:4ec6:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-4a02756637cmr33367355e9.9.1790926059441;
        Fri, 02 Oct 2026 00:27:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm19060475e9.2.2026.10.02.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:27:39 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:27:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: Imre Kaloz <kaloz@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] MIPS: SGI-IP27: print the NMI dump on an nbcon console
Message-ID: <ar9c6LwwwRbKW4fp@pathway.suse.cz>
References: <20261001191938.3256-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001191938.3256-1-kaloz@kernel.org>

On Thu 2026-10-01 21:19:38, Imre Kaloz wrote:
> Since the 8250 console became nbcon, printk() in nmi_dump() only queues
> records for a printer thread that never runs, as no CPU leaves the NMI
> handler. Print from an emergency section and flush pending records
> before the hub reset.
> 
> Fixes: d3539347022a ("serial: 8250: Switch to nbcon console, take 2")
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I assume that it would go via mips or drivers tree.
Please, let me know if you would prefer to push it via printk tree.

Best Regards,
Petr
