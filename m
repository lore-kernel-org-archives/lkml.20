Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984182;
	b=tJWKplyVI6EI4Qg+obJlG3P3NKOJKuW+0e0ej4aerIP8qoPN2CZrSKrRTt4ZexKvgF0G
	 sRXt/gc1X9gBnp2OMNKOjjgrmXe8axQUGWhU0czRZF6R6QOXvphPzarbW8dc+hMQaxAci
	 Gb0WGGTv6rZuRrbSZ4U7mgwAzcuoZSCy169d6iwoy11KcqJccWft9KUCWHTv2NzPVx3d/
	 gYiNogSm050GWQWGWVq4YcQNvFkJQ+vuCm9rKcDxBhoIp2c7vB6rIlGoGH5PCpuWJMjaD
	 i5addUHIjGP/+WQpzW0v+rYCMyiaFvyWz1qr5BpSzF2zNvlvPfFxur3xu4AWjv3YbRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=z+4adjsji42YunpnXzr153PsIW3465KG5I6YOnRXsyQ=;
	b=zh8GfjdieYTMRp6NPYOEKsP+ZoN1KlXaSrl5/UE3CLfPTcFT/AVKyu0bJr4dHpKWIWVW
	 NHQ4U4iDjODtQm245lyP8IS2CtRD0Sx5TEm/nMd7ZeoFFFs42UKRyFIkjPYzck1VAjuwv
	 VbPdObk6i4kK+oZ00TJrno3iWsdDsFAzz4ccPTAeKAo5VNSf532S8u02wDBiiv+yMd8ye
	 nBMHO/FnpYE0AWDidX7FWIJj+iWbTm0TZ1YaF1v73HNKE9vdN8b1tgS1HxIupCyraQMSA
	 N3ziw9yNEKu+A6tYfUJqaV4jZkYxE2p+gxdSJ6pJIxVfPiJPyMPIIIYVy2RcotrTi8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fFETq0jP;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E738606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E738606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fFETq0jP
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so4510285eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792984181; x=1793588981; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+4adjsji42YunpnXzr153PsIW3465KG5I6YOnRXsyQ=;
        b=fFETq0jPG6sQ9wiL42ku236U241G4j1Kd8IqsCybUJpzUdGray+Dl/X4p4SlX1WzID
         tzatSkKdSr6jG4SqhFB9YvxZ53PReNOYl84lku+DAcBWcuo9wPZQrxqeWa1G8aiU46BQ
         CVdLpCPJhKcsJFTXheLehfg1WqxtkgNKUHPlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984181; x=1793588981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z+4adjsji42YunpnXzr153PsIW3465KG5I6YOnRXsyQ=;
        b=vlIBvs70evBLEpc198X+Gtj8F45bGiAZ9c4jps3pTFlhL261VJxeNpOj62xbTG7YDG
         DfVSStxhgNxHadgMeqkDawDGW0BIM42NqB6SOCeQRXyurEfuwdMJPaHVPBv9LNZfS4BV
         iZJezHXGSl0rqpI2LrPaJfn0BN7TVfBSJBNWIMTXVvrYzFrihp7PpI2RWv+eBcNRbhkc
         v4cQHnK+1onZpF8fM+o7LGiCMniOJucKJBS6VjFFdNKbrzJzuYT5k2MYPiO3aCRxM0U8
         8NDXFr5YqNaTV6AKCX9f9lud2r4X0CKLCO9G8OByOnp9mYWes3sto1iC4NTV5QTlvkMZ
         WRBg==
X-Forwarded-Encrypted: i=1; AKwUvBxOAPBfvWdFH1Ba9iBdRcgwFuIUKPbIzmKSsF8ZjXxsRYtihlzVGFrCDSynlp+mZEl2u/7A4BwKkD9FPnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdlZA/0iO5ZxZgy5lHFSesSkVIh0Ctf5787VEmEiamKnt+lNh6
	eCc5oEVXteELwzFMJWteAvjSQruANR5tzRmfWgRwfhCUY1KiJwd8zNLA+ZBuJPpqgg==
