Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792925679;
	b=cKKE4nMNrmAwXjJ71TwwvYPNBZMC2P+5HN6it3+BQYse7VC2l67Bzx5UDXXFTMBFCEyq
	 rFySO6cahHr5fJp/P6PHICNa3Wb0YbVCQzrg5n1k+zgjYeNlYNbALnm/fdbvmr9Hj4E/b
	 Di4BWbfCNsi0cUV1dfaR1xCrKJkgzWiUUa8v576eMHN0p8zxARzy56o6vgU0l9QKvF/oh
	 yxTTplpCP0EbH4DUEqLFdhz8gngrj/GHyW0Lx09hlAE22NsgG2ttdT9mhxo1bQjynWQzL
	 7vq0a0acMuNoPSspdXdaO5PFwGZtbOix1IxzpJaNknXsX/nscGE3vGNNWpVAY9cdIEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925679;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YUpmzKZTRSq0SLS/cbOe7m9gR2A9I/YOZNEIBpgGCsI=;
	b=TYOMPWoXoz8pwR7V5Fu1b8dhnhhKkIPaAHBRiUWPKKHsEEszjr6rVRTpkeRI0znXxKef
	 Q9isvFOfhVYvNWjD5zl56/EPr6Nb+XjpaB/Tv+ClJUZkBUC9jS/vdjBTJzKRl5DROjYRO
	 eTvwy/ipz3GlkdpP746i6fNe0dg3ZreQSGob6gkxkmJ3RkM0iO7ZEPO5AfsYbpIydAfSq
	 6EtyMMZbM2Spwvtjp7z2sYJXTW4nt/vVITalFBRzQnS+QrkbGZAk+AYJf1m4XuYlGTRHH
	 D70ciP5BLg21v5xznA8OIvHOniOijzWsX9PuTjuDxAxisu2QKYOtZJ1BNbN4JUtZEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AigJWNR/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE76606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AigJWNR/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101451F01825
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792925679;
	bh=YUpmzKZTRSq0SLS/cbOe7m9gR2A9I/YOZNEIBpgGCsI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AigJWNR/+w9M1f3eGhsJQnhY9rfg/vq+tfMFMWTNAe3uhkosA/h25XBDwx1meMa0w
	 4f9N4GKfTSjexHYvUUPagHiSCmIwW24WPruwPszaG3iH2lbkOXc+uLTaFpFIBpcb7s
	 x6bQf/Ayj/oT5kEBrrnSrji7chnxlPMPsDIG92rJhTty0XchLnKmZX95lj1DcO1m9T
	 vc2WN9zrhwtVzA7xxTJeAIZr13hPm7g/5BaAJl4iHIyrsZzUFsqBF+vpXK8ja5osfS
	 Fl4hjJjsPUiIxsxguJu1VtlWnj4NnvWGQRcH2tS854qOw9Jrchxk+TNOMK0tvDiGgU
	 lECDcT/Ze9jww==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-46556b9e02cso1459864fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYS6Wny07vwOlsDDrGI3PggCa+gIpai5u3BX0QS9rC44FDbLP6+390nVZJpfM26VbHqLJ2JUAvhrPjj80=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnZpQ5Y55dWUitVIJq+lYeWLGr/U3ptgicchjnLi07k0GizqJT
	T2gu+qOQ/+uvQmhCYlq4Wre6NmrgNFryK4g2aCjpxYTXRat45TFTXkI7CNfwjcQPYAuJN8QN5JP
	D45zUw1hSQvA0vEA5lVpgJGRPc1Fb0+w=
X-Received: by 2002:a05:6870:5b8f:b0:493:c06d:7700 with SMTP id
 586e51a60fabf-4a83f57ff87mr1836034fac.25.1792925678477; Sun, 25 Oct 2026
 03:54:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025014251.542973-1-yanxia@cmss.chinamobile.com>
 <179289279836.3327.9494173903555653580@kernel.org> <20261025052117.603790-1-yanxia@cmss.chinamobile.com>
In-Reply-To: <20261025052117.603790-1-yanxia@cmss.chinamobile.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sun, 25 Oct 2026 11:54:27 +0100
X-Gmail-Original-Message-ID: <CAL4WiioxAR1ZBjVJNgYfLM0hUwyHapRu+TAUzedpOpe0yheH3w@mail.gmail.com>
X-Gm-Features: AclHuK8-3dHCgmtdtpDWr-ENFR_K6te6aI0Mm1zxluZuaww3MP1c6hfoi2JnGxk
Message-ID: <CAL4WiioxAR1ZBjVJNgYfLM0hUwyHapRu+TAUzedpOpe0yheH3w@mail.gmail.com>
Subject: Re: [PATCH net] ipvlan: fix RX byte accounting for local traffic
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, dskr99@gmail.com, 
	maheshb@google.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	yana06070@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 25 oct. 2026 =C3=A0 06:21, Xia Yan <yanxia@cmss.chinamobile.com> a =
=C3=A9crit :
>
> Hi,
>
> > - How the issue was discovered
>
> Found while comparing ipvlan's local forwarding and external receive
> paths: skb->len still includes the Ethernet header on the local path,
> but no longer does after eth_type_trans() on the external path. Both
> the unicast and multicast RX accounting added ETH_HLEN without
> distinguishing the two.
>
> Confirmed with UDP traffic between ipvlan devices in separate network
> namespaces: five IPv4 packets with 32-byte UDP payloads increased
> rx_bytes by 440 bytes instead of 370.

This is probably not a net candidate. No need for CC: stable

Also macvlan has the same issue, maybe wait for net-next reopening to
send a series fixing both ?
