Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603155;
	b=YP1lTozMrSDIA3Ijh7rU2GL8Q+Bhi62US94YHRbqsSxFNgOxZ3g65F3kMZgtExNWZaFk
	 4h6+mGFgUF6ky4CojJW03CN7ZbG6PNLxSFh1sTU7eLkntzhPzmbdKsd3h5SOKhoxdSkvy
	 5ER/hO0OvXh8tXTa0lxixweJgnNy3qvT9bULXH++64DQYIVS+STgoAx3pCoedh1sM4qPk
	 oQgQ7T2BA6530Kri7msIUknqyc/evGTHFcu7aFickVk+Hcv6utbui8XhWFiMi2lsT69c6
	 tP7+BBM5w4UI6eIsTulC2BsGLUFq4wDhVn5k1iWDa2DpFT6SBaoWEnAp4dCoeN2gDBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=S2dXtgoINO4jETLhwlkbR6oePZjzayLB0KbxKdo2N4Y=;
	b=ClJPPjUrreopLzKufz4ZOjVMMAHv+TTlgVDh9fwqKGULEwjwihA3CXLD3dYD13uxicMm
	 aFF+SHq5hLhzqXr0GZ6ejPkEP2wvtkZJ2kaOm4LIArcRyUfHB0pUIlMnNQry4B3xQRkGF
	 yCwGIyYtkWQdGNvZ4nRQhwS9+dmunh3/ujFlFyb4QTXMAbies4dWEcnchXSnrp2Q2ilfD
	 Z7fIC+mQVJcBzGm1wmLrtWOs1mY+bhdy2s26QmILN+S0hgCY8vJI1mnxWawvnzn2RGNLY
	 M+xJL2ay/+FswvSP1+EP84yC3S2szaALVAVNF5EyoHKcDUzRE0sjtcyNXmqcfDbVqJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FAEspZHC;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77971606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77971606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FAEspZHC
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1615442a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793603155; x=1794207955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2dXtgoINO4jETLhwlkbR6oePZjzayLB0KbxKdo2N4Y=;
        b=FAEspZHCbWAm785Gemg9wThR+t7q2ZPqZP2E9PPj43Uu0kn7vvjNsV9wRCBPy8RPe9
         0gnetozoKglOKincqWsuisrthjYnwO2uFIG24LFxV6lLtOw/jkaSszjaQJDxb3nSrSYr
         2DnOex+n7K9VwpQgI4+JjCMJ6XjAztLeRg7Aj1FMnVUP/1xe7fVzgfyXt2Ri/eNinN6d
         6tQCIKYrCPRCG7m/+FzaYT8KM+ZFdi8YJxeIZbrCaa1m1LEgGkG0wOHqlUDH3eB+mhwu
         b/NAVdUIvQcOZi5JTezWC0j6q6AlZXj/BZB7o3Q2XoL3pNnucK2A6FiWzVtLRYfuy3fA
         JwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603155; x=1794207955;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2dXtgoINO4jETLhwlkbR6oePZjzayLB0KbxKdo2N4Y=;
        b=MAcnIRMBFHu9uqTpbebXGmcR7xpx4miZvr9emHXEdBWS7YctG345CPZXpoKMAkEC3d
         OzSwv288HV6uAzgdPMcELqIRkCCUcVXV1f++/Zp3ehiXGMjOaihgHDY7uqRjDmXQQ1/C
         Ds7UiBm6hM7ky1pyIiKVvURfrk45SNdQHM99u06hcoEaO9QZ13uIP/XjqoOynelOVhfK
         wC3RaUdE34SCU9/HJqqIqjHmuaCaGkRDe3jJq9vq8EecZaTAUT8vC6HbOaG+cCGkmeZ+
         QV1dlC1OvvhmVjx4ay2tMgVM9klw8NdmsN3nmVLp0eVLGhnKCaK/hdOvu95gexVvOhWo
         w1VA==
X-Forwarded-Encrypted: i=1; AKwUvByzL0X5bF+4eZVRQEb1P4FJC1pCpv1+X67fx+SXkJZPJEYRqKiYqjaeyaDLOl3CeqEXwr1/D5lCvN5PLDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb3IUqvOeQhMjdVBuVNYCOIJOYA1WKafI9TTsM0QHNk1SW++tV
	hqu/ZOX4aL+OOPFp1xSlhzY8836/TdFqvUSyJjCQqiWkzaRBPvQnvoZ7s5y+4B7l4lsU3k0BaTu
	lY/vHuXWH5I2R0mYnnw==
X-Received: from pfbgq43.prod.google.com ([2002:a05:6a00:3beb:b0:8ac:3a52:2231])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9148:b0:3e2:ad7d:382b with SMTP id adf61e73a8af0-3e929019698mr7099554637.83.1793603154652;
 Sun, 01 Nov 2026 23:05:54 -0800 (PST)
Date: Mon,  2 Nov 2026 07:05:52 +0000
In-Reply-To: <c2780bb291244cf32c1dbda63f0dcf594d22da30.camel@sipsolutions.net>
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
 <20261030030715.604215-1-starchang@google.com> <65cf2338-7bb4-3151-f3b1-ef171bb5723b@ssi.bg>
 <c2780bb291244cf32c1dbda63f0dcf594d22da30.camel@sipsolutions.net>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102070552.3516567-1-starchang@google.com>
Subject: Re: [PATCH net v4] net: Fix Hole-196 vulnerability by dropping
 unicast ARP/IP in L2 BMC
From: Star Chang <starchang@google.com>
To: ja@ssi.bg, johannes@sipsolutions.net
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, linux-kernel@vger.kernel.org, wangroger@google.com, 
	starchang@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Julian, Johannes,

Thank you both for the great discussion and perspectives!

Putting the two points together gives a very clear and coherent picture:

1. Julian correctly pointed out the real security risk with Hole-196:
   Attackers can abuse not only unicast ARP replies, but also broadcast GAR=
P
   announcements (sip =3D=3D tip =3D=3D gateway_ip) to poison peer caches i=
n a
   shared-key network.

2. At the same time, as Johannes reminded, Linux already has a dedicated kn=
ob
   for that specific broadcast behavior: `drop_gratuitous_arp`.

Looking at the existing architecture, the two knobs complement each other
naturally:
- `drop_unicast_in_l2_multicast`: strictly enforces the L3/L2 boundary by
  dropping unicast IP and unicast ARP replies (sip !=3D tip) inside L2 BMC.
- `drop_gratuitous_arp`: drops broadcast GARP (sip =3D=3D tip) without tang=
ling
  broadcast filtering logic into the unicast knob.

This means users defending against Hole-196 can achieve complete coverage
by enabling both knobs on the wireless interface, without needing to overlo=
ad
`drop_unicast_in_l2_multicast` or change core neighbor learning behavior.

This also means [PATCH net v5] (which dropped IP changes and strictly filte=
red
non-GARP replies) is architecturally aligned. We can document this dual-kno=
b
recommendation in ip-sysctl.rst so administrators know how to fully secure
shared wireless links.

Julian, Johannes =E2=80=94 what do you think about this unified direction?

Best regards,
Star Chang
