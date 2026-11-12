Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495979;
	b=c5J4vJce7JpAWPuE2UhvrXkgoJA0bUR9678ioF09nFTuPgKLecQqHPnpABTg+a8u7EfI
	 1Co4CeH/+G2HzmkEWK6pBZh1LfnhSLFV7X5yTuWIoi47DMdE53kzWyDf+SEl/+Xsf9OAJ
	 /JYuhiTf6OehnkrxvSrJbUm7k5tLyhWgDrR8VHNcAUV0O6IyJA6fA1zZDQ3HMBo1EiELF
	 DHVnuHhU6R9RzT0hz0Ncc9NS4WuW79+bLRNgxZKSfpjwzhwg9XT0f7J3+2wpBdV1gb/Yt
	 mKmTrmI+LxYsAm/PnKtlB8/efPh6H3gxb62alG1k+EdAuqFwQRVoMAjCqwyUVKeHCcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495979;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GOqpkyo4LPYyLkLcWc/OmF1B6GtriSScGQCA7EInhEE=;
	b=yBmQexCXUkk2+/o9xCrsL6qu4SOeHg+fLwIGGtD91Y0TbbcRqyXrslcKXutf1HO8zARu
	 TnmvWGQCOMygx2uXTDU+O2kRZ3/ezTiA6Wf1YDEeZo//gL2M02vrDLo07Lx5lDhvaT2qk
	 JK3MjplRiaNOO1p2CUdRhdGme5G9TyiQsRfoAPw9e1sgVWwb7hgHjg3wBrewgybP0Ia06
	 JSWTEgwyb6SLiM5gC90XMuZ2bTaVrI3l2PmqZCivFMTr+b47pZfgkpfwbz8TGrh57bZ10
	 15UVOXu56O0iw+W5z65EB47crgS9+2fA4xI1zYeNsoVoGOJ4lEBdvaoCDV8iApB7kpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zf6i1aTl;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="F//A/5n4";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F51A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zf6i1aTl;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F//A/5n4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794495977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOqpkyo4LPYyLkLcWc/OmF1B6GtriSScGQCA7EInhEE=;
	b=Zf6i1aTlZhdIRcPISgUrem+PAEvOEQv1WNGHWULnUBwsdTTrqR2HlIvEu6LasEWKH0n56N
	r2glmyZ1+rvgGeq44pAqcSPA2Q5Hp3dc9sWifENHk6EE0IY/bAn6v5nn7hK3DtZi9wSN6y
	nkktUWuX2akqGJeuKVfKhKuiKOOI5YI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-XEZYEtYyMnqSrE_yXN5I3A-1; Thu, 12 Nov 2026 10:05:30 -0500
X-MC-Unique: XEZYEtYyMnqSrE_yXN5I3A-1
X-Mimecast-MFC-AGG-ID: XEZYEtYyMnqSrE_yXN5I3A_1794495929
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso25738935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794495929; x=1795100729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOqpkyo4LPYyLkLcWc/OmF1B6GtriSScGQCA7EInhEE=;
        b=F//A/5n4pQpDyMCnhlgIVbYdrM7RbFo+BdEuiCYObiEwZSLgVxjUXaSj8siJjlevCs
         vsX2pH1A+BoqXzfHhTjCGYtRJKd/JwEVaZXN1Pu38YkEDBmK5e3p+7hld6U9gjKRtene
         zF6qrpx/7O2oOvop729rO2GJF3Y6M3Ho0QTklkiARvJMLF6tYvJ/BLWzytxrnbj6THWD
         ngbrtqSnAcDV+uyL3iGaAaKxR5Z7M0PoNDy1Lbo+0k/DFjBqrYGTRaBPSQYUfv0P8NbX
         IT22NqA+gBevaE9Qp6Yed4EohOB4oH7QcEcLdJiflhxIU8Yimh/k8KYVUvYJeXSERYkN
         +4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495929; x=1795100729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOqpkyo4LPYyLkLcWc/OmF1B6GtriSScGQCA7EInhEE=;
        b=F4kwLdzhzP8UjCd8mGiHTVBHxYqFMHACiYmm3+w8p4+fYbSE5kXb0aIJ1VqwTvjJj8
         B9gg9TkK5V7ru260QV6PTN8q0XuDu7o0r8YxXdNvW9ROHlCtLBwIV2JGoDRiuiTDBzUU
         cfC/9e2cOOI5wJoLhk5ZtxsOsXQC0hm7rdO+zzY6DBlIBkcgcpR3weY6xOKemuQ7PFBk
         YpwxfjOnLSYjYXaTfbSONu15d0Ml63OnU80oG220cli9WCz9TE7HIOT5nsZUr7cYhZXN
         u5XnpCSjO5C7t+ajqm0hbNkNIcm3CtWHP1OufzlRfXBqV7pNwU6ecM1aQsTc7ulfY+fs
         Xbhw==
