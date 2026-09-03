Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D7C49DBAC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436418; cv=none; b=L6JMzJS70fQF15LNOj3QkT7XkyV35DqlE0VEcEczHcQXGrQVknZtPmSe+w3pJOjYEbaDNPAcWyUZ6hRvieoFMCvHrQCLtusCPaRDdimw+yIjpGxwIKaI7e+Ra3JcEA9wiaf/86WkJVNriC0PB+yea//y2/czgccL9kZ2sOchehc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436418; c=relaxed/simple;
	bh=n8bYwUuczfiLpKJBTVZcPnuCkq/6sKoANFxiZETDYO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdDunUz7etz88N9DSqSNJkajjQ7wrte1l8T1gkM58PWi7+HoBRUfhieJwtYKFWZYQ26rLn42Tu5ysAhSv/th4klavV2rlmspuU6fqVVsm0AgYgbDv/Gp1rmhXHh+Iqsb1JAxxLihYsDnPzndOebB0Yb+gZOp/3SJT/cHRFSL/Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=XtoSS7CG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="XtoSS7CG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1466479f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1788436412; x=1789041212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWtVn0VNYx4CTej3FUQm8/Jbit0379zH7sDkhF+JYSk=;
        b=XtoSS7CGWtbxaSwFkXKYcNubg0WrICRBln6dslQojxOaNssImT3MmexXYpgiCfBn6a
         AozBZu+Edxvma3n5znCI5HxZeCXYR+A+qoL4MrfaUQAD0D/a9UjEkioTUXePzSsRKitS
         GFrA0xcMnq0mebXzIYGaYX4BmUmt7bBe2N5tgFD06Or/vtXCuk8r8CevQLFg1n1jrYe2
         3CSMHEPkbzBuz+jbBIikcJEURbe2+df4t2h0NtBymfSIGxFlkgIs6jXrc08mOopV8rG6
         v/4aGUF8xhKCLjXLbNdmpYr5H8u+O+g/YTRy5v12JkjoxBttt/P3mDGan9fUc7mqk6ks
         4gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436412; x=1789041212;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWtVn0VNYx4CTej3FUQm8/Jbit0379zH7sDkhF+JYSk=;
        b=SUydfOdTMHJq9/95EZRpeoYDNt1LAmyCaDKjXI7wbiANar0SxKozCBDgnWwwg6iUxU
         wmDXrdxu1xBYBcRfucObkuW2BcTl2r8eGksmaTs9Nifvz3aowiOhJwGW8aKz//pqXRji
         qKQtCJtU1KFeZ54inODRddM+5twdZtk+W0UNEnsm0u/qRl6JIyIX12gH+Z7GPRtEtC3X
         jMRXwfNeWw5HDeUzLph8o4QHWmh3xwNBXo5+K6dUGZgQvxJpVG6EVAC4nes39hqd8/Xx
         XK2zAhtIpp+MJ0BWvcxCujggCUchxMyJidYP08c/O0UXXZvjbDKOfZmbUWXqhwZExtZi
         6BAg==
X-Forwarded-Encrypted: i=1; AKwUvBzOerbVCyDlTs71diSty4WOtEy46exrJDDhEN7tm289Apfp2/hZxs3ax4ePbcynkdszcJvR9NFmXU7XzH4=@vger.kernel.org
X-Gm-Message-State: AFuF++mh1iGfqF4ImAfjn80ZICZC1y0iDdyuXDoQOonv3A+GciLyxgnP
	2SN3+hgSy2i0BOrwYTdYW2HHyn8mhbTy9queg7x5GzL7L9nJzMCn5q5S9OFB95dtSjE=
X-Gm-Gg: AYBFou3fZIxjjBCW7Orhe/qBJVZ+1dkyJ7VNern8q/GV0XAguzPx9VgEv2L3DM2DcoR
	kSgyPhTMTabzu9zKQGiWBRH7sx70oKkLX3UZnZ8UnXVY2pYrM5buURkCI7HIqe/xy5z5kdeutUw
	4jrMGG1OZpkmTr7UA0g2b5sQYmzmXSiJTJozLa3GlhRlDEhTelQq2S/IzcDFqO+5m40Z4GuJJnJ
	CmzgQbqRQjzXKnN7dPPpxHK9JhGcgNewpzHzDSoKtL5w8qCcQwDlmKKIxMCQbKeu6hTBGR2cHpx
	kDsYpUUp+YL3U4uYpBz3Nj9BTtAbM7fZcysYmy9z9mgYX+j9fLUsbqrALV1HPrbKN0Xt0nnW5mi
	tHgV7rsvM9/2JUQNPn4i0OkQ7Fa1Yt94j+pzP4fsTg/9fRQ7xbMl48gj6F0ztRzXjmC2wgD4jAw
	gT7Dgo0lmUlKzpNGTmZdmwU7UzetlOPbnUqOoQTPTMSdut8AGihswSZQMpzZs1Q+4NsJozcgi16
	jxq5DzeBWWX0+7QVmo=
X-Received: by 2002:a05:6000:603:b0:484:3326:983b with SMTP id ffacd0b85a97d-48488f225d7mr19056142f8f.26.1788436411919;
        Thu, 03 Sep 2026 04:53:31 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80020sm13725881f8f.10.2026.09.03.04.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:53:31 -0700 (PDT)
Message-ID: <fe5f07d4-775c-4fe1-a4e8-384dbc11d7e7@blackwall.org>
Date: Thu, 3 Sep 2026 14:53:29 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] bonding: fix slave_cnt leak on XDP error paths
Content-Language: en-US, bg
To: Matthieu Baerts <matttbe@kernel.org>, Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@kylinos.cn>, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jussi Maki <joamaki@gmail.com>
References: <20260903-bond_slave_cnt-v2-1-02e27304ca36@kylinos.cn>
 <62271715-fbd6-4047-9b69-b2bda40db056@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <62271715-fbd6-4047-9b69-b2bda40db056@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2026 13:38, Matthieu Baerts wrote:
> Hi Hangbin,
> 
> On 03/09/2026 10:10, Hangbin Liu wrote:
>> From: Hangbin Liu <liuhangbin@kylinos.cn>
>>
>> When bond_enslave() succeeds up to the XDP setup stage, slave_cnt is
>> already incremented. If XDP setup subsequently fails, the error paths
>> jump directly to err_sysfs_del, bypassing the slave_cnt decrement.
>>
>> This causes slave_cnt to drift upward on each failed enslaving attempt,
>> which would lead to unbalanced traffic distribution with round-robin
>> mode.
>>
>> Fix it by moving the slave_cnt increasement after XDP setup.
> Thank you for the fix, but it looks like it causes multiple KASAN
> issues, see:
> 
>   - https://netdev.bots.linux.dev/flakes.html?ld-remote=virt-bonding-dbg
> 
>   -
> https://netdev.bots.linux.dev/branch_deltas/net-next-2026-09-03--09-00.html
> 
> e.g.
> 
> 
> https://lore.kernel.org/netdev/20260903-bond_slave_cnt-v2-1-02e27304ca36@kylinos.cn/raw
> 
> Cheers,
> Matt

Waaait a second, it is moved after slave arr update, yes that would cause those.
I missed it in the review, in my suggestion I specifically said it must be before
the slave array update because it uses slave_cnt.

It must be moved up. :)

Thanks,
  Nik

