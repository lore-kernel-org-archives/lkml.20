Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2BF3F1055
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339975; cv=none; b=LUwQjEcsoUtnU0WoQKTVkAHGG2usbxnCF+5cIAfd6J+ctaS78dIBhEPOlhWarjnCiEWkFjGKtYVV06uOZyTA1BPWNARgKuZm2Z4FrtnqhxFvHbWZq7yD1DTlR1avxCGZ6csI3AUwZW8vQNoc8LGsAdM4+zfjE0Oailf31iBS4+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339975; c=relaxed/simple;
	bh=5qbn2z3euY+gwKPwAIKbFT7VWUAKG08ASbmovStFUVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXyFCkEOunL87oduY/5w87CagT2BejxmdoO8SPIyXqubWMxWBEZ8Jme+gcoBqN8ucuZV/9PrOkr7Qi0OXCJlCLFf9Gpod2TE88fLmhYimtw05WWFNqMpQT/dVbEqKjNqWJzkmI8gFPVVA2cgBkKLeq68RWv01QpxOIuoLLSHe9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=axPyiVWs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="axPyiVWs"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a65e66555cso1074778a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788339971; x=1788944771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GZks1PrYYqPmWGotHjaO9Bm7+vvJEF13v+yDcXInY9A=;
        b=axPyiVWsZBttVdz2tLP/j77gYD+VReQ/2htF8QIty2njf9JZc4PhqSN537vAjoMMW+
         gKfsyqmBMoS6KBc7moRdCfqyoKvErc/qPI+87zwi5zC7DNv8ev/k5WDAWfMMVycA0uEC
         jjNMbDOInN89cuxtZFG3Uh1LxFpDY0dOCQDLfHnJmIZWQl4Kidn5pBOizzIOtQAZ8Mfv
         YNFE/upzVDGA2TFZsJZmD1bq/U7vc03FnIZwgsUKFfxd4IvOBmrBo48tLe7IQSTMqO4C
         C93jAdJtqQqI/WpJHkim8cBwhDfILmJYpL1NEvZx51D748UX+TYok2mU41zo7KrKBQnB
         QtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339971; x=1788944771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZks1PrYYqPmWGotHjaO9Bm7+vvJEF13v+yDcXInY9A=;
        b=mQxbDnEaxke5ZUnkPHFCG5R/y9nFT2gRGWwL7LCg2aZjLZaPq3GDfAy1v8AfnamF5U
         AI6sYlHeNEdzimp9lmCg7IHHNEci+dNnLdYFrL4hcvXTLlsXOewCq8oOTmWxJXGtV+vK
         eSadd7BncGCJkxXHXmfWYllXai4Vrbao1qlPgZPSpgkEGUMDiHw84fdm16eJ5xrWmBAW
         ioowesU3BS/S//VJPwZt309BZCnf6qoiuCrWKzmyG9Ies3aURNWX3NJry9hkvfAYC4qS
         tJH6ZCEenTSvussO/6SsdaYZB0Hh7Yp4TyXm9Pr4C3Q9z6J1kUddhcgI7qlD/RWifLVA
         22Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxtLB90ukILAh8W/aRTxHqOxC+WNXFLDhX0mJFG5GZOVw6pBJJjTyQ/Evs0YXixe4tarRqa7nCS/BjnDug=@vger.kernel.org
X-Gm-Message-State: AFuF++ndTX9+T9l/N578qil7rWaHsDlDESYKNZ9a1MMz+q++EIDcY6xK
	qjApvWu9aklTjDpOEaKZOoFvensJzExnZLkDk8RqVDt+wgA6/w+SuTy+HIHghTsVNrs=
X-Gm-Gg: AYBFou1uO28nF4qlCZ637tS8piu6EirQOjDSvfe6rfuchSsNxSqu3rPiJkSL6ypDgCx
	hpJyJ9c3WAep3WQ2WRZziHkLgFoHOA28Lz+4QyLcZNFBAL3aS5mda4GS7NWsez4fjklI7zqYUxC
	BmNi6hJ1fa3NTC+BGn568Aa+FarywQScMRhk6VgwSA6GFCHEl3UnXXVQPWFUriqQTYgOD7wNMp3
	QT5163iFCl7M/5mNwTOSKp7CUGPehdJ17Qwu4r1Asy3M0oX7izYYvfHLjashJhDQNXTZzxgWRIV
	sOzxYVluE7B/G0Nea5Pq3dQUmoxh56KNTtNCHSACfrFfo0XR0yM/ydrXKX2ACI9UFNkIVC5gZVR
	h3aIcuDd7tZq3UmvJlDsu9EC6F9zuvmwn49EIGYah9B5BPVqdS2+IyHVLIpAkkQFLO55cfvKkb1
	xRdu3O+RELhXOMT+ZU0mNjzgr654iKAh94TJ/zS2ba/QaSganGuZFYPNSD1CS7Og==
X-Received: by 2002:a05:6402:52c2:b0:6a6:32f5:5570 with SMTP id 4fb4d7f45d1cf-6a682ac2ab7mr1953607a12.18.1788339971407;
        Wed, 02 Sep 2026 02:06:11 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm4967566f8f.2.2026.09.02.02.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:06:10 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:06:08 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v3 1/2] printk/nbcon: Flush nbcon_irq_work in
 nbcon_free()
Message-ID: <apfnAOnxzJH-y6hc@pathway.suse.cz>
References: <20260901093245.344455-1-john.ogness@linutronix.de>
 <20260901093245.344455-2-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901093245.344455-2-john.ogness@linutronix.de>

On Tue 2026-09-01 11:37:42, John Ogness wrote:
> Ensure any pending nbcon_irq_work is flushed before allowing the
> console to be recycled.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Thanks for moving the call. It looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
