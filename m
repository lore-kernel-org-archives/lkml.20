Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661690;
	b=Q/Lf4fdFh86NWAMY44v224qh3IKi7AcEyUQo+3ma/SXtyP8LcuDqTqG6FpbnpZTD+Qt+
	 I73wyO33+q3FQd6OuJXOTdMx4N+43cylv9zDOOxyjjDNKgqwOUFTsFiMKOv4rIM++ltW9
	 9C46JakE+f6s1Mqo+Plu3yyGIOjDstvzGjJXwfzkwbDehW3bISnu+8f6QnQeUgWMMgqMq
	 RKwBglGwsTYYcGhEvHz7l1LDbHWkxcOuRDep+RdafDBqEJElDjUWAz+EvcIhbjBH99vBp
	 NL/zwmCPsUOBqNQMf4cHdNnA7ZzS9S7RWMTK96f6G+kpiMkkaNKgDrB6hGNvqYs94ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pVN1mqrOhYalxYFr7VReSIpfsAYguArpSUX3xTADh9w=;
	b=DR+QQZ9R5MgTKnQX7bvpZCaAvyS3xVYgbPK1kPHKYwgQUqJqgWNJfzHpwnMwxbIO+PIl
	 6bN25HzC7SUbQIHeSqEZMWUn30vvKmDvfihMg8yhZeFkPy0DcrnCPt/U7uRZFqpxIfjcf
	 CZIHIXDRKG3jdrNonvndLxwhbMiQ8hUbOLG2rqXVEVj0Cl+zNNOT3k6GxA5cTYCFC+JSm
	 vUFb0QYgnIXjeiIK9q+4Pxq5lKkJtS1l/AhTJMAcmyQtp3ACXSRf2Xs860hCpz7MU96W6
	 S0RCeZ9jySOxDYMSZ1HJfqrkb2LU+3Zr+05yopGYZLHKMCPFbMAsxA1et4GBqOQQkuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QOuNwM+u;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7128E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7128E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QOuNwM+u
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1046616f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661688; x=1793266488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pVN1mqrOhYalxYFr7VReSIpfsAYguArpSUX3xTADh9w=;
        b=QOuNwM+ut/XXfjXB039CTGSCzy8xsloaZdU5WvFi47yBZN9UVjzOndqXFgzO7mDjp5
         mkutKz5IeyUOk3yIX3FqigGFlDAW6BuAque+RcAG0Fyrqhu2KjuybfY0iLX2peTAqiPZ
         4rPEkh0A78fmZ1DkUT9wSb6gklNxpI6WiCIByQVRI7Gp9UG443Inw24cO7jHgVlQbFe7
         NRjqhAXVpHoIjq0U+UpLmUlk0LLBDAdzkrfo1m96BT0jXmhH1fj7+hwmlKcgFVQunGnE
         woL0qJRQibe9q87rMmdOiUojPzGBKF1qZy8PZl5WDQoZNzsbOk4/QZEQO7b1a+Aoxgb0
         hxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661688; x=1793266488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVN1mqrOhYalxYFr7VReSIpfsAYguArpSUX3xTADh9w=;
        b=vAm8r1ekNODxdVGWHc6nrW21vRjjCtbVEiI3O4SpGBPNktheygNYgbeX+96FWL5GZh
         X0D9Kybq7OJ9S9qO0KyvcEJa34c9aYMUEhTdSWye7MoXvXaRhik48oIAcY8m+M1XLWIA
         Ht+oWmCKwv/+uj5pvm7O15QN3VaVpcAeterMfqDU7xGDIRSFVynYESZYZ43hefRwBgbm
         MSRo92g7/BA3EMOv37bDMaP6ZiFxq96dileujA0TTuVp8QZ9LQ8pHnhOv4D7exzyfPys
         2jleorHi2MLUHtZU6/8RpHU+hhXlJMIDslYO4tAPxcP0TX/7dmmKtji3SujQbNwXxoj5
         e+OA==
X-Forwarded-Encrypted: i=1; AKwUvBw+sKZ+WKbS93DjynYT53BVt8pSsNODyLE7itOeN15CfjKQvXznFvYIONMePpSX8lekYQwiabqdAEeyd50=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlcmgA0ryn00VDkHrhgodlHCh1r49uan+p5KW+MbjInaZmp9I0
	akR1pwwWRZfjC3yOVCYtA63iBJHBzRiYREVIfQduyPFPIQRK84pqIyfa
