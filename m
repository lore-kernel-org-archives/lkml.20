Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794722731;
	b=lkaa9i6Ai5tlgZC3BBCnLZeAGbtAY3nyC7QgSL7kk7blm8ROiMO/ME8OtshpKZ5SEftg
	 eFN13mf24hcVm05amVIYzw5h0o/FHw54IZIMXZBaOjiYmq4Vvb4WpfYCh9aLtGcybCTIk
	 aM65l5orMy7ZFlo1JO8l/urk+9tU/OyMIHIScZWJHUASiAI+mf3IAjH81YvL7xNUmFPMR
	 t+KHzc5YpqIOVwdoRueW8TUvGdNvw7r0nn3Zk5gV5OzW7eU0GDIbtYSl1T4hJOAtXZ2lC
	 X64SJ2oMmoLrggfdTBbz1z6RbFsFu1G8IPwEPMUgI9VN43slyT4QLLBSoe0sE7XJQxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794722731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=68DxHpqqFot2faCcIPu2QwkdA4mxu3avVweYehLM7Ug=;
	b=fq/2p0axw2OV6YapAC9cAsAKogo22fmb/zRX0f0Id1VQI4mhQQa1K6rORSb2Hq+z3GoC
	 XMNP9VeYfwd9QsQkdf4T1WX/K30RLWkXK09KsXAJz10r8yHy8jol8UHxW4eYu4QRJO/RM
	 tS0980xmBSJp3oqW1FrzSQ1zq8ZyiQ1A4hrUTPjoPkN1rU2LDSxksjeyWPAaCAkI9PLBi
	 wtE0WrDOyKjHRaLGiRYlMuinjUyNB8pFENO3Pz1XbOsiTiCDk8g77ce4q/oVX06XxHmJm
	 rtBenbKnsdKO1ER3ddb1gSAbKN4aOyGb3HTmcPNywswsjhKQzJooykH21ZsTyiLGIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=E71GEI5u;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1913606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1913606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=E71GEI5u
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso3056066eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794722730; x=1795327530; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=68DxHpqqFot2faCcIPu2QwkdA4mxu3avVweYehLM7Ug=;
        b=E71GEI5uJTwjoe3atFZrPTvuTJjbA5y30rSAaA4A+FMjrsH3KszmWBuTq6OEdAnIad
         EKXzR14iOnYsft4ADzBoK12DBOJfOm+kblTUyiaPdN7Z1LMM1ZLyFkFhCVvYUDlbTjIj
         Swk3QdGO0J7cv7lbaZHsYVzBsbh+LC5u+RGLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794722730; x=1795327530;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68DxHpqqFot2faCcIPu2QwkdA4mxu3avVweYehLM7Ug=;
        b=kxA2h7dBH0G2xw4n55wvuxO9Q/4p4vJhOeOX1vhKr3vLUTLzPk9dOunc5MlIOPhdUK
         Kw+LMzeqUu82AxBneIJZyOX2MDu0NhYOC1BnyDsfpMZbYO1rGmm0uK7SCR8GrsCOGtim
         Ut8EkUbrEJUhOsi6GaVc+PvKOVdz/A5JUK+EfytfQxMnRIkm14I+/wKcfuDISLlhTIH+
         Ts9jndeydzPFNQ3+8hz7a4MTZ5cpHlIw62N7CzrhIStYDBTc98hZuor94Eyq1rGbHlQA
         vbgkH9mlKW/Hxx2+U5hjsMkhe6Vr8fRnPDh3XsGf6/LHqHul+bG98U2v1vgJ57dGcNlQ
         BjjA==
X-Forwarded-Encrypted: i=1; AL+hErEEu7aL9/Bcap1RLrB6VurQYRIjCXyLL+IaEI/TJ7RQTCOqOtPIa4Q1IJk5Fy9bMMmQNazZNVxCTaZm1o0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c7OYgrN+lB11wqEhDuYvacNAnIU0ATixe50HXR256lsQ3PnKX
	GJYEFJAPBFobKkH5yln7h+48H+sF8Zeh4NAr2A4V6HuhCCX8csyainaU9rIaTfNVIn8=
X-Gm-Gg: AYBFou0EKjkZrN4yl1OXivB4PmrQGqa1eQL6jYlDZxfLBhxzueo01jbKGmvgA3ICy6A
	+0thtzC3fnk32UN8MHZJ4Z7yb+AUpzmk6H3hJ/0gCWIKxuJyrucC5FKIKCJ91tztq3pxc9fk9rM
	UYrz8kmB5hbVLkPd1C4rW/y6FJQWNADBYSZ/daBGQMbOH1MV/3fkk5tDPPpb2NuAYfIvPuTVOki
	WHvVrGY+2u6N/OnX30gx0LHg3AdUhQX7ULgmoB9BFcxicLkhjj3bJumlsv9B2iyU7rTsrBttsAX
	jzGZgbGmPC8LWxDB3KG2t+pGZ9oC0XOOlVZcHvIoxqf25FD4z1Gc7T7Xb6BkiE2ZZdhZaiXEK2W
	4vI69xcdgLbXcB2bU5ldn6MhVXDV8koEm4J2WnlxpyqSIyB6WCD2imI1jHfqhBQQiHjtFurYB2w
	bZ1l5A+Yt6nWaFC0O8NeqFt3bBRGUTJ+FZf5Py38iljkWbip4R0Pf8O13se+ILWpPy81tFNHndU
	0OxRTbFtTJiB///o19fdCx+IYiPwHrkLe87l222lgBSpdpb9LObzLrIA11+BJsyIiWDbFJPmIyv
	k9DhWvVjJnazgTOFuyI+XlipW4syy6z7GtucboThtdLH67DTcXp4xeWpktiTiRDFSKMimPica74
	kXXV9kJKJuvw9GQHdAyTXnGYIxzVOzWKjE1ch+bbT+X+8MM9QdRJ5xleMBQn/qe3DMyW6spmwEr
	DkKJsLjviIYGpnIsc45cUCVcj/9b/wRYsYrW4qK+MR2msSDSHApvXSp9I+KzgnhEcd
X-Received: by 2002:a05:693c:68ca:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-37967410b8cmr6726925eec.28.1794722729913;
        Sat, 14 Nov 2026 22:05:29 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm19790083eec.4.2026.11.14.22.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:05:28 -0800 (PST)
Date: Sat, 14 Nov 2026 22:05:25 -0800
From: Chris Down <chris@chrisdown.name>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] liveupdate: luo_file: allow keeping private_data
	from retrieve until finish
In-Reply-To: <20261110175855.2437084-2-pratyush@kernel.org>
References: <20261110175855.2437084-1-pratyush@kernel.org>
	<20261110175855.2437084-2-pratyush@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114220525.cdf6ca6e7fc4cc0a@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pratyush,

I've tested this together with 2/2 across a kexec and it works well.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
