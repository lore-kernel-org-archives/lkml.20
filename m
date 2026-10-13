Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47136348445
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896307; cv=none; b=NjP/xU2PoXsYI2m2eArmSeLVxzkGuXfMB2NbG8AMACP06CSe5Wsluk5cyyfL5ishshF+HwKa/af1OLUfVlTNtwpfSmNX3JFa6KjcjVekrsVjJBKSzSm8Z85Mqw6tHQXUuVtTq6lhYSEQES2xBdf7hUPo829AE7Hh4G7YVfQ4Dx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896307; c=relaxed/simple;
	bh=nW6EhicHcaTdMrKJ+/qFrulCRQ+C3EnmQeetchv5glo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyae/PThc0hTQT2sk5+5n0LDOEU/VOI5tm/yHzruuNDSJVx/qnei71uPkNsSFs5lawtn96oVU7GyddlZyrHhIsUW7YsrOVpV2SUFNMySv9xa5r3UqYLgr2Fm4Vmg7HM936uBY0wiSsFgLWoRsEKWit5eMKnFQs0ctrj3A58fU6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erkos6L4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYHQF/T/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erkos6L4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYHQF/T/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Y4hV3907372
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFzjd6YbC+KAMyI2VTUeJzof
	NspedIzXsvMGwkc/7Fw=; b=erkos6L4U0XFJ/AouL3SYpm8ldk/5eETa7iYauNr
	eEXlDhHtL5XUALokU7tceMWJ301gYwy9poDac/qJiEB1hcdveykU+yPibrSbR0Fm
	h5OzxjAkvI2Ua4cvVj1kxQBI4mkgSEL2wVjSEfhlPYhrQE5TcmQ79u2D8euELGCw
	lrOdC02dFhY+SZFB8K745Zt+FIGlTHHN3ZKCGGLYfe9aTvX7wYvEf/QSaTYZpbCG
	3bbRF0ruP758Jb5I9/VHnTO5XjXY/aEPveNWpFnFoD1R0in6GxSGHHP3r795O0ob
	INxCknuqzFnpZQE8esHoB8I9fRhPI6Uxxs9hApntbAM8og==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqum95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:58:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106fce784dso77065166d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896304; x=1792501104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mFzjd6YbC+KAMyI2VTUeJzofNspedIzXsvMGwkc/7Fw=;
        b=fYHQF/T/lnDa/tSSG14J33U1E2n6s4BjgSacmWJNqCQAC4pnEepVoO3+bkwt1yjSrl
         xeEZNDHHJBpIgS1E4i3Dc1kKhl93y/OqxN5Lge+MnxH0lWxySBfy87Q6QoVsVTmd8fKl
         l7/b/VGH0ixRHqbX9qLsqXhrGK/ABxQD6+wUFhS5lNh4b945jQWqMxgt6UJ8KiaW5JWL
         dINp5yUhykIxOJb0RqOxD+rRC+a+R2ZXKWeFVLZN7QuhdGat6Qa3CO3aAS9HaQ1v8jT2
         HUC1nyzbQPZBmka3ysKgtLxCOAabx5zONNUikDNEjrgmr0/9BoDiDiNZZ+KWiygeWZkW
         FXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896304; x=1792501104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFzjd6YbC+KAMyI2VTUeJzofNspedIzXsvMGwkc/7Fw=;
        b=f9T9f8DDhV/r+HyA2lEaVJc8sKlHzPWnwLza+rPhRqOYCZxXcALrUUVahTUkRbud82
         Hz6cSWdLo1h3qAfOyEQ/OrnL9/J3SHXVj3lI+XUm4AZZZczXvsrDBBOJODHr+63K93HV
         bRXY/o1TlWEnYxZtMEfV7s27vyR/zpvvn0stUXd4dTgaPNXHYrgChNfU+cxEwlyhF2IW
         Ys7vVxbeXwIH/+uymAS5XT/WYVwxo2K91xyLrBWz47Lr0B46iltncKsr5SfhCYG81vw+
         I2ZR51nPpItMjqpuF6TKSaA2XjWODqjeS/S2BzKmQHaK+IT0HiOG2O3ij04C4w78YtEt
         r6OA==
X-Forwarded-Encrypted: i=1; AKwUvBzzaZD4lSmln/DXRCBL+rmRuafvwfkCtI8JJwrxEi7weBiU5VIyT5vFLR2M0uvXMshoCiIObiOFHy/Z4Fs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDbbsy7p28I/GAWcs9m4Y34XzzxxyYhwCoz4S9MNPN9+B0ILQb
	XFHsyOx9rVWn/4x+b1R5zoQGQvLNqrKqK0ycGrsYKlokb7qm8uwVn+giBXC3FxOWs5XS8wisO0g
	TvSCa4YNR4phNt3apFCZpU9VaxNynPVfAu9NRGxXSItt6qExtHWwqmQ7hFCb73cJbc3A=
