Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265DC30D418
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836229; cv=pass; b=pvWMIrIN/Np0oZs5O6g9asCCbRjWeJqIQeWxvX2NO/sXSsbWCR3xycsxDQC3it+Esrp7+Q1Re9M4kUFid6i0SnhyBS32uX4hnnX0ko743xZo2Y6aC46FYP7qzyGHYBAwRoas6i1lQ3ix1NqNu1jCVwwSmWpF86A0qh/2eicH0pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836229; c=relaxed/simple;
	bh=7QT6BoZEqcPorRF+41Olle15p4YL12kp6yZbrGZ8iLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGTFlVYgq8zYu47AGc8OGHmGx5nveZg4cVm9RrQQ3/KQUPL57XOC+2dtrwYrir1nXMJhc2/udX9EZ6BZyefGrfXBD+L/b/o8IxYfsAZMiWtoOkrJ9inqUpDgknZowYMTn4inU6C/ukqOnJ/2lq0Y5FQTnJ7Gq3C4Zpj/tt8YAsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2+lXPuH; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2+lXPuH"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso4356859e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788836226; cv=none;
        d=google.com; s=arc-20260327;
        b=RyF0jSeUD8Qxz5SBQpM54IPI5n0B9+nS2xKqVw46lmMHJztQrEgjEHLoE14KFy7frS
         jictP55DcJLaAnaYEQcZaXmZLvOQ4Dp+4I4erzWLZK+VQtDiNQIYzu9IawrV7KeepGR6
         qyPx3nhqUT9C8DJIXkuyMqVazSICp7t/Kn2ki/+NFBi5+rM5GrYCuQBCGCOMqm2KIqBn
         lJGabtQVlEW9jp22/4MHUv4wWnzj9fYGljYPOp50Bfo7K7dIcpeL5/QzDvBSroU914ed
         23objh2cdpfSnIbgZ4oQREER52WhHqa6wdabctXOIuw/2wdHocaPZqVGkhYi90wV2omC
         09ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7QT6BoZEqcPorRF+41Olle15p4YL12kp6yZbrGZ8iLo=;
        fh=Y0bU9jskc0OyLU0/CYk04O/A+LHsTC72sJ/G1ercaHQ=;
        b=QQEH1J2sIVuTnNWvMNeGML14X5VBDV7xYHbgCxZd7CcZfd+nnhYdFARiZEJJi4L7Lf
         tvreeUaQ2k5PoKov/4g0xH8ALUvYvEBFP/dbeafFTU2vPe/76sglQMHjGJdvZQXGrike
         99C0QaYr+NKMkR1Lp0zrDKFJOzGcRNMl3zR3XcGUDlbpo2V2Yi7zxpMYs7Lv/cKfdEb7
         9omJQgbqdsuhwTTuIW58DYSbRgASbBhugWpTV4tfzHjxLZT80pOeXwfeYkJNwbIisUIQ
         yG+DdC9LWoxgemxyRGFYyICAW4VC/5MCEz3kf1QMY92g9P+2tODGfp77g+62rkq9wCy1
         QG4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788836226; x=1789441026; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QT6BoZEqcPorRF+41Olle15p4YL12kp6yZbrGZ8iLo=;
        b=Y2+lXPuHDzNBPhBHm7jD2JBjY6yYMYwVQYJWnYYCNDXyEDrSHPVx062hLelr0OP7Lx
         HlnlBP9W4TBcrQZVdZZJbLlJo5D040Y0a004yCzzO5gG2SfyyBSbVdKcAfePjvO3Z49V
         VaneVhUtpbu8birBJq2hXka/T+FT6NbRRPQ9TeLMxFN45NGvH66PNFG5SKtYgfsKA83Z
         mGO/EbGfm2wW4ti/6jwZRUX3PcDX6HhbjhnmBqCS06lmbJE89QO2bIz0p69e9NKj5klX
         rwcR7apqWKvjpq0GM7e0RNxqwUqYhOk/dgIAAWcU6nJLkXn3XvjuypH9uDzkb4LG54gp
         s+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836226; x=1789441026;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7QT6BoZEqcPorRF+41Olle15p4YL12kp6yZbrGZ8iLo=;
        b=O61ztu/29LpaG7IXbxk5eXgCI5an/cFZcq7ggCSICSOrPBsTIDdL1/5mAaZx6kRSIP
         QoLCC1s6GfIChDU0VbvIqvw1HTIvHHJBRZB5xvFcoYRnN3nEsgAdcRbZHnogAuTyLn4p
         NwLq9G/6jQHPk3yy+fsx79oHsZOap+/rwP4G5hACrpK5UQva+Qyv417v9ndRfhUrWU3E
         z0sZ7kp9MOEtL4a2wImqB55MCmt/KppHvOFe8bKOObn5CAzo2qHp3yRuQ7eYYv8oAyL1
         SdGVyQwjN63ZLRfUMChcNzj9Mbt/Y7Ko/fJrWmKZK+uiYcAIx3YAcHGVF/tqHGbcf9Nf
         xRFg==