X-Forwarded-Encrypted: i=1; AL+hErGwDhHrGXZKqA8KLsoosyKEmtvIktnnR8gsy8VFTeD+UHBucTHNfJBoXcyVQr+E0VO9cNdE3fCYouUcyrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XVBSXEusMZPyn0zAiwo0MYVNpcfLHl/uuMf9WCjV30uVd1SQR
	siwBZh/bvWBMUcdZHPAmjXcQvrhVn+Atc3Xu6j1x+a2QioPczshIFLagtbCfNB4ch3w9fz2HEIq
	oYmgE9oooYXS9KfL4Jx1r/3XAl+Db6Q4cZOFFAa3ihnAvQY5kGNV0kMgyUUL18EbhwA==
X-Gm-Gg: AYBFou1sG71S9PGZsPhDde4pQUI/cS9lUpU2c5QCVOlDV4ix+760xOzt0JZZvK867bU
	9yYRJJH5GHOzrqhGGiEfmOUJMdmABon/wGG+uDe1VI1wNNUqXVH3HuGjvTu20IO6SC51QOZYLq6
	nP0jzIKwPLZDEYXT0S7MuUB3STKer7IMeyI53ULWcCLFfC5y1yhVI5nNHJETN/4tfuhceu3i3dv
	X9GflXQjHR2Gmj40eBZT9k2Aaj00kLA/xJNMqMSukkPzB2VcxRFK73anEtWYP4JFkWhBWy07nPm
	gQhq26JOn7AQRAAwjc2n+T2wC8vUSrPT7IpQkdcUL6Z+PixdzpCLxrSqKSj6+Ul1a9Ua21dijVI
	aZDRycYyg40qP3LI8c/r6YzLmiDYExkWONk3axJPyqm7CT+7B5DWADCU14VeTnBlzGDJFlcfhiN
	8wrXJlzmg06ujVsB+2j91Xyl+7TdwyTq3eQw6Ic4wMA8Lw
X-Received: by 2002:a05:600c:1389:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ba09388518mr111953995e9.24.1794495929568;
        Thu, 12 Nov 2026 07:05:29 -0800 (PST)
X-Received: by 2002:a05:600c:1389:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ba09388518mr111953325e9.24.1794495929170;
        Thu, 12 Nov 2026 07:05:29 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm75067305e9.4.2026.11.12.07.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:05:28 -0800 (PST)
Message-ID: <2dcdcc8c-0484-4fd0-b09e-723b32cbacd1@redhat.com>
Date: Thu, 12 Nov 2026 16:05:26 +0100
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
Subject: Re: [PATCH net] ptp: vmclock: keep the device state until the last
 file is closed
To: Chad Aldreda <ca@modelmiser.com>,
 Richard Cochran <richardcochran@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Shuangpeng Bai <shuangpeng.kernel@gmail.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261107150344.3946529-2-ca@modelmiser.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261107150344.3946529-2-ca@modelmiser.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 16:03, Chad Aldreda wrote:
> @@ -649,9 +680,20 @@ static void vmclock_remove(void *data)
>   	if (st->miscdev.minor != MISC_DYNAMIC_MINOR)
>   		misc_deregister(&st->miscdev);
>   
> +	/* Files still open now fail, and a poll() in progress returns */
> +	WRITE_ONCE(st->removed, true);
> +	wake_up_interruptible(&st->disrupt_wait);

I think that sashiko comment about using wake_up_interruptible_all()
is relevant:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261107150344.3946529-2-ca@modelmiser.com

/P

