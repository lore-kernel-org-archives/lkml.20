Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106212;
	b=jGhKMtJ3BgjeXU7bBGu4dd/hFq+Dqcq+PhzMza7atjW1l3GSmklOqw1/G4FFCnaKJ6nU
	 JKaYxaqHbOk51uBgRyfqqYyDdvy6rA/W1txlsWwxwD8Z6A7cVdckOBInfAu0cIWHq9rKA
	 7UVMca+VvcLPUprB5MWvogdd//zmrsauafpDZS/a/CMVPN6ruxBdIIZ+4ZVjx9EFS4OkQ
	 0HJsabR5SFulUDWCtnsIo1PQuu/rwyxLm7mTDQ2MzYIU1C6GiV5IiGcyO/PWRRUPMtvEl
	 7qU4cbaLyTy3z4lxEKsr2d5KIEhRokySclyFIOmLuIcYzZ1eyccKH41FIBZSY//CqsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
	b=yMV73lrpOOeKmwwXdgmmvYpulQ1XiDsS4rbz86NQFaGlhBH1zj0ZQZSDhA19E2Jx5ZPt
	 DZ3BMOzs74NuW3gAmXV9K4fgv543B1SyNLI5IgBdblYO2oyLEyTa3qf8hoGE4JIZHQ5LM
	 ANAdU2Aw5AmCvjF6gkS2XFktU/X/WW8ofp3O25bxrCmbapEY62BnZZovofjcnlu1pzbmU
	 aQqHGHcxY/W9dNJ0bDVorChGP60cu/JyzKUb1XgFpFFbXaNq9/wLQke/avrBGlQRUoJwd
	 jq5y1YX4dG4KcsCBjanW7cTXafImJEp0v7wKQ76utvuPJ4Z6UiD+hz7wpVByb6+lQeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pwZubLos;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3A4606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3A4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pwZubLos
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a17a332ecso554799eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793106211; x=1793711011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
        b=pwZubLosiPicmF6eOZkcnrmXKaKA0onFcjm5mWUKQ+V0EFxJ+Ny1krsU2gwo/ukIqh
         rqUN13guldw8LZ6tfWAc0W2WKHDNYERK7ZP74wB8FueP2bBNXK3u1ZjeRuGOc1sMSpQy
         f3eWBeCGblNzaC23usWJLhwYcfBo5g6Z5k2g0M1kQ1V5+BsNqMY0omu3RhL3UmBhhDTa
         II3fH1sqsbJAufYvRV/OZbxhH9TbAV6O6b1ChNbIP8GO+fBZZHGIh7N6bSQxHIKc/44V
         Wm7LF9P3hc7tBhnnSkWAUwBcF3UD9Qp/uepks4vAFBlxZ8Qmd3Khnm5hhAYEDg5biV5X
         Zk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106211; x=1793711011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
        b=gllxa3wPOyFJ51OlJuba9ykRXk9sUNP+19a/Ib+FQA1xJPVbXaROrXlNCc8mtOC3r/
         yX4PotcKG/kLDwpMpOJXPnN2tpPCMhhiZL8JiBg9EcTKkRQmJlsj7uy9H2kuzoXGNDwy
         ZfWMb9GoxASlhTRq4MhKoPAtwLXHLjsnbsv7UaL4e7Ii5mLZJmMIxmqbaCZh8HybRe1Z
         FdBSJWoMd/qx1RdvtNYwctBRehvP7yTNq+M2Dx/Q7BpC6S9eSfeanZF68ZzIl9zN9k2g
         PGBow7DV2yOHeqOx1PjpkC7qbe/Sk9IYQVpnMedwzlc8EVz2OgAAzkZSeAIhM4x7/u7Q
         beQw==
X-Forwarded-Encrypted: i=1; AKwUvByDzOtupElnaYxCuQKkRGYVAGof4n5V5+U462jVO8EGJBZGRNz/VIimG9bBG4CR4oTPS7rpuphs0x11XE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXL+SnSKYAgVTP35PvxvpTgsVfzcrgTtuDmyzRfCxb7ysYBz51
	4g94fmJ1s5XeUHn13hHBc7VQOafsNP2MBCj3OwPCv/sj9Ol0jA1TQl06FNNbKi214DQ=
