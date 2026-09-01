Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB82B479863
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257645; cv=none; b=ImXueOgaAl9JaQLidsBZtqxTkLk7GQ5MKQCLz1Lx7MtuGGeBhRONDsDUVsHAzTfLKynWEe5nJk+WRCDdwcGiPdxiWT3HmM++I5/0XiATSfF9Jda+urNVeqa1EvkQJx7mcOeZiQgJVjbWjBsNxE1pfeiei/hGWBjcAb2H75M3ogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257645; c=relaxed/simple;
	bh=uhpK4AxyjI+tVbZj2X57Y2+1cx1k6678Tro/8VdFTh0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbTE3EDmVV6w5N5wJ9RDwUeHps0mcPPILAUbUwwccqV/l4ViEpudKijuV5EWN2LFuf6U2YDjZiLYzQZH+kBwiERIrAqV2jItutmbKQ9ltQsacAiKJNGrNxr/hPsfiJFkFDe6f8E2KTQ6gNM63A5rkt9INgJkxCkCbeM22mw+MMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVyW6VH2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVyW6VH2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so5275029a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788257644; x=1788862444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jgSrADsGx66Jfo1T1VlDwGXCMp2/+MfM6ZbXGzEQa8U=;
        b=pVyW6VH2ypxMyaXvsEky0VActZAr8eAK94ArkGzN+yFyQc+s2ufYZAh79mjkRTrhWK
         CYv0Jz6PPVInMXo9JRFJgLKUkptPsdeKJINI/y/U9HTp2d39PaqeUUXc83BgDTBCO6IQ
         Hqu+GXwWJc1OtLLkUHXOIa0H3DA4nzK7yn9SuM3yVWwjjgY4Sl9TwkQYzTh1+bZ8FzGz
         8rR3baKcKRWN8KVqwEPqWDWOA1nh6bTqOxU2YKnFlzSaUv5gqh+FUW2vzzbwYTVKON8g
         jpF1yTUo5dKxzFiNTa1B170QrmgclLhZHjTM1Mcy1iGKyak4RCKalnVIMvYmjCz2OyuZ
         wbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257644; x=1788862444;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgSrADsGx66Jfo1T1VlDwGXCMp2/+MfM6ZbXGzEQa8U=;
        b=axTlnKs3CY8fXQCRRovcaPqOWq0rhszmp1XpNjlrUffR3OI9BCH3F+RY/xbHr0W8U5
         sMEEvHW8Xk6I5JsZgE1strLNlyyESWcD1A/NdiowOZaA5FzHqPuU9Z2l8nmiDYKmt7sc
         ovo3IkaQ1GetNvruyRo009drIWaB96GmRTA6Y06vmpIB2sR+XgNHFu19oVxGPi2SStwn
         nB+j1QCmVoLBLmhhwYdQf4WNxsNua0sw57Pvgrrk9GXi42ALRcaWrGcUj8S0G6CJx8es
         HXMADZRtdFF2rNiFbJ00quQf2cSnIQx48SkCk6BePRnnWG2HWcN/J7LiOQtQu8YEX3Wj
         FONg==
X-Forwarded-Encrypted: i=1; AKwUvBwWVFwYK5SXH6tZxhiuOplWo9Hg0T6XMJxWFEwBkYqKQypD2P7zPOA7BMWunbXJE4h7bd+BAb7dRiNr0W4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6+1yGqdT6FqVoBUFTw/OwHCfYSUYYTHNUTuxe4WyKBCgIS0oK
	qmmfZvF7gvvAxxIEuUMMaP6LaHA2cpOo9umU+xjlahFA6Mtx+OkOr0bYw0yDb05Usos=
X-Gm-Gg: AYBFou0C9BmzVCkC7z9eA0PcnT8ZUjleYdR5xv6b8KpSre4l/Ru4XKJYBHhutqzCcJ2
	RhDKxLcI5Q7SLw1lmM0d9tXDd91LyDI/jkl+TgMOlc9jaHoNzfllZ37TIToWypgClJo5qMGE/p3
	sV0AkTJLJ2JEjctOgFJspf0AfL4GC9oyYZPK+RQJgni5QLPXF63dfC4ZcYabhiiOhEb9hMqh0p7
	F/bp0/iKK7C1S0WwPhaWyTNFVaYdtqVZ4Yvzpo5XVw3bFBCGkAQGpKn61iWCz6AIQRC9sx3EQJF
	d/xMlpEEPpWyT/L7GATlNsi1ulQtOqgkqKyZvEr+Pymr+/LZH6Pd7PscYWKBTekQxU0GWS0JzC5
	FYTSMs32ycm6fbr5W9rDoRYLq3aSerw7VzYizEH1TXJvmVu7XHHlzmb7V3fTegFt38hGjFKPEce
	bcX4DwTQVIYJgEi5xmGE+xouDlw9ybjz7CgA/tHLhWOrzgz9CV8kFdxZAnd3qDtfXSALiupGsKf
	We9kJMG5yfEOiuEKd5wWv7UrDAXQbk+CWjVgTFjiphkCp/4X1o=
X-Received: by 2002:a17:90b:1a85:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39907f04d76mr8015628a91.24.1788257643830;
        Tue, 01 Sep 2026 03:14:03 -0700 (PDT)
Received: from nxpwireless-Inspiron-14-Plus-7440 (61-228-209-44.dynamic-ip.hinet.net. [61.228.209.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4a1732sm5118110a91.7.2026.09.01.03.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:14:03 -0700 (PDT)
From: Jeff Chen <chunfan.chen@gmail.com>
X-Google-Original-From: Jeff Chen <jeff.chen_1@nxp.com>
Date: Tue, 1 Sep 2026 18:13:57 +0800
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 1/3] wifi: nxpwifi: wait for the wakeup
 timer before the adapter is freed
Message-ID: <apalZbUytbmsyiO1@nxpwireless-Inspiron-14-Plus-7440>
References: <20260813082315.1390321-1-lilinmao@kylinos.cn>
 <20260813082315.1390321-2-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813082315.1390321-2-lilinmao@kylinos.cn>

On Thu, Aug 13, 2026 at 04:23:13 PM +0800, Linmao Li wrote:
> nxpwifi_adapter_cleanup() stops adapter->wakeup_timer with
> timer_delete(), which does not wait for a running callback.  The
> callback goes on using the adapter: wakeup_timer_fn() sets
> adapter->hw_status, walks the command queues through
> nxpwifi_cancel_all_pending_cmd() and calls adapter->if_ops.card_reset().
> Both paths that reach nxpwifi_adapter_cleanup() free the adapter right
> afterwards, through nxpwifi_free_adapter() in nxpwifi_remove_card() and
> in the nxpwifi_add_card() error unwind.
> 
> Use timer_delete_sync() so the callback has finished before the adapter
> is released.
> 

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
