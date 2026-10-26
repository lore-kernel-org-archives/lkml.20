Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031657;
	b=Q66wzTanLTWRdcOZ6RB32EN0LSu4KR6vtl255cViO+ZU2LJMSUpUF2ZH2IXXfhrLLTP5
	 atpOyUKgY3cVmBAThOzvkeWubwIOyn5H/4egV4nv+fAQ7pMduCQrWlEEljauoB3EpFcKR
	 cpcvmRRDmq76CxQ2xWjWfAfl5I6wbPQBwOB8ykVATnzmPLEl/IUB6z+cm5UXMIlRBm9Al
	 9oIzR/fgMbCloe5wGtmSmjATr1TbPQNpYzdorfpwCraf4OAIBiP/khejd/u69IYuDGs+z
	 kJ5Be9BU5ORxCeCX/GHVaW92RkTdZ9/Rboy84bo9I2y9iTfOUdW2TnMNoml6TX2XI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0VtDYauiu1wvfHVyIlEDGXJlwlrkcI4X0U37wgDZVvs=;
	b=fAthNrNgHmo2jKXqbYmAm6Hz7kgZYDDFbIiKBtKlsUMLOL29LkAs++w4oChidYE7UD7w
	 yYx8UeOyKirAq2x8fBBSV9IGAUrpPM0AobAIWtF/GQgOA1SVqBxB6BqXlqkqH+McomWRy
	 Ocvon4K6v1BoayGB/fPn6ye+9GvvWnyoC13H6MdcatVzhZosE63l+MJD1xpndLZ1uBsdE
	 LGUbeYRvF0ZKfdJV0mWdWhn6Y8plfu5m4Fgk8gExoFwbm/241eaxMPJDYoGRSH8TkI1Mp
	 XMUY3SLuKXU3SXlEkknReFow32YflhHqDUxiCPgbUAtX7RvKVHfV662Jj2l74b3TUew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HMyxt+AB;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA6606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DA6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HMyxt+AB
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so19999025e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793031655; x=1793636455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VtDYauiu1wvfHVyIlEDGXJlwlrkcI4X0U37wgDZVvs=;
        b=HMyxt+ABd/tiaLMZdlVPTkehVY6r1D4Nb+XWWhqo5OYolv9P6RReW7WjkGzBZIwcVP
         MFnWSmJypXXU3HjfAhzuO4k36eXrL3zuC3PSSqzt3H61RqR6V0vRimCGvQmNIffiGZd2
         z47bWMmKtMMPClb3C4vVMsijXO71TvuA/hbgmznn2xgab/mUViHyMyaxcBio8lSM08YK
         WLyAY/8PJXG71Eagum2uwaDJ/R5t/ai17vV4Cj8GZvamJ2BT+ne8W27HJ6Vqt5lXWCkK
         emily5MRCgvX5SqfAdHsZSQyCdhWuMHnAFxyG9sv3akjjDYEpcvXBJHwP/+rSIF6CAWP
         CIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031655; x=1793636455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VtDYauiu1wvfHVyIlEDGXJlwlrkcI4X0U37wgDZVvs=;
        b=JtIkt8uzj18Apu6ATj8GCW0DL+uxSksZLJhEc7e1kbkdHWXWW18mcTbERUJ50Fcryz
         RIpAcBO71JX9nLWu4yp0+6CfA3X714DL9XD+mcZwYRtYp9D0K4iUM9U3pFTl3PoOvrJ8
         le1KxjR8LWcJ8cSLNLAq8lyWb1sdWzXo7lK0/bocw86zWrnP2/QaT8v+eujVBdVMwsLu
         s39NJuxGqI1W9YfEHi2t2E8BuMoZp1B0nVQfzFTCAEbD4vDGdzB847/0L+nGsZp124y+
         2Sa/uu/qlMhunW7+R4+BW1mw/n/vDNzItzfHAPHwKQn6jeqw2qdCU7PxvhdquWwlO7PX
         tEzA==
