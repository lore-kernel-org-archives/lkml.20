Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101756;
	b=tYk3vFHRKl2L9u/0TdkOruWUS+5r68f/1Ur7nWNOIbTODkREd+jfGPf2b8eFngn8RiC/
	 +iBlNfgeaTMf15Akwa8engMYCU9vjj1LgvXu+qAUpxUERkUwJsXDjv7lLcmOUt/FpiOxI
	 atg7yQRlyFakZQDsVah15JRbK9qZkiX1WWumem/GKtW6C6oorexCR4bJdE5UVT8mY60Ih
	 ttULc/23I/NKDmc8cBUB8qcJsyWOHmj7CqzI1SHE9ALAQo7MkVnCC2knqbixhEtRIHO7v
	 cUXWPLcLvUCeU6k0Sv7eA1Lz2czSLSvHpkDauYsGdUk0C6+12ArF5fPnt54TkMTwpUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gp1dlJYmM8w8ntmi7bQBqlanLKPIa5O7ZBIuoOP2eTo=;
	b=v3d3NdRry9Ln1QKhNjUDlakjrM//CinPqw4BdR/BnWsjR3zDSsXD1hqs2ZXypwnODbsW
	 ztHWthpNu6T9uWsoIrXre7SAq5gd4YW7qtNMC1r91o8hPQen+u2sLBL+D9cwXjvrHPLAS
	 z1+1PzQohAM0cNE3gdFyTH5AHIes8Vm7cicFOc39pUmaELoJ/kfy3yJKKH1cvCtqImhka
	 7xQgjSY1IS8mIxJquZTk3+GgV5To+oXszqsArzSn6aa1xrMUfnYa26bhQWuGTqbT30P9r
	 KiHcR+GpfpQO7PNVtXAZvdDFj/KzPDEAlHSjTObxqfjltLYb0mx7w1vB1rC33goMEfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPKx7euy;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CAA606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28CAA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPKx7euy
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso616645e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794101754; x=1794706554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gp1dlJYmM8w8ntmi7bQBqlanLKPIa5O7ZBIuoOP2eTo=;
        b=LPKx7euykCc6fTmtO5pRIlQXGah7shoNbqdlnxNCJxyMKwTVSHYyg8Sf1ZEjPHW8vw
         PVVUK7e96QGKdUmMifjk+4oTHEcAnnj1OvCxM1wyHGfXBLNKZFOlpFWNxQbDPQoQYOqk
         MSWTlnNYM325/0NwLgUjhJoPaAzBUeVczhO0Puz5mq38WEvUgvy1Nwv12ditwAuDEgtQ
         JxewrpdwQOeebFoWjKSyn6DtVp2jWlC4YmrcgZG23vdKL7bDTPPS5xWyS0JNFRGgcrwm
         9g5RvnYCofGfkgSVnF5GVnJ6wCQSNDmyRRxYCQ0essSOMX5oRn3Pte9+lT3kRKE0BLMA
         hJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794101754; x=1794706554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gp1dlJYmM8w8ntmi7bQBqlanLKPIa5O7ZBIuoOP2eTo=;
        b=asec8cXGNjLVEbXMiFenbdQS7gMbGanl8YgzR8nZUWX/oRbU4LAJ+OA6P4VMgWbYgV
         DuDqmTAtE2i9VhbENSh4ErdtfzbKAgz7xDDLqvwjuxo8f853aRSA0nuTeCv0PKjOpfQQ
         VtOMODD2f8vxZNVWaR/j6MzUnLJIexJNXmiIZ8t+2QWFaSnvYccz5ZCAzmq9vJdlje9C
         KivDz9iko0MrfT+zXMZWTmeO6h5YyNBD8E0q/VgUA2lOGt0ngDVNdBiL9r8Aq3Vpg0pO
         aVok+7gF+Qk5ajLc7yZm26Dr5yc0IilTCXz9K8JA+qYrCqK/0jDxUCvdy/UiZlPz0QLd
         iRMA==
X-Forwarded-Encrypted: i=1; AKwUvBx1BqHok8UWadyp8DQCPiGlFTOUbMCkFcwnMNngYcSpa2oclHmPwC0PZN0maCSNA3rOdcNK4weTYsT3HYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ybZC4DNxE19QYy4HVIEpsfCrffuFMyvTeRkI7pyORfdCleCBM
	KsmA0CSQFSFT9TsLkOAsEf9bBgxB56x/sihyD6xiRUN6/sKROpi5TNmQSGK3fXiyi1Y=