X-Gm-Gg: AYBFou07PvFzGxpchW5EjBbqfcIAgCGnNCbsN5ebAsGWPtT4RjDCoVuTbZ0XNtZ8wjM
	pbBIgsGhkIv3d1I5o+XllNfkODUFlyi0YaxgHPYTV9tQEfqIzWijtZx6PptaPRIMOIGqmuHuvUH
	iOObHTyhvkZqUA9Fk5g//K+NV5a/NyRjn4PKsqbqnEjyyiKNWtA3By6AkUKZPulL8Z6Gtyfgsy8
	iuK1YhhKgYSKOhzXfb75bNZS/S+mVTdwA/acWRgn2F8c+yiUCNhAHunX7UudBmx0yqpZl6jy7gH
	dgnN79DbZ7MTXoRQlVURz+OqZnNtkOOisQ3cSU3KfUK8I+XU15HXX3hauifbkd7VUwGzKtIZLgE
	03cIEnBwzoqEl0qh5lZBy4AEuJuXp3cV/niAZjn/Z8J4lNfOYCLCnG7AciA/Ys7oSaVaWrOhjgT
	K8pGx0ZSJ4YfQ3i6FnDOowozW8q83IKcvNYFV1cfDBu/Ol9NOjgkRFS1X1mu2qlS9bWsPj3/kXO
	r9eilzhuGQg4zjp6kPrQxPTpwSa4nFcjM7uAzLqgdROHkuLAJYxfYDz+i5kGP0LQSZu6JPKgoBS
	Eo7EdhhaxWHBvwqVKQ==
X-Received: by 2002:a05:7300:3d13:b0:361:39c0:c393 with SMTP id 5a478bee46e88-369e848a6dcmr9746177eec.13.1792984181239;
        Sun, 25 Oct 2026 20:09:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:4346:aa6:8d90:326])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm13681062eec.7.2026.10.25.20.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:09:40 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:09:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Brian Geffon <bgeffon@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, Bo Zhang <zhangbo0325@gmail.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Message-ID: <at7ECnijIur1XOAG@google.com>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
 <20261021024236.1787884-10-senozhatsky@chromium.org>
 <CADyq12xeONu-+YRP79KaH4XCsSrNK5DdoKw6T5YSEyW7Acxh7w@mail.gmail.com>
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
In-Reply-To: <CADyq12xeONu-+YRP79KaH4XCsSrNK5DdoKw6T5YSEyW7Acxh7w@mail.gmail.com>

On (26/10/23 13:05), Brian Geffon wrote:
> On Tue, Oct 20, 2026 at 10:43 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > Split struct zcomp_strm into separate compression (Write zcomp_cstrm)
> > and decompression (Read zcomp_dstrm) streams, and split zcomp_ops
> > context creation/destruction into create_cctx/destroy_cctx and
> > optional create_dctx/destroy_dctx callbacks.
> >
> > This decouples Read (decompression) and Write (compression) paths so
> > they no longer contend on the same per-CPU stream mutex (Writer vs
> > Reader priority inversion).  Currently, a (low priority) Writer that
> > holds the stream mutex can be preempted by a (higher priority) Reader
> > on the same CPU, which then blocks on that mutex until the Writer gets
> > to run again and releases it, which can take a long time when there
> > are other runnable tasks on that CPU.  The good news is that Read and
> > Write contexts are completely independent - compression uses its own
> > scratch buffer that decompression never touches, and decompression
> > uses its own local buffer (for spanning zsmalloc objects) that
> > compression never touches, so the Read/Write context split doesn't
> > noticeably increase memory usage.  In addition many S/W backends have
> > stateless decompression contexts.
> >
> > A quick synthetic fio test for Writer vs Reader inversion on 24 CPUs
> > (preempt=full, zstd, 48 low priority (nice 19) writers, 24 normal
> > priority (nice 0) CPU hogs and 24 high priority (nice -19) readers):
> >
> >   Metric           Base               Patched
> >   ----------------------------------------------------------
> >   Read IOPS        207k               1,150k        (+5.6x)
> >   Read clat avg    101.50 us          7.76 us       (-13.1x)
> >   Read clat stdev  5,615.90 us        30.78 us      (-182x)
> >   Read clat p99.99 258,998 us         111.10 us     (-2331x)
> >   Read clat max    1,342,600 us       11,217 us     (-120x)
> 
> These results are awesome and thanks for exploring other options. I
> agree this sounds like a great path forward.
> 
> >
> > Suggested-by: Barry Song <baohua@kernel.org>
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> Acked-by: Brian Geffon <bgeffon@google.com>

Thank you, sir!
