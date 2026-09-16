Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380A74F55B6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601976; cv=none; b=MmW9Z6AbbnKLzLydDp6Fa14piMVp47GbAX7wKj3L2q3SJDoucJYuR895+KnGzncU9UDSbK3f50GaB1a0jQfHOcsHGv59LY+D+ASrmCAaob4Fa2SoppXBPHAu+KI+jlZrQHGVQkMJX3owKn3ArFdhBIt+zyMaYyRioN/CqiZJwqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601976; c=relaxed/simple;
	bh=o/1cXNMKllqm3FfhHGbUe5JNifvPjGvgnfKea2bEwo8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EX4pTmr6uQNXWYC5cQPQIm9pi3yAHCVPl3VubcEtRqmgtJVwMGzZ3w9UWfbKCeagyyqyRqNVCdiGygU9rNGPDoksekdypJ0yAWMN8TZ7U8gwIlootqB42Ll5LNIvu/u+shOvXb/Trv4i6o4wRRsaPzOLeiHFpHa2SfSscttcE4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzFP/g/6; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzFP/g/6"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a2dea320fso20088985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789601969; x=1790206769; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qCyz2WlilgMN9JjRRCrcLN6jJ/n6W+SPG53PAnMMlJ4=;
        b=XzFP/g/6E52X/WyI9EyukwOXNp41STQUsp5n2BC0Uo/rdpiVJAScVZSzixv5Yf/Uaj
         XX13BMEnnlbv1Mjqx9bV/pMmTx12qWmqE4gIxuBh0N0L2lYi0qR6P4+6JDu5T/pY4jke
         Gz6xAqz92NpJnrcPxoNjoFNcZkMl37ak96X9i4UpmrTrdpIQkMGqs3s4IFZIjn6Vaa8c
         dixKoiqiQdJxAmdyfCz/lXenFmWHa+uHZ9rLF//1p1sYjff+lHfIleaqV6mIn0OJHDhZ
         URYOvwSB5WUEu7X4iwC0qdd/GMeNyj4VaxS+AxW6gur50Crxf6wLM2BPHCmG/lQ/zTSV
         zcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601969; x=1790206769;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCyz2WlilgMN9JjRRCrcLN6jJ/n6W+SPG53PAnMMlJ4=;
        b=jhVj75x1JT202MH7cGvkDj56Zj9oZReaQKgfxG04eH0OCQ9bcjBewLLSBitsGvgt9I
         syvcYEg7bO2H6cY9MnvMiH5G8PedvR/7MnXRctQgD2Kvc1xHZRRSUtI49VrkGvEHHFYW
         mjAFQV+CLnRRkJXcznCo9UbAIob3JoMUMvF+Xu1jUZKhADhj4XEWkZCSx0HOuJG7fcBB
         qkHoyUNPkjd2MJiRGsPvdIhSrTox6TCEYajrCUG+6yTNnx1Qr86BdYszdNay/zNRsHs4
         d+CTxsdjGoHLw7BrjCQjrhykoWIJPx6apBfmXfp12gd5r/tfTiY/eP5oyKFJHg5/WGm0
         K5qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzES3PNoy2FUkQxuKY+/WFvaZjB/r3V2tAvhJ8enb0xgbJ1uZwjGImQ+njC7tPB9bwsVjr7Xuac6u/+u4E=@vger.kernel.org
X-Gm-Message-State: AFuF++kzMQhLSzkkFRnnXQyy+g3/+Zq3DKm6NzUnRNTMnjoqRs+AOxF3
	NXtavp+0vKL60WWDzWRxSTi5DLp27GCt2mNV52R4mEqfuRfkntDqdAPj
X-Gm-Gg: AYBFou2202jsUF3k6/Bd9ywLU09BdhVxxNNz7ixDs5OmJctqgWsZX36r1J5qNXlCpah
	vFTWyuZOIVmI09ehvj8dy0m8Slgg1G76NC9CZ9YQGM3MeVs9VzgPvJYjYP+CC5ENx31GOkoQ/eO
	N8XfIR39KwsXWk8v+3a8Wwg7e2IqqJioTlVucMcnMVchCa/+VVxcefMk+WZXaiX9h2aNDlAw8hc
	Qal8QvYveNiuit7QzQpJIK52KzzbTR5Rjp4qqtlvffZa0KIw8MDfHFleNtNPlrAl+7pwfqyh6RH
	hLgdwi9YLuS5k5NaQdmVB0v9OZCunIdU68z7BMHDMFa17KEi6HVoW4yNAjXIytnMtm0mX9M4aaq
	uwjxzLp9hs2egH/p/ZU0P4Fw9IFVAc39mKlQge0GH3/mHDua2pD4DW+TEQGnnzMqwDmoeSua+lj
	cCfvknngPkzEW4gCillGSldsdtEcjUR8EfScgDVdmZ447gQMz4PMRrriAJ85cxWwhQQn3baXKR7
	lB+
X-Received: by 2002:a05:620a:1788:b0:936:df48:d507 with SMTP id af79cd13be357-93bb772d20fmr873622885a.18.1789601968958;
        Wed, 16 Sep 2026 16:39:28 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be7c43bsm38304186d6.23.2026.09.16.16.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 16:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 19:39:27 -0400
