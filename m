Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637353;
	b=U6TkALr/RoojqKWQEdISubzb1EIkn+UonhC+Jjciupz2Wx+TZOpPMsUGCfLUChyzdcYt
	 OWXgoKRO0ONo+T7n6Go2ul3yLVKesbR7lyh0GuBqMX/7aL88X5GR87kISHRFUpGfz0y0K
	 tUa51waQq3wjDLUl5XgUyXZ4vBeauOXMpoNhG4kLOKmmHJb455wzg9rwaklwJ3xR/oNyh
	 pJ6KOqCmCO3mg3SY5R+0MAm+PSsxkiLgxGGTBFrEtMpELcMGuLXz56dGe+LXx7xazhLn5
	 haSEf78jQeQNDWAKKcJmB5tJkZ1udLDJsLavcCi85SboW3xOuoN53LG6UMrJjdIzDTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KyLpXKnKTIyQF0OFuEovgw/bxqguxRHqnAp90g8bfao=;
	b=RRD6j0Lo5SGT2nH7Lf5djDvHDbx2EOnnlcjcMSUXEQeO5cwzrsnRcNiR5ZnKv0r8mBn6
	 5k+F3jMrZyyc+hyYo6g5ZWiViSYYTG9OpJyp8wTsW/Ip5a1yOmCF/muysiOPnXy5XnMAu
	 piAMLOfXfgkyJWlosHIYb4KXjf6RPKEsSxtL9PZRJKGyXBZ69r6a38ssysAsX2jd0+4i4
	 zYH9w+5lPqWZx1zL0km1RvR8+0sdVWfvO09VKeTTJCERilqJ9qSVwrGw23Ql1ELO3891y
	 Ws6AJf9o+WHNr3RyHCfyHZ2Xjnrzrb5Tz26DR66rhdT3oSqOTB3TCoVlzwwuNhU/Vzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mMJFUWim;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F691606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F691606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mMJFUWim
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so1296866b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794637352; x=1795242152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyLpXKnKTIyQF0OFuEovgw/bxqguxRHqnAp90g8bfao=;
        b=mMJFUWimdqfkp4EJbS3j07OIyHMSPjcmBn5T4H4u3G6CfdkQg7do7nYlqgilY03S2H
         /SI4eTidz6FAlIz/hn+/Ox/47OjRrNQSbDNszCmAN+0tzFR3IJNH5F6eEecioZAenTkP
         OjqMuD36Dz6M/OXCNTijKKaB1UmkUGXV/Bca9LZDgVvDo8aNGDQcq7kbg0i9Y49XkedY
         CVH37XGJTStX9gk6abeZtqcwNBsD7tNWOZXzlfIBnguxddWQURDpljblDA/Q6ln4ZcR3
         5Ln4LMRrffERmhiBN4+jMQ6qiYRW2pl52L/NLOwu4LppLLygxYLDcYJ0J9hXDd3dZTZk
         PoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637352; x=1795242152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyLpXKnKTIyQF0OFuEovgw/bxqguxRHqnAp90g8bfao=;
        b=1gZjM7mkTDFc3CBDFc9mmEnKANFPYhtSZ1xMT+kd1g/nOxFBV842kImrc66eF7e0W/
         5xcXFbtmhjxryDUhi+/FX/kkxjuoAYrkFZmT0FMo8hFZqI3COQ/GOXgTL5qmnqNJpUN4
         LjuFlbRwCzmA4VFuDDDUqHVmJDwBlT7O+cz7jvDI6M4u62VcdL9A20K3ii6/9gaFoOz4
         aLIEBNTrhfMm9PsS710bMbvSnfRIOuj+qVcB+E0+JWQwrvFNGZqo28pIfq5bPfQVpJit
         8WKcdJtAmkuA7VObfzOAdvty4yDxMlWeffooLYswKUE+bQIO/UBug3a02ETPYqpyHF7E
         /RZA==
X-Forwarded-Encrypted: i=1; AL+hErGWJeknwUv2iEVFoI07NScZahlpHdCRvAOBM0CjGvjiEtJ3RKmJuu3fYhlqz+j22Q+jajsp7hx6W/Us4pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Etmu3X/P76/DePgMu8+UuocgDUWv3zBdHb83GLzRlvigkcUO0
	COZYNyl1mCaRoR4ytB3OTN3VexZzEsMRtTD/DloMnXyJ6vs+DUCG4AVZnYINfYF/HsUS1DauNDO
	l1taRdg==
X-Received: from pffj8-n1.prod.google.com ([2002:a05:6a00:c2c8:10b0:8b6:c93c:12fa])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a8:b0:88d:3f61:20f3
 with SMTP id d2e1a72fcca58-8beb80023bbmr4277418b3a.54.1794637351416; Fri, 13
 Nov 2026 22:22:31 -0800 (PST)
Date: Sat, 14 Nov 2026 06:22:30 +0000
In-Reply-To: <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
Message-ID: <avf-GWBmzjHr5agk@google.com>
Subject: Re: [PATCH net-next v4 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 00:45:58 +0800, Yongjian Wang wrote:
> Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=2) has
> no selftest coverage.
> 
> Add a test for an active connection. Check that it starts at
> tcp_base_mss, that it sends the first probe half way between
> tcp_base_mss and the peer's MSS once cwnd allows it, and that an
> acknowledged probe raises the MSS and leads to a larger probe.
> 
> The SYN offers timestamps and the scripted SYN-ACK declines them.
> This also checks that MTU probing uses the negotiated header length
> for the initial send MSS.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks
