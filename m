Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794332956;
	b=JpMxy4/3SdF8aznbWOlRf2UShGajIkJj+3DidYxic9gaGXXCmbu29Tb9oyscWSmW6AyV
	 VtihLEofgiPjDbwrZCGhmRrMCXpQhSgCCktn9cGnu96R0blj0xfnvV6tyzIAGGXEHzx5a
	 2LQQAoK/3W7VNvbBl62tpamJot1QyOlzNLkFdhLg5aTa7/UKvl8Zma2V28fsGiDiZw4VL
	 sEdJH9ydF3+pZMxDFRRNfjxF/UZe5DMX0PJASe8yvIoqA408nUWxaBMqLCgUDYwkCHVRs
	 a4YctqCqP8sQoB5tv+FQ8jla7vP3rl5cMhQ6gviSIYlrOq7EN3VrGB3t7qof+2HdkvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j6/vIY1+KYQxBreFtYkfvG0gVjy/kF+drhNwxzom6y4=;
	b=HdR3dO5v0nDmbFDbH0DIvkkxGlAXtp3X3BXijVnsxPbZ8v+idvCV1YazCzUI+zyJrH/d
	 AzmUTi259uYYQ96NvfK3DnYN1e9T+2Uv6RctZ6kwS6m6dV+pwUnfHIWxPurrwLnx+MIFJ
	 2HN0j1xEqysoxry/kdn7dfSm8Y+wVIBzf/ocYFV229FsbOpVBFpOYQWUZSAIVch31ycOT
	 cOUQ9HcG2TSTkDGio3ZAdP27lnWvAczm0p/oBkljZ8yOq7M7QmIhcGbcEZikENvKbvG37
	 Pel+VfU5xTkliHiOChGUSHK1AYJKM4owRT18264gRVopJtR0aRTnVNkIKEa8wp3kAIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=KQdIGxie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3914606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3914606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=KQdIGxie
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c43373ae89aso179942966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794332953; cv=none;
        d=google.com; s=arc-20260327;
        b=FXM7uQydbvjD4H4u/Ws70W4cjWAbJArjI2Yh6k7ITByfE/boD+zb6MfFVtVVMVpEaJ
         zogmkG2u+YhidjnVTpOCMSpKohxwchJCGZUBpBcjFqhbX/FeSErwRPhSK/r99ab38ZHW
         cnU3dftwqqldv5PZXEDlAzvh6SUmHBHkpO1h09mHB92nOe5331s5xGPEIK2ewUN/pNYT
         wgKi97cHVmChRI5SRGAWOXAiNT9k1tV9C9v5IE7l7CkMkYqYpQs1RJOz1VwS3dPBkXK7
         fOV4KuWQa3V3ZQBeFFB2N0cP0brLebB2vemjmVhiaITv1Pk6KtKQ1r1y6nzlYfIxM+ZZ
         4gSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j6/vIY1+KYQxBreFtYkfvG0gVjy/kF+drhNwxzom6y4=;
        fh=5puLcm+j0E30XHvqRJHOvBZW2m38BXJiDi9dlQQYVuI=;
        b=oRplz055nhkhLWL3Sagmw6RUkOf4IsuWqzg7ZRB4ExuzRkbQWLrT4Ix/gfgWdfpyiA
         DMSkBEI6Iq9tLrOpL+VCa7mCb/+tDfnHa4qpCzHm9ksLIHmHez4wAiwRZgQxRh7KO5V1
         pJNFnBtglYKC9gFBCzlsQrRNNWfKD5wnHU6/rrkKzosSE1z871INLGyarG2reDdp5gCj
         Wfi6LGANwsVhRaXjiIAnzUr99Zy46bsI2JVF/p2bG3ggBfYXHF9JiGcN7Nj01aNRsqQK
         fqVdUPYXxje/vqZaaksfvMAdFIixxyQjBO00afsBp/1WQ3EIXIAu3/Ie/bp3jL8pwE9z
         AncQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zx2c4.com; s=20261015.g; t=1794332953; x=1794937753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j6/vIY1+KYQxBreFtYkfvG0gVjy/kF+drhNwxzom6y4=;
        b=KQdIGxiez/gh4C0E6pwgI2SDKl5qCYpQCokfBgOCm+1FT6nN+zOKmSs8m+dOSc9xlc
         JkzSM1BNct73WsvEKF2Na83AcWOVJphPdv+9gZoy+6Jnj8BT5v986paa+U7sfAr7q529
         BEVxT32EbblRsl0AG7o2CAWTgTz9NGWtQH8A/z81Nz9eFWsI8/NK5Pkz9lSfkuoMw0H3
         oiIKdDMCW6W6RJixhz5/mO8OvLGCc1TIDJK1/UeORyHjFeJFVEYLMSeIEfikqIxJJwmF
         n2IZ4GV6VJ8n3ASxVCmuM6+N5XPi8RE0DHIXY5uhWJTs48pxoYknrMm1lfLWlKqO7dfs
         Epbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332953; x=1794937753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6/vIY1+KYQxBreFtYkfvG0gVjy/kF+drhNwxzom6y4=;
        b=Z0UJcUl3ED5Pp4TR3d6iOKCKhjXUdyrYsD7VRszrG7MlCs8T/NgEn4JdSOa7LH0gaq
         giSiHI8zN1txtdeCAd1PCfIbSbqwG3JeT1+aUv3jRtTm3gYEGHTJrfTXCT6fUG+xz0iA
         ezY1l+w389ZhVftqd9H+1rHA+F6X5vrfXkdprug80thWIW1cGAwCsGDz41DhuLxPqpIc
         RIGAPNgiYoe+pWTYafTmKMu4Wbi6eSExawkjjV7hXlG1Irr/ElJXz72oLMOmrZsAOBTA
         Qnw0SLPYIiE6FYD4hG2y1yLasT7F+w2zM7viL/cc/zj/sZbAOzCTTOUwH35YweRhcw2c
         mnAA==
