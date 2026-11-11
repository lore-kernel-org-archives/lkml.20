Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438938;
	b=h/+Roe2yZhkZWA/Qcwb6wGlHqp0ooliamWZziaD11FP+DtXnvRqKGlecuZYHmu21quyQ
	 yQLszWauutUXvmKpFcMgvi1P+tQw3uI60KIu6pPN0WrG5208ONGuak1rSeWD+WkY/jbXw
	 dscMOadzfmK7lVmEroxhQmWD3lE57oRrchj3QfCSAFd/HKZilOL1pHL/Y4SsTk2ehKrna
	 zkFaMVHeB39zZPvCwhI5Uv+fkCLWTXEjd1i9bYYVc4ZUn7Ii/hNKc7/5g7S6jn66va2F8
	 TbNuQbAevHVuz3lyfOGL2vNkvKlsT+PY2ViOCi2IqNlICgKw4+CPQ4z9DAlieW1ltFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438938;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Ib3Jyrng3eMRwPlu4vvYbRPIULO3xoAFugNEwMFenwk=;
	b=GjlKGAlJwyJk4USBEzbsgVo7dVupHpvPzwWba6StF4QyTiJ05tQ+3BqIu7AxJyMpByh5
	 F/Ce2imPWb82F4P3u3dJ3UkAdKDg43fqxFRUYGSo1+sovGLfqnvpN4c5ntkn4hpT+B5NA
	 iR8Fk8g+EAwmsTVOs5cL4HhGGsEiPNADiUPmuu5HNCYWzUXed8Y818u6wiM99t4Ghz1JB
	 qN7sb6FcC/BwkpNnlluVZ7cjo6lOnkTXlL8kOGL4L2h6wqKK3WzAIUPrnLke68hG00jL6
	 wFEi3DTWNsl/2Sq1RyZa7Ecdb+BnFWG6wxUMAEK/Lg4aqMlmbO1wl91V/RGzxZr+R2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E75606A885
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E75606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a05b210703so1940845b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794438937; x=1795043737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ib3Jyrng3eMRwPlu4vvYbRPIULO3xoAFugNEwMFenwk=;
        b=U4N4SmMd8G6+0RltOvIGeHJZm89+dirc/kpNT/G33lZru3t+JI5ngr4kn1IMlMVP2P
         7eGksMGGTe+sudCYyhW3AaN5S6/Pudg2LggFmJsQon//Rgkb5bHP9HmucY8yEOEceE6Q
         4+ZJMwi5NrOnGwQWatdabFRjtte4ZMSBs3DHbLOB9W8MtnkSpLJJ2D7/Bh6QnWRozFAh
         A1CiiJWc4cUFjQXUsPr/k8sO7jB8/nJV/XgUsqeeD0YcNeYluXG4X69CdmY6iblJm2Tj
         kri3EdnzQfoER/Aj3U8ajcVxGlMkSRgYOH2XCcxVcjnbo9tvaGXCQ+/SZQ8+Au+uxHuU
         /Ekw==
X-Forwarded-Encrypted: i=1; AL+hErEZCNh+ds45g6M6+rtOXUNK/46DVG46FCKqaAnFg82XnVsnF3cy5/dsocwWQeQIeRhHEgZxkVAIGEZBSWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OZvc8rkW6BQ+Djm4/MDOFfDH09DpzhvjeNnGX1RPv7aHPg1qd
	ShkwgnJEko5YU8DmHpDXlDbF38uCMqvfAVtQsbuWG/jD39XNk5DM+fjwDaVpM0Mp
