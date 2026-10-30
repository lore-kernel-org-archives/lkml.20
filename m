Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329639;
	b=ElzSXtzIjqJonFVNSvc7ZVSW4PKtt2sLuOo+ll93OJyJdFDcJzsk28h9u9zMG6DzTUYX
	 w0XxEGPcrZ6nWJ7/cdODooqxLvujO6PTpkuDWmGgDkisWyJW2ISZxxjVX9tK6JaR/zn9T
	 6o/SNAlekG4lxqsADC6deKlpVO6LE6Nosw86LfiWrdpoK89lic4yJfDSUHlYR1jDNkf2Y
	 rLJGPVjAXmPrCB1WNver/GNGQNwTGVe2rZQAYgDs+3VZNhrgh+aoL/hc40329/1bBZ+22
	 zMvTWTvyQ4xmst4YrinYd9BcCk5+A2TgDhhPFtQLtT52cQHa3vg2wLhtgiKV5OApJhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZM/x67kZFWzNFHq6c2CFofQ7P7hekwtvQXb7jH6aHSw=;
	b=1HnfCGhGLxbRrM0E6XOt36xCkFfNJQXjgkYGXC/tyQ6W6XDBWH/LeEuatSNvZ2C9XnX2
	 9ZNDL5prCtglE6oLFu0irXVV8h7EAar2yrzB+ie5fJS8dJuFS0N8wa1F7Dfq2ey3SnbKd
	 CeG1Nk0Y2r2npVFE5yXl5+nQFUEhJnx4eOSbdMgiMOMZqgt+M6LizUEUF0LYGi5I8z95E
	 yxSxmQKNA0pmG0L5goAAFUt6XzENiBBsdgeQqFTiKLwJfikPXID6pP6aiRs39hLbOGOsq
	 Ifk+smc3kIfzq83z+ev4WYIpCCV6sTPXmuvTrH6Lb1nGGhUdv8PGUjfSZGCNf3pNOmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kB1VQOe3;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21ED0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kB1VQOe3
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso1962986eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793329638; x=1793934438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZM/x67kZFWzNFHq6c2CFofQ7P7hekwtvQXb7jH6aHSw=;
        b=kB1VQOe3PZag9TaZd3CP49bRPJwMssqL7qcUGvBJoq78curtxR8+5TZNMSw5QIqDUm
         E/eG0EIJcUhTzpIrm+YkQ/D0OQF2pw0GAYB6BFLcf+2F9NqprbCiDxOqP3A0zqod/wBJ
         /tvmjITuhldJk6JYVv4FUgAK6iu7ne/MCC+vUFekpILFlRzuSQdcyq9bkUpMmy5TYLW6
         OHTEB6epLtjHJmWOy0u30NtfMvg/EeofNLqsTo5sxV5pV8V6hJGcZb/XZ4XMDuL0+pab
         6CSS22U/0x4Qq8yHHFwuAEJtQHNOCSymdn9pKbxzN2Ouxd3EJbzmeias4eEV7DPLx9qy
         UCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329638; x=1793934438;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZM/x67kZFWzNFHq6c2CFofQ7P7hekwtvQXb7jH6aHSw=;
        b=P91LMJSioX7SMACY76r4Lekj8Y3OUwqJ6kv1j3tIRqWTX6wt24CT3QArNalhahhwrx
         i1DfD07Dfbq0Vt0uuriAmhWID7BV4FRizcHXssL/lwbOSQeoH3ncupNZmG3+kSKGkDB4
         v2FdhOFGrf8dPfjdbDvjQz1VFJv/dit+unPrEdjDZVkJ1FhVxMqzaq4uaHGLrOUqgbpX
         KIQq3gj2iYALTrqu2TA6CVtW4zz0Qr4x4kehRUwpUVbWHHh+z5u0aQ74XQSpcEYeaA4N
         Aa9ACevvK114a3ucbXkoFIpai8S049t29xyPLY5k+ycntOb2LPF6syK7Qbc0x9pGm0YS
         VuWw==
X-Forwarded-Encrypted: i=1; AKwUvBywQ2ZAESE3SN67akaBajvgx3AOZDdEynAMu3HZDLGh3aHFbNVNHylPdr6VyH3BoDTm4CcZNLvK6ZWjNQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqMkKgSmwErWoqgTyTKof+9rfL9uUFi4ZKxqO1UOywhi6B/sNq
	InTV2bZTvxXmv7fmMvlRhKxGgSCwmV9QU+p/YMTHbb4DQJelTGXnIpGrut12DQ2j27FH9kgyuqC
	uoX9HVWTEvTX0NwQcnA==
X-Received: from dlx12.prod.google.com ([2002:a05:7022:8c:b0:19b:2ad6:6374])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3c02:b0:196:b805:9546 with SMTP id a92af1059eb24-1ac5a67f996mr1102998c88.10.1793329637789;
 Thu, 29 Oct 2026 20:07:17 -0700 (PDT)
Date: Fri, 30 Oct 2026 03:07:15 +0000
In-Reply-To: <f631e178-d9ec-f335-9163-c44a9e6c58af@ssi.bg>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026150539.1357037-1-starchang@google.com>
 <20261027015619.1745984-1-starchang@google.com> <5c1fe870-39ff-e83e-e479-0e1f0fed6a83@ssi.bg>
 <20261028061644.2997812-1-starchang@google.com> <f631e178-d9ec-f335-9163-c44a9e6c58af@ssi.bg>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030030715.604215-1-starchang@google.com>
Subject: Re: [PATCH net v4] net: Fix Hole-196 vulnerability by dropping
 unicast ARP/IP in L2 BMC
From: Star Chang <starchang@google.com>
To: ja@ssi.bg
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, johannes@sipsolutions.net, johannes.berg@intel.com, 
	linux-kernel@vger.kernel.org, wangroger@google.com, starchang@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Julian, Sashiko, and netdev reviewers,

Thank you for the detailed review and feedback.

The points raised regarding the IP part are completely legitimate:
1. The pskb_may_pull() failure path did indeed introduce a potential UAF re=
ad of &iph->daddr when skb->head was reallocated.
2. Furthermore, exempting UDP port 68 weakens the Hole-196 protection. In p=
ractice, DHCP clients operate via AF_PACKET raw sockets (which tap frames b=
efore IP input) or rely on broadcast destination 255.255.255.255 (which rou=
tes as RTN_BROADCAST and is never dropped by drop_unicast_in_l2_multicast).
3. The net_warn_ratelimited() calls also introduce potential log suppressio=
n risks under a packet flood.

Therefore, we have completely dropped the IP and IPv6 changes (ip_input.c a=
nd ip6_input.c), preserving the original silent discard behavior per RFC 11=
22 and removing the extraneous IPv6 Fixes tag.

On the ARP side:
We have simplified the logic per the discussion with Julian:
- Strictly drop ARP Replies in L2 BMC unless they are Gratuitous ARP (sip =
=3D=3D tip), recording SKB_DROP_REASON_UNICAST_IN_L2_MULTICAST via kfree_sk=
b_reason().
- Leave ARP Requests completely untouched per RFC 826 (eliminating any chec=
ks on tha).
- Legitimate GARP (sip =3D=3D tip) defers to the existing drop_gratuitous_a=
rp sysctl.
- Updated Documentation/networking/ip-sysctl.rst accordingly.

We will submit these changes cleanly in v5.

pw-bot: cr
