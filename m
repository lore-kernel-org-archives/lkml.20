Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792521723;
	b=jSl247doAjq9QjFvr7ug9QA/wOaWyd0PboREUcuo3biBlIw5JGoOrKiOlWDwRNfo+uvq
	 wOO6zHRVE9k2f79wTh28laybjNryaaHXMB7n/aF9NxORKb/0KB2BUF8OaamOlLY0rxTQe
	 YKLAsbqWoO1uZJuVy4EbVOrMQt9XK0jIxQjdQee67sKlTLiCaGpbfo5aMd3oGLmIWdI/7
	 LinwuiuXrp+XmEUq31TJEqr/IdWgwupa9SwkEs90c4LgIA6UYLDqXRp/pDMSbZG2tWnKY
	 DeMEO1veWCxxoBkM/qV9RqAFl4SUyRUvMREsZavV57vz4knZuhVU/px/FJFl6rDsmKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YwvR0hqKgY0QppCDRqvS4E1+yFhDfD+NCtMbvNXlcGU=;
	b=CyhZVdrrf+hV7HgLhg5dC5N1jv0viocEqSWlGEk1Bq8d1lMNTCls+s35F1/IYjI8peIc
	 MUdgeohZN0rXa/hb1VwfsrtoAT6Y8LbUv9aB/atSJx0TxbLggBmwwQFRVD0gaVYRuHwjG
	 +5KHVFGWPio5HzaMIF5OPORb9OvRd1+Mumr5d6WmuVjdfgbwFsAiU6onTlph+ln3OwUUC
	 zSTCJLnfdR4ssTy2OEK4jh/2JxpqGUj3AJd4BDv9jAbvXBAlsFw0kcMxs+u5jDxUGB969
	 NzrnVTZfKDdoDKyigB8drbaMtxdXUfn6wnR7p28G9ZFy1Tp+AxBLB8j5o+ZSm6xSlgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=a0keEYEI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE33606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE33606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=a0keEYEI
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36681e85e87so1391656eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792521721; cv=none;
        d=google.com; s=arc-20260327;
        b=l+FT11CxAyEc/lxFH7aH7fYFpxKpeiQ6BAfk1z3WG0Ptogwh4ZpwCZ5gdZYdmzlPrZ
         FPI7ifbXErr6rRVSMCvOzhlIxwcM7XbNMg94rbUykVpXufCXz91gKW4n9EjTZWLuXQw4
         z9yWjxW0gknihTLXtenk1VF2XtCWlbPATF1FCLceBuusmfaTwsgJ/QCYbTroettZ5Ujf
         cBIu6Eipyi2xCm9Q7B4lUr4VOBxxs9rvFb4wjr2pL59iRPXMYOnL+tZNadmD6tmiNxPJ
         cGXbrgobD3AJWgDT2p/28hksf9WrepG29tgFpJpbjgOPjtiX99k5yDx0OnIxEAOaXfaK
         M5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YwvR0hqKgY0QppCDRqvS4E1+yFhDfD+NCtMbvNXlcGU=;
        fh=heAa6mazbivTUJXMbsX3E+r42jsTQflHAzqdz2WUZx8=;
        b=JXW8QpfHfZe07UnVCuxw9+OUlsSo4tn0K/MZ7epfIZ0Hlebjt2JPgrXhYsg2HcCeaR
         75gJ/ran0oLb5LLp0HAU0cL9dui3p98dObrEA7ZItTolSCmg+jTSUpAgXJeBHUT43bqG
         O/H5EaFW0gre/tqgQ6HK6JiL1q5JQbW1qQ0a0kkB3StxDFJTGd8homR0+zdxWmiO/yQ7
         Ln43JLgOIgWQwKAUnaBfubH4InQt/rQXSOsnBUm7qj8TjUQULzUVRZYPiU4cWAI6SJSC
         tJ4APTExR+J68TEQol3Ybd3mtCEwIihCfNxOe0QfD/M24vV/FVSfYCpwq/LoP5nDpBDs
         4BLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792521721; x=1793126521; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwvR0hqKgY0QppCDRqvS4E1+yFhDfD+NCtMbvNXlcGU=;
        b=a0keEYEI6QILljKgahQcUh8t87WV3diVWiJ/LkIkbZyRJU7mRV58xcyD4zDmNISXsB
         tt1d9uHxdXn0qxmzAVMD2DQHukrgQw68j1LfWMU58StBTaN0tzklSwE32XcpjbPK5r0h
         SUD5wrHpehlkhgGkBwLx5SXXnIVCPHx0TQ4kTvORsVjsTRUVIFjuSwcGQl6lsEYVPIub
         4hSCb0kPVVKHocyCW5NaME0RZvwvkMk0sLnzJ9rD2iibd92EuaEivCjN2wqrsYf0xzFY
         EiHrnFGTIXzLytqlEftC0tPfRUGTDT8jE3BaLaIwdfQgAfdigE+IzzEOe8K+hWDTgAgK
         9ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792521721; x=1793126521;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YwvR0hqKgY0QppCDRqvS4E1+yFhDfD+NCtMbvNXlcGU=;
        b=z5DlIAyCUFoOPEYPmuRXE9GALAyYS8TGZatLbmrvHB9SAe7tYJalq8ztON9BsQd7CS
         xo/yBKJOdfLQlbd9Catu2WI7I7uJdxT9Wn2gWFgb/HWDA/MceAkBVGzPVQL4fr7f77eY
         BraUor2Bgnhu9Nydfqw51evHXYjfSMtBoQQ/6gTQQT46fTUDTN+urcabyK6UlUpRVTvE
         yznOD2B1w3IAeNCUbVejxHm7kpT9AgPs4d5sgqF4R15Q3UN0gOu4hpuLXUI2/mvoTvWm
         Pkglirydx8/40m8ciBm5/ONnUbUHaCPcLW6kLlgBWry3zjHe+GNmkcNIflxgadIH982r
         NELg==
