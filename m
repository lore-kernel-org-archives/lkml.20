Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974196;
	b=RqtIA+SKV3j2gapGiyOyi9H0vXPd78/pDIbe+ESzYykqOJO4a2t9QmIvqaRGRVjesv/+
	 6cqRFe5Bx4yN3myWgEqQtGdBo/+RWyn8TZDifrartCd+A/Ve/kDcVuNo/iIKhLNw0+402
	 S15YCcG0+OsxMqwaEprIZjU+ekFiMTDhUu4LcF6lXVp9Jpul/O6JfSNAVF6B/hLzBYzUX
	 NVGKOlHf2ppJsI5600buOJZGatxlro0bhoaJi/8Pnm1H1sY+XTNIk1jItDNNxI8c7ZtRX
	 hRbQxhJVpLD9O4vbm9kwrNoKIl0UoyUnSGEJcJwvP/K9aIPTKQPaudKopN2kLmM/fYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LoxS/LnZX03KsQjK2OutNjRXX+iWailJTk3FM6xlJwg=;
	b=ZnEecAx76D3fo80D3RSJr6JbW0HN1dqv7c6JD69Zs4hhs7RwqGteMHJE+s2LkVs3Vq5g
	 0+3iEkeRGwkfImKQnkmK8dZ+YK9atzwORB84TYl/5e3O8bH/lxNlq/aKbZjDStqFIDcdh
	 W+lr9DwcgE52U0J/OFVyg7ucE+4QIH5lMLcEQt07cgSLpguDwXYfOttKhggpfxHYiotMc
	 J1/PsPZYC9gU9cWU5mTMNqgM6BZPEDdrjJnwlOJ972ZYTRcaCIqaBu706AOV++jldVFkH
	 m1ZDLR6PGrzq9O3R0iuGpyO6vxb0u1Iy6+rD0KsM5wDmbYVx04cDEj4q+dqI5u9tf2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dVEQik+K;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B415606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B415606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dVEQik+K
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so649165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793974195; x=1794578995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoxS/LnZX03KsQjK2OutNjRXX+iWailJTk3FM6xlJwg=;
        b=dVEQik+KayDMLAFXhqElYpWqBjK4Rk+2rLsKuWO7wBwCdUQGFIrdwzFTM/FNj46+0a
         V/1kiLJqo7fwDGNErvGqd8HvXbqUSyXqqaM55T49DNyYzXOJlMiERqE/DiCMBx1yZcMD
         j0f9rVkgChfBDcMQxlZnndSCJeFlDu2UVU6+bXYMQF0ekCWcWadgYMyyaBvoxiXc/GT9
         QEvPmtvQ7mPkM1bXUPFteCH2le0xVNEoDKXoMMyGOq/aqQXuO1ipxa3Ju2/0XWJiIlvv
         xqZmFoNDlXLyaLl4xu1Ha/deyjaT4uhydRj6NrJRakIUjBXht3zkn+p4PKVb79YnEpUL
         /Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974195; x=1794578995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LoxS/LnZX03KsQjK2OutNjRXX+iWailJTk3FM6xlJwg=;
        b=O+7FIHbIgYdFJMoxRTeXoUgZw9XHkwUzDmCW5uttIVK84UW5TgaaZokgt8SypsvHum
         XTj28tryU5v/81LJ//Nxno62Naa05+Vm4xPLVFO+6jgTzqdntwl2Igxzre1e+rKPKRLi
         HelShOYGzMtQam2yMpGjn0h85PiB550VKGjrOxYBqS+f4bDoEox4fIjgIOUgakV0g1s3
         d6QJnBJbeTWOAYqXMTwsGIrrP8vXRlJUOdzWXMF/FoKFeLuIgFOyniJqsgVBs+Oi51JC
         qFp6/23mAb0hwBBKS2sx5/lLiB9oXLRsXaPeQiBI6iDOG89unBrgcFzil1qXnd9lnrbk
         HuWg==
