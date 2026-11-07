Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080230;
	b=45uU2d1L+VXXp1YNYrDjKTzjKjbiJ3pNlhqtce46dY8XHUMmmrMWAbdmxFZAExRX9Gex
	 sqtFgBOZF/SiokgW0SovJU2qUuBcy6NF40cVPkwlxXAC3pGU5aoGv0m50vPGhW1juiUwm
	 Qd/+y5HaVYQLttmnbyN0BD1Yikxp2m1L4KxErLVRbq7DR5VTq6eXJiVu4Ou1Uh0cMwbEk
	 3cflAEbzFHmF3dBkawJdSdtqCQX2hHAzZMpU8AvjivrGYCCPu9Uxt/0mCFIwLd2gJlRAK
	 Koq/YCbMD7rQRsqt9WVW8J5zP4AzDdMn8aQCl7XIRL8Ea0nSiYDTfSTlKCS1Jqw8O9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Ba/8if6tQUDjhYKFvTmEGvpv0JRQFM7xPWSrhR1kNZg=;
	b=ofcI/qVP+2D2TlTA7031NZO0Zx22ZoUvmDczzS8MXkXqju4ltSxYLqtxpSorrQG1BixI
	 1Uhbnr3hY4nMnHmRPqLDviCpImfpnyI5wkm11x7lnQLaog97HxriB1Gc8/M8ncpvqj1sM
	 8JZ3EK27KBoQrTSpWqNHYWxvyO+x1DQ0hmAls6LJ8vHRgez3O4Zxi9Emo173IoscP67Dt
	 P9wXNhuNtyLQE/4V/aUnIL3Uj6COp0w7HZbfH8TRNt/zJUgl5QkP1G8WxCCmeKszMZgpn
	 O8jWr4dKaQs8LMPkiecMDRjFh5YvgqQXxtmSDmn6eSLRlDNl648dkx+vM3EAZx3iKnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ByK4imwF;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2159606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2159606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ByK4imwF
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed276af91dso26710505ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794080229; x=1794685029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ba/8if6tQUDjhYKFvTmEGvpv0JRQFM7xPWSrhR1kNZg=;
        b=ByK4imwFna3/KYzQ0O+TZzdsIb/Erf6wIjoJkQv3G1x+2xnq3FcmalVU2H4oKf/VcI
         +GiTWuh+io7HiYBKomc1DVtSVUnJet7Vg5U75IK9f8HwenUPB0xaTFj+q3eVrjLNEdgj
         Z00Toc9xErF5tCpwYm9epPKIJMKEJIbtCJ/USGq90Un4ETrkMRsClobiPlIUp7IpAfxW
         yWIGT1pyCRVXeeR41RACstB1ag4SXd0Px6tOfZM8TtyWWY0Pg/8pazvIS7yXOqtdDlxK
         HQdIlRdf1aDvpGT4joMQxsBhz6eTsObYcqJxW95PNPAQrNOp8UAKUhfzoOMUHf41t02i
         dlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794080229; x=1794685029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ba/8if6tQUDjhYKFvTmEGvpv0JRQFM7xPWSrhR1kNZg=;
        b=IttMc/zJO5QKbY+xeulinS/SDXY2+jsiRf9v3sUiwnla5Lgqok+6/9IVqqXz1EQbYz
         oavGucDKMf2mpQ+7VwyDrNWis3vEgllHx6jmKM2HZLCBw0D0OCecgOEVuD456Kgn/MoP
         TbCw6gQ8fjlSLmdC71ldL8Fo4NShtCKQglQpMEk/6XABWObNdtI63XZ3Ln5jfjOIy0ak
         7gQYDavFtFx77InJQ1XwQvzBp26tnC6UbZayUmTfM/X2Uh6EHbRWhGLq7vrxsGIC83GI
         xbk+JnMUnctXSP4MNtOuF9aSl26HReeGY64SJdMB8pJaDqiJDblg/ZA1Isdsew8Tztsf
         Fn5A==
