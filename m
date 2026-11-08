Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794123270;
	b=3QUoE70rJdK9eX2ynsfZhDtqogkWdw6EW8hFPsHS3eyOuCthDyVcyoTF29I59sho4iIG
	 2/OxR/UC7fmXd2ObdTasoYC0KOatfbGo6S+WHiUur1trujdwWszo6UsQPeZ0KpF4rF7EI
	 Fby+AHBOF240bKinNbq4pMLocSSijMfkedE9i+myfOkcM6aLWgyTCMFC1KMNwJUsumxLz
	 UWPa3pzFGFFw/32/KQ+JdJ6K7s7ePPDEf5jjmGuV6yjid1VyLSzv04pVxUppuKNwaZMtR
	 hbVamHE6LLYjycEyjLRNHLqn9yyvl4jbPftbmfN4uSI35w3HVTbHb+xj7q4fCL+qg2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=41tKOvRF+sTxKLm6IqJEUlzlde5+rFfH70eWSIME2wE=;
	b=0RGkeCDb8LRVsZsgL2Vv4SvxuDxcfGl/qYTksM+NIoJ/kPa79gNGR3klAosBxi/wwkOM
	 MNcZto9wK+8clau6EbGJRr49SE1m7FgGpwhmr9SWW15P34V/AI/uzKjso7VWMC47awq1L
	 DTzV8uUR7vX9pK4O7VX7sOyAloKSWU9Jee7LiKY42hAdoJIHYG1BzNKHx5+rtEBM7y9xZ
	 58iTzb3o8fQSqMEb0Rs05raMpu71yQULibTjUfGZSOK5lCF8M5z1c6+OsCP7I7OHcYILS
	 gxAJESyELaD/0wlzRWXD6EDL+Uw0G0dJrfXPbz1Smk8n7iGvpoF6IGOEJo//bYQSD7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LZ3b3B/W";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UA1Yy+XG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D62606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D62606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LZ3b3B/W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UA1Yy+XG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84KGXQ1111324
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 07:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41tKOvRF+sTxKLm6IqJEUlzlde5+rFfH70eWSIME2wE=; b=LZ3b3B/WzloebdiZ
	cVmB9rpuNxLLgDyB2fd0qDSJh2Yx/XTMh4tDywdy4+meaRnSh1P/rNb4WIe8GEde
	/ZvM1Kad8uR8YSOkI8t/kmg6HZCduxRPuCAZT28tbZkcU48S8c/bt+Trji4G3krv
	z0mFXGhOX63aYslM/bnlL/jX0MgqC7kvfPTE8E2v9bCkrGiYGCtFzR5ZLKhSWs7x
	7s0nLoBhEuWK9DVivFiFPE0bc9UDGw66o8t87QV6f3cmPLUyivmeNAh0xgMoyVES
	jgh13UH115SBlV7Fl/ofsCaZtoDnAVyTiBR6Z963BMx4ot/6RnzCrXvDgipUvw0f
	cz+y4A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxajk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:34:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso375882eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794123267; x=1794728067; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41tKOvRF+sTxKLm6IqJEUlzlde5+rFfH70eWSIME2wE=;
        b=UA1Yy+XG0uBbOctonpv5g2nnQNMSQLeRMYQfgRiTCYYPkYuOxO6W85BM0oyh8IRK1w
         JPKEkEFeWXwzWKeRoO/7NT0LmffIvn020b0uH6DJ+QIDdu42hJQxaBG5OWU2VE94CpQ6
         nUweBA7Dc+8EnIsbInTukSvFKz+FRY0kSBUdjoMYHAu9JTXTz5l03GPILsOkQ9bzD3Qz
         PjjPoWIk396AJk0fbRmaW4hRCqvERz9Hah2qNe379z/MSeKqyYrapDNDbWhRJaJ/uKDD
         i7rcoeYSqZh9H1oKKwYClRGbJ2Y9XXo74ry2/KAf9bbHM6Yo/LO9jHjnH78cpGmW1fQn
         3bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794123267; x=1794728067;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41tKOvRF+sTxKLm6IqJEUlzlde5+rFfH70eWSIME2wE=;
        b=Akvc9Q1Is0+Jr8Yqb2cqYOZb6eB+N/mbb773VyrYY8WXUwIzd8r9uxAjn2cS2dTerQ
         ls3Z/GSqJf8evYG8Bt6me3NM6My5BKqqgEgNC65liot+5EXxMYXTt9Vo1r9Shu1DA6ze
         t15Pgo7yunPV4taE06GtVqm4dFC4ps6h1nJq0GRO5bpR7INRvo63uchHrPtYydTeQHlX
         o8vsGvDwmJonpEiK5UxRwLhUVnNC2aXzU2GUrVguoEaFiSULRNIYngVNe+Ysw7d9mWkc
         W40U9+Jmoe5l12nkNWrqj0Xqj0JdbBlJ338mkQkqOeB5hfkCd6FNhxNfG8Qfq+K0nBaa
         cCTw==
