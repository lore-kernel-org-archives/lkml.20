Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849497;
	b=raG6tB+0hXEupuKQdWK1CkotYIg4pU7VU7YLv1hZ8OruhKKDiT++Wz0cyob3Jm3zuJU7
	 avZ/HPZgFDqQ9MGKoejBZU23xlr4+xUYehNMkO7fHOnDILkkioSXLGlEai+g9sLnGIXjq
	 3SJxqLd2uOR5YcQT+kuSNdYlIU1Vcl6uxYVKc5YkzJdctaDl8IrrGjwedt6xoeNf773am
	 0A6+vMDg2KbCG+kNv6mFkPN5hbFSmjRgByZYMkj/H7Uzw4LPQwTHUVLeuKYOvxXLabJVL
	 pZ8WKuS+AArF/wvtcm1S+J2rojWrRuRNyf+PXIHaGstxbgxjeGx7dJMaBSHE4vd0jwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849497;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=LWerrRCGilFIEdSeWDMQ/QarQ/xNtl32S40yOkwElRU=;
	b=W22RnHxI6Jur/Hmrd6yfnnJZoewKIhn2n5x6ummPrhjheQBrzygHq+66LqcEhJsQAv0l
	 lcsA3V9ckgLxAZL4wNvcT1Ubof5izOR2y6V0D4Fd/nur2Bd0f1semU/XQeAmTdHRsyOjL
	 sCSSpOdqcPzVbkYVjdw6ZzBzEv+S9Q+nB27Z6FUmO90bTKGViFccoNoW/IqUuvK8XJ8Yo
	 9QYYAWLLag1tdSgFW34CdEPEuZrqIqYQeoO1flDyY9Cy1Uqgf3FLrfGn16d0vsfdWMtZa
	 /XUm8rWKGdbvPAaiXw0K43v9Bar72c2wIZDeAE+EWyX66600V1Z/kllyvt8O7RFqGHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3325606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3325606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f8281066c4so1805150b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849496; x=1794454296;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LWerrRCGilFIEdSeWDMQ/QarQ/xNtl32S40yOkwElRU=;
        b=D1Bpn2EEYfp4GjQIPWW8lVgywHhEVN2aX7GG2vwQibkoR6cy9KRs/CYZgcoJMGR5oj
         PGhC5OVs8oYkPRpbk7ZrM1vAM/2V8AxSE6XIUaIT8RrUIjUoHmRhe1sgY16zWgRmw2hx
         h8mm+SJT3EVM3o8/m8Lj4sAW+dcbcTgA8GoLJfGm0P1uZSPNJ7t08X+VJH/0THAV2nap
         q1rAwi7K/oqoyi3BEAFCbkgla2Idm0H2vv9qkZEshiYf1ww46YVN88i+VqDY9kjvVawT
         2CCNN2EY0ZCqIQEQFDDM17CgpXVwPTO7QAaOUuDEl8d2Cy7uX5l5lsNYPnsvskHUzc/p
         tCrg==
X-Forwarded-Encrypted: i=1; AKwUvBwcJ8FPx5jR3NxNqfO76+er7VwyOxuyIYh4UuqAiebr9xk657k3YFXIjBH1GJ+/atlKEY2bqnoS3PExmc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xYAkiXdKw0kBklB2H/UG/9cBhEH6AfhCHotAe8lKfP6HKLftK
	qKSuvwt4/q/oE3gtLA96Nht3Y5W69Vu80gi2BqpR8B3zzQGlNds2huDLTSlbYBKvcdqP1KICOkM
	b0+al2lG6HBr8e/FmWXw1yll4UDWF8vi1SbYphj/mR+IJCxpLv1fZYOfbam8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe7:b0:4e0:1d24:cec1 with SMTP id
 5614622812f47-5640db0222amr14434462b6e.5.1793849495855; Wed, 04 Nov 2026
 19:31:35 -0800 (PST)
Date: Wed, 04 Nov 2026 19:31:35 -0800
In-Reply-To: <20261105033127.42105-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aebf897.3487765f.14a015.0003.GAE@google.com>
Subject: Re: [syzbot] [media?] [dri?] kernel BUG in sync_timeline_signal
From: syzbot <syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com>
To: eadavis@sina.com
Cc: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> From: Edward Aadm Davis <eadavis@sina.com>
>
> #syz test

"" does not look like a valid git branch or commit.

>
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index dd07d128adc3..4d885c8e1d4f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -320,8 +320,9 @@ static inline void dma_fence_put(struct dma_fence *fence)
>  static inline struct dma_fence *dma_fence_get(struct dma_fence *fence)
>  {
>  	if (fence)
> -		kref_get(&fence->refcount);
> -	return fence;
> +		if (kref_get_unless_zero(&fence->refcount))
> +			return fence;
> +	return NULL;
>  }
>  
>  /**
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 8df20b0218a9..ad60ad5e5cd9 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -221,7 +221,8 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>  		if (!timeline_fence_signaled(&pt->base))
>  			break;
>  
> -		dma_fence_get(&pt->base);
> +		if (!dma_fence_get(&pt->base))
> +			continue;
>  
>  		list_move_tail(&pt->link, &signalled);
>  		rb_erase(&pt->node, &obj->pt_tree);
