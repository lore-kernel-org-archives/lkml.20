Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954260;
	b=FxDMyl9C8g25TGnfCBjkefwjjTMGiUXcluE6oo/dX2quffstD+EeBmdHdkPfYCQrSslQ
	 HWn+v4a278dlvqkbs+wGgRsi/aZ04SOJtmfDP0PVQPqqNAwfpulxe7PJw8sTYsJxoI4zr
	 r2JsUQt4PpAyPfq0yimetMdhvw4owHmIKCRwVyEfndAIX+Nep16cO0UQ6ZwAYnTHs0eW6
	 huCe3DhA+sK31N4fzoOR3SxVEYZL2cpNPcyQXARhTfl7tW0DqKQySTP0p6Er8wCse8xA0
	 d+yff+Cg2tvPyk+t+ylfxq8AavIeWxgeO57IaA64b5OCm5m315ulAgrrsIF17DxbnyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954260;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:X-Mailer:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-MS-Reactions;
	bh=KwLryq1ZCCKlJLNf/9dqR26odXYHbBAlEucmPgeuG6g=;
	b=Wdzi64ed4V8vCF0UO8zu225QxId2mN5wR6FfYAMME6LimydpHpLrVf3gnovMQ9AZA3+E
	 A0cMHjcReq8Jxl8R9vkz9SAy7N5rmycFVhJwwzz1XyVkm5P3CckYvHMQhnFh1OvlO/BDb
	 DoQ+0AHDMq9d1MCg+89ItR0BFPHTS8wBSlm/Ehli3fzanKAoMndf/ZCyLuWjq3VgY9Uki
	 HaoHQSGyGD2Wffq1smt/rn4z4ElMNMpVmiP3/EFdrz7e6qIbSxwloJ3JQQRyQXwufzCB1
	 qo9NC5gaLJbgE/LZknRxMyHHYD3hF8PXOBd0TnJLU3FtY1zEamo6NDOuq1zTYTa8uqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VgbBdEiu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sYkbW49q;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C36606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C36606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VgbBdEiu;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sYkbW49q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793954257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwLryq1ZCCKlJLNf/9dqR26odXYHbBAlEucmPgeuG6g=;
	b=VgbBdEiuYXguGgxanxzWinQF1pPUrBdluw/qeyqDKcUSzCR4mvpMrwl+yvokFjD0KBMdwY
	KAkBWWgdNH1YGQFjzWMLzrvC2XNhLqWOukSASox0g1MVhDogmAwWkzxPALD0uvLF6q9GRf
	+Bu/EB9aEOde4uS45Usb7dNZ69OmG8k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-r1KaYvhvMViMdLTbVB0Akw-1; Fri, 06 Nov 2026 03:37:36 -0500
X-MC-Unique: r1KaYvhvMViMdLTbVB0Akw-1
X-Mimecast-MFC-AGG-ID: r1KaYvhvMViMdLTbVB0Akw_1793954255
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4d3b97cd5fso29365166b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793954255; x=1794559055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KwLryq1ZCCKlJLNf/9dqR26odXYHbBAlEucmPgeuG6g=;
        b=sYkbW49qn8/BztC5KGMbridi7ZjaS7gThkpt9QMdcdxm7ErDO9IamcEzi9HjuuY32J
         jfMbGCg8hvz9Kh0w7dnfiAZ+RFtQhzqwxnnrng58Lb/00BE53JAskPWH0Fa/c3IVqrjI
         nqHqA1Op6lHFW5fM4DQZg23NxOFVuMurwPX89Hfc8MDaiKRsSuMQ4pPNwtavOrgsu8WA
         tBMKIl/GLjUQHOJXj84q32V0AR2t7MXRrowOrVpfLIBDZydwRP/IiqyPBmXjEBxBOM2L
         TwlC9Ukx3r8xTBd5RAU19nfF4SnXb6b1Y4ZfhzahOF9ewh6cHOS6cikga7NZMtjVuZDq
         kTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954255; x=1794559055;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KwLryq1ZCCKlJLNf/9dqR26odXYHbBAlEucmPgeuG6g=;
        b=cu48pRfP4Gy1izDI8PtaJcfmAs2U3TOJlI/JqqNg2swy7tcoyyxrhKYSxEPD4MCCAL
         rUXe3jo4rg6r7WWr7Rd0P8RDOHdPmW0tbj/OxKIv05P13ebZLCAL2axM5nlNqzzPKRQE
         75wJbNen3nn1cp0qQVhoEcvCEgZ0vnECh/95+nyPR+iBkMouzJtqP62ST6ybYFGZL2F5
         pJdn5EWksaC0kjphq+GNHhvfZ3J7ZSFSLqn8WAXzMJXNl6l82RYjYHu2sdbnVLuXptxf
         SJwaomIqwa8M8047+l+nW1hV1zRUHZzd5eyJaxa8tTHuZBjLm7tb5Nn6pgBFNmR7CwNJ
         qkaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+mO2rsQXzVNqfyKp9tsQFoMlMewDXYm7oVQJooEelRp/1218Xjz8iSM4WGc4ey2IA9dyyX4/QcISifR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+67vQoujXQr9gAvnDApONT6LAMZZBLx9E2B4qn7jmq5iDCNxsS
	/NHC0OIw+gvZ87OkhvEYDsAC+2gdUCxj9RRSacIN7fDcRvWHc7LZVQ93sFbhHMwjcMqaosZe+SY
	iFfzOF1rfsOXS83yuXSwOrSrgt2fuG7eCRNUJeHuXlRAD3U7FKnS6bsOTsd6CR1Vc4g==
