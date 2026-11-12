Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500363;
	b=wUXb8OM4GIHNwVTqkdCwkC++MwyniE9sbEHtIq6G4lV6i0t9Vv2VvaiT0dsEvvKjn/Fa
	 W+ysv29QHGum2f+zkU6pubwdMvn2+HGUFtO/mO+fXSFo+q6owO7Q/NY5kdAfmx50EHBno
	 LzQI+b7jpKqWOu7QxJuWo4fegq3Tc3alqhD89VpLj22alJ3LabtE1B1Xb6oZSNI83Ij7S
	 k9OjyosmCWcxr3M0Q45+0g4/xeppmfOnsg1WzqpX/sKfZy973uawaD7iMJFXjWwtiglU5
	 Qg+8VRnrUbES6dMcKKQ/8VfQeuoF9P2ctapi0xpBrpdaJsmJPt738poanfgYpXY4+Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=zC4m+uV/YPD15AHdZCPuybHwTTw6+LRxv/oRPoTCzOM=;
	b=Z1bhor3FZETJTHXAtxx9MkLwSN/ktNkmefmhbXSXGSFiyp0Xt/48rLT+xDJmbA89DmfS
	 i6wmTSq3lpOZuEAcPya1sbe4SyJvlpSM4JSHzTI+PQjHsCi9QdmWfbe305Lj8DYOF4rT1
	 LRQISG1O1j8EF0TB7BFXZXOcL1AxCz1n6roCYchzlRhqmZFY2GKBBPEOhOeCrO6gizHYQ
	 MjC+ZHPk3J9lfAXnSxs9bWcJHksSACn6a9W8dv1W09npVvTrq6CZ8sEyrqq6qyi/pbz7n
	 ZP6GqV8erUPg8P/64gFasWRfYil0DUnnf8/TYxkT0Zyvue10qI57pMuov2n1s9F6rgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXymAPkg;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE16606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE16606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXymAPkg
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so6174082c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794500362; x=1795105162; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC4m+uV/YPD15AHdZCPuybHwTTw6+LRxv/oRPoTCzOM=;
        b=SXymAPkg7f5xQgkpMDyHIHCXo5cOdQ03I9FAN9FlFhLNy0ekJnF8d513tLBZNoLRdG
         lOkhqN71obDm+PVplCDpIhvtuNTsYZNq05k3StDBbu+B+ebcrIfTHO98jrN6GZdbuuul
         JKifPpayHcoKLe/ydW9eegm6C8WLJvD0Fi3mdAhvArF/QtS+jNjTEMv1sV6LbWC3b6gl
         aZ+4U8/zSb5AIAWOElaCywg+FdfwBh0x9jF1ypFvXPUSAoBx9TcHO3MZ3ctb+FEPEDcs
         SmV8eJP1quYwVSXusZV3zPc4TbueJ8pDefrrUTqvuU8czLkg1maBUKM0jH+P9VJHO/Pg
         GWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500362; x=1795105162;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zC4m+uV/YPD15AHdZCPuybHwTTw6+LRxv/oRPoTCzOM=;
        b=dxNCHn+ZLHVFYVhkzfkaaQbwNOhshmt7nJJejPJWTQ/GXeJ8F+qhcPxmBlr8Is571R
         WH38J4xCUaEj7YXgpy2m8Qmyroduo6CoY16Bb8xiO68W1xJ3uC9MEnZGMfW6InP8pO69
         epr+KzANc0HNLNnAWPgvafhj6IJeMKJp0NxSLhrrax5Ho32v3gX8jP85WnnTblZvMwGJ
         j11HvHEIOeHWUF6Xi93BBXIqw3wQAP2RyMMwIoWLPHhJOS8oRcg0pOMKs2VxQx2ylZXQ
         4CajEA0t8DXjCp2yBL1LSXs5CLmVFWtmn5KVobgLJ+UXBvyY4YBfCLVkbGCZJpSg+qDY
         M0Cw==
