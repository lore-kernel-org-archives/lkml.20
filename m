Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504803;
	b=UcoY0C1+3GC2R7tCB9lRuVHMcBny/Xt+bWHu0sEzeyLOo+jR0MIsRgvxUkfoec3NEzmQ
	 F9cLaXq+4iE6DIkFrbsrmravaQzxQnZudXPBzEEEWnD1kWKBIfAth/U1xaINVHq3RqW7Z
	 QbCzVMFsSlhYOk0/24ZnYQtyW1Hb1OMNSD+nilwG60smo2Q6hDf4YntTbe4GCvA9KVDSt
	 N23Y42XWUdQ39mkrSRYu4+U3ze2vYPQLZZXxaWfR2/CCsTg+HTKafFfhoeE6sEaiWKdsU
	 viRkUgcdcr43SvjxjPp+4KGKJNHJIiPqbFbXSC7MLT0NZEggSsEmQTGp9oo1fGR4eqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504803;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
	b=jXG5Q+abx25c46wNPpHfKrgTfLqX8JdN+mwXWPD/NqDHEiqZQnDeJeYHT8xV+hkQH66U
	 /9hQCvP0PLTuZtKV/Q/q8h6ZTUywGfNKh2g8bKyeJdWsd3e1HSgDe1zBEOaw9H7MdE49T
	 Ec3/hou8aPjBhAAIRf/yuODn+Xfc57zWNuqh4ELHx8NFhp4ONqYnlS5ckKPJq3aiFgIXz
	 jcsU3i4MXTdM5h9nm8yUzRX6Z5LszlrkhenZOSq/qhm49q7G0/yq8tYiRxgvLTwoMYrCD
	 Oo688F1msBVFrJ3aEjOsOEtY8JyhFhLlNNbllO5VOE0uSNF8TBoJijTSsztWaUHbVhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d9vYlLx1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mR8JAM6D;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF11C606A337
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF11C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d9vYlLx1;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mR8JAM6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792504800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
	b=d9vYlLx1uJfQpOLx3cae9BhEjSKAJrEJ9RcFJlRlYz7g8vr790qjfZnywlZeZQ2dMEad8P
	tt7XZUJ2cdZejWWgQLSlU1l+t9Vd11OUucNjVU82OllWk3l46WmpafYZ//6bdbMCmJabSS
	cSrvGpCL/r4LWoX5pb2aFyWO4uuKAPk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-222MJqcsPHSMcM8yeLpd5w-1; Tue, 20 Oct 2026 13:59:59 +0000
X-MC-Unique: 222MJqcsPHSMcM8yeLpd5w-1
X-Mimecast-MFC-AGG-ID: 222MJqcsPHSMcM8yeLpd5w_1792504798
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17741243eso19626355e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792504798; x=1793109598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
        b=mR8JAM6Dx+SPWbfkeZnOuGFetgjlmDjbH+LFq7jAyJiAKciZVgzTSeI6Ngc+/YyH0P
         mCirkApaIVqwGqDQdP2i06rvMK5Lzpo/0kN8K5u1fw/RGJHTSQa9GjEofK8nUNDMiR+8
         R2Gb3eriJjl0yEV0gN6e3mnMU+2KU+03pZhqTDSW0iKY45Tof4QGCbXBCBmRfrOJGxN3
         SDa1e9D2dcwGvBSzSTbmKB6Y7A/s8AxccXVSNLU6bh6lQ/ZgeRH3t3pU4xR5+F4KqSna
         74f949/TZbz4xCOso7OpWx31lR91CKkQO8Scbt1MpT8t8+oiHGy/upa3vJ7adtQbFopZ
         7D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504798; x=1793109598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
        b=RpscRTe1eQRo/pT8VMJUp57aC8lOKnmqvuczVnfLCGgPIFrxy0AFe7DJlgmQQaIamc
         PjU0ANTetRC6Uy79wuecZRNgnwwg05O0isyjSZ2J6kIeOt1yXGXu9oM5sha/Dr5XN7WM
         PlR9TQOjIKtb4lJrmbGaDRngzjbkqHNP2jwXt/hFnkTBZYxx8kC3iGl4IBs0B0hRBcoI
         7uNFGuhw5DWNWKHfSxSMpf2eWAl4IejePXwzEPsVuKGq1lszTPbeegbX/+AnBkH6sHLw
         ruBivGx6WvMIbrWwarHo2WxDToCOoqd/b5lh+0keLxMdqtDAcKN7S2qG8yoLQZ1mNI7L
         /IzA==
