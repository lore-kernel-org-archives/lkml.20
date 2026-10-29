Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264564;
	b=O9V9b5Uf4It3Q644d00v5Brf4ccu20TBU4P/kOhOVF6J0y4dIfJu/ZQH0kcr7yA5+GGL
	 Sl8Jq/A7Vrq/2YMOzpxcg0TUC0iMP9lvIjA4YIf3q22r8Gm5dRdMGQHxKqcSi0WWYGYH4
	 CMy1AUlYHAhsAWztK8qOD+27yfke0+YlGEztRTBan1IzucZrJnFV0abngWdHtD6BytN3O
	 XxyrZSs4KhnrhywTV9kMO5picC3g/yD8bL4nBy1u1TUZbfjr1z12KgvU6v0y1TsgLiSRS
	 22vGCvKBHYcIOkQwYLJ2GhbixqmLrZcqY1L7zBXT+BGpFFhMf4BOCuaerPkntYWGIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0DuXaAUxf/NY45cWLigCoPU0pIq1flmIM/0SGX1XZtU=;
	b=DXOfH+/5P+25tWYCC5IEPLVQCEe1C/6oS/RkXaIzC7+EVMLTca9GqTPlgNjb4+t9rXqv
	 L5Dpy3CaTNRbPAVIhOjBkhjqvZYm61xgx+nPewu5Wg8naLFiWFyIe1P2ItTIN4ABPXEkh
	 6EQCxd44eQ4ogB7d5RcPA2NveztFB73juEcql197UDJ40iPTTGefRuNdAjbaAeY72o07Z
	 k0mZvYdM9y8If/EHM9mkkhXcIKsSi0Xr3JGCRBfpXJcM/jmApb7rXqfBEb2ByQ+n3a3FZ
	 UkyMHxpbRnUrpNtWmOhVHzX6QHNyqDS0g7GrBvuBXJ8xLxw85ieDGF5USK11De1Wd+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=elK1toSn;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0B560A260C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A0B560A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=elK1toSn
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so2591501b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793264564; x=1793869364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0DuXaAUxf/NY45cWLigCoPU0pIq1flmIM/0SGX1XZtU=;
        b=elK1toSnmEW0Kx6uUg36KLLjxw88v+fpbxeQXa4lgvRJs/bk6Frt3Ev8nfcPEj5mq2
         kSzXF5wUJql9tDdwUoWx0XVAvspHNHjkHGysczIL18dIock4yXJKhfxDYkayuzldZkZI
         b8MvFVLvLVk/DKVaczI5+Zij3AlKZELpn7kYOSqDdDov+YSeiyYAkkBDrcgI1dbeqxEz
         1zYRR2y/F/v8CgeAinwozGvF0isrhvbjq8EauXuRT3rf55ccOgTq/5iVmIVAYN+uISdq
         UITFUFZLCAUWaGMwI+rnCh+9MTMLR4U4eH9odekcvWJSB/dorsZEZZgGTnCaq+/p3110
         4MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264564; x=1793869364;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DuXaAUxf/NY45cWLigCoPU0pIq1flmIM/0SGX1XZtU=;
        b=DOWazZH0u8uEvCLkrSuXB3EkcPmreeuval059pGnrbf87apgxNRvu+Su566gdJWfZO
         OAfDSIjZZ88A6sfrtKOQH4l1T8jyEZ/jwnk6TCwdi1dQWm+JUSDU8TagwgG/lNU6sJQx
         byOhE7wSivJK2xXruEhGO7eFy39rG07gVTCUY1GHMXnLdwIhvNn6hnf6qiJln5ZOJkDb
         EUSFsp0S2UAR5AL2VS14PFf0kjfo5a3i1vU2IP1WbISP/EIEXvZx2XW4QBAJTzkXrKDa
         5YnZRAGlObsFTZAXMTXlNDyHEkQ9Sc4I7GgG2Pr40Eclr4l40+pJpqkGz+Y14CsUaG2Q
         l8tA==
X-Forwarded-Encrypted: i=1; AKwUvByo48W5HQonvxkVbfd7/d2g0KLwPmVWoPbTrD4T85H9J/zdH78icYhkRIVOPDYEO9tZVupmSLNf+z5Z5og=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo8CowbcFFv5I0IuZVN5QeAC6ZWajcsmXS08ZWw5pkVZi1aJoQ
	Q4YOVnGwbjwbp/96Qp7ClDqO0FCnjVaZwWs7/KHqlwMoPobsii7nDyxo6JyJG6KH0Nb1a6ijsiX
	ycePpYr0BVeJP+pFeew==
X-Received: from pfh1.prod.google.com ([2002:a05:6a00:12c1:b0:885:756d:3709])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a15:b0:899:465d:c8f4 with SMTP id d2e1a72fcca58-8a6e6efa7c5mr3950320b3a.14.1793264563489;
 Thu, 29 Oct 2026 02:02:43 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:02:41 +0000
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
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029090241.4070613-1-starchang@google.com>
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

Hi Julian,

Thank you for the prompt feedback!

On the ARP side:
Glad to hear that dropping non-GARP ARP Replies (ar_op =3D=3D ARPOP_REPLY &=
& sip !=3D tip) in L2 BMC sounds like the right direction.

Regarding the points you raised:
1. For GARP: Leaving it to DROP_GRATUITOUS_ARP to decide makes total sense.=
 Legitimate GARP (sip =3D=3D tip) will bypass our drop check and fall throu=
gh to the existing IN_DEV_DROP_GRATUITOUS_ARP logic in arp_process().
2. For RFC 3927 (169.254.0.0/16): I completely agree with your concern that=
 exempting it opens another door. Given that Hole-196 attacks typically tar=
get the subnet gateway rather than link-local addresses, keeping it simple =
without an exemption seems safer.

Regarding your comment on the IP part ("But not sure for the IP part..."):
Could you please elaborate on your concerns with the IP changes?

The motivation for exempting UDP port 68 was that in our lab testing, we no=
ticed certain DHCP servers responding with unicast IP addresses over L2 bro=
adcast, which caused legitimate lease packets to be dropped by drop_unicast=
_in_l2_multicast.

We would be very glad to adjust, simplify, or rethink the IP logic based on=
 your advice.

Thanks again for your time and guidance!

Best regards,
Star Chang
