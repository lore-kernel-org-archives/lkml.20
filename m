Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985C47F3BD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153007; cv=none; b=OgTFbN2ISV5qQ4BJdQHZ+dGdXKCrRHskhoJa9nYGZxylVIXyowrGiM95+7X5lT87+EHpxDJ7qbTWR/Hb/YwGjMnihpGrdtshs5PAsdLqndMK0WSOVEVDThDn6ftY6bwubzXD7D3hWs/IhJXnNdDmzulK7elRv/NX/D8s1DwDvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153007; c=relaxed/simple;
	bh=G/fuQkFUEJE9xmz/wmhoad2EDBIutXpsINbMT306D0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keFX5gRNKYmAuLFocJfOOJAi3NV7uU0BgtvUbMaRwW4y7F6PU/gp5vdq5znWYf//t8WYkh5MbyWej8oMbpCH8/DNk/0PVp2+gNUwk8ltHMvAg7M56TvWyVv4gv0MXq+NRPxQplB+Jso8b9Vd/NS5rupeM4wQcJSgs0kgiBlWgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQ10XZ7I; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQ10XZ7I"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-486e8faff03so2781857f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792153004; x=1792757804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXwcfo+faB/d8Y5clwXPismEZjCAQ2x4NezFd8SmQ80=;
        b=FQ10XZ7IFg/28nhtcRfp7Wjd07EOAxIu5iJxw2Of5wj5gNyR2cV15GnHvTtCdTgTkt
         mv/NWNeZTWoNzLBaH3uMPEOtYuXq1ukWvXuhzv2VfUn+qKVQD3GVomVvmg81spspmdMt
         srMZzfwNHaNaSyjZJdqy5MGUTAXb50+t5WjCspVA51IA3OKDsJuBk56OYYjZ+5wgcS9s
         3fM0R/xa96bGcq0PyzhEIw6qJKQBMKOVGFz3JYxiDt4h/UV4ehLXvHevoqJWZfgw2ICd
         HZy8TnOyCRSUo6C68mYB6TqWYAh7PjcTq2Y763g6Qrpi9xdxSYSLaZUK5eipRIHakMRp
         Umgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153004; x=1792757804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXwcfo+faB/d8Y5clwXPismEZjCAQ2x4NezFd8SmQ80=;
        b=GNqZXuzWmw68fq3Hr5qQcfm8CQgE2TGwcKYOrl+kW5QqJbTI5Z8dTb/IcP1qoSALeZ
         L+6bzYEs1rIGBhQkniOeV+v8PBbZtTBLVFmrTHNbY8pGS/np5eaaUxuenyrTGaELnNv5
         H8bzRoveJhe7QUtlEOMb82JbqS+BSvX5xnKd4907qcJRpjm7S5nKKToSVdkOjfl09ko/
         q6o88Ujem32rxABEMnFwk81YKyRnfkgUfOBJ0PfJVGnxMk4RxdCwKhzMmV+qLTOBlH9G
         9wqg4QvmDBOUYixpj3k/rmkcdS/X/RRUt3/5ppgLaDXzu7olVojdpZ+gQEi/RnduJ8xC
         SHSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/Ufkv0hruICfqxpcQ4i0O1lS3NuRhyT4tITRsg+12ei1WC1YqCI7dnXtlm8mk3gnbi0TFNRDSgzqvaFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKbb4NFh/LxZCtZwAdegnT3wE5HDcJiphg6FpMGz+ac1X5C11h
	3qYk6OyoIe5XqEPRXSQCFVjmtlLaJgntjffIGCRM2ozc3IC1o+hc1XgH
X-Gm-Gg: AYBFou3x78gTmx3DiM6QnnV5uJ5w50Ro/86iAsCEMMjeZ3s9UoFB7hHzEY+XtcvTNCb
	f9eJJ0OM17Lw1XVRY4PYGa5gSpo6qEboN48Ui/8l7Z4xnUwvPBkJI4i8VomiVDuaVU+/emU6wH4
	jg6c63xsZYDg5GKSBll0bH7J6jglsnvHBzW3MFp/PUF2tC5NGVHUesJWG0flIxwuvEVX2AvvyZW
	iiAW/vT31IGPh2cYrDp1GK6IOQJVosNDYG4G8iPm536x6cbwJwLb86tkphkN6R5SSyyadrIOk1E
	wYZ0+m0HUBnW1D1hYkOCdiNzWqLzroH1sVFShqf3gwaJtWEbphzS/bndOhjyPEOiRTvCN7sG3Jk
	N8eFhPs6n6vYMmKVlYqO719ekcnF1KXycKOhhDNfx+LacPl+A3tn5JyMOBonHZg0+7+J+Kz1LDu
	IVPI3YlUJ5wl88trzdEGLjo8eb/eFGAMaKagdyrY/U2vckzWpMB+z8XYFcUInbZfqhug==
X-Received: by 2002:a05:6000:4303:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48dde0f0ba0mr29342329f8f.0.1792153004392;
        Fri, 16 Oct 2026 05:16:44 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm5076765f8f.31.2026.10.16.05.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:16:43 -0700 (PDT)
Message-ID: <6e0c5a1a-1e82-4847-ae23-1b2574042ca1@gmail.com>
Date: Fri, 16 Oct 2026 14:16:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daehyeon Ko <4ncienth@gmail.com>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 1:34 PM, Lorenzo Stoakes (ARM) wrote:
> So far the assumption has been that mm->mm_lock_seq overflow is benign,
> resulting only in readers spuriously falling back to the mmap lock, however
> it turns out that this was an unsafe assumption.

[snip]

LGTM :) and also tested on qemu so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
