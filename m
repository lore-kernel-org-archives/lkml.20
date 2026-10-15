Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037D47B406
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049766; cv=none; b=ps5ULLxagtR+ZkJonfEIo5Pqk5wh6c0pNY9AT0lag2iXx7Qu3x4LQAARGAjONBx2LyfNQm/JvR8PDWsJXj71JHlun+n+0Gssh/vNOo1uKwjCpYsYOifl4duS5ZQ9xFHPDuWk+UtJJqcaC3M7JKI0WQa1wo+X0adbhsQ6wOy1HtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049766; c=relaxed/simple;
	bh=BrUMaNbKO8ygteLmODp3rVHRMVxLpGCR9nWZ0qz2Bfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYmf2y5+wlNVGLREnPaXfW05WA1QKyp/SPJqYECwA/ravx7EpT+uoIDTEOvUfb1C+6AfxN5LAGtd/Yjns7CdMQJzqjPSh4gzsKGqVNCx4ePY8lFHwW2K8+fqimyhvtVUjRn97bHFfziFGc2LRWZN6LmEAXEAK5iH59z6YalbyqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ize1kmsO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFf3iknW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ize1kmsO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFf3iknW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792049763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AfFy6KfLE+4KLuU3ZwrUcLBflPtmLzVW3MEDG7MNIAc=;
	b=Ize1kmsOponIDNE49GcXfh3scv0MF0j5z3LZmR343ddGzSgTjixpzHCNU5jfT1EK6axBxp
	hryrUsSPQxMirW6gfbNx4XbnIccP03jMt1043lggXBLB0sfkg+YTiWvIIGHAssUV+Etp5B
	XqJvyqf4E1LyNEnQOc12I47XowsRCZY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-z7CrRYpfNdKCRYe9Ho3ggA-1; Thu, 15 Oct 2026 07:36:02 +0000
X-MC-Unique: z7CrRYpfNdKCRYe9Ho3ggA-1
X-Mimecast-MFC-AGG-ID: z7CrRYpfNdKCRYe9Ho3ggA_1792049761
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48aef5cfe43so2970487f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792049761; x=1792654561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfFy6KfLE+4KLuU3ZwrUcLBflPtmLzVW3MEDG7MNIAc=;
        b=IFf3iknWoDsFHg27E0yVz4+bZ9Lu6Oi/YEs0WwxKcHfql6LXVevs03QVvEk1QYVcLI
         vBt8A00djwWu0A+E2/kvJxoFPLNDtAoGmmHdCUI0H++T4mR8tcNsyljso4H/9g6CJxde
         3sOg1yUav9EIUZcaM+y+ldf84qnJk+frr80Tal4OgVpdXKKPKpzLtBkbTe30GUT4hvRy
         XRv09VsMYhcqFrUMKCNachokuv3yQhP7CQEsyDUAjAiziyzEKqBwuH68Sr27W92dXqiW
         ULcjiTTlaDg6oArPKG6FXluqgkPy8r/cesFMGt9Yakk62TiaEfcJnpPRbMgB1eZC7GYh
         j9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049761; x=1792654561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfFy6KfLE+4KLuU3ZwrUcLBflPtmLzVW3MEDG7MNIAc=;
        b=VxE5UFCY859oRTcKHsX0wbWiTqeBotWichFtmo6io+v9YE9/fmuyDjEDJeqUaJU3cE
         MzyDILIpdyOUEfr2gy5beHXFq0weGh6FoceAnUmG9i/N7BS2pOtcQu5MjHMGiG2NJ3hr
         rEMNl907rt7YNOVvssz6Q+2h+FNh+rXqKJZ/+VRR2nJgDednRQCbLNIMmxlhyqMMmHA6
         ykFXquinezShXGhB26hkccidzaSlwJYmS1d1STI+QXiyQgCwiL2nUKvNSR0cTDWMU35u
         1B9U+Y3vQi8KlutQnQkwY0Go3GERtcbRTFRBbYOi8jQf0sTv3kfZ5HmeHRoys0HHNdjX
         tIug==