X-Gm-Gg: AYBFou0UK6MPzpDCPNcMCHXc/1mFSbzRUzK2zwSrJSnUAaLGgns3P9JDPpDUKDh1TNi
	1VaHPw5uWs3jdau4HpclTbhvVURZb1jWm28VRzN0DbEVironTufAw6cKILQCUrUDHbttwdGN7Ox
	gPQJcvaROFoOWFzHNN2sXYKKd1K7DYmVH9N++9QIX+tRvjQsfn9q+Vc3S2zDtnUEB5GGzSWPUcO
	2e9JOBG2wq/BUqm9/Q9qxzAwuU+sgEOqXou+E8ytYyAQaxW09WJL9fzb6NIZAcTtzfN4xLYKA1o
	hP7ol/b8x2er/yCkjeBIfPRjwyCPc78PFJDJQSzrz6tX+68snuH4oxyt6umaXJzGpz1+vrCcrDg
	Qo5mOxz6KkSX7iA==
X-Received: by 2002:a05:620a:231a:10b0:93e:c12c:9dd1 with SMTP id af79cd13be357-93ec12ca09fmr1279102885a.81.1791896304151;
        Tue, 13 Oct 2026 05:58:24 -0700 (PDT)
X-Received: by 2002:a05:620a:231a:10b0:93e:c12c:9dd1 with SMTP id af79cd13be357-93ec12ca09fmr1279098985a.81.1791896303489;
        Tue, 13 Oct 2026 05:58:23 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5262sm5110268f8f.22.2026.10.13.05.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:58:22 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:58:21 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Toshiaki Makita <toshiaki.makita1@gmail.com>,
        John Fastabend <john.fastabend@gmail.com>,
        Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] veth: clear rx queue hint in veth_xmit
Message-ID: <as4q7ZgxevukdF6B@lore-desk>
References: <20261009040412.14571-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZYiwhR3rWNqnyspi"
Content-Disposition: inline
In-Reply-To: <20261009040412.14571-1-jiayuan.chen@linux.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX5XHMUfZDjJNY
 SKLsmf+n8UCEcJWY4Vtey12Q+H4Ejn7srCUVvbVVRlThPbp3+0J8LUW+K8w6V5cibP02g9DzqK1
 JKf5UzLkA9j+xJWCQ6Otg4gaYmiPAgRaU9LvwQS0yNi/pkOpZLz7rmEJDpm6rnFrL32HDrbppmL
 tdAokac3Ur/kR+JdZUTqqy2u1X9H4x7+mtGeHiRGsce5HyWNHvRp1qomxV3S9x13pwD74hwszP1
 ovegzPUV/+wGwrJLy8ulCHcbiFTxYZPJGic7K3kKE0I0WX0aO4t4lt7ItFFdoZsFF5z4JQ7FlFO
 uAUZbPKYafNmud+gnF8GtftADBqtx8RqyxflVH3GMj7DMg/VSVtnfQCI8WCoU/EAf1J0zN+utLc
 xVl6YGu6v/+NcpuhZAzPI2JmzfN1MMLP+2h7nb5enuRLYCCYjnhuTTUCITPsho0OryhBFdDquX+
 g0jFY5w58XHWCTGbQNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfXz3xjVU1sehdq
 x3A1zc9Gn6h3+JbuT0AZLHe5zzWGKG7wkgR1XiAGGrGIOaP5aYa4yJtQSFP93sG+Rdzucik5I6K
 hgYNS0H4NH73TBCZOur/c9D6FAyRKZs=
X-Proofpoint-ORIG-GUID: GJCNgBUeO1nBq0RNLnlqmCfTs3Dp77Fp
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace2af1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xpCzFD7d2F_Re3rwPKQA:9 a=CjuIK1q_8ugA:10
 a=FLm-uE9K4O1K4dAmY2kA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: GJCNgBUeO1nBq0RNLnlqmCfTs3Dp77Fp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130051

