Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833874;
	b=tkekFeFvrvD3bElkA9r2EHtlJD3Mx5rl3sgF0HyR2PmJrS6/K/bSWzf6cfe1l6TVBPAK
	 2BycRLYEZN/wcwn7BRo1JyJeVdLopesB0J5DHGnRtMczydtS38hcRku5v4X7uKapakxd9
	 QIlFbRdtfroEqsO29bZmwM7hyDOcGbswKxxfBbhgOFJvQ1UYT5mNSLNFFNLFhJ65GVBun
	 9phrxrMn7FxVMzA52jvEV7A/Vamc1fROagk8KxafQmyl8BqvSBvVktHsuvPr6SdU2KMFt
	 +8tVKgMNURiSpzcSb/+XeXpGtvkdrCxxjWfa1OKBr2//eviQX/ZN38KpV8Yf6puAk5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=b54vzCQbDLyQCU94ux+/8U6SB77amlsLWgVzT1nnN+Q=;
	b=mtzpNPVbaBW9b6e1teo/QcEDKeZ0dCVochrJi5YdtlyI7augRJQzXp9juZsY2umKRQAY
	 TTmj2dx64Ia5TyIeiVdZycRXJy2a0a1cz/fpfQZTxOlp+4fDHl3G26pS7XvF7DXSgvTEO
	 4HslzIblwKPxwagcvX9tEt/u/nW0D/4p2OY7m5cWwBzEoqKKpvp4CK39X2va9dlyucxQ1
	 DTYGdg2xzTi5JNhRAN8eq3c+W9BYYSCrQqGnN9qBDaDKV6THbwe8wQB01mHKVvq5CplU/
	 a9Zf0ufCvJw2Jcjx00MKlsn6BaCQMCmQf6wj2EM6CHwszWLzdnZ9BnwW9NBMZx6FSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkR61oGU;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5117606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5117606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkR61oGU
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c58f18765so2578549d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833873; x=1795438673; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b54vzCQbDLyQCU94ux+/8U6SB77amlsLWgVzT1nnN+Q=;
        b=qkR61oGUGfWXyq02W5NwpkdI7xWJvKjPbo4T6TzYJHy/q20X+owb18EINtxXGyeyiz
         WrKGwDAePfVSPKmczk8CMIjBDXvpP7neyJi8+raNPzQY4aWlk4sR4R4bSnDg1kNeDTJg
         gkvV0d20Pq9Hq4QzLU6ez1JIjSqR9wrT7XIckcZtEuZ/yXHnHFP9LuduXvnvLRMqLW/2
         ZrkbNd8LTokrh1WbtXAOtCMMWxpX3EGTQlgoevge4vxCismIVePbFx2YyBRQI8pRbr7P
         PxxEQwlclmc3AgwQO7qS9CbbyhI8KezTBFTDpgU+0vn2BvN1F/phbPcTZ/PLgsWJjyOJ
         mtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833873; x=1795438673;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b54vzCQbDLyQCU94ux+/8U6SB77amlsLWgVzT1nnN+Q=;
        b=g3o3qSI09JG5iuG7gsoa3IwfYAUTG+QAZ+GCOUSoLfw1vfT6H62l7bTNrHtesigIp1
         U7MNLryNmKjzVj3/Xr8hQ8koiRzUkdXRQVr6tTUiFNuyED60/xUldmZ/4X0A2pxTMMRs
         D3xRtYsbgePn/BOiiB1d1+M9CCc03LYwfhXTlisiifDB7nfJrM50drnjho1Z2DfEArXO
         aspUVELexrgaNQPKCleJjuZnjt8B6xj5N7MoHT3oKQTrHnd53NB973L3H0JS2nJlf/WQ
         xON+neUtj/wfxCvnNtR7nJTRa3j/3H1COWNlIW6Npld6JBf1dyR4l+dQHCYl3w1a9RsE
         q+TA==
X-Forwarded-Encrypted: i=1; AL+hErEU2PZO7q1QgmDUPGyYaLFCYmoUdxUYK94yjqUnmKRYrCDEDG2Jcmbx0ZcO9UOKuovefrImlBgUGHB9NKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IaF01PGRNf9ywv7ApVWgRtlDfwd1Dk7b86U35ECPoJdrOhEcg
	THvddIHeNq6ieYpuI4cGs8SyGS/p1cJV5WZz0DuIw6TUDzA6DcCyHl2F
