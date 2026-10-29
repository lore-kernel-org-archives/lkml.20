Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269147;
	b=G8T800KASxoR2rx66W1JDIX80AtmON9aS+daCB7KxZNKPAChqphAIRplFlO/X53hOzc3
	 pWH7cbZk2eyPKTrQ1ypizUPKZVvK0M65R6Mgu2HyUflxJQYfRjRPMMQNJgFU1bgnb7Llx
	 rv165YQoSlroIfus54sU9GPWo7AOHX64yItXOKJgCUqKqw6xjrU1qVLvtY7ro3XFhxyjV
	 LSIjRk9swqEgVsq34yO9GtvOkq5lbHcIWqjCeshQtW3sJdl+xsS9n0b8NPaxnwEBxNE1a
	 3xMsL0DaotVYvWxJsUdAM/Zo48vlu0HUTC8vT0iaYM7yxApUYpA7O0q4Aor1b1cwJwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
	b=PlmStOPEyYJRr8ez/K9Zf2unQeRA41TAHDhgvIriS1ddlM1jqRil+/f7RAraBaR+73ll
	 WTHayRekXQj0MDJgtGWRP6ANSiaRhJ4iPLJakZ75Ma9c7zawt05oYyKPKwX52AEilUoTh
	 TM5QzZgi2Gb0jit/cKCm+CzXhsWVzJ8+lAFXV+W10wt4jUHt6zhWwzp2WfSdsZZtufRev
	 mNJ721v3yJoBrZemZN+Q47judGC2wCT1SPj/yG044pvCNQPM9KpVmpu4Olb9BcG/Y5ixl
	 acsY0ULk06V34/0VXn/VDM4GclrDA3yQXYcmahccTDLSB5DvW2eBf/4neidn8l/U6ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zH9z4kbb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE79A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE79A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zH9z4kbb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso17568635e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269145; x=1793873945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
        b=zH9z4kbbMg0lkkb/HqgCLaFR9vONpMS7UnrW2ezQXaMot4yuVlvx8b5AsRhSxwcAbi
         Q4V4plM0s/t0NDmjNPggc0m3ZhTaJqh16rAqpGi9MHj+RiOCp8gednbCJjh+al/OBh3J
         k7dr5f93QI3uvgi5N70JgAPgUqm5BbmDSTg4+7OuWMyvYgfA37I5zYTduwmKcfRgttzJ
         kjcY4e0V4EKRJbYh1+4WRLNTrxvUqyF0Wh6n+2CKqJa9D29js7cu4+6Z8dPMKadEGaoD
         kMgHq+0nvRzb+a+PbaN9D/ZrUsU0nRFfB6YPncLGLwQk91Qn1/Z4TSQbNgEhroKs+9x9
         ox+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269145; x=1793873945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
        b=kcSPNzb/F0RYhyIcG173ZYNcUha8AYT0QFXiwAx9P4MV/E9U01MAlxehkI5VQZEAGF
         rqhTOP1uaj9EkJwB9mTJSH4gCl73Duc+VWzykaRp9FI9ogREKmcjFqw6JXB7E0cJCA6y
         XBWxydIRgQWXi2cogUCSgwTAV6b4nwu6eescVbgPeSOPcu9tKXUyaHc8Zq/BkwWDa2kF
         KVIThmdAKHgInnyR/hVAvBUz4jrd4LpnxK3wIj3S5GpPwe56eUS1lo3VgFoM574EuB7f
         adBDBfK6v0DJKa8AKuTcRlxLo8UXP3A+u5qzGN3iwsAtD9QKQrqkP5REnMUlbwUFTC8Q
         GTUg==
