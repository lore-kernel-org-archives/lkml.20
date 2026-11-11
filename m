Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439268;
	b=GTwJ15ZKG6Sxp610EYYZRfAxw79I2ZzWQYIItBu25tyHLfHr8NWdf2jQRFN1XE9vi2qZ
	 T0KzTUrTVfGIyT+N0it7XtbV0Jt/8KMHIgjR7sni0FvE71XJKZfw5cDefztnVpW7GCy3A
	 WFI+TqwcGpa5gsV80hXPbF5RljNSPct4nQln1HJ6CgToh1fmhR+PRc7wK5jGZ8XYGrwHz
	 gdM3MtL/LwGrwjyKQKef3+rm3wOuWsyg/bxeVDn7K1InkEr4NgvFY9M//Ow82VwLuWpIb
	 IXq7T3G1b3tLwepT9PVDb70pIZ6rJF6FnPqhQbALKqT+DwqVwushqztff3pMgP2MvbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
	b=lscfQr02TWWL94xZGqupwUw2mfc8HRcOUYVdM9k457Z6gWApfmiJz9GZKmoGBu7kxUUU
	 svfIedXtesyV1KGX3C09K3kezvyqS2MSIhU/niQZZySmQgp2cEf3Q5gwHTh6NHeNUYIel
	 P9hu6R7pXGy3hUP/kQbpBgNWLBR4VyAKcG5kBYK6xk9L+USJF7/KPX88isBOclcvNYkEb
	 Cxlz0VauF75EaoP+rB1X3YnvguNsunvS3nI9wqUdSwKU46vueqX0VBzr8tT6lD60yEBnS
	 8ggYuk3Znj6voot9gVnB91w6EYNCx2nV7osdnZaD8kAuawIIgqugxcFeAE65/ZsD00w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0ntajgG;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E85360A3807
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E85360A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0ntajgG
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so2171576eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439267; x=1795044067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
        b=O0ntajgGNrfKFATlaSWgSLejjNVQgDjxhVsVSDttqGtq5aviS683LBngKpx4uv3XAj
         dDXGAMnqhsJSWt+XdWei6LCeTtI0eQn5Nl+kVt5xLA7YMoToNjUv3RXoZQnXBzmCAAon
         58HWQLnHa7Grvb7KMRM3cEQbiFQWgxyWzConOroVYW5bzGieZJD/P3DhTxaoXAjODtdB
         g8pGGYhCkd+NRGJqXJU/6bLHnDl0nv1mZ9iVzHlkbKadEUNRBQGHmA6oJ1OCXi/IwLID
         e7Vg3qQ2RpyRtzo25N8hBpRXogew+6Y7BNCYMMxSdgjwXmY/3cPgCHBTPC3v80B5QRTi
         7uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439267; x=1795044067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
        b=HkMi/VINBdFPXhjUNhRwY0DPKRqlIaTuY8kSX/QAbI9hBRAmw3HxyCYYFjajVcJCUy
         iw91MtEL7/1GXGra9SzpCYqxp3D8PoT8y8/VtRJIP9GL3d93hFIJ1n+gn8IJWAWwDd+i
         CCp/DqcS5mBSflu/DUtLKZoRvrm8F5pxTRDYSsEfLpt6tTOCXwR8Uk56hpGIJbBffJKX
         tujv2f8s167SaFPm6SKtBO8/fIVL38eoHib9A1a/otN11KVdkGTkmpX5Yoz2LzONyYfn
         pPcd5cX4xTXNuhhB0QOAt1iBDJJbGV/iQ+IVrWgo5FOy7Rml8t1xz0MN2waxWaJUC5hK
         1grA==
X-Forwarded-Encrypted: i=1; AL+hErG2GkZ4OS7JLqokzGBLeLBiHO5Gjo1RIgbEfve6BejAR2zf23pk4fsLgilR3abXJ0UEEZn3CNF6NAROYSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U3egtwKUusuYW9OUpR0C4aEArXknHQYaUBDfW1DmCEt7b1gF6
	uWcsyBXvenGZzWsRfdqUHHHp8jP5lm9PWSrqXsA7pCQQjAOi9Nz5KMuX
