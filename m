Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091631;
	b=J/DeKC5tqgoDUbz0d6sv+/40X62h808d+M/sL+9hid/IpMdJChPiJoXHZvaX/xdyWV+N
	 DLRiTxCLg2U+eG73gdZrPLFelCgL91Y9WkF/w4eIeiPtdMTNtqQZv8YLHxbjf/l1o9RZ2
	 nhIOw1nvaFKRwNA8x2vLyV/bTezp5Ol2N1pHzVQnkiGpwnZL0vJEIqx/hBQi37ehDhLYd
	 OOhgAST0AgHKZOA3bprFD9q2gw0m5qn8LURsByYYjb6JdQ5txPjO+qaeg3PXBm6C+U/oT
	 SXYoRvaSB5TL59uuMlIq4IZ+K6+/QBgz3Ha9kQCdCaokcl47ibpWOJhICHVgA2fClhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9WCkf6QzTLTdkFQ4qPzTcHJh7ncWmxtj0NsBOYpx7Cs=;
	b=yd6deTN36+gwHPMMsH4wu+npbmtMArlWG+EiM/GsrsouTatlJizuk8jcpg3T2qE3gIRr
	 +yJJoQZI2iHgGaiQNBzS/Q7n4W5+f6Q+AhwZzf06aBcxEKjq525sidTUOa5+MVSL9NJp8
	 IvIAKCmEfc28djbD9lEZp7tZ0CblqJHT9ZciDs5dKL0hbPhEpiEjsF+H58WpcR6/uhj+w
	 eqDFAS1WZM7l4svsOFDcawNiydHEJSDu4pW0CSaH2dv4oxBRzVXkS5WC77GVw9NQIim0E
	 3N2KQUmvyz63ogVm3Am88pJ7rqYGd4GeEDahRrToiIUGR+3OP0r7CByVNRj+2VpfURg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q00wVZLo;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BAD606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BAD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q00wVZLo
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4105615e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793091628; x=1793696428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WCkf6QzTLTdkFQ4qPzTcHJh7ncWmxtj0NsBOYpx7Cs=;
        b=Q00wVZLocYy126NOMQG7qq9WVmZmohO8+rtmzwAThGXgqrwxgbH4bTmWPDWx6dcxGR
         cd3CXr6LLPvEAr4u8b+qwWWK6gFh0pGs9etBJfXOt1hEZ1uGK3Y4YcBCXkBaW34LDUVD
         8jN143vhuaJ66M/PLHmbOsfJ/JY5AeKtG6dEP/JPtfeqJnkK5LPyvbxFFSqBNs5W711J
         62NEmRsAJY6jJgdFsOpf/emt218T1qM8oNzhcwsGb/1LHYi68ZMF96vWZFYP+5kb+iOj
         hI1ROUwAcT2tIsKXbpXhwWWVJrQo+XxV3oNQuO1zdrWYs2hYany0znrIPgyb7hZl13vm
         u/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091628; x=1793696428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WCkf6QzTLTdkFQ4qPzTcHJh7ncWmxtj0NsBOYpx7Cs=;
        b=NiCWzstxUK15lpIlpdNxGC+grJg6LL0aEOmLd4Gkn8JfFuibmm7ZgzDJxNIAxG8vR+
         sEWfsnHTPwzMW0d/Ss5f3wmIIbO9RJXJfIKXM2UWcyG2gbwKYMDkSUBky0q5TpXVoc8x
         NaugVupyjMGQ2/rQ8JrD9DPoraeHvzTPfSkr+kUam6jEJ7VySHUrqojTQkH4FuwN8Nmb
         z7WV0sDJWwSYxepCs0h+SRn5KhZjtNTD0lefO6RBJE8U3L1pXqCBpZwSr0/Leeva5dCb
         5UMNSlM26B4z3PeGXqE7Nb4vFRwP7u6LUfpsB3lZCyDU/uy5CL4DF/Uw4jZb0StA6VJu
         TxHw==
X-Forwarded-Encrypted: i=1; AKwUvBz6Qh46HpyIveKfQJbhLzo97mmC/Mm782g6FjMxhBan6hYE+4o2lft9tyNy14ys44V9L+l2QRQqKRqtej4=@vger.kernel.org
X-Gm-Message-State: AFq9FYItWUMoLubTvjZuywjRxo16qgUXbbxZ8wmCgeTLqouChWhmjKoF
	jlNGrf2L8TsJ/Z+clm2JquMIkyQUthlPLkOoJCImj0km5lX67rxx0KcBxCKcqNm0B4eBgQVp4zH
	tKR3S6/w=
