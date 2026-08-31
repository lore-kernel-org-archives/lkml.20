Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95399352032
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176382; cv=none; b=PtMekktTJ+2O3jQDe5X6QzwAhXt+LZBia+tw+w7l5HdHI1bBlm8ZjDsoEURljO2/aOCtJ0nfbEBVDr70BdEV3xqggEAC+WEqYym1wFjOXo9LBdZmzslWt2soRWclpz1yV6jEckzXk+mbYK/eXEwmYG0Tw/6M+Rreb3SCjTjNqec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176382; c=relaxed/simple;
	bh=ojzmBSzjgmt+Op4F0invMwMFIz1g6drwKfoCoSkH3SA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAUK7Y3TQoVbnjZPuko3pS1Suj9LghJ66xFvc9CHv/n0vYPQCDPYsdRH2R5peYIClPLfbisprJUVF8zuJdwp8+mRZZgzC61yzfIgBEKnM/9SqFKzSHApQLxeKASqLhb7Ng24dZntEoiMa0ur1vTlWEGuBNMa2PzMwAoiIBxuDXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+2Lh8+u; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+2Lh8+u"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f633e6058so2650701f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176379; x=1788781179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+e3nkWCWmnCXTSnQisaZ/JcY9969zoxFZBJ4/hDxuA=;
        b=r+2Lh8+ujAF2EAggSDtWUPyaOCyTMGMYA9UmNq2rn2FvEkNv6dWBuCCL/4LwmWXe08
         Ttrs+TE7KNWvHayaU3XsAAj28tAEXGsjIyO65cftkkzW9ucau4fuMPCN1+VuzXgjaTF0
         dnQpzS79omqDIXQdxpEodlF+YEsIQjAXVTj/3P/sOHSbmabTiDuGUsRoytJ8QOMiWM+g
         rzzrtWjBOpJfPmSJadqTxoqiDHjbMglUvjolZDiTGHaFNJXfhzATGvzOYkgLSwYPYXMa
         +v9hUOQdBbZQN13edUbC4j0RcH4HllLyhTtbFjoEu6eNPXQEO4Ud81IzuGVQdrRX1BYJ
         q6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176379; x=1788781179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+e3nkWCWmnCXTSnQisaZ/JcY9969zoxFZBJ4/hDxuA=;
        b=VsiBBgFpaeVjNoOAV5USK/bZ7vzUfHkhUj2bYmO+QSY30RMs/GwfnGHyXbOF+p0h58
         MD+qKrbtXQaxsvGpftMmRgrHkFH2XJisJ7EGP7wrEjAKnXcxhTATEy+Hd6uVX5OmuZsC
         h4wcr+jCo9nzalIysRVAnsMVH3UjJTSobBH4g/VUTxkUv4hb810mTP7EjiHrFNYYBZ9l
         wRdGxkgh0nst/+SO7dtUja6t2xcRMzaIsaep9lZUii9Lljlu0uHEFG/RksriLhP4vx6R
         CISzCWNNWMrFjccNxGjcGu5+IXcbZBuo8y6d5OboFXZ5AQeY2a8bIprqShun/tQIl8cH
         Dpbw==
X-Forwarded-Encrypted: i=1; AKwUvBx+yRGjPTd70LHUj6/AHv9rRxOG7isbhgDnjQpnONVN3pAbL2P0IKhqiNbTcwZuTqQo8kqrJGZc1ZWjA/E=@vger.kernel.org
X-Gm-Message-State: AFuF++kwlTmTFDTidSssUh7reg6cVifQF57JBCb+rZG3v1SB+WsF8Y9U
	CO0FyNMSzqx5FZrsaKHeY3j4375T6Y6RYQmrWz70QavbNoUTj8TmHrzN
X-Gm-Gg: AYBFou1kmgBfzcTOoZ+D+TBad6IUfVaX6UU9fkpnj1KxbBdxTrHBmjVbK3FQz8Gjd4w
	qLeoiwGxyghovKUzkqk+A7/UuVz05nde5TuRdUEG/b9na68K5I7pLQUD7P2Fq0WhilYJRT5+Mke
	XcbxdHrOQ54wLegV8t19QUPKZzkk9iTjLDO+NBK9bPKC78DEx0lqCdd9+8qfQhauW1ozm2mCueL
	K8xPRjWkmEV5Q0q34MdEMBOmhR6tRfEowpd5aj84OGIXsueHDEVmBZRVhH5zD+2V0StPKgoP21d
	HbeCXTs9T7tREI0FJASoA70hvPDIu61Hgdird6PumB8/5GBmYukad8YEO9+fTWScNsVHxBv2qzI
	uwvyIpEZu+dUFBW/5IeL59i1wGjJjo3+ZPR153llW0rDZFiGzaybb8uTSabqblVI3NqHaAcuaL/
	oBgvfoe2pk+VP2Cgscc0eNlKy2owQg0DhOwSk8cJZZQ61jnZ4Rb9jgTmJe22zn0nQWHlsLAJxcC
	zS/LZKKPssKlT1H2GCLjUqVMA==
X-Received: by 2002:a05:6000:480c:b0:484:3f5d:7dc3 with SMTP id ffacd0b85a97d-4843f5d7de3mr3330798f8f.5.1788176378681;
        Mon, 31 Aug 2026 04:39:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843310ab29sm14535272f8f.0.2026.08.31.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:39:38 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:39:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>, Ritu
 Agarwal <rituagar@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <20260831123937.32255a49@pumpkin>
In-Reply-To: <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
	<20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
	<f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 12:13:08 +0200
Eli Billauer <eli.billauer@gmail.com> wrote:

> On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:
> > fifo_init() allocates the buffers backing the software FIFO and
> > endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> > 
> > These buffers can be allocated with kmalloc() as there's nothing special
> > about them to go directly to the page allocator.  
> 
> Except that they are a bit large.
> 
> fifo_init() may be requested to allocate up to 256 MB of buffer memory. 
> This memory resource is split into an array of buffers (fifo->mem[i]), 
> each 64 kiB (or less, if there's trouble obtaining segments of this size).

Would it really make sense to allocate the four buffers separately?
And/or use vmalloc().

David

> 
> Citing Documentation/core-api/memory-allocation.rst:
> 
> "The maximal size of a chunk that can be allocated with `kmalloc` is 
> limited. The actual limit depends on the hardware and the kernel 
> configuration, but it is a good practice to use `kmalloc` for objects 
> smaller than page size."
> 
> Regards,
>     Eli
> 