X-Gm-Gg: AYBFou1Wn0XjrxzZSPptAzEnzTv9VLiWmxkHzLwiX+cPqgjeArHvsUZk2NfxXkyv0Jc
	bq292iOpWheLJ3biE9OnCY75BMNZ7x17KyDjQozAGGp58SUx4o+Btp3aUxCZp2Y8tsBmqcMVEdy
	qW2j/i2MT2OTJwKwYEm0wFrBCXJdryyYW59y3rFqvbsZPeUSVwMD5CHdysM5uqWYipXKGV1l7Pq
	Wp+65TyXRxb6b/teXwPucyAF5A8WiI9iMhVl9EUBTU0KBYR8WJLPAsPAubzgp+IBJQsT2N6LxvN
	JTynVIZN1UR5QfPT3uh2+ctQfxzAbHfI4tz4J9WMCd5lWgGALTzCbRKl2LkupIL3pJsM2WR0KiN
	2VKFJoLNQPh0sObl4HdAs5FVnLLnyPkpx2a07UmPCnNil7YWyOBs3cpvkil41Z4CVey7rCuWhIR
	9AkT2hdVvvyolS2NjxFJS4brxzTtj+dz5SYL3NhEshED+jxvp0wiMUhUNuUtpMy+25OV73VKlwn
	mB3gBCEbixa7OzXfeHV/WesDYYz0LPGbjSPyR77vmPmV+GDxCQpRxaiRTLyR3WqOPeJCH1EU92/
	go+2GvCTbQRDa3eDkcCz20ijo97CwDh6UDT4he4RayUwGptawJsUhTy+P+KCkfPt2Qb5w3NDJtv
	OHh5RvZ+no4gvnIKcXHD79WnBr9YKjULuPug7ykuMWkgP4t35L6w5So8sC90tnw==
X-Received: by 2002:a05:6a21:50f:b0:3d3:af85:eb99 with SMTP id adf61e73a8af0-3f2fcf9caeamr3990840637.27.1794438936812;
        Wed, 11 Nov 2026 15:15:36 -0800 (PST)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3619sm2595365b3a.5.2026.11.11.15.15.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 15:15:35 -0800 (PST)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so5517633c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:15:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEhvmwOcMp98RFTJtTMg+oCrhidgvdwSbHAyVjAp8ypTUB+3A6hkWuOWsKHQXZ5oad5VQ0ZibDRfRqFrqs=@vger.kernel.org
X-Received: by 2002:a05:701b:4301:b0:1b3:ae7e:c1af with SMTP id
 a92af1059eb24-1b3c02fd90bmr3524170c88.14.1794438934098; Wed, 11 Nov 2026
 15:15:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev> <CAOiHx=kTUBtFVgFhNqGhP135CdUmK8imCE_+pdk7qsdZKMqByQ@mail.gmail.com>
In-Reply-To: <CAOiHx=kTUBtFVgFhNqGhP135CdUmK8imCE_+pdk7qsdZKMqByQ@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 11 Nov 2026 18:15:22 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5mZTXQK99jv9-n4cRk1GfQWaJ+SqJWRB9UFuCcjJ_v0g@mail.gmail.com>
X-Gm-Features: AclHuK86_0OUm-XrVyjZYS_UH-BHfAyNuDZEiDXCKmytJxx7toAduKngN_4CdEM
Message-ID: <CAPY4CJ5mZTXQK99jv9-n4cRk1GfQWaJ+SqJWRB9UFuCcjJ_v0g@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonas,

> So on your board only port 5 is wired up, and port 8 is unpopulated
> and no way to make it work?

Yes. The SoC has a single GbE MAC, wired to port 5 over RGMII, and
port 8 is not connected.

> Have you tried a catch-all port 8 egress to port 5 mirror? If that
> happens to work, it should catch any trapped traffic. May not work
> while the port is disabled in software though.

I tried it on the BCM53125 with a host sending test frames into a user
port:

- Standalone port: without a mirror nothing reaches the CPU, not even
  broadcast. With the port 8 egress mirror everything does except
  01:80:c2:00:00:03, but only with Rx/Tx enabled on port 8 and its
  link forced up in the IMP override register. EAPOL sent to the
  host's own MAC does get through.
- Bridged port: the egress mirror does not catch BPDUs, whatever the
  state of port 8. The DA mirror from v1 does. 01:80:c2:00:00:02/03/0d
  don't reach the CPU with either.
- IGMP: with the CPU copy bits from 3362cb822ea7 set by hand, reports
  for a group the bridge has offloaded reach the CPU only with the
  egress mirror. I couldn't test MLD, as the board's kernel has no
  IPv6.
- Both mirrors can run at once. Bridged BPDUs, IGMP reports and
  standalone traffic then reach the CPU, each frame once, and
  forwarding keeps working.

So for v2 I would set up both mirrors, enable port 8 and force its
link, on all dual IMP chips, and refuse tc mirroring with -EOPNOTSUPP.
Does that sound reasonable?

Joseph