X-Forwarded-Encrypted: i=1; AL+hErG4ZPWND/SSrm+J20+WtiEiquEdF48JoS/M9AGAyNlo3GYJQjuST5hMfP6KCPaCuQKE7WWX3s+xCZP2hG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yR8pGJ3Wb/tse/1weTlDmmRVmDgR5BldzJiNWA026XvQthfS0
	G1KGNd+aBPN4JBltXTy7xlMew1WEUr6P15+gneq/sZVxJrj2wjU0e6VQEQ63ca4z/WCkJ2mYxJO
	yBN3SuNKYzX4/8rorJo6EHSykSYTQMR4ij4I//qQiHBkuZfx0FamRyxjtSwQ+8LYngbI=
X-Gm-Gg: AYBFou0wFmbvvl9fjjqG1MFKbHcX1BcnlaG5UqNF8mWDbkVgS00DJzUZCh2wU96YL1o
	PW0+IsnMhLnat5/UaHZ8cjVtlgFKaSsJJJ7vhaaeDYeEqMSnBxOsVtRuKLnAQVd4aaAg+8lGxcE
	riVpFhSqHMaB8SIVxQiTVvKrApWOWnvIX6BIgLjvH4Q1TWpVDKaCu47fcug9Rt33xUdNB5o/59K
	oeCYPGc5bM1IywiHNvVH8IDT8W+mIB0iIbu+Oae1RTsb+WW/4lEo9aqoW2uwAxbI/6wq7xHJMDL
	4l166E5G+WbrEvfnN54JJIKKe/AQJXuwJQu+Dwo3umGC25YLq3cF64+zMjRrwfpvNZ+F0STI7ti
	hBrIzCHCC5zazT+GSaHGOKznoGgBf7gfW0y8pm51YLIY78uBkVFK/kxSu9DCqzeQ3wA/M/45jyQ
	nAP+jnleAQdh/NZENjtJaHJTnTn98Tx3pgWGYCyReOkegBVYu0z1U3T6t0
X-Received: by 2002:a05:701b:2608:b0:169:9f67:a91b with SMTP id a92af1059eb24-1b39fe88842mr1249498c88.12.1794123267100;
        Sat, 07 Nov 2026 23:34:27 -0800 (PST)
X-Received: by 2002:a05:701b:2608:b0:169:9f67:a91b with SMTP id a92af1059eb24-1b39fe88842mr1249468c88.12.1794123266397;
        Sat, 07 Nov 2026 23:34:26 -0800 (PST)
