Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272854;
	b=DpFhkiyV8zXYNczOQgPjSLJvc1Vpy54HSMyGrIyD0jUkOA4Ad+UnBpVrX1WSCoUWgrE2
	 zT41Ex7OLbihMCXQipDIDziVNUuB2nFxe7jfbgeFods5sBXDbe4t3UBmVjW/xzgMryct7
	 ELliSFKj86BNE4XrUtwJww5ZGhy/nCSqbmxzzL8StFFr7CYTJMKYlIUotcVPwNC/pfi8s
	 6L35aTdkLe1N8Wo0ohhcL1av0DwiKIFDjeTixmQ+ZwP8F7VQyXEQLbCqAAxZgSAGLymn2
	 Gt4DaF8WCWi/w12rLCqCkwPEPpfbYNaAhGnIF4FobYx8bzoxBx+VGJmpoI1cKFClyew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
	b=HxHD/vV7zlsBSqQNhOVHM7sJagpWga4YWBcWAjhk4nikBrmP88JzcC5Jb4vhTXvu/9Xo
	 l7VUP2ChQ1fV9nb6B6MT3WaqRjQD5MN4Fkk4CBRXWZ5pPujOhcfJAOmjPyzXek4kMBMtH
	 26HToZDviAmJqPWuztQ8tVZh+dYFgwAM2c8hfyZwsqu8aQ8nZpn4pQnw3KuEoM6zvALOD
	 TJ4Q8mSfWhtF0k2hAvCryRRmoIZWsM2yJlnD8La16ye+8d0G4sByou7yvwRCrV0ajIQG+
	 Wq6BIW4+1Xy9Lz9QTxWg9DzqjEPp0Pk5Bb8IbleY/1E6dnNlFV28aPcjb0KcZm96EFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qk8g6IaN;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2720C606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2720C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qk8g6IaN
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso18215995e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793272847; x=1793877647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
        b=Qk8g6IaNzLRC96s45UVqwO7Akh0xDEgB2oB6ShZ3S3dAYnMFYwSN6XIQ868uHVjD3w
         xlEevPfhiO1ASAnLxtEQGJJgjbpXJ5AxBnKiBeurM8yl/wFHElO2uSuaAtHqzLvf+h+D
         zd15rVtpEmpuYzm0wON0ynBdThtALn54vYy15737THserh8ttgQtYd/xsNDfCfYNqV2S
         fgzwTmB3aphkX0C6kAHV/D+5UC8LVvM2pPQtp3K+7IlBziBJS4eEeLcBBW11fzWbOlI3
         sWewwss36PTuCr7WyM0SVmIhkVQJ6EVNkkaKWrzk1Kdy8xbACOcCZ1VHGMxPR0D6LB4L
         AyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272847; x=1793877647;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
        b=eF+q6edLRvAiphNhb8ReORpPrXS/MVq5i2vfJyWpy9YjQwHQ8tRHgM+vnCmUUGuLNP
         muw9LALJ8NMfxAv/pRRFTI4V/LwdyEw0/ch+9ICHd3CLzWmCrIYBhsgy3Faj/lPYTqb6
         asnOk/wfHy9e3tafkQL0Ab6XnjXM/mvmyz3zGMRZco5xFvvABgcV9rSFAu3TzMTWhMBp
         /sZNY4M5AzpHovKlVyLtiRdO3pRVSVX4vt69ptooDf2cD0Erwrmbw4OXs8H/y3lout8W
         IYADXkQreeQVcbBtryWYdaDzsVhq38MDTMLDCo7sNQw9cfpkZurXegYhrwOwDktDj+do
         udMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJHk9fvby4H5kJDbOUaXiZoLZrbt+eyXXicLF6nYKcHQJ/au8mCZBTrPuC3WYd9tTdQz4peal9wdF/tSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ112Jshl+0qYXY6ZTc2tCg4NMOvLSNLbSRt81QiIfWyoLVbQOq
	IO8f7f2H/h9Fx099pXJl8hEcZzkjGglcCM0jqeAEbOb/cK7xMMNxlgaU
