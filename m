Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109756;
	b=ClUg0nMDAF0DlbCkYB0niIxPrUrdBLT54ke0h3W+IZBjqJBC9iTHDpYwalGcy6fYzvlP
	 Y9mWdL92/QT9fem4ROBgfwj2yJ/c75xG0VP7nOZPeFDujsn1aJviFfSqgFYKu2spFzAU6
	 VITfUuOZkrX9FigzG/AzESkRwQZnzBeb+DbG9E24Oz68l9THoLXmadlKpnaGjrOnOvsrw
	 CWYJZ21YxrXeQ350DODBuMevkN9Gg3LZSXJinKJNQyqFiZoCRPp8pJooJ+0hE380YPbMY
	 IuRWsoQYrJNqQw2EgziLcwLInGNCy+Y/CWXNpH5pK8TlUD5u3kv8POIVsfFgccEJ2bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=1o9096nWf9ghL1mNo+bNKs9Dd0gIk9ZEkL7EBJmA/hI=;
	b=SxQHxswxmUGLwEmzOnI3a1CXrBX5t6zP24k9VSjMJLQ4ca1GCF3gu13fnq5qQsMevT8/
	 Nuo41bd7X/qikUjtC45hBiM818j6NpoP2tM2+HA13KOO4Z2bt2g+zUrKmU2q4GXdDbnqt
	 AWMJdOJJr9FDjCiml59rE8GDeZG+WxONXhPaTLoQRLLHHYlXfGCZJRkbXX6QQ6FnLhBA0
	 Vnj7a9cyRF4zF03KgXcnyx+5HWT5E8n9zA7byIsAXHwzwMNIW5oxmGwqvtfadHuYEUhww
	 AVquTCn+MMdNIZP2X+As6Pm0TdzV2FYi0ROVqlUmf1c+oElfWc+hZwXBRdy8co/irfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=QbqqJWpy;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=QbqqJWpy
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so3053693e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793109754; x=1793714554; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1o9096nWf9ghL1mNo+bNKs9Dd0gIk9ZEkL7EBJmA/hI=;
        b=QbqqJWpyALynH6Y5MvS4ibMIqMKo7E12zpfZyDd5nLvLRlbUDUsSCOYvMBQinzFbZK
         jyIheOu4kXs0s8Khc6khr2B9DtcCte8Zz6fvoc7C6Q+hVFB5AAZ+9e9xLthylFSLi/15
         91tGK9rbZSRy2w9iGdSup8jVbKogpJArLuebBYOXO4v8jZtsOXgoyUYYmS7JT3/P57RU
         YzgvF7XduwFgBCSs1tCUgqIbjNU8D54Rk5WP+OvjqE6HEwm6jGbAz19ESHNn5JB5STz+
         Lu7Ogssku6Ci6NUhTq1GFh/wZrwRWHz1JMtTvQK3koXjGmp8p0fXk8eIDrQDXVuduHcX
         H/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109754; x=1793714554;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1o9096nWf9ghL1mNo+bNKs9Dd0gIk9ZEkL7EBJmA/hI=;
        b=YdGmnGqxHsJnODlYoHZ8/4zqJE6HNsEMGEhEom688iXpYyVmnPkiD8uQ4YGH0eSovO
         +5TK3hpdss+LZoEuAaoi/clUKDXC1Cf1wTWh8PTRDJwoYUglDQ94tlyoxXKxx2Cz7C/L
         3XKG0iJ28EJglubygMO/emixMhBAIKWc6H4F1ajqWcLNoei4sLRomY4frdB91riFgUsS
         RstWOA8EjcOtOxH75xsx0gx8zAqjanljB4rP4tfyETMip1l8wcJquYnCwJZQ14/lq5OB
         8pnG7nZpZsIAlq3HguqkvroinFp2wTvsZqbM1Lv4ms/9ae9E38fhRmWUK8iqL0fHjqSu
         5OuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcZxNX0wNbG/sdlfoNoIe7AZ0LK7lK5M6mUO8P4MbCQPK61gqv9g3JuOImwLEnIRmeeQHJOzm9BF1og1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3V2N90Y+riSRVOr9WDC0PPCObv2k/0eRvuSUSTDNMVawGy8jn
	HuG+0EhD2ssW43Z43/CpFgFFP4RcxA0U1LbvZWdHbB1SmH9c7GP/z6IG0btQWOi4r20=