X-Gm-Gg: AYBFou1Z0YeQNv2H5eO+o9EjjNm22GbCsfpAXenxE6ICc2/Ji2Ff0YJc+gaKBW5g4oN
	vzfU99XwfbXJDcFm+JBiTJ5oU6CAxSIlp2Ma0AusvcrVfxBqdwxyYgOoRwfGkqbeKKckFyyTPjm
	burkc01jWSJJuWikRwNxm+KT2XxsUgBGB/oSfcuyC+G7zgU5sv9HsvW/gQ0fuA39Ykr/6Yp8pfW
	GRmoyZSQX4x3QP/6ck376DQBc/1Cd8VJBtbkk194GXgNeFCwlY91UHlG7BXXl6/CFh/qcl48pM9
	9Nc9E6zqQq0JggtF/ZZeTwbs7yrIpngevYWyApl2lpbq9PGYFdo2xmKjWohWA71b1okGo6LyTAP
	7HMMknKl/TeH4Jm8vJrFxZtBiBwZaAjjtumnXa7pgaHHvoNLOdQ31HgWnww2gy5Y9i+og8TipHM
	hbdNYI0uHrpkQycTD8TMNXCg6AhYxWOVYnPXd0pGN8EP5sl34rYyZfV+F/Gx0b41v8Y03lMDKFc
	/ZDzWDng55ccUIsATyzad0nogt+X37E/58jspFDG2K24GBQ9wY/6EMw27vmemu8p6yv2TEBPhHF
	hGLaYIs02lJ6jqmTiH9MA+KpGkiFCw8R5DAu0zA=
X-Received: by 2002:a05:7301:77cc:b0:36a:168a:96c4 with SMTP id 5a478bee46e88-36a168a9865mr1879705eec.1.1793106210431;
        Tue, 27 Oct 2026 06:03:30 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm46576346eec.19.2026.10.27.06.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:03:29 -0700 (PDT)
Message-ID: <f92baf52-bc4b-432b-bc0a-f39f59483805@kernel.dk>
Date: Tue, 27 Oct 2026 07:03:29 -0600
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
Subject: Re: [RFC PATCH v2 1/1] misc: fgds: introduce GPU-File direct I/O via
 dma-buf
To: Li Wang <liwang@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <20261027090853.30099-1-liwang@kylinos.cn>
 <20261027090853.30099-2-liwang@kylinos.cn>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027090853.30099-2-liwang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/26 3:08 AM, Li Wang wrote:
> From: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
> 
> This patch introduces a driver that allows moving data between a GPU
> dma-buf and a regular file on NVME without staging it through the page 
> cache. Userspace registers the GPU dma-buf with the device, then issues 
> read and write requests via the device's ioctls. Each transfer is direct 
> I/O: an ITER_DMABUF_MAP iterator is passed to the file's read_iter or
> write_iter, and the filesystem's iomap path submits REQ_DMABUF bios that
> already carry the dma addresses.
> 
> Signed-off-by: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>  drivers/dma-buf/dma-buf-io.c                  |   3 +
>  drivers/misc/Kconfig                          |  16 +
>  drivers/misc/Makefile                         |   1 +
>  drivers/misc/fgds.c                           | 506 ++++++++++++++++++
>  fs/iomap/buffered-io.c                        |  11 +
>  fs/iomap/direct-io.c                          |  23 +-
>  fs/xfs/xfs_file.c                             |   4 +
>  include/linux/iov_iter.h                      |   4 +
>  include/uapi/linux/fgds.h                     | 124 +++++
>  lib/iov_iter.c                                |   1 +
>  mm/filemap.c                                  |  22 +-
>  12 files changed, 713 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/misc/fgds.c
>  create mode 100644 include/uapi/linux/fgds.h

What's the point of this, when you can just use io_uring to do
the same?!

-- 
Jens Axboe

