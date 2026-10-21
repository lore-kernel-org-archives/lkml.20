Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612951;
	b=hlNPjnziscfHN0HtsauZSd2WGyl/FMlKE+ltn63C8onilrJ6u/LUbEp0pc4W0i0gRgFU
	 kQqZ466HuVBe2Eno53A4Ceb4mFEF/9YNFB6mbAepfttb/Lf+z/QJcDQ4COr4cyxpjzT1Y
	 VNVLZDaB9DLL7lRIUqH0hkD8mQ4A5O2+OCK1G5N2Bsw/d4rWk2TSrXESWlHGd4YNnDznN
	 IqVOzCaT6ZghXvWl51gyH7l0pfZsldLFIWSOLMEy6kogZAsXQdJfo/B0KDW2i3Dd4cp1/
	 xNqV4+IO/f253k5z5U4VBWpx+jXQAU6hEVJmwM/27ShyiZhodJOnNpqyj7ccGnHiAjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612951;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ZPDN9BexYqJgQl45SdfU9meWuyazsqHXMxCiEWebsmU=;
	b=Vo1rnwt27bgo90wrh3ZwiRZFt9CbwCh1J68G1rCYeeGz07Gaf30QelXBadhaxg285ouS
	 0Ih4ZBgVmN16fweNj4UJnVB/IYdxKJjYHmv6hoJ8iACrJUfmefxH97odIn/QuO5JCLy9j
	 W8xg0yXQcK3Wp6E0GgTY9+a64///VsLWm18gqOeKZwLzSqYyWgJl6D1negyYO0AnDE4rS
	 B+ed0+VA0biYsN5AuPWAQzmsH902X7X500DduuuqctWdXZn3o7hV4LMgP6O7vcOtwR1K3
	 MNa5QJgXmuumwiF9176wNeTQTzA9kE+7IGI3RNYYdc5A5w5/YWTTAH3IEy1CAlhJZ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L0BKTk6K;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UjJox1PV;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80CE606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80CE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L0BKTk6K;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UjJox1PV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792612950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPDN9BexYqJgQl45SdfU9meWuyazsqHXMxCiEWebsmU=;
	b=L0BKTk6K5VUOFPQunkh040Zw86pJfSifQcWiZss78OKTgLGjZDtBs7Apm27jnjEGXn7uaB
	B0eMhlwqRd70wuWU9chlZJdZVesudeqWFcJkh1YDrtGsOXuoHlSWSGEFCRPF6Oh4+Smuvv
	P0OKDSymqwrpnG626918wcT2gyc0Qf0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-JxvnfnOFPIigQAMxGunjyw-1; Wed, 21 Oct 2026 20:02:28 +0000
X-MC-Unique: JxvnfnOFPIigQAMxGunjyw-1
X-Mimecast-MFC-AGG-ID: JxvnfnOFPIigQAMxGunjyw_1792612947
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b02d63407so702808f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792612947; x=1793217747; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPDN9BexYqJgQl45SdfU9meWuyazsqHXMxCiEWebsmU=;
        b=UjJox1PV3vRCck/ghKbgtwmVLGA1Q+GcnLL03CwW+0LDXjxRO490mF887lIG0gI3hh
         xPOCF4ugAtCv2VAmJDVTfUx5JY6IB7n51WUhStnzTyFlYj8f8nCZxSUz0/dj+/+j+9Bi
         D6U1P54Fi/25f/ECZBtRgIlPB8YcB5eMTlhL3SSzr04BhDovwZrwiqhTkzJTEWZljp3F
         fOU3AJq/xDwjth2LRZ/AlkGZDv93gEIYBYXvJRVrrnS5bLnm3ApPeytsCB8I1O1dqwua
         L77s99sCt+kGHExOg7QXPgm2I35s0uVwDp1mC1nSqNhsHqdHgrw3kbJlfThtWuK1F5DE
         ZjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792612947; x=1793217747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZPDN9BexYqJgQl45SdfU9meWuyazsqHXMxCiEWebsmU=;
        b=anrJrttOLrJ7XOZ1coixcqxRyiim3c9pqfHqFAeCHxLS767V9aXA7e2hdK4su+friA
         WnEZke0cOm+/Ix7i8l3eJz/MJ5WAYlJq27UzGyUknoxmnnUjZLmsY4MtX8fb6R9z+Adb
         9Uip44bAeNG7kkGm0REwCLGobPpn9B4cw2vklPOrynRIqA1buvgBDsuFhKgWTxg99Tw3
         YvD59suL0KXqn+8YukZgRt0lSxe+rilsDh4OS0SWlW9G5LwqP4alZXpjQDTxUQhfx/LI
         GFtKHAFIQ/CKzGXNfU30iSm69JPaOcXlXvVrAMICr86VGG6JifNY0rH77k1uoWpu6U4O
         KHhA==
