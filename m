Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327174;
	b=tA+FCkbqUNmxIxkWKdKHBFZJI3icTCgmTXD/H7Ac0TM40imqJpCVX911ninxgeE5WLM/
	 dOOg5oFiAlNVSbDDLJ4kzEOJHmVr15ElBZXegRCCqCm7nybzZz7XM71FwUJDHAwMD8bWD
	 GgrQM7dAPJBvFVMD6UmPm4gD4Dc69TurcyC8iFLNANzKSPU06SKTMaz1PHBArewd5RKL3
	 PORBcDoNOb3Oo2WF0WiDrTBckKfruXEFCA75ONHi3EfkPKjUSR6akeCHqtXICZ7I4hSIg
	 ePaRq//cHs4SEVTyk/YoQHtBfITyR/zc+auE+r3zCF0i5lpnbDYzjY00P3GXlEcAmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327174;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=in2GRGedn8xujhUfMjqdyzbGddtgYvZlV+27x56RYsw=;
	b=sAadFA375ZzkfM7ZBCrtyoXgSsXTRHm4Ry9ydSzUNowsPS3OYehnEWXhxD7Jpa8UgJEg
	 3Gybir0bivY1G1NhCLpKDG6/Ho0NJKLTRuTFwj8W85Y3KWYpILmQvjLAHfqm3bWoY3upN
	 IVxq+/Ehc8ZAMDlqlNavzLgDuBqHGt1MetLv+AsdA99mBrqeJTKs5y+KmsIRLkgY9fUoC
	 BAY+lN4DfMBg2D4CBs3zmWzfSkCASR5qroigkgQ92op1jOcvr95VI6BL3CIf7x2eqbCds
	 0Mv5c3sTX6riTPAvaJuFo5Icgu+7XJg1HJ1dqaNLS/IJmQSIVwsuWDa1eaqu1tdqdEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=WhZUmgXT;
	arc=none smtp.remote-ip=209.85.216.101
Received: from mail-pj1-f101.google.com (mail-pj1-f101.google.com [209.85.216.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B57606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B57606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=WhZUmgXT
Received: by mail-pj1-f101.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1413217a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327172; x=1794931972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=in2GRGedn8xujhUfMjqdyzbGddtgYvZlV+27x56RYsw=;
        b=0u3x/3R3o3shdoODuoCNQVZmYBedTnIVXooYZljYeixkUitY9tSSLIPawdwBl3jich
         SXJFHEQAwihtjMGHygg5ouQL2NPgWE1x0sTVOz7D/JT7atZFLtokCx/BR6DhTMoemThC
         5WCjFs4pTljHq/8NzdRQjM4xWFgs/wULVgzVZf5fHH3Pcd9X+R8ZCaA3NtYH9KKGT/OL
         Lrb4/Pufsp89V6URbyox5KVrNeJNXOP0XYrGF2vDXncH8w1DSzEwfuvufzCFRDauB4f/
         hD4Ys1+HCHpj2TRaCr1fu+zdxOF2x4z18ry0sAGSbu3jp5ouHLXh3A3CAFZYrkYSw/2r
         XyyA==
X-Forwarded-Encrypted: i=1; AL+hErE4IgG9+sh7+7sfYxoDC+iGMwwoKau9JTc4RC4WRozctK9PpHamPeRyuulf1Jx3LyWNRbeQ3ucWz7ROYh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aaE5/cb2i3Jbqos5spzksFLCB4GV/jF9NVK1E2AwTA49LXXOV
	c06/dq2prCo3QJmVOoIhqSnPFeC3ikNK9ckkzOf3TVR1sbk0LjvT9v8DBCulNj9UOAYtyoXerby
	Bmgx+BqMWHsMwVi7CtLFgrdcmkOqEyt5uHq3HItM=
X-Gm-Gg: AYBFou0LdUTOzGfjQXSfDHmVHStfEOoTMrFv7/+r85NgjkkR5XBLseyhV9GspxPgdgl
	X3wmyAEnKk59GunYrTVWpvN0ZSHzKCe75xYtUTK9r38u+o8NFEG+EGynGGFlB7x9E6TbVdmS5QL
	+0FTxc/hCwEjQ0nj0phqhNQd39Onndh40/04hnpMvq3SBoqMxaB8yuGwj3HeYjV3VSOS3ujnrbk
	EeW+FV9iu+/j366vZoKVDZy24AtSFWW92AHKkCvoYMLpYB9NqL5j++Jc1FQNRTVmi0Um0scv2J5
	QtfF2eOZ8BpLDIICzhqontOlgrkUKgrGRXT5Lr0HEXv+dcINP00clePbUj6TI4qtzWnhrKw1dax
	dww==
X-Received: by 2002:a17:90b:5625:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b1679ba42emr1924377a91.28.1794327172047;
        Tue, 10 Nov 2026 08:12:52 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17e0dccfesm170958a91.4.2026.11.10.08.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:12:52 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1794327167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=in2GRGedn8xujhUfMjqdyzbGddtgYvZlV+27x56RYsw=;
	b=WhZUmgXTiHPEQa5m8oXC9xJGHWmDVDhBJOCOKZ68i0JAgrryuJ2OpKISMMArTDvqKX9J3p
	gly0mlrzj/PiWbAWnd57JXbMST0Ayd3lZxBjRTHC45wOgvxvTiqVvYN7mP52oUauJ3QI0S
	qnL9KbBPK/0Od73r2/adXduAhczgmS4=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id b5d66eed (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Nov 2026 16:12:46 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:12:37 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S.Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Antonio Quartulli <antonio@openvpn.net>,
	Ralf Lici <ralf@mandelbit.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	openvpn-devel@lists.sourceforge.net
Subject: Re: [PATCH] wireguard: socket: fix sticky source address on p2p
Message-ID: <avNCdbpjxM752XSw@zx2c4.com>
References: <116cec552f58748d434d4825c6c74f39266b265f.camel@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116cec552f58748d434d4825c6c74f39266b265f.camel@infradead.org>

On Fri, Oct 30, 2026 at 04:38:06PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> WireGuard attempts to reply from the address to which the original
> packet was sent, caching it in endpoint->src4 and validating it before
> each use with inet_confirm_addr(..., RT_SCOPE_HOST).
> 
> For Legacy IP that validation always fails for an address on a point-
> to-point interface, because confirm_addr_indev() insists on
> inet_ifa_match(), which compares against ifa_address — the *peer*
> address on a p2p link — under a /32 mask. The local address is never
> within that "subnet", so a perfectly valid source address is discarded
> and send4() falls back to kernel source address selection.
> 
> For peers on the far side of the p2p link, the fallback happens to
> select the same address and nobody notices. But when a peer on a local
> LAN sends to the p2p address (e.g. my OpenWrt box listening on its
> external PPPoE address), the reply is sent from the LAN interface's own
> address instead. A stateful firewall on the peer then drops the reply
> as unrelated to the flow it originated, and the handshake never
> completes.
> 
> inet_confirm_addr() is an ARP helper answering "do I have an address
> on the same subnet as this"; what send4() wants to ask is only "is
> this still a local address". Use __ip_dev_find() for that, matching
> what send6() already does with ipv6_chk_addr(). IPv6 does not have
> this problem.

Hmm... How did you choose __ip_dev_find() over, say,
inet_lookup_ifaddr_rcu(), which is structurally more similar to
ipv6_chk_addr()?
