Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467749;
	b=HPtjU0/rcQPrRudL2/dfNOsICI7aUTPOok6D74cx1qu3AuC+C7s82OsYXw8qCkS21Es/
	 pOoNKyAxrB8tP9BDckA+eeIcu1kBSlpQwlFCoR+6ibNLvZDvWmEnDzCkOTpt8hx1I9yiQ
	 Vw2aA2sAupx5wsem9YAg32y1QgQXaC+/RhGQSgTsdohYiYhngBG5d6Rz6hBcA4T/Shsoq
	 h9pT+fTX3/sSnDpohf+b3ATaGQ+VfeyHYqu4BaIDLvIhtMbowvshF4+zYOdH4oKyea3FT
	 E9Cgn/bfvlc7R7y+1e8VU/QR121YLdJM80sIwtIMx5tyyg9B8NciRn1uTU/eBeC4ayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467749;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=j3lkRXeTopN25W5T7TjypdJfZTaOamQhEp8M9vnpXqE=;
	b=dS+3gepesSFZ+0xXui/v0DR4H54AYvVdzTsUnRYUk3B2Rxoe0ThXau4FE4W1/JRpOmru
	 LNXmaQIvOVxXX0O9Ky3vkN/qNwbQL7tj+LKP/w3YLFFi+iav4AnaWNDh9i8GMOD7WgK6T
	 rgy5ogWW+Z+Wxl9u7jxN9mvjUsxeqks/W1k5csShOwQVT1w5SJ4dzs81UrW0o8eVH31Kq
	 bEcanGyZ22JPG3BM2/5r9Qs/Mq2i3A/klL2Z24OzuxuvACf9nAs4B0ZxfJhS1JLu3z50K
	 H/k3Mpi7CJXYWl8X8jTaByh+eTsH+3x4BFFIIxoDrMqS9TXgmU/ags65aA6JpT1gOaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DtggPLY4;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB66606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB66606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DtggPLY4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UjhC1xevWrnpU/YrXy5BOtjdU/07FY90HOuK9yvSgnA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794467746; v=1; x=1795072546;
 b=DtggPLY4VHJjO0fkxmWtJOs4h7z/RrjlF5ytAOqiGr+vNDZRQY9nKvxmNJyVIbbwFIIvCsjz
 +JN5EM/ORQr7SSROnrxC/q1R/UyKVuhkolAydxYrEiFHSIbviqk0NKVG19q6T8jXd55J5WDLvO2
 hztg7NJgfyG3QKW9FbCDfSTQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 218df4a0f1ad0689;
	Thu, 12 Nov 2026 07:15:46 +0000
X-Mizu-Trace-ID: 218df4a0f1ad0689
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 07:15:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: gang.yan@linux.dev
Message-ID: <a5e30ae63ebb4a71327031211b50b33230e50004@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net 2/2] mptcp: avoid wrapping blackhole timeout
To: "Yingjie Wang" <x-professor@outlook.com>, netdev@vger.kernel.org
Cc: mptcp@lists.linux.dev, linux-kernel@vger.kernel.org, edumazet@kernel.org,
 ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, matttbe@kernel.org,
 martineau@kernel.org, geliang@kernel.org, ycheng@google.com,
 weiwan@google.com, stable@vger.kernel.org
In-Reply-To: <738e11db58137c0082b53fb1662ab0b70763f51a.1794325665.git.x-professor@outlook.com>
References: <cover.1794325665.git.x-professor@outlook.com>
 <738e11db58137c0082b53fb1662ab0b70763f51a.1794325665.git.x-professor@outlook.com>

>=20
>=20mptcp_active_should_disable() calculates the active-disable interval =
as
> multiplier * blackhole_timeout * HZ. Since all operands are 32-bit, a
> large blackhole_timeout can wrap the delay even on 64-bit kernels and
> make active MPTCP available again while the blackhole is still present.
>=20
>=20For example, with HZ=3D1000, a timeout of 6912213 seconds and the max=
imum
> multiplier of 64 should produce 442381632000 jiffies, but the current
> calculation truncates it to 512 jiffies.
>=20
>=20This issue was found using a static analysis tool. A loopback reprodu=
cer
> induced 12 MPTCP blackholes and waited 1.2 seconds before opening anoth=
er
> connection. The unpatched kernel retried MP_CAPABLE, while the patched
> kernel kept MPTCP disabled and used TCP fallback directly. The reproduc=
er
> required neither kernel modifications nor fault injection.
>=20
>=20Compute the interval in u64 and cap it at MAX_JIFFY_OFFSET before add=
ing
> it to the saved timestamp. This preserves the existing exponential
> backoff for representable intervals and prevents large values from
> wrapping into short timeouts.
>=20
>=20Fixes: 27069e7cb3d1 ("mptcp: disable active MPTCP in case of blackhol=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>
> ---
>  net/mptcp/ctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
>=20diff --git a/net/mptcp/ctrl.c b/net/mptcp/ctrl.c
> index 63c5747f0f63..5224cfb3ed1f 100644
> --- a/net/mptcp/ctrl.c
> +++ b/net/mptcp/ctrl.c
> @@ -487,6 +487,7 @@ bool mptcp_active_should_disable(struct sock *ssk)
>  unsigned long timeout;
>  int disable_times;
>  int multiplier;
> + u64 delay;
>=20=20
>=20 pernet =3D mptcp_get_pernet(net);
>  blackhole_timeout =3D READ_ONCE(pernet->blackhole_timeout);
> @@ -503,10 +504,11 @@ bool mptcp_active_should_disable(struct sock *ssk=
)
>=20=20
>=20 /* Limit timeout to max: 2^6 * initial timeout */
>  multiplier =3D 1 << min(disable_times - 1, 6);
> + delay =3D (u64)multiplier * blackhole_timeout * HZ;
>=20=20

Hi=20Yingjie,

Thanks for the patch. Basically LGTM,=20


Just=20two small questions:

>  /* Paired with the WRITE_ONCE() in mptcp_active_disable(). */
>  timeout =3D READ_ONCE(pernet->active_disable_stamp) +
> - multiplier * blackhole_timeout * HZ;
> + min(delay, MAX_JIFFY_OFFSET);

1. AFAICS, on 64bit machine, the largest possible delay is 64 * INT_MAX *=
 HZ, far
less than MAX_JIFFY_OFFSET ((LONG_MAX >> 1) - 1 =3D 2^62 - 2). So is the =
min() intended for the
32-bit machine?=20

2.=20If so, should the comment be updated? Because there is a second time=
out on 32-bit machine.


Thanks
Gang

Reviewed-by: Gang Yan <yangang@kylinos.cn>

>=20=20
>=20 return time_before(jiffies, timeout);
>  }
> --=20
>=202.43.0
>
