Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116058;
	b=11NITfdmhDGbIsAsuwKMImBO5zNWS5odPktT3qT2mZQkMvh585+IyOlZ2vkBrm93DTjN
	 BrluhtKi0iUZg0FnbuWf8ppThrU3J4R17gdUCqzEKbM5jdLswBNbN9Zq5xrFrHGx2MOLr
	 l7reHZOqqk+pMnHyAA9FLNSoFDwE4XB/31/olDIPb20ll6XdYgGGM8NVAA/rng/PrWG4j
	 ZtnXm/s+4U3v8KjfOpSQcJOR/yFJnW3AFFp6+0EWmEHgP+E4o8AkB9kdU5roa/p7UrtRc
	 KxrFQFJUEb1rghCe6qmARBPUZEiR9dYtT0fTWzNVF8gis2tkmiutHLKl5XujZMHgNFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hJWxmNg8GRlwdEhT1CHnMxWUz05ZWTKr88CS52FhUkI=;
	b=sSZ3064iCvoB8KaBc4OLD0BXyPX2eDEqTACS/bnO/tAm8WoX49XoFY3uOSr1wIXLuqBf
	 mli5mNSY80mUW61P1JALqn8xkVA3nCdu3ZihxLahSCs5tVgVimzDp7hT6NlCaTRmcbeUK
	 n0Dzt00lEx6DvEXFRwFuXAzSO1wl0QbyzJuIAQiLZZkQSEYZdt4X1ioXEsiD3u4U6LX04
	 DsVdNEIgJUkq6kmN2kjhwcnxkTrisXDoYw6pd2d+CdlXEq9RH3MJ8+fDYKe5fSPOU4Dv0
	 viqWLW77epw/zX2OS6rGv6vhPFICoojKTOaSj16NheiVn372qmwn0p/9flWHYtjW/9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gJIl39nG;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B56071CAD
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8B56071CAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gJIl39nG
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3895443f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793116056; x=1793720856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hJWxmNg8GRlwdEhT1CHnMxWUz05ZWTKr88CS52FhUkI=;
        b=gJIl39nGiL6ZXhYsaE1RCyXuPrx9WqbwQRiPRj1acOUBCNSEjdTPfBN+/ZVPqc5Jzz
         uXZs4FqxLjcBTMXPkAsCebN0ozOwI9nCO/FWmbTx7xmu7dlqRuGJvIWqvf5S/oxu+gsu
         33gaAFwSXzDLT0HK4MBzTvfioA+3DEDJw0hv+6ShaLLqnEizABiTxahIqojKLlzFkQ+o
         sxsLs88PpQSijj3TDGFIEcwfLiMuH+doHe5ms3rzt2fEbc1g7gY3dq1i9BjTwwTtJulW
         PPf2MqJ5cXU0naogRrAS/Mp5GCh7qmWASZ3Vr12uVicHIHLr3wMhLgtdBDF0j3iYK9f5
         tlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116056; x=1793720856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJWxmNg8GRlwdEhT1CHnMxWUz05ZWTKr88CS52FhUkI=;
        b=UPKMSpvmtjZDIcLHzl0BbK6z1qvZAyTdzWfMSjz/ntn1H/Dmex+QFJ84HBVSIT7ALX
         0bbotbPq8LQlmy5lwJEqkV6xAp8IbpyL8N9AafZ8OJXOqqWrfIATiebZGZ+Pumo3Nebq
         C1v4SvAGE7SIF40Ncr37teae7gHM3ZLi9vupV26si/bmp24vu7EE+zc2HmQdulq/80Wq
         6o6GupxIJPgPa0EwBHz7viz/udEwbhGi5fxGZDxCa0Dt2HPIJ0k/Ixwa8nmeUr26bPuF
         YJBfJb3RP94GUlsbxZeeUGQfMHII92H8gxvJJQjKqhlIFDXOtQBkePCB6KG7WVX6PysU
         uhaw==
X-Forwarded-Encrypted: i=1; AKwUvBzi+dK+hQweBX84tIWudCSf5rdcfNMffO8/CMDsxA4hl8oKWCj73Th2YT/vNSxZWHUo+CjQYQw+aWXZ1SI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI25T+g4b5qgy3mq6zDpbfSUTsUZbrT/swwxqDVezD6luAo/lpL
	n00N+eWnzsq/CTGtakIu5FzpDL8dh3F1adbQNlUdWLQD5Tn+ultI+dNCa83MgK0ZzUA=
X-Gm-Gg: AYBFou2QqzmezvuvZg0j9WRdEoM5VE37u0Wqfi7OOWIPcw3hp+MKyAzMBqNFOeRO3VW
	3kOS/yjSt8kuCUjA+WD0g3Dwf5O9qu89yEWaXE9DyypWsIHFFx3Ffs69WD0bXvv7kn3H6SZEvQM
	HqDyeOGFnFlHjSb419vMfw+z17fyXrMR0s1KR6Wjs6m/MEeZFf0OgWXQYjAbG5f7Xr4H8a0BvXW
	5YfXKoYAmjwHESRgtVcpym/+2bX8MWGrqbgKnELPD/p9iOartIZAYuJv5ZIBDs3Btiqf0aHxaE/
	fSPL7SY8TKayQk0ZQRIr7HtnNMKQlgi/2RnjZUwljc+KKzYNkpyO2YiniE+gVR7fmQGWhJbSIIS
	RmUtqhQ+ZlXFllCO7RvszwdSLMaRUEvduix/xrXjxl3w25fQGxECCzJJIdAeTu5WcZpOiekxYcl
	wTbXZsStCCu3JycE3pdnTj+2fVRY6oB/9w6GZWest/mUX+oL4Or6iVpsWngfEWU2fResPBz5AZv
	+nUcBc3UazuoEQSvTZmGaqqpLQvrAGMk8rTrQid4kTcb9BHxVhxfxf3jA==
X-Received: by 2002:a05:6000:1843:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-48e45618c07mr17325132f8f.16.1793116055825;
        Tue, 27 Oct 2026 08:47:35 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm21964926f8f.56.2026.10.27.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:47:35 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:47:33 +0100
From: Petr Mladek <pmladek@suse.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] printk: annotate the intentional data race on the
 data block id
Message-ID: <auDHlaq17eg_uA9A@pathway.suse.cz>
References: <20261012120341.12423-1-ngocthang2710.1999@gmail.com>
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
In-Reply-To: <20261012120341.12423-1-ngocthang2710.1999@gmail.com>

On Mon 2026-10-12 19:03:39, Nguyen Ngoc Thang wrote:
> data_alloc() stores the descriptor ID into a newly reserved data block
> while data_make_reusable(), running from data_push_tail() on another CPU,
> may still be loading the ID from the same area. The ringbuffer allows
> this race: a stale or garbage ID simply fails the descriptor lookup or
> the blk_lpos check. KCSAN nevertheless reports it.
> 
> Annotate the accesses with data_race() instead of READ_ONCE()/WRITE_ONCE(),
> which would needlessly restrict compiler optimizations for a race that is
> allowed by design. No functional change.
> 
> Reported-by: syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8324b8fd984b86905a66
> Fixes: 896fbe20b4e2 ("printk: use the lockless ringbuffer")
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

JFYI, the patch has been committed into printk/linux.git,
branch for-7.5-trivial.

Best Regards,
Petr
