Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592230;
	b=PwcixgR+DvyMb0KSipAruid+KlDPkHbJzItYq31ualzlJiTiLWMMYFeQ0Gf3tYlbd5C0
	 ZpAtz03hQeneYi584IuRNUoKLBLIEfO+BCizs+TeYkchoxffe9dfXmGnutoHLzKNzmcy1
	 EqAs/er8UviCV2hTZCaLEHxBI7qhbU40TiVeJDnQSoh5A54NOvgKrtmfhOcA8f9ai9jRR
	 1kQAqs8YHLdwBBiLUG/9zS8cc9oHySYeRcFDxrzF+vRm2r3IzkIfwdLwH2MHh/nRaXfLh
	 QA80DMbni14b5KQQn4D4mpNjrJoz617UI+7azVeoaRmntCUd6hx8vZQVjisiJ7G/DEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xux5QvP8YQiJThcV5md5s9PvW9xG2SSFmNPqLeHDz08=;
	b=Jn2KcYkBLFQ6KCKXJwnuxExtfCcChzWzRo169cL9T65eBqmsrmxFoMcFGewGU/Wq4db5
	 vdL7HA3b7TMhCVnfuFf1tMLOF6KbffngNhfylvQJLRz78QERqcWgvWPAKa2xEe167uQ3a
	 /Fzr3TpNTJEaYWvChwwhS4TyBcbXrucFfTat2HNdtMf4C8slrSpcUEyd2KvVctIrXxjPk
	 j0TwyleFg8rjbx+wf/J6gYpW50dUCS4jwrrrD9qdm9NVAa+LBoWIFEaKqK77qGmW7YOIA
	 MEG/yIBbE9EcBvyDeSGGypRZ1AX6wCZJgyTbQdCYywjsk1WIQpOhctFZitEr7NgKX6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gNWJHZqQ;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E98606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gNWJHZqQ
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9903fde8db8so195444241.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592229; x=1793197029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xux5QvP8YQiJThcV5md5s9PvW9xG2SSFmNPqLeHDz08=;
        b=gNWJHZqQx3qCS1zclS/OkzpS4j5ftJqazpq0h00CbnAZA9rykG2MV3eBtvT8Xjnozt
         p1xDkCivcaKKddL3R0QKnHA7lBSjLSGBgQsWq7r8V4Olx8yC5dUz7aowcryQnld4gxRY
         iIuc3mNUpb6dEuvoCqnrmpv54SkZ7kGaqiIXk3JhNUl8tnxnVxtmgB8wgJdJ5sO68GFr
         x69RSnCQSdgO14LZopyxsnlcf/wPEpYtpFrAUsBM3bEipzL9SHHApHjDIPh1/LrDqKln
         ifjWE5pWhDOBrrDxC6f2/M8PvQCvM5I/41bRyYp3NEK8OmeuOL3K5hX+8b+soN0XAJQR
         LprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592229; x=1793197029;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xux5QvP8YQiJThcV5md5s9PvW9xG2SSFmNPqLeHDz08=;
        b=x7nvXrVSgAW8fzBvbwl15PqSdfrKRbj3mM7ghx41qom/g3wOiYTgRXTZ3fpJpSYbVp
         SMZTrO3cw4YN2KCu/oUP8VPzbdRd/eQG++J1C2BjOVKTHkbNELoY1STADJsmiBmvXdlY
         jHmB1amEiDR8upZ2ed79EO6NvOq3bhBkhwPTnBaarVSnQDnfQeW1XyI/DcMRFEHNuAfd
         LVbR1W0vYheqOza976B28Nyf15XJ6M3hgc1kzBUgmlQkBsj/w12IRlV1eB6uycGq8NJq
         4kKJ2/0SKD4OUP4mYYrk2LJOZ5FKAfvswltvmnucuzNDhjI3NMFbPQ6pmxhxWIclptqk
         fn/g==
X-Gm-Message-State: AFq9FYKyfOCeZExbnHoskuN2l//JRltbkq/0kb8/AnBmHo35QJfL/lGJ
	ZS+AkOPJWvLm9RYF25tLq8iGCM5AAzV9NoKTR1Xv15TfbRxbdYOfx6ue