Message-Id: <DLH4YA9CBAOR.302OMMH65TVUD@gmail.com>
Cc: <edumazet@google.com>, <ncardwell@google.com>, <kuniyu@google.com>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <willemb@google.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net v2 1/2] net: psp: avoid conflicts with
 skb->decrypted and sk_validate_xmit_skb()
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260915-psp-ktls-fix-v2-1-0eedc3b148ec@gmail.com>
 <178960039456.22033.8739239860645875280@kernel.org>
In-Reply-To: <178960039456.22033.8739239860645875280@kernel.org>

On Wed Sep 16, 2026 at 7:13 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> - [Low] The patch adds a new, user-visible restriction to two already-
>   shipped interfaces without updating Documentation/networking/psp.rst:=
=E2=80=A6
>
> --
>
> net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()
>
> This makes PSP and TCP ULPs mutually exclusive, since PSP and TLS both us=
e
> skb->decrypted and sk->sk_validate_xmit_skb(). A new helper
> sk_has_decrypt_user() is added and checked from both __tcp_set_ulp() and
> psp_sock_assoc_set_rx().
>
>> diff --git a/net/core/sock.c b/net/core/sock.c
>> index fa60b7494c586..9489d9c479493 100644
>> --- a/net/core/sock.c
>> +++ b/net/core/sock.c
>
> [ ... ]
>
>> @@ -2670,6 +2671,12 @@ void sk_setup_caps(struct sock *sk, struct dst_en=
try *dst)
>>  }
>>  EXPORT_SYMBOL_GPL(sk_setup_caps);
>> =20
>> +bool sk_has_decrypt_user(const struct sock *sk)
>> +{
>> +	return psp_sk_assoc(sk) ||
>> +	       (sk_is_inet(sk) && inet_csk_has_ulp(sk)); /* for tls */
>> +}
>> +
>>  /*
>>   *	Simple resource managers for sockets.
>>   */
>> diff --git a/net/ipv4/tcp_ulp.c b/net/ipv4/tcp_ulp.c
>> index 2aa442128630e..b58045df101e5 100644
>> --- a/net/ipv4/tcp_ulp.c
>> +++ b/net/ipv4/tcp_ulp.c
>> @@ -136,6 +136,10 @@ static int __tcp_set_ulp(struct sock *sk, const str=
uct tcp_ulp_ops *ulp_ops)
>>  	if (icsk->icsk_ulp_ops)
>>  		goto out_err;
>> =20
>> +	err =3D -EINVAL;
>> +	if (sk_has_decrypt_user(sk))
>> +		goto out_err;
>> +
>>  	if (sk->sk_socket)
>>  		clear_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
>> =20
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index 1a2a6b7516b0f..e9b53eedf8dba 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>> @@ -143,6 +143,10 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct p=
sp_assoc *pas,
>>  		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
>>  		err =3D -EBUSY;
>>  		goto exit_unlock;
>> +	} else if (sk_has_decrypt_user(sk)) {
>> +		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
>> +		err =3D -EINVAL;
>> +		goto exit_unlock;
>>  	}
>
> [Severity: Low]
> Should Documentation/networking/psp.rst be updated along with this?
>
> Two already-shipped interfaces grow a new failure mode here:
> psp_sock_assoc_set_rx() now returns -EINVAL for the rx-assoc netlink
> command, and __tcp_set_ulp() now returns -EINVAL for
> setsockopt(TCP_ULP).
>
> The "Securing a connection" section enumerates the restrictions of the
> rx-assoc/tx-assoc sequence:
>
> 	PSP encryption is currently only supported for TCP connections.
> 	Rx and Tx keys are allocated separately. First the ``rx-assoc``
> 	Netlink command needs to be issued, specifying a target TCP socket.
>
> but does not mention that a socket with a ULP attached is now rejected.
>
> The "User facing API" section also suggests a TLS-then-PSP bootstrap:
>
> 	The expectation is that higher layer protocols will take care of
> 	protocol and key negotiation. For example one may use TLS key exchange,
> 	announce the PSP capability, and switch to PSP if both endpoints
> 	are PSP-capable.
>
> and "Kernel implementation notes" says PSP "follows the TLS offload more
> closely ... and the use of skb->decrypted", with nothing stating that kTL=
S
> and PSP can no longer share a socket.
>
> One more thing worth spelling out in the docs: the check is not restricte=
d
> to TLS. inet_csk_has_ulp() only tests icsk_ulp_ops, so any registered TCP
> ULP blocks rx-assoc, which is broader than the subject line suggests. The
> commit message explains this is intentional, but nothing in-tree tells
> userspace about it.
>
> The follow-up patch in the series ("selftests: drv-net: psp: test PSP and
> TCP ULP mutual exclusion") adds tests for both directions but does not
> touch Documentation/, so the gap remains at the end of the series.

I can incorporate some changes to psp.rst into a v3 if others think
that improves the quality of this patch and the PSP code. Personally, I
don't think this suggestion is worth while. What this code prevents is
something I would be surprised if a user were to try without heavily
inspecting both the implementations of PSP and TLS ULP first, at which
point I don't know if using up words in this doc is worth it.