X-Forwarded-Encrypted: i=1; AKwUvBxbF3qu2KwFLcxbb78HV0Z2nGHe+ONuU5fVruzSoL1mZ6EdAmX9Pq3V9qI0/EU9mrfzahdixvhDvFptgmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYILCLGJdTdJ0GhIuNzO5mxZECsC812g8yd4CqyRPHxyTFRvobzF
	4bACNSIRhAZ8z5h83HGpKVGLnikcYYVueMQBwKE+JPB0S4xldeZMBRpZ
X-Gm-Gg: AYBFou1vHnqGIivTnaKAii2WljXwemZxFkMIfYad2MBf/ebV6f7FKl74DtifS6DA40P
	oGmntxSURMWK9EsMHWDdVP+/xbqKpP0tVbgPKfXLdo053iIa4mWFx39DXtQZ7LvbK5/VaQJQ6wp
	nF86DPeRWyuEgLuRUTcHuxzZT35x2QWAxcrX4oNig+kfRw7BjlbFBi3fZyNDxwWBGIXLu7AL9d1
	qjThB1cx7fptkI5KYsozd9/vKzPNU+k8Pudz+Ue3Re08Fi6+ll0NVFF/toQvv1QwEhiG6SVAbxR
	6bRSwW0qJ4DJw6x40umGT4Wibj+67zTI6qVbt+lK3ZZSrgxVzAwTnQbsO3sGMNCuM7IG48R0zQb
	7/2adHiYNUG9ug2wJVQpmML7Oq01fC7dwtkoIOFJIl3L8+O/7ncMTZrDldOHA5v7PfVQ49tESx9
	GasxxCk5XLRiFBdJmrMlBe67LRNaTGzvo0CgFzu0xPYML2ZN4nu+whi2AKDPrg19nvnS08twACz
	rZMm254rGsGl5Qb+blIk9/4Pbg+TgLACbs6Yed8ChFICx784ZwSzJFvMytttxjEu5GrW+2p6jvO
	uRfPb1edxREEww0mompkdeOHh2PQN+vjeEVCIr0hrHIMWonhfvFnMckORv1g4T6X+w==
X-Received: by 2002:a05:600c:6088:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a9677ca203mr118445565e9.27.1793269145060;
        Thu, 29 Oct 2026 03:19:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm31946023f8f.43.2026.10.29.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:19:04 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:18:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Esko Mobius via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Cc: echoowall@gmail.com, netdev@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Simon Horman <horms@kernel.org>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Jiayuan Chen
 <jiayuan.chen@linux.dev>, Shuah Khan <shuah@kernel.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
Message-ID: <20261029101859.6893f1a0@pumpkin>
In-Reply-To: <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
	<20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
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

On Mon, 26 Oct 2026 15:23:09 +0800
Esko Mobius via B4 Relay <devnull+echoowall.gmail.com@kernel.org> wrote:

> From: Esko Mobius <echoowall@gmail.com>
> 
> This reverts commit 2640e6419594 ("net: advertise TCP MSS from the
> configured MTU, not the learned PMTU").
> 
> That commit stopped the learned PMTU from lowering the MSS we advertise
> in SYN and SYN-ACK. For symmetric paths it argued that "the peer runs
> its own PMTU discovery and usually already knows the real path MTU".
> That only holds if ICMP "fragmentation needed" can reach the peer. When
> the peer sits behind a firewall that drops inbound ICMP, its PMTU
> discovery is a black hole (RFC 2923, section 2.1), and the smaller MSS
> we advertised was the only thing keeping its full-size segments off the
> narrow hop.
> 
> Inbound ICMP filtering is very common in enterprise and carrier
> networks, and it is pervasive in mainland China. We hit this in
> production after the commit was backported to 6.12.111: TCP connections
> that reach a server through a relay with a smaller-MTU hop complete the
> handshake, then stall as soon as the client sends full-size segments.
> Clients on networks that let ICMP through, and connections that bypass
> the relay, are unaffected, which made it hard to trace back to the
> kernel.

If it isn't a silly question, how to connections in the other direction
work?

I'd have thought they'd need that ICMP message to get through.

David
