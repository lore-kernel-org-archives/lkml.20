Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716289;
	b=bRVUdBDuQztCb7PIbEY9Bbf0uJFeRoFzzW5fpTwFuoEii5hW9LLPuHBXLbB+4Q4MYISN
	 RNiw71dAnklD5wHSWRqLvH/0XsTV/qClTkGsjV3ECWiJ5n79XAfr6i3Cad0dVVWDfgy36
	 nvshi8F1lizQZImdioZLIciKdk53D7Mem8fLB+rZ38oidGUU+z4kAZhLkAwlz1NsvQyvO
	 EttBM0Fg2C1FgEsC9aVEiKSYeGz7IPgcTNWfEP3nfe+F/vWp7EZJWRfrRdpl2VNRd1Mpn
	 NaDsCu15Rr0YPFykQa4XXcXteA6Xohg5s4EIzm/WyzybKdEZpz5E2Gg/fFPUaOpkE5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=wk9IlcGYhsSNWUuj3B81ByEUkAlft9P2T8KxXmSzXGY=;
	b=4KS1ZUPOPBCGj8a0uallnWpWZx8tsq8G9DLPi8uF+XToIlotmdLPpb8aI1c43asH4K4s
	 W8XfIoK2ULsoCEwYjbyTyfAKQdrj5ydehldzyucmGP/QRSu5EYo+gfUfHOy5TWD8HfL/H
	 1elhL3Y24KqYeAzcgyYy1wYkWSyR+7kxDoifYNTqde1cj44WdEZUDTdZDeLSji+w79BKJ
	 dOXriCczaV+llB6H7tWASuwddyOZxSTkZNts3LilP7XwCO8vjdSzLC9kiQfmISR2cxAij
	 hTIvM/fNu+LiVukkkTgKOECT5xm2PuRguBjr1AR3gM6oLR3WU5som47F24ZQXEnOHog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hIUixbZZ;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB996083631
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB996083631
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hIUixbZZ
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso7218788c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716288; x=1794321088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wk9IlcGYhsSNWUuj3B81ByEUkAlft9P2T8KxXmSzXGY=;
        b=hIUixbZZe0qdnf8pPESb/h9zqO50ERtOAYOuuUckq0Fj+Sn4+GYvDGk02FSgIp6RB+
         5QlfWVSXg8mZx3FMt9qctveJsziRYuGcSZje39lQkrMYegEEmYemAg41kUAWexfbf0l9
         Cw9IuPCjrP5hkr4da4o7C2ucLV5C3Qn6Y92HHn11jC8i38k8h06zIVuOcO165DcoWUdf
         RKeyJNApxTmS3ZY/bxIDZf3nRZNPw0aTKqtoFJCa5GmMr86/fW2CKmPe1HuEKmN30svt
         qCfusX+8hAGEnufNp5z+V5P+ogYldZshqvaQ1wAZF92F2p3+Tmr+aKoJo5m3lek32AOc
         C+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716288; x=1794321088;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wk9IlcGYhsSNWUuj3B81ByEUkAlft9P2T8KxXmSzXGY=;
        b=wwkwci9+JIJcgHt3gnIU8zcuSoKBR1lq4nbHOuss3P7bI1+RLSp2oCDpaqCcruaTE9
         hMuxT0h8mHpC96jxmmkpnB4hneVevbuq8u4YeL3e8gMPf/HBZuZ89o7Oq6Hs6pWGAIpl
         /m8tfGTwcSW3DRzpk++8Tp0MxXFz5/AK+unS9/EPcIEiQcS6phh2kspWkl78C8952wMt
         W5zqU+cprsCivnciLVIaX7TDCdZiQfKoaV5p3vxhre4lF6g0B1LZl4Z3vpzpw5sGdwiv
         YSDzonedMATQm9eWBsPrSNqQ135ePfkRWmNbVmZkh3EIh0bzO0lvMzwbC6HR+H6yVSTQ
         Xoxg==
