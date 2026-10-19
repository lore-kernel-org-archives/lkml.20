Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437438;
	b=nU7H3OnEUNYkHnPYtSU5w1I7V1UHC9KpxKbnLEfrBCpIjOVg0tGV/tXKAtUJT+CWmt9I
	 TVkU0/GKARvSDYgMd8xbzRb17amtbQtt4u/PNytKfID1Ig/O+PUiiEHocmx68il0Yn7fU
	 IZ36Itgt79cv95xd3UqblqDKAOIduwtDccRrxweAO/nHtnYBzUltMtxg+bMOtBMppLSmF
	 vS6RNXnB6UL0f3SCRnwVp8hSvBHBRSDySXIBYAil+t5lZ4cy25sgq98ggWIB0jkYWSbHa
	 YFF4/QtvhlX6QY0p24huODxqpsOrcSV4g3oRv6Ktgl0hsCEU90J8V6DJ1FDZStjJWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nEaJSEmFi7tdhNRRtiloMBCFCWtro6yzfl/zLHiT3pI=;
	b=vXptyJZs3qH94g1XBqgQMnFTJwTKSVPuWxQEHJpM5JmPC0r0z5oiwK5VfK2NEVSors6p
	 hqRJmyFLzs0ZmdzX5HSgqytpCnamscDBGyCy86Tl5/jmZC0mPkzcEEHJqBc/SO+STvkHn
	 gdWeyHSsrMqgnwPD8fLzJ+XQKbf31hrXqbprHbUE6m3LPIfFUWKO2ktf2/4brJcH6SKD/
	 xuTkGqV628WR07qcMPb1lr2+li4M7GkB7s3q0IB6pGtL9xYeZCVM6LBNiIl0gohGNLxmV
	 WDbcE7LacIhCYjZ4NN8W8Bmi6yIqxEV3sM4wAwV8qCsVFuzDtD4Y+NFgMT5sH55vsYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B67606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B67606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4b21f71613fso1190168b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792437426; x=1793042226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEaJSEmFi7tdhNRRtiloMBCFCWtro6yzfl/zLHiT3pI=;
        b=fSeNzQRnAW4IKP4kSbBBVuq4cYW+bUP+uYb8nreQzuaPMgbvBuiRx6Fuhp+NrTXQWW
         Ut8Z5rhQWmMKqFnJ9riJxcBM3iYxrisvIlZ75yOP205wFxoBtZ1rSrTWTZ1MFk076PcP
         fUgiR3UjRUUjl8lPjmGbb/BG8dNhY2lLkDIf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437426; x=1793042226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEaJSEmFi7tdhNRRtiloMBCFCWtro6yzfl/zLHiT3pI=;
        b=uY1Lq65R/eBsCJ6JXSbX6pe8VQpWtqResrqJc3wBla7hw3Pnh/kNMeSALyNge3vEeH
         ahPsgmiOhg6bY/bHyMOu6HXmjNP6ltxaAfgmKMLARYqiu1tEDtvesG6Z5Ap75RsMYfte
         NGp8CJScARLNTihpe/oHM36YwzrsklR2KegBnJT1AoDJFHk/qXuePuYXi8qwn458jhDb
         +6L79pKUbmGarwCqTQ0Vk53URtkZKzRRKfbwIo3BwEuNffXhLYSgKuBM8tPQNQ0TZqDN
         HLmX7/BJjbMdebAHOFO9+mJfEP0hYPDx53Gz/r6PFvaJ2ub87Z+6DV5SdbK/YSjtnXQ2
         XxZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1LhWyCvZRVMsa6nZQQOGB8tWshVjmGpsuBtYXzqHzJHJvI01AQCbmflPXVFv25aq6JCsjWBfI+dsWDoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQJeJu6MSlo1Qpl8jtPGnw+ygeBcikEHQNfwsG6tZfUDJIhCmm
	EMbezibVvnxwcxH5ZTVdLurNPwwT/JGSrihinQXDOqI7sc+klS9QKDES4QoIBni8JWg=