X-Forwarded-Encrypted: i=1; AL+hErEbfp6WR1MHtKKStdC6mWNY4Lj4Jk0CrShM+X9SMfOmjuf0NdsJ8s0j+08Z1yZKqZA4PQz3eauzB6ULR5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fnN8JjBuu/1An4Y2Gw2M+eLid11d4NRe1TXKUEJgOaMYRjF/B
	Kr5ENgafbAusjRtGnYREK64UTqdHJBhMb1wtmvGCk9F2kdK49MejryJ9JL/YMnl6NlVMDYtjJxq
	429IMjAUifccNrY6a2+S+fZosCN7xuhbbyEDZ4Z12fziAv1kniyXm48LPLbI=
X-Gm-Gg: AYBFou0XwrB/f9GsIJS/9V4C4fn8SIpuOCCg5qf0k8Yzd6nfdW0uszAtjCAqPo3qhBG
	Pc16eRyC1WRBjQ9yqQjkjdGp5JXGqtm/5mKdoJWaoIJlG9dqAyF1BEMQlqDjppBWg2Ci0kLquwi
	1KomNTBlJ209YVfxYzXj3feX5baRS8GJsvVJLxO4IoRvZlZpuWjHMRhiUq3XHNUe6fCCLHU/QFB
	Sl1LSAikHzQI+KcamrpcFvAyJ5SuoW632BzPr639VmJ9vIVsgkUPcyqJAMDxFLURq+8zRyNJ+AS
	gS8KZIRnrDroFX9bFfnCktJUgDfm2FbZ8IOGhpleRlhCRxzLq+4RfMdJpB+5+k99LpHzPsIViIe
	US7wb+iaqJqCSBVhWpURGp1gj4W0iX0qyKdu1mnY1jpEOGgGvi7Tkvxqd530ZGm2vfX74wiun0m
	mK3wqT3Ym3HxWKKptxHuQSHG1Rgs5eOZiPc4GLJNb4WNFdQjdoAYE3TrgwKccXU/F9lLYWNNm48
	ad9
X-Received: by 2002:a17:907:3fa2:b0:c40:38b5:d784 with SMTP id
 a640c23a62f3a-c5049609f4fmr264194266b.22.1794332952982; Tue, 10 Nov 2026
 09:49:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <116cec552f58748d434d4825c6c74f39266b265f.camel@infradead.org>
 <avNCdbpjxM752XSw@zx2c4.com> <89b5e08e2a48c33be4cf2d495266d04a2dcf406e.camel@infradead.org>
In-Reply-To: <89b5e08e2a48c33be4cf2d495266d04a2dcf406e.camel@infradead.org>
From: "Jason A. Donenfeld" <jason@zx2c4.com>
Date: Tue, 10 Nov 2026 18:49:00 +0100
X-Gm-Features: AclHuK_fmNqGYrX8aoD5zj-ji2pF_XvdH1TFaa_HSiH96TwcOL_EUaS0rm5SADg
Message-ID: <CAHmME9pWbftSmnJgLawNmWxNHMEqC5evxWPW8TruYkBD18Q8nQ@mail.gmail.com>
Subject: Re: [PATCH] wireguard: socket: fix sticky source address on p2p
To: David Woodhouse <dwmw2@infradead.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S.Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Antonio Quartulli <antonio@openvpn.net>, Ralf Lici <ralf@mandelbit.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, openvpn-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:47=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> On Tue, 2026-11-10 at 17:12 +0100, Jason A. Donenfeld wrote:
> >
> > Hmm... How did you choose __ip_dev_find() over, say,
> > inet_lookup_ifaddr_rcu(), which is structurally more similar to
> > ipv6_chk_addr()?
>
> __ip_dev_find() is what's exported to modules. It internally takes the
> RCU lock and calls inet_lookup_ifaddr_rcu(). It also falls back to a
> RT_TABLE_LOCAL lookup, which I think is the right thing here too.

Okay, makes sense.

This simple patch reproduces the issue in the test suite (and confirms
your fix):

diff --git a/tools/testing/selftests/wireguard/netns.sh
b/tools/testing/selftests/wireguard/netns.sh
index a8f550aecb35..5dfecb4c6ef1 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -474,7 +474,7 @@ n2 ping -W 1 -c 1 192.168.241.1

 # What happens if the inbound destination address belongs to a
different interface as the default route?
 ip1 link add dummy0 type dummy
-ip1 addr add 10.50.0.1/24 dev dummy0
+ip1 addr add 10.50.0.1 peer 10.50.0.2/32 dev dummy0
 ip1 link set dummy0 up
 ip2 route add 10.50.0.0/24 dev veth2
 n2 wg set wg0 peer "$pub1" endpoint 10.50.0.1:1


So I'll add a followup commit adding this to netns.sh.

Thanks for fixing this! Applied to the wireguard repo.


Jason
