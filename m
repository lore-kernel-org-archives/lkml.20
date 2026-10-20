Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480312;
	b=py5yB7Hwvz8jYXnDqqSGSpKZhssMpRmBEUxslaZihHnhDwVFPojsS6a3WYNUNSBbo+/r
	 skas/8x0FOeqGvdARRRvxdhpU5xs0GkJTmZX2cLBe8ZKulzI11kdUy10hWe8VlYRAHAN+
	 mMneCKJ8rRe6hyz2afHgCyp1KoBepOyV9JzVCMm1HIKRVedFWPWZ7krfmGTEo9jQXaIZN
	 XYhx4RSRvfUiShp2hjC1S2necMsxBL3V4zlkgjKpcY9joWosVPu03wy5Vob8N6Bx06MZs
	 rfx7rfFTcKrSvy95Ob+Ppmy/M9T6U0hiwW8CILqPLsSh9DmhHiKKcC50RwMA3kP9WFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480312;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=M2ZWtK3jwBgT6W5EC/9V6YJ1MiOaCmKaMmxzxQcJy6w=;
	b=ZaVvhGrZnUtdtUQWwol24cuhLj/dCE0IgTjZdeCuWQRZx+9YdoNiCW5P4fdFgYvfAlT/
	 8RbaOcL0Bd8+1kyI7TUCLP/c2pWnYwPb77HGQWgesY4MY/Af4Ci1dqQ+pUDicMjB7sJmq
	 ieDxWwBxf2ujlUAAOKvo4hkUYBTecFX/3PRsESE4Lvq0jKTou71bmXIeiEOi9XRl74pJQ
	 wjaktbepgYXqNxfaORrn9TeSftszpwmZZITdVNH4wDOwe9O6/5ha1qAbowYjC9rqmtr7w
	 43uA7mtqLU0x0yscPg/2HzfkggjFLh4srgKoWsIf+do2A5fZVctFke/lIcYtvIaBpDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LZuXs8Sb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rVBKfbQY;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE8C606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE8C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LZuXs8Sb;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rVBKfbQY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792480311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2ZWtK3jwBgT6W5EC/9V6YJ1MiOaCmKaMmxzxQcJy6w=;
	b=LZuXs8SbOiQdxpkbYdt8y21Q4b9/9y9xum1kxIu+N5nhIp/nSPJGDOT1eKSiZfrkT3OmSN
	rlll/u2USncnr/RU9QK0BeBG7YlAp5l480cAW0YTe+zllnrS/gDDkQpRTsTJ+NuR9wDIIk
	SpsApKaXavsG7aAfA8AMliX2yWi17wg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-xaSJAoOEP9-tAUudG5ujrQ-1; Tue, 20 Oct 2026 03:11:49 -0400
X-MC-Unique: xaSJAoOEP9-tAUudG5ujrQ-1
X-Mimecast-MFC-AGG-ID: xaSJAoOEP9-tAUudG5ujrQ_1792480308
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so20741615e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792480308; x=1793085108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2ZWtK3jwBgT6W5EC/9V6YJ1MiOaCmKaMmxzxQcJy6w=;
        b=rVBKfbQYqDfcxMDVajSJ0//djDSLUEq072XS+G5TL1DWTT0+GB4v8hqSlkBH/fHiYT
         Me4ww78z3ubKuKElpTYoIogjUXyPMkuqowXO93J3x+nDZkR21E0A0kO8qfzpKIoC8OpR
         vePp6xjRYxl9Zt+ym9JLChvG0fbMHq0XOMTJcaDLcsSm04nGo7scVy9fydRuuzA7r+Lg
         LrI06nWVKT0x2/xYp35Wkl/uSpPwo6pgwDxc3yI6/QNkjKT1YLn3TQmtRTa6G4FNio3K
         KmNM5uYcp/W9UmNDDK5w7mep/tycZo+DZ9cSAFgyeCdZBuqYgJO1oBCKqmC5UvvjEKWX
         EDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480308; x=1793085108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2ZWtK3jwBgT6W5EC/9V6YJ1MiOaCmKaMmxzxQcJy6w=;
        b=YYyo5XkKTTZjEV2G5b8knIFFennjDmdHFGLIgZpt9ZZSgonNZnQpHkseD6zZ2YRBrn
         W1UYGELuCEiP1W/bAw9ReTXRD2V2BLxx8JHjYrQseZbarmL8GDBZjco0IczhgYqtp0D7
         FGXE46I21+9cHtKAV9jaMMCiR7gsiy9T8yeAfSjdHy+NBROknPqEa2jm2DQKC/kvN4WQ
         iR/+qSQeYSr97TN4Aoz+9Nf6RV1JL9lIPjpy5s5SItm5CzEE43SJkskLehtBU09OkSVl
         EIq5eTt8bR/xDdPXJjYl/eClBI4QXN88ZYt85Ak8/ZsliXjG7mhX0ZSpZ+reI4avKc5D
         SMGQ==
