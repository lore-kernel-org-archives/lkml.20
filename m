Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348840;
	b=AbuNaIBLyXQnsgsNe12+mEN3ZKpkrYcW1NnJa47XXi9FFx+Vg3lHYpHnuBiV6j967o+Q
	 uoaqtez0tiae1XZsRjk0YegJgxCFeWW4d8Q6ewhe5m56nXrdMwMoi0GsG73HE3X5XAgOI
	 Tmd3128KUrMmmCVgkEkUqbdsw0yPo9qwu8xVtLiKNEdShmkvgXv9dNWkQpovbmoKYkh6Y
	 ETToLI+NYJnJVKa9eLaiImOxMWZCoJ8SJHeUwZf26OhNgHxfjHDE6owslxGqFzVJNfu7c
	 xNIB0175Qazqzjk2Gfll2Q2BN5DPfVM8xxXh7To3i3jQLbMvfpSv7u4wVEAwfll0f4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=o1TWetvXqmnZqe66iKDTc99BGiIMVM+8egrEZgCwU64=;
	b=Kfmp5cyhouPiszuA3VtEa83dnVZNTMVHmhbIBYvevG6+6M54g/hr3yGoyWImQryzEWVo
	 fPCv0qj7PvruWwaSzsnmej4vUBtDxkd8RcxUmX1ScBxt/2D5xwuNIeti5P4YEKbPgBGv0
	 +rfGgxVwv/xL971oPZ48Mc073RvlbKNGp1km5qHvcegid39gjt1aIafbz/3yIrFU+dDRm
	 VXRYivcymHz7ujZPbW8764XgsEc5Ze7zPZaJYUMyyFAmW5AjAONWEUG4KBmvAFGUF/tRC
	 XbYlrq5BfzxEbGXlOEawIGJoAJaCKTZCKI0CGief1FVsA0WGcUJ/fuonAK6vTrF4SHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sb7YHck2;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F3D60A2628
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F3D60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sb7YHck2
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1422182a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794348839; x=1794953639; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1TWetvXqmnZqe66iKDTc99BGiIMVM+8egrEZgCwU64=;
        b=sb7YHck2HEI3rzp3xBJIcgU9+z5nvBQcaCX6qGriHWzx0RqLUOjGs/eEmNmXX5cDKy
         x1T/wdm8ATuTZC/ZMeK8MnCZZOAM5RcwTSfY4hREYVJAng9ZqJHz+oPaXoQtHGR/CYxl
         Py6bwVna1z/c45jgSCqs0gdKbU9Ofg8+hC/K9QRNrkvCAzi+QaSMZ8D6u3YKqykLVgc1
         iwriTemklGSLka8QVNp757TUmhoSQXXJOjiS0fZqEwntRr+n3SoAVlbbheOsq7mKs8yx
         KfXN4SC0p2moI48sbO7j7nJepvZUixgW6XqkZjrxwHaXb996CgowhAKVJaSbJVQy3kgX
         ygmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348839; x=1794953639;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o1TWetvXqmnZqe66iKDTc99BGiIMVM+8egrEZgCwU64=;
        b=Gn7UxbU47ZXL82yI+jDbIsFmH0JvruuuxHCu4zNrgfCUnb4fu+WV/gB0+JPvgRYhfG
         nVmpCKQALLyAauA3VLMWJMS2e/PIiMZG10uyLSLtPag0vAmRT4hHx0DfrIQKs6kluoUd
         PHP6I3lIVEsxGhYrgx/0gMO5AF1V+ye8C9iBf/pyRZx1Dksmw8lLdpExKkBoZG3SvSqZ
         ONB4e0k8ie8IaR1W8aN/sHcK3LAhv5a53clLTy2d5BAMixqPIY9fGCd//4/Ne4jK9mcR
         bMQ1Ms9pd1e1CGBqsP8Ox07w2XUMc83Z0LggoMzOhT3K/I+uOy6GtOJDIb5EVSn4IC/m
         Go7Q==
X-Forwarded-Encrypted: i=1; AL+hErEjQBnQicOxpdcTOl/+QpMjhgQeS89pYxTLP9hXSLqFd0Ak/RJIr6ztUH5NdXODB2VbjDeMC5xzTY7en0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PH2lc3WM/sjV1g4JkDTmtNiH+n8YeW2mPRwoRwOhN9al7Yj/q
	SmuF/a2nmbVD+3+tfU2hkZEVthc8NMhDwSQ7ulS1gjiHHsEUcxUs/ALASrkW0Fmjp94=
