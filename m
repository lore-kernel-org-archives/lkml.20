Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817828;
	b=F06jKepYdvYYYQyp6m8grjSABm8wj3x/07fwL8XDQDXzQHjbQx02by0oTz/1t91SoCth
	 0yPlFas5JqWwNRasPIwgIhnSPhifVdeBeDw0oug3UZcIxaVK6OLugEZPT8IbDM8HlA4uj
	 dvSjkRWwZmFultK1dX9g4fISSj3QOvJ9tNAvuBzjee+V6aYvhS825+hnMb5ee93zCsDFq
	 Ju/mKQTAl6QvWI4bgxGN4Vkb54OIVR00SFfZFmqY6BVJ1kaNmOex4X1Wp/kPu4aCSgWSQ
	 /XdBz2m+R53mrPVYCTV/9xurUxhlySQfp6imVJ/2DocRWXTTB5e73Opp+ziC4TXGPNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=3mQu+xhKOfrx/Y3Mf7/3+aL+zZ+r3DgrMalP1w3JA9k=;
	b=ZF62KB4UVC2o/MGkq+PRIxTL4vB3v22Yte96TWrD8IflvIuxeE1ugtTLVbVgGywVB2xo
	 1s63LWQeDSYsB4bHxAHsboZZwKn8LDwgcqOUDt5iYkhzZpiMPYUJ40WLHPjIzfMfFXiky
	 5Klk62FPF72rSyjLE7wdF9vZxzcmZv+rNr8dVljSBEDaVk0wJ6jbZxDAXJer0hJnixEH4
	 YJgE8czcbGYZN83s7hOa+OggGzzV7b1kQSlkjmR9FdaU6rYiyO+DoEZOi4BfFMgNTR9M7
	 sejngqKpXq/o/ydYk2H68L8p47hRl8hisnrxTxkjnmHuwy39QGAktJKyPZ0Fry15SmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k30JlQ6o;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB031606D811
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB031606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k30JlQ6o
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9331255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817826; x=1794422626; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mQu+xhKOfrx/Y3Mf7/3+aL+zZ+r3DgrMalP1w3JA9k=;
        b=k30JlQ6o7repyugxA9okX1WWvW6FN3Y4mpdmzV+MGsTzBfy1md0wkJiqBfaFhJQURl
         FPHzitUXV8s8533Fr9N0pYiIPkywsqJKruic30k7FjbCgSU//FVm/XcJ1jGjZ+NH4Ne+
         SAYUaE6aeRgyWb2OpIhhH5493oL2UgWIgEpT34XZNaZ2+CuxKMN0zB8j/nXrzuH3/kGB
         6xWN8+ZyL6SySKGXH5J+vL4ImsKy+7SUK2I4orbXlmYwjw+9veZiHToJQDfvIChz10oQ
         BD9Ly6JywQbVg5LoekOehym4uYx3pFxXWW14Ka/xum7980kpSXVffYlyoiaBRmEYyJmX
         Bu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817826; x=1794422626;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mQu+xhKOfrx/Y3Mf7/3+aL+zZ+r3DgrMalP1w3JA9k=;
        b=RJLpgJJBKCo5N5/D9+S0fExK/Hn/F6LCjagepe9oes7bCvxxXdCWHvsVwKSTJ/CSkD
         aqmsxakjgdzr70T17cnqgmJEJDAvUyUCRgwGdrtvEsTSZZ4VnRCTxZ8rWjPrO7/Ha/NI
         fwjWnmoK1JbOZu0tWR0k4Md2LVcrEe6uJAEwJa/M5zYDhxwFdzEM5l98TLSh3cAULkVM
         sWEBwwfqj5mIes38zhxumhNugv1ddk5OAv2ITJnWorswp9Qu24t2V7Qn5YCnblKuCISN
         u9j1P+/Kj/BJYoEkq++s3hm6AAgw8e81SMwJqxS/AxQpBtew93yThgnfe5z5HCV1RUru
         L/+g==
