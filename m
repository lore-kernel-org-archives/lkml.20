Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794759441;
	b=QBNzMnWXM4ie15C67PEOWqk/HhcUeemCeIVJm52/iLTvpl+SxadfrhF71GQa1LklTloN
	 PCprLEPL9qKDErnRGxO8O/dQF31iNZ2Cn853xakbPweHqqKQf788BXvdb0Ss2dHyW0Mpn
	 Zyd09YLJ/5rCgyiaq0+/AkSoIUVpsTP8SBJDNhO++eReGq1lh9B1xzMLWPSf4utaXdgMC
	 oEiSjDOft6gGXEadVIxV39yh6oeyWVztfEcN5CjmIG9ymWe5OukfQYq5hXDVPk98bUHBN
	 a3b2PrfSg1s+pwN8UuADnSkUbHdLTO1qR735C1HEdmq2tTCR4rkOdLpwFaV0rS86z8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794759441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q/z14z+d7POgY9c+yc0G66ZMePGWOZhS5NXoDt9IfGc=;
	b=Ygs9Y+h72WWFcmRh47zOAUIoscpQGnCOBgf9e/aMj7stkSjiZ+RJ+NNodQJe8rO7t+fg
	 vvg5LDCakm/wyxg0hoTMFZLJ0EpZB2y4tT+kqISlDern/V3GEAWof9kADkzeg/C9DS7gX
	 Ce7lR4Dj3GcCsxewxh/A4SdzB38lpwzoTy5omOFr3whjYOeEjKB+29A1r7wHUlxetmFCq
	 mM+U+qH7ZMOWY5FoFnaCCHaHrVkLNm9PbGhCnzIsZmmkdBMM73gPaWAMZy4lDEOmO8uSB
	 SECrQNuiN+avzh7wvw3AGYbljmyOQwlx276avzTA8qSrfpb+HDfrwgZn85fd+SIKR9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2rJaiQ5;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7607606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7607606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2rJaiQ5
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so468249366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794759439; x=1795364239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/z14z+d7POgY9c+yc0G66ZMePGWOZhS5NXoDt9IfGc=;
        b=R2rJaiQ5HqWalGyhLP6BMT2OUXd2xSj7dwmo3raaDreSDVlsh0SXIqrJvIz7Umj1ke
         iqXhOtvHFOlwItAGVn7ePPpyXoVPUG1UvvHNP/flsEHZKgJG7TOAt16YHnR8VosReTof
         i5pQ8UELMRn2LySK6mJkLCUZFFZ/ZVW6J+zyNd+CxEd8I8OPS7rBRi2Lp90oFBimDoJh
         q0hzdml2jg1San9mUlzZ2uHV9hLtF2tC+elpQyFBm7MEYdKuxmm4CsheWxvzBKS9h8lv
         fhT/E86cAWJkTw3yexjtEZIibs29IZT+3wl5NRPagNRV0NZEFXbfXSzVFmvEduBbwOwd
         z7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794759439; x=1795364239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/z14z+d7POgY9c+yc0G66ZMePGWOZhS5NXoDt9IfGc=;
        b=uXva5MYIYhkN1GV1DU16RKhoWCFuJKmrfVPYmhhdUEqPoqmwpIyugxOX7O2HgQU0OV
         ErZJhOUBb7cP2cLK9kp40Z6XR+MxIBH8IoDVqxCw/q0jNdhVPvOFvcaKawZZ+pdU3Pr8
         gKVWej1NIOWHla2aODc63qLneittAXp2nRgYyLs+o82cBUSvjq3yf6DoYS9VhaG0Cj8J
         DCqEPtzJjwceya8s6evDtlzMnD88Pnq0RMnUKb0zlYmSsNKHFqt6n3hlv/CAor0DfWun
         +p0ejISwnPbbggnAkz4J7HeO/IgajQL5gQIXERS+XRg6KqbgtC9hIszDY2LlZ0OMQPkZ
         z31A==
X-Forwarded-Encrypted: i=1; AL+hErFviGmkw49QYZ2dA13D1Imv3sSONxrh8q+5hw8PMqferbbtJ5nPQyRV2K3ux06dNxUe+e52P3ZfkWqUdhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gnF0SrhlLEYi9BtX0ayuAw0lQFrI693Dl8aMw//WJ59sohwc1
	x6unQPj1jlRr5JG6fjMzygJLKQ25zFEkGzW7kKNmNo1wQMTFhlpKaJFZ
