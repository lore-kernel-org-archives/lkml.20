Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877283;
	b=tUXJiv+azH7iGcUIxcSLO4xONmnS8Gyu2k/72UumHEGWM4h+2y6fjad88vnq5EYkEHri
	 b0UGD8PEGnXmevNT+Oi6HAcg+zbXH44OxlKbYF3S2XnL/6phH9js918oaANhmc+p8loHH
	 7v+p2I1HnVYFYUN78qykThiFTQFmVIXbi5zqCFM7Y8hVB7g5B2jqre7WlASeoy9JLyWYy
	 hJ6oa88zv5jNnRzQP/Iy8HZ/0pcBxIcgwh/cUplPK0u+tX+M1xRW7LCkRVCqQ6QCFn9Q7
	 o8nkUIngaHofxxKXpJJ7J7M0yIzmWVVZBisfQJqU8OreDgXiT/7p9zjBvTRXTDM7Tzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vzqoAyjUokJZqlOT6Q8pZfCZ/k/84aYSFWealQEk2eE=;
	b=jTlaMqmdXUoSxrYipj9ghS+3yomEhnJhe3J1FA5fI8avsHx6Qr2VBNMECnncnN+1LPzu
	 HJVJxHMDGb2rs6lZMnHagaAtXJo6Txt5hh4EM27bhndi6W4hlhHqP9rvvHJW1ll38E45+
	 LLYqOI3c5xs3KHxwG6jpCRkk5y6/n0SC5+3T8Wamt6CXDyeLKCqBAhJzr3Fzmkdubwshs
	 +kuetzcGzx8mperiK5R8BIIIrWklJdJWngKaykau5LGjlhHGHRCNWqjNcJHr69TZXyBjL
	 GfgfEgF78GSdPaq1C9OCeNxN1hccQBK0yieGXdc0B2scO32eqk8yB2bzLyH8FMQJZ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c3k/A2Pm";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC072606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC072606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c3k/A2Pm
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so6374207c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794877282; x=1795482082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vzqoAyjUokJZqlOT6Q8pZfCZ/k/84aYSFWealQEk2eE=;
        b=c3k/A2PmKeSGs2Qm8K7XMRV9h7Y+op+8+mM/AluBP90OnZB5uiyUFzQZEVTDAA4d3F
         AWaIT5O7tO4AADhhUfjDB1T0HZyjj3goJ4qjW8SepzQMHdzfUlxkGllGNfTBsz4wcfMM
         U9GcT+dHu+CQ8qD8X+x0kQk77yvGrgCA0cNvxRG1HMHCEOPMhZHpnxdhNCfbTLTHpKEb
         M6DkBEqKk+LAurAXSCjQbuu2bqBWYEhHKUzBy4jQEcvM757lmHFtvYDX89ap5h3CDeTX
         EnU3NBqiXig0GKqloAbS/afKYsUcgIzK1wZXEaGJ0mIqyvux/XSsWpQKheTzlDd8GZJz
         9Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794877282; x=1795482082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vzqoAyjUokJZqlOT6Q8pZfCZ/k/84aYSFWealQEk2eE=;
        b=II/QuIMgCgyK0EvcmoJL/cJT8eoM4HVu72zvKx60cuePNebT+MAhoCl9K+CdF4V3Xt
         P+aBiRAwrMtBYC7c6Bgfl2RQkqXqlEon7VLQJCkmUJXNeGH9U//egEdYrWx9oovV+B/J
         r14zgh462Cix+zfxdgVFwkqfnX+Go8fzZec3tWmEY4BRfmoCQmCkikTr6tN6si+cuxPS
         yoi/TRCmrUm8UHVzlaflbAbGS2Xvc1iQXR/Lzv2Dn27hFSI/gENOdERlKsEUAXCuPETN
         iTgp+6jVgzw0WbZjI+Kgk/WwKXfus7rd4vccAJPaMvt59j5BW5HQFqSUn53Rrn+XPLaD
         /YLg==
X-Forwarded-Encrypted: i=1; AL+hErHk7juVtPIIYjIonqIKtsc5BT0cUhO3SYsYetIH35lYlzYSGQxLucvfeLOfAKZ1WsrmLThBdFlUU9bYn+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dNMxhngKjoGnFU3ct1yPZK5M9aHH6ZoCip71cGW8QH8v8TR53
	u11x6aR36W1K5B3t5r6sxNtICIdVShfqRJapwvlTFE2T9n6odyS8cHAw
