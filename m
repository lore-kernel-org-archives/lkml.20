Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711561;
	b=NXxiXN8TAZOc/9rL2Mvhp/8BZLSKp2SA3hM8x/uQOcUEtMA3ElHdw9zaMunFImX8REz0
	 auhb75gOraThbFosAv25+5gHeps8jZxT7Nt0H7WGy6YbhK4h8nbDYpUZoXVlZCnQo6Lvz
	 QZqD9tOXac9gu6Tgh/stW78+VPfZaq9eSL/Q2b3GGta79yxGD/Fsp4vE7V7Bfk1qLgcSe
	 Ftm4WWzTF6ksMNChgPGK0EA6E/jSEv0oYAkP0F/Wp4PbH72X1e5Jf+IzrgpGrOYBbQ2ux
	 UfOe8omKC9hC+YX9dxyyKaYs5KD1Bs+Vp6SF8cQosDFTnQ+MR42LzTsO/Nk8q01TgGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711561;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=couYRd8E8JXWZWDdDnGH4eKgPjAkCu1Qn2pLPm6IYGQ=;
	b=Ye+uu0KKZ0a+xWe2kU7bn3C2DJUgXEt5pAd8ScnBQx1gtFDS3uutKdLecz57I92u2okF
	 VNWPX5+AzvNSsRV+wT0hkw8yMhAprM4ep9yp5vGWW0hUFy+CocFLoP1FNE9dEec/kSttW
	 mkICvYoLu3qvMBUptRO2/7jL0PpLGoamcEd/Phr0ZbAO7P6BnA0LjsxCY9sUXhgWoi+i/
	 b02I1ylwHc/gwLm0k6OSl4KIGdI9uguE2HRLy6Z5fxBrjOzOE/UOM2bAWKsEDxaxyOCHM
	 0w4TxHp4YVzEPqQhQROFubIVf0TGxbepolEyiza05Wn/dF7fhRa7y6s/wD//qlJsseQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=K+1xnp1o;
	arc=none smtp.remote-ip=61.135.153.141
Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E774606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E774606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=K+1xnp1o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792711551;
	bh=couYRd8E8JXWZWDdDnGH4eKgPjAkCu1Qn2pLPm6IYGQ=;
	h=From:Subject:Date:Message-ID;
	b=K+1xnp1oMH6P0zzaRUGmklaUEzyEoN0fMPbkDDtlWtRx3H5SN3LIAvxo8W2Plfude
	 QONwYb2RZ9npEiuaPhMEL3PmeiZWj5wgztYTI1C8+ebIL1zG50LXMefv+YAC/IcRHc
	 s3rp85KvGrULtVUeSwvztWyaC2PBW+pLa3ASo1lA=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.244.129.212])
	by sina.com (10.54.253.31) with ESMTP
	id 6ADA9B79000039F9; Thu, 23 Oct 2026 07:25:48 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2334166815986
X-SMAIL-UIID: F945EA0D6C1C4AE692DD24BD6881420C-20261023-072548-1
From: Hillf Danton <hdanton@sina.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brian Geffon <bgeffon@google.com>,
	Barry Song <21cnbao@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Date: Fri, 23 Oct 2026 07:25:37 +0800
Message-ID: <20261022232538.978-1-hdanton@sina.com>
In-Reply-To: <atlt8YGuSxgRb5uE@google.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 11:06:53 +0900 Sergey Senozhatsky wrote:
> On (26/10/22 08:08), Hillf Danton wrote:
> [..]
> > >>> Given lock like mutex, priority inversion happens from Monday to Friday,
> > >>> but I wonder if you are inventing some wheels in 2026 if proxy excution
> > >>> works for you.
> > >>
> > >> Reader-Writer split is a foundation for further improvements (like
> > >> singleton recompression stream and so on).
> > >>
> > > But that split is not needed at all if PE works, yes?
> > >
> > 
> > When the number of locks and tasks grows, I have increasing difficulty even
> > describing the lock chain that you in combination with Brian are unable to
> > handle. That is why in general PE is prefered over whatever wheels you can create.
> 
> Hillf, if we reinvent the wheel then I'm very happy with this reinvention.
> But we don't.
> 
> There is not a single reason for compression and decompression to be in
> the same context - they don't share a single byte.  And there is no
> reason whatsoever to serialize them against each other.  Compression and
> decompression should have been separate contexts from the beginning.
> While serializing decompression with a PE/PI-enabled mutex is cool, not
> having decompression serialization at all is way cooler.  In addition,

I see compression and decompression are decoupled at the mutex level, but given
the "same CPU" in your log message, nothing changes at the CPU level, reguarding
the micro seconds to complete the two critical sections. So the decouple sounds
like the half baked croissant, HBC, the Eric Dumazet dude sometimes is happy
to deliver to lore.
