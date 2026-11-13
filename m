Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583207;
	b=ee2WmgAo2WDvbS1ONpRI8iFvxRWdfCn9N2XhLissCf4+QGqX+H2A8Nfdcp+RZNsZOl1C
	 PMXNwuZF0fs55812pzBXDIKqAvnWDpTBCcUCHPD1I9mAHzl0JVhjIEA/D2dcizAYDIzGs
	 ckz/Mitjzx2+U/ku07eeVgtTiZmr8UxBCwreu22aRp/wcnAZzwlo06S2huetf6TM//7dz
	 aZtN4x2gkSDuIsHG3nw6GY1fMNpXfQI0Emgz1bKJ51KGr1qGZ05sj4595/e/4aUru2PZY
	 JjY9FMWvDNmQkFC/tJglrYXwIP/zLzfMbCcwpkbejy0d1/Ghb/OR7ruSsnqv43lqAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6dIw/cEasDaTMuxY4JqRIaZBNhw3B2/VuC8Ktx1d1fI=;
	b=qbFuRoLjQJzrKK1NVJPMj/MP2ep0x/rLgPxVLbp7BnP5ccH5ZSjyB5pxPCB2PqdU55Xh
	 69mW5ZXKu2TjNzplvTa34QMFAWV19rzJj7zZC1m9k/3WYEgjPjsz1f2fCOR1HnmhLjzjC
	 f/BcU0HlaHyvWwyCoznB0tn3nJzADhowDNWdFpXkOumvJBipWuFnkZmqY1mGfDMQRQ/2x
	 0LNTl1osgylp3PLC8z76TCox01nCL8tnaCSn4zEI12dMN6TbNDo5AbYH7G1iyjOkP553R
	 JbLUqxxERmJKgdcx0bX2js2gMCwVOU+oc/1hUdKyn/Y3KYmsSm0VUlMHckDbW2BkJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFcMT75e;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E38E606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E38E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFcMT75e
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso15885145e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794583205; x=1795188005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dIw/cEasDaTMuxY4JqRIaZBNhw3B2/VuC8Ktx1d1fI=;
        b=sFcMT75ewHSGlHNFmaIaCzRv51RyA+AmoclO+Wvr0qj7IRgdft+YPwpD9jRP6WK6c/
         JYnz5nY7tp8rDhhxRl839jDRSaCdOFEO37y9omk6Y6bTMpvUdRVO3sHs40wFUzQoK49R
         KDfhcSnlxOwqISdXag2i2HeczyJwl3JciKS1IO4IueILgI43L1Jav1Ck2sEsLOvdW8YJ
         xsnD0k9f1YMungKWzdWfs/wgCnEVQku2SHGreep9hdKIBeljPxLy6tKl9GtdE53m1rK+
         tr1h/mPnq09YX6erwWu4ZIbwvv7uEDWKwAiALSZofPGlkAv/kiWcyL4UzspYLPPPopZN
         ldpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583205; x=1795188005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dIw/cEasDaTMuxY4JqRIaZBNhw3B2/VuC8Ktx1d1fI=;
        b=WM0WHpRAg8+o5dQG6krSRzjKsywJXFDrr3zkd2L+TNkE5nOxZNIwtB/85GQAVrbb1L
         xg1sbLwfXY8CRwGEN1Zv4akovGjnDpPgkGOCKQzcPOlAIdoTKsiZIVyH9jcyFLHSvsMh
         7TZ5a21yiFEwXPq3uQTZ3N7HtlWWqwR36uzLuTPqUDcxGZqi+jjReBmw5+025Vuirmog
         leo9q/2gXioLNDHr3Yu5j1xj3g95I4FVurrcg2ZNHL54GFp9FfqSI2NoGSN08RWzMB7J
         qUvrUDh6Pw2OumeEn74z07BQ/hdp6g6T0Yzp58Wudetz807rHMrfJdH3TdXyA0hCcC31
         m1ig==
X-Forwarded-Encrypted: i=1; AL+hErE8h6a9JT6kjduGgLefoqDCzKEwIMrwa9yxEqyU/DcHJM7mgUpEIztKGa8GzLsdOzaGbsB+k/r900CyoaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MUxmP4vox4ev3JsaSuqFc9wRELIfE1hNnL+VsGtIsRpfoVJlA
	Bq4AA4oEGVbJMIjXMzFzFW0T0Q2kirjn3U9Lt3ozngY7t6c4tcE476Uc