Received: from QCOMk1gASIiYhG (66-33-8-210.colorado.intrepidfiber.us. [66.33.8.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771eccb9sm3368670c88.19.2026.11.07.23.34.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Nov 2026 23:34:25 -0800 (PST)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: =?utf-8?Q?'J=C3=A9r=C3=A9my_Jean'?= <Jeremy.Jean@oss.cyber.gouv.fr>,
        "'Sean Tranchetti'" <sean.tranchetti@oss.qualcomm.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20261101232354.2047804-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20261101232354.2047804-2-Jeremy.Jean@oss.cyber.gouv.fr>
Subject: RE: [PATCH net v2] net: qualcomm: rmnet: avoid stale VND access on TX drop
Date: Sun, 8 Nov 2026 00:34:25 -0700
Message-ID: <000201dd6f53$94a6f000$bdf4d000$@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGXbvonMB2sY51QuIOrd9NlyTj6SLevyKow
Content-Language: en-us
X-Proofpoint-GUID: L-taznRT2EHapIps5X3PoytfK-5loD3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAyOSBTYWx0ZWRfXyGqUiIyWmekZ
 9i302WqubacV+HsDN3R8rhDz9dKFzdweUfm9b8ZZVF7qwbXtbHnecCWBD1Shi/okA2N0RNSUfye
 GMJx7/nYL5PgSckH00cjDjAyl0Dj+sl5Bz1BSbuShRrTRxiTzmfLuQVXWpRm4HRQp/gC9czEkFd
 63SGKbcAtZuLtASna1EMzF8j4hmTEXWan9siDQeWoGzAR4nqAX1OQ/rlWS0WOHF6CjJcXpOL+8r
 0yxBkcBet3k3ZCcf3Wil+44hwumtXHak1jXwxzSdFangbRs1t9+Eojt8OVQ2MhPgsXfMcP4iuEe
 qyrUCTFGC8h7VfSIb4umK7+Qz1osAn8YnJXUjmNO2Vn9yTGtUNXr/RqofKaqVZykfIxP58ZIybz
 2gcVzOkwcbBP9vOMtflk90fRstlYXcCAtFa32YVvZ81Ly3aTTobCsih3WdtMH0VfOUc73J0v3QN
 uk8VkJ2Zde7HXqv/uUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAyOSBTYWx0ZWRfXy/HC7RZRjc8W
 gXPmip7V39lsXOpeQdjL5Xcc1R0Wfm9eIEdOgSo0KkPShN+WqZkOoAf67hQvwlvGX6W+iIDuCnW
 5kv0pfDL88yMoRKe5N++IyYFnTJmyV4=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af02604 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=OltkOWFNRHEXGe+8VJKHzA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N8sgUCSdFvBaQBkwibAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: L-taznRT2EHapIps5X3PoytfK-5loD3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080029

> -----Original Message-----
> From: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> Sent: Sunday, November 1, 2026 4:24 PM
> To: Subash Abhinov Kasiviswanathan
> <subash.a.kasiviswanathan@oss.qualcomm.com>; Sean Tranchetti
> <sean.tranchetti@oss.qualcomm.com>
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; =
J=C3=A9r=C3=A9my Jean
> <Jeremy.Jean@oss.cyber.gouv.fr>; stable@vger.kernel.org
> Subject: [PATCH net v2] net: qualcomm: rmnet: avoid stale VND access =
on TX
> drop
>=20
> A struct rmnet_port stores a pointer to the most recently created =
RMNET VND
> in port->rmnet_dev, but userspace can delete that VND while the port =
still has
> another attached VND. When RMNET later sends a buffered TX skb, a =
failure in
> __skb_linearize() makes rmnet_send_skb() update the drop counter =
through
> that stale pointer, which causes a UAF.
>=20
> The stale pointer can also be used by rmnet_unregister_bridge() when a =
real
> device leaves bridge mode. In that case it is passed to
> netdev_upper_dev_unlink(), which dereferences the freed VND and leaves =
the
> actual bridge adjacency behind.
>=20
> Account TX drops on the lower device and use the current bridge master
> instead of port->rmnet_dev when unlinking. Remove the now useless
> port->rmnet_dev.
>=20
> Fixes: d939b6d30bea ("net: rmnet: fix bridge mode bugs")
> Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets =
aggregation")
> Cc: stable@vger.kernel.org
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>=20
> Changes in v2:
>  - Strengthen the UAF fix following review by Sashiko on the v1
> (https://netdev-
> ai.bots.linux.dev/sashiko/#/patchset/20261031221052.1642262-1-
> Jeremy.Jean%40oss.cyber.gouv.fr)
>=20
> v1: https://lore.kernel.org/all/20261031221052.1642262-1-
> Jeremy.Jean@oss.cyber.gouv.fr/
>=20
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c   | 4 +---
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h   | 1 -
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 5 +----
>  3 files changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> index 61b04c6c0390..fb586514b41d 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> @@ -96,7 +96,6 @@ static void rmnet_unregister_bridge(struct =
rmnet_port
> *port)
>  	if (port->rmnet_mode !=3D RMNET_EPMODE_BRIDGE)
>  		return;
>=20
> -	rmnet_dev =3D port->rmnet_dev;
>  	if (!port->nr_rmnet_devs) {
>  		/* bridge device */
>  		real_dev =3D port->bridge_ep;
> @@ -113,6 +112,7 @@ static void rmnet_unregister_bridge(struct
> rmnet_port *port)
>  		port->rmnet_mode =3D RMNET_EPMODE_VND;
>  	}
>=20
> +	rmnet_dev =3D netdev_master_upper_dev_get(bridge_dev);
>  	netdev_upper_dev_unlink(bridge_dev, rmnet_dev);
>  	rmnet_unregister_real_device(bridge_dev);
>  }
> @@ -163,7 +163,6 @@ static int rmnet_newlink(struct net_device *dev,
>  		goto err2;
>=20
>  	port->rmnet_mode =3D mode;
> -	port->rmnet_dev =3D dev;
>=20
>  	hlist_add_head_rcu(&ep->hlnode, &port->muxed_ep[mux_id]);
>=20
> @@ -487,7 +486,6 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
>  	slave_port =3D rmnet_get_port_rtnl(slave_dev);
>  	slave_port->rmnet_mode =3D RMNET_EPMODE_BRIDGE;
>  	slave_port->bridge_ep =3D real_dev;
> -	slave_port->rmnet_dev =3D rmnet_dev;
>=20
>  	port->rmnet_mode =3D RMNET_EPMODE_BRIDGE;
>  	port->bridge_ep =3D slave_dev;
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
> index 5adda0323dda..26c1d8bccc14 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
> @@ -37,7 +37,6 @@ struct rmnet_port {
>  	u8 rmnet_mode;
>  	struct hlist_head muxed_ep[RMNET_MAX_LOGICAL_EP];
>  	struct net_device *bridge_ep;
> -	struct net_device *rmnet_dev;
>=20
>  	/* Egress aggregation information */
>  	struct rmnet_egress_agg_params egress_agg_params; diff --git
> a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> index 39d6d084e73f..bd68d60b50d3 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
> @@ -543,10 +543,7 @@ static void rmnet_send_skb(struct rmnet_port
> *port, struct sk_buff *skb)  {
>  	if (skb_needs_linearize(skb, port->dev->features)) {
>  		if (unlikely(__skb_linearize(skb))) {
> -			struct rmnet_priv *priv;
> -
> -			priv =3D netdev_priv(port->rmnet_dev);
> -			this_cpu_inc(priv->pcpu_stats->stats.tx_drops);
> +			dev_core_stats_tx_dropped_inc(port->dev);
>  			dev_kfree_skb_any(skb);
>  			return;
>  		}
> --
> 2.47.3

Reviewed-by: Subash Abhinov Kasiviswanathan =
<subash.a.kasiviswanathan@oss.qualcomm.com>

