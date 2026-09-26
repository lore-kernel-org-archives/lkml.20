Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40929384CEE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790461096; cv=none; b=tg9Kee8hfCPpf3Z/quZ6rKvBK4rjKt35Yf3AQQPCP6+T5Kt1EX14RpRwyGTKqN7DwSqvPHU5hHuNCk323eI1n7x5PPld6lHMBAPunZNJOGK7gKpxvnYDz6u2F8gjo0zh123uO3oIU0ESQZW8MSUjjrF1IKv1nA4zGdn01BCMpCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790461096; c=relaxed/simple;
	bh=bYz7lI9kjRgqFz5/nCU1yj4EWniipBajOaYadK9YXSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSsFM14vpP7E0pWP73wGSE8bgIpMWEl0go9d1gQdNHAMmiWoU+UvOPfBy7F5u1jTPcbTonUZw/Ibor710NJLf+iySObi0omsjSklYMr7qlQ5Vaxw6ubQtISAp5NKO/AJKp8tFPLHB2Kn9AkpekkxkEhJXSSikUETF2f5d3mrc88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHTmCnZy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHTmCnZy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so3021415e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790461093; x=1791065893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYz7lI9kjRgqFz5/nCU1yj4EWniipBajOaYadK9YXSc=;
        b=mHTmCnZyDSV8QHVko4l9814wBlm75POYo9MwodHLUISuesQgkMmeqmCcCDYSE3eRQT
         tnKWG0HegaNh0KihEeI0qlD7+aVYn4bNIz/XP+o2AKMZK5PxIVhAkkOwDEADr/efkjgX
         +NZ9R3OgqI0bq1Z2dW1175urMqAvpX8JUXt8zbahA8MBuVMv5DoHlaFJaP//r5AX3HUT
         92PhqLGY8PfGlGlUNmbqGt0AgBpZg/Q84KD14xg3XE+kzU+FGKYH3IrxTyM9OOIflhb6
         gE3y/0WV9inW18wil1SkTrP31N6Q9AuQCgVxciik9ncltdgvXRaXJuQwE8J4L93Ox/sT
         flag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790461093; x=1791065893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYz7lI9kjRgqFz5/nCU1yj4EWniipBajOaYadK9YXSc=;
        b=khtVZa3QOhZ17GnOtXpif6QdY+OkXGbkI49/o2e2qARGyIroatgpSSWinjkgNRYmV/
         +Fm/OHgcHBElPzu9l/tEOkNDP5Qrpr3Ysa0c7U0ocQBjAko8qzROhNDkq1Kzo8KeVysK
         odJSm6X3alG5NaX9+3538+O9+mb92LhPySSSEOrrISdR7m19Pg0BHcOHtXQMkVUymXQf
         xcd/KLnNuNs/7gpEHFxYgsdqo4TGWw7HOiXJHgzj+2O/kSn+IbvpQ/lvVWsU027nRynT
         ktskAky8HosTZdtnLMimOJsMj1+aOf7l7GcOQeFgoX5iPzyKKPlXXgXLWZhPZulYEcKd
         8wnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVrT9j1KPLTBAe/HA2ZpHc3S5Q0E27KZYoYjhxd0GpwJi50Kxe9agAFDmdRVUDlVtxtJwL74fAaN1MEFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++msX4MAbqqjXUT+lTh7qYLv9DZwJyaX6nRZ5FzlLlU6/7xcgXLB
	uSiWfnBTGpvjxyn1TXJojI/1J/N1XV2Dtd6AN8uLjO9CdOXpG9t94L11
X-Gm-Gg: AYBFou0s1WIbdhISM2AQG5CgGCgOiFzmm5pLy/l0bmghHL1f6QdntPEEYZQq5Zkg7/+
	etnp23SYLOzIMvTsnv7OW4UnF4Zg0MItSZOXZzbs2cTVWlM3diw68KE2xKabNDJ644TEHR17me+
	DXVBR29ZgUGigGVYhd3CXTWFQAiVY7FPRcMvGSynUpy9IAJOM+yDGYKsDWRJzon/rHkJE48Y0RN
	poTmcKY5Cf1VGr3QUHrelS2mGdOqnaAkFOfbgsXShIODjUuYNJNL1j4SGm6xgrt3pQvnM3ApK2/
	Lq7/+2TIZHIKbnNfPD4NfeIIRNpcb4FPbtJI1DLEJYdEHoUT/02gNljPTK7oUjhpKKEIUTp4tyW
	lFe8hvBu5deBq64o0+Fkm3clUTZCWylRiRUBUhKxszP4c5uKfvSWALyWWIW7OFchFkPvobgjKBD
	1QiJKV7iqWUTLTJu61FQeGqf69yG9FFmVSk7twK2Zgjsm5Q9Tm4X7yPGRLDL5LWoYgWIGot4ARB
	E0LIEtu
X-Received: by 2002:a05:600c:4e90:b0:49f:bd0d:59f5 with SMTP id 5b1f17b1804b1-49ff06e506dmr100694585e9.18.1790461093272;
        Sat, 26 Sep 2026 15:18:13 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0016a8c2asm8941265e9.0.2026.09.26.15.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 15:18:12 -0700 (PDT)
Message-ID: <42367817-00b3-4e6e-9f16-50de4b49db64@gmail.com>
Date: Sun, 27 Sep 2026 01:18:05 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xfrm: fix suspicious RCU usage in xfrm_nlmsg_multicast
To: steffen.klassert@secunet.com, herbert@gondor.apana.org.au
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+d3bc2f2eb498a0175940@syzkaller.appspotmail.com
References: <aoLLSiD7yjcaH_BI@secunet.com>
 <20260818112038.56788-1-omermetekaya0@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <20260818112038.56788-1-omermetekaya0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/18/26 14:20, Ömer Mete Kaya wrote:
> v2: Added Fixes: tag pointing to the commit that introduced
> xfrm_nlmsg_multicast() and its RCU-locking contract, as requested
> by Steffen.

Hi Steffen,

Gentle ping on this v2. Please let me know if any further changes are
needed. Wanted to nudge it just in case it got missed.

Thanks,
Ömer