X-Forwarded-Encrypted: i=1; AKwUvBwVef5/BRR75cctLtNeVpSPXe32cFbN2WIu6dC1T+ZmITH9iC+Vhb9rMuv+czoXH7+rQWl4onGETV7qBg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8NUW7mOvj0j0lq5BLDO3ZNRt+rsAE/gSSOf26Fs6DFECwjaQp
	LQw5o0B0S1BwnjygYE4+b9Fb/cB9q9wOf3ORv04wzJDMF2ME5P6GZ3fp3DRI6lVMNl/DjqBJ4u+
	NqHg4oX0ejsIUWhgLJhVJGEoK3O9IIlTw1yMYDKIrcWBjjfIwz1e9KbzO7hE8PImpjg==
X-Gm-Gg: AYBFou0/eIvhbzrDJQLFCq8ZcYIsU8d1xbtDhSW7bRF7B6p3DQHVcHvSRnMnbeegdbp
	sGTh+c9LHG6CLlQn8npLfioj0+ojOQu+cwJFNn0nQsuLGIaiP9HcivjYBesB5S7ujAPmWhebSc3
	ZH7tGsToJBmn4xrkI9QcFuV8Wfi1RNGFZdfyHHKfL0Ro0uRVtM021Er6i9ldi6AJZfJLSHFY+lp
	S6iNJYq7P1DJ1eyHHP3N92aiMUkem8KcHLBiMTxkmiXSqjR7SFsOcybVGs5mKV8nY6Tezsv6//z
	BJ9No8aVpwTEtAcDIAh4B4Cd4lfRJQdWBK+grEwCGIHte579fZVlDq1VdVXGTk3kFFc=
X-Received: by 2002:a05:6000:2901:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-48e2642e9aemr6954061f8f.3.1792612946255;
        Wed, 21 Oct 2026 13:02:26 -0700 (PDT)
X-Received: by 2002:a05:6000:2901:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-48e2642e9aemr6953990f8f.3.1792612945553;
        Wed, 21 Oct 2026 13:02:25 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f15esm8122007f8f.20.2026.10.21.13.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:02:24 -0700 (PDT)
Date: Wed, 21 Oct 2026 16:02:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Nick Simpson <nick.simo@gmail.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Sridhar Samudrala <sri@us.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 3/3] ipv6: validate checksum_start before fragmenting
Message-ID: <20261021155431-mutt-send-email-mst@kernel.org>
References: <20261021180329.26358-1-nick.simo@gmail.com>
 <20261021180329.26358-4-nick.simo@gmail.com>
 <CAL4Wiiq6Jy1XPtkrA-Ge2N+voJrE86DWPJp_jXwHJG3ZgMvPaQ@mail.gmail.com>
 <CAL4WiirCmk_rZBhaXmmgHSHiUjeBSt5hPoRn6Q+AXUGYVNXRaA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL4WiirCmk_rZBhaXmmgHSHiUjeBSt5hPoRn6Q+AXUGYVNXRaA@mail.gmail.com>

