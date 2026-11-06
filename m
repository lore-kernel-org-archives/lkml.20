Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976207;
	b=Zp6IOwLPwECkZxASi+kG0+qHN5ZtJDwXt79WiWUyAMPmBtlEqEI0ZjjcuFLNV2KKljM7
	 XIc1swzID6poEWO+mjVR9eEYv+5Mk1BEGdaQ30jgvWc7P9BwDx7CTg0Fadnp8kupSyzPk
	 W6ZBSK6sepfKn96RVc8ukM0noiKSb7tB8ZXzRIsUTY/w0tiqOLFBX9AcCd5Z5ii8xm3T3
	 hNKHEz+DJKKx6FnYSgwjKC+8AnyI7bL2vV8W6Nh4a2dKNx1If9TDT8O7IWl0dYWlN2rym
	 JzRxDqjlPkbg8Y45nOuNwVKoZ9Fovq9vNi4FH5AoVmHk+u62GKsMQ7n1zsEv3I8G3EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1coO61O9o20KGfWhe+U/6TV0ZY/FeV096v+PDZIBmoM=;
	b=iMWr1BEIaL8p1zQDyGxPTi5x19KUleN8SCG/JIfUu7+P7fg8FC0Y/D3NPt4yD4GY7pLp
	 Pvc6x0NjT/k3HXngwWqNRq0AJpqh2TtKsOlolx6Iiq+Ekz1h8yOom8XQAP7PkTH4KWtCk
	 G9TnN9G25BujMfuPYXm3kWv7KmXyXKsUZK00soKhp5CwN7NPy7SksXjlxFBriG0HYNzLx
	 QlBFQHyE8fJvSHSM2hpUttDyaqR6Wif+zYJC1v3GJgXtRgmFanEMsyliAbWQf+xhTTeAV
	 Eyry73GcjCE0D63xl9RemZcwSt3JUifcnR8488798pIDn3EnibuShK3d/hdC5pKDlcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ8Kjz3P;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7D6082BC2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D7D6082BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ8Kjz3P
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c434376dbebso146349666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976206; x=1794581006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1coO61O9o20KGfWhe+U/6TV0ZY/FeV096v+PDZIBmoM=;
        b=dQ8Kjz3Pm/40Y6QK+wnykiNHDgz7dKP607sj6/+hqieIq1ZmyilklclOYXjWaBJyZQ
         wigV9r8VouxbEKE9QgPdw1VpSrB3xLnotHYSSNbzuz878AnRPuvoVHRTNcqgEq7hLDnq
         EBy4H5xYRegGJoTvMOlxOYRVq93ULaPKtOQBRtm4a5TxD5b5qxrLBPFkjRnIHAg/fRo8
         SPdaU35rkr0LfaG3/AS4/PMkK2BSbubxBavooY3Ygux0TcvwzrklGLkuYTCBblRoq/9Q
         wGBWvVpbu/YmDkyrFWrcQ9+Xr/vMo02AxG7ipmZa006A9g2kUtdIwncG4kcQ9DAOguTO
         Q3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976206; x=1794581006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1coO61O9o20KGfWhe+U/6TV0ZY/FeV096v+PDZIBmoM=;
        b=VdWt3ksxDg/GJX6ARQ4InP6RJapxCBfZitohhLVnTVWqMUMk6yruS6lK6ZErmS3ygi
         dJ1HfbcK9HP9WpusvRbbsdkdTJ9aRkFwJ1WdazLnj3LHFnNS1RFUFPegZcio7x4MGNmg
         XllL96nTtd2imYl5qXvtRneMpl41KB0+tea8X2xNUwFjanzo5arCwd9wW61KdZqv8bAO
         RHS3x1n3fvsPPbFz7+9+J9q9RQVxiSeQYEMUro++ga05sbZNhiWZhqLfGDKIo4qPxU1i
         UryCyQ+aGYXw9GvRRgSLfjSgze20zaoIhk2wnsMzsurjxadlpbi4GgBQdQCMY3oy0rFz
         PT8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzM3NQoYfG+IoMEllx26F7bmio9WLZFZzSemLxggdcIn7Lg2sTFTf+j3+g6h0wSc6BJYhJkJIo2R15H2mU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8muo0L0v4XZwa7p8DUfWSWL47PjiDWzJ880EEfFWTIASjoN+Be
	uBXoaFfFlg7nt3dOynNmhutiloItz5ac/WPyysjObZ5KPPK7eLKD76pO