X-Forwarded-Encrypted: i=1; AKwUvBzsol2Zmf5wJoRzSDNTdohQ3pUkpqUa896aT+rw8XDvoSvPaSg12OqcjOcpEvA9w4fBdV/kdo95iDnk+Ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EKSWkgczihnaURxp/XEzUaUJEE8Z2iX5lsc4iN37jT38C7JMA
	yIowN7Zpv7MUolrZz07KMgVtoxgYxiSKqFRNJ/RyZf/l24jtcL/h77u3cSBN
X-Gm-Gg: AYBFou0pOZ1jy3qS/iC3UNhDrzL3SHVHkNM8gCm+To0Xcaw4hG3NXpDJCDVNDrasjHW
	Am6P2MnFX82IGnYiQo7QHqKLagEAej6B80JHGkjiDII9P17pG0bMoxevfipioTn90rc49DIdXSZ
	MqJjB4HLRO0gUgiMUldScqCrkV9ZTCSkg4y2Rx12BfdgVi3M6WIqlb1v/J2yYrcbmR20NVl3lDv
	rXc5JlP/60/pztCDnvqdPmco96n9pnYQXWUtXVkP9IcI6uzvK8fHwzMes7+HJL1h2CrKSmkD9Cj
	1m0dPE8ZlfQJZqoNDiA72cUGCnXySAvyNeC6WvhNWoD6TtidKk3irKtb01ped6CLokQl30LehSt
	fP45JanRZbCF6crvrUxxUROv6bQh0iKfDxNPcdwrrk4A5Wgd0ryEFi6v2MU8Ga5gv8gR/sgsQA0
	LilN+WrVx+u8CsIEMonFLmGCPvtyGy1cYAQODjgWP4fHOEKIdJ1XoNMf46V5WrRNOGlbwrSuAWD
	1rMVji0dumlIQgyBW/U9XusOIxcehTRwHXPNLNWIhaL1UgBwbv8881BIKQonQ9ItL2ABXgjfNY+
	0gk+iRCJU4HrTY0=
X-Received: by 2002:a05:600c:19c9:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4ac18a8911amr379507765e9.34.1793817826186;
        Wed, 04 Nov 2026 10:43:46 -0800 (PST)
Received: from p183 ([178.172.146.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm5320098f8f.41.2026.11.04.10.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:43:45 -0800 (PST)
Date: Wed, 4 Nov 2026 21:43:43 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Chris Mason <mason@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, akpm@linux-foundation.org
Subject: Re: [PATCH RFC 18/38] proc: don't WARN about a name that is already
 registered
Message-ID: <9cb48eaf-72f2-4e9f-b979-1ead58deb22f@p183>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

> --- a/fs/proc/generic.c
> +++ b/fs/proc/generic.c
> @@ -401,9 +401,10 @@ struct proc_dir_entry *proc_register(struct proc_dir_entry *dir,
>  	write_lock(&proc_subdir_lock);
>  	dp->parent = dir;
>  	if (pde_subdir_insert(dir, dp) == false) {
> -		WARN(1, "proc_dir_entry '%s/%s' already registered\n",
> -		     dir->name, dp->name);
>  		write_unlock(&proc_subdir_lock);
> +		pr_warn("proc_dir_entry '%s/%s' already registered\n",
> +			dir->name, dp->name);
> +		dump_stack();
>  		goto out_free_inum;
>  	}
>  	write_unlock(&proc_subdir_lock);

I don't like this patch.

WARN is there to make bugs noticeable, /proc entries aren't supposed to be
created randomly unlike regular files so deleting non-existent name or
registering twice is probably a bug.

Now, some names do come from userspace but it is up to subsystems to
find duplicates and return errors (and sanitize for dots/slashes!).

In userspace mkdir;mkdir returns error second time, as well as
unlink;unlink. In kernel error is BUG/WARN (like it is now) and it is up
to subsystem to evade it.

	/proc/alexey