X-Gm-Gg: AYBFou2AnZFi5PUWKDqG4vKsm7fTV/qqs0BGZ7QIHj7PZU+20/hal1dDJ2Zz4SUNoMu
	28sVG4qrBExO+d/aViqH1/jXLIqgzhoSohz2tkYdfBrtubrmaFVfPThDs557GwAjzZJeTHEnTOW
	injEwsnBChRz5yrhYCwR9n52ZQFdM7jsf/UqKYJIvnOX4fzJLv7p1Wrzs0FJVvqHyOwwCVBpyaU
	I4BANLfZskW8G+AmWPlK77t7G1tAVK94MN/KqWAhodWiO4IKtllU4TFaAX3AZQoi8VjTJQ/K+jW
	bt40gZ/eMx5vCryeV8hUhO93PrbwqXldJOVdXhNXoLYKd2ho0C9FsuwLbYjadvZ4ehEd4aFLzQL
	3adWn9KPebcXDcptnH17zccZRxCyqtU9arx7hO205d5LiRoV4//dgzdzU+CuHG/jB7LsW2VboDy
	4/p3XZFc9NVlt2g2GK5UF9sUMuHVkmvV8ZVgdkQpKME2yd7sHlrukBb3fIYa4ca3/Y9zQcZ467G
	lUH/GVxTjI7xD7TUJnftKAOyClzS6Fv6OWaAl9/NSvZdLt2Cf/v+W4M/l1MVVJx9cvtqbYf0oz+
	jco3aM9weh18zWbqr0m/8B/JlnJM18262/WLa0+8WnEJglnK9zBoTMuqlyA234ysvPbHG5k1aeT
	V
X-Received: by 2002:a05:6122:3c4c:b0:5ea:e197:702e with SMTP id 71dfb90a1353d-5ec23326373mr4106967e0c.20.1793109747918;
        Tue, 27 Oct 2026 07:02:27 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bda586sm103188516d6.8.2026.10.27.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:02:26 -0700 (PDT)
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
Subject: Re: [PATCH] mm/mempolicy: recompute automatic interleave weights
 on memory hotplug
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, honggyu.kim@sk.com, 
 stable@vger.kernel.org
In-Reply-To: <13a3b600-8a87-478e-adcc-2425c75f98c6@kernel.org>
References: <20261024170415.4121901-1-gourry@gourry.net>
 <e3a1ae72-9370-4c3c-8935-6a410a74377b@kernel.org>
 <at91WFlW96PH-a8A@gourry-fedora-PF4VCD3F>
 <13a3b600-8a87-478e-adcc-2425c75f98c6@kernel.org>
Date: Tue, 27 Oct 2026 10:02:25 -0400
Message-Id: <179310974571.2232644.3181896214940432050.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 14:04 +0100, David Hildenbrand (Arm) wrote:
> >>> +	/*
> >>> +	 * HMAT and CXL report a node's bandwidth only when it first gains
> >>> +	 * memory, so recompute the weights whenever N_MEMORY changes.
> >>> +	 */
> >>> +	wi_state_refresh();
> >>
> >> If the function fails, should we at least pr_warn_once() ?
> >>
> > 
> > The only failure state is -ENOMEM, wasn't sure that was worth warning
> > on.  I actually debated whether to just make this a void function.
> > 
> > I don't have a strong feeling here, but happy to add a warn if you
> > prefer it.
> 
> I'd assume we'd at least want to tell the world somehow that something is now
> imprecise?
> 
> Or is not updating that harmless?
> 

It's a potential performance regression, but if we just -ENOMEM'd a
kernel buffer to hold the weights, there's bigger issues.

I'll add a warn.

-- 
~Gregory

