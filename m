Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618175;
	b=NUi6pM30wEjV2eU0eogFmeQPYVjYZGLzEpE4OzAWjs8UXzLbYsEHjopD7sPBIdYJLsN+
	 xX+yhW5GGmcoH3WhJSWDZeUcjf4ZpS3WUyEClBGzD4CGZzUjhYCYX81DujjFMR6fmIuEN
	 GK5NvYYjowIqVQKEK7uwedKKfXBr2gOwuCxlvyq4T8/pN+0Gtxc9n/vJFwV3no0t7uOAD
	 FUl3qPps1x8hGej7OAQlzocJGVgeRgq8ZU5eB+ALW65ufUQUOQoFmpatgtndiJAuKT0ML
	 vPVj8SygMl1Ux60chOTBqfok0roib+YN0o1nIplc1rhJzOJVbYyleV5lfE9wTRDHznQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bt2PQaCOWWl5wAhg9mJHVrkNYzA12/JaAR8E5rJGHP8=;
	b=KjXGYszY3nsxv3WUoUWa84Bw4cBXT45HdzLEKEMBXBjFZeHkUry9sri5C6KqlxeAxvCy
	 rxJKk3njaVNn4w/uAXog8FqB5P8AQUosaB36sdk821V27mgucMInhEfj6orWjRyDhPESZ
	 yzXKrt4UzjrJJsVnQerXKh3WbSvajB9OgLnEiiUlF5BR1DNEyy1vjYWKtFwiAJQdZcCiU
	 kbfXU1xdPL/bp+3sreu4W0B5LQYgvzJRUyXfGOPKAH+AuZ26sXJuh2+mV2AuqvVZUaef+
	 UEanvhLNcjLr9zNyUwK5BmdTTn+pqnomY1TOY6zquYqt3W+VRv65NsPUT7RBNzjb+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDWCQZD7;
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2400606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2400606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDWCQZD7
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-679a0b1c35eso1252299d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618174; x=1794222974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bt2PQaCOWWl5wAhg9mJHVrkNYzA12/JaAR8E5rJGHP8=;
        b=ZDWCQZD7W2u5VXx4nfee+ehpfOVSemblSUe7p6qbJI7FCKfuH4uzHdHS/aNUObazCN
         W0OwSB/508a1VKPPghroIpt05jqfqIJTfhdq0RmQC8Vrf6fp7ykVAVn0eNzH3FLBlETF
         3xX3aNLj2AkHVtD6ZZiNYUXm3/jCIRu/hSS7R7XoXA1wFDt2GFPhs8XOXAVOkOdLxOBP
         N4PEFo7EgBfBFivpR4CWbi+2c+n8Fo6puJDRWw5l68vNFEDEk6qIaZ0gET3rD/ITxpyA
         QhWd/VkR4eWTkS6oMCllL6nUb+Q26gyosLmAtToz9Ah9NEOlVNyuV4jfFbgSkxp8g55Y
         ISiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618174; x=1794222974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt2PQaCOWWl5wAhg9mJHVrkNYzA12/JaAR8E5rJGHP8=;
        b=blWRleq/DICF0WI9L+SYZDcKztadIVfqDbRQeEjG9qkGSCiJ0SZJoTDR9ELrXO5Ybs
         puOh2DXtpEnjquRU7Rjn8P4CV2NcukuOabRTCZW8j6xo2T7/ZQthT4FBC1oUwvm4pCjy
         QNll2NNWI7lPvlm5ZPzfW45IJj09oM2UeNYbvQ9lZUOHQoGAgPqKNfXgPwbnK/bmbJVy
         lkW54dw674tpQ/v2aaPOmyBDJiH7f4zUEcxDwObFMRbo+8ldtQSA+HFU47Fk/SoFSpB/
         fYvnDoQ93zmk3wC++AV9qQM2+ooaQNcpajPF7XRp3SJwtrqWKRv8S/agR+uYKErSmIHB
         G2iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQ+TqawacoNitMDKYD2RkiUW3FuvPFJqQsinrvuXOnvFUOZw62lEMuE1u67jZc/KLhCIZOvltEQ2LCsNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uRdHTtPBNsMim62sz2PzpH4amS2hQIt10oEGMF4NbqKm8+qfJ
	SKw1LLKIqIrs1PApg4x3vUysJ5AezlUZg8f9GTXbS3bHQTsJ2UFGOlqH