X-Forwarded-Encrypted: i=1; AKwUvBz6RAiQdb+taZbD1GJJ1JS2TcINI0p6GAOnVdVQU84LWQmVYxaY690x0UJbmw+hU7VroQlOQcnoO276wmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1dO/jhjhzTw+dfeSg1B0qCOL9dxljR9tW2JCqDG0PMPnqre8/
	iSxw14OB37+/iAt694axP9xTXjwAuqicMGWwfG9xEMVuGNSl83cjNun/Y74wW5zZoCA=
X-Gm-Gg: AYBFou1c0BoKJ3dQB6N40oxhCw56lOIF6ZqapnWix3Sncoc+0w8xogTMueoPMYnOiO2
	mlxDCAZsaRSQoodEkccJiTwzcNw3+APOpTny6CX+E+40ASa2TmIBVHL/SgJ3Rjhby2Ras2pnCCW
	NdIRMtpbwsB2uJ5YW0JuAeI4QWR9HqofDCkfc3Qmr2Mj04TB50tYsusTlOc6U70N81aMMls7P09
	T043+HwkMckgRi64edHUA94iBLgwivmIvi2mK7HIgMoi/eU/4FQtnycFD8iQSoxyLKFqYVPOtgE
	DQr2aOEpaejNXw12VkKGJyyJ6YC+MnAGQpkp3bGkbx9vhBbXAQ9pysCnYTmQry6XsOwPJysPgfD
	1kQmy0ylbkonMc0Fkj6fFZyivmcqZrQ8EONjk1pGdHcXS23wXAW/n/0XOT2KPv+e4zPh/DdF9lb
	18x1HqFD052APGXgwGtLgjylz9bIkbe4+JYtYIW00hYLNNKC1TQ2ovOy6vrlZf3h8SYrBdbt+NC
	chQBdjGi9lxz69b5pBnnlkAEFU1I1nnk5RvTa514ivmztRpgLmwc5znfg==
X-Received: by 2002:a05:600c:1391:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4a35acafef9mr140688085e9.8.1793031654802;
        Mon, 26 Oct 2026 09:20:54 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a046fefsm260923415e9.5.2026.10.26.09.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:20:54 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:20:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Force console verbose when reporting lockups
Message-ID: <at995NJaF_R4fNJX@pathway.suse.cz>
References: <20261007051726.4154849-1-tzungbi@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007051726.4154849-1-tzungbi@kernel.org>

On Wed 2026-10-07 05:17:26, Tzung-Bi Shih wrote:
> When a hard or soft lockup is detected, the watchdog prints a header at
> KERN_EMERG (<0>), followed by diagnostic details (modules, registers,
> and backtraces) at KERN_WARNING/KERN_DEFAULT (<4>) and KERN_INFO (<6>).
> If console_loglevel is quiet (<= 4), the console skips those <4>/<6>
> diagnostic messages before vpanic() has a chance to call
> console_verbose().  With the buddy detector, this leaves only the
> detector CPU's panic stack on the console and nothing about the locked
> CPU:
> 
>   <0>[ 1535.991833][    C6] watchdog: Watchdog detected hard LOCKUP on cpu 7
>   <0>[ 1535.995960][    C6] Kernel panic - not syncing: Hard LOCKUP
>   <4>[ 1535.995970][    C6] CPU: 6 UID: 0 PID: 0 Comm: swapper/6 ...
>   <4>[ 1535.995997][    C6] Call trace:
>   ...
>   <4>[ 1535.996063][    C6]  watchdog_hardlockup_check+0x1e0/0x288
>   <4>[ 1535.996075][    C6]  watchdog_buddy_check_hardlockup+0xb4/0xc0
> 
> Similar to commit 168e06f7937d ("kernel/hung_task.c: force console
> verbose before panic"), call console_verbose() before printing the
> lockup report so the diagnostic output is not suppressed.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Just for record, this looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
