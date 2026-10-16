Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259535C6B2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185537; cv=none; b=cNGdG5Q/bjqWoqhnfzlONl7FkCrWsrXgZXjKksviAoBkc/XAt728hg/uDLDuv/aocGwWo8LuBty/yZW1E9QhgDnYTlsVyg+9ksKimMpS/rafrX3e8yvP263t0mgam6+9Ox1zrPTINKtL6ZNHzOA3myJ+Z/X1C+XuxQCdaG7pDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185537; c=relaxed/simple;
	bh=ktaW/T4jyq4T9Q8HIIVceTVawLupEkqiATCGKIJMHHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK5CaN6CK7M0BvEXG1U9SyheodpVWEmhY15WydHuJ9V/NGHRZCL3jCRh5+jcnRuU4FmkeOJlX4BvetaI2j0G4rvLA+1IDFO5LM+zb6kMsiWEFn0ANmbrezavCmTBnMvcrX71DyQ/mkEMfj5H56lN8B1rAhyE/QidvdG8FQf+XIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VA4f6mxS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8FM+Nef; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VA4f6mxS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8FM+Nef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792185534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=woZGOP8aKQUsneT0FV1kzo/CsHwMXqUAtAl9xKcNL6c=;
	b=VA4f6mxSYaijm3Ye0shKLgQpcfq65oSQIxLmxrwBK1RbpGhrc4hE8hXPeAnYN4zAWWHGrt
	JU93DoXSlUxprMrg298xZRbsxZIvF1stFNVr2XX6M1+MB9a4HucxsDblDj2x3heS9Ltt0a
	oEcJRO6/qN59fyxNUve+t8zrOiX+i80=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-CaH5I5BEO42kXZJ20KoFvQ-1; Fri, 16 Oct 2026 21:18:53 +0000
X-MC-Unique: CaH5I5BEO42kXZJ20KoFvQ-1
X-Mimecast-MFC-AGG-ID: CaH5I5BEO42kXZJ20KoFvQ_1792185532
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so2013905e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792185532; x=1792790332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woZGOP8aKQUsneT0FV1kzo/CsHwMXqUAtAl9xKcNL6c=;
        b=d8FM+Nefew2eWi6YUVpAHXIVeOxLHOorCLJ1TSketMPGc3W4vdMBRtTOh3cuT8wxoW
         HXiuihzm98AoPcya0JsgjQ8QOHbrZ+GJ9foGbivafWbyImx2e14+virvYovhHLX0QIbi
         3dOJUYNe/IIT+qowolE9PTns3/iXQuknHcn7HHHSTPjtzA0JsjJkxJGVRMo1QHQIo8z+
         X/MGCNdrfuJ6bRv5H0aKf9t292iXW0LOhz288nS/vXOk0i6Ugqq+JwaDc0ikNV1NWCJy
         CoPbiDxnmEdlWs3TgLldIk4PiosMAhPVB+80aRLtKr9XlCxrAcNtkE7ohNU+qXz4JYMd
         1LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792185532; x=1792790332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=woZGOP8aKQUsneT0FV1kzo/CsHwMXqUAtAl9xKcNL6c=;
        b=N0oPtt3rukH/tcRSTpDzxvV1ixYeTB3M8ZiOTpV6cW+ShYZpa/dkxdwn5mopQDAEAs
         0mwTrAGwn71j/2QVP21bopy+epqu7Zt0luVkWlquww2XryKbDiScBws7YTUM+232JYwD
         MLRFF3qXpbkKx9rvx42M4UCXdyjoe5dZDK4Zt8w8j7JNjUPx0GrjzwX0QzH1vDwlJb2b
         Ms+EICsyxlT/8tTSfcyaNIfmlmTCgAXG450R3029wQFXc8VCXkibrz7tHh7EpiVvf14K
         OUSjDorm/N3KK7ZNG3Zifnta31+iz1bIoQH+D7433wkfqsvxeK7qzR6DIPAtjOEwpcF8
         NDjw==
