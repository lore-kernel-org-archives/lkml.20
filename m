Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252604;
	b=XayTeDPLoZw1NyUR75+gQ5KglUFZ11X7fjHGHBFA9InAczXbHVPrMmDS6kxfMMv2xBno
	 kIBZHBFuKTop8ceI4+hSke5FcApPHvRJeB1iaSMjTY6xjDQ41hWmTguo1V9it3G4gHh4S
	 9gkInJe+D06N+kuUxIIscojF3K8lf2ExxNdaIQcYfQUe8KW0OIERfitkrwNSBB6AMC3BQ
	 QP0iLq8nIxHRLBsqUhqS0r92ge+501FoQj/6kgvHBMWLV0ZQ43207I4pHmKSXHVNea5nV
	 kAp5N5RTmWUdKGkzzqkdiTw/tfWuX2ok5Fbj/B2BWGaZPsWdL2od+VMwZT90zwy0MRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7f0x77VxeyFJGw1qnk2bYiIJYFod8edED4Dubqc7evo=;
	b=wum6FZa7EIXSHII99Sy4l6SxL3m+9VoX7dKUlf3PZDLT0wUdc+pG2P8kO+2fuRKOhW03
	 17grci1Z0cIc3hM2VVAUs6lrLij6eW8b/6UthZLpuWsbb49PT7NZBpPCHmgdKZ7mRvIJu
	 ncf1CcJkOK4JHvuo5Nq6RuFBKS5eXdsJnXHPbSDh6r/92nOF0Amo+Xm00BKlyhA6oijaq
	 /kUDz6/sfVzqNAEu0yOODpiuvDkdsIL/Xi1/GuoJXwceaaZVajxVkqWAs6nrd3Z+07xIF
	 NhQk7dzltkfzgiaSr5jSmbBHQfImD1hwIPC2dO8cl7pL9oVp7oduaTo3uLqsrfElS6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ia90E7Tz;
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C688606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C688606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ia90E7Tz
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-67a51292ce3so929394d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794252603; x=1794857403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7f0x77VxeyFJGw1qnk2bYiIJYFod8edED4Dubqc7evo=;
        b=ia90E7TzzP4W5ewEYifnFu4Vw/60EETCRbZ1ZN7zCjQZ9DwOY+zShtE01dTpFZ7F7l
         cgIc+GzVKY+S5kb3SCYdk2/enTfBeLArxcHEJuOv5tqq1TtxlF04qlkD55xJAnIpCTRk
         RbE3mdO//ZpZtgSF9n4H8mEcWpPO30yFMMaQAUfV/Wl3D52Mxrp80wLAE3Q1zv1Ho8cv
         DFhNxCLhp9m0/EsU6IPbiRCl9ZPCmdcMcOnKLAgwekPkN6m1+4PqfMl/VjL/LFkwh26M
         CAYxs/pt36j43RB44IdtSXWxsioiRBrhBl5zp1y1vaxzOCnWaU22Lvla2lZhHqFNKvha
         HtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794252603; x=1794857403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7f0x77VxeyFJGw1qnk2bYiIJYFod8edED4Dubqc7evo=;
        b=g0YfdFp11IBhRRr5mZtRpErEmLOGeLEftVoWolp+kRivF466Ozl+nzqCfIevIXKCWK
         xkEracGldLJYhTkoQZR74G14xWjEX4wLRFgm2ueIaJspbdXrTtjMFZgIpeEfk6VDVvoj
         a748FHwIGwVVbfvJR1hhEvjgPDau69loUbEQv6E7TgZgT6YnnBNHWFdSeivbtO6dwp6J
         FlNx8UyZXghPDyw8cVQsEEahG5uTELdl6m7yr7TtHtNiZLX9GuRMpm6zswcqr+CI4ICL
         MwxNQsewF6S78sph3x303b3dp1senYpFkwm348iqMbKl2OXmK+lPne6m2aI48KV8BKsd
         wXUg==
X-Forwarded-Encrypted: i=1; AL+hErHudC5wwWIOQ323z1gq1wBbQtLlogRReofBxxZ9Bh1ncSHKxrk1+ysi9wZ1zlU3v/T70XKlG/+6UBtO9Vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SIzQiudp0qVk7My3iofNpmDCtRFLn7UggwI8XdjDymwK0GEtp
	0lRZT2D6IjOGaEZQUNndg8Jm90O1e+HkLnfsl7lB21jCn2sADkwfjVoa
X-Gm-Gg: AYBFou1BVg/BjyVHKT9UXtPypvZYM0jrl5R3zGDNbUhJ2GE92Lb5HqcQ/Zji5qqXXYe
	dzeiMdjzgk0bZBX54Nbspq0bDdu5ypqSVQzcSnuUeJNn1ZRCa3xUBdmSbXngIKCC9t+GBy9E3Dp
	ZQIi9O2z16ugKN+T0NOXcLEX41AQWxUtte+8HChR3K3C6GsBg2m2BOE54MfHNhXyJ98DKh3WpF6
	+okBHsUzC+wuMzEd9kOyuw7900Xz3TRBsz2SJlaakLaOqB3EbbWwfohtBB8bibXs52+qLTFjW+S
	cAIvjEG7e1l1C51P0nmgS3D9JqULfiJDZJRMRklDWv8hKCMLsVdadZiawUywLTYVAVxIjDDNr87
	qZ/gU9cXmKrGv/L2hWk7WclTdL3qTxethkoBxzDiw1Cdq42qkVHLCBr6YIHw/IwA+IRjuKP060p
	L5QN/eL6xWpjT9TXj6A3nVcnzWGjOyLx404zl6Df6P+mE1smOOs5uSzpRzcF7akNGn8PE2vcjhS
	l4vVKwR3FhhWEoo95TNgpqdxqaEFplyNzmfWg9IotzGKFmbeTlbRA/x3WH0KOYHioATfgH4akKy
	fWEaJnECak7wqXo3BIlOY63kCgfGDSWnH90=
X-Received: by 2002:a05:690e:438d:b0:67b:e862:e228 with SMTP id 956f58d0204a3-67c568d26fbmr214564d50.86.1794252603311;
        Mon, 09 Nov 2026 11:30:03 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a201ddsm39422d50.21.2026.11.09.11.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:30:02 -0800 (PST)
Message-ID: <ee61d52b-e8bb-4504-a893-f9dc4036d615@gmail.com>
Date: Mon, 9 Nov 2026 14:30:01 -0500
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
Subject: Re: [PATCH 1/2] nvme-tcp: move the TLS record read loop into a helper
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20261109-nvme-tcp-live-ctrlrec-v1-0-47ba61670e65@gmail.com>
 <20261109-nvme-tcp-live-ctrlrec-v1-1-47ba61670e65@gmail.com>
 <sashiko-outbox-205465@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-205465@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 14:11, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> This problem wasn't introduced by this patch, but can passing the
unaligned
> char cbuf[] array as msg_control [1] cause unaligned struct cmsghdr
> accesses?

The report is correct. The char cbuf[CMSG_LEN(sizeof(char))] pattern
gives the buffer 1-byte alignment, and put_cmsg() and
tls_get_record_type() access it as a struct cmsghdr. The pattern exists
since commit 2837966ab2a8 ("nvme-tcp: control message handling for
recvmsg()"), and this series copies it into the two new receive paths.

v2 will add a first patch that declares the host buffers as a union
with struct cmsghdr, as sunrpc does in svcsock.c and xprtsock.c. The
new code in this series will use the same declaration. I will wait for
review of v1 before I post v2.

nvmet-tcp uses the same pattern in four places. I will fix it in a
separate patch.

Martin
