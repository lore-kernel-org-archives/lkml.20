Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE9850AC28
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997428; cv=none; b=EpHo161ZfZFhP49e/Xof7IId1H0TpumLH1/ztENdTPYU0+P2kaFQLd0SHYOFRf6w34YGtJ0oymWml1z7bY5nuG4sN/+gAWRexOAWysta7rbookH45U0ARdJnro+6E7oWiYMjp9j7BL9a4+nnSjNPEduQf7EO/TCkH3yAg4SXQxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997428; c=relaxed/simple;
	bh=iQgKnqdFfC74cuoZof/tmRQHnjNDWB4QnkvrWQ4+DaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNazgsTswMRlY2+jdFHBd2O2FK1SxcmSpLYmEg+mDJfq8P/DswuQCQLRsoX1yhyLMNutNv++inKqfm2o3r7onmaGJ78oeIBFeqs1l3nFtD1Xiw7dWSDhZj6DKhdKzubYeVhgjFpNCUbnKbXaiUkhqH7F7zRGL6Kky05CIypdd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ryq+2TuC; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ryq+2TuC"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso633035a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997426; x=1789602226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k+ujgBnpldppc1WGTJUZWawg3lev00ws7zgSWhD2ufM=;
        b=Ryq+2TuCP78E7C5M+is/maleyI+R/4UCzEIoYV1EUCqTjxHm7mN/9hYS15hBaK25UP
         8CIMlD7GkZQo9HHu0/pnxywGSlMIoAfEsVpdiEO5/8UiNsn201GNPihJe1n8dMpXhq0z
         vaYtQoibQRwskUqhs5XzULBnzaMchpJpm03pNYIKf4lCpgUPPGwWASHmScuOb+Tqbevo
         M/Y84cZCLe8qIrjZqWnG8dxfFYr+hFFxWMGvU6b3o+q1uHxBEQWe0oKYcVoASOsWYFUa
         VdSljJ+9WiYwWrpaml+nFMm2kQIDNuSBnsm5OqNmDrYyl1L2trfv4Rz1pLz5bQBjY3iv
         7HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997426; x=1789602226;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+ujgBnpldppc1WGTJUZWawg3lev00ws7zgSWhD2ufM=;
        b=kE+WHF2amYEjE6/oMV/bNAf64mAhz8nYgPbQxOxINwoNl2438ELO2vGou/ChTq/eov
         HPAAP8qqW231hIQ95OQ9TUdvYH8j4MZiPkyBk39nWAz7g+J4IvULSz1Nvc9w6T6b83T5
         SQOoffaVC1gVzXJ7ZMzFaPXuJfsN27PL2MkrOFQU8YQMlbUtqtd0NHSGM+l3RDRdA8mu
         B0AuinGDyR+Tgzpo7X80XglwYlEWXWf0U+rfDYGPMj5R19OH+R4v/n3Zpy0AelVqJznQ
         VUFi9mNsA4F9HsCeDOGuNtatVZBQ5hYNLS/VIolfCjhme2uF6WzOMIoj/OLEPbz6erUl
         yFsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5b9YvbIZ4BL2+RxrBwtQZhVsqBDhfMdwpnTlJynmQiLnuLO5IpRxgVKPhefuoxb/jCjnVynleLsR8wmU=@vger.kernel.org
X-Gm-Message-State: AFuF++l/aZZAWX9/hzfEmS2fmBgOAxtO3lwHfDFsX1DQ7c7acn4zNo1c
	FJUuvdOKS5dQUf3oYy5hiiEcC3tr7683a+XkwgJTPO4KK1EdcGlly/9j
X-Gm-Gg: AYBFou10phqBL0V6fo/xWKNeJDFozRmo7TxwimAFCoCdF+QFJNBhDQqKWNqAsvMozRh
	eDAVmDNGuaoRn7+lD/8YXaYW6XRkdtIqasFvbpwV0pxZgvE0vdkRGmT6mCsCFG4w+Du1AtioS/b
	hIdJP/2WsNS5eRtrDyzJIe1HhYdKTIakh6dRABznyGyU5sOOcwH1j7bLdIRYjvbe5zRxCUNnxqR
	w91IcxpHOcghWhPRFowwollZXEthKGzahkhIHQjcWwKuULrJPOo9lsuaHZl7E/w19bQbU1WP7Kq
	uxchfaDOGIRFd7Y0w27s90vMDVVyYyrDouwkcD0V0T+WTPU8ldj3PPA6ZcnyZZnbnlaF24NANko
	JZaWRr94SB+Yw3vQ0cezuj5NB2cAIm5cBBJrYcSqQVmXYSSlkjJ1/gFhhOLir8lg6yTVzQEAT12
	QL+fT4VaV9SyOuBWeyHoEWw3tQnp8/PvlgwDy9eoc/Xvw/AOE8nhh8aTfK/wWm75g3Z+6RFGc1C
	mc=
X-Received: by 2002:a17:90b:3fc3:b0:39a:e002:f192 with SMTP id 98e67ed59e1d1-39d70b57638mr5363794a91.22.1788997425904;
        Wed, 09 Sep 2026 16:43:45 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cd20c2f75sm1832150a91.2.2026.09.09.16.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:43:45 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] seg6: reallocate the skb head on L2 encapsulation only when needed
Date: Thu, 10 Sep 2026 08:43:33 +0900
Message-ID: <20260910084328.32338-1-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <178885587111.219967.14896644410984520593@kernel.org>
References: <20260903-seg6-l2cow-v2-1-f37b3b35416f@gmail.com> <178885587111.219967.14896644410984520593@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Tue, Sep 8, 2026 at 5:24 PM netdev-bot+sashiko@kernel.org wrote:
> Can that wrap to roughly 65534 and make the following
>
> 	memmove(skb_mac_header(skb), old_mac, skb->mac_len);
>
> write skb->mac_len bytes about 64 KB past skb->head?

Yes.  Forwarding plain ping6 traffic through a VLAN device with
reorder_hdr off on ingress reproduces it: skb->mac_header comes back as
65534 on a 704-byte head, and skb_mac_header_rebuild() writes 26 bytes
there.

> A similarly shaped window existed before this change, since the
> skb_cow_head() inside __seg6_do_srh_encap() never accounted for mac_len
> either.  Given that this patch takes over sizing the whole encapsulation
> up front, would it make sense to fix the amount here?

The window is not specific to the L2 modes, so I would rather fix it in
__seg6_do_srh_encap() and seg6_do_srh_encap_red() themselves.  Mode
encap reproduces it too, on unpatched net-next.  40475b63761a ("net:
ipv6: seg6_iptunnel: mitigate 2-realloc issue") replaced skb->mac_len
with dst_dev_overhead() in those two skb_cow_head() requests, and
dst_dev_overhead() is the smaller of the two whenever mac_len exceeds
LL_RESERVED_SPACE() of the egress device.  Asking for the larger of them
restores the guarantee without giving up the one 40475b63761a added.

I will send that against net, separately from this patch.

> This isn't a bug, but does this trailer match the form documented in
> Documentation/process/coding-assistants.rst?

No, it does not.  I will use "Assisted-by: LLM" from now on.