X-Gm-Gg: AZFdTZfK/3sq6wJi7TU4kvqh3tic8e4eVXKK8giPzdKGiK2D2r8slYnBgErTV2qXCxI
	49yQVmOh86zg8mKIG83AgIPHNi3Ks5xmtPR22+J/Vim4P0MuCkbHugnpVMhJRYT9QOUtHNWdozW
	psK2B5fapWjuu29GcewTqibX/9BKIULVgNQ1ogkeiGi5oukJudm8/0p5n/k806v5KXAbz4AhaQh
	zMqwv/M3gYknJWMq0ELK0NWmDri4Rzc7iGkJk5RccE8A81dQVDguk/IVELEPFkN8opEaVmQRGQT
	1mR1fKb7te0h2gkOlLz/1rabBs5PQMOuI52cCntyxhDE88Ol8+yReZLxfwo8CxePjD1j+OnYtro
	u6fMn6H5b1NKujrKR2Ao6iGzNGGHSO8YSq5xo7EyfYk467MT9IfGNTVDRQtuBQjn2QdZaFA7KG8
	cI+KHCr+LuIyNYbcLOndqPP9pdu8bKi+bY2k6LHJokJZ0OGJM8ZXJCQZQIgRoN9XbR1M+TK//bW
	pvxG/m0E3XWG+m4vt9Ab+xlCLLVuA8xQODnI9/eS5/mFFiuyn3Y6BxrTGe3peJm3ugQWCKuo5QN
	51Jg6r5WEkZYTFfJUQgKYBbWUtwsG43R1g==
X-Received: by 2002:a05:690e:4504:10b0:67c:70cf:c90e with SMTP id 956f58d0204a3-67d8965ab34mr3362885d50.39.1794833872447;
        Mon, 16 Nov 2026 04:57:52 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a55ab71sm9886911d50.4.2026.11.16.04.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:57:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 07:57:50 -0500
Message-Id: <DMWNI97J4UZH.QK9260QE63ZJ@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, "Boris Pismenny" <borisp@nvidia.com>, "Cosmin Ratiu"
 <cratiu@nvidia.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "David Ahern"
 <dsahern@kernel.org>, "Dragos Tatulea" <dtatulea@nvidia.com>, "Eric
 Dumazet" <edumazet@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Leon Romanovsky" <leon@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-rdma@vger.kernel.org>, "Mark
 Bloch" <mbloch@nvidia.com>, "Paolo Abeni" <pabeni@redhat.com>, "Raed Salem"
 <raeds@nvidia.com>, "Rahul Rameshbabu" <rrameshbabu@nvidia.com>, "Sabrina
 Dubroca" <sd@queasysnail.net>, "Saeed Mahameed" <saeedm@nvidia.com>, "Shuah
 Khan" <shuah@kernel.org>, "Simon Horman" <horms@kernel.org>, "Tariq Toukan"
 <tariqt@nvidia.com>, "Wei Wang" <weiwan@google.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net v5 0/8] psp, tls: don't send offloaded contents in
 cleartext
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111001831.3710881-1-toddfreed@meta.com>
In-Reply-To: <20261111001831.3710881-1-toddfreed@meta.com>

