Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2834EF0D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946130; cv=none; b=h0FDTB9w7Browdr2vuvo6kbBDjqjmat1DVXViABPU+TBpkZ8NKZ1EMsCN8u7ga+6a6WTbtXsU/CyEP6QnpbQkg1ImwxsD1uE/vjt2QErGYvZX6qGWO8wOy96O8/qNLTtySGzWJO8juQmeFRr2x6Vm6+P2ejpR+63imR1aKtPW3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946130; c=relaxed/simple;
	bh=f0+mYblwrfU8rfI9m6Dz8RI6J+2RxOgfwTbFNFUl0Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxgZVhogEp1qsSvE6qf82F8HK5DTbQij3aX7f3xbj/EbpQ13Ax7jZyxFdQLwWiXckpNFGcTvl6pqIU3y9/xvCkMFCPB2z/pfePznDoSWKCo502eDsAOSDLV6fis9xclY/yWwnlOrgFbvvPWQE9aU8V+UeVTXYTHjkfxWI25voyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T/+TbuzA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T/+TbuzA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4858303de5dso6825692f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788946116; x=1789550916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVEqxOETXvG1RcLpDINupVjXE2H7mQv/sXIWAQuUdGA=;
        b=T/+TbuzAVFw1QJUq0ELaT7OepXWgzYDh76D7IhoM5tZMjmZBhvxKigjgsNU12QV3DE
         lcxCJGrl5wkTQDGo5X3NuCxyrRfY0jBCTf9JGAEIhXEiaOlIlqMEGQObatY+CnOxj/pS
         26/Tyk3kYUn4gmNKuiMlUnwPeKshHD6qZgVzsfZXcZvEiSHO5y5KylYDZULSSrMPb6rG
         o7Afmq5NmxTOWlakC6/BRSg3IsZhj4d9ip5zIMqh1y09jVbKmZHTc3XsjwucVOeG3s4A
         0i5YtaTm376vwcxyuNqvuqR7GBPHcJ8Unbb4RHyf7Vwuwe6WknR8QzQ/e1sFsmVmYrCe
         39Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946116; x=1789550916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVEqxOETXvG1RcLpDINupVjXE2H7mQv/sXIWAQuUdGA=;
        b=O36TN2dgJd6iBjwXxVjBuaD5wtC6WzPswfE5tw9z91ESdcfOnC7uF4yiOUbhF18BVb
         Ng26D8m2p7INVhBEldL2XXlDlRTmGgwu/i2GHf1HOkq0TtODK2BnEtSdpXUp9xXrgCmh
         aGpmSMxjAjgEqKoYYsFkSdNoDFHimHJfFkIMrSIKG6vfZrNdT+1idQesJ0bTpvxJdZgb
         E0CqzyseogIULFmvddpmvrzAJ72J5aSYfWymNcBWLL9GS6QD93kkMP/gvm689xY28vmC
         73b+mbgDLUUoCU2IEq1jhGZNSqcBKZil0m2p2oL1W+Vq/UnbaQzDdmcIjd1Hta76WDCi
         nkjA==
X-Forwarded-Encrypted: i=1; AKwUvBzlo/u2Yeky7lCjRIUb/goCdGUKZMW42S6K5ZqIqgxClyvnl66NbZZcycvsQ5Fbf+qYtp0qYlez+Zehomg=@vger.kernel.org
X-Gm-Message-State: AFuF++lOIEJEBNhWf99hmcaFzCjNat2fb5M5yq23LXw/WNRMfASC6/b8
	XJHJrf6Thg+8bFqg9iPX6bW3SIvq4w8HfR68fKe+HlvLFsmDoSUqRFn5KbGOvBwO81w=
X-Gm-Gg: AYBFou3yzb0hutSzpiS906jjDn3G+0hjSkZBoJdCQauk6JvhVdFjKXjChrEbxbIh2g4
	j5jE8QHY7i+8GnKQI34gCWNcuTOsHvWbKX2JUhJ/BKf2jJfK/k1hY3Pzs0LyNqEkxCwX7XEcbur
	tFwP1QXtWTCJq3iWTCBsOyCtY5DPLWPJfcUOhcavFkNSL6qC3fHiY4mM7yEgMf47g0AdYSJecQk
	INUuUIqVJ640nYQGW6QSoKQGaL+x0JIBWnUR8kHgmG0P/bTtrBcfaS7kBvy9MQ+qnPSnRVvOdoC
	ifZWae4z/tff5VpoXomwY3WedzF1StIg3ZDQVn9kUjITj8FXsD+2ni+s9IlpR22yp0I0GuF1YJH
	kOqorkZpYv9ILTx/b8sfNNl0qioVodt86AGdjtSSY9h3MqWFT66tw6eYB432oT+PxChmuOk6Qfm
	PS51yIRhF8H3CCZzE34YPOj952de/pxnm3SvZYWDftAkJlHRGACfbs0TFQZgYCxOq/2werq0VBf
	Kw1zTq8afHol0J7
X-Received: by 2002:a05:6000:4208:b0:485:b14f:ec4a with SMTP id ffacd0b85a97d-485b14fed77mr868833f8f.31.1788946115800;
        Wed, 09 Sep 2026 02:28:35 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm45404704f8f.30.2026.09.09.02.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:35 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:28:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>, tfiga@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] printk: Introduce loglevel bypass for pstore console
Message-ID: <aqEmwXTLaTyUhhYG@pathway.suse.cz>
References: <20260831070346.3490745-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831070346.3490745-1-tzungbi@kernel.org>

On Mon 2026-08-31 07:03:44, Tzung-Bi Shih wrote:
> Currently, offline consoles (e.g., pstore_console backed by ramoops)
> inherit the system's global console_loglevel.
> 
> In production environments, physical serial consoles (UARTs) are often
> heavily rate-limited to prevent verbose messages from causing severe
> execution bottlenecks.  Unfortunately, this identically silences the
> pstore console.  When a kernel panic or lockup occurs, engineers are
> left inspecting a crash dump that has been stripped of the verbose logs
> that could have identified the root cause.
> 
> This series introduces CON_BYPASS_LOGLEVEL, a simple flag that allows
> specialized offline consoles to request unsuppressed logs directly.
> 
> Patch 1 introduces the CON_BYPASS_LOGLEVEL flag.
> Patch 2 adopts the flag in pstore_console.

I believe that a better solution for this problem would be adding
the per-console loglevel feature, see
https://lore.kernel.org/all/cover.1764272407.git.chris@chrisdown.name/

It is currently blocked by a cleanup of the console registration code,
see https://lore.kernel.org/all/20260604101459.393162-1-pmladek@suse.com/

I am going to send v5 of the console registration code cleanup soon,
hopefully later this week or the following week. It would be nice
when it gets some more review.

Best Regards,
Petr

PS: Thanks for reminder. I wanted to answer this mail the same day
    when I got it. But I have to interrupted and it somehow fallen
    though cracks.