X-Gm-Gg: AYBFou2Szwq/7vERU1wxTjuGFTolCP4dg17jYOmBxQQqSKITC9kBhR70q6Lx1VzH6TN
	v+YFN5cVJZtHUqTfQaihYNUvke6e5xbgTOEbkLH9zjo3boqpv2MINb+t71b4UHEia7oEEJGSdjV
	cbNrZfpYXc9aSiwnRKYDrqUGE55bFrag2ilQ0OmDnFhcEa/abzBc1/ST/6XFnab7QzA+v6Bxt52
	/Lhlfy1O3jpDyJaG/1E8sry6ep+k2f9Ct3YxLqjU5UHdgpwB8UFA9+YJife7jsq/hDPglGXnuPk
	i7xoqH2/h/AePoGhQwh+AdM7tAb/yqNjCsFHaInGXxy5WFaSOPVa1DOOYhOAn5TsLO6pbaleh0q
	nXVMm8U4SelYD1DOEHTeHYeCd4UVLDzxipkLLgA9CS8wCud1bEH2wiTMDoJgvvTjv+2pqKg2rvd
	JF8Gge2O0QZvrvc65EW6TH
X-Received: by 2002:a17:907:160e:b0:c46:d837:b358 with SMTP id a640c23a62f3a-c4d344a26cemr162751266b.3.1793954255359;
        Fri, 06 Nov 2026 00:37:35 -0800 (PST)
X-Received: by 2002:a17:907:160e:b0:c46:d837:b358 with SMTP id a640c23a62f3a-c4d344a26cemr162749466b.3.1793954254936;
        Fri, 06 Nov 2026 00:37:34 -0800 (PST)
Received: from [172.16.2.47] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac21dsm60206166b.12.2026.11.06.00.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:37:34 -0800 (PST)
From: Eelco Chaudron <echaudro@redhat.com>
To: Joas Antonio dos Santos <joasantonio108@gmail.com>
Cc: Aaron Conole <aconole@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, dev@openvswitch.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2] openvswitch: advance by the real header length in
 get_ipv6_ext_hdrs()
Date: Fri, 06 Nov 2026 09:37:33 +0100
X-Mailer: MailMate (3.0r7038)
Message-ID: <69789AC4-A3E6-4DC2-ACAB-EFC10F14EBA7@redhat.com>
In-Reply-To: <20261102-ovs-exthdrs-v2-1-21ceef6a243d@gmail.com>
References: <20261102-ovs-exthdrs-v2-1-21ceef6a243d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow



On 2 Nov 2026, at 2:45, Joas Antonio dos Santos via B4 Relay wrote:

> From: Joas Antonio dos Santos <joasantonio108@gmail.com>
>
> get_ipv6_ext_hdrs() walks the IPv6 extension header chain to fill
> key->ipv6.exthdrs, but advances to the next header with ipv6_optlen()
> whatever the current header is.  That is only right for Hop-by-Hop,
> Destination Options and Routing headers:
>
>  - an Authentication Header is ((hdrlen + 2) << 2) bytes long
>    (ipv6_authlen()), so with hdrlen =3D 4 the walk skips 40 bytes inste=
ad
>    of 24 and reads the next "header" from the ICV and payload;
>
>  - a Fragment header is always 8 bytes, and the byte read as hdrlen is
>    its Reserved field, which the sender controls and receivers ignore,
>    so a non-zero value makes the walk skip up to 2048 bytes and miss
>    the headers that follow;
>
>  - in a non-first fragment nothing after the Fragment header is a
>    header at all, it is the middle of the fragmentable part, yet the
>    walk keeps parsing it as an extension header chain.
>
> In all cases the OFPIEH12_* bits stored in key->ipv6.exthdrs depend on
> bytes chosen by the sender rather than on the headers that are actually=

> present: payload bytes that look like another AH or a Hop-by-Hop header=

> add OFPIEH12_UNREP/OFPIEH12_UNSEQ, and real headers after a Fragment
> header can go unreported.  Flows that match on OVS_KEY_ATTR_IPV6_EXTHDR=
S
> then classify such packets wrongly.  There is no memory safety issue,
> skb_header_pointer() bounds every read.
>
> Advance by sizeof(struct frag_hdr) for Fragment headers and by
> ipv6_authlen() for AH, and stop at the Fragment header if its offset is=

> non-zero, as ipv6_find_hdr() does.
>
> Fixes: 28a3f0601727 ("net: openvswitch: IPv6: Add IPv6 extension header=
 support")
> Link: https://lore.kernel.org/all/178905555085.219967.66176117834372280=
45@kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>

Thanks the patch looks good to me.

Reviewed-by:  Eelco Chaudron <echaudron@ovn.org>

