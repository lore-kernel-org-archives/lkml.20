Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863485;
	b=O3w20gVRRgzv1hU68N8YAzGik4hssGLi4njN3AdNxSIrDqgtAh3yxwpnIhgWOHSnUdD9
	 FFfs6ODUjgl6VgAX8grQBeELIa68hzI5L5xKUOuENCN0sx6XLbw5CV4uzcA2T0KZY5xs3
	 iMcfLOuld3QNaB9+kw52dmYN5HsrsKL2zgVL2jQCl262Zp6NF96qR6JBZUGPB3mKvQ0Mf
	 Grlk7aHRI2FZkULzMj0qHWa1VSSEFAsPSLSRQyaWGg8gBWEbZKWpGSrLVy8Lqn9kzqb2v
	 HTXBxcg42VFk7x7yrPHSa6658sffUjxLNMifctiEcYS/WfEGB5OE+uwt8qXK4tJzdxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer;
	bh=XFbDtNIiaC/OXFmr/Fpt3xn45L8867qAOx/j2uPNnQ8=;
	b=w/rLukT9x6WAe02Xp5uR7kqAHddnDgj74nA0y9UbL5SXpD8xYtgW3sAiUEbUHn3y7+F0
	 VXM+sIRCePQfD/IjEhy/6ntCrCWr/pzNNxNftwhzJt+Yvum5EJgyXc5h+/bTGUlkh3pSZ
	 JO6b5xLLWS2BBHezO11uTS+Ifdk9XqCBmWXXHjPxqcXGa1Ysttp5AU5A1S0gBZoL/ShT/
	 LGXOioqwMZDfCbpWGKnY4jLvHaRrSInBkNN/YiN3iOM9O0pLWNog6I0Vzxy7D6Et5VU4z
	 TgqKrViK+TE9HgRsOUnKHj+HDb8OEz7fIumn3lDSvvvlVXd6krGQwRLnQQBhBHGjClg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PigPVu5a;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124B606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6124B606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PigPVu5a
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4bc5b8de5so2179927b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863483; x=1795468283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XFbDtNIiaC/OXFmr/Fpt3xn45L8867qAOx/j2uPNnQ8=;
        b=PigPVu5aOc0n7Sv0nAPubwWtrN3nEMv4bGM3O7JmsfN6q+4sozX7dzSzj99bFvmGxD
         cHctb0oUXag7OpeKEC/7qatGQim0kLxE9h33RRpX6j37O9Fim5Obiq6VZm24JokAIqFo
         mPKbx+ZDigRey8E2q99ryw6wJZi6PVwbusa4PVrORHxto71LQtFk0TvfYLYaGTVOAarm
         9wEi9vMKHr/I/tRUYhXgj4Pe+i4cWflKgx/WPGINQ70CURbBhZ1CZQzd+4Gzzm8uyQKN
         own4OB4OJ37ZlQO/7jH9oIVlGFaxMgtq9RErNfLFcqsmz3Sc1QYzjuB5RzdUJmPASbXg
         Ku3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863483; x=1795468283;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFbDtNIiaC/OXFmr/Fpt3xn45L8867qAOx/j2uPNnQ8=;
        b=IZAy2CbkxndR0BA1POnbt3NnbyzwA06J/yHi1kCG4H8nTtwlvSwcgKiMC9/i/X+N5z
         rMznQgutpGX7H4YESpyIUiVupe+d5OAQblV78Gz9SRR4fH2f854tEsMPsFKRLymoWsTs
         9wAbx1gwOSvZl+/hIKhxA0odggkDFFgI84gTx9Zp760dGlMo/WRIq2r9dXA/GBd382cB
         IsSowBrniMUAjf451cPSPHcReYHxn8qcGmJxKOTWS4bUh2NktxGhHSbfKzCdbFhbKlW/
         oHIShxTU6MOoZFa2niiv+X61MwarHpWeM0J7UIQyvULnEM0UNaHDEpmNWHtH/C3lGmbd
         UTwA==
