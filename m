Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C23E0226
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838362; cv=none; b=e+6RMO/H67iGaVbMN05JDIOTDWn5qGxOA7pPvJZc6FBinJVdEnXJyIw22Mh86xBS7DjU8/9CRQluija9aSdLVSM+wdw5lMrRiT2ko0JKFi9F6mSLKrlp9fLqK8dYalmoOA1N68qCYQ5QjmGj/ana2I5C8WiAbtu37OyAdWiHtmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838362; c=relaxed/simple;
	bh=IbopxjPoCzKlvvHW8/4/PJizp71LJ0jYs5Sz563vkBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsV1YEHz4CHxP+retFmHKKh1NvOFzQJ3rafxAwCd4/jZwwVBqd5qCpLF9t/e3VpOHc0hj5mLk+aaI9uzHk31WVXPu4YPTsn6m3YxyUynEkdoTZqnXB5ZIwb11ArfcY8FvY6N2jbzyPcQY9BMdWNdqWU3SE3yyEohWmbO/c27f40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knzw8CIa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knzw8CIa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268EF1F0089C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790838358;
	bh=XJ7R+ElrpnxBa6DAVtgH/R7fvLqOGL960kSWt5dCJ9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=knzw8CIazXTOt6SQceOxFzr6UoG4d0PiXl58e4KNCSn27ZrlOQ7sR37/TrDLJzgWc
	 BhTeOMjNlmpnAKVwag0LcnbqqVDH0SN9YT1DWaGHm/bDLCckpOyUK8FKBP4/kaOrHV
	 r94XMz/ppPvMMHQDt3sMGGoG28gsNu3WrC+JGhxFPz9qx4yD2obcDs8crqPv534pYj
	 hfFHKhZq4V6wp82lTe5Hs8WfPcbfUqJ+4O6mtLC1jJ1+Fu/6FuO008AYPc7J3O1Gr/
	 Xej47+JIHQKGv4JiC06Sz3KSZskduuhmvF4RrNSAxtCK26r2esxmAPZUqDAFv7RHfx
	 LvR+GbfT3ETKA==
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0c89e34so4402865a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:05:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByadlpRCbhU9lZEuEfn+uLxGgtmtGG/jZ7FjVSTTUePp0Y0t+3iU5sZWBIjl7guQLqiYygDGneQVAIBBUY=@vger.kernel.org
X-Gm-Message-State: AFuF++kMIhCQV1TStpp3c6zZCKChWszOn+goEqSoOLy7FbjVDuz+nKYX
	XDde7PDh846V3yORtsov0k9f6nXgg3Fu7k6yX5LIF7RChaj/gQ7ieY7y1sZb1YjcDhKhggf/ccp
	ecbB1G+CHdI4S2uiJSy6kriHQpHAyl2M=
X-Received: by 2002:a05:6820:81c9:b0:6dc:5ccd:a0bd with SMTP id
 006d021491bc7-6dcf5442dc9mr4214357eaf.33.1790838357438; Thu, 01 Oct 2026
 00:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928181554.85766-1-omar@blockcast.net> <179061959167.31693.11895969550331516671@kernel.org>
 <20260930222700.45470-1-omar@blockcast.net>
In-Reply-To: <20260930222700.45470-1-omar@blockcast.net>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 1 Oct 2026 09:05:45 +0200
X-Gmail-Original-Message-ID: <CAL4Wiiqw_7Mxa5W1EQgw2=KpJNNxG=cBLXsHvpio29GvD1UKZg@mail.gmail.com>
X-Gm-Features: AclHuK8Ah8EWWi4llXxbTO1nKhuE2OSHUxQopb875Y107JX0Vth7_tpLGa3czjU
Message-ID: <CAL4Wiiqw_7Mxa5W1EQgw2=KpJNNxG=cBLXsHvpio29GvD1UKZg@mail.gmail.com>
Subject: Re: [PATCH net] amt: do not offer software GSO on the amt device
To: Omar Ramadan <omar@blockcast.net>
Cc: netdev-bot+sinfo@kernel.org, Taehee Yoo <ap420073@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 12:27=E2=80=AFAM Omar Ramadan <omar@blockcast.net> w=
rote:
>
> Found by code inspection: an LLM-assisted review of drivers/net/amt.c
> while I was working on an IPv6 outer transport for amt.
>
> It has not been triggered. I have no reproducer, and I have not seen
> it in production or in testing; it comes from reading the code. The
> path is a GSO skb, for example from a UDP_SEGMENT sender or a GRO
> merged UDP flow, that is routed to a relay's amt device: it reaches
> amt_dev_xmit() unsegmented because the device offers
> NETIF_F_GSO_SOFTWARE, and the outer UDP layer later segments each
> per-tunnel copy at the inner gso_size.
>
> Testing: W=3D1 build with CONFIG_IPV6=3Dy and =3Dn, and
> tools/testing/selftests/net/amt.sh passes with the patch applied, but
> amt.sh never sends a GSO skb, so nothing exercises the changed path.

1)  Note that tx checksum offload is off by default on amt, so the bug
would not trigger by default.

2) Please take a look at Documentation/process/coding-assistants.rst

3) A better fix would be (for net-next) to call udp_tunnel_handle_offloads(=
)
in amt_send_multicast_data() like other UDP tunnels do