On Wed, Oct 21, 2026 at 08:47:40PM +0200, Eric Dumazet wrote:
> Le mer. 21 oct. 2026 à 20:20, Eric Dumazet <edumazet@kernel.org> a écrit :
> >
> > Le mer. 21 oct. 2026 à 20:05, Nick Simpson <nick.simo@gmail.com> a écrit :
> > >
> > > ip6_fragment() and br_ip6_fragment() complete CHECKSUM_PARTIAL skbs with
> > > skb_checksum_help() without checking where csum_start points. After
> > > reassembly by nf_defrag_ipv6, the IPv6 header has moved forward by the
> > > 8 bytes of the fragment header while csum_start has not, so a
> > > CHECKSUM_PARTIAL skb from an untrusted source (tun/tap or packet sockets
> > > with a virtio_net_hdr, or AF_XDP TX metadata) can have csum_start inside
> > > the IPv6 header, and the checksum is then written into a header that the
> > > forward hook has already accepted. When csum_start lies before the
> > > network header, skb_checksum_help() warns.
> > >
> > > Add the IPv6 counterpart of ip_check_csum_start() from
> > > commit 6785011f8b16 ("ipv4: validate checksum_start before completing
> > > checksum") to the two IPv6 fragmentation paths: refuse to complete a
> > > checksum that starts inside the unfragmentable part of the packet (the
> > > IPv6 header and the extension headers before the fragment header) and
> > > drop the packet instead.
> > >
> > > For IPv4, ip_check_csum_start() is also called from nfnetlink_queue,
> > > xt_CHECKSUM and xfrm_output; their IPv6 counterparts are not changed
> > > here. A reassembled packet that is not fragmented again, such as an
> > > atomic fragment, and an unfragmented packet whose checksum is completed
> > > at egress are not covered either; those have to be handled where the
> > > CHECKSUM_PARTIAL skb is created, or by a check at reassembly time.
> >
> > Then let's do that, instead of adding checks to every consumer.
> >
> > A CHECKSUM_PARTIAL fragment is meaningless: the L4 checksum covers the
> > whole datagram, and our own stack completes it before fragmenting
> > (ip_do_fragment(), ip6_fragment()). Only untrusted injectors produce
> > them. Yet inet_frag_reasm_finish() keeps the reassembled skb
> > CHECKSUM_PARTIAL when all fragments are.
> >
> > Downgrading CHECKSUM_PARTIAL to CHECKSUM_NONE in inet_frag_reasm_finish()
> > covers IPv4, IPv6, nf_defrag_ipv6 (and the bridge path) in one place;
> > the bogus L4 checksum is then verified and the packet dropped.
> >
> >
> 
> Scratch that suggestion, it would be one more consumer-side check.
> 
> The fix belongs where CHECKSUM_PARTIAL skbs are created, and Michael
> is already doing this for virtio_net_hdr sources (tun, tap, packet
> sockets, virtio_net):
> 
> https://lore.kernel.org/netdev/cover.1792411304.git.mst@redhat.com/
> 
> In particular "net: resolve uncommon partial checksums at ingress":
> https://lore.kernel.org/netdev/9c08d12b3a7819ae03ded6a154e4f908276e93d4.1792411304.git.mst@redhat.com/
> CHECKSUM_PARTIAL is only kept when csum_start/csum_offset match a
> parsed TCP or UDP header, and fragments are explicitly refused
> (ip_is_fragment(), IP6_FH_F_FRAG): their checksum is completed at
> ingress, before any protocol processing.
> 
> Your patch 1/3 applies the same rule to AF_XDP copy mode, and already
> links to Michael's patch.

Oh great, AF_XDP. Another one no one noticed.

> With both, no untrusted source can feed a CHECKSUM_PARTIAL fragment
> to reassembly, nor an unfragmented packet with a bogus csum_start, so
> neither this patch nor a reassembly change is needed.
> 
> Once the ingress validation is merged, the ip_check_csum_start() calls
> added by commit 6785011f8b16 can be removed as well.

I think this would be a mistake. While plugging all places where some
packet change can confuse the stack is hard, making at least sure
there's no slab oob if we missed one is a no brainer imho: this is the
extent of the overhead:


        if (unlikely(skb->csum_start < skb->network_header + ip_hdrlen(skb)))
                return -EINVAL;
        return 0;

I will be frank, messing up one of the subtle checks we are adding in
virtio_net_hdr_from_skb is *trivially easy*. It is getting them right
that is hard. Can we pretty please get help in not turning every such
mistake into a publicity stunt with most major cloud vendors affected by
guest driven host code execution?

I know, we should write less bugs (
Still, you guys are the net maintainers.

-- 
MST

