Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291565;
	b=u90OOLdpMcqUOw30qSilLK/v5EuwmF2+cQHvEKUvMYuehJfueH34n/qKhsJYRp1iRViW
	 j9rxs3wWo03yAerWP+jHImyqH9rwVQWQK5PcWa4WG08QgD7Fo+B3ZqPCTMCud53OI+JqI
	 hUKIkXjEV8R47h3dXTpl6gM8T7K7o8UD1foKzRrjV1dmCimvoqyyANCGjleVp/hlt/ock
	 a+60fJVWMOPsE+jxIs91DGribvN+bpJr3j6hGhtg9NUy/xfIrCuQTwflVQWYRuyqRfm8t
	 3hNLvcefvhZB4vCh6CoYpiWB8IuDl/t0al7psbl6dwY70aId1uu83S8sx3FF3dPmYEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ULmBZxzjd9nmob9hw3BrOGPAN+eHGNmyepihG+CN0s8=;
	b=W4gGfWualMv/01q4d/2hWbe5qJx3RItwELNz44GWlIiqEaiLTT18CSaKl8FCepvRXcc7
	 e5+S4vg536ET1nZr80QWZkvPzlHs3wyRFVbGt/2i2GgDKNXkjC7JBmH2OMG9mUDEh081t
	 gEW16QMqB/LAFMVgms4EW0DW0CF/qBXIdHxiXUy2K+V6oF9hgiwVgan7jjMtUkKEjoHyM
	 7Yd5S8R5slS0BuxsenBBkIbe9bzTkUEAnNCO7Ilb1aGz/dyK6a/Jcgi8FPiPTWdDEx+az
	 BmLw44T2ZYEmuFzCO3hKJiFQw5ctdT/7CnsD1U9eHYnnpBur0i3YyBdF8+pMpjJR2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=APu2H1+i;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7754606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7754606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=APu2H1+i
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed077a15c3so17378605ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794291564; x=1794896364; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULmBZxzjd9nmob9hw3BrOGPAN+eHGNmyepihG+CN0s8=;
        b=APu2H1+ik7IdrBZIaZnEAQ9+N/vfJh04TDRCzsHQ8gApRVTdpiv6gdKBgnRm7U1u1P
         rkWSVBvKS0W6rC1PT1UNWRystkglBP30yLl2qF06gAD7fRKE3+djy0NmJVpEZPl0L+gK
         VC4LMl6eLCvXzzakLrUoVPzl6rYBz/Zns59XG82izZuoGJ7Cx2YHcEBq3j6SzF9D8GmQ
         k2oHWnhoZkv19hgyxY/n3kR0kyZfMjH+ojxms28aMAK+PPXBm6U0+hvwp0dW1VME3fBQ
         EzFfGS8cLsxp72jmVmza5ieolAUgaR3Srk0Ct+CydekD1V7Ysn7nx6qc5JTTqnvoETT3
         OwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291564; x=1794896364;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULmBZxzjd9nmob9hw3BrOGPAN+eHGNmyepihG+CN0s8=;
        b=ikQD2r1fwZrH+vM7ZrW9KabsU+Gw8q4DV87jPqFcoFidu72As90SHLhKJkm1OKM0Kn
         MTnWaflT9PNnoZipciiZxTf26QGsUFFw/OXqQKRdIaMbelr7JvfAS2CPbFLp6KOih7tR
         Z7Rsa6BA7nZN/F+cxU/9MDJqnkYZr/hQiS+CjTvd7zy4YokyJC1fSLb8hJ1vbixRayVO
         aKZV5Os63DaY3xGB0rPBTHfnWl4N21pKZ8bgrctusARIOYxXKO7jVtmzwAYNJDgso/D9
         PAYNeTlb1Xhhg0XYksg5AwP/OqPGc7qPqUaOvUpTtRmKw9MdSUxoezWmyEftQMkSQ5Sf
         YtpA==
X-Forwarded-Encrypted: i=1; AL+hErFyDdp3gjLI7SJw2gI4dVVaRIH3yE8MNLqIsEa2JJUOn7JAZ/aj8n4yexcsHr9IQ9boYQlKt8bpZNCk3bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TyLCGWJ0sSUPpclndyEMngr1dDY7pAWKPosG0jNN1VLDKn0A2
	EgED/pIDKE+ozN2fblByNKhXRLkbWC6uTp/FvY1iqExdb30RdTDbjD64V8ADl45PR4YM6ls+ZN0
	cbO67gQ==
X-Received: from plbbi9.prod.google.com ([2002:a17:902:bf09:b0:2e9:dea5:138])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ccc9:b0:2e9:8b88:f1ee
 with SMTP id d9443c01a7336-2edb91f89fdmr17283405ad.35.1794291563898; Mon, 09
 Nov 2026 22:19:23 -0800 (PST)
Date: Tue, 10 Nov 2026 06:19:23 +0000
In-Reply-To: <20261110-mtu-probing-series-v3-1-dedfab25d641@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com> <20261110-mtu-probing-series-v3-1-dedfab25d641@gmail.com>
Message-ID: <avK3FGrs1ca2e-BT@google.com>
Subject: Re: [PATCH net-next v3 1/4] tcp: initialize MTU probing before
 syncing MSS at connection setup
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
	shuah@kernel.org, horms@kernel.org, ncardwell@google.com, kuba@kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, 10 Nov 2026 00:44:35 +0800, Yongjian Wang wrote:
> With tcp_mtu_probing=2, a passive connection starts at the full MSS
> rather than tcp_base_mss. The IPv4 and IPv6 syn_recv_sock() paths
> call tcp_sync_mss() before tcp_init_transfer() enables MTU probing.
> With tcp_base_mss=1024, the first successful probe can therefore lower
> the MSS from 1460 to 1242. On a black hole path, the first reduction
> skips 1024 and goes straight to 512.
> 
> The issue surfaced while developing packetdrill coverage for MTU
> probing and comparing the initial send MSS on active and passive
> IPv4 connections.
> 
> Commit 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> removed tcp_mtup_init() from the passive setup paths.
> Commit 27204aaa9dc6
> ("tcp: uniform the set up of sockets after successful connection")
> later moved MTU probing initialization into tcp_init_transfer(),
> away from tcp_sync_mss().
> 
> Initialize MTU probing immediately before the existing tcp_sync_mss()
> calls in the IPv4 and IPv6 passive setup paths and when processing
> a SYN-ACK for an active connection. Remove the late initialization
> from tcp_init_transfer(). This lets tcp_sync_mss() apply tcp_base_mss
> without adding another MSS calculation to connection setup. The
> crossed-SYN path already uses this order.
> 
> Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Suggested-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
