Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDEC2F8E9E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536583; cv=none; b=lJPMsJCnqLVIeQqwi7bisAypoN/Z+5l3/4U1CE8opkawCQtFCHqX4HsP/za1i+2MDMOQfo9MrxDCFLz/uNsQIuT1b+n5OQRkRmVYoy6WPVh+g2X5u/eGWKDl9y8BVFrMfw+iS1UAv/fRI+KR6f1yV3L91G8fP2238oFZHmN2npQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536583; c=relaxed/simple;
	bh=T0JUWRzx57iOTA1KZI2poUKNYg5hQ2DvWkFi/iwU020=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WER0TISgLm2tpd457K8CzxrokZtDszsqeErevGSf5pU2UfuPwzDNX//7Kgq2BZoBgYVo2kUZbe2IpDgSYNVbMG6RyrNKjUobx6I+y7rNw7Lko+e5sfCPEeDpJqHoXo5pIuSHhZIwYLWuNH3itxApjwAGvkj7DhhxF1MrQAvLVAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgFPX2Sh; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgFPX2Sh"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b021dbso699554f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536579; x=1791141379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LP3SPyinwD8fn1a8RK+gsX1s+9bGZ+MpdPQLG7wq3ns=;
        b=PgFPX2Shy2UiLP3eP0qxk5y+ogjxxsN45w/3pj7qsPUMaAepJftHkpsF/A5scnCqo6
         baf+x7GXYXBP/jC10fV9HhDhK09eM8eIhCsihJeGu3qKWHSiCdBADEtMpEikX766TFX3
         8EPGOkQ7TUoWmv3APZpnNVmB8ObG9UwhAGc18iG1ngdOktZaeXug8b0pjns1JrGX4V0R
         FkzfnmizYZCPjLajLYfc8GtngirIrZF05Q7L7gQkHl/QXld/SjK1vr/eMhSY58t4aF2t
         zv4IplIyXiOXXi9/2ptTlYDCCaVEXGonuTFN7IMIuNwBpyX20OnugSwGzS9sbqm2Gr7S
         28YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536579; x=1791141379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LP3SPyinwD8fn1a8RK+gsX1s+9bGZ+MpdPQLG7wq3ns=;
        b=pCBiS+AGvYpmQKMVszgPED066wNbpFiuhixJX4kwBTJcUWyBeUxyfgtUbHmTDJm5Gp
         W1qhTaOGfa6F8yqgyHXsTersjlX+2+ajB8LXoYdw2jHI+g9K6Q6B4v04M59NZpXf8p1t
         jgKiCQktZIDAmhbZ/UEu+FycgR6zipvmqlt7/DQEL5BEOj4V0mIntf2MBtmqd2d64w71
         GpDm01ovX81YOM108BFdJe7AkL9G7Y1gHGShrCrit4elHA7pphWk0P6YMdEtEiEKBo4s
         J/4jc1DaC+1iLNRS22xyMsKx7ciuTeWiaOBb59vHLkOid+CNFS2r56pCn1+kHVPN4SYt
         XLoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0mxiLtQJK4/hOmAHSxXjtilzBijEo8krkUfqnHldLbpKPAETQxndbHSfICZSSQp1jjEhhpfGctWY/a/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k9bRn2m/jOL/QuHB4KYyiw4C1tY9y3y+VxNtFq+XJ2KnLboUOQ
	nDCl0zcgXf70Dz1QB+7c/8qmmRFEgHf9NA4rlvCkoKMgTEPRCBCI3TCvqDJVCw==
