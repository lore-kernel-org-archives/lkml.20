Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964634;
	b=yfJgd0MHRUj8WzJkbC9byusR0eDVFpZOo9ZYgUOEDeBgNzA9ovp1/SNO4JXe9bD+/a29
	 efbku4BrL4xck2ymDBC/iR1kNzhb3G/wQDZGH2OEpk2UJlML/nL1y4tvRLTN3+deDAriK
	 aHgFx0D2utyaLeuTMoSqSZc9csMCPDYJ/aJKxQpPdup1GwgVr3NLL47NW3piCh+A0sWer
	 LRZB1AZ+aj0F50NTwiD2MBzCdpfxXbplOxwDBqQJsyaZdmTD8b1eeWXcQOGKvOzvC2x7o
	 Wlwtj4UfoBPfzgmByRZTgw99kwmbV3W1KBOCdJNHwmSm9BFwlPfCENDkopN8DrXUPkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=KN9/ub/FctDy2gJbqeBK1tq1ZA+4dJOgZ+Bt8XtgxKo=;
	b=K+brpO8N+a2I9txQ+vdxPqCIiNAXzU07EzJkLZi9NAioykFfLK4gko1rPDHdyRTzqOJf
	 6Yoc1tC2IN4NIRxobnF/6T/lyZA9zxMNyMysXzenYnMrWTF5KY9y7wl1rQLjMawUX6KAI
	 ohjwhJ1pwGRiY7n4/KnFzb4pMIe3otKzhAXhQghSuuSBbHYCSEZ5zA9KAoqScEHQu4KQq
	 biDI3Nt5L5AhSjWAmt72tnO/OfUWOvDsGSg9z9kXjinN83hXFaJTkxXn60HVp3yTxsc5v
	 Ye1ez7/NwUb2HnDN2z610F7jYAiv2HFsQhLHMafGQ5dicGffyyAu1wvPpzjIt/Qhjjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qznd+T2f;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754876082BCB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754876082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qznd+T2f
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so598921d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964633; x=1794569433; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KN9/ub/FctDy2gJbqeBK1tq1ZA+4dJOgZ+Bt8XtgxKo=;
        b=qznd+T2fMgYM6P0YG6K8I4IBFIbJQagR2enWIAqirBA/y6zx0W1O5x1SiddBQsCgiW
         vZmujEcZx1Yd6CMzPwFDb93J6nvR16hmXYXBHEkJhAxz88YpDuowUO/PdEiEj3G0OxO9
         Uf1t0lkcmbIvpsAhpI9ds8eIbITLOFcmInDLty+rt40xtYOOZlekp96poSQANARodzLm
         n+/95xaZmPRaTAxerjr6hHBBVKPx1aqejUGIsi2p3SEmjwA2R1vd6X/kHYeUVk556J0i
         SbhrQzwA5Lc8ROuotwRKVc81RDUvRzVKGxLP961pf0/hZEy7LI8mlvaCPIh37SCW9GFF
         Do9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964633; x=1794569433;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KN9/ub/FctDy2gJbqeBK1tq1ZA+4dJOgZ+Bt8XtgxKo=;
        b=qwYpdJKYw+z4wiuPb/LSrnjFhPzOTAtZjR2nwiZ/jkOhYl9sqjbnN84Yw/cSAlI2BX
         6xrgOM4vE5t5gR12k7zKkdLVwQ5noKwVXyHs4wjAmwpmLEi1hGqZib0rQFkyw2zKG2us
         0igg+uHmA0PPR0U4cz6z3kHTP0WKgVp3ppydAmYFQCHluDgEm9s5F9yC5iB8rPz9plK/
         jT4FMwqEmhc5VZSJydjGOll82dB4q59B1ux6H8ycTh4a6BXYaWhyFZpy0yziqu53mvKm
         +k7yk1/igZz0o48ncCgZaU7RFFPA7yNXp0mLSzNgULlI3fum9fJN9TYlRZ3ueuedKGsD
         5emA==
