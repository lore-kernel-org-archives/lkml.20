Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7640E306746
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428268; cv=none; b=k1fWifDnSSDTn33IFG0Xn6BG+2ijucVxxEXpv+x3+AxV/8qW4s96RK4sokx+wzfRHZF834jpdwmlGSBiu8r+VTONRxa954G2H8GhGXiLUKT+u1gdUWMQnjbwQLb0H74sk896kjfBNCH4zYC38xtem44qjUnHPwiB/D2D0KiDf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428268; c=relaxed/simple;
	bh=AgOOQ/X8FuhHbRJqDZqNm6FH9w9WhULgA91rRXqTtc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFOv+MD2s8uxWiX188n6MyK3VglnY4nkbGjtXHUZ1W6eJx3Pk54PfJrvAJNEm7YwAZAa9/pxhVgRvZ2cEQHwd9daQnGGt99abjTlQVvfxwwjYtkuFnMN7Z3H46/C68bsIGa2/IqoKdS6tSwY8lxlxv7k93BPHO3JpLgBJg9Q0tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KhEBxtGW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7CPT5Wa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KhEBxtGW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7CPT5Wa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788428265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqyLfPimaSH505OA2sugMY0JdybunaldflNnBPDaYSM=;
	b=KhEBxtGWpZbJbgIVYiy7gwdV59R+PFJAP8jPaeNsJbxdqdR2u19WIn+Iq9jsO8pB9JlJ5t
	g+qBs5eLX62zaxoz9oioDhdhfJwGthylurm8ZoRL4KQR2j+ITTlAqcMWv6Ei+BCiTUYNDr
	upcZV6KeOlSNbVpPw2zRjCS2fILUmik=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-ql1J3HfyP4GRFW0j4eDayA-1; Thu, 03 Sep 2026 05:37:37 -0400
X-MC-Unique: ql1J3HfyP4GRFW0j4eDayA-1
X-Mimecast-MFC-AGG-ID: ql1J3HfyP4GRFW0j4eDayA_1788428256
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cd55ee2f7so17424275e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788428256; x=1789033056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqyLfPimaSH505OA2sugMY0JdybunaldflNnBPDaYSM=;
        b=N7CPT5Watp6i9uSYGFDRuQD4VrZiilmfeRRuGzbmtQa2ZVRwtcRxhxgJxvs+AIDuh5
         jZObeFqSQuozTkdvGYsTeCO3RMgdQa+4ECB9/EOkSeusY7XVKGwlUhi5dG8V4vLGX4IC
         wxomQQbgaCpZIJGskjHp0vLFZc1OCkZeTSMIiUb0Bpksz3U5hl6ItsLG3PdYinWRL9Yc
         rT7UKExQ0TaP7td6p/9mK6QzXzoPu82b3hNMhLVF+0pG5yeIEKkv8bpcAirUTYYu43xq
         tZeYeAYJDeOGTmKC4cQf+uYRhg4aQkaNDl0Is1DfdgXorKvhySqoP3LmrCCzny6ffApX
         /yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428256; x=1789033056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqyLfPimaSH505OA2sugMY0JdybunaldflNnBPDaYSM=;
        b=DFZXHaJOd5vtRmLxw5g0hJe074vNIQC+7XtJnX8Zrhytaxhzum64+w+4so4Gg1Cud4
         sNDpb8eOt8AsbYJJ7PyqWncN71vbzcjQe0w3gkS8Pry3IehmNccu6L/OT1hm7ghXIvai
         CsUxliX7FfKT+JUoFdMnBFOu2V3+4el4OyE/Qst7Nk9oRkJ5fhuBXdR7qAoFf3H7akDG
         7oFc6qW5EXnt274SPCeSxxVvd8JctxQWhiWYj35QA+jH4CcD+WKNwN6h6zW4ADIzYLp4
         4q70xHDaOhLGln3zlV+ENnQnlfU4sKpB4EoaozOGXHgWBhUy2QDONnRnKaG+24tSTTVH
         hArw==
