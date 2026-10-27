Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114683;
	b=afdiW1FRRWU2NpcqvsO/5Wv/0Dnvnj5RxDjwDtNNRMlA+ihzb/A8WGqsdzIBN2izXYL4
	 wZvwi83NXe9tU1WlG3IXVOhzis/ufIPRQFgI7gkC25c4COXT3qSWTM/ppPyifTPcJ72PY
	 nS7d2VpAL0jsWTMTHflSZKCPJGEi5B5o5KetwpFrQTJA5x6TK16d8dJBGDNs8PddaL06d
	 23yQ7dvIsq1R6iFPU/m1FMvfAC+tZ+uvk0LIE5ssziC+kA7KgtczGvuqXYjoI+0x7XUvC
	 PGYJRgqBq9K2pdWBr2+fZEHEZTlUERlAnD3EnhbfNDve/mGDnjgHO8+H243CbLGiycA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4R3vO/VGnRAq5fFczSYpyUzNCuTRY8L0jw0kaLsddKI=;
	b=EiVl1o4T3emWRgUpchvknLb3Ix+97HOVE/oQrQgXttbvSDpW+LOJzYMc+aAdfDbDKim/
	 7rO9XOGuu/ZjMPsstqf7xrc5ZufC/RekEeg/aILNV7Qp2XmdwROMZhZ9fsLvniKL9Ki+5
	 dOlh9VSNwFxhhtT0d6jHGQTJCv+tMMhqC3Joj0jtSnkRheTW6L1arYH6BmOu/DQbzqY9/
	 pGQma2CvC0YEEgDOYGQds0SkZR4ryuq6eKBXsp12V6CgBuRjqTTTt1McwncDU/DrlWDmU
	 rtPSRKTqSTXFtMevkoA/sQneiyWbtF0TCaBDe36XA5w+oxTCpVBsr6UF/A8IG/eRCzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V6NjIzU4;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C31606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C31606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V6NjIzU4
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df4f540ebso2130038f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793114681; x=1793719481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4R3vO/VGnRAq5fFczSYpyUzNCuTRY8L0jw0kaLsddKI=;
        b=V6NjIzU44x9Enqptc5hS+CcGBzlZfqxVKuWMKubp6mDVzClj+08EIhgfflNjNF/s/Z
         7sRKwmgIKTJ5GIzSVYYhyqLBpdNPBIG7EdN5H+Fx8aoeuiWsCgZERrDX2yCi8MhNuBx7
         9QaZoXhZaZ7wdS4jfqVHrv3Qqkfv+bJmwwA8mRwMbO1U7wAZRS2d0XjDukZrcyT9mOh5
         hhf+YAwvpHRzfRrbUfF91rEncR1Mdo3YgrSD0FU5EZr1V9SFnEUGXkTCitpx4ZweqFPa
         FcFuzLaJSeoagGq7t92acSToAUZfv+AFxc+22Z+zoDov+HBohGlov0SjfLDOEtDqKGkF
         cjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114681; x=1793719481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4R3vO/VGnRAq5fFczSYpyUzNCuTRY8L0jw0kaLsddKI=;
        b=s2uy14Dmhr4NPn6FQsHPRcW3VzWWSU0MDn3x7OhPNgcuI5igOckO1Ipm0GK/ZPYmLJ
         XAGt3XnCcJC6jVxx4RUnlFhNcV6j8/5adDb/ZAvoYtw52HzVrMT3QLvSlDxVzS+w5jPP
         m5trqEiEAKRinh8LVh17/mJZzpv+8LSJvuBqpYNh7cuBNjMuR9fK7iFblp74uDEbcc0J
         GuKiP0Z5dB9wFbNZfjLh22evbcTQftPzzES2g5UFh6ngiyVX05NufLAZpwguCaE1zF29
         7JM83ueouyZ4BUrL+EM93IUlbNx1joyOsNqdEtkJbKGG9Ec1t3gMmHgI1Ut5qn+o/AWx
         gQ0g==
X-Forwarded-Encrypted: i=1; AKwUvBz8MQSc1Ac/bO0ijKO27brdAo3udqv3JguFdbGFkoSh9HxgFnWOM0Xnz1DsqktFabKtV/ILm9GyV2QuVNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoe+cDUjQwLwblxRIPxT9Ca7PnZKTfTIUYR+5XF2FjwRWms0qj
	BKQhiNk1wCs6IJzC3OcmTgjCU9xTjxK5j5YTzmiM0GjHxdJWuaCkkDAyd1GfNtgsRlk=
X-Gm-Gg: AYBFou2z52L+P5uu+aBbcte4V62g30tIE03aFcuyH0gfBunyCRkFZaUjmQLAX+nniCl
	Q5fiXstStsdiu0lN3emBV6eMp55qCf36GmCfOMazx1qhwmTg5y9Q2Q/gY6dd7szeFVPwHjO0dXt
	Mt5Ex38sy2wBE72l+3EEP4vTxUmHIKlfAm70D9dA2rZERH4yAHLYE5X5ARP7+mqnTSFLv5+E3no
	/mxeDJOOFQqKL3qHBBkFyoXKhLyZ+x1xu5k8QQQfAq4bmRXOKT05dadYWSma8jaJKEr+j1Nk5Hh
	iQCJs8jy4TD3Vlt7SzCEN3KY6foAsCt/7FuhxIaxkigtPf0Wuxn+sm+Y99z66+cyaxBQwy0H9r3
	KTnyzAjXIvqvLuJ1Os+r9yFfSz7aYvRJSvPl0wlZjjtnL/ZAx0HXWksBn36BngBboWhs8DB+qMv
	iycL5ryBa4J/mZ3WOjG5WSpvV/eW24p93SBm6kzXVL9F9JdOUeraXeAdwCoxoE1xYah3uGss6rT
	y+SivWQjwOrnPR1Cp0Hvv4RyT1w1vJ4gL+lFSckpwOLQcm1P5LcZF+wbQ==
X-Received: by 2002:a05:6000:992:b0:48d:f957:bca4 with SMTP id ffacd0b85a97d-48e5c4f361fmr1313187f8f.44.1793114681239;
        Tue, 27 Oct 2026 08:24:41 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8e0sm22701257f8f.29.2026.10.27.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:24:40 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:24:39 +0100
From: Petr Mladek <pmladek@suse.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] printk: annotate the intentional data race on the
 data block id
Message-ID: <auDCN1eYK3dshG4f@pathway.suse.cz>
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

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