X-Gm-Gg: AYBFou0Px1WkEB+Hio2kc/gRRu2HBmwlm5j4ImJT4aBCJaZUDvhOjNzld56gVuldRpC
	MdEk8dwrZxi9ERzsAsFB9BOeo7xHlo/4AiIa+1hQo789BfEgWd2YCNVDCKB+D19DpbJJmYvo+U1
	ETDkQ9ihe6AOc4AGJqXnIjEwSPRpVBv9MBK0WsjKKY44BzUvBHvxkqTgpe0oeUnwPx7B2rYmzGl
	FV74dbUybfiOZTta9k92sdyDViPRgOdeL6j6dJPAX73fMuoEMxL46FrKpWP7Vi//0hNOnwxDRl7
	xTbGYazK9FkvEWfLa3haW4agGz6KrW09wxVkDHeDKldqLk93KFcL1OeyQBGYEzFjSy0tD+Qnsed
	bhZotpeqLBe3jdxW/mJ3qwOSVnB3uGdur0/LiN6jYdpDQX/7ivIeP7jC/GDSkk3e5QzW1nbq5IK
	qU5VAR3IQkeZFx7u+Ff2HnYGUBMC98lcCadLHFNH/bTujVEP8j4JA5AIQUyQdlKQKDMGBRfqCfk
	25NM20zfAA1kEdfV5f1+tfgBEmnjogODV73MItH6M7EfwUC6Ys85vipXnC6E7io95C79dyZXzfk
	B7Me2By78j+RzWgdGOwo+lVpq3F+tgQCCPaO
X-Received: by 2002:a05:690e:128a:b0:679:9ad9:b103 with SMTP id 956f58d0204a3-67ba50262b2mr5935282d50.136.1793618173443;
        Mon, 02 Nov 2026 03:16:13 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf27263csm4858032d50.4.2026.11.02.03.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:16:12 -0800 (PST)
Message-ID: <b67c43d4-7cfe-4217-b3f5-ed1425d2f3bc@gmail.com>
Date: Mon, 2 Nov 2026 06:16:12 -0500
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
Subject: Re: [PATCH v4 3/3] nvme-tcp: parallelize I/O queue allocation and
 startup
To: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com,
 Hannes Reinecke <hare@kernel.org>, wagi@kernel.org,
 shinichiro.kawasaki@wdc.com
References: <20260922200718.3941465-1-sgogte@purestorage.com>
 <20260922200718.3941465-4-sgogte@purestorage.com>
 <705f4452-3d07-4d91-9dcd-ea53b2cd75a5@gmail.com>
 <CAMof9cU5s0ck20fcSAYSvK-xpcP5_Hv2BmN20Bh3btpLum7THg@mail.gmail.com>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <CAMof9cU5s0ck20fcSAYSvK-xpcP5_Hv2BmN20Bh3btpLum7THg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/30/26 17:25, Surabhi Gogte (she/her) wrote:
> 
> Hey Martin, can you try the tests once with tlshd using commit 3a6658e
> ("tlshd: Link the NFS keyrings per handshake instead of at startup")
> or ktls-utils 1.5. blktests nvme/062 and nvme/063 passed with this
> commit. I believe that change fixed the keyring race in tlshd
> independently. If the issue persists, let me know the reproducer
> script so I can also take a look. I saw the same errors while running
> blktests with an older tlshd version from ktls-utils 1.3.1 and
> updating tlshd worked.
> 
> Best,
> Surabhi

Hi Surabhi,

You are right, thanks. The tlshd in my test was too old.

Same kernel 4 CPUs, 4 I/O queues, 40 connects:

- tlshd a0bd51d: 19 of 40 connects fail.
- tlshd from ktls-utils 1.5.0: 40 of 40 connects pass, no handshake
   errors.

So this patch only exposed a race in older tlshd versions, and there
is nothing to fix in the kernel. Sorry for the noise.

Martin

