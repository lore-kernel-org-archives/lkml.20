Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712D93C1D7A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529356; cv=none; b=mzJiMIN1Zci+6x9mvIueqxvH/VDf7rfr1FnoFmQDvNzJtL1IOMeJeP39XKOGuMy8SSJHLrYfrSthhJwzDGc258HW7wGiQC7ilIUJOiG7PZQZr3lCpHwjRa3T/pxTwbnx7USNOFiMEUvG8JgChhiTsAh3UzX9xzJ7f8bRUXmErOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529356; c=relaxed/simple;
	bh=TPxOKHJ895l/zZBrxoHbLiI9IaPlmjfGv9C/U5YFa/8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=AHOzTmEvedT42XYbl6+kP6pUfaYXmpdwN0noOiRjG+iATWnn4rm7bscFfRwGVTYBBGs0OBpiPzILVe65BOpOqqMAGlm3EtCvCbVVdMCgfVL1jFMM2NG8VREn0di8IxrpWez4FZXFZu6QtbvTWbRblVXuIvnbYuYxSmr+S/kylCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C9N8jCAC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C9N8jCAC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e6b771d06so4513385e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791529354; x=1792134154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TPxOKHJ895l/zZBrxoHbLiI9IaPlmjfGv9C/U5YFa/8=;
        b=C9N8jCAC0Iem1Aze75g9YeAY9EO3ZF5Z442gaZX7XR9vuY01P9rjdlkS25mnhvk3kd
         Zkp+WuYXNqWqZop75J/P2Diz5NYOOQjuBr4fNKZpuxvCuBwE7c22xEd2pSwWum9xNWs4
         p5nQ5YhW0Rs75Axh6UW1V0yDby3Y5oAzB7ZM1tHLxJZlXE1nGg2vmuevQTsWVTNllKPn
         AT+F4z8aMZ/7y4xqcGj2laFVgUN92AZKiVe1gRq+79We61VOV34WiGarv96vEHJkSFjS
         9pQXcGLx1zpE3Y67O4KSUxvzG5kefPZXVoN+UQs5qwVGBfUwsbabIZ5Eym8pHzB56jB4
         ccsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529354; x=1792134154;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPxOKHJ895l/zZBrxoHbLiI9IaPlmjfGv9C/U5YFa/8=;
        b=eGdbWxyLASwWYdoWfUwrIt2DskAnrybH6ez4UTYGVQxpEkTBwqMRZeQvkp+wvWOYgO
         wi86CQodcVk9ZURRTWtBbteDMpfKRI/pmFEUHPzJfAzAtwSJtkh7M5RzgBm//3VHfbAu
         z23u0LvWOgqBJyfAPGhrVANYHu1p1pfYawS4HzJr99VikQAUaK284GPX+dOJ2cnrLFVL
         z9wMuu9NfcaLEVASmrTPzk3CtDuzcoKiahCZ/TqCOZ4PyGkkhe3mAkHnFZdBdwKu6qEx
         3ocxWq4DET7kzi7uL2a0AZkKQyGkaPze+PA8UnJuil1EuXY4lnuH0siIFFCNVv9YQILj
         ZSIg==
X-Forwarded-Encrypted: i=1; AKwUvBwzUqCVcUw3FHiCd4rnpFg2ReW0kuOCVhbUZ+aiQCexYwy5vJ0GCeiJUlovG67RTfVLssCzlJkrue/h80o=@vger.kernel.org
X-Gm-Message-State: AFuF++mknbDogngL2CpEoQjZLx1HIsQtmx9l2aqsQc0mlCLPTq9tp0Rp
	/00l/8AHaqVJF7UckpXnkyVVavK04ABlADV5dTmBci/r1DZJ5mHv0YvMemss/HPkpXo=
X-Gm-Gg: AYBFou3PdNz2hzQ+vlnzQ0Ifya0KbYXZQlGYAZX3Ng6ylQACQe6bPJR/DAJ4WPY2lcB
	GxbQ4CvFD8eDviu4G5H2PchPxj9tJMkW0EYXJz+fR4KIiuIcaeSIBRnfQWQ6JjC76nXf+5XHknw
	oV9UAL823EsdZemrwpAj6ckdByDLs6BJ3FTQI6kDKWp7rbs5F+r3T4A4+/8zi+sqdQaibxSZVQ8
	52oGtbxHlimxX1utN3igumYlx+0JjnGMnMm8GB7clpg+VL3sdHKUkVu2D4aYCyf2DOnGPJ3YMIG
	MjvacDOMTjfbFEinKD16HxgsNNpx/gXrKUQkfKO5pSbWnSYyhdG7VC0vL0UZVRhi6CBjS5WiCKs
	vmw3xUnTDi/vyy773BSpSakdnTKYoN0e7wxM0fc76VauURut8gbZ+AdzJSjGt2bf3S2oENioA0p
	rRbL+/DLbZSML9caSZlRwT3Uw8PLNF1c4jU0dBEhZ+GHuPxsCZh4SuYKgEFIkQZaLKhxuO3LRPx
	mdB1w==