X-Gm-Gg: AYBFou0u2K2p0fUB6Vad4xRpw3KWq1gYsDwGvYVU3jqvEDBQyU9NViEn5yZWPQiu+Zl
	GxCjYtL9rOVpDdFuRIfVwvdpVwSc+gxZj4WTGLk7bq2qh1LDYHdayBhk4LEdsa+DsajLYLNWy5K
	0CDocQ/+yVUZGe6mlGQjIM3OSO/0sFl77tFHX0tIMWzPq3Wu3dKFQOS9s99rE0w1xXIxy3JozMY
	E5yd4E6uuYFtyd6Ow9iYRmKWUOig98pPlZJU6GrioqUyQ8P2toMYufuiUJFNsCn5N2msAEPNrTJ
	GGT0oM7051x5IudVlwmEA8x5+3zujMd3QqKQ1zuHsLK4PizVSpj5e3hNk0cGJ0V9swsUHVQOqEp
	FQppY9GInD5L1ubta7Wo0CtmyIla896JhljiQeJf4pURMb5jtpWXZ0in6qfS3/EVy0WwHTMmx5i
	Z50d9xdXdNUB/jl7ucGAnWxRjFLSHN2Vg5xGyu/ipG4zZ8ZMakn0Btis9Tw1Is5qjO+q985Wc2U
	c4xyw3PApWUXTP+Z2+19DcjEXPbmvvaEnCjDMSZxBpL+PcljtC63W7kjq5rINFJHRoH
X-Received: by 2002:a17:907:fdcb:b0:c2e:616b:6763 with SMTP id a640c23a62f3a-c4d3525a3f4mr249438666b.3.1793976205728;
        Fri, 06 Nov 2026 06:43:25 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35631eb2sm86304166b.27.2026.11.06.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:43:24 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Fri, 6 Nov 2026 15:43:21 +0100
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"Liam R. Howlett (Google)" <liam@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Michal Hocko <mhocko@suse.com>,
	Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
Message-ID: <au3nidyyEWsNkL9D@milan>
References: <xdzcyoou73blpfdlgy47i2ktrcsffnclerzojpgrxphid54gjc@nicdcvzqx447>
 <auqtTjXhD8is-y9f@gondor.apana.org.au>
 <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
 <aurAxRpCwzeyXeVj@gondor.apana.org.au>
 <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
 <aurJZ81qnbiHH_P1@gondor.apana.org.au>
 <ausS3LQNkdc6lBy3@milan>
 <auxDm_YO4oACA_d2@gondor.apana.org.au>
 <auzOjphJ8DWpXwUy@milan>
 <CAHk-=wjcKOC7O30L8_8PMniT71aqy_3ZEYK2xyoR8zW9ZCvO7g@mail.gmail.com>
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
In-Reply-To: <CAHk-=wjcKOC7O30L8_8PMniT71aqy_3ZEYK2xyoR8zW9ZCvO7g@mail.gmail.com>

On Thu, Nov 05, 2026 at 01:02:35PM -0800, Linus Torvalds wrote:
> On Thu, 5 Nov 2026 at 10:44, Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > @@ -1025,7 +1025,13 @@ void br_fdb_update(struct net_bridge *br, struct net_bridge_port *source,
> >                         }
> >                 }
> >         } else {
> > -               spin_lock(&br->hash_lock);
> > +               if (in_serving_softirq()) {
> > +                       if (!spin_trylock(&br->hash_lock))
> 
> I don't think that in_serving_softirq() makes any sense.
> 
> If I read this code correctly - and it's possible I didn't - this is
> always called under local_bh_disable().
> 
> And local_bh_disable() will have increased the preempt-count exactly
> so that it looks like it's in_serving_softirq().
>
Sorry, probably i am missing something here. My understanding
is that local_bh_disable() adds SOFTIRQ_DISABLE_OFFSET and
in_serving_softirq() checks another SOFTIRQ_OFFSET bit.

--
Uladzislau Rezki