X-Gm-Gg: AYBFou0ft1/PzlFqm+Lj+heeCJq8/BgN/q6qJ91ELPJdc1v8iF15rhzQ3Gbk0mzEuml
	HJ/Fv4XXPui8FuAToVGSufXLtF/cz4XfrMo0liqAL+sG+APz1tqYqo7Df12OEMsRqOkqXEBViLx
	8C+x+bUDwUKwDU8ZhTshlUvbPEqY88jff+l0OLVLUjmsQHJPktvBHy0SsVkxUEEgXS0bTeTltpJ
	+8PEHFWq62OybVVL1xjEVYxwAop7eqnj5TLxNiTa79NsWuWGR+FEGnRbi+uSqcvjUs5F7DCBDq9
	U8WZBskktf6XeTPpQXdW+vqjmq0I7Xz4xyV2JgPXyhZ7BolTMaOYlxOqk0ua9Kzptlt9UMXEITI
	CEafPCS/EvG/sJbU5l6EPrp0w35Ht+QK8xCqPWi8T8xVMntzrhDOCX4tMxoNoDhZlG/CT+XJWnJ
	JtyC+CIFc7IuNYnIl0FWIPogUExBMSvdDwoM2tN6OpqRnNsb0/TuxgUXeH9oR2NpdNQCQvRMsXd
	LtqLvcrYKQuTxyBb0kHqc8FyoEkIju+SN83qpZwDlZ5IPbj76539uw3bYcfVnsCE7UFAIr5jI5h
	d4iZFIgHV7elOaQyCBzKeLxXgmxr632R3G9jL2wiaL1I5Ij5PqleseUcx22QKQCYPZY3JSLkVJz
	sfu4ayfZAWVegcInv9fM=
X-Received: by 2002:a05:6122:e145:b0:5ea:e197:43ee with SMTP id 71dfb90a1353d-5eaebe9cb1emr809668e0c.19.1792592229260;
        Wed, 21 Oct 2026 07:17:09 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae969803dsm3503712e0c.2.2026.10.21.07.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:17:08 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:17:07 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Paulos Yibelo <habte.yibelo@gmail.com>
Message-ID: <willemdebruijn.kernel.37619d32a8f3c@gmail.com>
In-Reply-To: <20261021035050-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <9c08d12b3a7819ae03ded6a154e4f908276e93d4.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.2eb449439b094@gmail.com>
 <20261020170908-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.1da723f98c23a@gmail.com>
 <20261021035050-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH net v3 5/8] net: resolve uncommon partial checksums at
 ingress
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
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Michael S. Tsirkin wrote:
> On Tue, Oct 20, 2026 at 08:05:29PM -0400, Willem de Bruijn wrote:
> > Michael S. Tsirkin wrote:
> > > On Tue, Oct 20, 2026 at 03:44:35PM -0400, Willem de Bruijn wrote:
> > > > > +/* Walk the L3 header at @nhoff: where does its transport head=
er
> > > > > + * start, and which protocol is it?  Returns false if the head=
er
> > > > > + * is truncated, malformed or fragmented.
> > > > > + */
> > > > > +static inline bool
> > > > > +virtio_net_l4_start(struct sk_buff *skb, unsigned int nhoff, _=
_be16 proto,
> > > > > +		    unsigned int *thoff, int *ip_proto)
> > > > > +{
> > > > > +	if (proto =3D=3D htons(ETH_P_IP)) {
> > > > > +		const struct iphdr *iph =3D virtio_net_ip4_parse(skb, nhoff,=
 thoff);
> > > > > +
> > > > > +		if (!iph || ip_is_fragment(iph))
> > > > > +			return false;
> > > > > +		*ip_proto =3D iph->protocol;
> > > > > +		return true;
> > > > > +	}
> > > > > +
> > > > > +	if (proto =3D=3D htons(ETH_P_IPV6)) {
> > > > > +		const struct ipv6hdr *iph;
> > > > > +		int flags =3D 0;
> > > > > +
> > > > > +		if (!pskb_may_pull(skb, nhoff + sizeof(*iph)))
> > > > > +			return false;
> > > > > +		iph =3D (const void *)(skb->data + nhoff);
> > > > > +		if (iph->version !=3D 6)
> > > > > +			return false;
> > > > > +		*thoff =3D nhoff + sizeof(*iph);
> > > > > +		*ip_proto =3D iph->nexthdr;
> > > > > +		if (*ip_proto !=3D IPPROTO_TCP && *ip_proto !=3D IPPROTO_UDP=
) {
> > > > > +			*thoff =3D nhoff;
> > > > > +			*ip_proto =3D ipv6_find_hdr(skb, thoff, -1, NULL,
> > > > > +						  &flags);
> > > > > +			if (*ip_proto < 0 || flags & IP6_FH_F_FRAG)
> > > > > +				return false;
> > > > > +		}
> > > > > +		return true;
> > > > > +	}
> > > > > +
> > > > > +	return false;
> > > > > +}
> > > > =