On Tue Nov 10, 2026 at 7:18 PM EST, Todd Freed wrote:
> While working on adding support for socket-less psp associations, I
> noticed the case of ipv6 extension headers was not being handled
> properly for psp packets. It will be relevant with that series, because
> it adds udp support, for which the psp nexthdr needs to look at the
> inner packet.
>
> That led me to various other ways where packets on the crypto offload
> path could be transmitted unencrypted.
>
> Since the psp/tls association encodes intent to send encrypted packets,
> but these various cases circumvent that, sending these as fixes.
>
> The cases are,
>
>  1/ ipv6 extension headers (patch 2; patch 1 makes mlx5e flush its tx
>     queue when the resulting drop happens),
>  2/ fragments (patch 3),
>  3/ icmp errors (patch 4),
>  4/ icmpv6 errors (patch 5),
>
> Cases 2, 3 and 4 are relevant for ktls as well as psp.
>
> patch 8 fixes an mlx5e bug in tso checksum calculation for psp packets
> when the l3 dest is an intermediate hop (ipv4 source routing). It's not
> about preventing unencrypted tx, so could be considered separate.
>
> netfilter refragments bridged packets and builds reject replies itself,
> outside these paths. A separate series to nf-next, which follows this
> one, applies the same rules there.
>
> Testing:
>
> all hardware testing was done on connectx-7 (fw 28.48), between two x86
> hosts, plus netdevsim.
>
>  - drivers/net psp.py: on netdevsim, all 36 tests pass. on mlx5, 30
>    pass, 4 skip (gmac versions the device doesn't support), and 2 xfail
>    (netdevsim only).
>
>  - tso checksum seed: a psp tcp socket with an ipv4 loose source route,
>    the peer checking tcp checksums in software. hundreds of checksum
>    errors before the fix, none after.
>
>  - fragments, with tls offload and psp:
>    - ipv4 (route mtu above the device mtu, IP_PMTUDISC_OMIT): without
>      the fix, some fragments after the first go out in cleartext. with
>      it they're dropped.
>    - ipv6, through an ipvs dr service with a local client: without the
>      fix, fragments after the first go out in cleartext, and the peer
>      reassembles them. with it they're dropped.
>
>  - icmp and icmpv6 errors, on netdevsim psp, with an nft reject rule
>    (icmpx port-unreachable):
>    - in an input chain, of received decrypted packets: without the fix,
>      the errors go out on the wire, quoting the decrypted packets. with
>      it, no error reaches the wire.
>    - in an output chain, of a psp socket's packets: the error is
>      delivered to the local socket, with and without the fix.
>    - a PKT_TOOBIG from ip6_fragment() about a psp socket's packets is
>      delivered to the socket, with and without the fix.
>
> v5:
>  - new patch 1: mlx5e rings the tx doorbell when an accel offload drops
>    a packet, and checks the stop room after the nop it posts (Sashiko)
>  - ipv6 extension headers: drop them in psp_dev_encapsulate() again,
>    instead of in mlx5e. it's the helper which can't encapsulate them,
>    for every driver (netdevsim sent them malformed). unlike the routing
>    header rejection in v2, this isn't a device limitation

Can you elaborate on this? You're saying encapsulating with the
extension headers present was working for mlx5, but not netdevsim?

>  - don't fragment decrypted skbs in ip6_fragment() either
>  - icmp and icmpv6: send no error at all about a received decrypted skb,
>    instead of quoting up to the tcp header for tls offload.
>  - icmpv6: decide whether an error about a locally originated skb goes
>    to a local address from the error's route (RTF_LOCAL), like icmp
>    (RTCF_LOCAL), instead of the address list (Sashiko)
>  - selftests: the extension header test runs on netdevsim too, and
>    removes the socket option before closing. the fragment test uses the
>    source address of the route, and turns off tcp_mtu_probing
>
> v4: https://lore.kernel.org/netdev/20261103001143.246081-1-toddfreed@meta=
.com
>  - back to dropping ipv6 packets with extension headers, but moved into
>    mlx5e instead of psp_dev_encapsulate()
>  - drop the psp core changes to rx and tx ipv6 extension headers
>  - new patch 2 to drop decrypted skbs instead of fragmenting
>  - new patches 3 and 4 to prevent quoting just-decrypted packet contents
>    in icmp errors, v4 and v6 respectively (Jakub, Bjorn, Sashiko)
>  - new selftest: ipv4 fragments of a psp tcp socket
>
> v3: https://lore.kernel.org/netdev/20261023234640.1459291-1-toddfreed@met=
a.com
>  - new patch 1 to fix tso checksum seed calculation in mlx5e (Daniel)
>  - accept routing headers and reject ah (Daniel)
>  - split the psp_dev_rcv() change into its own patch (Daniel)
>  - return -EINVAL instead of -1 (Daniel)
>  - selftest: one variant per extension header type (Daniel)
>
> v2: https://lore.kernel.org/netdev/20261022223014.556388-1-toddfreed@meta=
.com
>  - walk the extension headers instead of dropping (Daniel)
>  - reject fragment headers (Bjorn, Daniel)
>  - reject routing headers
>  - psp_dev_rcv() handle the rx case as well
>
> v1: https://lore.kernel.org/netdev/20261021210200.788191-1-toddfreed@meta=
.com
>
> Todd Freed (8):
>   net/mlx5e: ring the tx doorbell when an accel offload drops a packet
>   psp: don't encapsulate ipv6 packets with extension headers
>   net: don't fragment decrypted skbs
>   ipv4: icmp: don't quote decrypted payload in icmp errors
>   ipv6: icmpv6: don't quote decrypted payload in icmpv6 errors
>   selftests: drv-net: psp: test ipv6 tcp socket with extension headers
>   selftests: drv-net: psp: test that ipv4 psp packets aren't fragmented
>   net/mlx5e: psp: tso: replace only the length in checksum seed
>
>  .../mellanox/mlx5/core/en_accel/psp_rxtx.c    |  21 +-
>  .../net/ethernet/mellanox/mlx5/core/en_tx.c   |   8 +-
>  net/ipv4/icmp.c                               |  12 +
>  net/ipv4/ip_output.c                          |   8 +
>  net/ipv6/icmp.c                               |  16 ++
>  net/ipv6/ip6_output.c                         |   9 +
>  net/psp/psp_main.c                            |  21 +-
>  tools/testing/selftests/drivers/net/config    |   1 +
>  tools/testing/selftests/drivers/net/psp.py    | 249 +++++++++++++++++-
>  9 files changed, 327 insertions(+), 18 deletions(-)
>
>
> base-commit: 8012eec76b7e6c0d9fb338fe8e3db6ca1b419da4

