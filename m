Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F46E374A0A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508470; cv=pass; b=SvoKP8D+uPqwuIkMTh/iIi9jNJHsEUA4x22bQMH8bzS9rP5qm4nGmAX/sV4Dy+bsAHZu19oMHEkn9H91iI9XfJw9lZOicqy2SxegH+AZY3HyMmqRReVV+VlenokeG2H+VkU6aWGEXnaAUal7zBLHBcG+BAgtELnp1qWlzzUrEgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508470; c=relaxed/simple;
	bh=TQRGBrrDXcmDIzvEBw2UOVN7uPX1DaJFuWM/UhCsOCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmmdQoR30QtvZ5qGw2aAFvEczr2pKeYsHEkjJ+brcNCm7U9vczQMn8a4WjQ79IfUDZxzN7Sb8Ay2JOasYSWbi8N1Nuka+vDLaMAaXqWmfjEBbswQKAuAwUz6IrHuPs5opbRy0eDGMGW/J6ESztR3l/IkTuC/Kas6Iz6C2wxWf5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q6epJbrz; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q6epJbrz"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9deeso2444981cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508468; cv=none;
        d=google.com; s=arc-20260327;
        b=FtrQjC1S/69fAAPaRHeNgjuOcAXxms3iiZcR93g6Lw7bc/hIT4R/v5ARUHsxAwz4kV
         cyiUnF8h8/GDsJwDvilm67VWIcfnMTCX82tWAQEXtASnwZYTFJmDY6g/lgSLAxhORjJs
         Zzrv/XP+95ESIvt+I+Fw8QorDdMFKuOrKnaXrDqfREHcDA55mW1KFQdVMzn73eH/UWVC
         xP1XBHxH04bzRXS3BWn0Z7DxhB1HmXsiKSbtMK2MQXRJ9KxtTjBI02hEHlW9ODdVDIO+
         /Q04iBrST6KaR03SA13sd0N9zuOmqndEWXvYPdnWiwJq27n1pgaXsTbudVt9ABDe8ly6
         Kn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYh/6i1QA2nX7JSpaFmJOLlBXi3crvLXfZ91g38PHCk=;
        fh=Z/C2NMEuHlKsqgNj/B8f/SX/FTdAhEAphLFg0ro0zzE=;
        b=rDx0hTkEncHhqg1uNWeBXx728jOaKMMc0LE150vb7VPRe6AsoAJkTwTNVl3E/sOD5k
         S3Tyb/7D5EaNYJ4qR7lNx4H3dSFW/dYnWRSSBDKdH5tP7wCds8c6hFdfAeS/D2jJ41YB
         JPBterFWVogweUYIEb4wnSvwcZHCdtyuOc624E+dd4/Lq2QvQFkZnFyx98dyPs86k9co
         YiRGahq7jbRjdKPvRcFXX7xgeAkqWSwJgZf7kux6Xscdg0HKLSIk4x9VyX8y5e5bzxtP
         V01/s6B2zDzb1Hjlykb6GFqfA7cpa0pZ37leINHZQcoFTI+a15Syif74o1SSOyuPf70C
         t+rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789508468; x=1790113268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYh/6i1QA2nX7JSpaFmJOLlBXi3crvLXfZ91g38PHCk=;
        b=q6epJbrzKAr9h5U3XYJ43GUquH2ItqBdiYblt/gtLwzD2etHxH3LzdKAGPJA69ST8j
         4Undrbb2kjxSpjqX6Eq+1Azi6TBhBovshA8koJg4FXSfHjxtbSDx5prGVq7yVINsFJN1
         q6AKp7QrAkVODobKAKzcLR9QsrT4xbPDKXrO9/SUwu6MO9AA9QGHJz6lOH8OmJRw4GNb
         5uFQWBMei9DMuL13wRrTmOFGbdidt20t9dMeV1zy4QvaMtCZ2grkzjjzYfAbSAf5diZP
         bTyRhiaoVqy4eiZIJv/MBnBys4hM5nNPDG1dxkg/HHSl5VY4++w3pYJQOQUh6BEOiCSg
         tTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508468; x=1790113268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYh/6i1QA2nX7JSpaFmJOLlBXi3crvLXfZ91g38PHCk=;
        b=r/DAOz8eProx1LdwKIOdEfJywKyawAMChI9maQhlPGWyivKGleOc+oVLiq1F1MV/1q
         tTD2vW2v6xOJB3fD14Lw77kUAvTuTn/JItkSM2+vef/Pp8j+Uv5igQhBrk9EiuxmVstk
         gzAFkimkYRb/ngSz/Aqr3JFZVphV2G8x72k1ljvZuTKN+2BaXmuPE0WLsHIPsGkS6ssf
         prqsdn+VJpLvKTckXG2P9YEBx2LLfdmFuzPARxHueRHEBLkg05s6x9W4wl1+6E9cpldH
         fDz+jsX1bNGo6eIfZuP+f4Zfh7OyAIADU3bHbp1gfau7g7HbNbKho52QasbBIA0UL2UB
         p2aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzptN9VyrrB8uvrU33khMxqQ2C/EXZx8ZfAdr8VXt7wgjCEzEXr2NMx6XZq5V3+jL3Aoh3IrvV3vfbMUQY=@vger.kernel.org
