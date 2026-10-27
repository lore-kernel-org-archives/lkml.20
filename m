Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069504;
	b=GHYO6CW3nau35Yg/4Sj9spQs1K+kbBPCUFq6cpmBRWL725gghM9LaOKb+O7Tplx1f1Yi
	 wA/yqRw58cRhaVBNwRrJQ6ZuIUl+bB2fxoyqjulY2wpLD+2fJ4/NOHElyoZq6zJeT41OP
	 t9W4znMY6bVd7KlCkEna7P4fLcaHsSxcx0HDtL4kI1s61V3FUPXZWSkb6/0G2AcGt3tY5
	 vWa6vxOtwPNG1KT8faz3ZuRFtLhBUpWEmQQD+87KQeIWFCU0I6PxboSdYIPYnoZ0+PJK5
	 aZI5HDf/jyGc1q0gB+7hs+vBSkNqkz+T/75LuIwX9+iOJl2lfzUSgu4rO3p9/aq2scw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References;
	bh=QpmasV/u6brzL15r4wNT1nuKhFWCE8ME2HsJ6/xHFKY=;
	b=QJOr1n+mUEg8uRz7upcEUYYruq0O98X6xIQIQQU6os4CLWeHEVxwoiRK/fQYJH+xULWA
	 ZXtXTfXUbqodrMiPPufhrCrKpxVvCZp0QMkXocLDvO8RBrs+Y3I9vFC9NQ6pVEBwg82RA
	 My4NoDBII9EJwuSn4k4Uy3rL3ez3OgDBeqUuVya3f2mikYq4CVSPzdE6qg3qh0n6VMiTz
	 rFHRTqLJDTrN3ZfJ46KFXAvINeFXBFcyHZmscq+Mh8+8TEi5/ZHIWN1It8wJff97vDnFG
	 nUidFIlE1EnlmcHk5ttOVWvMu346m3LCZqGrwomlAc+kbRvSlk3G6cmK/yhRr/gn11Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V5IeXtGD;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEF7606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEF7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V5IeXtGD
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so5309535ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069503; x=1793674303; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QpmasV/u6brzL15r4wNT1nuKhFWCE8ME2HsJ6/xHFKY=;
        b=V5IeXtGDuRPEdgnnTuwKO+makwAV74Tyt/skZ63OfmEdmAHC6FhdBpdhJDUjIoGTzF
         RHRSk2ZEXdjPAPTJ6vQYylFD3fjZwQYyLort8JrEGrQdYz87uGtROlieAzucaiVBQkUG
         zVCzOo1m97X3BcaYZo7mxWmPwBeFWfp00Z24WsghVoPtcsRXBwFgsNiEcHAKrI64Y4AZ
         g3+qaVX0AVvRJgrC7+izxFhroUrCcgxYl+lT5oxWhbavE4lkZwN9zmvhy/EA+CRPuSD4
         AqLNS8YmondpUvmZY9jRW6aPwxSq2apkh+pHcjYttpSvPs9aRR0FJq/OqXIiDp1WHl6d
         O6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069503; x=1793674303;
        h=references:in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpmasV/u6brzL15r4wNT1nuKhFWCE8ME2HsJ6/xHFKY=;
        b=w7kTpkBM4loKgKSCf7KB9f2B6bSCmgb4Qyh3Tf3bOy0obfSwMOlaXvofbI55//Jicx
         On51OnYkMWHRDHByrw6NqczgEsC/XFgdygockcfGsiof5gklq9fMyPwf1cXUyTg+wlbO
         cQ3w27F2gbxMPOUdF0DKG+jyXCEHMMJf7o4It1PmFKDzf2dMaBiFLoi55QYLaoaShItz
         xehL+rPpv7wWZVlEx/l68jPhvQMniodWOBJhZ/SDlr/GoLc8BJ1cfJyAdGWBEviINHo4
         9gCAOkntWb+FTPiEFsGR79ZJwprE/D/nT39u4Qd43hXh2IfMGv6Cp19/N09Wk7gehAIE
         OhTA==
X-Forwarded-Encrypted: i=1; AKwUvBzWRAyUSr5m/zIF6RDHEXo04MVCOg8CWKwLS29NVquMPIR0MSISIieYhIrdvCh2czunzpctIyXuRn47Xac=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU0RYbMGa1rzGKJJK5vXNQTeyDIxBoun6pkFAiI5zJiCCbipZ/
	L4Zv6NfRu348j4SzDuKszIVayPcbv4zkEj9dI1/Mmlh0CgL48WCE6pmi
X-Gm-Gg: AYBFou2R6mA03I6r/6/46l9OoBqhMsj/mBhED/6C/pNzQqUOCoxbChcjoLfVcv69Yea
	DW+krOFoClN8rlhgxww3vNY9mv0btBM9ONT5xUIUFVy0aF8VkCKu8wnXoHwuDRlgZ2HI9guLRaP
	eNuO2l2lOTLaMGJ8hkhEnks01ZPyGkZgmMq92xjArS13S+SLBwZfQzeCbSa/WFVxEbg6tpvyJEL
	k/3EnQAp8KzUQrSXiM6VYKm503DRNQe3qNsQOLFadj7FYIaTQnlYxV5vi8kXmZf7fB4GCN26pBf
	B8YPrBdl6R7/wEjzvx3ag7LSPTcxm7Row50/GcRQoWoXARCbB16XFAHv6nMr4llr/+Dd6ccBNlm
	uorw88+bCJAAQVO/DY5/W8jsbFqZKp15aatCFHQsvrPIQoE4+WBBfqDHJ+vE1tD5UeL1bg3Jv2D
	cmE69FX1MF+nZsiUAo70DJR7hfrPnmLwFYcIXFEIAECEIo5jqZaSXVsxTe5H3O8LsudwejPnogk
	YW7tUKIUYaUglh8PixeoO0xGTqE+5JDAQNeg5KJfgzCXtp7dbWqCjaFHJrQIPJKXf0RpPP6KNib
	eDDmCenU5gezYc3+2lST+g==
X-Received: by 2002:a17:90b:52cd:b0:3ac:9e76:aa96 with SMTP id 98e67ed59e1d1-3adead00d90mr10912437a91.3.1793069502924;
        Mon, 26 Oct 2026 19:51:42 -0700 (PDT)
Received: from msg ([188.253.120.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406506c2sm1504764a91.14.2026.10.26.19.51.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 19:51:42 -0700 (PDT)
Message-ID: <1793069492.20092.6a150514dd@gmail.com>
Date: Tue, 27 Oct 2026 02:51:32 +0000
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
    Christian Hopps <chopps@labn.net>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 0/3] xfrm: fix vti tunnel device use-after-free across async crypto resumption
In-Reply-To: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
References: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The findings are addressed in v7; the series changed as follows.

[High, 1/3] You are right that the decaps success exit still used
skb->dev after the reference held across the async resumption was
dropped.  v7 moves that drop below gro_cells_receive() too, so both
exits now use skb->dev before the reference is released.

[Low, 3/3] Right, the queued-skb drop also fixes a pre-existing IPTFS
leak: the parse loop can jump to the drop label before the queued skbs
are delivered.  v7 adds Fixes: 6c82d24336718 for it and mentions it in
the description.

[Medium, 3/3] The reference is held only while the outer skb exists.  For
a parked skb that is at most one drop_time (1 s by default); the drop
timer then flushes the skb and the reference is released.  The unbounded
case is the pre-existing drop-timer re-arm behaviour of the
reorder/reassembly code, which this series does not change.

pw-bot: cr