--ZYiwhR3rWNqnyspi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> With more tx queues on one end of a veth pair than rx queues on the
> other, and RPS or generic XDP enabled on the receiving end, we get:
>=20
>     veth1 received packet on queue 2, but number of RX queues is 2
>     WARNING: net/core/dev.c:5212 at get_rps_cpu+0x560/0x1360
>     Call Trace:
>      <TASK>
>      netif_rx_internal+0x1af/0x4c0
>      __netif_rx+0x99/0x350
>      veth_xmit+0x713/0xca0
>      dev_hard_start_xmit+0x166/0x5f0
>      __dev_queue_xmit+0x1797/0x42d0
>      ip_finish_output2+0xa34/0x1f40
>      __ip_finish_output+0x510/0x7e0
>      ip_finish_output+0x2f/0x320
>      ip_output+0x17a/0x3f0
>      ip_send_skb+0x1bc/0x220
>      ......
>=20
> Easy to hit with "ethtool -L veth0 tx 4", "ethtool -L veth1 rx 2",
> rps_cpus set on veth1 and a few flows sent over the pair [1].
>=20
> veth_xmit() uses skb->queue_mapping to pick the peer rq, but never
> clears it before veth_forward_skb(), so the rx side still sees the tx
> queue index. Everything on the rx side that goes through
> skb_get_rx_queue(), like get_rps_cpu() and netif_get_rxqueue() for
> generic XDP, takes it as a recorded rx queue and warns once it is out
> of range.
>=20
> Clear it before handing the skb to the peer:
>=20
> - It is the tx queue index of this device, it says nothing about the
>   rx queue of the peer.
>=20
> - The two sides don't even agree on the encoding. The tx side stores
>   the index as is, the rx side stores index + 1 so that 0 can mean
>   "not recorded". So tx queue k is read back as rx queue k - 1, and
>   tx queue 0 as "not recorded".
>=20
> - Commit 710ad98c363a ("veth: Do not record rx queue hint in
>   veth_xmit") already decided that veth should not pass any queue
>   hint to the peer. There is no tx->rx queue mapping to preserve, so
>   nothing is lost by clearing it.
>=20
> On NETDEV_TX_BUSY the skb goes back to the qdisc, which looks up the
> txq from skb->queue_mapping to decide when to retry, so restore it
> there, next to the existing __skb_push().
>=20
> [1]: https://lore.kernel.org/netdev/156834bb-8e40-496e-9443-9d515fa18eab@=
linux.dev/
>=20
> Fixes: 710ad98c363a ("veth: Do not record rx queue hint in veth_xmit")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> Target net-next since it is moderate.
> Full reproducer, veth1 lives in netns ns1:
>=20
>   ip netns add ns1
>   ip link add veth0 type veth peer name veth1
>   ip link set veth1 netns ns1
>   ethtool -L veth0  tx 4
>   ip netns exec ns1 ethtool -L veth1 rx 2
>   ip netns exec ns1 sh -c  'echo f > /sys/class/net/veth1/queues/rx-0/rps=
_cpus'
>   ip addr add 10.9.9.1/24 dev veth0
>   ip link set veth0 up
>   ip netns exec ns1 ip addr add 10.9.9.2/24 dev veth1
>   ip netns exec ns1 ip link set veth1 up
>   for i in $(seq 200); do echo hi > /dev/udp/10.9.9.2/9999; done
> ---
>  drivers/net/veth.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/net/veth.c b/drivers/net/veth.c
> index 71227d0389aa..7d181c5e387b 100644
> --- a/drivers/net/veth.c
> +++ b/drivers/net/veth.c
> @@ -377,6 +377,9 @@ static netdev_tx_t veth_xmit(struct sk_buff *skb, str=
uct net_device *dev)
> =20
>  	skb_tx_timestamp(skb);
> =20
> +	/* tx queue index of this device, meaningless as rx queue of the peer */
> +	skb_set_queue_mapping(skb, 0);
> +
>  	ret =3D veth_forward_skb(rcv, skb, rq, use_napi);
>  	switch (ret) {
>  	case NET_RX_SUCCESS: /* same as NETDEV_TX_OK */
> @@ -397,6 +400,8 @@ static netdev_tx_t veth_xmit(struct sk_buff *skb, str=
uct net_device *dev)
>  		}
>  		/* Restore Eth hdr pulled by dev_forward_skb/eth_type_trans */
>  		__skb_push(skb, ETH_HLEN);
> +		/* qdisc requeues the skb on the txq it points to */
> +		skb_set_queue_mapping(skb, rxq);
>  		netif_tx_stop_queue(txq);
>  		/* Makes sure NAPI peer consumer runs. Consumer is responsible
>  		 * for starting txq again, until then ndo_start_xmit (this
> --=20
> 2.43.0
>=20
>=20

--ZYiwhR3rWNqnyspi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas4q7QAKCRA6cBh0uS2t
rGZdAQDVS+tfGtzDsf6AQRIRMeVwXBBfUv79N/nDjTXjlDL75gD9HAYHbH399bfM
iVEQrY4yQfzOShcoYiOvTPqavTs40wg=
=kmE9
-----END PGP SIGNATURE-----

--ZYiwhR3rWNqnyspi--