X-Gm-Gg: AYBFou3G3tSwdA4VbDSl1RqHYAcPEny2zYdY/qYt+/52G8y1JAGhQY5wtCbtw8+OpFk
	QmV0jnM9S4kEyt82RR+KZveZSR/74tofLwQxoYv6A+pCDw5K1fkg5RpmWFuiECE1lM8DoEyMPj8
	hbIW3bOppPpEVWwSuOhWKQ4mgjxTuMNgN1KgU0Iw3cx3u8Fp+EJf/iL1CWDzo1lXIzlQfDU0qex
	QdW8GzWcyoRTG/eJg0vDATPJjuFF0ArogW3XO0PSCczUWcI4bU3u/hN8u/YsG4ui1QATxVeO/at
	Ea0nlUZrbFsR0rWyhWXqA4Rh8Cq3lxRm/wvXfrNHb3kIltXbGpNvQ2iQ3FcPZIptgFFamU3gxPk
	yO+GuGNXrSnJHedyIFn8MihIYOlPUHAo8LGL0yqXrZx7g3HXm3YSv6qop9ZXG8c9gkGVE0GXlRB
	y7NS+Cd21wkhDDC8neCFwhgbs8oEzHi9NGq749vOF+emwA/2VbxneetCRq3z+atGOrgvPrLDbS+
	3qhiOq17ZveF1gFM4k14Oajr0y+N3bs+U1Lzceo/fR+ugcHnabVb35poAIMngGpQYLdusMxYKjL
	wSaOC7wSzGdWuZhsfyXvQNwKOP/h+ARzPeXtD27yS2E6FbldtxuHMqqukE+QiJX/J2OtevERhty
	VclEM8Yjg4Kj7uhOMCmXEFaJ2rIiFQJRPSfSrh/AzNYUtwqsoTvlJifU4kkQ2nMfl6Gq7eGTQ2E
	rr5tVplGebzl9jCs2gbUqVN00xAv6E2x6UOvus2WP3sqsjE7AanyMl8kGKUrLmOw1XbPyCRHHtJ
	mHaaGw/xNsvjQ==
X-Received: by 2002:a05:600c:1d03:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb55a58e1amr67471255e9.20.1794583205214;
        Fri, 13 Nov 2026 07:20:05 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm159789845e9.15.2026.11.13.07.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:20:04 -0800 (PST)
Message-ID: <a0a6a72f-0ed5-4f1a-a93e-30bb99338045@gmail.com>
Date: Fri, 13 Nov 2026 16:20:02 +0100
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
Subject: Re: [PATCH v3 1/2] kernfs, sysfs: add SYSFS_NO_SPLICE to refuse
 splice on writable opens
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ian Kent <raven@themaw.net>,
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
 Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
 autofs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
References: <cover.1794479968.git.krystianmkaniewski@gmail.com>
 <f9f3df7a60ecbbacc3186b700deb947d7dc23e9f.1794479968.git.krystianmkaniewski@gmail.com>
 <07d063ef8ebcfc7f4e05c7318a423728@kernel.org>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <07d063ef8ebcfc7f4e05c7318a423728@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 16:11, Tejun Heo wrote:

Hello Tejun,

> Hello, Krystian.
> 
> On Thu, Nov 12, 2026 at 03:17:01PM +0100, Krystian Kaniewski wrote:
>> Read-only opens keep splice support because they cannot reach
>> ->write().
> 
> The patch looks fine to me, but I'm not sure whether the read-only
> exemption is necessary. Is it addressing an actual problem? busybox, for
> example, just falls back to regular reads when sendfile() fails with
> -EINVAL, and refusing splice reads on read-write opens while allowing them
> on read-only ones seems more confusing than anything else. Would it be
> simpler to refuse splice for all opens of the file?
> 
> Thanks.
> 
> --
> tejun

The read-only exemption was only intended to minimize the behavior
change. It is not addressing a known user or regression.

I agree that refusing splice for all opens would be simpler and give
SYSFS_NO_SPLICE consistent semantics. I can make that change in v4.

Thanks,
-- 
Krystian Kaniewski
