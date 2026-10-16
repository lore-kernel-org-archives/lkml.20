Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB83B7B7F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792184998; cv=none; b=pHnjeqdZF6oM5MO0ntXcc2DJdfRmoCO0uDRTnhimGyVPvJND6ZdnNxYEvq0YgP3goa0BmcP9Y3dVD+Cfu62ZOrRF7hujXJIQMLLPBtzcPNDSy3xBecFy2sTy8/CvQfa+XoN1IEHVMlHAhNBr8Ojewr+hhcryewO2eFFlANiVPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792184998; c=relaxed/simple;
	bh=T866gN9ytWDgY0fuxIWfToDyoTMPhkGUWXJZyhl3M4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P44HGMCOI9ufHgbdrHT2LiWEKgoh0spqg/W1awwLjsrGZA7MxF+K4LKW4r5aNvfMeqHa7b2F8AghXVMuNOvcdXnjNglqxwb9NuJbu7RJVHLkRTmTTvi2pDKWFCbu6MnZmMQi2FVeKoe8b4zD+PVMp7hNq+Zlu1YfRtGy3Vy7iAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YLiNTO4R; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFqg+G5x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YLiNTO4R";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFqg+G5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792184994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0qksnsO83V4fm5WG/41JKqf/QyvNW2rkxwNDprb2Xo=;
	b=YLiNTO4RMHjyXshECrUDaVaIXn90681npsI0/76SBdqYFeZMvJsXmoIU1ex58hIbmLhAIv
	V4FVEwQtr2S0VRQN91Ec9zfJXQubIX5lCTDVCmcecouL58fCK1Lwl/sx3DWfptQJWb8p0y
	iMEe8z6LHlbUnUIYD9c53bS1vyeGplM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-3xeiXdSONuWhc-KYKaocvQ-1; Fri, 16 Oct 2026 21:09:47 +0000
X-MC-Unique: 3xeiXdSONuWhc-KYKaocvQ-1
X-Mimecast-MFC-AGG-ID: 3xeiXdSONuWhc-KYKaocvQ_1792184986
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a028616bebso2182685e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792184986; x=1792789786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0qksnsO83V4fm5WG/41JKqf/QyvNW2rkxwNDprb2Xo=;
        b=HFqg+G5xxxsoqSsmQ8R2QLuvkg/PYeqtHAhJlwARpEO0fWF8WwKMsw1O8Yq+5HnQfj
         LMEnrP9PgIBiedtXtR8u9Xib7UIoCJDrmNGreklUsnpiBPc5yatGjX8hKZUJvsg0NwAY
         qkp/DUuKK0DZmTxuEZVR9xCRHsnRCXOOeCokmJTlZHl7rdTKVhbfi/o9Q4kQ9gvO0ODG
         dxmCzNUXPlsx4ksTdxo/kHG0O8BBfLr+OXLMnmoXMbblFdCLP+7hy8kShwrNnwHVUKgc
         yixcnIQp+2+W1xXlWrVRFycHRzp2AicaPgaVGON2+qj2Lr5/LLaaFbPLW18tW+Ev7kcy
         Pdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184986; x=1792789786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0qksnsO83V4fm5WG/41JKqf/QyvNW2rkxwNDprb2Xo=;
        b=c5qMmQLKVnrwWGTPrYoo5H6q0Ax/fH6e4S0iKmiWBryk/pwddaSNWNqLSvTuHufY/I
         oFZ0izs5EPhrZ177oTfVq8ulgma0amq81JYtgotLZVhhVXfFU96NOLuKpz+Nq9qvYs4c
         a+rKrkYn5J9zzf0Gjj6isFANzjsRARCVtqYdXGicwKQeyYWl8kC0QhVKgvLisDfKXkHO
         qvjBxuInqXCBbCDxveB01zWKglSwgkZsKg2203DRXtWyXam3/bklcL9srsyChC7mVkvS
         QdHHVv3WWoydXCZoqB/XkAdfdCJ+Wtb4KIbjpfXAyxDmRMrwzpqxM3JA/sEOAWv2MHCK
         +Lhg==
X-Forwarded-Encrypted: i=1; AKwUvBwlBOrV9gt1XWgmNdIXTtITRmopcTX6tBsTIsWEhIOHl9TF8L6U8KhDo2JWhkf/7YszrKKfVQcRJE/xBUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpelR8wC4la04oXFvaxf1ihIeI8zasyM1U4DYS0LZOZCYAVB3c
	CxEmvdY9mN8gN+aRQo7a8wFcyJ7eiBAFERE00CguF4M8rDlDRxsigjxvMrFYzSVIYgWswLro1+s
	BVIs8AaYeO47VETaGs6htX8Ux0ywx9rma2bJK9R1zRdyaRLTedg4tjoAMeAhubrwIFEyRzFZKrQ
	==