X-Gm-Gg: AYBFou2hjI7phHZC9+xhuYGDH2M3bMa7VZZ/RaP5jtIsP1H3WKyBXPDetwZYYveHOOC
	9Zgnl3XPaONty20+US1J1Ol9x+zbihYC5vgTVwgh7M3mEn1qJNGID0GGUmqhHRvfeU0UtoGDrN+
	eoJ3YAxdaq0OWJnswjzaaBE6GN5pFxQsyjEe/x8kd3IIfEOLtELsebycsDfO/cPJ2JApCkkMPSc
	j5OqQqKI88MwRJI5X53n+LYqJE6VLtAmgofxxqXChtksA+LPWUQdKXBjJ8cxUVfgsuScpQzP5oh
	ikcKQZvqoMI7dkcqfHDM8bo3YS06s6kM3zcWgHbNcba2PyVIyNKuAbF+iW+hXM8tFGT2xw7Lua3
	r4m9nRnJb0hpwdXGhGc+K6iHUQ/VjirJfVsQSb7MZKYZSRJHmPCdr4bJj1u7IRYESHaV4MWVE3d
	xaj1rpi72mfOxHid3TE+XG+KO5Vfmv2FXkZyDyzbxXVvE/YeD3U8R1QK9sNdyeQ3sCtA4dD0ysJ
	ojC2C4vA+RdHqxqVwjQ8tlQUksQQkNC1/AlPtvQUFh5kq69CdJvA+gohXoNAw5MwOTaPyr8Lg1E
	Iqr58klYWbS0g5EDQTQcCvt0ghLypbEqWb/Mo5PwgxZwWQb9Yc2AvkH/
X-Received: by 2002:a05:7022:290:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b5030ad209mr10751139c88.20.1794877281631;
        Mon, 16 Nov 2026 17:01:21 -0800 (PST)
Received: from localhost ([2400:2650:24e0:bf00:cc77:213f:afc3:65e2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm30987948c88.1.2026.11.16.17.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:01:20 -0800 (PST)
Date: Tue, 17 Nov 2026 10:01:16 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Tuo Li <islituo@gmail.com>
Cc: zhi.wang.linux@gmail.com, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
	ankit.k.nautiyal@intel.com, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: Fix NULL pointer dereference in slot switch
Message-ID: <avunXOrG8wfAI2cR@dell-wzy>
References: <20261112155822.1336713-1-islituo@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112155822.1336713-1-islituo@gmail.com>

On Thu, Nov 12, 2026 at 11:58:22PM +0800, Tuo Li wrote:
> The running slot is updated to the pending slot before updating the running
> context. However, the condition checks the old running context instead of
> the newly assigned running slot.
> 
> When no pending slot exists, running_slot becomes NULL. If the previous
> running_context is non-NULL, the code attempts to access
> running_slot->ctx[0], resulting in a NULL pointer dereference.
> 
> To fix this possible NULL pointer dereference, check running_slot instead
> to ensure that running_context is updated only when a valid slot is
> available.

Well, just AI generated static check but without any runtime analysis,
again...and can't even show kernel oops of this, as it simply can't happen..

> 
> Fixes: 8453d674ae7e ("drm/i915/gvt: vGPU execlist virtualization")
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>  drivers/gpu/drm/i915/gvt/execlist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
> index 29147a9f162e..763c310f2aaf 100644
> --- a/drivers/gpu/drm/i915/gvt/execlist.c
> +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> @@ -73,7 +73,7 @@ static void switch_virtual_execlist_slot(struct intel_vgpu_execlist *execlist)
>  
>  	execlist->running_slot = execlist->pending_slot;
>  	execlist->pending_slot = NULL;
> -	execlist->running_context = execlist->running_context ?
> +	execlist->running_context = execlist->running_slot ?
>  		&execlist->running_slot->ctx[0] : NULL;
>

Current code calls this switch in case whenever running_slot is
available, so it won't have null ptr reference. But code looks a
little weird, as current code tried to assign running_context in other
place e.g when new request happened, or even it might seem to miss
when enter execlist idle state...but it is still valid in switch
call. So I think this is just harmless. If you'd like for further
cleanup, that needs testing result for sure.

Thanks.