X-Forwarded-Encrypted: i=1; AL+hErEJaE0yeO/8JQewnjT9fSIfLk0dZyngWpyTK9XMQEA5QRnpvJP7GJgaJHSi3j863AUtyhbfJe76fVhznYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p/eiFrGrWSZ9kAGTFFyi3i1wDI1wp/Y9KCbupm3WrwiSZw038
	Nrf7opLG9/9E3FmIpAt9RurQEf5J1DjhJQsJN/UMMenn77IpbL3i6DweDp8WxuRKkSh+7Lu9MKz
	4mXus3A==
X-Received: from plmm4.prod.google.com ([2002:a17:902:c444:b0:2ed:5073:70bd])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec86:b0:2ed:1cf0:4cda
 with SMTP id d9443c01a7336-2ed412fc4eamr68907245ad.8.1794080228818; Sat, 07
 Nov 2026 11:37:08 -0800 (PST)
Date: Sat, 7 Nov 2026 19:37:08 +0000
In-Reply-To: <20261106135841.418-1-ljp1205831794@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106135841.418-1-ljp1205831794@gmail.com>
Message-ID: <au99hnLthtlu0Mln@google.com>
Subject: Re: [PATCH net] net: reuseport: avoid duplicate closed socket insertion
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Lin Jiapeng <ljp1205831794@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Martin KaFai Lau <kafai@fb.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	TencentOS Corvus AI <corvus@tencent.com>, stable@vger.kernel.org, 
	Lin Jiapeng <jiapenglin@tencent.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, 06 Nov 2026 21:58:38 +0800, Lin Jiapeng wrote:
> Clearing SO_REUSEPORT on a TCP listener clears sk_reuseport but leaves
> sk_reuseport_cb attached to its reuseport group. A subsequent listen()
> does not put the socket back into the listening section because
> inet_hash() checks sk_reuseport. However, inet_unhash() checks
> sk_reuseport_cb and calls reuseport_stop_listen_sock().
> 
> With request migration enabled, reuseport_stop_listen_sock() ignores
> whether __reuseport_detach_sock() actually removed the socket from the
> listening section and unconditionally appends it to the closed section.
> Repeated connect(AF_UNSPEC)/listen() cycles therefore insert the same
> socket until num_closed_socks exceeds max_socks. The next insertion
> writes before socks[], overlapping prog on x86-64 and leading to type
> confusion when a reuseport program is attached or detached.
> 
> Only insert the socket into the closed section when it was actually
> removed from the listening section. A socket that was not rehashed as a
> listener is already represented in the closed section, so leaving it
> there preserves request migration semantics and prevents duplicate
> entries and the resulting negative array indices.
> 
> Fixes: 333bb73f620e1 ("tcp: Keep TCP_CLOSE sockets in the reuseport group.")
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>

The right fix is to disallow changing SO_REUSEPORT once
the socket is bind()ed.

I was sidetacked while preparing fixes, so let me post them.

https://lore.kernel.org/netdev/20260928174546.4022833-1-kuniyu@google.com/

pw-bot: rejected

> ---
>  net/core/sock_reuseport.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> index fccbdd0430b0..775f446516c3 100644
> --- a/net/core/sock_reuseport.c
> +++ b/net/core/sock_reuseport.c
> @@ -480,8 +480,8 @@ void reuseport_stop_listen_sock(struct sock *sk)
>  			 */
>  			bpf_sk_reuseport_detach(sk);
>  
> -			__reuseport_detach_sock(sk, reuse);
> -			__reuseport_add_closed_sock(sk, reuse);
> +			if (__reuseport_detach_sock(sk, reuse))
> +				__reuseport_add_closed_sock(sk, reuse);
>  
>  			spin_unlock_bh(&reuseport_lock);
>  			return;
> -- 
> 2.55.0
> 
