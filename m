Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572612;
	b=2dctBtag6vh9jW8ps+dc0/uEqFGoN/BMaidgYmSdCgXvSxny4/65U7678jTCaM1/6vpL
	 SFAowCgy0/BkZRNCi5yJQbY0c0g8cMvGFdTWJWWO7/NhctC4wdgUiF2Y5T4V62rj7H1cp
	 Banhzq/HwdkSJMWHpHeIeIjhD99HgehHNF289g/DuCSvF2D5o43lFzRYWZTB1IrSCST71
	 XhbmwuP7+22jk6l/DGZJ0uSD+XUdNuKCLfnxpVitN08KiAJX9c+1Ncy3y6N8V+7OcTADC
	 quylXve1DUG1yvHjrZZQtcLYWNsaAyeugy/nWvZmrfDrbbxkSbpvqwMTgmeu2pu7KlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572612;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ay7su0BaQgQc7vNg3pUCZ5W4k0M/lSxdL0nMfamxf2c=;
	b=4U3FlBVbNPDaK9JL8G/yMJBqQyrlA7w6wNvejEQtFzwkCso9QjKj2iK0DYsU5SlEmlvT
	 VN3n7uylBtCoKMjkE7H0dxdMwypu15GjecECVbxqKpYSVMGyb79XznJiWYWMMW6vESd95
	 Si7YA3nI6VRYfMW2a7u4NRLb+92wVz723JY/CtsHiUuWZy58qbBclcHJda4rN8orTpEmX
	 OgkjNZa1UXfkrJQxEku+Wp3UiVqvE1qwDdzAO5hnA1UqkTNL+cbnO6oUYvbIlwp2RYnGJ
	 osCq0g904BnboxENtOuhp8J8qWg/H8PfBDZ64d0jpQaf7ixgYnAL+oDI8eiUglyRzkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJoraK3R;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KSijHLgQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB1D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB1D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJoraK3R;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KSijHLgQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792572605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ay7su0BaQgQc7vNg3pUCZ5W4k0M/lSxdL0nMfamxf2c=;
	b=WJoraK3RU08MAKjRf18x20IBDpQAB1LhvQRxOV+SGRm9FmRETy7tDnSWMn17ai1yJpLW+d
	QJkcibKXD5NEwJIJXbLqKZCuI0UTNzgEu38l+Mtw43OheY1By60xg5P2zNBpr8sQ5nzLPP
	jRvAe5+HYVLFZ2LFkY5tZ4qKRTHktpg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-KPGs7FVnPeef_irbdSl5-A-1; Wed, 21 Oct 2026 04:50:04 -0400
X-MC-Unique: KPGs7FVnPeef_irbdSl5-A-1
X-Mimecast-MFC-AGG-ID: KPGs7FVnPeef_irbdSl5-A_1792572603
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a028616bebso3267305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792572603; x=1793177403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ay7su0BaQgQc7vNg3pUCZ5W4k0M/lSxdL0nMfamxf2c=;
        b=KSijHLgQheF4mu1x1xH516jitKNuA7gOO068U/qAtVMx5RZ32K1oPELiYyZvrzUUTr
         i4oSqQp0CaZk9cM1Hlzqwpg3uYgJwVcKGoKYj0nOKCFl0d1seGELlVoShQLed/FgrzxN
         KPxG/vVNZkr5/hXeG1DryL4eQ0+pdjpyJCgZmsp0MltECIrxpTCY6R/G5w27KMPe/2xq
         PQMB1usTPGHi6He2YC5GAGltHdLrHw/82VPbmG9P4HFvV/PQyMwBIArsWicq9CrjdRM/
         ENFRUb4n90jpg0HcE7sPzT0dF5lpUc+eEnZJhwBBUs1z5Ohiw8nHcd0HdljN11Kf7mns
         K3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572603; x=1793177403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ay7su0BaQgQc7vNg3pUCZ5W4k0M/lSxdL0nMfamxf2c=;
        b=jilSVV4aJzNmLG1HLWy1GACuxWml8cqEkCJ1Vny9GH55iS9rCeRD6XjuL11dncy8kc
         R7kPEtEh0Y//mKZpGd7fMqTqCAyZI1w0BMj3g+92gmuWylTjg0OTy9SYmAl4m/06L81H
         b5dTXtALktsFlZ0VJVHw4ELTQgIYmW5/z2RxBYLSwA5mm8d1uWqKbFLpfiG9vH8FyN5n
         IV8NsFYGeWecRIXGzAk7fPe4Yi4VQDcehzaDp/Q0btFjxg7YNwc+Iw0/tAukTRDUAE0/
         a9Vvv/K0gmxCSmGbiWVn5/Xx2U4+4lLAW+jySf8uEKaKTTIh1+enL86GvqokEXxl9tza
         DbQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH6NQBbEKbzJgEzRZqACDYTlYHexjfmrRWHmwCMmEsN4QdnbHJRIJw3IT4NShhrFOjuAGltuUSnNWQCSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS8UDTLN2jMjB4I9iLT7lXSu8+d68UUNBanMI0ZGKZuXU/ke6G
	5hQjOL91vXVYHpVf5VYk3/3oxmw02cjt4TygoGEOQRBLkAG0ybOZuoLYUrT0j9/ebtyEtX7U8yx
	fwz+kop52+ZTMyjG/ckfkvX86ZcaH77Xk1p9EHNOGTeGPjTFQHQRNBDl338ZnfPQJAA==
