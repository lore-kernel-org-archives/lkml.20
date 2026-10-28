Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200779;
	b=Upshp00q220cIZrN4HVBJDuoMztIZBwXbHIRznjiG5I5M7VHWIGplNMi1I7C+jVS6Apz
	 gf9yRpWWp/ksYmJKZpwYH0gbNScDnK2cC+feeNs1yGe1aBob4FgB4kMSwcYTls6w6EbSe
	 cMzlJ/tiC/WHB2TRuYfLlEUGGkWLH5GZpIxF0oWgSPWOtf69xH1zQt2t34fTW7RahVwut
	 WSoE3fgHfqPj8AnoEs1OnhgUmHmj6aH9pbaRfhInRRNjct3sUG+/ISwgHRqX9s/G7uQkb
	 394y2HuhAPFVmkMOt8+xNVvi8O2XNPcSkDJ8z7Q9k1rVuzgdddoAnVqQILLMm9/GLMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iReJ63N40uvhp96+KeukleF6Ru8p5xLQflMjZYr/Acw=;
	b=T9XQMNcPNM1HWncb6u0Qbrk9OsRt7QXxLwnPYEQPoR5UiXDvDWbjgTe9+yh0BwmMEZ+A
	 ICTM1darhMl9cZ3jPpvCV3Vsb6JqCoDUGF3YMIPzgO3A3FRGQEbpg3a9f9MWXNQ//oav8
	 t8ffnrbM9+jVtdTInGgWD/cSCrESHwO41w3YrzfvFprwRb1T1/bY4v51rDhqAAKLjEyEP
	 WyKzimn4orlCDmw8ZxDPkQhfjGG2rqWYa265yac9q7BSzTmIPuahw3NxU4XjsVXpxA2rN
	 uVaQHxe/e4C41cs82zKQVoASx4XJlS6gKHu1kOZvX9we+BqyAe/4vVjPC6krsYu+XYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzaFxjwH;
	arc=none smtp.remote-ip=74.125.224.131
Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A82606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A82606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzaFxjwH
Received: by mail-yx2-f3.google.com with SMTP id 00721157ae682-8a72cead747so3823867b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793200778; x=1793805578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iReJ63N40uvhp96+KeukleF6Ru8p5xLQflMjZYr/Acw=;
        b=WzaFxjwHUkZRP78AKN1ZxS1P5PCKI94qPA9TfietW5naO0RswhElbxqI7thw8t9sh+
         jDJaDssemB+1/BX16qugTorsRjLnmm3BiBx+xKFN0yHsB8yjhAAOBztwV+NVtmxngHZB
         jjScHUOw6p+1bapPoS1PKqozcG6/gr1lSgQPIbz9tBjnNhpIoFcpyjdtVgWwwJBCTOvs
         zuZNjw4/k6S2BqyNDxfRE2WjmlwZ4KMkr32nyZV7VtifNaF+qJfq/rXKG3T7uivmXiQ9
         SJU94fs19Qa2FJsx3d2d0RFmpkqYhUZC9pJepH0hcilGWHUzecM8Ku85R7F7I27Sz7Y+
         f1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200778; x=1793805578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iReJ63N40uvhp96+KeukleF6Ru8p5xLQflMjZYr/Acw=;
        b=KslCs2R5lQD8XOCZCwpAGXor0T2A0ZEgsv3kF9/977dmk0dp4vZxBo3GbNC31eZrWb
         2DYx+fQsJln6eHrxoYBcqRHBitkw+IvdzwV4RqjDsOC87ajhkzlqD8jlr0uFkxuv3BRF
         i2ZGW/AcBg7dsBFS2aa4QXI/+mmiHBhE85l9Krx4aKin6+Dh8/5Zp+FTOTy+tL+4CUf4
         yuL8SB/0NYQUiTGcq2wzW0c3hMxOF1dVjnvE6VVyvJUbm3lXFPJvgBAN60S7Bs4VzBuZ
         3iQxaZ549QJfHlr4R0RRTOtbX+ah/qF/vlp6F3eG1dvr273tkl7E4sAke40KTYifAv4S
         Ivww==
X-Forwarded-Encrypted: i=1; AKwUvBzVjJ0qXqtcX1VNBL3Uge2z1QeBRwL5XBjXojWflKEHAGIrqG3YGVk/swqLkQzm2a9Yp1vutRrLoEUTkr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIqEqHj8hG/eJ9ZV9GmX17klvMQJAKG8HR0wn+tMfOUj+lVUw4
	AU1NK8lhZKjpRd5zSNtfqvw1L6zjFegMFYOqqBIJFoGfj+GN9Z9x+u9S
X-Gm-Gg: AYBFou1Ty5xy6TjTykQCT4Fafh2mdfJZ22ftjJaHnNNt6FgbOPy/bPoNqfsBtpALKVu
	XSEWhOuaMSjRSipk6eiXutm/rOlaAp8JqLSj3KkcguRI0qjpQWjIo/RMpIATkx1/b+l+B+z8bfy
	49s8uNhu7elmScViRoe3vnh0oy4EqprKjArVBowN+7VsJIUF1X9Pm1xm98uZadoXXag+ebdGSfU
	4ICUB0OLIZP0JB1k1GS2UBG0ssnmap7duuSpcArKKnJupytmRmxvIipL7iELXAwmpPwv7mK01RU
	iOh0cPfFOWXAk+Z7hkNtrVx5PtBDTPGqN3CbUahG83OiVJUpRYrlcBlU8uuw2GHcOXWh6uoOaz0
	cRpvf/9yPFGRLRFgGhactAbyMXQovTPru2dKfrfFQc9Kh2pYXRKcilGL/hwJZShkm145+DhccD8
	7tQ/RN6w1cxApuLLLgjQHxjffRnpI8RUeFkdBAjlzYN8nKgRP0VyUc9H0HpsOxaP/mrAviDiFS8
	3gHzVTBYswPS4XJoxz4CmpKUYRHWVrgCUp/ED7qPl1fAWFZrtwa7q+g+B31RjZSLIfTVxKJTXZp
	/P3NPFxiuBkw4lUhTmEwucgrRcrrsVxB66w8
X-Received: by 2002:a05:690c:c509:b0:8a9:bbb5:6bff with SMTP id 00721157ae682-8b1b5d36bffmr19095177b3.47.1793200778545;
        Wed, 28 Oct 2026 08:19:38 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e6365b6sm30497897b3.41.2026.10.28.08.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:19:37 -0700 (PDT)
Message-ID: <a0e96bea-b2bd-4c7b-ae94-a13c57c86f3f@gmail.com>
Date: Wed, 28 Oct 2026 11:19:36 -0400
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
Subject: Re: [PATCH v2 0/2] nvme-tcp: handle TLS control records at connect
 and on receive errors
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Belanger <martin.belanger@dell.com>
References: <20261027-nvme-tcp-ctrlrec-fixes-v2-0-9656395ebcf2@gmail.com>
 <auEreAhSYCdGCWvt@kbusch-mbp>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <auEreAhSYCdGCWvt@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/27/26 18:53, Keith Busch wrote:

> Thanks, applied to nvme-7.4.

Hi Keith,

Could you add these tags to "nvme-tcp: start error recovery when
read_sock fails", if nvme-7.4 can still change?

Fixes: be8e82caa685 ("nvme-tcp: enable TLS handshake upcall")
Cc: stable@vger.kernel.org

Since 6.7, a TLS record that is not application data (for example a
KeyUpdate) makes the queue stall until a command times out. This patch
makes the queue reconnect at once. It applies cleanly to 6.12 and 6.18.

Thanks,
Martin

