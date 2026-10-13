Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D533F9F28
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900349; cv=none; b=EZxSegl0FQmvQsWgY1QDNtz1QzHFsPoPrH0GqVaXIeW2gP2MCFzUsoAxfbEkP62cdpDhDoKiEyyplfvSQJWQSSifeo5ieB4qeLIQd93Mw6xVc7tiB1lrHaD6HVlqDLE52WoQjBIkDOI3aaREGzksqrf6Sr1y1IDTDzPp6enwnk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900349; c=relaxed/simple;
	bh=IhTLoHrlyl4CrIJgU6a7OH6/1uPW9hR0ITPDoRIiN50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoqnskofViofKciK2j9smgEzf3TXd1h20Dg4dy/ySIgQBDj0Y7U9rFBW/DDXvS3xDsb4ZowwUy1JHzQEGkZyAa8GOZXvMPKYK7ZWIe81OLewZHTteKoSD4EEcHctbhCrWodhmNYrmvUX+LxPgcTlCZ7SyuTbXvxqIwzZS3aABVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CnGMMSHg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uukf24Os; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CnGMMSHg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uukf24Os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791900347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbSa4aMX4ZLanyQchu7pWrasbobdd8GQBaOw6y63Ae8=;
	b=CnGMMSHgeTJSAUSWI6XDrklCCe3oKMfS1rgv0nkd/0TPL66KvOgjKPZINibCZbDY2qx9ba
	iKUBzGHSxiF1lFbypdWXaNn5IFgv5hCa0aNDJiP+l4juexRMRoUcSjyn1WWxpxgQytfN09
	KUe0cC0CgsZVGJia0mtZRA5gEzDN4uU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-Vh6rPqvZPIG1iw7yoHpqqA-1; Tue, 13 Oct 2026 14:05:45 +0000
X-MC-Unique: Vh6rPqvZPIG1iw7yoHpqqA-1
X-Mimecast-MFC-AGG-ID: Vh6rPqvZPIG1iw7yoHpqqA_1791900344
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49febef74e3so39134115e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791900344; x=1792505144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GbSa4aMX4ZLanyQchu7pWrasbobdd8GQBaOw6y63Ae8=;
        b=Uukf24Os2aSVACfZ8P/eWG5wGvTwe/X6PH1ykSx/BXZJ48JnXev9xhT0qhk4QWV9SD
         7VLo7lxtEYRdl3tjKycHEk3yAEgOW8ITHMgJOEsYbzr0YfbFpViQKPGbabhQP6NnVd0j
         sEwmE7VOtxEQv9TUav++8Tm96Xl6sOxJFMPPQqasvlooSB2YOp99cnvuNnsSL1sRt4LR
         NuZ8iWKYIGOkwKtMj4/OQsnLSdHM3zw8jHsF2/AfS/firOda/QYSDA4YhiIkoPnkznsB
         YRAqtXpbPa0WwjXVxtsQUATSRAvXU46GJkZ/Vq6v6XnfMEtzOzJLEG5TCE9EyIHoscyT
         EKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900344; x=1792505144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbSa4aMX4ZLanyQchu7pWrasbobdd8GQBaOw6y63Ae8=;
        b=SI803Z3nFBl1SA4WtrU+AqUk2H0TX3R1XORV5rrDfsM3q48VbZnKe3srOEqu05sLCY
         pRt0NjgcavQ2HMEmqcHOsCqMwbK6PhfAHlpYOQiSyWS86wWF0qarXb6HbeD65n7xudUt
         /okHtwKVgqaIcypPsbJOOhUddsDvWAlkvYWX+8IWEK+hN9ha575f7d5XPPEtoySs2++k
         hMXK3a/7PDo+VctoOS1MFGeKoozidBNdzQauHWQHNwwWbKEvqrAjT3xaUiiPcUuvGC07
         YxzOHj4jcKAMNnDE7uPHpj73oEIVlNG2VYnBGs3nGAfmXW9C6nOvQ/RSDehyrTs9f/jZ
         4y5w==