X-Forwarded-Encrypted: i=1; AKwUvByd3VeBe3RA5SEil+Vr4PExGjHZ+up9wZUrfIDa7YOJaMg72GRq0V4sZ7qNfJ9zjBprDwqUVxung+JFJqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq0CJvLp5Kwx4UuKj7N/J9jdtkGnGCxGqMAwgvvv2m2pqApVoK
	AOi8FAXtr8I7V8R6MviaHZDsiUffpSicOSU9o8fbFF0TP1hidwz28m6+5amzAwPuN5RqKX0yl/i
	p+0Vd2W4xYhOK6ujyqjClEBNLgDyTgwS8SLA834jlVA==
X-Gm-Gg: AYBFou2NMnhQ+5/NlzWSbjGpBn52dtnkstin63NzMMqFhaBuuPoa5IHcgzkDiKQMnaN
	Cj1fNiizXHbNAea/PpEuCH1a/Stk5kjFtF8wXWJ0zOuFdVG20TRyyucn1eSJkOhlzFstB2VASIt
	5/V+bOC/tvUYFAcsqzpTQf69s+zcR/0kekn2pXqF14U1euwenvnqDpcuJpaI1fKMscwXV/cIxY5
	cfIkGPuhiGk3NOGB1V2L//KLf/KNvu4DcGRCegeDTu8HwF218XmDy9KKjbbvcaQ2JQHetHkadkW
	bIKXY5Lb3HBwJpekURBEjPSrhcoKvDVKzmzCLUJXkpdde+lf4yQV4Ki3sw==
X-Received: by 2002:a05:7300:c00e:10b0:35b:d329:9f3e with SMTP id
 5a478bee46e88-3674e842a86mr135963eec.28.1792521721089; Tue, 20 Oct 2026
 11:42:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai>
In-Reply-To: <20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai>
From: Siddarth Chilukuri <siddarth@nexthop.ai>
Date: Tue, 20 Oct 2026 11:41:50 -0700
X-Gm-Features: AclHuK9vLMZF-AAKuV86zplYxOP7GeZc2vlcY3CCw4_yPy_9puJFU1MY3JTp13I
Message-ID: <CABAykku7MDTF7jTg3OdY=AWCqrBUTS_sNAoVTHUBM6yM=NKjUw@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: don't fail a read whose data is already in the
 RX FIFO
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 5, 2026 at 11:49 AM Siddarth Chilukuri via B4 Relay
<devnull+siddarth.nexthop.ai@kernel.org> wrote:
> When the controller is the master receiver, TX_ERROR is set once the
> core has NACKed the last byte ("transmit complete" in PG090). We have
> [...]

Hi Andi, Michal,

Gentle ping on this one. We've been carrying it on our Xilinx AXI IIC
based switches and it fixes the spurious read failures described in
the commit message. Happy to rework it if anything needs changing.

Thanks,
Siddarth
