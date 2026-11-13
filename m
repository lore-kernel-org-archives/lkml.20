Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569650;
	b=uHu+rgHNSeflUANPR+Bkr94ZV/4k10SZGOs84m7DUWxQbe30PABKDS/onYGNv4bLlKtq
	 ZJUvXnkoEhzQUXUrlaF7dI+5GTWbWfCDL5UAaZOUmcQdCIqEXb89qmeidJdGhYJDXJWUH
	 U38rAoUk0pBwbNMVdnmG/5lCEJeUXqC9hn0jtY08UL/Y4kf+9QVoU+jz5TlKD0M0A6mAM
	 v2BYV2vRfgtfwdIJiwGoF+5et945i/MPwdbOGfBj6WL30C/XBG2xdQHrco2VLSXglWOhy
	 f/2USXS971zCEA26XqIWOisZWHF4FJIZaghExrnd32bLZ1mf6TJJog3gYRci9jVT8sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oIdNU+YTvpaI3LmefHUJ7igvr6HXe1LnOHaj9fZpjyY=;
	b=N6b13RG86BzQ9URWjCxxBQ/DFYbRbZR+SXAoLLaxndvbBUU3JIMSpgq8GRox/kXyk11T
	 9iQuN1w9A3IxZCXU4/8RO0diUJjXM+Stqf5eG7QiyPX/79GqFtUxRWqluSeVgOBmdsie6
	 LmBsE+BP2QTHG06xJ6vm4Q1MdbCzRitEdQIgVofBCbmN+Y+tcohlEcFImwK4k100Z7LN4
	 qlkfJQH6fBFsxvnAm1EzXQQs2eLeXmXu3TeBhTTzd7zF7CBnS+/JoYv6nt7loqgnSxhZ5
	 KOCcu19FAuYr4awi/66wXw9UoQUk46vU0EhIrYnkIMJZHFEK19NIS/f+bG13wfRmtXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JnCoTw/t";
	arc=none smtp.remote-ip=74.125.224.137