X-Gm-Gg: AYBFou07A1flKRMMrqO4OR8hORcswBtHOnBcM6s4EdX28HCtzvUAOul09nJxdHFlIu0
	N9pALGt3lRiV2i0sSelNaR5Hdqh0USHDnRpHdA0HvtQ7zR1T15o4EZvy0Mt4drO6df2ccLyjxmM
	+ar57csD5lPlFEnCeEPvOMtlEAcOQDwnO4oT/YF1ISehsd2Eg5gAxESAQUzCtWopJN4YdPxZi0b
	i/zv3Dpi7FvegoEvJKYdfrdS4LVzJ4sELM4pjKJwLZ0s/lenw6jtWJIM8noGxfdccfKVAtJYpn2
	80IwjL5MIzK6MHM9xw+PlE3p3KjYpr2UzDaRzffh0OOIz3Z2iyC6OZ/jv4y453VWuoOx7jQHVVL
	aWargtn/5ZCnlW7226VA+suTivAVkqu6pFpeEKbcvofom2BvY/Sct0h+W4AY7+llbl2idqpDuBf
	HrVM6LeA88FtfLyXqu5Ro9XzQxlcU9vSZIanXR9nnU2J+4c+tW+kORHtrB3myKBa0M85GLM0dYh
	wn1qhcD/h1VCAimqbxiLTZjF9lvFBFIvhqgY6okTS4HpRS2SVGY8zfpvHMQPfH8snfgTr7AmqvR
	73x5/C0P8A97L+heuCJXEIi+jzwZGMRz0pyVDBobpOdsNXPDdOrR3mgVjmIHiEKTimYIj60YxQO
	oZOwgB7PIWj4O8TqaYS6xP11SZmSa0La8qkOkCW/l7tFzk6qym90+2QE5UxyHpythTexaQ0qsgZ
	R/BiyV/525p8HtJh4XheN9tQdcF/SnhWH38ePPWi8b7wEmGiSpZnM=
X-Received: by 2002:a05:600c:5397:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4b963c8715fmr5551595e9.35.1794101754249;
        Sat, 07 Nov 2026 17:35:54 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb134ccsm103722785e9.10.2026.11.07.17.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 17:35:52 -0800 (PST)
Date: Sun, 8 Nov 2026 02:35:49 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sparc/iommu: Use raw_cpu_read() for iommu_hash_common in
 iommu_tbl_range_alloc()
Message-ID: <au_RHuVI6noT1W0X@gmail.com>
References: <20261107195147.70084-1-kmehltretter@gmail.com>
 <155ec5c6c5f6d4287a420191cb3927eba1d97526.camel@physik.fu-berlin.de>
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
In-Reply-To: <155ec5c6c5f6d4287a420191cb3927eba1d97526.camel@physik.fu-berlin.de>

On Sat, Nov 07, 2026 at 10:13:51PM +0100, John Paul Adrian Glaubitz wrote:
> On Sat, 2026-11-07 at 20:51 +0100, Karl Mehltretter wrote:
> > Fixes: ff7d37a50202 ("Break up monolithic iommu table/lock into finer graularity pools and lock")
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > ---
> > Assisted by an LLM.
> > 
> > Tested on v7.4-rc1 (d48723711bae) under QEMU sparc64 (sun4u, -smp 2)
> > with PREEMPT and DEBUG_PREEMPT. Without this patch, two consecutive
> > boots emit three "BUG: using __this_cpu_read() in preemptible
> > [00000000] code: swapper/0/1" diagnostics in iommu_tbl_range_alloc().
> > With this patch, two consecutive boots complete without the
> > __this_cpu_read() preemption diagnostic.
> 
> According to your Fixes tag, this bug was introduced in 2015. However,
> I have to admit I have never seen this message, neither on sun4u nor
> on sun4v machines.
> 
> Is there a reliable way to reproduce this bug?
> 

Hi Adrian,

Yes. It needs PREEMPT=y and DEBUG_PREEMPT=y. Debian's sparc64 kernel
uses PREEMPT_VOLUNTARY, so a kernel built from that config cannot
print it.

sparc64_defconfig with PREEMPT, DEBUG_PREEMPT and lockdep, booted with

  qemu-system-sparc64 -M sun4u -m 512 -nographic -no-reboot \
      -kernel arch/sparc/boot/image \
      -append "console=ttyS0 loglevel=7 panic=-1"

prints three reports on every boot, from the pata_cmd64x and sunhme
probes.

Danish Khateeb saw the same reports:
https://lore.kernel.org/r/20260923144909.414968-1-danishkhateeb03@gmail.com/

It is only a warning. The per-CPU value only picks the first pool to
try, and each pool has its own lock.

Thanks,
Karl