X-Gm-Gg: AYBFou29kuWJCNPNXCcfNlntoBFtGhJ5N88HATeMQd+ccY/UwkV5wrRzZMrxWLecPH8
	8mV9EepxheKQNQgfnOJRfPiZDlD6ojzdQ7K3bxA/0ozpm2jdLV5Yn7MZzBSrmPITGp/1jLzQnPI
	4eG8ULRMOG8aVpt/sFiLppasjTaL/HnkAjhs/91OoQJnTXvZKeLYLr/KJ6C9VV/iwxcclH9vnup
	AZFkWc7OBnuFILyanPr17g5R1CadLlpaCT1F7m3dp5FO+RQ3ffc5A625hiphalmcaOCfQLhS+JG
	8P6A+DgTSGeHnMGICOxqDS5JE3Hdeb/VhzsndHItCLBmuOWBynwK4Hpm3EGXuEaym7g+QAFU+1E
	HSx/wGLq34DPxaXuG29TJzaOlYAJGtJ2IcZ9+CwDEOVb48M0=
X-Received: by 2002:a05:600c:6217:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a1d7600654mr22701015e9.22.1792184986451;
        Fri, 16 Oct 2026 14:09:46 -0700 (PDT)
X-Received: by 2002:a05:600c:6217:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a1d7600654mr22700745e9.22.1792184986118;
        Fri, 16 Oct 2026 14:09:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm57458935e9.3.2026.10.16.14.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 14:09:43 -0700 (PDT)
Message-ID: <8e525023-dc47-416e-a3fe-c5e6c5660ca5@redhat.com>
Date: Fri, 16 Oct 2026 23:09:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panic: Fix kmsg screen hang on a long log line
To: Devin Wittmayer <lucid_duck@justthetip.ca>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luyuantao <luyuantao01@163.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261016052722.60051-1-lucid_duck@justthetip.ca>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261016052722.60051-1-lucid_duck@justthetip.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 07:27, Devin Wittmayer wrote:
> The kmsg panic screen reads the log back one chunk at a time. A record
> that does not fit in a chunk comes back empty without moving on, so the
> screen asks for it again forever and the panic never finishes. Every
> oops logs the list of loaded modules, and on my machine that list does
> not fit.
> 
> Read into a buffer the size printk formats one record into, and stop if
> a read still comes back empty.

Thanks for investigating this issue.
That looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

I'm sorry, I probably forgot to push [1], so I will push both patches 
next week if no other comments.

[1] https://lore.kernel.org/all/20260126100732.365-1-luyuantao01@163.com/

Best regards,

-- 

Jocelyn
> 
> Fixes: 54034bebb22f ("drm/panic: Add a kmsg panic screen")
> Cc: stable@vger.kernel.org
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> I usually work on Wi-Fi drivers, so this is new ground for me. While I
> was testing a fix for a Wi-Fi driver crash, my test machine froze after
> the crash where it should have rebooted, and stayed that way until I
> power cycled it. Working out why led me here.
> 
> To reproduce, with the kmsg screen and panic=10 on a display driver with
> panic support, as root:
> 
>    printf "%600s\n" "" | tr ' ' x > /dev/kmsg
>    echo c > /proc/sysrq-trigger
> 
> Before this patch the panic never gets to its reboot.
> 
> QEMU, 10 runs each, on drm-misc-fixes and drm-misc-next (bochs) and
> 6.12.113 (simpledrm):
> 
>                                       before    after
>    one 600 char line                  hangs     reboots
>    same, then 400 short lines         hangs     reboots
>    one record of 300 short lines      hangs     reboots
>    oops with 24 modules loaded        hangs     reboots
>    plain panic                        reboots   reboots
> 
> amdgpu, 2 runs each, Arch's source and config, before and after:
> 
>    6.18.52, the two commands above    hangs     reboots
>    6.18.52, one record of 300 lines   hangs     reboots
>    6.18.52, oops                      hangs     reboots
>    7.2.6, kmsg screen set, oops       hangs     reboots
> 
> luyuantao's patch [1] stops reading once the screen is full, so it only
> helps the second row. With both on drm-misc-fixes, every row reboots.
> 
> The buffer is shared, like the QR code buffers; a panic only draws from
> one CPU. In drm-misc-next this code is in drm_panic_helper.c, where the
> same change was tested.
> 
> [1] https://lore.kernel.org/all/20260126100732.365-1-luyuantao01@163.com/
> 
>   drivers/gpu/drm/drm_panic.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e576c4791861d..29b1487de7ae0 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -556,7 +556,8 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   	struct kmsg_dump_iter iter;
> -	char kmsg_buf[512];
> +	/* the size printk formats one record into, too big for the stack */
> +	static char kmsg_buf[2048];
>   	size_t kmsg_len;
>   	struct drm_panic_line line;
>   	int yoffset;
> @@ -574,6 +575,10 @@ static void draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   		char *start;
>   		char *end;
>   
> +		/* a record that does not fit comes back empty, every time */
> +		if (!kmsg_len)
> +			break;
> +
>   		/* ignore terminating NUL and newline */
>   		start = kmsg_buf + kmsg_len - 2;
>   		end = kmsg_buf + kmsg_len - 1;
> 
> base-commit: 324fac81f365fc123247f9c8a52cb66ebd93b5e5