X-Gm-Gg: AYBFou1/5fOAn14ht3/4vKqP/iXh7i//XbsOZpDtcELp5u4ZM4B2Z/1aOIg0XkZwlDx
	EBmMudotEwxxIEcEXTUPj35uVDHQ+lBCQIgZuleLMBfv2fRlO2e9vMjxIxoMfE/LI2csbndVsni
	hPBybXqOTeDiB3yn1GdhHdtKnELV4qcRwkuq5V+z4ix6uVhwLje76VnPmkt5XjiZxBodUIxyouJ
	NtgOGNDKgZ5LIb/JF98BJ5SpxU5bRls2Q3wyf/wnF242z1Van21s3k5FbAmg4VKjz7NN3B2fBH6
	dY8+ue0aC1hc+ZmKQKMbkA/qqr3gDiu9u9OkTtzhoQPZfpVhNkP63ETVaRnWIMVXWMl2imd+BOD
	226o5zv4H1tFDLwBQcjM6ulesWTsRmrvkd0h3YviHyXy6Zg90UklhpvTI3yOyGwcNGOITbkbtXN
	/nPlh7wmMvi/hUw/KCIXPxPSxjCZKNLKWb+LcAuLqhLi4ITgcwmIcFwIrnsMyBdiYIECu/3OLWl
	0pixy0=
X-Received: by 2002:a05:6808:1314:b0:4f6:243:cb9d with SMTP id 5614622812f47-53cd561fffdmr8117322b6e.61.1792437426202;
        Mon, 19 Oct 2026 12:17:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388c1654e9sm7396007b6e.8.2026.10.19.12.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:17:04 -0700 (PDT)
Message-ID: <bf13495a-0f70-4ce6-a2a5-77d6c1bee241@linuxfoundation.org>
Date: Mon, 19 Oct 2026 13:17:01 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vhci_hcd: time out unanswered unlink requests
To: Hongyu Xie <xiehongyu1@kylinos.cn>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org
Cc: i@zenithal.me, bgmerrell@novell.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com,
 syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com,
 syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261006125652.10296-1-xiehongyu1@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261006125652.10296-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 06:56, Hongyu Xie wrote:
> When the connection to the peer is alive, vhci_urb_dequeue() only queues
> a CMD_UNLINK PDU and relies on the peer to send RET_UNLINK (or
> RET_SUBMIT) before the unlinked URB is given back.  A peer that keeps
> the socket open but never answers therefore makes usb_kill_urb() wait
> forever.  The waiter is typically the hub work item, which runs with
> the shared address0_mutex held, so every later task that needs that
> mutex or the device lock chain - a second attach, usbfs open/release/
> ioctl, udev - piles up behind it and the whole USB stack wedges.
> 
> syzbot reports this shape in three long-lived bugs:
>    INFO: task hung in hub_port_init
>    INFO: task hung in hub_event
>    INFO: task hung in usbdev_release
> 
> Give every queued unlink request a deadline of its own and arm a
> per-device watchdog; when the watchdog fires, it tears the connection
> down through the existing error path (VDEV_EVENT_ERROR_TCP) if any
> request is still unanswered past its own deadline.  The teardown
> already knows how to give back every pending URB with -ENODEV, and a
> RET_UNLINK that arrives late (or never) after that is handled by the
> existing "already given back" paths.
> 
> The watchdog is cancelled whenever no request is outstanding.  Queueing
> a request re-arms it to that request's deadline, so the callback does
> not trust the timer's expiry: it re-checks the outstanding requests
> against their own deadlines under priv_lock and becomes a no-op when
> none has run out.  A peer that answers promptly is therefore unaffected.
> Controller removal quiesces the device first - the event handler
> stops the per-device rx/tx threads and drains the pending events -
> and only then calls timer_shutdown_sync(), which also waits for a
> watchdog callback that is already running, so the callback cannot
> touch the controller after it is freed.
> 
> A similar fix was proposed as an RFC by the syzbot assisted-fix
> pipeline; this version arms a single per-device watchdog instead of a
> timer per unlink request.

Did you test this change with a usbip_host and client? How does this
reproduce in a regular setup?

thanks,
-- Shuah
