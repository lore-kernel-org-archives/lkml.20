Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594870;
	b=qp596DziVXYCfePXNh8uBd8x27LAeNFlX8Tam7hPcqZMrQ1gsBkcFt0+sO+TOBYwodcL
	 KPWVJ3GdPPMC6iLNri+DVblRT3gGneV3Ebio1APXD/snBHw/gUdQxC6X8FvxPSNRXj0yl
	 Sjzy72eCO5avAW9RUZXWzX5XPRANqvaAmAR8Fs48EV91cGGjxVrpmL6zzy+/kRoNR8+5Y
	 RkZS2f+nCnJ/46UQjLCZ/570RWMEpCaR+AFbHZqTeOUTZlWXYAs/jZm9OH2i0Fu+d2nPt
	 Fe063MROOq+3Z7ATOChlQFWGW3aVTixls9C2Zh0UsyNEOoKpqTJYLKy+LSpqTQTvrpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=l5YmJOrwJgNdPors4hwaMvEw7jPwZ//sTr6muol287w=;
	b=BdVz52OftI42iDTGpCFQYr8gewRjuhJQfbeIFRtE1bc89LwUmI/hrAcw4F4vHZ0CtR9n
	 ePPeiEvGlyf9dcjOYpi6lK/SL+0ADgGd+oM5xlu86ini3vDPw3cSIHPJpSN6yHUA01NHQ
	 p+rT7fwSJvsJL0PWPwPHCTJ0vF2Zpx/aT1G8VOs+2N/gy+WI510HBou/IRhBY7FtpKxmp
	 h+jG97zMTIaMFJsaW4rzv7Rbc6RSRRPDJkJa+CvYfHzqYats1TC/nwNe2CebBq7o3MeLG
	 MEwk/IuYSEgMIghonAdXcSDUBoFRxWYnvHYiKp9zMeYyb8zShOOnsWtYl+hDsKzpsEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F2F606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F2F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-917bab38b14so9366766d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792594867; x=1793199667; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5YmJOrwJgNdPors4hwaMvEw7jPwZ//sTr6muol287w=;
        b=SNfikhEbH9QUIAPD8zgF6gBEb3YRzM7HYTihFKf5TM3kPasOVzdC7DuU6I5nJZHW1A
         iomGNjKUYhQ+HiDPKGRa/M8EyF3FMnkdDth17W2AfTclhZqdUAiqO76yQ+rrk6ey93GU
         D/uoieoGan7l0u8KWOrSbaxT79Ps6th+14rW6Tc5hUaPjKXgS1uWSzUF+jeEf1tr6d2R
         Ehk+YWVWiQw6shc9Jxm7sagMIDEvlZf0dPUv0nXDSdHgKsC1CTgrpPQdv3mQP0VXgGhV
         S+mmifHdwVkelVZ4pSbh4EGpZ+08yJFeJQD0P7eUu51B2J47VQlKqA1fH1ZYOGUVs9rW
         IECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594867; x=1793199667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5YmJOrwJgNdPors4hwaMvEw7jPwZ//sTr6muol287w=;
        b=Wk1kaJyEBqHtEP2DOc6geZkPz7FBcearPm58gESOhE8zapMTHzdgw8hbLX64dWGEUP
         HtNo/L6dcVBwzuBhoIlGSOiu/Sot4quFHreXQqHuin5Mrj6RBqpmsc13k+mkuCac0Anm
         kwYlYA0R3S+toxa26S5PJiS9bEAUttrJMpddqUY8TOQFOIdKLy/XRxEJ+wclt27vwIUY
         rHVTTsP6qMaGJIWu9JF0aihSoQAO+bkfpnU2Z3oB3D8SGTIxjVE9xrLNBEI/6r2zf6fc
         cylORbg+MR7N6vGJMlTY0wmwnc8ZUvvkcwyc5/7hu+jrm/Qffii3sxntqupf2tDK1bVh
         MpUg==
X-Forwarded-Encrypted: i=1; AKwUvBwh4Nj75Bp7lAPNoExnCODMPK4Kfp8hR0atBNCeIJc0n+myyFhLDp6BgiRjLpNQSWDOVBoZHqgW3enndTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYICPJdQ0D2yJ6XwKhNojoUHaYMC0qVZogHJtvq/nO0+gJge1t/R
	jNP/9ytXXm/1xxcRKJzMa+B7j9Bo76nGE7ZHag2I5U2wdIpOhDstGXuB0zo0KOw4njvssR0j0LA
	VNS7V