X-Gm-Gg: AYBFou1clowJsJEzRSTKKTyimjV0zE+9Hz60YTTswErMy7VLzFFWK/gPwGlcEmAamTT
	9k6Neifp7FR4JnniPDvld85aQ+uNqC2ecSkcSz63B9xwsTai3J1mKjXXpfgfTADMCzyBqrbkJMX
	yp8O48aJgcRE6rsI8lm2Pj9s36XThmlN2z+YEQ8ICTa0/89JEQz+LFPUIO4uLjrHF5ldvWV1Tfm
	Zm5dvFKoFaNJcblM8JyJqAWrc/wRIp9wIQD4igSqcV3HArIsJ1RJEk/2TH52nHZlc/9gd5RlrsV
	oybZu7DdtncDqn/DUaFscsL+cNMAMdpds/mzW56Z9q4uD/+2xfa7lBKspjoGJaWPZ+nAiXAHCzn
	Eq4mbzskdQiEnglMUbJUqCsIYoLodPyRF4aLW37m+D/1h4pXb8RvJjsBSdeRO9VIUfAo/XzugI0
	UvD7gzzpJ6hZ+vVQmrPHb4u7nfohsy4Cu7S7lYbKtRi5MpNiVBIbZgWPfOUfkp1K8EJ+bMNBks8
	Jm66u/ZCebP12C7EeTmfLiV4KYihKkYATOhsBcxjP7NPRfMP6/Qi0KXLowK0Cb7B42pAbzCKan6
	v3l61wSCeegSb1sSdcHMnf1sROdiWTqZw9kWFTzlvBRBDEXwpvNwAqyw9hjEXy3VPjRq6fiBRu8
	RkVzZmCXLwXNiIhw3ejDsGWjaa4yHEBOfkFpT2RvT78txXO3i/HD1uFJjCtOvMBXZqB2nKmbKOq
	5TscnbrJjuMRJ6NNj6fxxhkQ==
X-Received: by 2002:a17:907:1c85:b0:c49:b8ec:a9e3 with SMTP id a640c23a62f3a-c50963bbc82mr656270766b.43.1794759439146;
        Sun, 15 Nov 2026 08:17:19 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b57c5bsm319832666b.49.2026.11.15.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:17:18 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: netdev@vger.kernel.org,
	netdev-bot+sashiko@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: dsa: realtek: rtl8365mb: keep the neutral PVID in VLAN-unaware bridges
Date: Sun, 15 Nov 2026 17:17:01 +0100
Message-ID: <20261115161701.2351256-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179432406157.994134.6897059294926012210@kernel.org>
References: <179432406157.994134.6897059294926012210@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 15:21:01 +0000 netdev-bot+sashiko@kernel.org wrote:
> - [High] In VLAN-unaware bridges, rtl8365mb_port_commit_pvid() now sets
>   pvid = 0 (VLANMC index 0, EVID 0).

Jakub, as you asked for a reply: the review is correct. Multicast
entries have no EFID, so with all VLAN-unaware bridges and standalone
ports classified to VID 0 and VID 0 in IVL, they share one {MAC, VID 0}
entry. v3 will not do that.

Luiz, this ties in with your mail. One correction first: the patch
does not move ports without a PVID to the bridge PVID, it does the
reverse, it keeps the neutral PVID on the ports of a VLAN-unaware
bridge. Your main point stands though, and I tested the SVL direction
on hardware.

The switch has a port-based FID (enable mask at 0x07ac, one FID per
port from 0x07ad). I tried it on an RTL8367S and on an RTL8367S-VB, the
latter with the L2 entry layout from Mieczyslaw's v10:

 - The port-based FID alone changes nothing while the VLAN4k entry of
   the VLAN a frame is classified to has IVL set. The learned key
   stays {MAC, VID}.

 - With that VLAN4k entry in SVL, the learned key is {MAC, FID}, and
   the FID is the one of the ingress port, not the one in the VLAN4k
   entry.

 - A static unicast entry written as SVL with the port's FID replaces
   the learned one in place. The roaming case from the commit message
   passes, 10 of 10 pings, on both chips.

 - Multicast entries follow the port's FID as well. With an SVL entry
   whose only member is an unused port, 0 of about 40 frames reached
   the CPU while the ingress port had the entry's FID, and 38 (39 on
   the VB) once I gave the port another FID.

 - Two VLAN-unaware bridges on the RTL8367S, each with its own FID: the
   same MAC and the same group in both give separate entries, deleting
   the group in one bridge leaves the other's entry alone, and traffic
   of one bridge does not hit the entry of the other.

 - Tagged frames, on both chips: with the VLAN4k entry of VLAN 20 in
   SVL, a station sending in VLAN 20 is learned as {MAC, port FID} and
   the roaming case passes, 10 of 10. With the entry in IVL as today it
   fails, 0 of 10.

So for v3 I would drop patch 1, leave VLAN 0 in SVL, and:

 - give each VLAN-unaware bridge its own FID and enable it on the
   ports of the bridge while they do not filter,
 - keep the neutral PVID on those ports, as patch 2 does now, so that
   untagged frames are classified to a VLAN in SVL,
 - write the VID 0 FDB and MDB entries from DSA as SVL with the FID of
   the bridge,
 - as a separate patch, write a VLAN4k entry as IVL only while one of
   its member ports filters, and as SVL otherwise, so that tagged
   frames in a VLAN-unaware bridge are looked up by MAC as well.

VID 0 is then no longer part of any lookup key, and multicast is
separated per bridge by the FID. vlan_filtering_is_global is not
needed. What remains is a VLAN that a filtering and a non-filtering
bridge on the same switch both use: it stays in IVL.

The FID is 4 bits on the RTL8367S and 2 bits on the VB, which limits
the number of such bridges.

Does this direction work for you? As this is no longer a small fix, I
will send v3 for net-next, keeping the Fixes tag, unless you prefer it
in net.

pw-bot: cr

Stijn
