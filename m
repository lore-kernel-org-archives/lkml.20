Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793991715;
	b=NuT4lcnh+g5EF+K7OVEENgNpr52aBE+AcbC23YI632YA4Dqj5gD20DPy3rIDkjX0QI01
	 lIKM0tscwIT20AOEQgaJG1/iaGPobaw3sdYofmnoWHuD1Am2NSAOas0YZ5PWenF8QeBCs
	 PS9qJzmv9Wuzde2H8E4HcUSDMLjnUwNqNDq9/k5u6O9PID/wT/xZ2qDDXJg4kFcIdFhuK
	 /yCBAb3Cjduj9MWUCcfENR279GZoS0XU8Z0hz8oX6QdyqJjBl40lBhZU0g7KZ+HHjWAgF
	 larwxTa3Vz8HkxDPEbO9aNgRUJTJ9Tl0lTvOF8eLyFfYN+8OCdX6TiRRFurFxjkgZvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
	b=fKe5fFvSbNCBpKRJNZYioJwevL8/h2d/mHSWZIRUa/0yTm1aREpmgyILbDQG42WkT57S
	 W17NHMbwcGyz9PDzLp6Tn6EmCnM5gUrqXHxNzHYHxXBOYobJUxQ1rT0MEMkRHK+sCVU2z
	 4x0RTUq7YF+lxf5RkGtaX2vOpBN/Ct4kEq7LwvJGgJ0uEmS98U9lJszZXruA9JHU1j4TB
	 /nw8l7PFnpcJlSsPvD+UUguzPRo7LFs2YM+A2nz+/eE1OqZiciIztpeXhobvuRehwn4XW
	 3qNshyzLw5nWkccMxIy2jlq/XzXcYQ5zVoCh/bX35Pcj2xbvETLmw2Vuwz+qX6Ppz2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QZd5DdfN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8E0606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8E0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QZd5DdfN
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533202fe429so102021cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793991714; cv=none;
        d=google.com; s=arc-20260327;
        b=e0R3o3AmigED4skLTUAFGOUK7KHyXDJPSTcfIjdBCBz6Pv2P+/CtwVJV0BhFp9iVUK
         nThXfXZYUXJCmp+skcNuKIhZI3XMfhau/ATd6aeNTisoqi6reb00vP8MX4r94xRtIwfF
         HNN1Ajq2r8O+PmjYyYwOulwi1MK6tFT4KqFDAxLYd3CL45kExL4QK/2B4SFfSGHfn9XV
         I2w6aIEV7BjldK3NXTaWF1Qfab3+qJv5wCFgBlA6O8lNI81TUmO3PSDbfdJw2mP2i3N/
         I9bGTJt0FCxTsGcN2yUVy/LyrKUqIObZUZ6NiG4xcUcuIgtcGu9DsAGSvbITWAOG4+w6
         6dZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        fh=1YrofwTihxX5DWmdSK1/Oa94CCfE6XQ80o+G6Iz8CXo=;
        b=AQUabPMYFXxHhihGSD5TgARfQL/R3/+itH2NbsI5coxonRXoSAr7a7pet55r40sVAc
         ppI6ohwn5Cos8rd6w4ae9HoivfmEa0jvlJwbB446MBjULkzeES2JQ86jXVwm8ZPa2Q7M
         avoSarMrX73t7bmh0w0xxhrStjp2sOgQr8z2kpM7HmN3+NX9rtuXu1pD5YyJ6SvjR+ZQ
         HQVqgZpgCzBVV9x219iFrbwnMzcLCNSKcrrKBAoNmnxJT5287vEWfsD8s6jMXfx7vAnb
         +ObwFKhBUxNrtcvaghZrNfrjqa/VSy0spt6JrbPEsQpSgTcjHby8/PC6EZRYzn25z9Ml
         VCPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793991714; x=1794596514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        b=QZd5DdfNiPMqB2kvwbYh3nO/5GPYD674T9l6eR+OCaSzIdoSmtUqaZQ6M5SMMWn6U0
         85Du0GrXpfeB3VGHIFcJIGpPcmRcQJ9MieNmOPZPDmHSrd1SHgI3G1UzJB7qlF0EDKjJ
         +tUP1uWkYEo7G7jHPSO40yaTMj+/bF/O+wDuxzwM+cc6DcXP4YwoRqx1/NvSHq/Jv/Pq
         Vcj8E2sK4MFsxfgnSfB4dUAmBcnkC74+mQ/zLyy1dVfCigQTEXcrDOd7zwvCjwNroYzg
         OBOy00EbN8NBdCcABv2CzdN7yM9CVV1KJIzVSAl1eXNHuDKeBeRPxhoFnXCm5AvjnUun
         VARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991714; x=1794596514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        b=YCHcH1SOB7ISFg0hYol3clBhplTQCNNSsZPJS7Gw4d9cGr0hV1KGBYr7lyaXSDUJoA
         h+L/c815ebhPAagy+sEQ0o4oTy3WEJsdLV+XGVcDEcxF37+wlmk+iTjQI5TKotLyzX7C
         kLpk99yLuCss/z8J8GoqlKXH0ZbgJx2dY71mEf3WAVEi/6itx8M7foUIfwdvzU4njGIM
         T5tCH68dsLdzOGI2tELHNt6VmxbDdgd87uMxR/o9sS5FtwIhScDqnV4Pm7/uXm9GtIzD
         PUhjlMEkfgVDHIFDLqFjGvFfz2unagRUx7/PxlAnoJT2qpgy4aNg6Ens1DwUwAGF8Bby
         ytUw==