X-Gm-Gg: AYBFou0RkrObSVrJDuYS88K+vs47JEZZU/YyC7gLkeXLmSorHBgvbU/Ux+3MB6TEST0
	iCrtSroVqjeSS2HRl167heUCzFR1SKc00Z6zTC5sqIDMDkWIlCkfrNVJWTAtiZeVAGrTSuUQSI0
	Hi+gYCIRC7ENh1EfSsetoWwo9VJ83RF9doHukrpZuCPgUm+O5qjvECKM5gQ+5LdVcQqPHFDD7wL
	nZvq4sJkItHBRGQfEp586tlJnQkGCM1/hF9svc4MkyeSddClhvHowJYdYo33Ie3El4C1OLYgDud
	Hpc5T9p3iSO7mrKM0g3eGIEWQA5S4Vu3MxEBLRtNjFNxBRax6VMQ8/bhXJf2vN1FDgrShMB3jml
	Nmu63DbxY7yipAjHYi8aAvL11yUgb0R9eaHgaV966HJBH01rtU6Q/SIgFfR1sourpmkmCOSXrfw
	==
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr26144185e9.12.1792572602664;
        Wed, 21 Oct 2026 01:50:02 -0700 (PDT)
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr26143565e9.12.1792572602177;
        Wed, 21 Oct 2026 01:50:02 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0ad18esm30903515e9.0.2026.10.21.01.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:50:01 -0700 (PDT)
Message-ID: <d3a1b219-84da-4ed8-9d87-5619e74bd1f5@redhat.com>
Date: Wed, 21 Oct 2026 10:49:59 +0200
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
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, ajay.kathat@microchip.com,
 aleksandr.loktionov@intel.com, andrew+netdev@lunn.ch,
 claudiu.beznea@tuxon.dev, davem@davemloft.net, dsahern@kernel.org,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, johannes@sipsolutions.net,
 kees@kernel.org, kory.maincent@bootlin.com, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, sd@queasysnail.net,
 shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 vadim.fedorenko@linux.dev, willemb@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261012011707.3378-4-sigefriedhyy@gmail.com>
 <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
 <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com>
 <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
 <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com>
 <CA+7S2vLWvQd7GrnwB+B+DiqAgST8EjfWwBKzJXtjGRBPVgmOBg@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+7S2vLWvQd7GrnwB+B+DiqAgST8EjfWwBKzJXtjGRBPVgmOBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 12:22, Yuyang Huang wrote:
>> To clarify: every I mentioned in my previous email was about possible
>> follow-ups - not to be included here.
> 
> Understood, I will send them as separate patches.
> 
>> My understanding is that there is sort of a pending/implicit question
>> from Jakub on v9: why are you doing this? is does it solve some
>> specific scaling problem or is 'nl is nicer" thing?
> 
> I think the motivation question was on the v5 thread, and I replied
> there as well.

FTR (and just in case it's not obvious enough :-P) the ML traffic is
quite overwhelming. I unable to read some of the email/patches I
don't end-up processing, and even when I actually processed the
relevant email, I could end-up forgetting a specific contents of one
given email, some 10-100K emails later...

TL;DR: please include the relevant information in later revisions, at
least as a reference link.

> My original motivation is to simplify some userspace hardware offload
> code I am working on, and to finish moving "ip maddr" to netlink.
> 
> RTM_GETMULTICAST already reports IPv4 and IPv6 group memberships with
> IFA_MC_USERS. dev->mc is the only part of the multicast state still
> available only from /proc/net/dev_mcast, so every consumer that needs
> the full picture keeps two paths: netlink for L3 and procfs text
> parsing for L2. The offload code above is one such consumer. iproute2
> is another: "ip maddr show" already gets IPv4/IPv6 over netlink but
> still parses procfs for its link-layer entries. The iproute2 change to
> drop that is ready to follow this series.

I agree that the unified interface makes sense.

/P