X-Forwarded-Encrypted: i=1; AKwUvBwCmGLSt0QaMgQCjfYXaIq0l9DyPtyxM34LR3QA5KMxBMVQEmdHlTlzvL4W/ye78I18zzEnTs0zbNhPtsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMFIoQ7w4L2ZL4nB/SiTA4GEOnY3Ex0OGWrmmWofVh92GjVnKB
	37L6qgIzO4qDZ4wNr7N+nHio69i4MDp3JZzaIbn/iR1ysBWoxZtGZkhnjlolZuIgJeRIV8y/Xw7
	qte3LFbYgKSgzQMhz1Dm6K/sII3XCZ2tI4sAboW53uawWjiB9UlhH9U+5CeVawjeJiQ==
X-Gm-Gg: AYBFou2QqW0pV1Z5d+ZDowpvBFaxqul3nAYRB/lFMqxskddkr3/SXc8yxP1z0mGSN+/
	7hXOViZHNzdwAil6xyDSBopiIXZ26WsK8o7qp/8O/TOIa4DFQkUgpwFRXlbsVggxwP65M+OqDRf
	KWHi/WMjcnVM3sV2ON4uDV7Mv1GH5GD+dqeDkkd6MDr9hQfF+Y0tm8j2VQ0y+Hv8/WQnOxFYYej
	+zDaaEHn2KBJ/PCJM4JT1mdLzXx5hxk7xulntOstO5hpfSkG0Rh3S3ajMWwhrXh2F868QMor6IV
	/X3rmpz0Ey5FetxhMGl6OLgrXJ2BRctFDZXllbdEkROSqJOJ8jfpo4yB1IzSLR3bfmuEQeepiPO
	F42sWWt/oKg3v1CTBqrkOFMxupdLzuDMkWm9kt4PGeuAntNw=
X-Received: by 2002:a05:600c:4f4c:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a1d75ac2a7mr27794285e9.2.1792185530576;
        Fri, 16 Oct 2026 14:18:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4f4c:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a1d75ac2a7mr27792545e9.2.1792185529311;
        Fri, 16 Oct 2026 14:18:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm66306545e9.5.2026.10.16.14.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 14:18:47 -0700 (PDT)
Message-ID: <f651c7f8-9651-4d9b-bde8-3c0de767a66f@redhat.com>
Date: Fri, 16 Oct 2026 23:18:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panic: Accept a trailing newline in panic_screen
To: Devin Wittmayer <lucid_duck@justthetip.ca>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261016052722.60051-1-lucid_duck@justthetip.ca>
 <20261016052722.60051-2-lucid_duck@justthetip.ca>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261016052722.60051-2-lucid_duck@justthetip.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 07:27, Devin Wittmayer wrote:
> Setting the panic screen through sysfs with echo fails with EINVAL,
> because the value ends in a newline. Ignore it when matching.

Thanks it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Fixes: e85e9ccf3f84 ("drm/panic: Report invalid or unsupported panic modes")
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> QEMU, 10 runs each, on drm-misc-fixes and drm-misc-next:
> 
>                                       before    after
>    write of "user\n"                  refused   takes
>    write of "bsod\n"                  refused   refused
>    drm.panic_screen=user at boot      takes     takes
> 
> amdgpu, 2 runs each, 7.2.6 with Arch's source and config:
> 
>    echo user                          refused   takes
> 
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 29b1487de7ae0..7847b38ba9aab 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -839,7 +839,7 @@ static int drm_panic_type_set(const char *val, const struct kernel_param *kp)
>   	unsigned int i;
>   
>   	for (i = 0; i < ARRAY_SIZE(drm_panic_type_map); i++) {
> -		if (!strcmp(val, drm_panic_type_map[i])) {
> +		if (sysfs_streq(val, drm_panic_type_map[i])) {
>   			drm_panic_type = i;
>   			return 0;
>   		}

