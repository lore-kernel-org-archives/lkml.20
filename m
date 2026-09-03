Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D173DDB0A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462407; cv=none; b=Fj6bXAvT+8zjY8UOVMCyrAGTiwlRhPX1TTnlgd2gzQkDJnkTDAe1Abz9vQcA7sIF9UfYniOgyEkhEcTO67iYNq/STyZCz0uOUTr6Daw/d6sCO4PoIGYI1npmiFdazM90M4G/eBk8l3tHNdp+myJSsB3Wm4NPsdnsGGlmaJNgAAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462407; c=relaxed/simple;
	bh=fY7oQw8c3LKHlU69NMdT27cOAg14tbfxLSzOFE9RJ1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrZyGcUI0RvqWLBHInKmH1TR4N/774IPeNabPPvAlh6nXIwgi8sGs1JjpvnZiqEs74N3d27HgJp0cYd7nOnld2oyuIIQFAMQwn+KZBJsPrLwkqoPkbjTY4cmmjxsbR1QaVjS9ARAuhfQvXqOWm7Lapz3XF8Rga5XO6fCTu3eLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i8voTZe7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYflEeef; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8voTZe7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYflEeef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788462391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyoPKwWPVR6am9+jaZNykBIgFNjq3alkuLbTD4euEoU=;
	b=i8voTZe7YaRWArN2wis2WOkFXh0v6BjXWoITiHAbQZucMQBbUhi+KnclKCNyW64OyX/HUI
	JvQOuoqGQduNGKt8rtdrRj9OwAeY9tU6hh6HgENe+S4aMb9N3WQWFSWXx+jcG7P+Eg8lBP
	xgC/FmOowcfF9vMtdpYTlPoF1cPM/Qw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-nX72dJb4MvCbsJmmLUntUA-1; Thu, 03 Sep 2026 15:06:29 -0400
X-MC-Unique: nX72dJb4MvCbsJmmLUntUA-1
X-Mimecast-MFC-AGG-ID: nX72dJb4MvCbsJmmLUntUA_1788462389
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so38640685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788462389; x=1789067189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyoPKwWPVR6am9+jaZNykBIgFNjq3alkuLbTD4euEoU=;
        b=CYflEeefHpR8aTsSQhh6/Xn4TGyxEvPbYE8HJZQIVIlU+cVOvkHj2/bSZt/Y/lGohN
         Q+UvZO6XmJ7OkjxFNaoQhtJaey0XRlf7XLysLCmFplppAHJBKNYjSuNRDOYIiTyNFqXx
         IojmTa6VRR/PyZpKhcvRm99NTUSmlF3NXfH1Vfg0iIyUPYVFymg1FeFfyIZQf3gwdZTg
         ejkofHbQiWK/ScOgLPeDKxMyaALosHA0STUrPC2TSJscqVa9eZsLBAvRmmQKaa/66F6e
         /h4NLHZP2lbtoplf9tR0WvcBfzdBpv5neXfpq0Ig4qumMli1YPeYaorkswCTUsXdTCoU
         198Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462389; x=1789067189;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyoPKwWPVR6am9+jaZNykBIgFNjq3alkuLbTD4euEoU=;
        b=I1SuL+/HU7tSxVvrpAn4o1nW3uDWiH1wsB0Z6D+zRmQdQVpkqPJKRek96Mv6Yj2//K
         mnwnkDdznL9VZ7tF3uBb3uNRgKSj3xAM5W+8nFWBs5cW92+2PmFGcD+O93VruricRStx
         5wVgOAQVn+9zKz2FyWcGus2fHdpEbdT8e5RBkGx37DLO2QR0/uuDG/VeRoNTdNiUVeDW
         THgaXnik804DzZ2dv+bsUT+DyOPT+Zf2hwdyV8gy78ISjX8R/Bo5r0DPLoZQmC5IsSQO
         5wStRgVz0tB3vkNP5r/HFJSEhDjcyco67lssfsvztdeFfUMwLFMp4YSWVgpmtO0l/ex2
         bMgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwubsQ0ZkTI1NVz8zzX/5Xel7QV3Ye42xWDe0I4YdV9Ssz0sBEcLGDZgIAA5b7hN5dZxs4n0vYkZ4ofI34=@vger.kernel.org
