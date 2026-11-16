Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821674;
	b=CPukzMA+KuiuFqDCMW3WB2s9cJBGxJ5Gos4qT8xXzJXv6ddKpCicVUPBR/AFfLjHVkc8
	 Rl8kWkGkGSRmD0sF25nh4+wikm37IQ1xUXlc4SYtgF9FwWlZ8HrDh4KBi0379NkDHRT+P
	 FOhKTV+TcgsFD4OMmOZkOimOIDqKzjIvC0ob2981c9uU9dq3KTSxfuFXkZcXnAM2210fV
	 Nf4RX/huXzNN/RyfRat8C+Pmyh4a7oIZ2H0UX71O/ZdYqCT+AqCwlZ6ifTPDb7ZaP+2/p
	 75unxJNstTkqifXsH+8YWLBpws8pW3W8BRT8mLrmv9wGM+avF/bIBH84RHhFsvJtpVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821674;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-ID:Subject:CC:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=TrkD0cw3aX7X1lANaLv2SmWvcC/2CQFELd2ZO1guTaQ=;
	b=NNZ12RZWAJ4T8lIx1oAbgV+mBXbAgUhJw7Xg1fbNT98WTHrZzJJ8jkH6Sg8eJLm1Yhq9
	 oxXZmqWi3c6mPj5Im4REgZDae2u0DAA62nDUsFw+lioiW+bJuF5sL9Mv0Oc/pfxxj3quH
	 fBPoY/1v3jKHxTOs6GBVB2ppdMf86G2iYabuhdwbhi4z/8mSCG9n/bqt4SQLybZjqoHNC
	 IJKtknB5PGf7MQsVIi54EjDE1Ll4pzX21Yttb3yfPgGqmKcLklkHVs/pmkAaGx0tnqAYt
	 kfeSN/+anH5j0Yj6OxIIyXDVoR/U4EhXjGTs0Z6EJ4VY8Oacq7ry8B+Q9miSGt//m0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=dLLBFODl;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73F4606A332;
	Mon, 16 Nov 2026 09:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B73F4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=dLLBFODl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794821674; x=1826357674;
  h=mime-version:content-transfer-encoding:date:message-id:
   subject:cc:from:to:references:in-reply-to;
  bh=aKjmiXjz7M2QOq1U2bc49xEGYhq3vs14h6SpDSzk4GA=;
  b=dLLBFODluB7jCfQIvQPu+j2JO3e404pFoG1PJ5LIkf+86WeCHbqaGpKv
   kyNIDQXMv0pVHd+x0c+TEOQF6XdKVx26cI0RI18P+jA2GTZvEeVrrZsDj
   g/HjLPGOkyKgrczW7vMAeTUb2p9DCXpUcymvqlTeaeGbXFftMhrBkoVSz
   hFZg0fJKhHUCAGUwPcXIZZ39Melk7S14cvofNDtALGbFZvUymZSqsHG+t
   ATfPv35Ahc/h1pu6rhLg+pvkhDcII77hSlrzU9ZJU4q1uDmT4G3D30V8W
   Z00vZXP3BJCCm4Eo7e1wmrLAI/l10yC9QWhJjKPk/GoOqdx94qKYIeMD8
   w==;
X-CSE-ConnectionGUID: 1A4o37PQS9K1u0/MRL3JCg==
X-CSE-MsgGUID: xkpgRy/vTQ65P1TkhVUpfA==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="233612638"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Nov 2026 02:34:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 16 Nov 2026 02:34:32 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 16 Nov 2026 02:34:31 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Nov 2026 10:34:30 +0100
Message-ID: <DMWJ6KL2KBTD.3IW15M9FBCA4H@microchip.com>
Subject: Re: [PATCH net-next v17 1/4] net: dsa: add tag driver for LAN9645X
CC: <UNGLinuxDriver@microchip.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<horms@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <woojung.huh@microchip.com>, <linux@armlinux.org.uk>,
	<Steen.Hegelund@microchip.com>, <daniel.machon@microchip.com>,
	<geert+renesas@glider.be>, <magnus.damm@gmail.com>, <edumazet@kernel.org>,
	<richardcochran@gmail.com>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
To: <netdev-bot+sashiko@kernel.org>, <jensemil.schulzostergaard@microchip.com>
X-Mailer: aerc 0.21.0
References: <20261111-dsa_lan9645x_switch_driver_base-v17-1-83a471c5bddb@microchip.com> <179476095473.2199510.3725439999561374295@kernel.org>
In-Reply-To: <179476095473.2199510.3725439999561374295@kernel.org>

On Sun Nov 15, 2026 at 5:42 PM CET, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The receive and transmit halves of the LAN9645x tagger
>   disagree about which bridge VLAN protocol they support, and nothing=E2=
=80=A6
>
> --
>
> net: dsa: add tag driver for LAN9645X
>
> This adds a DSA tag driver for the Microchip LAN9645x switch, which uses =
a
> front port as an NPI CPU port. Extraction uses a 16 byte long prefix plus=
 a
