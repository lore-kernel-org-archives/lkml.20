Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869268;
	b=d29dsDe9qL+978q7P+LYuQvsptUb00ysGRPolXr1pNtr/74bKQQNqjo+nvZlm5coZWR6
	 IbjyEPB8QMhJ3vSNjEWNOuLkmxjTALXmFvFcIbIL6CW080lVepNC0OjIx+75UbxigYK2Z
	 YycIZNn0Vpe2pIpPW1oku/wxQScKkOgXpY8/LUwkwyKIaeHtFbTqVcUOXNcIN4Tqj4P+c
	 ArlDQqugk3ggM2x/vPXhXIKYZMFBuWO3o8WO8palA3LCCFhJ7HFeiJgw12Oi0HmQ4zU/I
	 UyuMFpKOMCN7IAwR5XBHJwiEp5jUYmE91uBwaGjmvmQkK57CpOL+8zhJ6iMSt3TH69Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869268;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=yNwBoOiPVSuVAb40aljh4NsiE9S7Gt88WLt0OKIP0Pg=;
	b=KhF20K9uXLQiLYXg3dloYHVR0b0EygA4MqQydZXBQvqXnXYV993FZ58/+oClJc2b7KCW
	 t4BtErndFvOziUmuhA6H3SP4Dcp2szQ0Yk88VFeoBSFZepiGbeUsiqdXuazvDNQRLheOR
	 OIJUmdls2ghZJol0lnfdzfTdBfnWxQKaPbYCVlWYwUBu18vguJPFkeHJjH4W3aYFz/r4Z
	 WuVdKv+ymN7+6J3NEW+ctaXRcqbGzmYTSQQvCZ5zZBHckhPE2uImweSOmH9A5jkSh/YBf
	 O19gVDZ9iv9O1Ut5YIEUfLXtWK6ICXlCezv4sLm7K14jTPLHfBFeFOIrTughLQc87Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4FA606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4FA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-85d502ea62cso2165996a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869267; x=1794474067;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yNwBoOiPVSuVAb40aljh4NsiE9S7Gt88WLt0OKIP0Pg=;
        b=qIkgsJj/Ch2d+RSDtYVoJEIui1dfqBkga0oHrhJdCKUTZLieXVRd8Roa0qCNliiXe8
         32pIhppJdt/VXSsqO1pDXdF+dkUhZheZxH9ZA0iOTbiDKGExUrxizJy3rK65mSwjQNNh
         34fc9hjbdSYv1W8QKY1L1Uam9AjiFURBa2nUmn8pPHumULKY0l23Dh+q+lDuWGDzi3qa
         Zg9PvABw8AnU/wYqkGeLd8GtF5GvFOfb/ZIrQplOdZ9fJY5BykSi6IDsxkkr5vF2PRdT
         r3oO8KD0eb8s6nqgvit1YMLthCXzku3nmEjjVF88OrjEU3UXLeo/ju3d444sH9LdQ9Yc
         unIw==
X-Forwarded-Encrypted: i=1; AKwUvBzQS8T1MgjLVrS2cITequRalRXob69kmh4DZW9Sy87O2ESannLlbxSiKMGRD140z41MA6vfNU1YjBYrrKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/adW2Bo4Jw/JLwhWW8hYpL6P26rbE8Q5AS79B5sWdhcUvrvy1F
	/ME0+YcGkJzjbivR+ZAVmvP1nCRK6eyV7e+bsJVGHL6VNaxWw3c1BsTi0jIyfPBRlOTNWj6T+K4
	zlAwl0caR2iVLiKl46CCxfdJsDBfBdTEkrFCjJ28V4z2V/NVF97BTPxjgjE0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6404:b0:4f2:4d2f:7ba with SMTP id
 5614622812f47-5640d953debmr14206701b6e.8.1793869266894; Thu, 05 Nov 2026
 01:01:06 -0800 (PST)
Date: Thu, 05 Nov 2026 01:01:06 -0800
In-Reply-To: <20261105090101.3210622-1-yanghaoming@kaihong.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec45d2.21d05368.325ed5.0008.GAE@google.com>
Subject: Re: [PATCH] io_uring/sqpoll: make io_sq_thread_stop() idempotent
From: syzbot <syzbot+9f32706bfd7c4ff81434@syzkaller.appspotmail.com>
To: yanghaoming@kaihong.com
Cc: yanghaoming@kaihong.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

This crash does not have a reproducer. I cannot test it.

>
> Please test this fix on upstream.
>
>  IO_SQ_THREAD_SHOULD_STOP may already be set when io_sq_thread() exits on its
>  own. The last ring still calls io_sq_thread_stop() from io_put_sq_data(),
>  which tripped WARN_ON_ONCE(). Reproduced on 7.4-rc1 with IORING_SETUP_SQPOLL
>  + close(ring_fd), which triggered WARNING at io_uring/sqpoll.c:88 before this
>  patch. With this patch applied, the same repro no longer warns (also verified
>  via QEMU initramfs repro). Fixes: 22d9db9fd64a ("io_uring/sqpoll: don't
>  attach to a thread that is canceling") Reported-by:
>  syzbot+9f32706bfd7c4ff81434@syzkaller.appspotmail.com Link:
>  https://syzbot.org/bug?extid=9f32706bfd7c4ff81434 Tested-by: yanghaoming
>  <yanghaoming@kaihong.com>
>
> Signed-off-by: yanghaoming <yanghaoming@kaihong.com>
> ---
>  io_uring/sqpoll.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
> index c833e776320d..f0c9e07c2d04 100644
> --- a/io_uring/sqpoll.c
> +++ b/io_uring/sqpoll.c
> @@ -80,14 +80,17 @@ static void io_sq_data_release(struct io_sq_data *sqd)
>   * ctx_list by now and have no request left, so the thread can reach none of
>   * them. What it still uses is its own or counted: the sqd by free_refs, the
>   * hash of its io-wq by hash->refs.
> + *
> + * IO_SQ_THREAD_SHOULD_STOP may already be set if io_sq_thread() is exiting on
> + * its own; only wake a thread that is still running.
>   */
>  void io_sq_thread_stop(struct io_sq_data *sqd)
>  {
>  	struct task_struct *tsk;
>  
> -	WARN_ON_ONCE(test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state));
> +	if (test_and_set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state))
> +		return;
>  
> -	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
>  	mutex_lock(&sqd->lock);
>  	tsk = sqpoll_task_locked(sqd);
>  	if (tsk) {
> -- 
> 2.34.1
>