X-Forwarded-Encrypted: i=1; AKwUvBwZupdLutGVk9tZCOz7HII4DSCpyi1wyjgKFD6EL9+ssnw5BtuCpQ2QhHhal/XIu5rIF1AdVZpFtjEmOos=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0ug98rd+A+UmRrTXNHsqGpCu5BtPs7Neft3eJFxdP2FUEoJV0
	ubMAC8U4y0Xfo5po1ojDMTjwC/YghMRtPfHvFOVx1GdXVShcfAgVkOt6YBe8Rwq8bIHZxryBYCi
	L+wzHLyqm8+b+JYM7HR3tr0015U5hauyt3BKSTrOy
X-Gm-Gg: AYBFou0IDJ74R1o31+VIvhn9sqWJMpB0cYp7Vr/zuwA5mBUnsmKzsSFqwc2h1RwolZD
	Y0Ft/K2N1igI0pXLTHlfr8/MVFFtiQisztvvQziEKjNhhpMu9c9lBOdPRiMxfM9l+zrvQdwIx8M
	6sCkBxzfj2+5jIHmxYt5HWDUiZlvPQ+PiykFH7DMQf5wfXqyN2e9xvJr4GQvBV3KSrJ9NURSvgC
	0Wo67RtLFjEBj5DnKwAqvUrDK6dHv+3HHa5CvATmlEyrnyefop2Bq3ZPnu1rMmK/yYGVOMId0Fh
	Z6WpFYMI2rLEFY95jXkiCDQwl+SpYm0RT/Y8WCACXKFyjWwqCI+vn4RwrrKixUywTnXS/LRXa6v
	rOY6GyP5tUI4/Z1SX9wB4s5EJG1khQmxoRRFMQg==
X-Received: by 2002:a05:622a:90c:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-54f5c235197mr4277431cf.5.1793991712760; Fri, 06 Nov 2026
 11:01:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca> <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca> <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
 <20261106184346.GJ663069@ziepe.ca>
In-Reply-To: <20261106184346.GJ663069@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 6 Nov 2026 20:01:14 +0100
X-Gm-Features: AclHuK8RLl1nJ3Ebb-rbtl0GPWPY_LeKIqNGDlWDxF7jQ269eiN5kMKC-Dmlr_c
Message-ID: <CAMOZA0L3c0zWvvVF9btAxQSox_hQTZP6W1sK0vgYPQ2OMJtS8Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Naman Gulati <namangulati@google.com>, Christoph Hellwig <hch@lst.de>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:43=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Fri, Nov 06, 2026 at 10:17:38AM -0800, Naman Gulati wrote:
...
> > This problem extends to generally reducing IOMMU overhead in
> > networking - taking the dma map/unmap cost out of the hot-path and
> > avoiding IOTLB thrashing.
>
> Sure, that makes sense, but just having a pool of entirely normal
> pre-dma-mapped memory is quite a different problem from what launched
> this thread...

Since I launched the thread, I guess I should comment...

I wanted to address multiple problems, in random order:
- IOTLB thrashing
- better security than DMA-FQ
- reduce dma map/unmap costs (both on the host and guest)
- reduce/avoid bounce buffer overhead in Confidential Computing and
overcommitted VMs
- not just for networking, also for disks and accelerators etc.

Now it turns out that one way to address all of them was to
- create a special memory allocator, which distributed ordinary  memory but
  with additional metadata that make it easier to implement large
iommu mappings,
  track lifetime etc.
- hook this allocator into relevant kernel subsystems so that consumers
  could use it with little or no changes.

As it happens, the first version I posted last month was not terribly clean=
,
and possibly not terribly well presented, and had some redundancy that
was unnecessary.

The next version (hopefully next week) is hopefully a lot cleaner,
and i think the best witness is how small is the change to pagepool,
basically "if the device has opted in, ask for that special memory"



diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index b775b6305fb78..e12ba47a20e43 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -16,6 +16,7 @@
 #include <net/page_pool/helpers.h>
 #include <net/page_pool/memory_provider.h>
 #include <net/xdp.h>
+#include <linux/pisa.h>

 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -602,6 +603,8 @@ static noinline netmem_ref
__page_pool_alloc_netmems_slow(struct page_pool *pool
         */
        if ((gfp & GFP_ATOMIC) =3D=3D GFP_ATOMIC)
                gfp |=3D __GFP_NOWARN;
+       if (dma_map)
+               gfp |=3D pisa_rx_gfp(pool->p.dev);

        /* Don't support bulk alloc for high-order pages */
        if (unlikely(pp_order))

The network tx side is more complicated because, as discussed
earlier, we need to be sure that the leaf device is one that needs
those special dma-able buffers, and there isn't (or I have not found)
one central place to hook into for tcp, udp, zerocopy,
security things etc., leading to a plethora of small hooks


 net/core/skbuff.c                                            |   42 +++-
 net/core/sock.c                                              |   62 +++++-
 net/ipv4/esp4.c                                              |    4 +-
 net/ipv4/ip_output.c                                         |   19 +-
 net/ipv4/tcp.c                                               |   23 ++-
 net/ipv4/tcp_output.c                                        |   12 +-
 net/ipv6/esp6.c                                              |    4 +-
 net/ipv6/ip6_output.c                                        |   19 +-
 net/tls/tls_device.c                                         |    4 +-


cheers
luigi