> 28 byte IFH, and injection uses the IFH only. On receive, VLAN tags poppe=
d by
> the hardware are restored as hwaccel tags; on transmit, VLAN tags are mov=
ed
> into the IFH.
>
>> diff --git a/net/dsa/tag_lan9645x.c b/net/dsa/tag_lan9645x.c
>> new file mode 100644
>> index 0000000000000..95caf4e0cc663
>> --- /dev/null
>> +++ b/net/dsa/tag_lan9645x.c
>> @@ -0,0 +1,514 @@
>
> [ ... ]
>
>> +static struct sk_buff *lan9645x_xmit_get_vlan_info(struct sk_buff *skb,
>> +						   struct net_device *br,
>> +						   u32 *vlan_tci,
>> +						   u32 *tag_type)
>> +{
>
> [ ... ]
>
>> +	br_vlan_get_proto(br, &proto);
>> +
>> +	*vlan_tci =3D 0;
>> +	if (skb->len >=3D VLAN_ETH_HLEN) {
>> +		if (unlikely(!pskb_may_pull(skb, VLAN_ETH_HLEN))) {
>> +			kfree_skb(skb);
>> +			return NULL;
>> +		}
>> +
>> +		hdr =3D skb_vlan_eth_hdr(skb);
>> +		if (ntohs(hdr->h_vlan_proto) =3D=3D proto &&
>> +		    ntohs(hdr->h_vlan_TCI) & VLAN_VID_MASK) {
>> +			vlan_remove_tag(skb, &tci);
>> +			*vlan_tci =3D tci;
>> +		}
>> +	}
>> +
>> +	*tag_type =3D (proto !=3D ETH_P_8021Q) ? LAN9645X_IFH_TAG_TYPE_S :
>> +					     LAN9645X_IFH_TAG_TYPE_C;
>> +
>> +	return skb;
>> +}
>
> [ ... ]
>
>> +static struct sk_buff *lan9645x_rcv(struct sk_buff *skb,
>> +				    struct net_device *ndev)
>> +{
>
> [ ... ]
>
>> +	if (ifh_gap_len) {
>> +		/* The tag is restored as a C-tag, not as the TAG_TYPE the IFH
>> +		 * reports. The classifier recognizes both TPIDs as VLAN tags,
>> +		 * so an S-tag has already been used for classification by the
>> +		 * time we get here. Restoring it as 802.1AD would make the
>> +		 * bridge push it back into the payload and reclassify the frame
>> +		 * to the port pvid, on a different VID than the one the
>> +		 * hardware forwarded it on.
>> +		 */
>> +		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vlan_tci);
>> +	}
>
> [Severity: Medium]
> Do the transmit and receive paths agree on which bridge vlan_protocol is
> supported?
>
> The commit message says:
>
>   This assumes a bridge vlan_protocol of 802.1Q, which is the only
>   protocol the driver offloads.
>
> lan9645x_xmit_get_vlan_info() does three things:
>
> - It reads the bridge protocol with br_vlan_get_proto().
> - It strips a payload tag whose TPID matches that protocol, and the proto=
col
>   can be 0x88a8.
> - It sets LAN9645X_IFH_TAG_TYPE_S when the protocol is not ETH_P_8021Q.
>
> So the transmit path looks written for 802.1ad bridges. lan9645x_rcv(), o=
n
> the other hand, always restores the popped tag as ETH_P_8021Q.
>
> Does anything enforce the 802.1Q-only assumption?
>
> __br_vlan_set_proto() in net/bridge/br_vlan.c sends
> SWITCHDEV_ATTR_ID_BRIDGE_VLAN_PROTOCOL with SWITCHDEV_F_SKIP_EOPNOTSUPP a=
nd
> ignores -EOPNOTSUPP:
>
> 	err =3D switchdev_port_attr_set(br->dev, &attr, extack);
> 	if (err && err !=3D -EOPNOTSUPP)
> 		return err;
>
> Nothing under net/dsa/ handles that attribute. So it looks like
> "ip link set br0 type bridge vlan_protocol 802.1ad" cannot be vetoed, eve=
n
> after lan9645x ports have joined the bridge.
>
> Here is what would happen on such a bridge:
>
> - Every popped S-tag reaches the bridge as a 0x8100 hwaccel tag.
> - br_allowed_ingress() sees that skb->vlan_proto !=3D br->vlan_proto.
> - It pushes the tag back into the payload as a C-tag that was never on th=
e
>   wire.
> - It classifies the frame to the port pvid, not the VID the hardware used=
.
>
> Meanwhile the transmit path treats S-tags as bridge VLAN tags.
>
> At this point in the series the switch driver has no .port_bridge_join an=
d
> does not program VLAN popping. So dp->bridge is NULL and no tags get popp=
ed.
> The problem would only become reachable once VLAN-aware bridge offload is
> added.
>
> Would it make sense to use one model in both directions? One option is to
> drop the LAN9645X_IFH_TAG_TYPE_S handling on xmit and reject 802.1ad. The
> other is to handle the TPID the same way on transmit and receive.

This asymmetry is intentional. The driver will not support an 802.1ad
bridge, when VLAN and bridge support lands it will reject that procotol
to the extend possible.

On RX we have to restore as 802.1Q. The classifier recognizes both TPIDs
as VLAN tags on every port, so on an 802.1Q bridge an S-tagged frame is
classified to its S-VID before it is extracted. Following the IFH and
restoring the tag as 802.1AD would make the bridge push it back into the
payload and classify the frame to the port pvid, so it would be
terminated on a different VID than the one the hardware forwards it on.
Restoring it as a C-tag keeps the two consistent.

On TX the tagger does what the bridge asks for. It moves the tag of
the bridge vlan_protocol into the IFH and signals its type, and leaves
any other tag in the payload. The rewriter pushes the port tag with the
TPID IFH.TAG_TYPE reports, so always signalling a C-tag would send the
tags of an 802.1ad bridge out as 802.1Q tags, without making 802.1ad
work.

