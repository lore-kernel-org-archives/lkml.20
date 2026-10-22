Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792632085;
	b=gPNerZsKKbIY+QPFMEsgYeElM4yOVpQKU4NAXh2eY7K8pArUU2GqzXhMcWIIA7E9t/UZ
	 NMpCfgIUOPmsxcgC0db3NZUcwVlK2SHdgTWRkrmNHo+2FuzzQJEK88E6et2PFLhMlLOqv
	 4jPfR0VIvWivj1dTQ5yyhsA0LGU2O2LFzAe2t9JoEdxntQQIrcXgopOUYYT8nsxzqoJFq
	 0kcPUUPqwkaAJl4uRAJz32lCO/WbfZkN7WxvTLrPuuis+zumS7IHig8o16fCJYTR5xQsc
	 vkKo7fznPYEF49ep4g/yRcNfegzO3nZhao45riB8P9FG/Og0In7hImzQIVIclKj/5ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792632085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qx7+7XSSqG/7ruMWKUHyodvPkjCtTRNq2u7cxI+GQYc=;
	b=p2k3BOE0akJsKOiL+hgIaSC940YPg55t/YuoWzpi5JCBBNvQAQ0/MP4IdoE65D8iIB9Q
	 FbhkKn63PqMOFaU17t4VqXZ7MoAImFokR6WJgN9a1YcnpTruWQyCyCUBJkH8eYWyuchE/
	 USKDQNToGrknp1OAwPlVy35jCJPz95kIAymzuGqq7QEbmFyx9uowSmp1VBnwaYw7s+s3q
	 U3B82/kJHEzqit5hLnY/cOCswcJV8dUVQkHys2zDn+ovA/QvJTCySpLh8d3t119kiEt78
	 p4tFjFv9VR8esemTLHAJBmHBScLt6r3kZXGjN+rUpyOD4nVg6nH6hUqOSFhTbRc7x+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BJhPig08;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46715606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46715606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BJhPig08
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93efc0452b5so105157585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792632084; x=1793236884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qx7+7XSSqG/7ruMWKUHyodvPkjCtTRNq2u7cxI+GQYc=;
        b=BJhPig08+mT86pMWIHNQ0skT/8BZgi5ukrkIhfP7WVoWgs6ZAnR1sSyVf8Z6jTKBJd
         +npZco9WmHyBhzYvwIBu0Hh58K5GZiK+MEcD4+UZyupekr3nsNt3tLajnhD2tYPhGTPJ
         Ijl0PUdhuPNPyl6Wv/CWFzEeFFlmbOGLrD5wELNGNcU7AD8szwM5HcyDryL9f3DEYiWv
         l4JIqXvtik6zJCk41Uldih/gqgpvfamDIqSTjmzqQvMj66ZiJZ3WdnocdoSc1wZFbJv6
         XhVfwojIMGetPSOG87Wp3/DzDxKlFTABPDqu3G6p1NgOF5+O3B/kftjkLxAz405zQo85
         sxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792632084; x=1793236884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qx7+7XSSqG/7ruMWKUHyodvPkjCtTRNq2u7cxI+GQYc=;
        b=wbNW//l4vfsBowQGM6g5/Fe38/2/3MRF9pu3YBbNm64o4iriZCStQgzzfXs38D1dUB
         lw8C3wHljllweo4HsJdfbOQA/XOjZY4LVVfsAlTRpiVhYpRkHkEsxpsreBVp5LAC4vzM
         pby8NwqgDJORmy6u8D6sjXim5JulHqOjvi3CaTmZwnPbJWkHoD/FH5rTNizb6MHlh635
         g5q5d6Bn2IV/fcEPLdHdZrxw/1sVaLt7Zxr45Gdc0trgWicmGUXZJST2TMQT52O32+yn
         /KHZjg9T6FGw10DJkcxOEOeMTqJ6JEhiJp3BrIciY69wBdaW0+xrhtvlTt8c94CicLWV
         WPgg==
X-Forwarded-Encrypted: i=1; AKwUvByp7ejSeoRXi2gto5UyXFXGCcecme3pph/SV5umSUEDRAVbgeBMG/buFaIPKABXMQ5tnMewIEmvGAHMdBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB/PitCWP0hk5n28q5SCPCZugosg7iyECpNJEuaVYz+W8Kuy6B
	2h+Dr3ABHKDEfnjfTB/hdeo1XRmteWCQVkcztDD3aY0w3AAviAbd4399
X-Gm-Gg: AYBFou0JDUtIEa8wcnQXz9C+vKt+3CEoV5QbNxQYS+qa9OyQ8WaxvmKBB402gAeAQYP
	1nOiuM2bf+MYXoA9NZGa7GiMtKi5e9lyMjWTg6WKnC9MQzbX6kQ47s6whycl2NQ/YUi14A+DTJn
	n1n3pkfN86tP46AgyJB1M4P4WU4+CbKpqXXWRNchBmbX8q4RE2MpP4RGpHa5tFRS7ZqZLnf6/cO
	KEuYqPdaOwXDQb7TcFu4FMZph5WfHmHP1uwAcSLAs83Ck5eFj5naAU1niZ2Bi70AOnr16A395Nh
	eebbsqjniNCY/oMvU2S9lyz4AlMPPfL6p0Vwii0FqSIIHIludmn8+GbMmPFtqmxZAy8J0gqX8M1
	A3YjP59JYp+0nmyDYGD0v1ZeXMJtKPSL+i2osOxZBDcDKJbTEFBzV0B4iYT7xkhK46e6cgw4Of/
	0hAvNhqJthinvAp2s1utDsCogugmCEVvKm1gBS7K2CGRKotxtw52kOVyZzj8eUyAnJldj9RGWvP
	Gzz+jatO85Lhz1ZV8gdFPWjEtlamwawlq1mRaSvgXeYA448I6l+aRkqpTg=
X-Received: by 2002:a05:620a:1a15:b0:93f:2236:a61 with SMTP id af79cd13be357-93f57fa6757mr729777685a.61.1792632084168;
        Wed, 21 Oct 2026 18:21:24 -0700 (PDT)
Received: from keith-pc ([2600:4040:50fa:9200:fff4:6e82:93d2:837e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56ddd369sm401066485a.21.2026.10.21.18.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:21:22 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:21:09 -0400
From: Keith Teeple <keithrteeple@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, 
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, senozhatsky@chromium.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/vsprintf: Preserve the sign of seconds in %ptSp
Message-ID: <atlflhXoxUsXu-BS@keith-pc>
References: <20261021110628.37106-1-dennylin0707@gmail.com>
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
In-Reply-To: <20261021110628.37106-1-dennylin0707@gmail.com>

On Wed, Oct 21, 2026 at 11:06:28AM +0000, Hungyu Lin wrote:
> The documentation defines %ptSp as equivalent to %lld.%09ld, but
> timespec64_str() formats tv_sec with default_dec_spec, which does not
> have SIGN set. Negative seconds are therefore printed as unsigned
> values: {-1, 0} produces "18446744073709551615.000000000" instead of
> "-1.000000000".

Tested on mainline 4df4d2a577db with gcc 16.2.1 under UML and i386
(QEMU). With only the new tests applied and vsprintf.c unchanged,
time_and_date fails on both. The -1, -1.999999999 and S64_MIN checks
print the unsigned values and the 0, %ptS and S64_MAX checks pass.

All tests pass on UML and i386 with the full patch applied.

Tested-by: Keith Teeple <keithrteeple@gmail.com>
