Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C53EFFD7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277692; cv=none; b=d958F1yZNo+ddoPGJUNUxH0OGIOP7YtnuyHYN4t3WaKCGsBzFvdJe7J9wQn7+LkK1GIRiOWxekwllvfWb9g3RCDfqsNKOeRTrnyxQ4plxKnXD6knQvrQ1927f85XHbKLEiQ4G/NgS3himfwEQ0oBsHv0kpyKslHjOTGjoAvrD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277692; c=relaxed/simple;
	bh=4CYZq+XivpUOXknGL5/ONdRYXa8exEUr6gpRyUOiiO0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=byrnqL1U/6vk9X3EYFfptqRU3x57iEz5k6lS+BhTcFHQN4qC5HUOZ6yS3qr9qyfdIvGm1D+eb0TXnU7SFJazAPprtDQ4rRsf05vQTz4rz6WWotMAR2hIAtqh+hZ3qnRzQUoSCL2r56LSSKWWcaMQHeG8L8dFMkI0zrADGVIZqco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cbc77da654so472073b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277690; x=1790882490;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G4OPnoGCxey7bEjq8ZLGQYRdw5p19KWGGfadWKd6dxo=;
        b=2JwfeYQL82wW3QxJ7/bkS/6t40NA9Iejyw/vz+ckE3J3NCoIGaAO4x4yweavPyFXvE
         bRANOiUb5QVm5VpgnRdMppAubKLa/tVKSMGGBXIuE8Z3+Cm3wfw76C4CpD0FJx4LGg3w
         L3sQRqMsHLrzBwH5XMleepiNRlOZqWd8m7IeispSGLZCl0G2MSv1zJIbmFOm1Mp6FciT
         C+swtucTP3fQDvekXNtT/5w3U3TDFRH+7ceDO5l6X3fhdmMrFabT0My55/cOZAxpCD4+
         bIoaCfJftnf+ixm8roQWMIla6Bb+mLNED+9Ni4UQYgELtZmXdRoW9IphXQDNHfvS1C3a
         AnKg==
X-Forwarded-Encrypted: i=1; AKwUvBzqNkj2WSqQUJ8BwuOrn0kvJhA8nzK854wsXJDiXiVQeaaDCI4Gt0fYhdVzUx5skJgNGiivBt9n1QtFaMY=@vger.kernel.org
X-Gm-Message-State: AFuF++l0lL0i1MHe2nWX4WWkAKG4W2JJVhvTCzIicVZzZxDCzS/YCXLa
	bYgERKVryJqewLEc1eXwkWRmaLMiZ8K/0lnhC2B5qQQDDNmoCdcgLP3lHD5QegK2UkwTkrUq6Qq
	ZNhrxfur0fp5MEY7GzaBMSFFCAkUvaV7J/E0SSz/2NT158DjEwBvUQqSf/uE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f93:b0:485:48da:133d with SMTP id
 5614622812f47-4d72c042eebmr3146622b6e.10.1790277689791; Thu, 24 Sep 2026
 12:21:29 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:21:29 -0700
In-Reply-To: <CALq3yPV0NNZAO4pARgPe3_f-m2oFJH1FEKx-JsX7gc0s80jBQg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab57839.80e1c6cc.1e8e5f.0016.GAE@google.com>
Subject: Re: [syzbot] [mmc?] KASAN: slab-use-after-free Write in ms_read_bytes
From: syzbot <syzbot+ccffdf05833ebdaeae70@syzkaller.appspotmail.com>
To: rajojha047@gmail.com
Cc: rajojha047@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

This crash does not have a reproducer. I cannot test it.

> master
>
> diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
> index 7f3f47db4c98..1a2b3c4d5e6f 100644
> --- a/drivers/memstick/core/memstick.c
> +++ b/drivers/memstick/core/memstick.c
> @@ -378,9 +378,7 @@ int memstick_set_rw_addr(struct memstick_dev *card)
>  {
>   card->next_request = h_memstick_set_rw_addr;
>   memstick_new_req(card->host);
> - if (!wait_for_completion_timeout(&card->mrq_complete,
> - msecs_to_jiffies(500)))
> - card->current_mrq.error = -ETIMEDOUT;
> + wait_for_completion(&card->mrq_complete);
>
>   return card->current_mrq.error;
>  }
> @@ -413,9 +411,7 @@ static struct memstick_dev
> *memstick_alloc_card(struct memstick_host *host)
>   goto err_out;
>
>   card->next_request = h_memstick_read_dev_id;
>   memstick_new_req(host);
> - if (!wait_for_completion_timeout(&card->mrq_complete,
> - msecs_to_jiffies(500)))
> - card->current_mrq.error = -ETIMEDOUT;
> + wait_for_completion(&card->mrq_complete);
>
>   if (card->current_mrq.error)
>   goto err_out;