X-Gm-Message-State: AFuF++nguIAo8rm83IFmrLv2TJ56GjCcyciqR2apAQhFSiFh+1hz2hK3
	gvTA1o8/v69zEYsZkwkC9NcgdNDJJVSXw08qh7iBsMR4OtRCehVmSwyfc3I9VG9LU0hhk6i6Gqr
	UzgC0PIOfccqbJkBFpxIhUmY8G0RK+2kf9N+piNB65pVuCYQjFErXWfhEM79PpGyamw==
X-Gm-Gg: AYBFou3S32DfHMKgoh8kYNvgIo33OzEf5EdoHx81et6wGuPenOKt5RB/ykf1SE+7wGe
	dec2+/Ln7M07NmYJviqzleaDcA2CJiHlDnT32UQJcLpMp1ARxleQ6mJJCnPEPrNEOM89MHHsTBY
	1pdBedpAOxJGIU8vLuiWQDJapKc+b5tMRh+jqgT+8MQWmTS//UVEVKRxrjIVeDeHPoq2bjmV4vE
	w1YgmdIfBpz4KjNjZ+R5Z5KfG2FVesXoIkOvzpOnyzozUKTu2IuodsV1NGfc6H4uuXOejFrVLkN
	79+Ucx6fpCvU4eVbTunxe4EtTcLFXjljuh/VaCjzny/Hj9DOba+0CiQ+mHJyErz/x0tsOf1oKb1
	luRw5hlWvL/c3IhMkYtgc7pYFc1oYKELD7C6ILFtdcUrZmZqp
X-Received: by 2002:a05:620a:394b:b0:939:1459:efb2 with SMTP id af79cd13be357-939804008ffmr68369785a.24.1788462388831;
        Thu, 03 Sep 2026 12:06:28 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:939:1459:efb2 with SMTP id af79cd13be357-939804008ffmr68360185a.24.1788462388230;
        Thu, 03 Sep 2026 12:06:28 -0700 (PDT)
Received: from ?IPV6:2600:4040:530f:b400:d348:ae32:97a6:8a0d? ([2600:4040:530f:b400:d348:ae32:97a6:8a0d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406496e5sm1340806d6.11.2026.09.03.12.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:06:27 -0700 (PDT)
Message-ID: <1d2cd544-97a6-4ddd-8758-048bbd104eb5@redhat.com>
Date: Thu, 3 Sep 2026 15:06:27 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] dm vdo: Fix spelling mistake "postive" ->
 "positive"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, dm-devel@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903152325.16304-1-colin.i.king@gmail.com>
From: Matthew Sakai <msakai@redhat.com>
In-Reply-To: <20260903152325.16304-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I had to look at this for quite a while to figure out what was going on.
We made the same spelling error twice in the same function and somehow 
only noticed the first one previously? Anyway,

Reviewed-by: Matthew Sakai <msakai@redhat.com>

On 9/3/26 11:23 AM, Colin Ian King wrote:
> There is another spelling mistake in a vdo_log_error message that
> I somehow overlooked last time. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/md/dm-vdo/dm-vdo-target.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-vdo/dm-vdo-target.c b/drivers/md/dm-vdo/dm-vdo-target.c
> index 1d8375cc3c3e..043549b1fc2e 100644
> --- a/drivers/md/dm-vdo/dm-vdo-target.c
> +++ b/drivers/md/dm-vdo/dm-vdo-target.c
> @@ -443,7 +443,7 @@ static int __must_check parse_slab_size(const char *slab_str, block_count_t *sla
>   
>   	result = kstrtoull(slab_str, 10, &value);
>   	if (result) {
> -		vdo_log_error("optional parameter error: invalid slab size, must be a postive integer");
> +		vdo_log_error("optional parameter error: invalid slab size, must be a positive integer");
>   		return -EINVAL;
>   	}
>   