X-Forwarded-Encrypted: i=1; AKwUvBxDJDyDHCNVdaQ8ZhMIEvC27WnqWvQBSfNOaGyKjKE4W1SXUX0YDwc4p2bolf0Va+eApuk87WxGsbk1r4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8950wH32HKXFxhjXpJ2I9FEDHNsL/XBr9IAXmydUMcTRZgtojl
	fV4Z48twN1suBuz9bIxmpUVHJEyU0aCgXLUsQUTmPITjr01mw/6hfYYmrao8gWcOCDc=
X-Gm-Gg: AYBFou22Cy3WUnXvzLQL/F5ZcdJeq7QqC/70KhtwdWa8D6MhIBOHEnqDTBWPb+Ma+q6
	9uQLRoy2mOMv+ENZF5zA7/XF1MkCWHAVPgGdj4He8kn7tAtznNBHn30tdWfp7GO1dB1LyzXKUMq
	9Xicx42YaHNfmvjbqxYsw0/RNkiZsJaCkA1kuhHPljktaRNeYLzjxI2Ar3YxVOFyp6HUs/4SSwZ
	IzMslhciDjV3hsABvH5Tv8ZQu42ZPTQgUmc1ww7ZlBpo8pP0OQJQM7jGWFrXD0xXjXLyVaBPOpX
	q1Q8pVi+YPBEE996NWhUgz1p6DAHYMNcHBBuAQ5eJKTxymgGPybklfp4LKKhFN24m+a4RFJEL88
	L4LO+5SVBqETaSreC0L4iSuqmLU7TWNjTgXRTzJSpaPv4tPBd40v2bRooEgtH59EB4k+s2qe7TJ
	Hm05SfxNwSMKDfrgRQCTPXveuziJ39FcqbM5u4PFMY4do0tDb+hC33WsYpHn4svLF7zCnCYnyvQ
	M+Bat90NXxcfAYh/4xbz8OW8Zv5UxsqOQbiFxzGfEAtcshBr9yLYG8DsYbs8YRt6AT2TYneNnf6
	rKY+C3rMCMeHnS0aoQirNGU1LzTr3D3dLPPCF2FgcRMhrJoPmswvbVLgnLm+MDIM4Dt9wbu2K1I
	sLUHEmaiu0wKd
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr19882618c88.4.1793716288267;
        Tue, 03 Nov 2026 06:31:28 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:27 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Yunye Zhao <yunye.zhao@linux.alibaba.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Max Gurtovoy <mgurtovoy@nvidia.com>, 
 virtualization@lists.linux.dev, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Ferry Meng <mengferry@linux.alibaba.com>
In-Reply-To: <20261102133740.88919-1-yunye.zhao@linux.alibaba.com>
References: <20261102133740.88919-1-yunye.zhao@linux.alibaba.com>
Subject: Re: [PATCH] virtio_blk: freeze the virtqueue layout at probe time
Message-Id: <179371628704.3691261.225757712594968612.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:27 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 02 Nov 2026 21:37:40 +0800, Yunye Zhao wrote:
> init_vq() reads the writable num_request_queues and poll_queues module
> parameters both at probe and when recreating virtqueues after suspend
> or reset. However, virtio-blk does not update the blk-mq hardware queue
> count or queue maps on restore.
> 
> Increasing poll_queues can therefore remove the completion callback
> from a virtqueue still used for interrupt-driven I/O, leaving requests
> uncompleted. Reducing the effective request queue count through
> num_request_queues can instead leave existing hardware contexts
> indexing beyond the reallocated vblk->vqs array.
> 
> [...]

Applied, thanks!

[1/1] virtio_blk: freeze the virtqueue layout at probe time
      commit: d53c1a12ff1cfdb12770ddcfdf5603915d0ba0d8

Best regards,
-- 
Jens Axboe