X-Received: by 2002:a05:600c:a086:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a18e3ea887mr15384705e9.0.1791529353543;
        Fri, 09 Oct 2026 00:02:33 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a00:11b1:1081:dc93:96ae:ba90:5787:8bd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm52255005e9.6.2026.10.09.00.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 00:02:33 -0700 (PDT)
Date: Fri, 09 Oct 2026 09:02:31 +0200
From: Vlastimil Babka <vbabka@suse.com>
To: Harry Yoo <harry@kernel.org>, Kees Cook <kees@kernel.org>
CC: Vlastimil Babka <vbabka@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Pedro Falcato <pfalcato@suse.de>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemb@google.com>,
 Jason Xing <kerneljasonxing@gmail.com>, cgroups@vger.kernel.org,
 netdev@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v6_0/8=5D_net=3A_skb=3A_isolate_s?=
 =?US-ASCII?Q?kb_data_area_allocations_into_a_separate_bucket?=
User-Agent: Thunderbird for Android
In-Reply-To: <asgAh4mrr_yd622U@thinkpad>
References: <20261006092030.got.500-kees@kernel.org> <asgAh4mrr_yd622U@thinkpad>
Message-ID: <70EBD8E2-6DBA-4758-9CA3-D5CB661CD3B7@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 8, 2026 11:25:13 PM GMT+02:00, Harry Yoo <harry@kernel=2Eorg> wr=
ote:
>On Tue, Oct 06, 2026 at 02:20:26AM -0700, Kees Cook wrote:
>> Hi!
>
>Hi Kees!
>
>Was hoping to say hi to you at LPC but I missed the chance ;)
>Maybe next time=2E Safe travels!
>
>Uh, my mailbox stopped working for a few days as I forgot to renew
>subscription=2E (Kiryl told me it's bouncing, thanks!) Hopefully I didn't
>miss too much=2E=2E=2E
>
>> This gets the buckets able to handle memcg (GFP_KERNEL_ACCOUNT) with
>> isolation (since it's common due to AF_UNIX),
>
>Cool!
>
>> and GFP_DMA with fall back
>> (since it's rare)=2E
>
>> It gave me an excuse to build out bucket kunit tests
>> too, and that (and LLM review) found a couple other issues that needed
>> fixing too, including msg_msg allocations going uncharged to their memc=
g
>> when CONFIG_SLAB_BUCKETS=3Dn (fixed in 2/8)=2E
>
>Oh=2E
>
>> Harry, on your v4 question[1] about bucket users giving their own
>> alignment: I tried that in v5, but a set's allocations don't always
>> come from its own caches=2E With CONFIG_SLAB_BUCKETS=3Dn, after a faile=
d
>> kmem_buckets_create(), and for the DMA and reclaimable fallbacks, they
>> come from the general kmalloc caches, which can only give kmalloc()'s
>> alignment=2E
>>
>> So v6 goes back to mirroring the kmalloc cache's alignment,
>
>I might be missing something, but why is that a problem?
>
>For kmem_buckets users, the reason* to specify alignment is because
>they might need less strict alignment than kmalloc=2E
>
>(*Perhaps it's nice to document that in the comment)
>
>However, because kmem_buckets can fall back to kmalloc on e=2Eg=2E kernel=
s
>w/o CONFIG_SLAB_BUCKETS, it should be fine to fall back=2E No?
>
>Creating kmem_buckets with more strict alignment than
>kmalloc doesn't make sense=2E=20
>
>> and drops the ctor and flags arguments for the same reason=2E
>
>Uh, for ctor and flags, yes=2E We can't have them in kmem_buckets=2E
>
>> And the whole
>> exploration made me realize I had a completely wrong understanding of
>> how memcg worked=2E :P
>>=20
>> The bulk of this is mm/slab, but the final patch is netdev, which Paolo
>> acked in v4, so I'm hoping this whole series can go via slab?
>
>Going thorough slab/for-next sounds reasonable to me once it gets
>some reviews=2E
>
>Vlastimil?

Sure! If you review and feel it's ready to be added there, please do so=2E=
 I couldn't yet due to conferencing, should be able next week=2E

