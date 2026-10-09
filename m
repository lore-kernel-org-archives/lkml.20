Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191134D9F6E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546517; cv=none; b=K4N9a+zFptzZtXtOT7tQFGFvcmPzufqLYhNMaBl2aH/klqCHhylGoR2YYKChg96HuRmcOYTCALHQORr2KJfOk+EOwiVHvpgivoUbYhRjLUc5bl3rBChwvMUR26vQ31q5EOB6aQhZ/OX3pQ+8/2CVc/dO0AumywO0ZtWs9df2FBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546517; c=relaxed/simple;
	bh=L9Mu6TVdRZKeFQK7WH9Q7loQktaaTwQONlQN9eWWY/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWWEQTHwxpgfaN6ZOJQ+ODyVvntzQLX7FU7CGWzdgJs32s7BA92CEiUwrkzuIR9nG/fU/cFiuNkxzv9GylmWdqo1lVc3+ZwXVkDS5IWbC6ADv7tvgbo903pgUFLcQ914kALkUuqbQDrTswBhb5vsD0h1jAwRDQcMkMsag8Hb14w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmiVd6Q/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmiVd6Q/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso28536635e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791546508; x=1792151308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCCGgGZDQeI7my+YCg9m6LCCcgGyvTNAraqlhrrWfdo=;
        b=jmiVd6Q/pGd9ExvpB7Y527Mdro2HSD2UetYFVdqiNXyvEdzjxYYfx6a0/TEhu2OZ26
         bLGShUFLppW8HvXwJ64oU6nOqVMCHJPQvWqZgwnxqpgjXgoQ88cOI4EHbInwwZWuY8LM
         5C3c5bMYI1FxoGUxacCzZ0ZlTDtp51C+iRp6hqYKzZf70p6y9Hh4B2CtSGuswUHQ71Go
         w3aN9BuGbqY2OWKTCQlcEag6TRQuqtdPSv84WsgZdKzgswIM5j472uzn9gg+/NG9vp1v
         EroVq4Bi27fXhGh4yquNPw2Qh0PzifvEbdhctRyWPdkCl1gTI7l5uCqTzyqy4VtTDlPA
         YW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546508; x=1792151308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCCGgGZDQeI7my+YCg9m6LCCcgGyvTNAraqlhrrWfdo=;
        b=dNwofVLccbytC3OJ95KK3sBwMjUNNWr4xrEqVO7Lz54LmqfYFe7JmYc8gYdm5T5zik
         fzY3UIFT6xpVtBytI6CJl9yilQFa2K4UyBXceeiF4ey9DSJRc/lIr+nDJ+FlsE3PoCtE
         6FAICUP0s4h5KfwL3OsRVZ8h/Il/BsIUrs1YYb6fDRX7lBiC6P9grFFIAPP+x3F+P5+2
         2pkRQeH8JXJmdqCat1E4ouA46HxR2CuRTNnGkn4DrdQRTwvVTUpn5btT0/UAh8+MnuXA
         5LDgYFYaQxB0zqUb6MMqDz6ifZ+4FIjP/ejqULBTltbXEimP1+3eHMPtjPQ7ZwNRkYsA
         lY8g==
X-Forwarded-Encrypted: i=1; AKwUvByYK3GolEFKsA938GOA9iKTLjIjUd2ZlUrmMMf0zueBkUY13yxXUVY4jYbq0TcRexZdbdovoAf3Izkq4yg=@vger.kernel.org
X-Gm-Message-State: AFuF++lQGw7XUAi5dKdIyWCP7bZuVrOdFFri150tJ9T04AepQ/qi8/Ib
	2GihjnJ7CcgDJQPbPlA1lkoglh5MyNzNKGFAGxpJpN1uDCxcWYzHo3it
X-Gm-Gg: AYBFou1enlCLj36wV3pUT6XoaikbVLfiX7hObOIBnYBT8RoyxEsawUEneFyksDdPtoO
	MpbiId1/lbQyqsjkwmZeqfOp4JvIa5KZiElioOPxuuKHKYYr3yr8DIv2cjISZZiaQIEawjpt/1t
	G68hmOstfylZgRjdWMD4bEwF62GqRHQ5sy6hmrv4wlUPVTFQ+T9vr4FiotNMyPnqnECPUQH6ZJs
	h6x5YuV5VLNl5ybkPfKaWfLECeD3bujKvzZhb1FP+NkkK4d4vOYmmfJbO0i4TdL43D0Xw97GgaY
	IWvig9wnhh5oI3+OrgaNF1cxCPF9HIPHlOZm7dwyfAfLvh2rMmGpvnd4QDK4WL82fNLT1MpOD/Y
	uRJ1rQtI8HmX68JZB5KgpakddKsUFeCicF3utqwYQYI/B2ekAKiDoeUzZSg9iLtUfvsUCjagaSa
	Wf9fbLYm+tQr/ctXDfbmhw8vi03qUdGWlqLyra7TPHL0EeZqddjyjQSqi4x8pjYJ9Up4/qc/36X
	/bGPU+1E3CXf+94hPCn5Hn+GoRSblb2jeSb0LAJ+JCSp3Riy6jx822+AywlLx94XhvmWoPO3jwl
	nw9iL3p5sG8LTKQFV3gF9M/i8w+fyHb1Yn0y0bC8OLgWGJFa
X-Received: by 2002:a05:600c:3f06:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-4a18e4a3bfbmr34261435e9.8.1791546508147;
        Fri, 09 Oct 2026 04:48:28 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm77399465e9.6.2026.10.09.04.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:48:27 -0700 (PDT)
Message-ID: <803bf4ba-78d8-4896-affc-7d4df5c9d50b@gmail.com>
Date: Fri, 9 Oct 2026 12:48:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/cmd_net: prevent infinite retry loop on
 unextractable timestamp skb
To: Bui Viet Dung <dungvn2345@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Willem de Bruijn <willemb@google.com>, lollipopkit <a@lolli.tech>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20b406ac-94ec-4b0f-a307-08082092ae08@gmail.com>
 <6ac7afc4.cf15ae49.1a8a2a.2a55@mx.google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <6ac7afc4.cf15ae49.1a8a2a.2a55@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 15:59, Bui Viet Dung wrote:
> On Thu, Oct 8, 2026 at 3:43 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
>> Sounds fine since there are only timestamp skbs in this list, do
>> you have a test case?
> 
> Hi Pavel,
> 
> Thanks for the review.
> 
> The issue was spotted during code inspection of the error handling path
> in io_uring_cmd_timestamp(): specifically when skb_get_tx_timestamp() returns
> a negative error (e.g. -ENOENT due to missing PHC bindings with
> SOF_TIMESTAMPING_BIND_PHC or unavailable timestamp data). Since the
> multishot apoll remains armed on EPOLLERR and the unhandled skb is spliced
> back onto the head of sk_error_queue, it immediately re-triggers the command
> in a tight busy-loop.

Thanks, I can take a look tomorrow.

> Below is a standalone test program demonstrating the TX_TIMESTAMP command
> setup and execution with CQE32:
...> If desired, I can format this into a test case for liburing under
> test/timestamp.c.

That's always appreciated!

-- 
Pavel Begunkov

