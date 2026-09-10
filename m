Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C1935E549
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040844; cv=none; b=FriJLvSB/rTTgQOGw4PxbZVUNYKmwylgYaMzjNiLd5YRGC4Y1yhBOySnHyRPJ/+F8wW/Bb1I2MrAluGgvU+jta8OEB19vQpJf89F01TLO+s9OzxoYA48+1IBhwWrLPnP6HwV0LteRXMeAbKsWfZTQqiZ9DWojlykIZV0OP2ADRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040844; c=relaxed/simple;
	bh=gsc1w2NhrcXb2waV/2ARV3e4n/D+1hAAHzZPTyA1AYw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=rZvIPK60VTftHH8w0S9Jz7Zdq1g+g4+uL/WrrTEmEBHBvStON70tKasV1/4EKYR4pZaHyBYbjA7gbm/h0WekkyrpdGipWY/hMHpE5RzerJqf7QZemRBcZgTcw8SmBsWm6JxOqpnZ/fX599fafht+IYBSjzMj1jMFkl7KVwAtQWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2fb8f0df0so7475749b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040842; x=1789645642;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bBYLABk5U5egfc/kQ8vGs6+F+pWsZmwNSUn8VQ4dQyM=;
        b=HrlI+wiji4kOx4J5lDi2hom/RmOE+lg6uPVTpIXIEbvs8zwqDD8Z8f/rb+GSU2LsBV
         XvrLCzaZMdq/8M2KUW9nTHJX+bRC57Qb1Rq6bf+8EdmERAXCSSynbI1/mEF6DKvImQDl
         YmAKRtNxGC+QF64FKjC2Gpk6Bm1cR7NGghVHEX8lTrOGKV7UrHBm62SmwiuPpVhf9mkh
         DXVzkbwOpCtYwicsXslht2wbbjq9Vtqs+nLW7WWrT/5WvJNOEjW2puujv6DkpmDzybnD
         tE8I23w0FoxOw+aqFRuTgqzRI2ThcaoKcll42BMTH1hjKYQv2GYIIgbovIhhkSNXchWp
         7nSA==
X-Forwarded-Encrypted: i=1; AKwUvBzcplHi6Ipe59nUpUpFYuHXrvPJNxd3iQr11Gclf66sSLdKX6s7/ibWfxevc0jhPSdSz6XH6iSx91Rlw6I=@vger.kernel.org
X-Gm-Message-State: AFuF++mL9Y0lphZYMCXPpIK1vWgkxli4pGZ0pW82b43tM+BtROg29BsN
	+lwhpTGo0QtJ7NAokI0PRrmgoOi/EfNyn9xOZ1o/IEiG9DNJBdUD1RmAusU2ouKjwe1kxzz/0VU
	lML5QNSq0vi9ReRnKTb48pjk7dv+3EJ3GXPyjl3hYiJbnhvFUvNiZMYqQJvs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:251a:b0:4b3:17ae:16dc with SMTP id
 5614622812f47-4b9616509e1mr27638591b6e.9.1789040841886; Thu, 10 Sep 2026
 04:47:21 -0700 (PDT)
Date: Thu, 10 Sep 2026 04:47:21 -0700
In-Reply-To: <20260910114712.20455-1-tahasami8@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa298c9.6e6c5f9e.28f11f.0032.GAE@google.com>
Subject: Re: test patch
From: syzbot <syzbot+de3d7f9bcc9212f3fae1@syzkaller.appspotmail.com>
To: tahasami8@gmail.com
Cc: tahasami8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

>
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 9c03a555a6ba..98130182e05d 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7995,8 +7995,10 @@ int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
>  		goto out;
>  
>  	reader = rb_get_reader_page(cpu_buffer);
> -	if (WARN_ON(!reader))
> +	if (!reader) {
> +		WARN_ON(cpu_buffer->reader_page != cpu_buffer->commit_page);
>  		goto out;
> +	}
>  
>  	/* Check if any events were dropped */
>  	missed_events = cpu_buffer->lost_events;