X-Forwarded-Encrypted: i=1; AKwUvBwkw1XfNLX9PTMq+rjR/ZYxXWsxBHfHgSJc8sa3c3BJ4jTONbHFmv9qtWGnWJvFDQaaTB+/ChiG7sySw9I=@vger.kernel.org
X-Gm-Message-State: AFuF++kX7yC/kg+Be6SWEHQCH8knHkga7pnAGnR/N4+GnayBHGd52E2w
	bwxnm7B5XBSBfcE5p82t3RzooFlpuAHJwBXaAS22+rGU/3SscoIvMcM3VraLRim6PHqH8LWkqlc
	5J6y3PG/eczGgVgVQK830JCDBaI/r2Fh3JOWcGP7img==
X-Gm-Gg: AYBFou1ioTu8Pb9KUTzjLUe9mA7pnWemVrtPmbAhiQ1nkeLHsZXhhuRrqT/GTXqDjsh
	xb+6y/daVDV/qThcX/szFUs8ZvAMaIGJ53rvrn1IyNIZReIVU3uGFLE7gDoQgWqFX7FLwWB3YeB
	jg3ufdCCLV5y3Kv76hWQCidyRzSAuq0KybdBjvSfD7zGEQixNQSXYa/HdHIdXWcpRfPMwK/dPrl
	RL+3reMjs+jeE5ev6tsIgt2d9GhD8j/650Waajed8OtLHYE9qcbS/x1TzpgFg4LzBavMZpfCmeQ
	dgurABH0CaWWK+owGY48jzfSpNDv4HDioRcHRlTZtAAH9jx8zTfzW+Bvhdyshe8cV0Vpv9OiQD+
	JVLoF1QLfQlsu/uvjUo1/toe5vN4uJT+tVg==
X-Received: by 2002:a05:6512:10d1:b0:5b6:4ae:8c01 with SMTP id
 2adb3069b0e04-5b616f59cf5mr4175296e87.28.1788836225895; Mon, 07 Sep 2026
 19:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905093932.43726-1-sigefriedhyy@gmail.com> <f1e70062-943d-4521-976a-ae7c9fbc756b@6wind.com>
In-Reply-To: <f1e70062-943d-4521-976a-ae7c9fbc756b@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 8 Sep 2026 11:56:54 +0900
X-Gm-Features: AcwNN1U9p2sFJsv_7_Qjw2glgbmq-K3CoxGpp4O9ALykWZMch5RDUDwBJuNCCmI
Message-ID: <CA+7S2vL7Xm3nPw96R1+aN-sHLaprPxFUNw4qi6kbTAUu5OUyNg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/3] rtnetlink: dump link-layer multicast addresses
To: nicolas.dichtel@6wind.com
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> These addresses could be listed with 'bridge fdb' (RTM_GETNEIGH on AF_BRIDGE).
> Instead of having a new message to get the missing info (users), maybe it would
> be better to update the current API.

I looked at the FDB dump based on the suggestion and I don't think
that path works well. The missing users count is not the only problem:

It doesn't list dev->mc for every device. Only ndo_dflt_fdb_dump()
walks dev->mc, and rtnl_fdb_dump() calls it only for Ethernet devices
that have no ndo_fdb_dump of their own. So bridge, vxlan, macvlan and
IPoIB devices never show their multicast filter in "bridge fdb show",
while /proc/net/dev_mcast lists them. Fixing that means calling the
default dump for those devices too, which adds new entries to
"bridge fdb show" output on every one of them.

User space can't reliably tell the entries apart either. "ip maddr"
would keep NTF_SELF entries with a multicast lladdr, but it seems vxlan's own
FDB entries seems also carry NTF_SELF, so a multicast MAC added there as a
forwarding rule (bridge fdb add ... dev vxlan0 dst ...) would show up
as a device multicast address, while the real dev->mc of that vxlan
device is missing. And since a dump can't be limited to self entries,
on a host with bridges "ip maddr show" would receive the whole learned
FDB of every port and drop it.

It would still need a new uAPI. All self entries are NUD_PERMANENT, so
the users count and the SIOCADDMULTI (static) bit would be new NDA_*
attributes. On the other hand, this series adds no new attributes;
IFA_MULTICAST, IFA_MC_USERS and IFA_F_PERMANENT already exist for the
IPv4 and IPv6 dumps.

Covering this with RTM_GETNEIGH would need the default dump for
devices with their own ndo_fdb_dump, a way to tell filter entries from
a device's own
NTF_SELF FDB entries, a self-only request filter, and new NDA_*
attributes for users and the static bit. That is more new uAPI than
this series for the same result.

Therefore, I feel that my original proposal seems cleaner and causes
less chrun. But feel free to let me know if I have any
misunderstanding on the suggestion.

> FWIW, AF_PACKET seems strange to me. Isn't AF_UNSPEC (like for interface, cf
> rtnl_fill_ifinfo) more appropriate?

For address dumps AF_UNSPEC already means "all families" (RTM_GETADDR
goes through rtnl_dump_all()), so I'd rather keep it available for
RTM_GETMULTICAST. AF_PACKET is what iproute2 already uses for the link
family: "ip -0" sets preferred_family = AF_PACKET and sends it in
RTM_GETLINK, and ipmaddr.c has always tagged the /proc/net/dev_mcast
entries as AF_PACKET.

Thanks,

Yuyang