Received: from mail-yx2-f9.google.com (mail-yx2-f9.google.com [74.125.224.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD9606A89B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAD9606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JnCoTw/t
Received: by mail-yx2-f9.google.com with SMTP id 00721157ae682-8b32645bf56so2099677b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794569649; x=1795174449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIdNU+YTvpaI3LmefHUJ7igvr6HXe1LnOHaj9fZpjyY=;
        b=JnCoTw/tSrUxuvMZtqMSu+il3ucnqIIjqr+WdAAyzwqwTJMwVAwlAcKCq89RkTJpMC
         ib+I7kqXuOl04LSPfPZDNQN6WOPidJFKsl7X6KyRHSrLAJ9UuSoPrB0KulZs/vWmUAc4
         4CRFbz+xtE0lat95spUidjYe1vxZAZkE5F3dnggXCMPnYdnlRfSGt9lgj02k4OzUcJ/n
         zS2vKy0DXHIIWhOal2Twj/oDt2KvK5/SS4JNWqmCNmyk+6Qy/SrpTsB0OxsjOpy5QpgP
         z9KpZ5IWzY2cCagceQyXW5WOTqqi8ZyUBiRlvkhZ7PiycpQ3omd5C3g6rAgoKx0HWLw/
         MAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569649; x=1795174449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIdNU+YTvpaI3LmefHUJ7igvr6HXe1LnOHaj9fZpjyY=;
        b=xFJfJXiP/KvBwpRf/UffZ78V8/7SoJKvDT0tYvQE/xLyfKkLxXcL+vE0yH/oygw8y0
         fUD/un5gYCv1uSDGjrbfHtDag5rdGjn+PTNLjKqTlwrOx6+UbecdQeCYICp9IBV1FWw4
         xLu93Xgm0GZpmTGcXx30xh0L0dKjSdRJUEXNkhsNy7b2sGoGX/kqtTdZxnh0FaRuu1rN
         StjNBstLD5tK96DcTWg/wJwrCqmk69LHA1pEh4B+dMCbJkwT/Pblu+ir7fETKk91H0yE
         vjfimj/NhGGaFQ1rVSceIYRkCSzCK5aWy5GkJaBzTBYvlU8xsyAPr8+riM9hfmXlvBRB
         8K7g==
X-Forwarded-Encrypted: i=1; AL+hErFGeJpIpNu8ZMzz615LR/f3IT9ZEcSh7dDzjuhLIPLMoZEF91mS3kMl80tjqbPt+Rs/RDb3qU6gaGnE0Ig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FThmrb9jQRTyU9MTcl8tBOPa9VFSmCR5RHarGxJ4G7TEmboKA
	hsHEXgeJm9hQgHKyJy6nQAE6tUwyV8sUf/9UkyB/1tlNR6S8qXsLTZLH
X-Gm-Gg: AYBFou2SckM5ADXZHcbTj0YfxzfmcFI04i83n2/q18hfa4VS71x0v3NunjxQGk/6K+T
	shT4W9UKvMn/4//18RQP6vz/+g2zo5wq+j0nS9qyX591ZovXSIBgl160bQqmKaJYYpfAlSfrzmj
	Uu1/D0+WJgJx80JKuspmXMmdRDammpKddGAbSeqg4Wz6uOoyRbn14fv9IGmsWvZMHJ9fY7FFzsX
	XMUY6QviE/1Sn958yQ6ufWHMFJZRBxGe9Ii7yUIGMPHOA9NbXL+vk4Iq6UtLJmysygN5S8mttn1
	JAVjHO/IfcDhoowEbHq61zJWoq365rsfQhkYfHYD9dhbT65j8idB0aOC2eq3JAl5Dz46zTszU4X
	8/TF6OGk8QSM7VLxl9/QqLXf/fTzFoHuaFG13uyii39o3NY5mxA076ypf1Uv7xann4ByT3Ecp5/
	mUiRRorU2zR6Bigis3lsJcAWpIAILkXXlnUlds12AmsSpk/YYpxG0xLYnLUnbhorMy0mVHZKBMh
	ntohOAZDmC35t02eu6HqPjQeKynbz7SI1sRRjx/AyIwfhWfNQHGg2mt9FaAoK1UZqGa2KfqDOci
	PquD5q2VZ/h/DmXfA7WCLRudhzpDX8oTvhHf
X-Received: by 2002:a05:690c:e215:20b0:8b3:7782:675f with SMTP id 00721157ae682-8b4aa2a239emr7986187b3.66.1794569649432;
        Fri, 13 Nov 2026 03:34:09 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9a7db2sm17420907b3.30.2026.11.13.03.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 03:34:08 -0800 (PST)
Message-ID: <bc96a186-5a19-4896-8465-ccd1df5a33bf@gmail.com>
Date: Fri, 13 Nov 2026 06:34:06 -0500
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
Subject: Re: [PATCH v2 1/3] nvme-tcp: use an aligned buffer for the TLS record
 type
To: David Laight <david.laight.linux@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Hannes Reinecke <hare@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, Martin Belanger <martin.belanger@dell.com>,
 stable@vger.kernel.org
References: <20261111-nvme-tcp-live-ctrlrec-v2-0-6295202b84de@gmail.com>
 <20261111-nvme-tcp-live-ctrlrec-v2-1-6295202b84de@gmail.com>
 <20261112223707.3bf1e1a6@pumpkin>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <20261112223707.3bf1e1a6@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/26 17:37, David Laight wrote:
> Is that right?
> You are changing something that was CMSG_LEN(1) to one of CMSG_SPACE(1).
>
> I've a feeling it would be right if it was a struct, not a union.

I think the union is right. buf[] covers the whole control message:
the header, the data and the padding. CMSG_SPACE(1) already includes
sizeof(struct cmsghdr). The cmsghdr member only gives the buffer its
alignment. With a struct, the header would be counted twice.

On x86_64, CMSG_LEN(1) is 17 and CMSG_SPACE(1) is 24. The union is 24
bytes with 8-byte alignment. put_cmsg() writes CMSG_LEN(1) bytes and
sets cmsg_len to 17, as before. It then advances msg_control by
min(CMSG_SPACE(1), msg_controllen), so CMSG_SPACE() is the size it
expects.

This is the form that cmsg(3) documents, and the kernel already uses
it:

- net/sunrpc/svcsock.c, svc_tcp_recv_cmsg(), and
  net/sunrpc/xprtsock.c, xs_sock_recv_cmsg(): the same union, for
  the same TLS record type
- arch/um/os-Linux/file.c, arch/um/os-Linux/skas/process.c and
  arch/um/kernel/skas/stub.c: the same union for SCM_RIGHTS

The commit message of 1/3 names xs_tls_read_record(). The function
is xs_sock_recv_cmsg(). I will fix it in the next version, if there
is one.

> Did you test it?
> Or even compile it and compare the two object files.

Yes. I tested v2 and v3 with TLS records that carry no application
data, before the ICResp and on a live queue. These records go through
this buffer.

I also compared tcp.o before and after 1/3 (x86_64, gcc 15.2). Before,
cbuf is at %rsp+0x77 in nvme_tcp_recv_icresp() and at %rsp+0x7f in
nvme_tcp_skip_tls_record(). The stack pointer is only 8-byte aligned,
so the struct cmsghdr is not aligned, and put_cmsg() writes cmsg_len
to an unaligned address. After, the buffer is at %rsp+0x80 and the
stack is aligned to 16 bytes. msg_controllen changes from 17 to 24.
The other differences are register allocation and stack layout.

v3 has the same change in 1/3.

Martin