X-Forwarded-Encrypted: i=1; AKwUvBzUzsGMMti8JTXySprV0yOaY7iicSZQnpMN/hO7lus4RvasALDDvKzE6iNoghvljGk3JkD3cYuv4fCTzEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1eNAXPjgq3kROJ09y5A7lbxbeyD904Xb3flKwKeAKUE70Nqsu
	7yBbt3fRl3KmSP4wG3XwCgmJ08FIzUEnOGZGSN1Q6Fxvf7aLlDY7ZRV4dv3KfQR9SXkUFS0HGP3
	KYc/ElxRjqh2kwvKtC7mq1RGRcLGc7YP2KfJSuvpnm/vkejFQ5LK/p5Y278CsgjGpKg==
X-Gm-Gg: AYBFou3XzY00smQ7VfG9v1YMHgT2XeLiY6YqOJ/qH4YaAkb68EPUXkN9b1gi+5IxHhP
	cjjxgsWmz9zxlOL7VnWWBsi0A/cftnjSaK2J3M9zOHGfXuO9f/0Ei5l+k4bCBaMNqkhaoPGRf+K
	1atztv0e2CRreNgglRhU5CrLo6wITEfpxasAFcMnbqqGk0fS3iJfiW+0ebxg3y1GXhJ61KOtqwO
	UxXyl9EI8FvBLP/egbLEq70sht9m1AzGbIKxCyHZXicz0L7IvFqL1AUMi74oj/5qVI2aUcQNKxS
	uwtObD6FnEL1pbcd9RIUfln8vu8GwUD8ee1qiqE3/fPbJxd8SYsBht5NsI880TyneuaYkIjqbzz
	xiE3wh8V/yX1aiN0QBzjBC1L4p0TNV1sto5EzvRA91/AS11MjUA5ccRR4cFdnf1xz+wxg2EpK2Q
	==
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr234316755e9.0.1792504798223;
        Tue, 20 Oct 2026 06:59:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr234316075e9.0.1792504797756;
        Tue, 20 Oct 2026 06:59:57 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm82778815e9.15.2026.10.20.06.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:57 -0700 (PDT)
Message-ID: <106b3ab1-77e2-4656-a124-7f78ad890ee7@redhat.com>
Date: Tue, 20 Oct 2026 15:59:55 +0200
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
Subject: Re: [PATCH net-next v3 0/7] ipv4,ipv6: convert the getsockopt
 switches to sockopt_t
To: Ido Schimmel <idosch@nvidia.com>, Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
 kernel-team@meta.com
References: <20261015-sockopt_expand_out_v2-v3-0-7d05ef2df448@debian.org>
 <20261019081907.GA2725184@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261019081907.GA2725184@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 10:19, Ido Schimmel wrote:
> On Thu, Oct 15, 2026 at 03:05:29AM -0700, Breno Leitao wrote:
>> This series continues the migration to sockopt_t, as described in [1].
>> do_ip_getsockopt() and do_ipv6_getsockopt() still take a sockptr_t pair,
>> and everything they forward to now takes a sockopt_t, so convert them
>> both.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> 
> Given the user visible changes, the fact that the merge window is now
> open and that this isn't the last part of the conversion, my preference
> would be for this to be re-posted after the merge window.

I agree on the above, also clashiko noted that patch 7 lacks an additional

CONFIG_IP_MULTICAST=y

/P