X-Gm-Gg: AYBFou0/BqfrAtQr3IY5wHkpCbbDrBIWmFwJfHtPrc6h5qWEodxx24zZAEI5q6e1Sbw
	n7b+djZSKc/MjgQzk5smbP2fL3eGWItiwks0PRsV/hpSt2sKtIrAIjACZ3nU/1MrJ6PllUSVHK2
	egWAGQktJK8s2GDdYPR6GtOQgxkAgi/R1G+Xx73IhNVnxzBRRQ+ps9fKyyB05tvqtqlBaVJHWZv
	q++GKj5Vy1L/nqE0oCLlrrp3c5Xwn2SXWSOnHekhgeQTKvLjQTebfrbqLxTryzHq550+1zZzUgd
	DtPHmZFxLmAwKEpCUg+shYfvG4gYMiG/l2urbGKBGyccjFg8nhFHM7mwQxGFg9rYfMFdhBB3S/e
	evQSK8sWRVwhuZT/kRDyDt0wicD24yAqiGHhJRZt9FPEOYkTMJJ0rzq0CIi5ecaFIsOuquIrfBu
	0MZAMTJL5CVKnSVuuRDYyNdYDHGH9owbsHRk1M4aPgObzLEFGy9YkZiGFtiUX8Bc2+H8fINhEmK
	FgAkpJMZq+U3+fZZq0ugAoHoTj7Mk/XHMu5VY1Od3tAC24bQVP4xswQAGSor5IGt4UDnf6Xma6O
	WINOAirJVtFV5xqNsDgXWJUOzxw2CPsluHbDbg==
X-Received: by 2002:a05:620a:29c6:b0:93f:3863:268a with SMTP id af79cd13be357-93f57f23259mr459988385a.37.1792594866402;
        Wed, 21 Oct 2026 08:01:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6e030sm276704185a.1.2026.10.21.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:01:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJXoO-0000000DwuG-2ayD;
	Wed, 21 Oct 2026 12:01:04 -0300
Date: Wed, 21 Oct 2026 12:01:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Restore the scatterlist entry count before
 freeing
Message-ID: <20261021150104.GT14213@ziepe.ca>
References: <20261013-dma-buf-fixes-v1-1-0e2d9ca41f3a@nvidia.com>
 <20261019183146.GH64621@unreal>
 <dc91d903-139d-4253-83f7-51a78dd4530b@amd.com>
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
In-Reply-To: <dc91d903-139d-4253-83f7-51a78dd4530b@amd.com>

On Tue, Oct 20, 2026 at 08:42:18AM +0200, Christian König wrote:
> On 10/19/26 20:31, Leon Romanovsky wrote:
> > On Tue, Oct 13, 2026 at 02:46:24PM +0300, Leon Romanovsky wrote:
> >> From: Leon Romanovsky <leonro@nvidia.com>
> >>
> >> dma_buf_phys_vec_to_sgt() clears orig_nents to mark the returned table
> >> as DMA-only. Since sg_free_table() uses orig_nents to walk and free the
> >> scatterlist, dma_buf_free_sgt() leaks the allocation on every successful
> >> map/unmap cycle.
> >>
> >> Restore orig_nents from nents before freeing the table. The helper
> >> allocates the DMA list directly, so nents retains the allocation count,
> >> including for chained scatterlists.
> >>
> >>
> >> The reported kmemleak output was:
> >>
> >> KMEMLEAK LEAK: 2 driver-related leak(s)
> >> KMEMLEAK LEAK: unreferenced object 0xff11000125ceff00 (size 32):
> >> KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295031027
> >> KMEMLEAK LEAK:   hex dump (first 32 bytes):
> >> KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >> KMEMLEAK LEAK:     00 00 01 00 28 38 00 00 00 10 00 00 00 00 00 00  ....(8..........
> >> KMEMLEAK LEAK:   backtrace (crc 4e8077f2):
> >> KMEMLEAK LEAK:     __kmalloc_noprof+0x451/0x8b0
> >> KMEMLEAK LEAK:     __sg_alloc_table+0x2a0/0x4d0
> >> KMEMLEAK LEAK:     sg_alloc_table+0x24/0x170
> >> KMEMLEAK LEAK:     dma_buf_phys_vec_to_sgt+0x84f/0xed0
> >> KMEMLEAK LEAK:     0xffffffffa1ad21a8
> >> KMEMLEAK LEAK:     dma_buf_map_attachment+0x138/0x690
> >> KMEMLEAK LEAK:     ib_umem_dmabuf_map_pages+0x249/0xc90 [ib_core]
> >> KMEMLEAK LEAK:     0xffffffffa138f8d2
> >> KMEMLEAK LEAK:     0xffffffffa1396abe
> >> KMEMLEAK LEAK:     0xffffffffa1331a5f
> >> KMEMLEAK LEAK:     0xffffffffa13320dd
> >> KMEMLEAK LEAK:     0xffffffffa1ad696d
> >> KMEMLEAK LEAK:     0xffffffffa1acecc7
> >> KMEMLEAK LEAK:     0xffffffffa1acfd17
> >> KMEMLEAK LEAK:     __x64_sys_ioctl+0x72c/0x11f0
> >> KMEMLEAK LEAK:     do_syscall_64+0xa1/0x4f0
> >> KMEMLEAK LEAK: unreferenced object 0xff1100016dbf3a80 (size 32):
> >> KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295034705
> >> KMEMLEAK LEAK:   hex dump (first 32 bytes):
> >> KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >> KMEMLEAK LEAK:     00 20 10 00 28 38 00 00 00 10 00 00 00 00 00 00  . ..(8..........
> >>
> >> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> >> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> >> ---
> >>  drivers/dma-buf/dma-buf-mapping.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> > 
> > Reminder, thanks
> 
> I'm waiting for anybody familiar with the code to review this.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