X-Gm-Gg: AYBFou00ge/qXw71rzc2/C2veBT3Z8FmabfY1atsMB+0s/+vAJKjO0AbBGCT0icruuG
	NuuH6MioSBmwOTUFzvxwGFFynt7ciiRvcyTEa6MMy0hZlQZ8wkhM/lZ4rwBLaKffVZan6aN6gFl
	W57KG6SNtp65O+HFkikQcv0cpnYE2zuOvtX0PTrUYz98bXG9JULHrJ4/r81+piKh7cj96by9n91
	V4yBz9RsWr1LgOdCJUSo6bxULpZ8d5N2zOunbjx1ASn3brKf1B8MqVnr64WY3sRQ4zmHjK5kw9U
	O+Fjg26/gOM5rfhG+zjsJzNlKqAg71OfnriHs3JmNYx+/Fuztg8D61JvOe3aghPMGbTl9skL//M
	ZNaXo4s9fWNRY6uQkiaoxmGgx96W5UUhTE4Uh6+v6mBfOlYNOm1P99IsFRvEjMQ77HhFpcLwJ+n
	kBUBOYp8pXimPPv6HjaWrCTEEElWyaVVK9jrTjybnacSYbTLtofP7AblevD/Pd4TwTjDML3ZLd5
	8LOgQc/Y8hEZ+QLLPZA34FeJh+HYk4fRPzciO1GbkS8v4z10t8xtdeFjPZKT8QoilJa4HVIIpev
	L4LYTUy9rdB7NCtafht7auvrv9K68CxupOTc31ks23PCaQ==
X-Received: by 2002:a05:7300:6dac:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37686754f0cmr6158044eec.25.1794439265724;
        Wed, 11 Nov 2026 15:21:05 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm19142236eec.11.2026.11.11.15.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:05 -0800 (PST)
Date: Wed, 11 Nov 2026 15:13:02 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stuart Clark <stuclar@meta.com>
Subject: Re: [PATCH net-next v1 06/11] page_pool: Coordinate refill with
 memory providers
Message-ID: <avT2Fj5qjbJkArpg@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-7-bjorn@kernel.org>
 <avOtxBw_grmuDJae@devvm16445.scu0.facebook.com>
 <87tslnrwgt.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tslnrwgt.fsf@all.your.base.are.belong.to.us>

On 11/11, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/10, Björn Töpel wrote:
> 
> >> diff --git a/include/net/netdev_rx_queue.h b/include/net/netdev_rx_queue.h
> >> index 989120cbf452..ca12cbf7b825 100644
> >> --- a/include/net/netdev_rx_queue.h
> >> +++ b/include/net/netdev_rx_queue.h
> >> @@ -33,6 +33,12 @@ struct netdev_rx_queue {
> >>  	struct pp_memory_provider_params mp_params;
> >>  	/* stamps the page pools of each queue allocation */
> >>  	u32				mp_gen;
> >> +	/* NAPI of the running queue, for memory provider wakeups. Set while
> >> +	 * mp_armed, and if the provider has a refill_done op. Written under
> >> +	 * the ops lock, read under RCU, see netif_mp_wake().
> >> +	 */
> >> +	struct napi_struct __rcu	*mp_napi;
> >> +	bool				mp_armed;
> >
> > The comment should explain why mp_napi != napi? (I do not understand why)
> 
> Fair. It's the same NAPI, with other rules. napi is the driver's
> association: read under the ops lock, and not cleared when the NAPI is
> deleted. Provider wakeups run without that lock, from socket syscalls
> and ->release_netmem().
> 
> mp_napi is an RCU copy, set only while the device is up and the queue
> isn't restarting, for providers with ->refill_done(). netif_napi_del()
> clears it before its grace period. Setting it also schedules the NAPI
> once, which replays wakeups lost while the queue was stopped. I'll put
> that in the comment.

And all this only to make sure that we are not recycling something from
the old pp into the new one? And reworking existing pointer to change/update
its lifetime is not gonna do it?
