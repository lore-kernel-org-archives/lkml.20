Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B0740B6EF
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339124; cv=none; b=Jtt8wJ3LKy7h5JABxqF1MtCnR/EfYHTJ2qVd4LMxWxvCarpNFJPYLMXtvVFJYkejSUUQ1UG74EL5hiALwIYUUnb+/rNWXkHza9De5nVjulpcyTRkRB+0XilvuvIjQe9/MY487i7pXTHi48F7Tdw3/77W43RxT8S4c/nhxg8Cqas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339124; c=relaxed/simple;
	bh=EdEhFEPlwUGH1Vq3Tshjsv+2eIevlycJTorg33rgApg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TBGLmG2S9x1R4gg7rG4YiMw+03pmZK4rDZMalMJ2YyiCQlszdeV+fakQniO/E08w7hgaVk5Q1H10rzlCjBPYBGB78SacSSVl95qdiw4xfTiSpts31g9yKfa3OJuxeIQAIrLLbQTJgjMEl5NzarEQak9cyyp59iMWioNn1txhj2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuajgUgk; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuajgUgk"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8659af7454eso10198287b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339119; x=1789943919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=84pp0ue0PzfDSGHWGkhqOFoNG0QZlDQE6znxPwIQxOE=;
        b=nuajgUgkDJJFteLcH8RfxTVmYSGgOIX3rTJ1u8gp+ijCE0/1Zw4YjEvgvPj3IzmDWt
         o/OPBX+uLIMJmFMWVonAEGkPnN2HIdXffxhU8zVu2j75pCBty7Z5IjhsUpPiavhjdyIQ
         nxsavrXq1QE8cn5iCUZlHxuAD8f/qKgZMQ4Bp8e3L2kR4iu8yfOfFT7/AEcNgfSCS5zG
         TdX9I5cnoxYADFJw+4QmlDqxzwLWld3AVWuMGlOnPgkTHAxAAIMmCjVeZ/bF4PcQ8Lmd
         F2EubbiifxG6AcC2AmynSZ7PR08xzf1XiJOnw5f9+E93ycH2IxnLQWZwGvOGECiCsRWO
         r6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339119; x=1789943919;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84pp0ue0PzfDSGHWGkhqOFoNG0QZlDQE6znxPwIQxOE=;
        b=nglFw2pnRluM84LtKotgg2vFupRQEJqqm+TPwe8tSJibEV9cbXXFKXyOzpIUBfMiFg
         zXmSRcLUrgFHIYDo/67jJzXZkBf1OHvYf6eG7Kx6ZQvO6PZMOJG4zVCOdV8n6v76deLr
         YtCh+ECew0Qm4O2QT0r+xcTSGIIF5MJ2gTbVdKHUftHEJvEHK8VElQrc8e0HTkKfWJgb
         DYGOdGF9Q2l5p8nAOUCslNc3BSsFXF/NKaLfpLZngi65rjF2W/kgRBlGhAW9+hOrLBhW
         OwPZu9aiHJlsAxNt3WYGHFiw+Qpa/IUv5KdKB6ELJzOq9GdzWaSkF8L/BTmtO346ngOd
         +3/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7JXvxMT0ocIDXsYb0Pm/0D5Y6xxRhALEvAvuEvQw06PmoBVELpdC6pNCNhMcR7DMntK5ALwElOrDjqPU=@vger.kernel.org
X-Gm-Message-State: AFuF++nt1bMshAEfXwEPhWBbzvVFDrQjB/a/pmp8vIl5KxWxtvHSr/vq
	D7vUlRgZmTGO9sx22vwXLOwhRfDeSI8dLuZs6FyBB175tj9YAMcqNVJe
X-Gm-Gg: AYBFou1c6p9spP4ZqXyNPXl7ehyEmHtkvyJ3QCXJha2pi92HuMKvxQ3Uoxyg2ON6+Ea
	Dmq0se+dvDQH/+6GtKwtyngfLcWv7PkpLZZ/3ggJrr0plUihptwZ3iU76ycuLBL7Y59UESC00k1
	UPc5q/MRPbU5hh4B41fYKY84GMvk8/Dtr2nwr1laOhbrXBY2v26JBKOWBh8D9I1epb6TutJE0po
	wKHKUrfEs2cRESKwMTqNwvDQWq1F9mVZbCU57kjs57Ya3yqvnsWwhL/Es1KYwlBHOkcE1o10uVF
	5HeClVMJ7XzEGemdriTG5mwefylRrA+MOictmXy/WtkRC9PmwtuT2ZnkKM9LeJljXkFHjHyN2Gf
	PU8DHU97cCRFs2wga8r4m+llHXfNxpOHSTFpCCKAcVNG1GbN2bHP8SkeWVAuue1o5fx/FlN9c5C
	3poO+kHXkKWJf6NSg3MzGnwt5eHESzSieoWW0bcfc9SCIgNCsOp/ur7OJ7Q9s8Hx2obvsSNHlac
	Weq18NdTYXRLGEXVBrmUZAp4CIeL0ka5cqcYF6VWRtHpFWEF6HE
X-Received: by 2002:a05:690c:4ab0:b0:873:5c0f:28f with SMTP id 00721157ae682-88d23c93dccmr162367b3.57.1789339118763;
        Sun, 13 Sep 2026 15:38:38 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884878de7b7sm31470857b3.29.2026.09.13.15.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:38:38 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:38:37 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Mark Amirkan via B4 Relay <devnull+markdamirkan.gmail.com@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 netdev@vger.kernel.org
Cc: Paolo Abeni <pabeni@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 linux-kernel@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, 
 Jon Rosen <jrosen@cisco.com>, 
 Simon Horman <horms@kernel.org>, 
 Eric Dumazet <edumazet@google.com>
Message-ID: <willemdebruijn.kernel.34fbab8b5c5af@gmail.com>
In-Reply-To: <20260913-b4-send-packet-vnet-v1-1-5545ffb528ae@gmail.com>
References: <20260913-b4-send-packet-vnet-v1-1-5545ffb528ae@gmail.com>
Subject: Re: [PATCH net] net/packet: clear RX owner on VNET header error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Mark Amirkan via B4 Relay wrote:
> From: Mark Amirkan <markdamirkan@gmail.com>
> 
> Commit 61fad6816fc1 ("net/packet: tpacket_rcv: avoid a producer race
> condition") added rx_owner_map and made tpacket_rcv() claim a V1 or V2
> ring slot before converting the virtio-net header.  If the conversion
> fails, the drop path leaves the slot claimed.
> 
> With a one-frame TPACKET_V2 ring, an unsupported UDP GSO packet leaves
> the only slot unavailable, so the ring also drops the next valid packet.
> 
> Clear the ownership bit on this error path.  TPACKET_V3 already clears
> its block state here.
> 
> Fixes: 61fad6816fc1 ("net/packet: tpacket_rcv: avoid a producer race condition")
> Cc: stable@vger.kernel.org
> Assisted-by: Symbolic
> Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