X-Forwarded-Encrypted: i=1; AKwUvByLzkBEQsF/vaXUvXjXO41cg33rSHnwd84XvDDy6+PLEit3pt/7rcvNqsm1qRC3SL+Tn8hF57DiW3I/I7U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHaGYIsqL9WXsVwmTcGCjwuqmuIpcgSSOW7vf7EcM8qOiurMVL
	oCeSkFo+LzIWo5+rhDQ0pYTYqXMnhmuE+GH1SMGIqmFz0X8mMi0l7U3THtN2xdo2yrtuN4aZQFE
	O9Kn1bPNkAL9Yo6RBhw7zIH+lJjp/2MUtx/6Kuckp7e7s1lhHi6knXj4U4+l1RhZRsi4+e5KNGA
	==
X-Gm-Gg: AYBFou0LobKa2R2FeFaKfhEy3mHV3ydYrPnNoz/D+11O8xo3bp+AflZmc4P+rbDcsxH
	3Hsx3Hrw6iVApHcwKu4FTzjq88HImmFmxT+KD3E1VC6p4alCOLMAYbmf8R3jcJrkAo1cfXzXoAF
	EcgYIqWcoyEIwM/D53hAZdCrcs0d0MKnj/ih8v0LbErBbwz6yN3D6Ppy22WzetlvPNHv26v0ccE
	OE2N2zPdAiDf1gNfTdX89MV0vtntFOXTWyy526dWX119vmndxNL8KmYBL7Bns8kSJKrob1VhdL3
	5S0g0+B+DVr0qG7+IonJolBQeaNXuqZ0rsjdHhdCSJhLS2N7kUJVmglJlZM1kB9SfiGzj6+JZvH
	DsVyxG8Ylrwv+/z/bM7mDEe0iJuuskkPCi2srQxYl3LnruHsR+zkU+RSKWsvGeeq1DWXtJkvjqA
	==
X-Received: by 2002:a05:600c:4e92:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a18e4837e7mr248254385e9.6.1791900343762;
        Tue, 13 Oct 2026 07:05:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4e92:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a18e4837e7mr248253445e9.6.1791900343076;
        Tue, 13 Oct 2026 07:05:43 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dd15659sm242588985e9.4.2026.10.13.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:05:42 -0700 (PDT)
Message-ID: <38ae4fa2-29e5-49a7-8653-88f5a73593dd@redhat.com>
Date: Tue, 13 Oct 2026 16:05:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 net-next 2/2] octeontx2: add mqprio bandwidth offload
 for NIX TX schedulers
To: Ratheesh Kannoth <rkannoth@marvell.com>, netdev-bot+sashiko@kernel.org
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, ast@kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, edumazet@kernel.org,
 hawk@kernel.org, john.fastabend@gmail.com, kuba@kernel.org, sdf@fomichev.me,
 sgoutham@marvell.com
References: <20261006094357.840823-3-rkannoth@marvell.com>
 <179162647058.434549.12221340477037180415@kernel.org>
 <asxY6cs5os_q3mAA@rkannoth-OptiPlex-7090>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <asxY6cs5os_q3mAA@rkannoth-OptiPlex-7090>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/26 05:50, Ratheesh Kannoth wrote:
> On 2026-10-10 at 15:31:10, netdev-bot+sashiko@kernel.org (netdev-bot+sashiko@kernel.org) wrote:
>> Thank you for your contribution! Sashiko AI review found 12 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 1 · Medium: 9 (1) · Low: 2 (1)
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [High] There is a use-after-free race on the deferred netdev_tc_work
>>    during device removal.
> 
> Not addressing this one; the window is theoretical and the impact is nil in practice.
The number of known valid issues that you intend not address is
concerning. Beyond the overall driver quality, please note that any
later patch touching this area will likely report the same issues,
require more effort from you to waive them and from us to actually
process the increasingly large wall of text.

I strongly suggest addressing at least the 'high' one and the others
with more straight-forward solutions.

/P