X-Gm-Gg: AYBFou1hVRElzBdvcKR3Hr4kqyhANaQ+EUyFJd+Okg1fd7pTqNBK+qk03ZQgFU7uXvc
	TURa6d6DoUB+g6VNp7Qk+TE1FxaFFTn2C0YThsGIE0PjwhAo4VvZZWfZnjevbMH4bQuqTVSD5PO
	fFR9G79b8c4qgKO8tfj4OIWhbfD8b6JbNRbkhtQCWQmehmqXJjRtJHgdDJj1PwX4uWRe3aF0hLS
	WMkJS01GbMGhAx18E9Q9tO774d1maehy/eK77u25PuXub7xzdZPag/7lmBWqdtdnTJTd9sdlEwH
	6zZVqp2sNyuhTPjeHAfaWLeR0WB4Ya3MJj7Ri3Y+eM9e6XwuN2B+GNxjxOCsqAIP2XE3fIVo+7f
	TFL4VGQb/D4qDyRTlgMUTELnSPAICXktScCE7jb29Tqjm1j4YsiE1V2jF+HujhEo2Jn25nQ5Lp6
	KH4koVpGhbw4ySOncv5ymAj/y3uW+aMeBfpHRxCyTRQd47sONgrhNFAG6b8FtJ7k+D3IosWphBD
	Ol7j+0oDQbfz5Sc1+bPrsqgy+gj4Ba1bivL4Njx7RTtf0dWlTenq/I1fHYlVVPDikLODJhjvIgC
	46AUT/ei+r/KdoH0
X-Received: by 2002:a05:6000:4806:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e264e2f10mr9528690f8f.51.1792661687521;
        Thu, 22 Oct 2026 02:34:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e72sm10420288f8f.26.2026.10.22.02.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:34:46 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:34:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: dma: run threaded NAPI kthreads with
 SCHED_FIFO low priority
Message-ID: <20261022103445.34cede9d@pumpkin>
In-Reply-To: <179259275334.35963.15413466304986880275@gmail.com>
References: <20261020-b4-mt76-napi-fifo-v1-1-ac8a24e2062a@gmail.com>
	<179259275334.35963.15413466304986880275@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 17:25:53 +0300
Fil Dunsky <filipp.dunsky@gmail.com> wrote:

> Adding netdev to Cc, as suggested on the GitHub mirror of this patch [1],
> since it touches the scheduling policy of threaded NAPI kthreads.

I had to fix the same thing for other NAPI threads when doing some
tests that were receiving 'silly numbers' of RTP (aka very short UDP)
packets.

There is a similar problem with the softint threads.
Softint callbacks drop form being the very highest priority items
to things that really won't be run in a timely manner.

David

> 
> For context on why this is done in the driver rather than left to the
> admin (chrt / sysfs): mt76 already does exactly this for its other
> rx/status and tx workers (sched_set_fifo_low() for the usb and sdio
> workers and for the tx worker), so the dma napi kthreads were the only
> mt76 rx path left at SCHED_OTHER. A userspace chrt also has to race
> the creation of the napi threads at boot and module reload.
> 
> Numbers from the setup in the commit message (MT7621 + MT7612E as 5 GHz
> client, 3 runs x 5 min each, ~200-280 Mbit/s rx with userspace load):
> 
>   stock:                  ~500 full-ring events / 5 min, watchdog
>                           resets and MCU timeouts, occasional hard hang
>   this patch:             0 resets in 3 runs, rx 276-288 Mbit/s
>   stock + chrt -f 1:      0 resets in 3 runs, rx 249-273 Mbit/s
>   napi_threaded=0:        0 resets
>   rx ring 1024 (stock):   800-1300 full-ring events / run, more resets
> 
> A similar restart pattern is reported on single-core MT7620 at much
> lower rates [2], which fits CPU contention rather than throughput as the
> trigger.
> 
> [1] https://github.com/openwrt/mt76/pull/1164
> [2] https://github.com/openwrt/mt76/issues/457
> 
> Thanks,
> Fil
> 
> 

