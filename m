Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012770;
	b=J8StVSqCeudqSW8NCuzFonra3w7Vqr+G197aL4b01B4u/5OpACZE5uUPSq/VY4qfEhiC
	 x9utWv6+ksNPBHSXUAaQQgwC8pT246XwS0X8ZogxyKZFIfXs8n5SVFBDeqXt46xZutXr7
	 Vv4P9QGCy/A5UW2xvh6OmNh7w15PUMYQO0VYRGP5TNwJ+HQsfXM6i6IptuByVWcN812Gy
	 QeB8T5nGn2vF4QBtxobY1kRw705Pt8vrQVo9+WJzZuF9/tL/kEwy1FtOhqKcLGraJjp9z
	 ybv+ZZMOeqknS02HZS97yPa7ANGMS9X2KuH1uMq82kGK1X7YfQVs6X4tKt0x48tpLyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=tTUSlvJBt7PDLOQ/Qfve+QTEq2GZ/zMWuOJTMyxeOhE=;
	b=xTOxk3A920Dh0DVkGAHjnE8oP/1ZwyAX1rlY5mNESu3SD40oC8oWEwBtxdxUjrI+FQny
	 1c/AQws0Zw8MPGilXWtaH63rGYDiGTz/VnxSnRyKQ2YTKGezqlsLsPuIMj3Dir5q8EcYy
	 7a+mJ8Wyy1GNPn64RJqgHT5GdZVtgz5Ph8d39bDTUW5pXsIuEi+l2Y683fFHf1y32NEMf
	 Cx2Ia58k0sZ+P6/+obvFyCuvXB8rXddu6Lm1o08hBhLuyQ6pMHFXybCHjVGW/IZ4WCoqR
	 M3c5b1Je/8pVkLHLEsTy0owiZ/hFKDTnnr2u/id2g4dTll1us1Ku8VDPeGgZ/CKSEcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="h0HS3DX/";
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D258606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D258606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h0HS3DX/
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f20c3aaa5so246623985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012769; x=1793617569; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tTUSlvJBt7PDLOQ/Qfve+QTEq2GZ/zMWuOJTMyxeOhE=;
        b=h0HS3DX/AajEdG8H6zqVr5GOPIWtpAgYkOty4YtE1JUciY+UMFTUJyAw9+cv8fZl0R
         9DdUcy7w9DLvg/C3OSv266oOwaX5VzADbsTw7QMaLPCdFPcKa1Gg9YiRT5LLJQSKMFZP
         KguCMUVMrFs66LBezyTBn6l1yac7pEO263j4ZD6yvV36lsYlYFd4rlxzBnMNu+aN3YMN
         mmL7HITYGnEVmauzhPaCYlj4ud5mg1qwTtiOj9llVNQy9dAX2IRLPgxxP6UqTLrKPTFM
         X/O5g975nCh5irO6R5iusXMahvBxLZyApeJ5D7NtlZkR1TKDBsKIFSUQokfHQadp/rGW
         30eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012769; x=1793617569;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTUSlvJBt7PDLOQ/Qfve+QTEq2GZ/zMWuOJTMyxeOhE=;
        b=yuJxMZmzHM3kC0XaklGyGoMb896ehAPlPNvQYamvzckF5F/Wwkf5pdgmm6JLE8PwI6
         RhdQtN4y3ZRCGBmWY8885+tX2ySMPog0Pm7SrUV/Dz4P6ZYEi6aOrQtlx1wdYFTuz5tr
         8pWp3ahFJVPEPHmngn7N4g7dh8isSOY/ctH79vc+7Gmi2+6HQ2XEHLHmFc6uTSTke0H2
         aIo0vbTt5T5U+GU+b9nxqqj4b3VsrsN1ZvAXjSigH7km9FFtdTAkw4gQRLIsMPCT53WK
         tzfc/oA9ItcBJlSiC5Sd25wQFCMwk8ajiQ9gAkbrBDdPDwJQNMWbURNzJdAge8Ac7xp2
         8EHw==
X-Forwarded-Encrypted: i=1; AKwUvBxHuBlxbg8ls8UOcRNVDvf/rTvz6jVBfnEP/z88UupUQYwlXN10z1fqWgC1cUOMrN4WbrE2GFxqaCyQokk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRTMOC1rZr4E/rTzfli9pqnmxiKiDB4Yz2CEl7K/g7ESDg6RgX
	PDjAee9LRrKxi1PUE5IDROP1YF0eVjCiWYAzMS63BrUrDXfpiQZsRRLn
X-Gm-Gg: AYBFou2E8Ikxeia8S/DwTeM2m9lPksQF000tQx1kCLTlqpe/tzdqSkiZDmRSgGc/cSS
	eMZuLqKE9yNDcvGLFwGDNubDAbZ2YBa0tnV3ekjw2cRT39bHHwHz//JOOCjb1z9Nb6FaLxKb+lS
	LC+xoh3PZugiR7QipYMFBjzsR7LZcQY0QUwtgsW32d42X1Q4yeqSQ/WKU6BTh/ibqYe6h2yRiZE
	v7pwTAo428re+G87/QnlJxk77tiLlHzmsppQfbjXQLlH3AUJxDeqKJLLWmAWhQDo7zItbNlFBeM
	EOCjicGoIXbmnUBnI6DMu3cHABvEPxc8433wZHXV9f65IiqHwSDV2imkvoGabFVBuMiA+e83clO
	Lc2nwb35Y430oEDLB0Dfa4KWf8py51l8Dt/O4auN8dFYpE5OWM80q5g5G9ubCwaNaGf8YYAlsN/
	toT/XXY1fm+Glc/nxZou5banYBWq0V9eiZ20goBbZfOsZb8sDZlVw8Q8W7qBTTJ+NdMo1anP3DO
	5fTprgkywhrRB6usK6qzqp7GOlFlRrBd6xNgnTVA6yRJ2VAOlEqTxwgMYa1
X-Received: by 2002:a05:620a:280d:b0:93e:c12c:f147 with SMTP id af79cd13be357-940ef955f06mr896905585a.81.1793012769242;
        Mon, 26 Oct 2026 04:06:09 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f067f330sm660111485a.24.2026.10.26.04.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:06:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 07:06:07 -0400
Message-Id: <DMEPZAAH894H.2LX47UFLJTCQW@gmail.com>
Cc: "Daniel Zahka" <daniel.zahka@gmail.com>, "Alexander Duyck"
 <alexanderduyck@fb.com>, <kernel-team@meta.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Paolo
 Abeni" <pabeni@redhat.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Jesper Dangaard Brouer"
 <hawk@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Eric Dumazet" <edumazet@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v2 1/4] eth: mpnic: count packets, bytes, and
 drops per ring
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, "Jakub Kicinski"
 <kuba@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261012-mpnic-counters3-v2-0-8afba81c2d5a@gmail.com>
 <20261012-mpnic-counters3-v2-1-8afba81c2d5a@gmail.com>
 <20261016220930.i32JEcqe@linutronix.de>
 <DM8U47F4MNK3.2V54CCQ9YTNBY@gmail.com>
 <20261019215405.OCzrrKYw@linutronix.de>
 <20261019190543.419e70bc@kernel.org>
 <20261020212155.47v0ot4g@linutronix.de>
 <20261020145038.4f7eb295@kernel.org>
 <20261026101117.YTmp0eu2@linutronix.de>
In-Reply-To: <20261026101117.YTmp0eu2@linutronix.de>

On Mon Oct 26, 2026 at 6:11 AM EDT, Sebastian Andrzej Siewior wrote:
> On 2026-10-20 14:50:38 [-0700], Jakub Kicinski wrote:
>> On Tue, 20 Oct 2026 23:21:55 +0200 Sebastian Andrzej Siewior wrote:
>> > > > Is there any other driver doing this?
>> > > > There is ::get_sset_count() and so on for the per-queue stats. =20
>> > >=20
>> > > You may be mixing up queue stats (netlink) with the old ethtool -S
>> > > kitchen sink / garbage dump. =20
>> >=20
>> > The statistics is folded on device-down into a global counter. So on
>> > device-up the statistics is still available. At least that is my
>> > understanding. This means the per-queue stats are lost and global stat=
s
>> > don't match the per queue stats anymore.
>>=20
>> Yes, that's intentional and recommended by the docs for queue stats.
>
> I guess this is Documentation/networking/statistics.rst that I need to
> study.
>
>> > So if this never happens, it might not be needed to preserve this. Tha=
t
>> > force-RCU might not be needed. This does happen on down and I would
>> > assume that the device is no longer processing packets.
>>=20
>> The (old) ndo for stats reading runs under RCU, only.
>> AI will immediately point that out if we remove the sync.
>>=20
>> May I ask why you care? Is there another driver you're trying=20
>> to implement stats in? I'm not sure where you're coming from
>> and therefore what to explain to you.
>
> I tried to be useful and do so some reviews and this stats part is what
> I did not expect to be "expected". I would expect per-queue stats which
> are folded into device stats on query time. Anyway. Let me study what is
> recommended before making noise here again.
> One last thing: If you replace RCU with SRCU then the logic should
> remain the same. On the plus side you would have some domain separation
> and the "synchronize" part will not force/ wait for the global grace
> period but be limited to the local one.
>
> Sebastian

I do appreciate the review. Thanks for the SRCU suggestion. I hadn't
considered that. Optimizing the writer side performance will become more
important when we implement ethtool ringparam/channel reconfiguration.
Another idea we had was to heap allocate the base stats and use
call_rcu() to free instead. I decided against that for now, because I
thought it was more complicated, and the writer side is limted to just
ndo_open/ndo_stop for now.=20
