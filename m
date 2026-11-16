Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796277;
	b=LDllQBh/s57FEs17FVqlBnK1D4R6rf1ZqsiXmpkHqR9ev0IueDlwf/MR85v8GTAea37E
	 bfSLqkdhUh/86eyMDAzla04FciIRZMZkVy7JJuVv6C0lhAD7ciGa+QaSsDEX9aQxuFjWy
	 ev9OOfxcmmY85VRZu4HgN/5Lfe24JVkdObd0xU72utvS3x/lwz53XaSSg6k07FU0wLmZD
	 Y+GgqZxePnc0aZTxF2IvcrNqEvsFJKjshLSPZMtzZFL2Vxf7nJd4NXmdfUrm1Srfs2ogW
	 u29lu7uRhAVbr5b9JuoU5JgJgKAiEv+lh63fVjV2QXIfHe30IxFEv1oeFwMtWAv9hUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FKvjlHRiAkBBGldi8tqyRzKJUO6RZBtUR9E6f1vPWnc=;
	b=VJra7yI8D7hdSJcpuMxnOvQcLjeC84CyLjuQGod0y6naKE7Lwt6bN2cgB/2qnYXA2Uz9
	 kPOx5lEabhxU4cViqx5Nni8mzLgAV1ArZHm4c4uHePDGo4tKbY4D9DGvn+rwJCZRz5i+9
	 6MTFRUiInqXOn4e8VkpbOSDXbAcG86SRsL57+ppWIlUN0v+47rQcIAVoD2jmNv7/e5xBg
	 ArK4ggN7Z+FgfxBgMNnqCgdyQCcEqorRWc6zJ6ySlAUyeKNF6UUEMLPyJD3SnC0Yp4xru
	 nt4p0yaFPvQCUbYW8w95TzqDKzyH0E914ug8U+/KVOh/VnIVSOv6lFWORJyjlTCWsrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qQGkvwKg;
	arc=none smtp.remote-ip=209.85.221.197
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0398606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0398606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qQGkvwKg
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so945850e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794796275; x=1795401075; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKvjlHRiAkBBGldi8tqyRzKJUO6RZBtUR9E6f1vPWnc=;
        b=qQGkvwKgwAzg0VnMZ6FFjeYVUpUB4G4gESIRB+Ywv+2DN09rzQiGU8vUDpVFIWU1S1
         ZuAvM/aukev+kpYmOin8pWhcjmyM6SNl7u65+t02vJhqAt5JIBe/Y8KwgmncnZEjogAR
         HCqQutGR8HYJY4jhJ0y+6fw8KhNNVpAAjXYhCHHOGFkWZP3P6kwyH1UPqajZaXMFkt04
         iM124aJ+XvWt9dXZVP8oL7pqAtWAy5tgqdV1C7A9kr4WYwIDIOiWRQph5jovxFpAFKfF
         M5xRDTpLrt5sRuymBZ1WQnEaAgTTr7HWmow0oj19uSqCkFhG/DPjo6fyAbohq/YmSWRO
         75aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796275; x=1795401075;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKvjlHRiAkBBGldi8tqyRzKJUO6RZBtUR9E6f1vPWnc=;
        b=IOCY6orFHLX/Xp36kw9BOxfOsMpTHOpqPqUR5DYqv6TTosSAbv7vN4oJWqo9uqQ3pN
         7l7R9wsWu+MIhYknhh75kpisolwkPrpU5qKo3jKEOGPxTtI+d9cb8pxhwpry2871IBEq
         PuHm5qlEjbtSL7gylQl81CP2poF82emzNQ7ELSFM5hNOdcZR0EMxls6hQAzSxHNN1XSQ
         09FIlV4EqUWuXDPHtmsMN3P5Jydc6nrtU0XnoidVCJJzkMuxR6PbepvBM5GrOwkmMZIq
         5pwfl/clUGK7p4EaS/opJwwIBdGXQh2oKL+APruxtNU3qqPeH5HNjgSqKr70DZ0M0ah9
         3xkw==
X-Forwarded-Encrypted: i=1; AL+hErELF1GCg0Q9tDriqMS0C+E5KIt3ZUC2rn/bMPTsJcnnKuAZ1+z4JcgtK6DoeY5L5BoZI8x7Fzbue4zBTEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ULmVfSFHmSPYH2e203bkWutoMAS1VoxawmV1tYsHVTBwN1oNj
	UXeBQkOUGejt03cfPObYZNrgmfbroZXr1+nJ7Hkp6oOcsak84zhB0YRnACM8UH7qdboVs+nGoft
	PPfqBeJZwLAQqPCAjnrL5fm+Ynw==
X-Received: from uapk12.prod.google.com ([2002:ab0:734c:0:b0:99e:2b39:a3b1])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:2922:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7d64db3c827mr2441486137.36.1794796275267;
 Sun, 15 Nov 2026 18:31:15 -0800 (PST)
Date: Mon, 16 Nov 2026 02:30:29 +0000
In-Reply-To: <CAL4Wiioi-t+gKL3dLDWcTrd57tv9TEoXUxh8gHjCQSDyT7Xxyw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com>
 <20261114161248.3428695-2-thaisonphan@google.com> <CAL4Wiioi-t+gKL3dLDWcTrd57tv9TEoXUxh8gHjCQSDyT7Xxyw@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116023029.128997-1-thaisonphan@google.com>
Subject: Re: [PATCH net 1/2] tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
From: Thaison Phan <thaisonphan@google.com>
To: edumazet@kernel.org
Cc: chia-yu.chang@nokia-bell-labs.com, davem@davemloft.net, horms@kernel.org, 
	ij@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, ncardwell@google.com, netdev@vger.kernel.org, 
	olivier.tilmans@nokia.com, pabeni@redhat.com, stani@google.com, 
	thaisonphan@google.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 15, 2026 at 09:06:59AM +0100, Eric Dumazet wrote:
> Nice catch, but KASAN does not report uninitialized reads.
> Was this KMSAN, or did you notice garbage in the inet_sock_set_state
> tracepoint output?
> 
> Please say which in the changelog, and include the report or the
> trace line if you have one.

I should have explained KASAN's relation to the bug better. It was not caught
by a KASAN/KMSAN report itself, but originally noticed via an out-of-tree
socket hook observing inet_sk(sk)->inet_saddr != LOOPBACK4_IPV6 on KASAN test
runs, and reproduced upstream via the inet_sock_set_state tracepoint.

When KASAN is enabled, SLUB_RCU_DEBUG is enabled by default, introducing an RCU
grace period before freeing the request_sock from the initial SYN. Without that
grace period, cookie_v6_check() typically reuses the warm request_sock whose
ir_rmt_addr and ir_loc_addr were already set to LOOPBACK4_IPV6. With the grace
period, cookie_v6_check() gets a cold slab object instead, e.g. (with
slub_debug=P, expecting 127.0.0.6):

  ... sock:inet_sock_set_state: family=AF_INET6 protocol=IPPROTO_TCP \
      sport=59839 dport=41050 \
      saddr=90.90.90.90 daddr=90.90.90.90 \
      saddrv6=::1 daddrv6=::1 \
      oldstate=TCP_LISTEN newstate=TCP_SYN_RECV

I'll clarify this and include the trace output in the v2 changelog.
