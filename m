Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505147;
	b=ScE2g1yvNoNTMTg41gIZpgUmEr2o/HKxXr0T1jtMYbyb/kQnRqsgWFnSCks4JUIpiRvY
	 abi+UlQtuCUUbRiqWdEOdmqsbX+rOW4lAVXuUK1FgHg7PY+kBkd1afdRfJv9nvvIPCBIJ
	 1qO7E4DLLO77PeMxpXdz3Go3ia3wIQRCHyPumoFT5gr7Aj+ZeCauoaRjMwK+cwWO8Fnjs
	 490OdsV+R6UOQhufnLVwkqCw5zz7SfosVdHTH4HDjiHmth+xjGfhjAqpLxzBWmt4SX1kh
	 aD2Jt87+9dkw3WQQbNsNqS4L0lLlV9mMZfnbw5hTrNLRdMtuGCzjMveyqascvDxYKsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505147;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
	b=g0AFmfQOYNM9jx7Zy8NjK8UU/4JZt7s0p/H69teaj+xjih51+rdF2qLDcKUSFSvuo07a
	 3aBGHi8rTHkFKd2I1nTfrELrziE+KmyC7zWbroOWV9AcQaCPNLwPr4dXstd2kChOKDFt1
	 BESwJt4bEouboYgo0JlJceZ1FrFwzmx3/egnM+6S5O5/UuwAkFex2FfQJC7vUr5u7Go3X
	 kyOLNPjgxMQHbx38Z/xav4NqhIW0Y54d6/96nRIdg+jYcEwN/igMjTCnH2DIchBKucoQp
	 OZjcJHLHnFrruIPjskqvvJo4Rvp3+VOhLRrjXH3PnapZnq1vkkpVeKaeDVTmrLD85VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nt3i5266;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BVuZOrII;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D64606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17D64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nt3i5266;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BVuZOrII
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792505146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
	b=Nt3i5266bYeuVgqKkSRC0hAc8PiaObZbifV92h75U+uebHzPRgBkHDjvvGnPVdGZUGTbkC
	B2pRS/AbJgBjxsDfbZjzIZYLs1SpcDXwHUDGd8i/XbddCTuM7PmcsL5/wnvo4pbThi3x2y
	W8Px53qxTnh6NsQZCIAboO7jqhx+1NU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-zhrjOktTPFKPzMnR1Vo5VA-1; Tue, 20 Oct 2026 14:05:44 +0000
X-MC-Unique: zhrjOktTPFKPzMnR1Vo5VA-1
X-Mimecast-MFC-AGG-ID: zhrjOktTPFKPzMnR1Vo5VA_1792505143
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso12584615e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792505143; x=1793109943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
        b=BVuZOrIIRZeNQ7/dQ54GjubARN7Ii/zM6ccftk6Numa1K1g6WTAo2y6KApvG1+TA+b
         VhM6V+oduSJOVU3pQR5H11182ZJL2rPOGYmVpySDisop50RXbEJsCHiNPpmQ1SroM5Y/
         mpCwq+y8luRBaJ5FSwRoHQp8jqg9BUEgWiFAl8l0WRKdpzKALRRP3CMHsWatOHJU2aXm
         inV6qDJwsbNK0pFpnFblyXeiBvUpIknGMLOp9DpWZq7qsG165txoBQnfx4pNgFygcrr4
         Hh+8sedn03eXfvIc56XssmAttSBjVd7lz7fddPOyn2223/Ep8xbANcj5l7vdLbKquic7
         FqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505143; x=1793109943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
        b=P72xwNoXfqTb7Yc/1kWErulFBcS3FewBk5wjVTzoh7cGdHCVmL4S6UdNRXVYS781OE
         7jlR4NFBjrp40zO3QH6R36dILK9rzaAUewKluTM1qRgBo90POisxQlobv0qPrbF0ciqj
         oONRhSN5WqQuY3MPsNF/dc09W0BM5XdPMv5TBYoMAoov9mYs3ji1c5xDAUrltaWhieOM
         IGggKxV9Xe/o7Lo2GDZaOmbHoGHJkbFfdCncwxTXI/34688T4klb3OsMXYh0gB/5QOly
         rT2afJXen/iNtltaI9KVXQ57u4BljTZDCgmHGckWkbQuQsW2ZhZeOKz5JJ0NQOiRkhI3
         dGZg==
X-Forwarded-Encrypted: i=1; AKwUvBxn2PteKUUdI96R9aoUap76uKm0j2WhKzYKt/FiFUj2hBbfrID2e0I8OU5wfxvq3T7xqOfiA82aApunCTM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuLt/b4JSizYgji2hDK8W+DQsGKpGAkkLIrHonyQAkTAjtMlry
	kU2lUlkwj9hX0nW8T24yiWJIZiG1ZBYyq9qjHqhd2mx3ozcxAapFpQaYV0PwO1WtbTOFHzdAROm
	Y7ZDSzTWm+XjZcBq+IxpUpNmddGH1W5+wEYuunJvCJfVyPRRx7/V5ZFoVrr67AFu4Qg==
X-Gm-Gg: AYBFou2eg7oULKRmII82Zi3lC0jqwEq/AHVc2Fq0AqHTG4odQ5oeePiuVsMI3Ee5lkF
	Ta0Vvxjx81mN4eE/yn2OlF0zo+e1lEHGMSj2uYfGvdmDrK6z6vrwzOHpMYmjqRolcKqWxDmD/F4
	BDcoSF3+MtxsaNawAwWvGuzrn2Cr3T1qnQf2mZL/sk9ZtzbsdpB9MXrxljjwO4jEvaBv0OlnfJh
	eVsJ0/8bC3LsySCjtCSXTI7Zr/ORX5fWMP651uc5edbnlDH9oUYdXXuWIBiU2UY3HFvRU0qCIhv
	yyMB17n1n0mZltWuOboCbn3lz15BrrVzyExwJpXv3gPNFLz9OH4FxXnZpsn+q0UAPblUcH+KLlw
	ou37mScjAXVUS7h/WQoOMfHJ0T5d3Fjb1TwJmkKzMO3LG8veNnqCg6k90dKq7+G1pJ/beIHIr6g
	==
X-Received: by 2002:a05:600c:3f0e:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a1fa33452cmr18514455e9.2.1792505142687;
        Tue, 20 Oct 2026 07:05:42 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0e:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a1fa33452cmr18513575e9.2.1792505142147;
        Tue, 20 Oct 2026 07:05:42 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d43242sm69875765e9.9.2026.10.20.07.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:05:41 -0700 (PDT)
Message-ID: <7ceef2dc-717c-44f5-9974-1ed8f0440fa3@redhat.com>
Date: Tue, 20 Oct 2026 16:05:39 +0200
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