X-Gm-Gg: AYBFou13woTAJm+XigWnVB8bU6bXKGan2vr8zy6dQk7azrWA9pQXyABRIxK9E18fh+O
	LIuiiCnm98qiXU4V22Pl0yQSVEIhSJ1W9LL0rAwmJTvqpX9ogmcVuSwkTd0+o6QykmYmmrhnwGb
	D00L1vCyg8ghRA2F/C4+bZFRJer2j0SlJ+s5HGyJH3X66vePcWhS81xI4ArL9W3YKKwrVYqgGFC
	UehdhuDmDICSh22VWPAgPZun/Guzd6duvuiXHsIevjwXDOZMYxoO4BaApussbEWF0qZVCxfJQFu
	7B9K57Ozm8Jot7WARGeg7Zwzsl/FjFWAXa26Bd1+5JaTtQ2/bjs23Qnfsd5oMqy6Zx2HKgEKjB1
	H1mhriAhZzaADVYIBvkcpHfb1Ep7m2c/3oq/X78CPN1Cqi4yx2VnWlJNymnCApSZYxCYd83D3tX
	x0tLmoiw/LCapuVQOmHellVy9NAYgQ5u6CTM8FHtm5OXoViSr+Akag7paqtrNkdPGFRqfKOXqI/
	HfZXPPODAhoXSvRfwPLLKbM/6hXyO2MKe2+CgjVN5WH6LXvr98AintN0ICefMlMENyW/zJup+2n
	URqQrBu3dvEowcxWsUW9cED6P/TTLXtI5cXciq1A5GE=
X-Received: by 2002:a17:90b:2d85:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b182f570cdmr210701a91.31.1794348838994;
        Tue, 10 Nov 2026 14:13:58 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:42::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db4faacsm1519211a91.7.2026.11.10.14.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:13:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:13:57 -0800
From: Joe Damato <joe@dama.to>
To: Michael Chan <michael.chan@broadcom.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>,
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <avOXJf5yl8ajf8Qr@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>,
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
References: <20261106191423.4194081-1-joe@dama.to>
 <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
 <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>
 <avNWzavrxJSasfp5@devvm20253.cco0.facebook.com>
 <CACKFLikU8ax8-VN+EiAhrn_w+2=yex2TNHPxEYqni6g0BKHKKQ@mail.gmail.com>
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
In-Reply-To: <CACKFLikU8ax8-VN+EiAhrn_w+2=yex2TNHPxEYqni6g0BKHKKQ@mail.gmail.com>

On Tue, Nov 10, 2026 at 10:14:50AM -0800, Michael Chan wrote:
> On Tue, Nov 10, 2026 at 9:39 AM Joe Damato <joe@dama.to> wrote:
> >
> > On Mon, Nov 09, 2026 at 04:13:57PM -0800, Michael Chan wrote:
> > > On Mon, Nov 9, 2026 at 12:12 PM Joe Damato <joe@dama.to> wrote:
> > >
> > > >   - Notifying bnxt_re when DMA is stopped.
> > >
> > > I think this is probably the one item that should be added to the
> > > patchset.  When DMA is disabled, RoCE will not work at all so adding
> > > this will make the series more complete.  It may be as simple as
> > > calling bnxt_ulp_stop(), but I haven't looked into it in detail.
> >
> > Hm. bnxt_stop_dma runs with rtnl and the netdev instance lock held and
> > bnxt_ulp_stop -> bnxt_re_suspend takes both. So, I don't think calling
> > bnxt_ulp_stop is going to work.
> >
> > Maybe I need to make a new patch where bnxt_stop_dma queues a work item that
> > calls bnxt_ulp_stop without locks being held? Not sure.
> >
> > Also: would you be OK with bnxt_re treating BNXT_STATE_DMA_STOPPED as
> > detached? I'm probably getting this wrong but I think with DMA off
> > bnxt_re_suspend only takes the detach path when FW_FATAL_COND is set.
> >
> 
> I'm copying our RoCE developers Selvin and Kalesh.  I think that if
> you call bnxt_re_suspend() before you disable DMA, nothing special
> needs to be done because the chip is still functioning.  It will go
> through the normal removal process.

I'm probably missing something but I think that the ring frees can only fail
in __bnxt_close_nic, where rtnl and the netdev instance lock are held. DMA has
to be stopped before bnxt_free_mem. bnxt_re_suspend() takes both locks, so it
can't be called.

I think there's two options:

1. Stop DMA as now, but queue a work item to run bnxt_ulp_stop without the
locks. bnxt_re_suspend would need to treat BNXT_STATE_DMA_STOPPED like
FW_FATAL_COND and take the detach path.

or 

2. Call bnxt_ulp_stop() in bnxt_reset() before taking the locks, the way
bnxt_fw_reset() does, and bnxt_ulp_start() after a successful reopen. That
covers the TX timeout reset, which is where all the ring free failves I've
seen come from and it doesn't need any bnxt_re change, but it restarts RoCE on
every TX timeout and it wouldn't cover a case where the user triggers
close/open.

Not sure if I am getting that right; maybe Selvin or Kalesh can comment.

If that is accurate, do you have a preference on how to handle this?