X-Gm-Gg: AYBFou2DDAHiC/owpJghrZD4BnEr3WW0jxmhvP+FyT8OC0uA595wbU8gZjXw7ABuFc/
	kp59Wb1hjYtyQ2Q6Wdod84DeS7WNWPPmxrGoSH5WzA71OwFo0RQr7fnc3Ch0wwcSCSXTR5p030U
	WVX8t72ttn3S0EYZ/pwn1pz1M4yOIqgQx64xnlsjT+2K5JV4IFKGmxHz1XtZoUO/pt8Q1g9pvC7
	uuaI3FJVEqpYQf4xeOUD66QMG4ersDpxMVTgzlY5QsIrEkVrTB5p7Dtjk7ZcPu+iUS/8HLKWASs
	xTuQEZI1tDmnI/B4Z0Cg7VwTFvQPMXfMdC2oL2QDtHOTKRtBEctcYrnSlutuzExAzA/xGZd5Tqm
	Zpdr+lopbFEEiRoAfAF+MWMZYteFOnptp+6mB9Efg005oQbWy0qWYQu9hgL7ARG2lbYqi5RxWyK
	Pp5B6x5D5WYXOXbw6M7QRKVbvBkeHZbgq+rNbt4tvO9VYwsMWHuPmcB5qQRXhaDXhF5Xxq1HTbE
	1xjATusgK4DPLT7qmEniwiRx1HK1FFEll51DxUzO1bwmVrTuKasmaAQNexOb3zHF5SuGldgYGqd
	aA==
X-Received: by 2002:a05:600c:34cb:b0:4a8:a341:2377 with SMTP id 5b1f17b1804b1-4a8a34123eemr7244685e9.3.1793091628213;
        Tue, 27 Oct 2026 02:00:28 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm251375205e9.0.2026.10.27.02.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:00:27 -0700 (PDT)
Message-ID: <3e3b9652-7de5-4391-8b5d-122f00c4b585@suse.com>
Date: Tue, 27 Oct 2026 10:00:25 +0100
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
Subject: Re: [PATCH] drm/fbdev: Replace __MODULE_STRING() with __stringify()
To: Thomas Zimmermann <tzimmermann@suse.de>, Sasha Levin <sashal@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022175543.1831620-1-sashal@kernel.org>
 <2a9b1325-386b-4460-8651-13fc43dca6c6@suse.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <2a9b1325-386b-4460-8651-13fc43dca6c6@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/23/26 10:51 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.10.26 um 19:55 schrieb Sasha Levin:
>> Commit 08abfa5a161e ("drivers: Replace __MODULE_STRING() with
>> __stringify()") converted the drm_fbdev_overalloc parameter description
>> in drm_fb_helper.c ahead of the removal of __MODULE_STRING().
>>
>> Commit 6b5a66fd9f21 ("drm/fbdev: Move fbdev module parameters next to
>> module init") moved that parameter into drm_kms_helper_common.c while it
>> still used __MODULE_STRING(), so the conversion never reached the moved
>> code. drm_kms_helper_common.c is now the last user of the macro, and
>> removing the macro breaks the build with CONFIG_DRM_FBDEV_EMULATION=y:
>>
>>    drivers/gpu/drm/drm_kms_helper_common.c:46:18: error: expected ')' before '__MODULE_STRING'
>>
>> Use __stringify() instead. The parameter description is unchanged.
>>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
>> ---
>> This depends on 6b5a66fd9f21 in drm-next and 08abfa5a161e in
>> modules-next, both queued for 7.4. Petr plans to remove
>> __MODULE_STRING() once his conversions are in mainline, so this needs to
>> land first, either through drm-misc after 7.4-rc1 or together with the
>> removal patch.
> 
> Dave, could we put this patch directly into drm-next? It seems like this fixes a broken merge commit.
It looks like Linus took care of this. Merge commit 5b0764a53235 ("Merge
tag 'drm-next-2026-10-21' of https://gitlab.freedesktop.org/drm/kernel")
updated drivers/gpu/drm/drm_kms_helper_common.c to use __stringify()
instead of __MODULE_STRING(). The current mainline has no remaining uses of
__MODULE_STRING().

-- 
Thanks,
Petr