X-Gm-Gg: AYBFou3CwFPxvglbeinoWgJNkV53eokvQAW6amyHoAY3NHls1b+QlOOeqwCWDraAXXm
	JkS/ApjxnkpkMqUfsJLdJjFuXHfH2LOzaygq7/BYk+jsm9BWvMJIXqE55lm7jM64KlW6ksLgzLX
	afdmU/z7LXlUQkKtbguY7K1SUzc3KUITu9V1Ys4muuW8n5ztyPFx/lnFGbVCWXTq58F8clAxkxx
	nom9R2yqzCKHm7OKl/OmnZG0frE7Y9zMcOVqPU8W+T3lDfMwIMoVLVOMEVMFMSwrdTAtIkhoygt
	CqAVSf6Emuz9RjXyEdieN2dSWyJPIpEsBTjgAEzQ2Bf1qjDKfwgIk7YkMsV/Yc1OXa5gPUfkYoj
	z4p3OlhncjiKwZy9n2KAJegg8FDVOfE57Vy9sCZ1u6lTjYaQB7fOFWH8aJ96ilLeM1j015rsbKE
	0O6QyAAOJ+VouUrHRbkWgOggsggDsiEZTceps49oZ07VK0zta5/EKb9WA1F7H9+uNwqsdE+8dDT
	ccSYFXB1igd8HO8PjuXCGXlRBPoNugNKI4GcrEg8PgZmXy55y92TNItADCb5UD6APORaZk5nE+G
	6eepogQaiffhUBE4dUUvs58eTISwBg9ZJC7szbBo3RuvIEPYKPP8LX5Fl1MKsLAaeP8=
X-Received: by 2002:a05:600c:8184:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a967016ae6mr109930585e9.18.1793272847111;
        Thu, 29 Oct 2026 04:20:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6419e05dsm5345525f8f.19.2026.10.29.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:20:46 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:20:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Esko Mobius <echoowall@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman
 <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, Shuah Khan
 <shuah@kernel.org>, Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Eric Dumazet
 <edumazet@kernel.org>
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
Message-ID: <20261029112045.5e7d4317@pumpkin>
In-Reply-To: <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
	<20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
	<20261029101859.6893f1a0@pumpkin>
	<22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
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

On Thu, 29 Oct 2026 18:21:22 +0800
Esko Mobius <echoowall@gmail.com> wrote:

> On Thu, 29 Oct 2026, David Laight wrote:
> > If it isn't a silly question, how to connections in the other direction
> > work?
> >
> > I'd have thought they'd need that ICMP message to get through.  
> 
> Not silly at all. The frag-needed always goes back to whoever sent the
> oversized packet, and only the client side filters inbound ICMP.
> 
> Server -> client (downloads): the server's full-size segment hits the
> 1456 hop, the router there sends frag-needed back to the server, which
> accepts it, learns the PMTU and resends smaller segments. The server's
> send side was never changed by 2640e6419594 (tcp_current_mss() still
> uses the learned PMTU), so downloads always worked.
> 
> Client -> server (uploads): the client's full-size segment hits the same
> hop, the frag-needed goes back towards the client (via the relay's
> conntrack), and the client-side firewall drops it. The client never
> learns to send smaller segments, so the upload stalls. Here the only
> thing that kept segments small was the smaller MSS the server
> advertised in its SYN-ACK, which is what the reverted commit removed.

But that relies on something having gone the other way first.
In general that won't be true.

It is almost worth implement something that retries with the shorter mtu
to detect the PPPoE mtu blackhole at the sending end.
Or even just use the shorter mtu for long RTT connections.
It won't make much difference to throughput (maybe about 0.3%).

David

> 
> Thanks,
> Yongjian
> 