X-Forwarded-Encrypted: i=1; AKwUvBxOcd2PNbpyhTKKxRkJ5q96z/xrPgbSuqYoNYfh05lkrIyLU97HCICvdjr2GK+LwwgTfd9M16vx6SAM2Uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdo3t6r3dlDn80/81tuMzV4SgRCTupbef1UEOfo+jFyn8Bj7EB
	15JbGWr82igDDm83pq74S2+oX/DFBBSlhL1/T4p3AX6khXqwoDS2S6dwPmbFmprW9nyDHFxe/Qw
	oBmNF2kTyri4/sMLzzi1temoh2xjJDsqFZkFHtEWbyrcYpCuuS4S4tNMgt1kr2xum2A==
X-Gm-Gg: AYBFou0t5CF+FqSCn0lDX1uPJLSxC1a0h9zAHbatf+Nun1qvR0z/OFaSjU+npm6RCu4
	ew/UbRYOvY1wK6e7cZ9oF9tzE22jKXwWCjOMLSCbV1590HaVFD+d6C8Gl1CjHSnh4zWZzwULXWW
	6lxmRDpH9ohc2zpCE1I6G7MM4UJtmy9BSHuD5h+C/GoHtjBSVdWcf6lyzKJhOZ5Vg35cYSfs0Bq
	LA4ErHoJCr5YT80I1I1SlY4426fH7HSNXyqOqKVpxRR5pKPHvJ0sRSArhEApklUjNs3yvSrdy/M
	i2BV2kWaInCFfkTyGGzFdKnbOFKtQMQZwYqrp748n4HUsZWYERc0nQ47dj1JwZuwkETXe2+FRB8
	IsqumIrKXq23PwImeJxRROPVqDTuv9L7ZKfoRz/t+2v8TW81GchBEET5SCAT765xhF2JVoQS/aw
	==
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr25917377f8f.16.1792049760949;
        Thu, 15 Oct 2026 00:36:00 -0700 (PDT)
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr25917342f8f.16.1792049760546;
        Thu, 15 Oct 2026 00:36:00 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm17520870f8f.51.2026.10.15.00.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:36:00 -0700 (PDT)
Message-ID: <d832de5c-a01a-471d-b935-5ea00d1c5794@redhat.com>
Date: Thu, 15 Oct 2026 09:35:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
To: Daniel Machon <daniel.machon@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Sagi Maimon <maimon.sagi@gmail.com>, Joe Damato <joe@dama.to>,
 netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 daniel@iogearbox.net, jacob.e.keller@intel.com, suraj.gupta2@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
 <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
 <CAMuE1bGXcNwKKX1firkq6eEzymkrDOp8PnnowMzz97SibtpoSQ@mail.gmail.com>
 <20261006180210.03a15e52@kernel.org>
 <20261011084652.c5y3zj7wzmj53ur4@DEN-DL-M70577>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261011084652.c5y3zj7wzmj53ur4@DEN-DL-M70577>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 10:46, Daniel Machon wrote:
>> On Tue, 6 Oct 2026 06:44:55 +0300 Sagi Maimon wrote:
>>> Agreed on the helper.  As on v2, I kept the fix minimal for net, and
>>> will send the helper to net-next once this has reached it, with both
>>> axienet_dma_bd_release() and axienet_dma_err_handler() using it.
>>
>> Let's do this now, trying to keep fixes small is a bit of
>> an anti-pattern
> 
> Out of curiosity, why is that an anti-pattern?
> 
> I'd think that small fixes are, in general, easier to backport to stable. Is this
> more of procedural question - if the whole fix gets into net, it will get merged
> into net-next by the end of the week anyway?
I'm answering here because I can only guess how scarefully long is
Jakub's email backlog, and possibly this could get lost.

I think the key here is the context. This revision is incorrect because
in order to be minimal intentionally adds a significant chunk of duplicate
code, but such duplication must be avoided, the 'keep is small' is not a
good argument to allow that.

I guess a one-line alternative implementing a different solution
(if existing) could have been ok.

/P

