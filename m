Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500811;
	b=QPgDfgjec83dziWf+9Qe8e90yOnuJikFPoCFN7PzhyOECGgzs1MJAvcJQqL5tUxM5k9h
	 qbtVWqv1VMTnsDXAhENrLdK+Beql9hakbdmmVZTKgrY4Ry/qdAWIRCxQd0cGzxRv3F5Q7
	 2nxKHpfibCi2oMkq+UmOAcKNytEwFBX97RcFJdT8AHyIm5OY3F8eFmnVtIORtm9pMFzt4
	 YnbgBz/aahl559Qm7ChXwHzjX8jiMpGEYjmQRwmThnKgIv92ucWbD83OozTttiP2m6mW9
	 LyXLljg5/sjdkl/B1bKia+KnI0/530wxAXOEYmytAd+aayCb0ZjwBmsl5Fzfa2ZFl5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zy2nREmykWs6qK0x39KiCj1K4H7Cbhg1tuWFyKfn2Lg=;
	b=Juky/CxPn8CjW2bVANJRcM5T0d+emOcZnn1aztNU5MhoU8zg7LnkQQNKT0XovDhDK19v
	 HrV56qiuCfWbDtC+lxe4RgCt8hu0P6nc+x1S3aNVkyxPndrQIGjuvEG5XFCmiVtvT3UOz
	 GjomA5M6xFbz/cQfXMvM2PUqjtPZ3V3lgNztpk3/9dIm66G+VRi8KBfG13BeiSD906mXy
	 fmuz/sQruV1OCU7x8AgU8Z+k688SI47MhRQruR4RutkICUJdgXb8xVnz27TRp+TcDi5KF
	 kRHalX4p07jYmabsO5cMQIpk5Jz0IY35t6s0+TyFkLOeNSfIhzaQR+cnEsqxnJNLV4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=HNqWJUHT;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A27B606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A27B606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=HNqWJUHT
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67be9601f31so4648754d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794500809; x=1795105609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zy2nREmykWs6qK0x39KiCj1K4H7Cbhg1tuWFyKfn2Lg=;
        b=HNqWJUHTwskCfxyQeoQpVsfc6Sn+8MVV6e/p7gNcizD0bH+DpnjfRftZbx9USWAwYk
         RI/4mQK0M/Qh+4Ty3oYNPCJlvSCaFt9jomFXCxhZFe5T1DvUNta3sgw7XlUzypwkR0gi
         1oX/3IyDZ5Cq0RzYtKYalwmBuwMn2l4LnwJDeGYPZWMFBUAX03KCiG7N7x49lBz7ttjW
         ID2/FjiXCsP6ArqlB620Djz/XXhgS+lhyZ+Zr1xy4d2tQLHPalrUTCENa5IqxVMkDSAc
         CcJMviBVtEkYNTy8i81z/eshsD7HWaKMCmk8vL0m7dohP1RgpWl7XiR8lrzN/QneP++T
         rrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500809; x=1795105609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zy2nREmykWs6qK0x39KiCj1K4H7Cbhg1tuWFyKfn2Lg=;
        b=mxbLsfXt6sLrv6g/xvTlz6AX81f/TLV1Od8Z0TOCcKXRktgfGm7T+KzYE28lvgPxtc
         YyyISxkZDybnwJExpRHhLWcDNh+t55r+oBGb5XmRG2ENot7YUKp5eXXi+ua3wsSNL/5H
         BKaYhogA75zEc9adfBSqyiG8Exv5vcwCZ0fJdUIYd9zu+LsYc/1p2v6n7E/U5iWTri5m
         3kYKIFwwadE6SkOtiJ1or1NKsAP7wABieSV7INGIH/Fg5362OYhKAyx2cco9f8WDlLeK
         8zReHKgofvSIL4T2G8XWxD8H3wyTZ6Zw+8wi3xo+VxJLYqy277xaXuGzmw2uyizfWsNT
         TVdA==