X-Gm-Message-State: AFuF++nCosl7UqqLGKrvpLgmKVJWmyQ/XdsWhywt/5qYo5w/OLRhh+lr
	/ehgvE7lAbjToJc5OOpIx1JuG25vkeF2KpM6aaKthNO85Z4GqTI79GNADefDqwuFpNdyxdpM24E
	CSMBM+qvYSWfVsi+yjvRc9AV9I68IcZWcoWAUHKvh
X-Gm-Gg: AYBFou1zQ+7osNN0SJETo0jpKqgkIOF3rGT/DgCvrOAEtFw0LqZZh2p1Zy4ZJ+jeeBo
	JYPCl2iKLffrGrsBvj4vU+FqIJMBpjOsNrDs8vQxLgbjCZIWT69ugURfxApsf9tkFOdklCtMX1+
	e8dpOduRTE7sGhldBxw2EsvHTvjUbsoakypdVxtCUN2Xs/dlhPGXZfWrOeFR59vuJwWymE/WexU
	fBBpdywK6dGOQkRWjfuOoLi4pv4GTjjF+Wnbq4hYlMDEy2s2xDX8o9aCUX8ZFDWikMA4aW2SUhY
	U1nX76uCr5T3BVsmlalt72QMovdTAXMJqory/32mgwIDBnbqzqJBZjbL137hkRGtNl0JpO42s1o
	kXXyJKr/HvU8ElJ1yLQLW4U/X9hjkf0Ruzj5vyeZMV0MLko7pZryNGiB2zwAudstols6xC9zDog
	20fywurnEtJGVrhJjryHiJlmwgCPaQQYg=
X-Received: by 2002:a05:622a:4811:b0:530:f75a:5ca1 with SMTP id
 d75a77b69052e-5327f26256emr1796801cf.25.1789508467689; Tue, 15 Sep 2026
 14:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <114FAFBD-F7BC-46AE-AF9F-0D15124F130E@doyensec.com> <de0fd2e5-8509-406c-9f92-cb644c42229d@ovn.org>
In-Reply-To: <de0fd2e5-8509-406c-9f92-cb644c42229d@ovn.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 15 Sep 2026 14:40:56 -0700
X-Gm-Features: AcwNN1UDwoPPJIYobKlWbkakSBHVH6lAHt1e7TNhgMdoK5J8Fcfu6-zh-uufg2c
Message-ID: <CANn89iJbs9n=kmt1putx=izvr3w17U4g6RDoDzdh4NWz+7uRaw@mail.gmail.com>
Subject: Re: [PATCH net] openvswitch: reject a negative transport length in
 the IPv6 L4 checksum update
To: Ilya Maximets <i.maximets@ovn.org>
Cc: Norbert Szetei <norbert@doyensec.com>, netdev@vger.kernel.org, 
	Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, dev@openvswitch.org, linux-kernel@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 2:13=E2=80=AFPM Ilya Maximets <i.maximets@ovn.org> =
wrote:
>
> On 9/15/26 9:55 PM, Norbert Szetei wrote:
> > update_ipv6_checksum() computes
> >
> >       int transport_len =3D skb->len - skb_transport_offset(skb);
> >
> > and gates the L4 access on
> >
> >       if (likely(transport_len >=3D sizeof(struct tcphdr)))
> >
> > sizeof yields size_t, so transport_len is converted to unsigned and eve=
ry
> > negative value passes the guard.  inet_proto_csum_replace16() then read=
s
> > the transport checksum field out of bounds, and writes the updated valu=
e
> > back to the same address:
> >
> >   BUG: KASAN: slab-use-after-free in inet_proto_csum_replace16+0x445/0x=
470
> >   Read of size 2 at addr ffff888131a4cb06 by task ovs_ipv6_oob/696
> >   CPU: 3 UID: 1000 PID: 696 Comm: ovs_ipv6_oob Tainted: G N 7.3.0-rc2+ =
#338
> >   Call Trace:
> >    inet_proto_csum_replace16+0x445/0x470
> >    set_ipv6_addr+0x3dd/0x460
> >    do_execute_actions+0x6a3d/0x7c40
> >    ovs_execute_actions+0xfd/0x480
> >    ovs_packet_cmd_execute+0xc38/0xf20
> >    genl_rcv_msg+0x59e/0x870
> >    netlink_rcv_skb+0x18b/0x450
> >    genl_rcv+0x2d/0x40
> >    netlink_unicast+0x6bc/0xa20
> >
> >   The buggy address belongs to the object at ffff888131a4c980
> >    which belongs to the cache skbuff_small_head of size 704
> >   The buggy address is located 390 bytes inside of
> >    freed 704-byte region [ffff888131a4c980, ffff888131a4cc40)
> >
> > ipv6_find_hdr() walks the extension header chain, skipping each header
> > by the length that header itself declares, and ipv6_optlen() returns up
> > to 2048.  The last skip is never checked against skb->len, and
> > parse_ipv6hdr() installs the result as the transport header.
>
> Hi, Norbert.
>
> This looks like something that needs to be fixed in the ipv6_find_hdr().
> IMO, this function should not return an offset that doesn't exist in the
> packet, i.e. we should not be able to find what's not in there.
>
> CC: David and Ido.
>
> In general, we should be able to trust the skb_transport_offset(),
> otherwise there could be other issues all over the place, not only in
> openvswitch.

Totally agree.
We keep receiving defensive code instead of finding and fixing the
root causes :/

Fix ipv6_find_hdr() in net/ipv6/exthdrs_core.c

if (skb->len - start < hdrlen)
    return -EBADMSG;