> > > > for all this parsing: could we use flow dissection, like the
> > > > !VIRTIO_NET_HDR_F_NEEDS_CSUM case?
> > > =

> > > Hmm I don't see how.  That one trusts the caller's protocol and net=
work
> > > header. We could parse L2 ourselves and use the dissector for L3+. =
But
> > > it stops at whatever it does not know, and every miss would turn in=
to a
> > > drop or a software checksum for a packet the stack delivers fine.  =
Our
> > > parser deliberately covers everything the stack can deliver.
> > =

> > You're right, the protocol and network offset need to be parsed
> > manually. After that it could be passed to the flow dissector.
> =

> I posted v4 with the custom parser, since i had it tested. Let's do
> cleanups on top? I spent too much time on this, to be frank.

Yes, as a matter of fact, on investigating this approach in more
detail, I agree that flow dissection is a worse choice.

> Hmm, an interesting trick, but I don't see how this works for tunnels?
> We need to dissect at inner_nh, and on success we can not leave
> network_header there - the packet continues to outer IP processing.
> I fear making all this work will be more code than the parsing it
> replaces.

On the upsides, quoting an LLM:

"
  Using the flow dissector replaces all of virtio_net_ip4_parse(), virtio=
_net_l3_start(), virtio_net_l4_start(), and
  virtio_net_csum_partial_ok_at_offset() with two compact functions:

   Function                                 |              Lines of Code =
              | Description
  ------------------------------------------|----------------------------=
--------------|-----------------------------------------------------
   virtio_net_setup_l3_input()              |                ~28 lines   =
              | Anchors L2 framing (eth_header_ops vs raw L3)
   virtio_net_csum_partial_ok()             |                ~42 lines   =
              | Runs flow dissector and validates thoff/csum_offset
   virtio_net_tnl_offsets_ok()              |                 ~8 lines   =
              | Reuses outer dissection keys for tunnel validation
   Total dedicated parsing code             |                ~78 lines   =
              |
  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
  ### Summary of Differences

  =E2=80=A2 Net Code Reduction: ~103 fewer lines of C code added to virti=
o_net.h (~57% reduction in new parsing code).
  =E2=80=A2 Eliminated Series Dependencies: Patch 7/8 (net: add ip4_parse=
()) is completely eliminated, reducing the patch series by an entire patc=
h.
  =E2=80=A2 Deduplication: The existing non-checksum GSO validation in __=
virtio_net_hdr_to_skb() (lines 120=E2=80=93146, 27 lines) already calls
  skb_flow_dissect_flow_keys_basic(); sharing virtio_net_setup_l3_input()=
 consolidates both paths onto a single ingress dissection mechanism.
"

I particularly like that we use the same for NEEDS_CSUM and !NEEDS_CSUM.
Also the lack of code duplication.

But, the goal of this patch is to minimize overhead in the hot path of
standard TCP/IP and UDP code. And flow dissection is significantly more
expensive that open coding those specific checks.