X-Gm-Gg: AYBFou1+Fs2FUIg/0WxoTb/uYz81bDJgefqRbiAmJQuPNo+2bKW/UnQzAQDVzpV0rBu
	1dX5nPkLun+3NZ4gWaEJM2LrGa2OnaSdXQfYyMQN/pN+htiy3KBUJ2YmHQHq6y6vWi/erew6nI7
	+n8FuqNUoDm2Q5Djdl9uWWRQhCZL3rw+OfUZHqxL7WoGUedJ7HQ7+4F3cMKkqci+QVT56uxZJYC
	8Ve6JcvOwJvyQnCg9vBIvKJODPDWBF/F9e/fzFi0rLrMdt9kyGlZieyT03VV4mAB5YblJGdkP6C
	jDA6qfXNYH4gc/4JYYnzCASuYvE9nJ9n4SN+LK7xzRQQ6EvXzqWpDnhZX1TVAMd9nJEw9AJGLcg
	7mtcmGYC/un4szZVoDDGPEKCEm+ydz5fYHN/OA4TCF7WU6LWIKlnTyX9TUYYpR8rc/3UxBkHh6V
	d62Gi0kR8spZIV9szuJt737zPcqwNbmLMhb98zpv44EIXmLzNSxf2UMibG5hpLWuywQi16ElrJ8
	noblEIRnLWKBWLTlvcE3zaxYzOS2eDprjoU/W13aH0lw3BVM8s3KrMHbS2l3EBjs9dhpPY2CiqD
	EhXnxprs9xdNIgJAxhI32+CgSnPsthP56e4tpTwjBxAoOPnc
X-Received: by 2002:a05:600c:468d:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-49ff9d1e6b1mr76692205e9.17.1790536579591;
        Sun, 27 Sep 2026 12:16:19 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018e6dcbsm75325005e9.6.2026.09.27.12.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 12:16:18 -0700 (PDT)
Message-ID: <e2e61157-896f-46a2-8c85-8e64b4cdb004@gmail.com>
Date: Sun, 27 Sep 2026 20:16:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/cmd_net: end TX_TIMESTAMP multishot when the CQ
 is full
To: lollipopkit <a@lolli.tech>, Jens Axboe <axboe@kernel.dk>
Cc: Willem de Bruijn <willemb@google.com>, io-uring@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260927074206.65427-1-a@lolli.tech>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260927074206.65427-1-a@lolli.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/27/26 08:42, lollipopkit wrote:
> SOCKET_URING_OP_TX_TIMESTAMP arms an EPOLLERR apoll multishot and, on
> each error queue edge, posts one 32 byte aux CQE per timestamp skb. Aux
> CQEs have no overflow backing, so io_uring_cmd_post_mshot_cqe32() fails
> once the CQ ring is full. The loop then stops, splices the unprocessed
> skbs back onto sk_error_queue and returns -EAGAIN.
...>   static int io_uring_cmd_timestamp(struct socket *sock,
> @@ -135,7 +137,8 @@ static int io_uring_cmd_timestamp(struct socket *sock,
>   		skb = skb_peek(&list);
>   		if (!skb)
>   			break;
> -		if (!io_process_timestamp_skb(cmd, sk, skb, issue_flags))
> +		ret = io_process_timestamp_skb(cmd, sk, skb, issue_flags);
> +		if (ret)
>   			break;
>   		__skb_dequeue(&list);
>   		consume_skb(skb);
> @@ -145,6 +148,12 @@ static int io_uring_cmd_timestamp(struct socket *sock,
>   		scoped_guard(spinlock_irqsave, &q->lock)
>   			skb_queue_splice(&list, q);
>   	}
> +	/*
> +	 * Aux CQEs cannot overflow and the poll is edge triggered, so nothing
> +	 * re-runs the command once the CQ drains. End the multishot instead.
> +	 */
> +	if (ret == -ENOBUFS)
> +		return -ENOBUFS;

I'd make it a 3-state return instead of relying on
skb_get_tx_timestamp() not returning specific error codes, but it
should be fine for now.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

>   	return -EAGAIN;
>   }
>   
> 
> base-commit: a3bdf68feecc57af5c11fb599f860ac9790ffad9

-- 
Pavel Begunkov