X-Forwarded-Encrypted: i=1; AL+hErF/j6tWhWcjtJicMnoRfx/vTuDGYeTHfSgVwXHn/DjisGXbcOgYF4LfrIklQYo2a0NLAqH2iuI9TQvBgnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z6ymmQm9UWdA8S3+KexgAcL2fEfl39wo1Uh+JI037g3j6d6nI
	V2s29pzgtWneCielI/GiB4mAu7uHvL5PMZw8tKi+XlQN5zk56B+7eil0
X-Gm-Gg: AYBFou0fGDWm9VQHpjS3qyxQO0jdXl5gsAexQbvsOC0rBVyns1Oum3ZbT3iNwl1TCBD
	rtUtHChS2tSJr7LTVidKi75SeMKD9Sv2iTbRZQUsupSOSMOxSBYKKRraNNKlog8c11dOr5a9qRA
	PJkXSATLu9/1mVCkbrrXNy1/dvdx9il7ekNO+D99tS6S4J4g83bFx+E38Qfy3i4n+QFrCaZgv4K
	ID7JSi5QmQlVTNk4yRS381jzHQUTGCndk46Jgn6Y0JkvUg0o+Vrn4m2X8kceLWeWTA0FCr+Unh2
	a6i7v6sw6VHAfCFOhCKfotWDLhQEXwzz+sRhTFsrn4mVCyNixs04s2t6+1HGCCoFc2onsz9EYq+
	kn5fpx9hlp7n3zjc6PzZLa2/53sGgRoVg5mxTyEzX5MdF3MGNa2FF4Iqs6IsHLPriyxwhwpmpKL
	HTd13ulYUG6zY9CZZXuj14Eo+dCLPpvtWc9TVytBaDxUYWpa2ERHFLslX6CALXDSDUVq4yao+XZ
	CKxj0YStjOIt4cyBkdUAPAT6d8lEAwSAxq6mxKsZUFapd8nRY0tRquEIMUIsePimgohNevhR+ts
	zD4tEbVURS7mvuPRmdkvwXdJuQ==
X-Received: by 2002:a05:690e:1186:b0:67a:2ca2:8a39 with SMTP id 956f58d0204a3-67c14073c55mr1001612d50.3.1793964633238;
        Fri, 06 Nov 2026 03:30:33 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c131664c4sm1764604d50.0.2026.11.06.03.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:32 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/6] eth: mpnic: checksum and segmentation
 offloads
Date: Fri, 06 Nov 2026 03:30:04 -0800
Message-Id: <20261106-mpnic-lso-v1-0-e943ff1493e4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADy67WoC/x3M2wpAQBRG4VfRvrbLjEN4Fblw+LGLTTOSknc3u
 fxqtR7ycAJPdfSQwyVedg0wcUTD0ukMljGYbGILYxLL26Ey8Op3NlWHPi2RF1lJoT8cJrn/V0O
 KkxX3Se37fnwsQKRlAAAA
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Add checksum and segmentation offload support. Tx checksum offload
follows the generic csum_start/csum_offset model. Rx checksum also
follows the normal unnecessary/complete model. The device can validate l4
checksums for tcp or udp, when the l3 type is one of: ipv4, ipv6,
ipv4-in-ipv6, or ipv6-in-ipv6. The full l2 checksum of a frame is always
passed to driver via a Rx completion descriptor field, which can be used
for checksum complete on other packet types.

Tx segmentation supports tcp or udp in ipv4, ipv6, 4-in-6, or 6-in-6
natively, and can support most other tunnels with GSO_PARTIAL.

Counters for CSO/LSO are exported via the netdev qstats API.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (6):
      eth: mpnic: Tx checksum offload
      eth: mpnic: Rx checksum offload
      eth: mpnic: TCP segmentation offload
      eth: mpnic: UDP segmentation offload
      eth: mpnic: IPv4 and IPv6 in IPv6 tunnel segmentation
      eth: mpnic: add GSO_PARTIAL for other tunnels

 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  41 +++++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  14 ++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  43 ++++-
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.h |   6 +
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 235 ++++++++++++++++++++++++-
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |   9 +
 6 files changed, 346 insertions(+), 2 deletions(-)
---
base-commit: 6584acd42820478910a771efb28a355a707e9cb0
change-id: 20261102-mpnic-lso-19aeb38e5648

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

