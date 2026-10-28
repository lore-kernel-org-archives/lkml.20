Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201264;
	b=Zp0dcqYIFJS5+yBWh2uH6wOzKkA7iVmVrG4ZFq/T2ppZ5HKx5vIp5wXnANc2w3plcS47
	 ayM59MYPSisKyVwuX/9WB6Xym084IyJmyBn3bE57aNsA/bP4PLaZFNeFnd4Oebsvp0b4B
	 FrJFNhPtSbbDL8JY4XfREztu0OzrSPGCM+E4ai+LB6ig3h8fc3wJPUcS6lA7ry+kxgApF
	 EDleZu5oMCIrBxnx8ve6e/KkoicCQQNdqJT9MXJrDQgZxVKe+SZBU2y29Gx7+6R4pggqn
	 QK6cZsT7IqIy9ogwoQBLivgFz9UPaNKF51CwZCwIc2vpFhcs+nTT07kR1GznWSpEmUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=RvKduUdpqvn57pENoGLB6F2PlOffkxBgVZHDYg1GsYI=;
	b=xw0Q33XJgrGFDhYZUdRpVsqIxaEeqAM8ZtB/Y9ARVGygaoCRC/MimyeOYRWl2bU6i2Kt
	 1RhOGHIsrJUR8/T+O5l49ijM5Q9o9+mK0WHttw84QVJd4lVv5NjSGyrTvAluc9eOvtrmI
	 syVGOrEFtzHZY6zSb2t30T1Q3U17olWlaSYnU28LqrEGZetDvCLPdYTznhCgc0TctwaWr
	 IHZ/vmtVwTeqxRN02rCDeP4VTP9acJCWy2MCvyBQTBQLKuy+2YwONKojUfQ/EnXYWknPJ
	 jGZE6ML8dxQH3Me6Nv8XhSnYxt0L5lTVrGfwK/J2aFdH6kxt55LShxONnBRBibaDGEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=hfRxv3UW;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB944606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB944606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=hfRxv3UW
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6de2f213b7aso571303eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793201263; x=1793806063; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RvKduUdpqvn57pENoGLB6F2PlOffkxBgVZHDYg1GsYI=;
        b=hfRxv3UW4853Ya5L+aMGqL9c/zDLOUs2TFKfwaIJCPDx4yTq96Z1eEw53AWzmRE7zT
         LCES5c/EKioiYR3UK0H/tQFybpmUkk0PTiWKTVQ7MDAdZ53nYTpkmdTo4nDAxFluoWaP
         g67IkK7SsBkO7Mdsowmvv/nQBdTN7DvEtz7ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201263; x=1793806063;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvKduUdpqvn57pENoGLB6F2PlOffkxBgVZHDYg1GsYI=;
        b=JaLOzbePmqrEuyhIqw5L3fKJMpp1UOQYk+tVIceLDZQUd9ln6cQTYoptjXz7+YkS7J
         ywytORoPPkK+XoimG2aCyaj8ibjYNCpL6OTiAoTzrDU9zVxFxx0ZPkc/sUKreBFrvKiA
         XM6jldkiVJBG4tDRdmwWcWJ78rRe7gz6mvOh7x2/YBkgKEowd2MZxZIoTP23/w3CDCAo
         U5z6qySJimHPKIWUC8CfyMi+DVA1s929MZhiBbB0oQ4LpwGZDtwtpUCAysnGYuvTDl38
         8QsfE2W0f9KPzFeyKdOVWTWXec5nP9G2jhO2N4VtkSjyR9/tUBftKWEpjV7EjgQdVjpR
         IK2g==
X-Forwarded-Encrypted: i=1; AKwUvBzZzWUcLv/lkZSPcJ1pYoJZEomyaX992CMyPviGHAMGtvWzAvU+PYDuv7UcgZXfnCKNrjBlIb4luZpH6TQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+nvQSqA+HNMd9I38bTnTz3oh4ZhLW4V5j5yNN8zxqSrG28kkf
	EB1et9UQeX6Gl37YtvgLrxCBE2jwryiPH6hPb/X9NT7V1A9/5YBjCs5J5zWTC/H49u0=
X-Gm-Gg: AYBFou3DdYlQ1yubly2e/6LniGjE8QXvsf45EuQP44du95h3c9XHBtEcxuKiblecuWT
	irbqHaz3ngDWmbwx3EHpEgN75jOaP8azS59VJgDfDVzN1/2kCW/YjaKU0NB2vhT6lhAdakiEtg3
	INpkAZhVvvesQCSnuJcsGjSz4ev1RGFZh3Jia9RbI3NJbYPrhMp/n6y+k1flouIrDqF74XHWbZ6
	Ki+/GvyjCSH2oayLV5AmfK5kBpCWwfzq+c6+O3XjrjwgMKSv6XvYo7wiWXV+7OAmWsEuj8o1Njq
	KzwS1apZSQYvGIb5s+amO/T1oS6G5Ci1itbQ9EMcS1N96Dqxw1X2dzgFJwgP2oktttlIr5FzAdk
	Pxl9C9X5pGxgbhPuFmo1s0SF1o+ju7ee6j2nwTjjaSiT9/dDGTFzuChxaeVHB9YBD6dyN+/gCyg
	/h+AmWVbCusWCqqI+wl/MZr5RQtNqOL7WKnEJtgaR9Xqv1nfu9BG4nxuSAh6haYs4QyQKexagzE
	ToC+rcy4fSsnzWgAt+r+gQKOyRpgOcMqBvgI7Jv6MqW8TC+giI4LuPfEIPE7DjmmrZhDfq4tUs5
	bTqMlPht9g2JVujvtXbLStt3SjfuLaJpY7/kbhsCR+Y5RdT8yCKNjrIexUfmOT2hokUmOWjT+AF
	t2whsvMGhFdrETIV/VvfCKK3jEZXueCGnUHx1x4MjmuOgbkfEC7x+fSyVbncW5Rb7xfukoXUroX
	y1hxaGtNrM7ENq5JzAfQ==
X-Received: by 2002:a05:6820:5718:20b0:6f4:d9d4:3948 with SMTP id 006d021491bc7-713ee7665afmr996593eaf.45.1793201262701;
        Wed, 28 Oct 2026 08:27:42 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71429e7b7basm1517856eaf.1.2026.10.28.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:27:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:27:37 +0800
From: Chris Down <chris@chrisdown.name>
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/8] mm/slab: Support selecting slab hardening features
 at boot
Message-ID: <auIUaT6LyEI2cXpj@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
 <auIN44CnAyzvR_Ll@thinkstation>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auIN44CnAyzvR_Ll@thinkstation>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Harry,

Harry Yoo writes:
>If we end up supporting boot-time parameters for hardening,
>I think it should be all enabled (or disabled) by:
>
>  slab_hardening=none|light|full
>  # please feel free to suggest bertter names
>
>none: "Turn of all of them to maximize performance"
>
>light: "I'm willying to sacrifice _some_ memory and CPU for security"
>
>full: "I'm willying to sacrifice more overhead for security
>
>IMHO more fine-grained knob for each feature doesn't make much sense.

I think if we did the 4 knobs that is a good idea. Given now it's two, I think 
it seems reasonable to keep it as two separate knobs unless you object?  
Otherwise I think given it will only cover the latter two, it should be 
something like kmalloc_isolation= instead. Let me know what you think.

Thanks!