X-Forwarded-Encrypted: i=1; AKwUvByVzUjb6rPVO7O2EFgvNb+dLCEexMh9cQF0IO0t8AttmjRazW0KxVuQK41hOdjlBjBJt/7bOyKWcRwbnxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxgSp0F0Sxo1Ow+N/wGSvf2eA/p0ZGPuHB3bwIHT4D8kXj/48k
	bfTrVQ9bNN85oOE6oLysZ0ehUJSVSVS3/UXpSuRmrteIwsuRM8WXlLdqm7nXJIX+KyhVi/3Ma69
	x7CyTUjZzXQ159BmRNp7y8n96kD67NikrT1tHw51gb/ML3XI6rj6pTb0Gj2k3cLTWbQ==
X-Gm-Gg: AYBFou39bsSmIJlJPsqdPXxAdso4qHRrAgaSYkbqjBdXbIjB6FWCIbE3u5ThkOdBdPN
	5QQxcZ6J9EHJ3C9ZPqmZ2iFkiNPUWJhmFhXC22G9ASHoGRpPazUXDk858VOVTeLWdlSRRzKjWjz
	lUFaCwhaAwSdAYR7gvhYANbUj947ZUP0FrOoEdMdqRzsFo/bwzMFbmkd2UiE770VndP0vyPxMxy
	nNslVg0SWQHMI1VT1DQyCnx/JZiZmRsx37d01fsnEGuyZTzV5NhivF6GpA5xUH2AeINyp10wIoi
	vxx1IQUEzT/Df2+KQL+PlZwsvfXei2eoZ77xZm1qcSliaeB0hYas2JWRqFIeka8AV4KzltEDOg4
	pRp/bnnZYnGbFGtsmGdqj4jwu3ZTKkL4MfTrOTuzofSJ13xohPFRz19g54cgBgP0in7flnzCBiQ
	==
X-Received: by 2002:a05:600c:3e05:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a1d763625emr205330735e9.29.1792480307743;
        Tue, 20 Oct 2026 00:11:47 -0700 (PDT)
X-Received: by 2002:a05:600c:3e05:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a1d763625emr205329845e9.29.1792480307327;
        Tue, 20 Oct 2026 00:11:47 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm331515125e9.2.2026.10.20.00.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:11:46 -0700 (PDT)
Message-ID: <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com>
Date: Tue, 20 Oct 2026 09:11:45 +0200
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
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/19/26 13:35, Yuyang Huang wrote:
> On Mon, Oct 19, 2026 at 8:19 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> I agree this is not a blocker, but I think it would be nice if you could
>> follow-up on this one.
>>
>> The solution proposed by the LLM LGTM.
>>
>> Same here.
>>
>> Also, still speaking of possible follow-up,  I think it would be nice if
>> you could change the addr list lifecycle to RCU (no idea of how much
>> complex would be that).
>>
> 
> Thanks for the review. Since we're already at v12 I'd rather not respin
> just for these, but I agree both are worth fixing, so I'll handle them as
> follow ups.
> 
> The first one is a simple fix, so if v13 ends up being needed
> for other reasons I'll fold it in there, otherwise I'll send it as a
> separate patch.
> 
> The RCU conversion needs more thought and will probably
> cause quite a bit of churn, so I'll try it if there's a v13, and if it
> gets too messy. I'll post it separately later.
To clarify: every I mentioned in my previous email was about possible
follow-ups - not to be included here.

My understanding is that there is sort of a pending/implicit question
from Jakub on v9: why are you doing this? is does it solve some
specific scaling problem or is 'nl is nicer" thing?

/P