X-Forwarded-Encrypted: i=1; AL+hErGfWvqJxKOop3BU3NWei4rmGNcC5NWYddELq5EQYUTG6CFuFv16Teoinp/OqmlT0lwVaaNLEsAy38Mqqac=@vger.kernel.org
X-Gm-Message-State: APuU4Z81inK5D8CtqrkzTSc+q+5MggdVviSnsg2U99JOO0ZLx/QzAIL8
	10YnlVCMMmAEtPz9qLZ4Vr/jfJJX2SibmA5zww6a8EhtSNJLwGsU6J/mox8cW5noxag=
X-Gm-Gg: AYBFou07UK+mABfuxvkuEAkxHTNkgsz1VBPLkBtWh5114VlDlJpodRVm26qqbwOhg9m
	F9RJFIlTgwEekXwpL59YP7Wgd/bvFpLs3WKOumRLwNa+qu+lXcoXjPTuNAeQOtjPLByqCCKvDOU
	0UvOvQVZJiZTcyOlFrP52zE9SnItDWasvCGHjvn7a8wubY+l7MdAiQGzmIGQNnuFm1wZCV8pk8e
	bE27RBKGJeQApnoF2P7YYboIrb+Fk9HqGsVmV1hblbpw/2SsW0j9FHGmSgJwiP7FYFH9P7ocTfT
	335KBAqE5SBLzUsjT11q2OxUas1WJDGt/zpHQacjK0YEFtuX5ZqAeb3b7r7AnZdQq3WWl6Zcmib
	GrEVp8iDv/8LelWyJwbETA259pk668biFhjWQ8z2eAh8QozgJXKxVSemroY3J6YQ079ayhi2QD/
	BJdfEqa4MIxxSyfDRuuSUkaQdQu9wGywBLSdvAo9Oiwg699Ehas/OgT9eQsje47w5Nu811Vj+o6
	Nr9X+lTu16erVz0q+3rkPIdF9VLlGXatBlfFZQ8uvoXDfwE+5kZUWtWBOoKbNqKo1M77Ea3+tn8
	3z3j2ryRefj8ttLHS//x4+aBiiCzTlLVNn0GVWL2SjTiY3tKm/kYCQ8McRszREByjv0ECc1bBym
	ga+YO
X-Received: by 2002:a05:701b:2802:b0:14c:d84c:7182 with SMTP id a92af1059eb24-1b503104d0fmr31761c88.22.1794500361623;
        Thu, 12 Nov 2026 08:19:21 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm79377c88.8.2026.11.12.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:19:20 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
 Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Subject:
 Re: [PATCH] MIPS: ingenic: Work around stale L2 data after DMA on XBurst II
In-Reply-To: <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
References: <20261111-mips-ingenic-l2-war-v1-1-0d9dec232a7a@gmail.com>
 <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
Date: Thu, 12 Nov 2026 09:19:20 -0700
Message-ID: <179450036033.3574224.1997492818519568890@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

On Thu, Nov 12, 2026 at 11:24 +0100, H. Nikolaus Schaller wrote:
> - LX26 board with X2600 (isn't running stable for unknown reasons and
>                         sometimes damages the µSD contents but your
>                         patch didn't help to solve)

I don't know that the stale L2 data is behind your instability or µSD
problem. A quick way to rule it in or out, independent of the patch,
is to turn the prefetcher off (MSCR.DisPFB2):

  devmem 0x12200060 32 $(( $(devmem 0x12200060) | 2 ))

With it off I saw no stale reads here.

> Maybe the individuals and teams working on the XBurst devices should
> coordinate somehow to avoid double work and potentially incompatible
> fragments?

Agreed. I'll follow up off-list with what I have for the X2600.
What I have working on my board is here, on top of v7.3.3:

  https://github.com/jolting/linux/tree/ad5x-7.3.3-rc1

The patches I send upstream are cherry-picked from it.

I don't have any dev boards. My X2600 is in a Flashforge Adventurer 5X
3D printer, which is quite cheap, and its mainboard is also sold on its
own as a replacement part. A few of the printers make an X2600 test lab
that doubles as a print farm.

Hunter
