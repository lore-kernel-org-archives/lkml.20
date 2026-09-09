Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E26563FCF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965700; cv=none; b=D24igm5XcEsozEODDvRnYg0nI85+0mR5wfLZnEfWcQ9bpQ6eLGmPlwyEXjCHKkBtgszyMjaMlJdaXzeooAPOFjerJKljHnvSnBsG+7Y1BPpuTmsRdANHLAPOsvGg2BMha9Jer0LAx7CNJxTPtVTeFx9mquqUTmZ97NpxRxDZ3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965700; c=relaxed/simple;
	bh=3mrzF4PFQcJ4DbH3RGaSc+zm2PljjP5W+lnaM84CL3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKe+zobqGTyZjN3SnqQTZoP1NMrFVHgL+lrweqstCoZMXEF3v8fBRWrYsZgUx0k1HXXeNJV7pICGGLvQlNvHmMG8LSPgpc4rYBE0FPTmutrXsCQG/zRUKVGV+oDvHs/ZLKnaGJY8QUCQftm0lxDKsND6uK6Xtof96dGAr/Waah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IffCLY9U; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IffCLY9U"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so1025916f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965696; x=1789570496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEnAlwwtVf98S0MQnKDx/a7P5qnwKuSWE+q0EOlFqn8=;
        b=IffCLY9U20m06r8jq41Wip3wbMxiCRO5u98+gwJ4IShm4wkkg7X/pL8ySww6J4XebT
         8G83o+T8HV7UQxDY3AILmU5PPSPuO0534vpsVpgml81WxUkg+jSWdlsrkZC1XojQfCR9
         wPEjfOUTpu0aWTpyHsP2JLI4iJJRVFv2sABsgKZDRr9k7CZCff9jMvjKbbYGvq36IDFe
         m7IyRHupa9IRPB9ER/5GcA3V13z7+3yeRCUbOWz3N6E2aXBB+QFxpxYsIAmSR8V60/bn
         NLxgbMrD38xmDezTXGpi3zHNw6RU9YnQGWCE6LS1nhtK5eZf2geTo1QVmBir/zZ28I2y
         AQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965696; x=1789570496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEnAlwwtVf98S0MQnKDx/a7P5qnwKuSWE+q0EOlFqn8=;
        b=az5cQVduuKiwbfcAu5ex4EW1NSVsRJ38Uqa2HNOTXC5sTSyiYc0yKErHuChPSxqfT/
         J+y7J9N/faznPjO2IgcHnq9ePb5bDVosXAh0B8vRYQrijqd0sfwZAhmOegDBic2mmc4q
         XOK9FQ43CtOd2M96Rb8aC2GKxLXwkzRjaoJyX2o01+/zmNvClJndqKnoE2jdaHwMAeBS
         pFmNbPcTKen1u74Imz80BNR8gFVdbUPjlfteFDeZoaWl74n+p+k8DzpPmCqyxOwJ/spL
         nGWmaIMW9/58axA9FdSMqPkqj07S89K1H9tenLuSWmBABr3aP17GI0I91/u4Lgq7C1lj
         5yDw==
X-Forwarded-Encrypted: i=1; AKwUvBwacBtH1166GbhIgyfHrOce/Y4jiGWwUVdazzZUBPfUfrliocu4E7d8rjWUx6Kr7yjYTJ+MVyHA4X0pzII=@vger.kernel.org
X-Gm-Message-State: AFuF++nN6+Ahte0T+HQ5puTN/OIyOfiBASaU2AJRebXl8BUyyyH/kNzF
	ukpJFcCR09Ch+/Dq5v6WjJ2Cte03vnNdbfwlGGsznzgZuLbY8YlgQJp0
X-Gm-Gg: AYBFou0Bdp/zz2JVPm77RHcR5O10O4/ek5S60v8eJW7UvNID+jyAsV1HzypczSCBptD
	7KQq3xlfuPde0+hTq+xezgrBtsgvYuLaticgRy9VgzJ/G52zlDc/bGxBsmIQTcFpddNifC+qHMh
	jvQCobXQKbgfiji+xwkMb9tGibCJNOljZofA5EW+HsAbAFKkdSqlTPdacQSs473SS0Tcj9JUaoA
	uLYHUO6I/Hwandp0w7abLrKWz9mpYLxVVl6gomb/58lE2GKRF15L+iMafnhjKRkbru5vLd07POa
	s5hKmup7q62y2lUy+663Ujqp8lNz0tlAJ3AbSnSRDyOXEcxr4sT1x+YANLVNLEfnzU7yeDQuOSA
	1ohTbePEoCJNfnc45zEATGN/iblNPTPhIR1BguYl2sxNANvmsV6tR3z+mGblZKh6jAUWnLBZg7S
	nW+5CFv86rYmIwF+Sz0qW0cEOioKxEqJ0mTEviT2t+x0Fbl7KihydCRQ3KM6EguelAUJjIjrvji
	arKvOg=
X-Received: by 2002:a05:600c:a01:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49d1916215amr117005945e9.8.1788965695566;
        Wed, 09 Sep 2026 07:54:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm384918195e9.13.2026.09.09.07.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:54:54 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:54:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Breno Rodrigues Alves <breno3011alves@gmail.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v5] Kconfig: fix typos in core makefiles and purge
 defective DVB debug (v5)
Message-ID: <aqFzOFa3ADXIBo3G@stanley.mountain>
References: <20260905003005.118245-1-breno3011alves@gmail.com>
 <22707a1f-970b-4309-905d-13ac794c51fa@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22707a1f-970b-4309-905d-13ac794c51fa@suse.de>

On Mon, Sep 07, 2026 at 08:59:28AM +0200, Thomas Zimmermann wrote:
> Please stop spamming this list with revisions.
> 

Generally, the rule is wait a day between resends.  Otherwise it
becomes pair programming and no one wants that.

regards,
dan carpenter