X-Gm-Message-State: APuU4Z+0OJfbjo9UaUvCofdlOWh81aGRdsnSpP3PFjPKCZ/5xPdb93m3
	lAq2FWpZaN9d+SkJQCkWKtQzLCuD51MIbshQaETD+3+Rb/FxnYCgwZ3O
X-Gm-Gg: AZFdTZcRLoR8i8CekxCf0H/KgmrkmrmDkQ01Sqj7wlajqVpL0vE2keVtkfbrlwJEUdI
	AJhICOLeO8o5TU/eRcIXzQlLLRN84NFs1jjzD4cm/vhp5gBW6kKovpyjOomGEcHi9o3+Yr5sV3J
	Nvi/LFtCbftpkghH73ooi1dOexMT3Qu9v7NWk90Ip23bm2CnUPpyQ3q99l5KxsNsQQEunxbw916
	BKdxz+V7xZkWqSzmzcoblbgoplp4uJiqvqtxy9WSnr3PFrlo7mh14qpSEk6zd6YmsZGlyIQ8ePT
	A0iZC685nsWa/A8W2lqcmu1pTRHrRv/Y+Y1sA58HiamIfXovPdmvV99eMcgRUEFDFH0eOGodv2b
	GiWgTbuD8mvZeaj8JpTLA1aWN/bZE9FuBtwMmkhG07f4qDIQGJus90y93Krtk7WMnGq9Bp9KRnr
	o6QUOz4YnVIVVyrB8h5mKlZRPAeY9OB04BIeqR5q77d5g8w9hbIXaUPKI93AzzoNRYCHzdIG6MR
	kLS9t5SH0+rHr6Lpxnym9Rfciu8+9NOUgKuxR7fcfe1FHJuupthi7LI/AP4d3arnCXVc0BL7bHL
	HW4dz17KB9VUUx4p6YtFx/1JhAU=
X-Received: by 2002:a05:690c:60c3:b0:8b3:4dd:5fb5 with SMTP id 00721157ae682-8b4ee348741mr4236997b3.27.1794863483507;
        Mon, 16 Nov 2026 13:11:23 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:41::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ed01d566sm7567077b3.38.2026.11.16.13.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:22 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/4] eth: mpnic: L2 address filtering
Date: Mon, 16 Nov 2026 13:11:18 -0800
Message-Id: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAHZx+2oC/x3MQQqEMAxA0atI1gZMwGH0KuJC2zgT0FTaIoJ4d
 4vLt/j/giRRJUFfXRDl0KTBCqiuwP0n+wmqLwZu+ENEjNtu6nBlDCEjT/RtnW+XbvZQkj3Koue
 7G8Ako8mZYbzvB69RCfFoAAAA
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

The mpnic device has a TCAM that is keyed on DMAC addresses in the Rx
path. Up to this point, the TCAM was unprogrammed, and the default
action was set to pass all traffic to the host. This series programs the
TCAM to filter Rx packets based on DMAC address.

The device, broadcast, sencondary unicast and multicast addresses are
added to the DMAC filter. Promiscuous and all-multicast modes are also
supported by reserving the last entry in the TCAM for inexact matches.

The overall design is similar to fbnic. For each entry in the TCAM, the
driver tracks the lookup key, mask, state, and users of the entry.
Addresses are synced to HW in the ndo_open path, and unsynced in the
ndo_stop path. ndo_set_rx_mode_async and ndo_set_mac_address are
implemented, so the filtered addresses and promiscuity modes can be
updated.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (4):
      eth: mpnic: add filters for dev_addr and broadcast address
      eth: mpnic: add promiscuous and all-multicast filters
      eth: mpnic: sync unicast and multicast address lists
      eth: mpnic: support changing the MAC address

 drivers/net/ethernet/meta/mpnic/Makefile       |   1 +
 drivers/net/ethernet/meta/mpnic/mpnic.h        |   3 +
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  10 ++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  15 ++-
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 116 ++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.c    | 129 +++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.h    |  51 ++++++++++
 7 files changed, 321 insertions(+), 4 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
change-id: 20261112-mpnic-l2-oot-2a185cd5f9bd

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

