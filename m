Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333008;
	b=MTHtTjGBHfadNVW+tOOT0qBKLdZzKsLR8pMx7sBNklQqNncnvcS0XgsRzTo67kN1MfyV
	 DJxEf+74F0VXk19YI0lkD92GVl1vtZkWWmU5B15Aw4kxBNFvAiYS3oXyRvnlHcnZCcy6g
	 f5GQB/hbPzJhrexW7iL1Nl7kJhG+zHKEF8GFDFtnCbErTCObbhiCgrA+tytxHAUj5aJov
	 MBQtimNtM2UxU5TaDKrpiTtgim7nBdBlJYLK4l7HpqLwr2PjZj9zwyhqBndrqmlEgMEoU
	 9eX4GQtKNmIssj9qZc00Q1dc+O0UUKQ965aQven+38Nxe7mpBkptT0AoEZQRmaWkMmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=BMHxxjO7SmiwuH9OUCwU1zX9un2r5kjXJMRK8QfbbXQ=;
	b=JQK+LM6iuJg1fMu4W32838qUuyUzFAcb9gIxdUhuG5EOFkqSzZBvnOoEKyykKZ2b1m9+
	 UXhGRxBvls8oBsp9mx4L+8AH0b0iB6aOJbb6DFSycHrSADsX1SKXYwVr05hWSHfK3HDf2
	 WtNGcAl4yzhT3kybup2OdSM4dlyZgwmbWfvbR2pLlCeszGp57TAFh1hcaX7EC5WunNhKv
	 ZGrniqg763KkoQETLljL9w1jM8+4mUoG1LtfHQBC63g/soODH4Jrh8Xyj8J+aqBERfIUA
	 VtADH8b82Ba8VieYDjZU4iAsBMqv1l8bmD9INrVjYVbbMb40ISlFZ4MWwZ32eAouzlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PLV/s74t";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAE7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EAE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLV/s74t
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843cf077f10so2832487a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333007; x=1794937807; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BMHxxjO7SmiwuH9OUCwU1zX9un2r5kjXJMRK8QfbbXQ=;
        b=PLV/s74tSstT/MeDY1Sb+FWgwnUGyChL5isIedKgoZQUGybASVrK2sPsFOsXTWI/Gu
         UyPehCMLJNgjGmFuUBQFViAWsQPTLkuCczlTsE/xhzDEXMF6ijFnSPvuGQSkk41W1zIm
         yB/UlPQUCrb0ps6ZKfUBZgCkIiEYX168VJj1Yrz2k4Ej6UAy3zgI+lI5g2rnaEqjXhdC
         ffwbt6uuwBNj97/WoxR5tpoxYVU/IxoaqxqQzjVZn9o9Sz90+DbFurfKeh1uUFtozQBk
         fcsAyXwB8zC9fSKTFZ642lNTcV6wRr7t4M0xcEP19rMqagPXWtNBi4qNdAUp5pjtPBL9
         Bvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333007; x=1794937807;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMHxxjO7SmiwuH9OUCwU1zX9un2r5kjXJMRK8QfbbXQ=;
        b=MDqS2QcykdOOCQPpNPsUPvMcDmrIjdHUH5OVJXdh+0Dhb8av68wNUoatG/2X8qE9D8
         8Yucc/h+IK50f679K45mhNzOFTTbpYSd92ujphK24pHIPeMJXW0sL4hBRNFqLi8RXfAj
         nIl7Jx9zETeZEV4wM8fXbym34f2DjlC2m/uQX1Iq7Q44xpKrnEsfz3UCkMOL4zDQ3IAu
         jV+QPc1Tb7MxmsdgAhDMt9DCdTvveYJgDnjKPUHUK3LDWzT5/6tmF7CfeYgbmF5jO6Pv
         utogfLmjJ7bi5jQ6ShrBndYVZyMYtLbBtoy3v4OIJrENDF57WIZwlRP6enzAUn+DxLZ0
         idEA==
X-Forwarded-Encrypted: i=1; AL+hErFTknNVXVKo9QeOOeYmWS/uYM9uZDPjvRddY13kChUGWaFrP7AyPKU4v7lHSYUMxJ8YHFQDlkRWQQguaOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fgDzigeIwe48EUd1uHV8fw6k6zcOt+OO/weey+1hUMzyS7A+r
	PanfDD3PGbTS8AgcLga/WGfn5CPMbPQHy4IK8kXwIEt4VYFW1TBTjhKo
