Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363753B8D4A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790535819; cv=none; b=bFbT6K9Uk2usQ3JMDwvKiGoIxzukB/s2eRx5Evrw2rvxZnccRO+a5XtricD9tfh+dRy1QPfHcXUjiR0DsiZnIFQCgziLh8vvpfOIHE5yuKSIFqznTJ1tJWE19lsp4aP5WbS+8W12A+iqlV25BU424ockQNxlHApQwUdbfb0s+2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790535819; c=relaxed/simple;
	bh=iww9Rrw/7xVmPZYqt+U+P9KcHpNhKk1XEZ9j0Zir8vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crmu8eqRfeKUnY/gDgTyehK34H8AsGlAvmNbKo9MmUqpRngC7vSxYEiSD7g012jKV3JERCIZSDu+UJkSmNLv+Bb7nD/9g18xdLe7Z0cO/eLFtTMLgobVry27a7FRMiW6ukvi8lX/pV29oxfDbRbWArD3ogBCAOY6wm4w2bezXoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snNZyDmN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snNZyDmN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so1968038f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535816; x=1791140616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyA13uQBPobSZN7QEDfmz9E3dETz4qLP4md8sLtn8EE=;
        b=snNZyDmN31vH2iWiTXD1dogUrWuUcObLz/Egz0tuCZ42V76I5nrwJuAaE2Fw9R/89N
         FBDrSSBtHJcKk2ACMWA9bO3AYJ70k12dGtBIQW2ahbm3PgzLAyWWzGvZ3GJilIdVHgE6
         mQvBjppBfXrpHpAjzZXoWmyFUdfi+aDwYtYvRQEMzOTgIxJ5ygIVLmdi+b7IjpG6yy8p
         aGuObClTT/kPyCXoofYznF5SbSqh+5MfkGUfL++y4YqPCy6R5XjSGtb6Ufm8Fg8bTLu2
         VdFyOMKuCI81gHHxAXqE7Rm/Lzwt8CYssabJUX/bovswdrZ/8QPv2MZLpblR0QXtaVdJ
         tw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535816; x=1791140616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyA13uQBPobSZN7QEDfmz9E3dETz4qLP4md8sLtn8EE=;
        b=jC9hgzp6yn3S+ZJUupDZB4wNHX/kDN72wLj+mscQLbLR+4IqU4gpeexhDP+zNv4dI0
         omZQ8v8SYCOBBp4p85AL+mD5CMTtcRHVhfYnH1xZsr9znQP7yXAhBrWp76vl+hRwHEJN
         l69Qo46fn1bitGhvAMzDvEhx4kfFDufi4qNW/bHTY5DeUjo7PfXxpM0Bc/eZvUC0nw6v
         lkmAEvmnjS50ZhUgZ6wq0O5zEe4D1QWejLhdZRyNgeT2Nn+6Bhs0p4OEshQVZ0peUC8I
         1esEAkj6MnW3MkDrA+Tg+1VT7aSI9joItySouPVEa3UV8KMkyPfazCGMb9shWTLvqaLY
         O9Hw==
X-Forwarded-Encrypted: i=1; AKwUvBzx8wR8dUlvntIIlskeQoIedPgGW5TIi1H3vYhrdWba1KAWlFBqGZ02ei9fwAegJaJH8lpAfixK0YPyJaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmqTUXKiQunZmnjc9NahBz7dNZggluBz2d18wF6dSJjokQwu22
	2UhghIfwZFtsXbzuktgIT9KF+k0QZOH1REcftAvMPvjelD9yDmDhh/pT
X-Gm-Gg: AYBFou2JEozvrIeXqPQQu/APO+3tarWb0KPngwVtc0JwvTxtYmiqz2GetqI3KIIut1W
	8VZeHJ4niNT6zt5c5BM8wSVBvscCi0j64oIHMFhGI24nEFo33io37KrPW5JrSue3P9ErvJjYBLR
	y+feU8pfGiAyCJLcFV/ZwWd0XhI/H9Eucw+bSwE9HrKuLKkyqJYTLFoQwpI+9GLYHOIcyn/VNFz
	ywhI0Uvd5QiujZU6tHrIsbVwmuluITvdXYW7z7BEU3dZ76n1W4jaS66LZbs9Ax7iG9+FdnrmIDv
	9vFkAQIRFOQS1Vdq3c8enwDw1Z7ZVHbCC1dmymtrrwErAUqvsi7Zz39ximl7hqd9vCFlwGTwIB1
	D55jio5+mP9G30n6STp2U74/jvD+n4thXs23KXehpq8U7s7u7FZagcwkJd9xT3Wih0G+ffT8wna
	qMGsSobl/IvYk2U8Pzn0+YlhEyZCiZIvxZZZhXN9zunv+4RH4Cepz/er5FWAAJUkWLRKxWFz2H6
	n5X82IVB6IVu6OTK4R+NeKl7vjQJ96Y69CZzyia3SytFk1qu49nnzmVuiUekjPhzgbOlRcmYEGy
	3MsshmkkaMvW4tRQ5VPsntMTgUtdDbaVVQIG2BHKfrobo0Wp612oul+MuEM=
X-Received: by 2002:a5d:5f08:0:b0:488:89af:e95b with SMTP id ffacd0b85a97d-48889afec11mr7503670f8f.8.1790535816106;
        Sun, 27 Sep 2026 12:03:36 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm30979151f8f.10.2026.09.27.12.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 12:03:35 -0700 (PDT)
Message-ID: <5b65f83b-d30b-414c-bb71-197f72feb367@gmail.com>
Date: Sun, 27 Sep 2026 20:03:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/zcrx: requeue multishot receives stopped by a
 local resource
To: Junyuan Feng <a@lollipopkit.com>, axboe@kernel.dk
Cc: dw@davidwei.uk, io-uring@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <010001a0cd914529-23df2f94-bbe0-49cd-ae5d-05922356fa12-000000@email.amazonses.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <010001a0cd914529-23df2f94-bbe0-49cd-ae5d-05922356fa12-000000@email.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 10:20, Junyuan Feng wrote:
> A multishot RECV_ZC can go idle with unread TCP data when a receiver-local
> resource runs out. An empty copy-fallback niov freelist returns -ENOMEM;
> a full CQ returns -ENOSPC. After partial progress the stop reason is
> lost: io_zcrx_copy_chunk() and io_zcrx_recv_skb() report the copied
> bytes, and tcp_read_sock() drops an error from a later call once earlier
> data was consumed. The edge-triggered request is then not requeued, so
> it cannot consume the remaining data until another socket event arrives.
> 
> Record in io_zcrx_recv_skb() when a walk stops before consuming the
> length it was offered, and requeue if the pass still returned data. The
> failed chunk is first on the next pass. The resource is usually still
> exhausted by then, so that pass fails at once and ends the request with
> an error CQE, which the application must handle by re-arming. The
> request does not spin, and the stall becomes a visible error. Keep the
> existing skb limit and SOCK_DONE handling.

Looks good

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