X-Forwarded-Encrypted: i=1; AL+hErGNlfUF1jaGAwlMRdz+Te78qyr4a/x2r5CfdBw/BNsCMpTFEfPuuPmQnJER2BIPToaz393M6vQbvRVolEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DmfHCRuxKvV2X+/3v3BDeZeze7JLbtYMB9tiigIy5xeq8xABP
	K7BSNs5iIzMA5XuwTtloElfkZbkKFjpkYuoAinN2cAjDSTLpxNLIWXNQdXRfCp1cYk0=
X-Gm-Gg: AYBFou2XfaRO9DS4vd/CSoXYvv4wDTb6K2OfAKYTsrB9znpwRu0v0fxK128nbmECR/V
	Y+vq793ik0mmtTi5Y/1NqXqEsgpAWtStBoT3G6INS9YuAg00IPbRZ+Hv+Swm0N1LrW/y3Qz2FrJ
	yCcscsp17Sh54xIR7rVPymc/l9yjvUBgcKCGEpLOOfMf5RrtMtKavLfLksMA8YP/g5TZ5QosdH/
	IhwdvjtdIvOlFCLRsgNjAir2Sk+KH92Kz/pi6vLSXivofY9cjbr3PfXeOnF5OMqiofZeumXzI34
	UPD13YFcf6bnyA2IqKhG/axdFLApDqL8dJ7cpXSpkvAISwXBFFT/h6TazNTczfT36YjAyl1yOz5
	FIh9dHN/qFoa5m2NSRKeKweHdGz1Ha1g7Mfh7sGvjooPr8cwOGNKykaMeMLzCrnW6xAXl5uJsc0
	Qz4lsvzKVel1hNFUiA6zJra7gfwAuzb7mpbaRHeKiFgN0xv+jyEEbd9jkaV8IIwoACFDCUNIOI5
	0KUw/kGuCZ07IfM6zUATZ5ZMBfltclOt3b5klkRDfezRn14JcHrf3D1H85jKVw6RAQ/x09YkJBE
	/+m9uYlSjjC5T6M7F6LiNybYZr/7
X-Received: by 2002:a05:690e:d01:b0:679:a2c3:b294 with SMTP id 956f58d0204a3-67c67ff20aemr3211748d50.83.1794500809370;
        Thu, 12 Nov 2026 08:26:49 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589cf1fcsm7627342d50.13.2026.11.12.08.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:26:47 -0800 (PST)
Date: Thu, 12 Nov 2026 11:26:46 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
	terrelln@fb.com, dsterba@suse.com, yosry@kernel.org,
	nphamcs@gmail.com, chengming.zhou@linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-crypto@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, riel@surriel.com,
	shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH 2/2] crypto: deflate - use vmalloc() for stream workspaces
Message-ID: <avXoxnMq6ns8AK0z@cmpxchg.org>
References: <20261111153532.1036709-1-usama.arif@linux.dev>
 <20261111153532.1036709-3-usama.arif@linux.dev>
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
In-Reply-To: <20261111153532.1036709-3-usama.arif@linux.dev>

On Wed, Nov 11, 2026 at 07:07:40AM -0800, Usama Arif wrote:
> The deflate acomp streams outlive the transforms that use them. One
> stream is allocated during transform initialization; additional
> per-CPU streams are allocated on demand. They are freed only when
> the algorithm is unregistered.
> 
> In a 4 KiB-page x86-64 build, each stream requests 145,320 bytes.
> If kvmalloc() succeeds via kmalloc(), it occupies an order-6 block
> (256 KiB). vmalloc() needs 36 backing pages (144 KiB), 112 KiB fewer
> per stream. Across 384 populated streams, that is 42 MiB less
> workspace backing if all would have used kmalloc(). There is no such
> gain when kvmalloc() already falls back to vmalloc().
> 
> Use vmalloc() and vfree() directly, as the crypto lz4 implementations
> already do. This uses vmalloc address space, page tables and
> bookkeeping; the figures above compare workspace backing only.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