X-Gm-Gg: AYBFou2hrGCQl/mVYdRWo5Y2jwj9LaoaHJ9UwlzZo3l6Ot4RouGf4eHfRY3ux20Z5ux
	nh8EtR2/mASUEWxVY4p9IWlelHfki2KR+HC+3Q2dmEfPgJvEZtfrtLbHU9EweHRJ5C9tCZDximy
	9u8K4RPeL604YtHJPKvvQjSBHes4YrzLEUdjgEJQvkddwJFAt/iwwzAitdU0nRbhMYp6g//uL+T
	Wsasn4SVWkLfHXzaioA6/p6O59eohmdfGqHTwrUnxXRafIusomhMfcX7ksdlrhY9b166kFfXidf
	53mVpjkoFXP/5ZesweL5CXxxoeKXbiUwdzWNKOHxvb4LDzeoGFoTtgAF30Yu/PHUHoGY8Gm0qIA
	NnDAVPt74tUOSiy5NSnDPqkN24SfGdEoMnKWvEgJocIyOpbO5IWc/WO5PHnqsWqHk5OOeG0YvdW
	W8Bl3dIuXpVjClpDl7aS8koeBgeVftdAG/mWSob1eQr0nxrKzT9jEomABZKeicqmUg4/ChUjff6
	YfQnasgTVDmRSf9lm/0lLqMNPmc6SQwtiJlbY307tKcHSFmec+/izq+Kt67QISSYk0pAUOys/ac
	8MSvUIQnqmei0xDnYKHHwBLwPHUoISdN3uFUpA==
X-Received: by 2002:a05:6808:1686:b0:4b5:5bfb:f25d with SMTP id 5614622812f47-5683cba74d3mr2612506b6e.20.1794333006772;
        Tue, 10 Nov 2026 09:50:06 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:7392:6aad:f285:27fa])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae2302d8ffsm2043134fac.13.2026.11.10.09.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:50:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] drm/amd/display: fix USR retraining support check
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com, 
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261101104727.141852-1-mdshahid03@gmail.com>
References: <20261101104727.141852-1-mdshahid03@gmail.com>
Date: Tue, 10 Nov 2026 23:19:36 +0530
Message-Id: <179433297650.153576.17456786292064820559.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi ,

could you please review this patch and give your feedback ,when time
permits.

Thanks
Shahid.

On 2026-11-01 16:17 +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> The USR retraining support check tests the address of
> USRRetrainingSupport[j] instead of its Boolean value.
> 
> Since the address of the array element is non-NULL,the
> condition can always true, even when USR retraining is
> required but not supported.
> 
> This issue is reported by script test_addr.cocci.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c b/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
> index a8519f547dce..74cb65687a50 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
> @@ -412,7 +412,7 @@ void dml_print_mode_support(struct display_mode_lib_st *mode_lib, dml_uint_t j)
>  	dml_print("DML: MODE SUPPORT:     Host VM or Immediate Flip Supported        : %s\n", ((mode_lib->ms.cache_display_cfg.plane.HostVMEnable == false && !mode_lib->scratch.dml_core_mode_support_locals.ImmediateFlipRequiredFinal) || mode_lib->ms.support.ImmediateFlipSupportedForState[j]) ? "Supported" : "NOT Supported");
>  	dml_print("DML: MODE SUPPORT:     dram clock change support                  : %s\n", mode_lib->scratch.dml_core_mode_support_locals.dram_clock_change_support == true ? "Supported" : "NOT Supported");
>  	dml_print("DML: MODE SUPPORT:     f_clock change support                     : %s\n", mode_lib->scratch.dml_core_mode_support_locals.f_clock_change_support == true ? "Supported" : "NOT Supported");
> -	dml_print("DML: MODE SUPPORT:     USR Retraining Support                     : %s\n", (!mode_lib->ms.policy.USRRetrainingRequiredFinal || &mode_lib->ms.support.USRRetrainingSupport[j]) ? "Supported" : "NOT Supported");
> +	dml_print("DML: MODE SUPPORT:     USR Retraining Support                     : %s\n", (!mode_lib->ms.policy.USRRetrainingRequiredFinal || mode_lib->ms.support.USRRetrainingSupport[j]) ? "Supported" : "NOT Supported");
>  	dml_print("DML: MODE SUPPORT: ===============================================\n");
>  }
>  
> -- 
> 2.43.0
> 
> 
> 