X-Forwarded-Encrypted: i=1; AKwUvBz5aBPi6KVO2QZZ5I/QnhIUb/DBd+2QI4+PRiTAdroUkwxBnxWB57Fj47HfeeTYJ0wb0v+iaGsrPhyqCHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QGKo1SAb2D+u3w4EHH+/3Rt/b1OSRdGbrrb6xEu9XCKU3iNA+
	22/qIOT9k8dUOSwP0poT2028w9xKzDW8mpJLlKWNsJ+RjbwNpPxeC3r24RkIH8/H2qGzy0jUUrP
	Sk4FQs0s=
X-Gm-Gg: AYBFou3W/EKiLFa73WaFDRGX6KLE9iCg3Vuw9RM2cEPYahPgGwBiY5ZebM3PSYjdKp0
	L3MUkzlQ+HKndX4AJVDsF1Wco+w8Q3xZcwawYiSjyz4ceOrLyJkhanJS3RaF2okyYbpna4T5HJQ
	Z5rqvmmNExx63MXFDBxYoAD6FZpAa9UiUf/P6t4YXN/Tr8s/XEBRfE8zivSaZ8Dynql/9oDSJO7
	RKCs0dvax7jQPGE1A3N6nzkr3PPyqLU0v5yKWp8j8oacGd15qaqt/DmK7jKnbsRyOZ3mq2R9Z0k
	WS+Ktmfr9XQoTXkFqj8kqKag6T8616t/cMImXqUU5kMUxFDoRSzOwD3w+HEHR5uu43hQipMLYTP
	G6CqbHzxPvs8hUD/g8zKDJCvTgWdeXwGLkf6Q5l5Rn5wmEEPdYqZT6MMSfh4pMv9Tb2u2kc9iMJ
	OVrqGUZ7RkEdo9RmNt/k+QLJ6o6fvtQh2Q9S9AyAP3bbnyRthjOSqC4Wcz5kktiUHSr9HP1UqrN
	djBsNz8BTgH/eeC0l8PoXRZ4k97muVdovoWoTxIIdcVrG6hY2UaWYmLjcJIfdJNXgpreRCU8ajR
	Z7tudnBZIIm4y98k+ZFSqdlEAWY9Zmnirg==
X-Received: by 2002:a05:600c:6d8f:b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4b6d82b2c85mr35660945e9.0.1793974194725;
        Fri, 06 Nov 2026 06:09:54 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm7002021c88.19.2026.11.06.06.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 06:09:53 -0800 (PST)
Message-ID: <3f975e52-ae09-4f5c-96a5-10629577ce04@suse.com>
Date: Fri, 6 Nov 2026 22:09:47 +0800
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
Subject: Re: [RFC PATCH v5 0/4] migrates ocfs2 DIO from buffer_head to iomap
To: Christoph Hellwig <hch@lst.de>
Cc: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105071930.16399-1-heming.zhao@suse.com>
 <20261106104617.GA5746@lst.de>
Content-Language: en-US
From: Heming Zhao <heming.zhao@suse.com>
In-Reply-To: <20261106104617.GA5746@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 18:46, Christoph Hellwig wrote:
> s/migrates/migrate/ I think.
> 
> On Thu, Nov 05, 2026 at 03:19:24PM +0800, Heming Zhao wrote:
>> To simplify iomap development, we currently adopt the simplest approach:
>> retaining the buffer_head style, where only one cluster is allocated
>> per iomap_begin() call.
> 
> Do you mean you'd otherwise need changes to the core iomap code?
> Or do I misunderstand the sentence.
> 

Apologies for my English.
"To simplify iomap development" should be "To simplify ocfs2 iomap development".

Because the ocfs2 buffer_head path uses "struct ocfs2_dio_write_ctxt *dwc"
to pass dio unwritten info from the dio get_block phase (ocfs2_dio_wr_get_block())
to the end_io phase (ocfs2_dio_end_io_write()).

However, iomap clears iocb->private before the iomap_dio_ops end_io callback,
which makes it impossible to reuse the current ocfs2 buffer_head end_io function.

- Heming