X-Forwarded-Encrypted: i=1; AKwUvBwUGOrMBChuTuAtds9B+mIzQrYTL9hXri/Cxl/pckvR2MjjUuKKyduCpnjur9n6Sr5HNp2jqQ9t10gpY2w=@vger.kernel.org
X-Gm-Message-State: AFuF++mzGbiXi2lkMUVkmQGmeQ/Mr8pNNhNkr5ZMADhQvHdWn4wOR2Mt
	XS0eSQoeJhHILEPi9mKIPI6sa9v1b9IxLj0QEKk8pbJIkM2BHMtS4EhlOVGFii/s36lPPUnFveu
	HUBGMF/TgKXYXMcy3HB2CLiu4E01VIufZXsQc4m95dpU3m88cd0KBUdL05POBLDX97A==
X-Gm-Gg: AYBFou1JUJEgrxH4UtfQYxyqzBEJAGodIAhzDew3v9WeW1+PiRkMLLiqroFqU/8jnhS
	rDHk6G+UP25URt7KqJQTYdXGatMOZF66qz//MbYYqflyHrqn5hg0/yqRjL/jkbTka3GE/Q0CcST
	kykvudIcG6eV1uesw12pNZxLu2qcSrgmgkGkRUVnnfSzEKYRUuwBB8H5DjUq+CzAtzxF/g82IPj
	sEk/bvst0+0mdhFS9nFGEusJnf2vp3wzH9HimJWi8hRziWFmhxds/My9P5Ani+EsrKtEHUKiMB5
	Gbi+6B6jVJEhoDl2xxdelqKtzS9yWhjDAmuH/IroACuYdB4hQwXalB+iV2vMKsDjUUZGzX8lCJP
	AGdCi7NJ00J3itxcqStwS49lQrB4A8TKf/LlS+meZGQEzY8ylJr/5ywqqZeaWy/tQN40SjavFRw
	==
X-Received: by 2002:a05:600c:8b88:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49ce584b899mr189686015e9.12.1788428256067;
        Thu, 03 Sep 2026 02:37:36 -0700 (PDT)
X-Received: by 2002:a05:600c:8b88:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49ce584b899mr189685115e9.12.1788428255660;
        Thu, 03 Sep 2026 02:37:35 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f914bsm68349605e9.3.2026.09.03.02.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:37:35 -0700 (PDT)
Message-ID: <bb4ae7c9-e705-4eff-9813-065ea4bd9514@redhat.com>
Date: Thu, 3 Sep 2026 11:37:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 0/6] Fix a variety of TPA bugs
To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, horms@kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
 colin.winegarden@broadcom.com, rukhsana.ansari@broadcom.com,
 linux-kernel@vger.kernel.org, raphaelcf@meta.com
References: <20260902015652.2421609-1-joe@dama.to>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260902015652.2421609-1-joe@dama.to>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 3:56 AM, Joe Damato wrote:
> I am sending this series as an extension to my v4 [1] which was just 1 patch.
> 
> Note that patch 5 of this series can now cause the device to fail closed if
> memory is tight; bnxt_init_nic propagates an error that was previously
> swallowed and fails closed instead of succeeding in a degraded state. If the
> maintainers want the device to come up with a partially populated rx_tpa[],
> then patch 5 can be dropped and this series can still be applied
> and will otherwise work as intended.
> 
> This series addresses a variety of bugs orbiting the TPA code in the bnxt
> driver that Sashiko (or Clashiko or whatever) pointed out and the series ends
> with the patch from the v4 [1].
> 
> A lot of the noise generated by the AIs while reviewing my v4 are unrelated
> bugs with different fixes tags that, IMHO, distract a bit from the crash at
> boot that is currently occurring with Thor2 hardware on recent kernels.
> 
> That said, I've tried to wrangle this series together which I hope will solve
> most of the important bugs the AIs are feeling something about.
> 
> I do not know what other rabbit holes the AIs will find when I submit this
> series, but if there is some reasonable stop-gap that we can get applied to
> fix the crashes on Thor2 (while I iterate on the rest of the bugs at the
> pleasure of the AIs) that would be excellent.
> 
> I boot tested this on a Thor1 and a Thor2 machine and there were no crashes at
> boot.
Waiting for Michael's ack here. Note that I think that the AI report on
patch 5 is not a blocker.

/P


